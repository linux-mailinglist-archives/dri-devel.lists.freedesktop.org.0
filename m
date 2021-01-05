Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C4C2EA449
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 05:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05DB89F43;
	Tue,  5 Jan 2021 04:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEAA89F3C;
 Tue,  5 Jan 2021 04:14:13 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h205so69578599lfd.5;
 Mon, 04 Jan 2021 20:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=7CEt7ox6RQz0kN+jN2Je6Gp8EPaWa97ojAZRj8xL6is=;
 b=L7UKc00npJs0IL02JDUDBurCBSgNMJ7czHbDQgVayzM6dCGWR7CEIoKIvy7+aK5on3
 0S5EDXpjvshfBoDjf44q+N+FBx91jkWnAA2dAdz5MQa3eaur4d11dGyvwaqvj0y7Lkby
 iOKBe85CZLFKx/RMjzQtS+d8/UjrMtIq1ToJ55lauroSXo0eBy6wpK9CMYHEKlqJVr3A
 EhFPEGkCVAkZ4hASfjxvhOKIu7pXSrTYfDxacg3xbr3VAFBLHSafSfvYFCjvANM6suJx
 8eL+J6xu7XU6FMQHLnE/jqobXnnkXyeNxOHQ73VJ6yM9pVWLXxYYRYxOJPwHTXeaz+9Q
 s6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=7CEt7ox6RQz0kN+jN2Je6Gp8EPaWa97ojAZRj8xL6is=;
 b=hTyRWKJuCmgH/7JdmExbt78iq3nRA7WXWgkfsvrgEMLWuBqLcfpUrWtVNH00owZlzL
 dsaxxuYSkycqib8I+nOYTXgMKadUcmhDT/Eg0qBrfFaLk86NXG6jvGfKoeWaf1gDY+73
 1VqJFQM0rMzIcEqM/qxuurGauCw/kBc9gnge77J3mgo54rEPa3B5t6BDnvfnDVvScjIo
 aCdvTaoQg0BvQdERjTLvvpRXDHy1+a83W8Lx35dyoBhHfBmvdyz46TmgwurKyqDH1MPs
 2b6cqzKqWvjgRVmwIdMxog0vGugLD76g2szkIn/6C+OlwgoG46X8ROZ+9zp7FoQkTfqU
 tbNw==
X-Gm-Message-State: AOAM531olVzmEvhkXIXeW/6fdaeRb7nXXmRS5wn3xIERHG2esDSKoqW9
 OOxX0bRDozpkT2E+R6MFjy/yvYdsDgHAkoGX5zo=
X-Google-Smtp-Source: ABdhPJz51qUgiiepOCOol+C1B9t+K4pzzTb6+kK694uGFC+1BDUaJDKdOlg7C3DMIRWrphTAbkwCZRa1MhY1aPNnUro=
X-Received: by 2002:a2e:b4a7:: with SMTP id q7mr29801680ljm.391.1609820052120; 
 Mon, 04 Jan 2021 20:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20210103035540.23886-1-tiny.windzz@gmail.com>
In-Reply-To: <20210103035540.23886-1-tiny.windzz@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 5 Jan 2021 13:13:35 +0900
Message-ID: <CAGTfZH37=e4RgdR4xg-3s9-pRjqunHi2jfPQqQgVWkxW94GwOA@mail.gmail.com>
Subject: Re: [PATCH 28/31] PM / devfreq: imx8m-ddrc: convert to use
 devm_pm_opp_* API
To: Yangtao Li <tiny.windzz@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: cwchoi00@gmail.com
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 gustavoars@kernel.org, jirislaby@kernel.org, David Airlie <airlied@linux.ie>,
 linux-mmc@vger.kernel.org, stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, natechancellor@gmail.com,
 Thierry Reding <thierry.reding@gmail.com>, tongtiangen@huawei.com,
 Guenter Roeck <groeck@chromium.org>, marijn.suijten@somainline.org,
 Dmitry Osipenko <digetx@gmail.com>, steven.price@arm.com,
 Matthias Kaehlcke <mka@chromium.org>, chandanu@codeaurora.org,
 emil.velikov@collabora.com,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, jonathan@marek.ca,
 harigovi@codeaurora.org, adrian.hunter@intel.com,
 Viresh Kumar <vireshk@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, dl-linux-imx <linux-imx@nxp.com>,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org, mchehab@kernel.org,
 sean@poorly.run, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, akashast@codeaurora.org,
 rnayak@codeaurora.org, parashar@codeaurora.org, tomeu.vizoso@collabora.com,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, agross@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, Shawn Guo <shawnguo@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 3, 2021 at 12:58 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_pm_opp_* API to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/imx8m-ddrc.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index bc82d3653bff..9383d6e5538b 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -370,11 +370,6 @@ static int imx8m_ddrc_check_opps(struct device *dev)
>         return 0;
>  }
>
> -static void imx8m_ddrc_exit(struct device *dev)
> -{
> -       dev_pm_opp_of_remove_table(dev);
> -}
> -
>  static int imx8m_ddrc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -419,7 +414,7 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       ret = dev_pm_opp_of_add_table(dev);
> +       ret = devm_pm_opp_of_add_table(dev);
>         if (ret < 0) {
>                 dev_err(dev, "failed to get OPP table\n");
>                 return ret;
> @@ -427,12 +422,11 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
>
>         ret = imx8m_ddrc_check_opps(dev);
>         if (ret < 0)
> -               goto err;
> +               return ret;
>
>         priv->profile.polling_ms = 1000;
>         priv->profile.target = imx8m_ddrc_target;
>         priv->profile.get_dev_status = imx8m_ddrc_get_dev_status;
> -       priv->profile.exit = imx8m_ddrc_exit;
>         priv->profile.get_cur_freq = imx8m_ddrc_get_cur_freq;
>         priv->profile.initial_freq = clk_get_rate(priv->dram_core);
>
> @@ -441,13 +435,8 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->devfreq)) {
>                 ret = PTR_ERR(priv->devfreq);
>                 dev_err(dev, "failed to add devfreq device: %d\n", ret);
> -               goto err;
>         }
>
> -       return 0;
> -
> -err:
> -       dev_pm_opp_of_remove_table(dev);
>         return ret;

devm_devfreq_add_device() doesn't return any integer value.
Even if devm_devfreq_add_device() returns the right devfreq instance,
the 'ret' value  is not the return value of  devm_devfreq_add_device().

On this patch, 'ret' value of 'return ret' is from imx8m_ddrc_check_opps().
Surely, it is well working with this modification. But, it is not code
for exception handling.
So, we need to remain the following codes:

    return 0;
err:
    return ret;

>  }
>
> --
> 2.25.1
>


-- 
Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
