Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B11408941
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EB66E092;
	Mon, 13 Sep 2021 10:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 351 seconds by postgrey-1.36 at gabe;
 Mon, 13 Sep 2021 10:42:23 UTC
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [IPv6:2001:888:0:108::1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ABD6E092
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:42:23 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id PjLTmYAZ2pQdWPjLUm2WW1; Mon, 13 Sep 2021 12:37:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1631529472; bh=HwcwZOckR6uo2ELf6S9P6ET08CoHQZG30MzfynjPP1Y=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=MCo+PzmKRi0SRrGtOM416IzQJO6AITQ9txiJczYZUT2j1PLalRU5sK8brIPH68/BR
 B3lcGsKHyhVPUUqtDzn17BIpuZKLYersfu6bK+ej4ovGjl5ezSmiN7ZRhCy46TAkJV
 RKkBNmtqCBhL/53Xyhi6PBCAAw2Nx/ZNiPdnyCLll9Zce0gKMhDyxm4ktoP3m04jbC
 03y6FOJQJwSWHwtax2zsZOz/Vft7XxEbjTc5n23eR13MHr7YH7kNrbK76lhbF8QW3p
 9Xm4EWH0dpVZE6WlSc6DMQmOibPuklbGJ+jHvg+newaIYoFnFcJLSPOqfxVEnhkG9A
 lvwHvL3X9CS1Q==
Subject: Re: [PATCH v11 24/34] media: staging: tegra-vde: Support generic
 power domain
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210912200832.12312-1-digetx@gmail.com>
 <20210912200832.12312-25-digetx@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <77d205ef-469d-cfa3-f742-b009b2b05992@xs4all.nl>
Date: Mon, 13 Sep 2021 12:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912200832.12312-25-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC0UR8EPsGu9scFXo/XyGQ+zclz4oYZK7ebAu7LkFSvn1ZSZql+X7aMfNk2HSIv/6FmtrmYKiCEiTasQtOArrwJIB9K/cvmo41OrNVaccz9t4pz4xFSP
 j4RW9XR1UXUNkZjiB50fmOTEVHWZQEEL0LCboGmfgPr5tPA1jHo+Fuobmb+0K/MLvwhlRfiHLXPOigMyMug4DAUy9DCMyYAMmHUGJHv08xsy7IjWw38ZjMxo
 aw3wUIyWLem1d/zZmaf0LubaeQEZUwSFtGIFmi2F++I5O/GnY6GkKzmSCgXAmFtLzjbSwYUQcEkSadgl1N7ZZVdyjkKvJJ0aYYeoMQSEFJa2Ep+OIUZDntf6
 P0TpfOPh+oHT4OaPgd5wX0Ui1jmXaNQKW7aiar3zaCLkiYfmnX+F0vULqbIoZ6Ijdo2bKxDHce1DUd2BDXddvwEDjjcvmwNJfaoskXKVJRBqdLmaxUjUx/V/
 09sbugSxdQhoVzwFzLT3DKHkZy+ewtdafWnzzxHv+4stixNxPyyAI2h9as2uXoPgPxclbWBSsYP7l1szZCwtKGYT00s5EQOcBeWGELKehjEPZU7UIzo4bx5t
 XspkFLAEM2gYpZFyIvFS0wY3UCtb68z5Upk6evtPpZgIKEGtBIR0GgSrn7PajKK7ZSa59x+FBQCKHR7D/w+1WFcdtzWbiWZOPpgBrSmqc5/wwoyS/xNwqSXF
 BHINYcJu8Lxzm6X6B3Wp4XpYRHwQpR9JFJbMR3ymDzApxAEXHL9uemBkl0o1h+BGgsC5F6aokDy9tX4L8IDLFBHNYT2Pwvd9HUCEeoNPS5jx3YXabGxXfyrQ
 3lGRLo/HkRWNr7PLHtJZ77cSpQDrR1R8NmTfiJxEgg6UzcAvgVLxfI1g38BX4vUe9ce3WZipyz82IsYvAd0E8qEeYNBf9cQqiSeduAEs0J8jFmDQMF/bnM8z
 oWi6YfJ+OqDe8iZ4iXmiBCynBsD9Pj/M4Dr61pK7Za58Lls8qeutMD/e4s56bLQcns/C35b1daKF009MnInB6c47cKlaoofOh8sc48nwDtnjAt+BGY6mbExF
 IL2eHWyz5KtrWh9bHowFYh63JcVKotwFmpQvQS5tfc/TOmUHpsuFEof+PXhXy3lLgluHHHaxnVE4rlKDqdQrJ7o8l2UjrEt9sudgUNRzDBKqKaIFDZUhe1R9
 Vhd0WP8g6IGkYe28njn8Mx/bA9RWRZFruTXvFVTegHNR4Ei/fa7tFwYD0ocofy0eAHQz5WooS/WLrsh/CJH+pSHt5I98Ogi2Ahridm3lxQF/JsQi+G8N54Cd
 hQtFam3Yh78FeXR5vuY6rDO4iey1wjaobPOJepuclTuligKEfwZaFmsF1+QE5Dg/h7h6wtbe1VhmaUAmLnObMknumKX2VDfPdRJIBlr8yRolNNpw2M8qIZi9
 0DND+x88qIRDteuXO11Vz6gw6Zo8nTyoyKWBuw==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2021 22:08, Dmitry Osipenko wrote:
> Currently driver supports legacy power domain API, this patch adds generic
> power domain support. This allows us to utilize a modern GENPD API for
> newer device-trees.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/staging/media/tegra-vde/vde.c | 57 +++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index ed4c1250b303..bb3079a2c0b5 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  
> +#include <soc/tegra/common.h>
>  #include <soc/tegra/pmc.h>
>  
>  #include "uapi.h"
> @@ -920,13 +921,17 @@ static __maybe_unused int tegra_vde_runtime_suspend(struct device *dev)
>  	struct tegra_vde *vde = dev_get_drvdata(dev);
>  	int err;
>  
> -	err = tegra_powergate_power_off(TEGRA_POWERGATE_VDEC);
> -	if (err) {
> -		dev_err(dev, "Failed to power down HW: %d\n", err);
> -		return err;
> +	if (!dev->pm_domain) {
> +		err = tegra_powergate_power_off(TEGRA_POWERGATE_VDEC);
> +		if (err) {
> +			dev_err(dev, "Failed to power down HW: %d\n", err);
> +			return err;
> +		}
>  	}
>  
>  	clk_disable_unprepare(vde->clk);
> +	reset_control_release(vde->rst);
> +	reset_control_release(vde->rst_mc);
>  
>  	return 0;
>  }
> @@ -936,14 +941,41 @@ static __maybe_unused int tegra_vde_runtime_resume(struct device *dev)
>  	struct tegra_vde *vde = dev_get_drvdata(dev);
>  	int err;
>  
> -	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VDEC,
> -						vde->clk, vde->rst);
> +	err = reset_control_acquire(vde->rst_mc);
>  	if (err) {
> -		dev_err(dev, "Failed to power up HW : %d\n", err);
> +		dev_err(dev, "Failed to acquire mc reset: %d\n", err);
>  		return err;
>  	}
>  
> +	err = reset_control_acquire(vde->rst);
> +	if (err) {
> +		dev_err(dev, "Failed to acquire reset: %d\n", err);
> +		goto release_mc_reset;
> +	}
> +
> +	if (!dev->pm_domain) {
> +		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VDEC,
> +							vde->clk, vde->rst);
> +		if (err) {
> +			dev_err(dev, "Failed to power up HW : %d\n", err);
> +			goto release_reset;
> +		}
> +	}
> +
> +	err = clk_prepare_enable(vde->clk);
> +	if (err) {
> +		dev_err(dev, "Failed to enable clock: %d\n", err);
> +		goto release_reset;
> +	}
> +
>  	return 0;
> +
> +release_reset:
> +	reset_control_release(vde->rst);
> +release_mc_reset:
> +	reset_control_release(vde->rst_mc);
> +
> +	return err;
>  }
>  
>  static int tegra_vde_probe(struct platform_device *pdev)
> @@ -1001,14 +1033,14 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	vde->rst = devm_reset_control_get(dev, NULL);
> +	vde->rst = devm_reset_control_get_exclusive_released(dev, NULL);
>  	if (IS_ERR(vde->rst)) {
>  		err = PTR_ERR(vde->rst);
>  		dev_err(dev, "Could not get VDE reset %d\n", err);
>  		return err;
>  	}
>  
> -	vde->rst_mc = devm_reset_control_get_optional(dev, "mc");
> +	vde->rst_mc = devm_reset_control_get_optional_exclusive_released(dev, "mc");
>  	if (IS_ERR(vde->rst_mc)) {
>  		err = PTR_ERR(vde->rst_mc);
>  		dev_err(dev, "Could not get MC reset %d\n", err);
> @@ -1066,6 +1098,10 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 300);
>  
> +	err = devm_tegra_core_dev_init_opp_table_common(dev);
> +	if (err)
> +		goto err_pm_runtime;
> +
>  	/*
>  	 * VDE partition may be left ON after bootloader, hence let's
>  	 * power-cycle it in order to put hardware into a predictable lower
> @@ -1133,8 +1169,7 @@ static void tegra_vde_shutdown(struct platform_device *pdev)
>  	 * On some devices bootloader isn't ready to a power-gated VDE on
>  	 * a warm-reboot, machine will hang in that case.
>  	 */
> -	if (pm_runtime_status_suspended(&pdev->dev))
> -		tegra_vde_runtime_resume(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
>  }
>  
>  static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
> 

