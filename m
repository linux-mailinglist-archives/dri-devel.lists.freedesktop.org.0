Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F22A915C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AD36EA78;
	Fri,  6 Nov 2020 08:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CCD6E188
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:58:46 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id cw8so1720879ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/0+xGMrqmCQCrjRIhp34cgoVWyVPh+6Sc63/MCPbP8=;
 b=i+mDDBQGg9bf9ZIFzChyy7Rq+AK2ujK0vNsYtVg1phv8sxI4NYIxwWWLXmBO1AoPnr
 2uAFrojlzm/ql3PTMenBeK5Xq0Ad0WXHmPNn+Zt5r98YKoAxvp2wSLmxnWNwYgCvB4CN
 lRm9qRiNr4WJ1qN37G+/1M5YXyx4EmkOfDqMpjAfr9MPFTJ7M8zyrThQ9cssePg7fEGo
 5AAqlqj48wJIvqREQzT41ALbORJ0Ke8tq/ZFNwNADWHAos3p8LRY0+kFTfxfvmQpfEYt
 J2J4a7RvoVFp+QSO8Q29MM0YfPsa+NYD2yQ4RoaPzew1LRwJnQfhkx6+8bZPNJFsNw4N
 H0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/0+xGMrqmCQCrjRIhp34cgoVWyVPh+6Sc63/MCPbP8=;
 b=A/g+QhLvHG2C19bqS72cZVelNypPjKDLtUlTLBA0zBBm4jvFhgIcNngmGJlmnex0ii
 8y4bhrAoKkGwXxNYPqJiq/+4rl0UThFTWGDHmWtxs00/n/DkSPzO2qUWp1OzNXiqYjJN
 +KPFGiy1WpVWKTmw4lOw+7s+ZzwYoxlbfyMrnseM72vHm8ONv6IDfihLR3eiRMQYfNzX
 e7jy1zxvWMjZmrheIzjz8q3iv6lfYEBKHFJlqZVp9iqt5/3cT235jhunJaDCfxN8CfyN
 VY8s+8wtiLsEIiO5PqWSCHPmffqtMTsmrIOsh1MPdkZ9+Y6DxAyItLz7/0a94ik54hpV
 iXGQ==
X-Gm-Message-State: AOAM532lDy9e79roJerN8szTc1qcFRk/XJp43U4uqWhbiEXS7fhCZiZw
 Q/3ja9q2nxQ1fZd0KYAYlFlLfrl6jeIflSSaTwA=
X-Google-Smtp-Source: ABdhPJyn8dHU+iql4LIPEGykzYeJPOpKnFuZLrqcQJDf2Cin2XWenUKK05ejEnpNpXJIWT3fxGVNQdHuR8JyYUjfQ0g=
X-Received: by 2002:a17:906:3689:: with SMTP id
 a9mr1424841ejc.403.1604570325540; 
 Thu, 05 Nov 2020 01:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-18-digetx@gmail.com>
In-Reply-To: <20201104234427.26477-18-digetx@gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 5 Nov 2020 15:28:34 +0530
Message-ID: <CAOh2x==sy1w7_oEV8=toC6uQnSN44wyOixbP_X0BrMsnm1AUFg@mail.gmail.com>
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
To: Dmitry Osipenko <digetx@gmail.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 DTML <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driver-dev <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 5, 2020 at 5:15 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c

> +static void sdhci_tegra_deinit_opp_table(void *data)
> +{
> +       struct device *dev = data;
> +       struct opp_table *opp_table;
> +
> +       opp_table = dev_pm_opp_get_opp_table(dev);

So you need to get an OPP table to put one :)
You need to save the pointer returned by dev_pm_opp_set_regulators() instead.

> +       dev_pm_opp_of_remove_table(dev);
> +       dev_pm_opp_put_regulators(opp_table);
> +       dev_pm_opp_put_opp_table(opp_table);
> +}
> +
> +static int devm_sdhci_tegra_init_opp_table(struct device *dev)
> +{
> +       struct opp_table *opp_table;
> +       const char *rname = "core";
> +       int err;
> +
> +       /* voltage scaling is optional */
> +       if (device_property_present(dev, "core-supply"))
> +               opp_table = dev_pm_opp_set_regulators(dev, &rname, 1);
> +       else


> +               opp_table = dev_pm_opp_get_opp_table(dev);

Nice. I didn't think that someone will end up abusing this API and so made it
available for all, but someone just did that. I will fix that in the OPP core.

Any idea why you are doing what you are doing here ?

> +
> +       if (IS_ERR(opp_table))
> +               return dev_err_probe(dev, PTR_ERR(opp_table),
> +                                   "failed to prepare OPP table\n");
> +
> +       /*
> +        * OPP table presence is optional and we want the set_rate() of OPP
> +        * API to work similarly to clk_set_rate() if table is missing in a
> +        * device-tree.  The add_table() errors out if OPP is missing in DT.
> +        */
> +       if (device_property_present(dev, "operating-points-v2")) {
> +               err = dev_pm_opp_of_add_table(dev);
> +               if (err) {
> +                       dev_err(dev, "failed to add OPP table: %d\n", err);
> +                       goto put_table;
> +               }
> +       }
> +
> +       err = devm_add_action(dev, sdhci_tegra_deinit_opp_table, dev);
> +       if (err)
> +               goto remove_table;
> +
> +       return 0;
> +
> +remove_table:
> +       dev_pm_opp_of_remove_table(dev);
> +put_table:
> +       dev_pm_opp_put_regulators(opp_table);
> +
> +       return err;
> +}
> +
>  static int sdhci_tegra_probe(struct platform_device *pdev)
>  {
>         const struct of_device_id *match;
> @@ -1621,6 +1681,10 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>                 goto err_power_req;
>         }
>
> +       rc = devm_sdhci_tegra_init_opp_table(&pdev->dev);
> +       if (rc)
> +               goto err_parse_dt;
> +
>         /*
>          * Tegra210 has a separate SDMMC_LEGACY_TM clock used for host
>          * timeout clock and SW can choose TMCLK or SDCLK for hardware
> --
> 2.27.0
>
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
