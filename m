Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630C2EA479
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 05:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD889C46;
	Tue,  5 Jan 2021 04:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9178489C46;
 Tue,  5 Jan 2021 04:35:53 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o13so69715697lfr.3;
 Mon, 04 Jan 2021 20:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=qD0FtR3erA6kwegaSx7IL4OPdx8eCkd9tLpFM4vCzPY=;
 b=rYL8dvYN5oG6NMZCw7RacaHc5WfWoK4sWwnsrAxrQ6ENTf7OgGvXR2CaVxxY3Pm0xj
 2wHteUcLw+UdA9zkhQnfjL+pDwM/S7IfQ9+rvd/GHb5ZzQN/fEeUdz0uN+2/j9SOg6DP
 5vw3ERODdcr+6F4e/FN03trftl/vgCdI7R9pya3NN2I51/sPqojOow2owtRxTygVBuvp
 LE3KiAjk/uSPfMpnzHMs1jABf71rOnSyPVWDTYkUJlTy5/AC0VJb3lfQ2g1NinVUBHlt
 Zr9u+Za3bswf+TvU9qLTO5vVv+3sgI0BfHR1yLjB0T/AJqaBrNwZRriBTLVmchP0zYQA
 YOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=qD0FtR3erA6kwegaSx7IL4OPdx8eCkd9tLpFM4vCzPY=;
 b=TfBMpGYzYwuzJvA836u5Ze7eM/2URKNJkOYeYKRTXZvLCSWkqqFNDgT2meTrPPNh6o
 t5hPJWbemYOlCeKOhs91FPIVTanLrWgR04t8SRC3Gj6J8Utf/ATIGwH5AEJ5yb4gujph
 lGuzfDjy5oJVKSwgd6TN92bVvbv3o0p70PE3uNs2+y2Luuxxkk0jKU/hTZJVcoLuMl7X
 EaRVAWizwoBi0SPHlrckP+wp7Hnoy3SAJXHbgQK0K4mj59+hegXIBWMpdrQI0xEFLhDr
 +EdrJaN13xwEA7cWAjTljgejokJCzBRyWVdVVplFUyD637x+0rCR6Dz28kTtw7ckzNzG
 EjQw==
X-Gm-Message-State: AOAM5322gqCxUCWdckgrAAF/0SeG4J7O/rK59Qbd0W6VmGvNVfHNR56B
 cm028YjcWtOH7NROBkeRQvhumwMLKGlwsSV2USA=
X-Google-Smtp-Source: ABdhPJyWYSFe/zFRwlGX58UpgZM9x8XaWgX72JT+MdQWG2gDkQiLQbB2JXbuavsJ8jCM6zO6wI9/iwcg9EeH+QwJSXE=
X-Received: by 2002:a05:6512:94f:: with SMTP id
 u15mr31040115lft.389.1609821351878; 
 Mon, 04 Jan 2021 20:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20210103035639.24076-1-tiny.windzz@gmail.com>
In-Reply-To: <20210103035639.24076-1-tiny.windzz@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 5 Jan 2021 13:35:15 +0900
Message-ID: <CAGTfZH3Rb8qsT6ZtT9QWb_oU_Nt9z+UaiyWkExo1uzSDKz6g8A@mail.gmail.com>
Subject: Re: [PATCH 30/31] PM / devfreq: exynos: convert to use devm_pm_opp_*
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

On Sun, Jan 3, 2021 at 12:59 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_pm_opp_* API to simplify code, and remove opp_table
> from exynos_bus.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/exynos-bus.c | 42 ++++++++----------------------------
>  1 file changed, 9 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index e689101abc93..51752e5ce980 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -33,7 +33,6 @@ struct exynos_bus {
>
>         unsigned long curr_freq;
>
> -       struct opp_table *opp_table;
>         struct clk *clk;
>         unsigned int ratio;
>  };
> @@ -159,10 +158,7 @@ static void exynos_bus_exit(struct device *dev)
>
>         platform_device_unregister(bus->icc_pdev);
>
> -       dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
> -       dev_pm_opp_put_regulators(bus->opp_table);

OPP uses the clock and regulator. It means that there are dependency
between them and the sequence for resource free.

I think that OPP should be removed before clock and regulator.
Your patch always guarantee this dependency? If not, we have to
free the resource according to the dependency.

> -       bus->opp_table = NULL;
>  }
>
>  static void exynos_bus_passive_exit(struct device *dev)
> @@ -171,7 +167,6 @@ static void exynos_bus_passive_exit(struct device *dev)
>
>         platform_device_unregister(bus->icc_pdev);
>
> -       dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
>  }
>
> @@ -183,15 +178,13 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>         const char *vdd = "vdd";
>         int i, ret, count, size;
>
> -       opp_table = dev_pm_opp_set_regulators(dev, &vdd, 1);
> +       opp_table = devm_pm_opp_set_regulators(dev, &vdd, 1);
>         if (IS_ERR(opp_table)) {
>                 ret = PTR_ERR(opp_table);
>                 dev_err(dev, "failed to set regulators %d\n", ret);
>                 return ret;
>         }
>
> -       bus->opp_table = opp_table;
> -
>         /*
>          * Get the devfreq-event devices to get the current utilization of
>          * buses. This raw data will be used in devfreq ondemand governor.
> @@ -199,25 +192,20 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>         count = devfreq_event_get_edev_count(dev, "devfreq-events");
>         if (count < 0) {
>                 dev_err(dev, "failed to get the count of devfreq-event dev\n");
> -               ret = count;
> -               goto err_regulator;
> +               return count;
>         }
>         bus->edev_count = count;
>
>         size = sizeof(*bus->edev) * count;
>         bus->edev = devm_kzalloc(dev, size, GFP_KERNEL);
> -       if (!bus->edev) {
> -               ret = -ENOMEM;
> -               goto err_regulator;
> -       }
> +       if (!bus->edev)
> +               return -ENOMEM;
>
>         for (i = 0; i < count; i++) {
>                 bus->edev[i] = devfreq_event_get_edev_by_phandle(dev,
>                                                         "devfreq-events", i);
> -               if (IS_ERR(bus->edev[i])) {
> -                       ret = -EPROBE_DEFER;
> -                       goto err_regulator;
> -               }
> +               if (IS_ERR(bus->edev[i]))
> +                       return -EPROBE_DEFER;
>         }
>
>         /*
> @@ -234,12 +222,6 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>                 bus->ratio = DEFAULT_SATURATION_RATIO;
>
>         return 0;
> -
> -err_regulator:
> -       dev_pm_opp_put_regulators(bus->opp_table);
> -       bus->opp_table = NULL;
> -
> -       return ret;
>  }
>
>  static int exynos_bus_parse_of(struct device_node *np,
> @@ -264,7 +246,7 @@ static int exynos_bus_parse_of(struct device_node *np,
>         }
>
>         /* Get the freq and voltage from OPP table to scale the bus freq */
> -       ret = dev_pm_opp_of_add_table(dev);
> +       ret = devm_pm_opp_of_add_table(dev);
>         if (ret < 0) {
>                 dev_err(dev, "failed to get OPP table\n");
>                 goto err_clk;
> @@ -276,15 +258,13 @@ static int exynos_bus_parse_of(struct device_node *np,
>         if (IS_ERR(opp)) {
>                 dev_err(dev, "failed to find dev_pm_opp\n");
>                 ret = PTR_ERR(opp);
> -               goto err_opp;
> +               goto err_clk;
>         }
>         bus->curr_freq = dev_pm_opp_get_freq(opp);
>         dev_pm_opp_put(opp);
>
>         return 0;
>
> -err_opp:
> -       dev_pm_opp_of_remove_table(dev);
>  err_clk:
>         clk_disable_unprepare(bus->clk);
>
> @@ -425,7 +405,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
>         /* Parse the device-tree to get the resource information */
>         ret = exynos_bus_parse_of(np, bus);
>         if (ret < 0)
> -               goto err_reg;
> +               return ret;
>
>         if (passive)
>                 ret = exynos_bus_profile_init_passive(bus, profile);
> @@ -456,11 +436,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
>         return 0;
>
>  err:
> -       dev_pm_opp_of_remove_table(dev);
>         clk_disable_unprepare(bus->clk);
> -err_reg:
> -       dev_pm_opp_put_regulators(bus->opp_table);
> -       bus->opp_table = NULL;
>
>         return ret;
>  }
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
