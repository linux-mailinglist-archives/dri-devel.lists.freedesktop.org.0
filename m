Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054172B77D3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599F56E3EF;
	Wed, 18 Nov 2020 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988816E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:07:08 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id mn12so145481pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 02:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zDO/TYpqBjmcYMHioNqIZuUjbpR+6v11u2ajK5HGwak=;
 b=j2kVKHsvyPuW4TDoJ5BP//mL+ksNhHdSc2ZBZWPScdQ2jZIts6ntDXd2+J63MUJV8t
 HRTbq8mx6qTfzgXHQiRl4fMa+WvbnP/LeyC1YMaEYd8aC9j2Cr/db3o3npmopsFCSzWs
 ym/WQEMe6VXS+cQNu2CMGhPkm0akAgSp1QhkYbIDXhlys1ybehAe0dKIXpm4fvnAujct
 MF2GWB77hza8pcpL2wrYNDZDxGw1ecHBfyW8VUStTXsbYV/Za2yd6Tick3n+d0EmTYmj
 p0Yd+Uq3IZ6k4m/8k+q3dCYHQWvtmgkk07AZgXiJKH6GO4vdyqd57ZaFKKtRPUZx9trc
 BzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zDO/TYpqBjmcYMHioNqIZuUjbpR+6v11u2ajK5HGwak=;
 b=qGXAd5w8ztlnQvh3LSnnpIgD3K8PT61wrBPJ/eBvkUjNocl9AjogXF2j46HeTuGdKb
 039kUqTFsCI4y3OtajMFrJM42OdO4XgWE22TZHN38YUfpMpU/HtvvQJNvJVZarQPr42v
 yg1fpuxN7nW36YlDyQ7VpD5dVd1tqfIu3LY3Y3WAyWPpZfrLZlAzrMkDY3748hnQqVl2
 VZKzUHDSRYPRXLNUXc3+FOYDgPNzA5Rh/VWM3zQA9DHiMzR4oSi++yriZEjzLR7TMvtn
 thdvA6xQ1vs7CDH8fAQ1ccipqBToZVwvatLZj/Rvf+j0dpZimnEI2eY+sNmNp+REFLFD
 49Ag==
X-Gm-Message-State: AOAM5300BA5xuIPoQ5wx+sHl5HemnIDuwkeL2J1Tx5w2Kw8sFSKKm7x5
 EzM9/ks2rroV4Jdexo5VCJCVtA==
X-Google-Smtp-Source: ABdhPJyJ6tjgZVNUAp3v1jcIXODPPSj506Em6+r/KEB8PPBt691bL5Vm0hi+UoZwIT3mJxFLcb8oLg==
X-Received: by 2002:a17:90a:7409:: with SMTP id
 a9mr3934084pjg.48.1605607628171; 
 Tue, 17 Nov 2020 02:07:08 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id c28sm22436619pfj.108.2020.11.17.02.07.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 02:07:07 -0800 (PST)
Date: Tue, 17 Nov 2020 15:37:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 07/17] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
Message-ID: <20201117100705.i62qr4gosvu76o22@vireshk-i7>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201115212922.4390-8-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-11-20, 00:29, Dmitry Osipenko wrote:
> This patch moves ACTMON driver away from generating OPP table by itself,
> transitioning it to use the table which comes from device-tree. This
> change breaks compatibility with older device-trees in order to bring
> support for the interconnect framework to the driver. This is a mandatory
> change which needs to be done in order to implement interconnect-based
> memory DVFS. Users of legacy device-trees will get a message telling that
> theirs DT needs to be upgraded. Now ACTMON issues memory bandwidth request
> using dev_pm_opp_set_bw(), instead of driving EMC clock rate directly.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 86 ++++++++++++++++---------------
>  1 file changed, 44 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 38cc0d014738..ed6d4469c8c7 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -19,6 +19,8 @@
>  #include <linux/reset.h>
>  #include <linux/workqueue.h>
>  
> +#include <soc/tegra/fuse.h>
> +
>  #include "governor.h"
>  
>  #define ACTMON_GLB_STATUS					0x0
> @@ -155,6 +157,7 @@ struct tegra_devfreq_device {
>  
>  struct tegra_devfreq {
>  	struct devfreq		*devfreq;
> +	struct opp_table	*opp_table;
>  
>  	struct reset_control	*reset;
>  	struct clk		*clock;
> @@ -612,34 +615,19 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
>  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>  				u32 flags)
>  {
> -	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
> -	struct devfreq *devfreq = tegra->devfreq;
>  	struct dev_pm_opp *opp;
> -	unsigned long rate;
> -	int err;
> +	int ret;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(opp)) {
>  		dev_err(dev, "Failed to find opp for %lu Hz\n", *freq);
>  		return PTR_ERR(opp);
>  	}
> -	rate = dev_pm_opp_get_freq(opp);
> -	dev_pm_opp_put(opp);
> -
> -	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
> -	if (err)
> -		return err;
> -
> -	err = clk_set_rate(tegra->emc_clock, 0);
> -	if (err)
> -		goto restore_min_rate;
>  
> -	return 0;
> -
> -restore_min_rate:
> -	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
> +	ret = dev_pm_opp_set_bw(dev, opp);
> +	dev_pm_opp_put(opp);
>  
> -	return err;
> +	return ret;
>  }
>  
>  static int tegra_devfreq_get_dev_status(struct device *dev,
> @@ -655,7 +643,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>  	stat->private_data = tegra;
>  
>  	/* The below are to be used by the other governors */
> -	stat->current_frequency = cur_freq;
> +	stat->current_frequency = cur_freq * KHZ;
>  
>  	actmon_dev = &tegra->devices[MCALL];
>  
> @@ -705,7 +693,12 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
>  		target_freq = max(target_freq, dev->target_freq);
>  	}
>  
> -	*freq = target_freq;
> +	/*
> +	 * tegra-devfreq driver operates with KHz units, while OPP table
> +	 * entries use Hz units. Hence we need to convert the units for the
> +	 * devfreq core.
> +	 */
> +	*freq = target_freq * KHZ;
>  
>  	return 0;
>  }
> @@ -774,6 +767,7 @@ static struct devfreq_governor tegra_devfreq_governor = {
>  
>  static int tegra_devfreq_probe(struct platform_device *pdev)
>  {
> +	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
>  	struct tegra_devfreq_device *dev;
>  	struct tegra_devfreq *tegra;
>  	struct devfreq *devfreq;
> @@ -781,6 +775,13 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	long rate;
>  	int err;
>  
> +	/* legacy device-trees don't have OPP table and must be updated */
> +	if (!device_property_present(&pdev->dev, "operating-points-v2")) {
> +		dev_err(&pdev->dev,
> +			"OPP table not found, please update your device tree\n");
> +		return -ENODEV;
> +	}
> +

You forgot to remove this ?

>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
>  	if (!tegra)
>  		return -ENOMEM;
> @@ -822,11 +823,25 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	tegra->opp_table = dev_pm_opp_set_supported_hw(&pdev->dev,
> +						       &hw_version, 1);
> +	err = PTR_ERR_OR_ZERO(tegra->opp_table);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
> +		return err;
> +	}
> +
> +	err = dev_pm_opp_of_add_table(&pdev->dev);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to add OPP table: %d\n", err);
> +		goto put_hw;
> +	}
> +
>  	err = clk_prepare_enable(tegra->clock);
>  	if (err) {
>  		dev_err(&pdev->dev,
>  			"Failed to prepare and enable ACTMON clock\n");
> -		return err;
> +		goto remove_table;
>  	}
>  
>  	err = reset_control_reset(tegra->reset);
> @@ -850,23 +865,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  		dev->regs = tegra->regs + dev->config->offset;
>  	}
>  
> -	for (rate = 0; rate <= tegra->max_freq * KHZ; rate++) {
> -		rate = clk_round_rate(tegra->emc_clock, rate);
> -
> -		if (rate < 0) {
> -			dev_err(&pdev->dev,
> -				"Failed to round clock rate: %ld\n", rate);
> -			err = rate;
> -			goto remove_opps;
> -		}
> -
> -		err = dev_pm_opp_add(&pdev->dev, rate / KHZ, 0);
> -		if (err) {
> -			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
> -			goto remove_opps;
> -		}
> -	}
> -
>  	platform_set_drvdata(pdev, tegra);
>  
>  	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
> @@ -882,7 +880,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  
>  	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
> -	tegra_devfreq_profile.initial_freq /= KHZ;
>  
>  	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
>  				     "tegra_actmon", NULL);
> @@ -902,6 +899,10 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	reset_control_reset(tegra->reset);
>  disable_clk:
>  	clk_disable_unprepare(tegra->clock);
> +remove_table:
> +	dev_pm_opp_of_remove_table(&pdev->dev);
> +put_hw:
> +	dev_pm_opp_put_supported_hw(tegra->opp_table);
>  
>  	return err;
>  }
> @@ -913,11 +914,12 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
>  	devfreq_remove_device(tegra->devfreq);
>  	devfreq_remove_governor(&tegra_devfreq_governor);
>  
> -	dev_pm_opp_remove_all_dynamic(&pdev->dev);
> -
>  	reset_control_reset(tegra->reset);
>  	clk_disable_unprepare(tegra->clock);
>  
> +	dev_pm_opp_of_remove_table(&pdev->dev);
> +	dev_pm_opp_put_supported_hw(tegra->opp_table);
> +
>  	return 0;
>  }
>  
> -- 
> 2.29.2

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
