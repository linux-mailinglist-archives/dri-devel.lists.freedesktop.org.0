Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2612EA430
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 05:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3CA89CF3;
	Tue,  5 Jan 2021 04:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70DA89CF3;
 Tue,  5 Jan 2021 04:01:27 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m25so69491052lfc.11;
 Mon, 04 Jan 2021 20:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=SQQuOKC1O0sf7eW3BCMzk/TTSkOU/Wo1ZPhVnA2VyuU=;
 b=pofi22Yd5VW1o8B824chIwbMBxC2hE6GILeV7bxPEdAxPGOpfffZlp8k2E4gK0JICe
 DN+KKIJ1vYB20DDYeBQFUSk4SemoWoHJMTDv6wSm87FCOkeGYbdW05SojFh4ZoHk/+z4
 fTLP4AMIXDJtvqUw+Mzz7iL3iyjWgzDItfwu9cSShDJo61lDdViOtayU/jY/gvaqKz9W
 536ujgrNGTDemv9U10UXZ9pxDDX/B6GenSeUR+WRhiwRx3jV5cw+fQXCnj9g0T27nS6x
 SE/xI+QWrUm3xX4Pgjqh3moeCucwx0iO4q6v+nXQGeCcyQxr2Ur+GEeeqiI5CiS8SLyJ
 oKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=SQQuOKC1O0sf7eW3BCMzk/TTSkOU/Wo1ZPhVnA2VyuU=;
 b=Rc1FgG6M65Z1RXGPuROxdriI2aAEmS0RkQCSpmKkji/n+ea1VbYW5KVSuYBqoInpDP
 M7VOd7M+m5yXiYe5WPbNArjTGVRttQUa367iuPQApxUXjFBAuMzAnV/YOu27s+RHIZcP
 Y/xSN6fq6Jw8Ft5M+kIocUm8OrHPYqgyLaeG27dhSktHYs5AYLuqgYdMEoJcxJbBswI0
 FLnkCqu/SmQGti9wP+7YAOtFbnKV5+ZpHiW6o/AfuCGJ5oWBNCPKocddbujQN6pfKaMe
 GkGH6DCafPvP66/5oq3+nCNVxUFXysdFZzlBwf3GmU+TMRq4LPVTjNZF1xTc0giqxMak
 arSQ==
X-Gm-Message-State: AOAM532q4bBmGzX+mhxxQcpflkR4BO3erUqmVyZX73BfrPemuAOMqro1
 OcE2Ek4jBQ7UqPD4z+WvVwb/GIS/6TBrqOw6Myw=
X-Google-Smtp-Source: ABdhPJxu21uHjyNWjYVVrY0kCQTURSa+kVb4E4YJv2XQs1DWZtV8BvIeHMut8ZaNQpth2To8kl++bOQ/w6Wk8MYKT9w=
X-Received: by 2002:a19:4316:: with SMTP id q22mr17269237lfa.106.1609819286213; 
 Mon, 04 Jan 2021 20:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20210103035514.23788-1-tiny.windzz@gmail.com>
In-Reply-To: <20210103035514.23788-1-tiny.windzz@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 5 Jan 2021 13:00:49 +0900
Message-ID: <CAGTfZH0DHXZqtiXNZrMA=pZMDG3zZpFez_sPvteAQgHXBs5WYQ@mail.gmail.com>
Subject: Re: [PATCH 27/31] PM / devfreq: rk3399_dmc: convert to use
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

Hi,

Do you make this patch on latest source?
When I apply this patch for test, it make the merge conflict error.

On Sun, Jan 3, 2021 at 12:57 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_pm_opp_* API to simplify code. Since devres release
> can guarantee the order, let's remove
> devm_devfreq_unregister_opp_notifier().
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/rk3399_dmc.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
> index 2e912166a993..9b8ab8be29d1 100644
> --- a/drivers/devfreq/rk3399_dmc.c
> +++ b/drivers/devfreq/rk3399_dmc.c
> @@ -432,7 +432,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>          * We add a devfreq driver to our parent since it has a device tree node
>          * with operating points.
>          */
> -       if (dev_pm_opp_of_add_table(dev)) {
> +       if (devm_pm_opp_of_add_table(dev)) {
>                 dev_err(dev, "Invalid operating-points in device tree.\n");
>                 ret = -EINVAL;
>                 goto err_edev;
> @@ -448,7 +448,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>         opp = devfreq_recommended_opp(dev, &data->rate, 0);
>         if (IS_ERR(opp)) {
>                 ret = PTR_ERR(opp);
> -               goto err_free_opp;
> +               goto err_edev;
>         }
>
>         data->rate = dev_pm_opp_get_freq(opp);
> @@ -463,7 +463,7 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>                                            &data->ondemand_data);
>         if (IS_ERR(data->devfreq)) {
>                 ret = PTR_ERR(data->devfreq);
> -               goto err_free_opp;
> +               goto err_edev;
>         }
>
>         devm_devfreq_register_opp_notifier(dev, data->devfreq);
> @@ -473,27 +473,12 @@ static int rk3399_dmcfreq_probe(struct platform_device *pdev)
>
>         return 0;
>
> -err_free_opp:
> -       dev_pm_opp_of_remove_table(&pdev->dev);
>  err_edev:
>         devfreq_event_disable_edev(data->edev);
>
>         return ret;
>  }
>
> -static int rk3399_dmcfreq_remove(struct platform_device *pdev)
> -{
> -       struct rk3399_dmcfreq *dmcfreq = dev_get_drvdata(&pdev->dev);
> -
> -       /*
> -        * Before remove the opp table we need to unregister the opp notifier.
> -        */
> -       devm_devfreq_unregister_opp_notifier(dmcfreq->dev, dmcfreq->devfreq);
> -       dev_pm_opp_of_remove_table(dmcfreq->dev);

As the comment, we need to unregister the opp notifier before removing the OPP.
Do you guarantee this sequence on your patch?


> -
> -       return 0;
> -}
> -
>  static const struct of_device_id rk3399dmc_devfreq_of_match[] = {
>         { .compatible = "rockchip,rk3399-dmc" },
>         { },
> @@ -502,7 +487,6 @@ MODULE_DEVICE_TABLE(of, rk3399dmc_devfreq_of_match);
>
>  static struct platform_driver rk3399_dmcfreq_driver = {
>         .probe  = rk3399_dmcfreq_probe,
> -       .remove = rk3399_dmcfreq_remove,
>         .driver = {
>                 .name   = "rk3399-dmc-freq",
>                 .pm     = &rk3399_dmcfreq_pm,
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
