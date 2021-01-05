Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CC2EA4EA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 06:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA3089E47;
	Tue,  5 Jan 2021 05:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6CF89E47;
 Tue,  5 Jan 2021 05:37:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m25so69834899lfc.11;
 Mon, 04 Jan 2021 21:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=BJ/BPOn4zLwcKVC4z1IVu61Cm54JUVzrqo0fobfeksQ=;
 b=M2Es2CYFztXBLoaAP1ExQ7Vg6pKuoSXUrIU64+JTXYurORjVHO4RUkWy9a4XEoyOmG
 p+VIGZyFQ/Ing35CuPyPBd6B4LN5jbTFWoeaA6uNlz16qXwUa5QLGdINIx92MIRiXt7L
 Zr2800UU5QComKFAIo/5zErU+/CEX/4DxD1wTH9rYHenrgCp8KW1mnHqhljdneV9CceE
 iqZGVqZc1D9tzQGGs54/GpfLBIPz2RVk4vGUsoB8JaGKT8svSxHoGEdC1W3xaidDname
 k13zeTaPJz88q5qUalH7p2qGQftucEcvNP+dpZhBsrFsu193HiFOUS2RkJzRrsvQmy5X
 /6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=BJ/BPOn4zLwcKVC4z1IVu61Cm54JUVzrqo0fobfeksQ=;
 b=iJryQniGAJ/bIKIzi9bVvoD/sWPgWDjWNpZ5oSNX1+EqO9cQOu83XCt8GpHDufhjyu
 bWC1umZrhlh20Z5vETU1pVAX50HEj2r1u1Hmukd7kToN8ALnkvgOiLVhsMi/hNz59bqj
 JwpWB8c3dFqXiz6rq9lgHczj/JbFMfd1Tq7Ryzpf1+7GTKVhXTDAc4AMVi7vzFpD9dK0
 S+o4gqkbxeicu1nUI1z8Py33OFOBaDTjGAD5es759H96BXTboKdxGPzPdVceF6ysVD96
 HBstii0mCmxE18SEUtrSPYgCKd57dXuvTJY+cGHPNLnsP9LTG0K0vZF6MdYgeJ3uggK1
 Se7g==
X-Gm-Message-State: AOAM531hC15Y8xAP0vJMxZyiGkg8wVyfsIDXo+SPf9dtfrM1As0yssM0
 6N3UmpNkxOfiRGOFE5i++X3iYq4JyVRigk6/hwg=
X-Google-Smtp-Source: ABdhPJxBh2b69EQE0oS8msD6rntMrwUkYVv9SESod0vmy4ovFZpV4FPqGzA4LTLOdctSMhxU1bPsvxj13MHhmKM2D30=
X-Received: by 2002:a05:6512:2e9:: with SMTP id
 m9mr32046955lfq.118.1609825041442; 
 Mon, 04 Jan 2021 21:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20210103035706.24168-1-tiny.windzz@gmail.com>
In-Reply-To: <20210103035706.24168-1-tiny.windzz@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 5 Jan 2021 14:36:44 +0900
Message-ID: <CAGTfZH0s0iiR1jaebU8KyJ7mdvZMOUQXfmuxGh0PJ_v0diXtfA@mail.gmail.com>
Subject: Re: [PATCH 31/31] PM / devfreq: convert to
 devm_pm_opp_register_notifier and remove unused API
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

On Sun, Jan 3, 2021 at 12:59 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
>  Use devm_pm_opp_* API to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/devfreq.c | 66 +--------------------------------------
>  include/linux/devfreq.h   | 23 --------------
>  2 files changed, 1 insertion(+), 88 deletions(-)
>
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 6aa10de792b3..f593f30529ec 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -2004,40 +2004,6 @@ struct dev_pm_opp *devfreq_recommended_opp(struct device *dev,
>  }
>  EXPORT_SYMBOL(devfreq_recommended_opp);
>
> -/**
> - * devfreq_register_opp_notifier() - Helper function to get devfreq notified
> - *                                  for any changes in the OPP availability
> - *                                  changes
> - * @dev:       The devfreq user device. (parent of devfreq)
> - * @devfreq:   The devfreq object.
> - */
> -int devfreq_register_opp_notifier(struct device *dev, struct devfreq *devfreq)
> -{
> -       return dev_pm_opp_register_notifier(dev, &devfreq->nb);
> -}
> -EXPORT_SYMBOL(devfreq_register_opp_notifier);
> -
> -/**
> - * devfreq_unregister_opp_notifier() - Helper function to stop getting devfreq
> - *                                    notified for any changes in the OPP
> - *                                    availability changes anymore.
> - * @dev:       The devfreq user device. (parent of devfreq)
> - * @devfreq:   The devfreq object.
> - *
> - * At exit() callback of devfreq_dev_profile, this must be included if
> - * devfreq_recommended_opp is used.
> - */
> -int devfreq_unregister_opp_notifier(struct device *dev, struct devfreq *devfreq)
> -{
> -       return dev_pm_opp_unregister_notifier(dev, &devfreq->nb);
> -}
> -EXPORT_SYMBOL(devfreq_unregister_opp_notifier);
> -
> -static void devm_devfreq_opp_release(struct device *dev, void *res)
> -{
> -       devfreq_unregister_opp_notifier(dev, *(struct devfreq **)res);
> -}
> -
>  /**
>   * devm_devfreq_register_opp_notifier() - Resource-managed
>   *                                       devfreq_register_opp_notifier()
> @@ -2047,40 +2013,10 @@ static void devm_devfreq_opp_release(struct device *dev, void *res)
>  int devm_devfreq_register_opp_notifier(struct device *dev,
>                                        struct devfreq *devfreq)
>  {
> -       struct devfreq **ptr;
> -       int ret;
> -
> -       ptr = devres_alloc(devm_devfreq_opp_release, sizeof(*ptr), GFP_KERNEL);
> -       if (!ptr)
> -               return -ENOMEM;
> -
> -       ret = devfreq_register_opp_notifier(dev, devfreq);
> -       if (ret) {
> -               devres_free(ptr);
> -               return ret;
> -       }
> -
> -       *ptr = devfreq;
> -       devres_add(dev, ptr);
> -
> -       return 0;
> +       return devm_pm_opp_register_notifier(dev, &devfreq->nb);
>  }
>  EXPORT_SYMBOL(devm_devfreq_register_opp_notifier);
>
> -/**
> - * devm_devfreq_unregister_opp_notifier() - Resource-managed
> - *                                         devfreq_unregister_opp_notifier()
> - * @dev:       The devfreq user device. (parent of devfreq)
> - * @devfreq:   The devfreq object.
> - */
> -void devm_devfreq_unregister_opp_notifier(struct device *dev,
> -                                        struct devfreq *devfreq)
> -{
> -       WARN_ON(devres_release(dev, devm_devfreq_opp_release,
> -                              devm_devfreq_dev_match, devfreq));
> -}
> -EXPORT_SYMBOL(devm_devfreq_unregister_opp_notifier);

Need to support devm_devfreq_unregister_opp_notifier()
because sometimes, the user wants to release the resource by himself.

(snip)

Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
