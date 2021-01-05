Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF62B2EA461
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 05:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB65289EEB;
	Tue,  5 Jan 2021 04:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAA289EEB;
 Tue,  5 Jan 2021 04:21:01 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id l11so69696502lfg.0;
 Mon, 04 Jan 2021 20:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=B860AzMgXAcQbUHUbf70b4l/yONB7SP9ETLhkVV/9Kk=;
 b=BxxVRr19Y61/q1MfIVDbAfOD6Pn7m0N6NtJ9x15u+M5dbVYh+nUQHUAltWjM+CcrGe
 CPn/enMEeNIBifLYHbdghhPIQc3SwYr8bzoKzcwfuNlB5Sj7TrQYZsUlnizdJYLRzfq3
 nYZtFMGTwRt8NQuTqdQY4EGPeTmeNYsviJQUUGlrtNKrs+2lh58/vI4xZSJYEmeot5Ed
 3oCmivykUP/e07hDTMa9Z+eUqR26g7BUpLAbSYGcYW3Hv+ARUFxy5JRf7Qx0xClnlY7X
 4jR9uVJ1/OPguNONAPZwQqXpYtn9p58brYD2wMatJjug9tf+7NWvdFdZTTDfhsyXkif8
 rNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=B860AzMgXAcQbUHUbf70b4l/yONB7SP9ETLhkVV/9Kk=;
 b=YW2erTJVDRjFhWwVbLZ4nEdMja4CG9SuKI6XxqycckcQuVe+/fGhqZt+Foc3IoT6q0
 +oonMSMw0a8pIfZzX6/3jpG7uPXTfQE+0iEsDW1uQgKOcflMAeyHcfIg7QAKGkQfg7Lv
 Gth+WabCGLFGMPP7ah9nMLVjVPHGidXgY0FZGa41rUj93qC9gPgps1hEEoeaqsYVtJk0
 twt5o/T9aUtS9MKg2xWV5GtVfJGAe5r9MxJMD9AZWdq8qgkhE4Id/MrGTpDJ+Goqq3XT
 XwPLV9V3J5h9oLOS+CoObEn5gscYl+7KWkKqeb5gs/GPdYYXheHPgN0msNICKdKjRUIf
 j04Q==
X-Gm-Message-State: AOAM532VX38yqWuzQlUSf4Q1sg4DBkmmvWMV0YTYy6Dv7qsLXEs1hAg2
 n51rt5MV4OLMM9Zd+44dhifX5PsogZLCsW+BRQ0=
X-Google-Smtp-Source: ABdhPJzMBRIdRVxImI6rx5wCsTNCMgLaUWmYMSy2IefUCusnR45rYsdiTbOJKcHaQhm8DaDXvSHnmqk+7LFyEsc3XXo=
X-Received: by 2002:a2e:8156:: with SMTP id t22mr35076797ljg.263.1609820460360; 
 Mon, 04 Jan 2021 20:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20210103035605.23973-1-tiny.windzz@gmail.com>
In-Reply-To: <20210103035605.23973-1-tiny.windzz@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 5 Jan 2021 13:20:24 +0900
Message-ID: <CAGTfZH1eE_a-qvOb+GDRogipNS1c+K48JL6pYQ3UovpQR9zUbA@mail.gmail.com>
Subject: Re: [PATCH 29/31] PM / devfreq: imx-bus: convert to use devm_pm_opp_*
 API
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
>  drivers/devfreq/imx-bus.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index 4f38455ad742..ff26ef049b1b 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -61,7 +61,6 @@ static void imx_bus_exit(struct device *dev)
>  {
>         struct imx_bus *priv = dev_get_drvdata(dev);
>
> -       dev_pm_opp_of_remove_table(dev);
>         platform_device_unregister(priv->icc_pdev);
>  }
>
> @@ -123,7 +122,7 @@ static int imx_bus_probe(struct platform_device *pdev)
>         }
>         platform_set_drvdata(pdev, priv);
>
> -       ret = dev_pm_opp_of_add_table(dev);
> +       ret = devm_pm_opp_of_add_table(dev);
>         if (ret < 0) {
>                 dev_err(dev, "failed to get OPP table\n");
>                 return ret;
> @@ -141,18 +140,11 @@ static int imx_bus_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->devfreq)) {
>                 ret = PTR_ERR(priv->devfreq);
>                 dev_err(dev, "failed to add devfreq device: %d\n", ret);
> -               goto err;
> +               return ret;
>         }
>
> -       ret = imx_bus_init_icc(dev);
> -       if (ret)
> -               goto err;
> -
> -       return 0;
> +       return imx_bus_init_icc(dev);

Remove the unneeded blank line under '.return imx_bus_init_icc(dev);".

> -err:
> -       dev_pm_opp_of_remove_table(dev);
> -       return ret;
>  }
>
>  static const struct of_device_id imx_bus_of_match[] = {
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
