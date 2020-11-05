Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0182A7537
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 03:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A24C89C85;
	Thu,  5 Nov 2020 02:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1FD89C85
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:08:21 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201105020820epoutp019b5c10cfd18d21bf08bae83715ead27e~Eeon3AlrT3080930809epoutp01U
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:08:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201105020820epoutp019b5c10cfd18d21bf08bae83715ead27e~Eeon3AlrT3080930809epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604542100;
 bh=UY5wyEA/7KgFYm+m/uCeoRFsAFIDrkQp2oymQvesjQA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=vbV8R9gmw+dvJ5A384o8gUVKG5srI24IqiuMhgcsAP3tV0hzwisiToTrkZ2B6hIGl
 TfqsALVtJeiqlw7p2giBQrBrD/r2tbGB7c24u0/choqPaLsHSPTCB6RP1bo1oLzRql
 OwvpCs6hvGtY5bt2sHlU7FELM8dQ4x5IjhdbzB1Q=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201105020819epcas1p16e9763cec9b873ef77f71ebfd11a4916~EeonTK8rf1663216632epcas1p1C;
 Thu,  5 Nov 2020 02:08:19 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.158]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CRRkm1GDkzMqYkk; Thu,  5 Nov
 2020 02:08:16 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 75.DB.63458.09E53AF5; Thu,  5 Nov 2020 11:08:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201105020815epcas1p34067ce27ad5804aba8a81f02c248c6d0~Eeojmm-Rb3016230162epcas1p3H;
 Thu,  5 Nov 2020 02:08:15 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201105020815epsmtrp262fd973894180f9788b62b2bed700708~Eeojlh2Oh1460114601epsmtrp2w;
 Thu,  5 Nov 2020 02:08:15 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-df-5fa35e909926
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.7F.13470.F8E53AF5; Thu,  5 Nov 2020 11:08:15 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201105020815epsmtip257077db3170ec4ccf3fbd16ad851e68a~EeojGdeeV1081810818epsmtip2_;
 Thu,  5 Nov 2020 02:08:15 +0000 (GMT)
Subject: Re: [PATCH v7 45/47] PM / devfreq: tegra30: Support interconnect
 and OPPs from device-tree
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>, Peter Geis
 <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Krzysztof
 Kozlowski <krzk@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <2b907334-9ddf-654a-2add-891b0dcaa8ad@samsung.com>
Date: Thu, 5 Nov 2020 11:22:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201104164923.21238-46-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBTVxidm7y8JA60jxjDLW0Vnh0HsSxhvbaE2oKSooNpmTotP0zfwBOQ
 bJMH2H0gLixWqhRFU5RNlMWlBERhYHBYyhABKWqEVkY7BMcKJBSKgqI04eGUf+d+53z33PPd
 ewVc0TjuIUjRpNF6DaUi8VVYY8dGf9+juyuUAWUmHrJNj/FQSWc/D9X+MwrQ7Vk7jopaTTg6
 YCzH0M2bv/LRlbELHNRnmOCjW83FOJo50glQ7r9GHP1u3or+zKrCUcHF4wD1PdyODrZ28tFL
 Sx2G5pvPYKj+wW/4FrHcPnSQL28yjvDlg/0LXLmpJheX37O04PL7h7s58iP7bbg8v6EGyGdM
 axXC+NTwZJpKpPWetCZBm5iiSZKR2+OUkcqQ0ACpr3QzCiM9NZSalpFROxS+21JUjmSkZwal
 SneUFBTDkP4R4Xptehrtmaxl0mQkrUtU6Tbr/BhKzaRrkvwStOr3pAEBgSEO4ZepyYuj03xd
 H/rKbNiXCSp884BQAIlgOG8+wckDqwQi4hqAswW1PCchIqYBzLLGs8QTAKuH83ivOq4Pdi13
 tAI4ZcjnsQs7gPX9fy+pVhM0vFP4gu8kxMQwBs9XvcSdBJc4CeC9lvVOjBM+sO3R0FL9dcIL
 3pkbBU7sSkTA7JN2zIkx4h1obZ1e0qwhdsGexgPLGjfYc8q6pBESYdA2nLm8vzv8w1rCYfE6
 eHWymOs8BCR+EcIbl/owNkMUnKgb5rN4NXzc3bCMPeCMrRVn8bewuqcTZ5tzAGxoG1geQBBs
 q/zZ4SBwOGyEl5v92bIXbHp+GrDGr0Hb7I88pwQSrjDnkIiVrIe3HoxwWPwGrMjOxY8C0rgi
 jnFFBOOKCMb/zUoBVgMktI5RJ9GMVBe48rZNYOnV+4ReAwWTU37tgCMA7QAKuKTYdSC2XCly
 TaS+/obWa5X6dBXNtIMQx4CPcT3WJGgd30aTppSGBAYFBaFgaWiIVEq6uy5sylGKiCQqjU6l
 aR2tf9XHEQg9MjkuCq/ArGmV58hHc7SbJPbup3BMsqNXrJ07LSn7Kwa/IQtXlH7Pp0WL0VYD
 knkPqM8O5j2bj3n2qOWnTYJ2brfIWlS2K8aSkXvYrXcy6s299eUPj2e7fLC2sTBHElek67pQ
 92Ebx9tyxh5xrlkn0zcFx9yv7L/bw1weOWWKHqLH8/frMyLnYie2JXW/Vdkt7Fow7Owq/rj+
 9mJJuMZ8aYv70339n8W1W84lVNlrRE9iiy2x0utl2T+QpWEbWmpdOva+W5/fJJ69OC4eB4e0
 U4ovXvRqvbM/8Tecfb4V29DxdvKV6KJj5hOFjeU98ZLP46g9j6uvmt+PVO8ufBpQZvtu3R4S
 Y5IpqQ9Xz1D/AciK5WV+BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsWy7bCSvG5/3OJ4gzmzZCzefXrKajH/yDlW
 i9UfHzNaXPn6ns1i+t5NbBYtsxaxWJw/v4HdYuvTNUwWZ5vesFtc3jWHzeJz7xFGi84vs9gs
 Lp5ytbjduILNYtLaqYwWZ595W7TuPcJu8e/aRhaLn7vmsVhsfnCMzUHE4/2NVnaPnbPusntc
 OveH2WPTqk42jzvX9rB53O8+zuTR2/yOzaNvyypGj8+b5AI4o7hsUlJzMstSi/TtErgy/j/+
 xF5w1qLiVFN5A+Ni3S5GTg4JAROJA5eOMnUxcnEICexmlGjtvcYOkZCUmHbxKHMXIweQLSxx
 +HAxRM1bRonX876xgdQIC6RKnF/QwQKSEBG4yyIx6cctNhCHWWAGo8SfDRvZIVq2MUrsftDL
 CtLCJqAlsf/FDbB2fgFFias/HjOC2LwCdhLtM96zgNgsAioST/Z+AqsRFQiT2LnkMRNEjaDE
 yZlPwGo4Bcwl3t1sAKthFlCX+DPvEjOELS5x68l8JghbXmL72znMExiFZyFpn4WkZRaSlllI
 WhYwsqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAiOey3NHYzbV33QO8TIxMF4iFGC
 g1lJhPeC36J4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rw3ChfGCQmkJ5akZqemFqQWwWSZODil
 Gpha1DM56gLVT7b6Prh9OPfQ3c9slb9iWQqaXPO/hnRxnFWvP//YfkngU22nTfdPtwUdLO3s
 Ne31DE6ft87ExuWhAcvzwOuvSm66hL79ElTI+MnzyOGXCzg7/CR/B/2fPVFtqdx3G7Fn8q9b
 ks6FKP5tbbh8oDvmmmZqpveV9Va3q73v6/O8Vv2wr2BJQzm30I960w061Usypihvrrb/3fO7
 pPnP2utmj+++nX2D+aVzcXvRD1kHZsOtwpt2/LvrY8l4xkWqfVOh+LGSjMa+6nlzFj8ofS3x
 ZlZh+fHJXM9M5f1ObP3afDB3vo+iXRNHE/sbsZlfPsgqiU5an/thz1O3eKkzy/uEn/ta3fi2
 dp0SS3FGoqEWc1FxIgDiON65agMAAA==
X-CMS-MailID: 20201105020815epcas1p34067ce27ad5804aba8a81f02c248c6d0
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201104165124epcas1p3fb886cc56ef8601329e9a76b7c403317
References: <20201104164923.21238-1-digetx@gmail.com>
 <CGME20201104165124epcas1p3fb886cc56ef8601329e9a76b7c403317@epcas1p3.samsung.com>
 <20201104164923.21238-46-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 11/5/20 1:49 AM, Dmitry Osipenko wrote:
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
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 96 +++++++++++++++++--------------
>  1 file changed, 54 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 38cc0d014738..4db027ca17e1 100644
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
> -
> -	return 0;
>  
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
> @@ -774,13 +767,22 @@ static struct devfreq_governor tegra_devfreq_governor = {
>  
>  static int tegra_devfreq_probe(struct platform_device *pdev)
>  {
> +	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
>  	struct tegra_devfreq_device *dev;
>  	struct tegra_devfreq *tegra;
> +	struct opp_table *opp_table;
>  	struct devfreq *devfreq;
>  	unsigned int i;
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
>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
>  	if (!tegra)
>  		return -ENOMEM;
> @@ -822,11 +824,31 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	tegra->opp_table = dev_pm_opp_get_opp_table(&pdev->dev);
> +	err = PTR_ERR_OR_ZERO(tegra->opp_table);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to prepare OPP table: %d\n", err);
> +		return err;
> +	}
> +
> +	opp_table = dev_pm_opp_set_supported_hw(&pdev->dev, &hw_version, 1);
> +	err = PTR_ERR_OR_ZERO(opp_table);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
> +		goto put_table;
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
> @@ -850,23 +872,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
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
> @@ -882,7 +887,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  
>  	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
> -	tegra_devfreq_profile.initial_freq /= KHZ;
>  
>  	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
>  				     "tegra_actmon", NULL);
> @@ -902,6 +906,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	reset_control_reset(tegra->reset);
>  disable_clk:
>  	clk_disable_unprepare(tegra->clock);
> +remove_table:
> +	dev_pm_opp_of_remove_table(&pdev->dev);
> +put_hw:
> +	dev_pm_opp_put_supported_hw(tegra->opp_table);
> +put_table:
> +	dev_pm_opp_put_opp_table(tegra->opp_table);
>  
>  	return err;
>  }
> @@ -913,11 +923,13 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
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
> +	dev_pm_opp_put_opp_table(tegra->opp_table);
> +
>  	return 0;
>  }
>  
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
