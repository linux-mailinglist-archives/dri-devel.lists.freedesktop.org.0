Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5FA2D08C1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 02:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DB989F97;
	Mon,  7 Dec 2020 01:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EE789F97
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 01:18:15 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201207011813epoutp044dd80915907247a389517c370f1e1ffd~OSmAYvQ4s2411524115epoutp04k
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 01:18:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201207011813epoutp044dd80915907247a389517c370f1e1ffd~OSmAYvQ4s2411524115epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607303893;
 bh=R6YhQOE3M+CfVudE0G4ymskj0c0R7p2I/IAq/vW4XxI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=jsKcwaOqewN9pEw5Wy/AXPgFXxnwiLlhkJoN3L6kqCw08+Av6jKIAFuQ/hqxODZXa
 j4uDvI36+2KDlq89dpOmetGIcTDMSTrT2gpOVkNNIRGL222taQX65bo831kp81i8rD
 EcVQd8hAFPhKkhKhg8znJ+ZsrXq9UMsNA7DWd2tw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201207011812epcas1p106676f3a6f58b6282cff82413a11ab1d~OSl-vXCos3244732447epcas1p1J;
 Mon,  7 Dec 2020 01:18:12 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.157]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Cq56B1N2dzMqYkv; Mon,  7 Dec
 2020 01:18:10 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 91.04.02418.2D28DCF5; Mon,  7 Dec 2020 10:18:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201207011809epcas1p3124acd8fe6ffd2eb9ff34267e8939e75~OSl8m_cUv1075810758epcas1p37;
 Mon,  7 Dec 2020 01:18:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201207011809epsmtrp1472f329c13c1e28a72c18fcfa7343d7e~OSl8lGBd71882218822epsmtrp15;
 Mon,  7 Dec 2020 01:18:09 +0000 (GMT)
X-AuditID: b6c32a35-c23ff70000010972-36-5fcd82d227f1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 55.02.13470.1D28DCF5; Mon,  7 Dec 2020 10:18:09 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201207011809epsmtip2247c50f337957e050ac5783d70302f82~OSl8Px-xL0365903659epsmtip2R;
 Mon,  7 Dec 2020 01:18:09 +0000 (GMT)
Subject: Re: [PATCH v11 09/10] PM / devfreq: tegra30: Support interconnect
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
Message-ID: <42927892-d4a7-9368-480b-14c0d06e7116@samsung.com>
Date: Mon, 7 Dec 2020 10:32:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201203192439.16177-10-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFJsWRmVeSWpSXmKPExsWy7bCmge6lprPxBkePslq8+/SU1WL+kXOs
 Fqs/Pma0uPL1PZvF9L2b2CxaZi1isTh/fgO7xdana5gszja9Ybe4vGsOm8Xn3iOMFp1fZrFZ
 XDzlanG7cQWbxaS1Uxktzj7ztmjde4Td4t+1jSwWP3fNY7HY/OAYm4OIx/sbreweO2fdZfe4
 dO4Ps8emVZ1sHneu7WHzuN99nMmjt/kdm0ffllWMHp83yQVwRmXbZKQmpqQWKaTmJeenZOal
 2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gB9pqRQlphTChQKSCwuVtK3synKLy1J
 VcjILy6xVUotSMkpsCzQK07MLS7NS9dLzs+1MjQwMDIFKkzIzvi2sY25YINRRfdCnwbGWRpd
 jJwcEgImEotPb2fvYuTiEBLYwSgx9cJqKOcTo8Tns9NYIZxvjBLX5y1mhWm5evkDVNVeRonf
 U78xQTjvGSWWXFkNVMXBISyQJjGhpxgkLiJwk0Vi+Yp/bCDdzAIzGCXu7FEGsdkEtCT2v7gB
 FucXUJS4+uMxI4jNK2An8XxDE1icRUBFom/XcyYQW1QgTOLkthaoGkGJkzOfsIDYnALmEp+3
 zGSEmC8ucevJfCYIW15i+9s5zBBXz+aUOHIqE8J2kTjffw0qLizx6vgWdghbSuJlfxuUXS2x
 8uQRNpAHJAQ6GCW27L8A9b6xxP6lk5lAnmQW0JRYv0sfIqwosfP3XKgb+CTefe0Bh4OEAK9E
 R5sQRImyxOUHd5kgbEmJxe2dbBMYlWYh+WYWkg9mIflgFsKyBYwsqxjFUguKc9NTiw0LDJEj
 exMjONFrme5gnPj2g94hRiYOxkOMEhzMSiK8alJn44V4UxIrq1KL8uOLSnNSiw8xmgLDdyKz
 lGhyPjDX5JXEG5oaGRsbW5gYmpkaGiqJ8/7R7ogXEkhPLEnNTk0tSC2C6WPi4JRqYIqZqvbW
 QyPNeFpn3ZKXC6ynzpVJbDu0d4rfDNGH7pfq18zjn7rmwafJMyVjBJzeesVmFTx/5buuTf6p
 5V3uVx/aFOx31ljxVOqlt156anH7gdQ92yab2ORVf2/Hb+H48+yyo+vnn/s2bpJfblg8sf05
 Z/jlkhwZV46rcidbj97o7PP7uGylYI0MB2cI97lnXfMCInemO03sD/q51dzorKd/1bLGcgHR
 c68Ywk7WtbI+yo7IaDHjDRPYxBJ4j3fXDa001UpN+cnsUVIpHH9qSkJmaZoxfzUL3p4rEZBi
 ePl5hW7/6dabAZ0GL3KU+P+tOL9zffJsFlXPvpOx2QF6nf1zC6eJMCWLGc7/bR+nxFKckWio
 xVxUnAgA0XZZXH0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsWy7bCSvO7FprPxBiuPSFi8+/SU1WL+kXOs
 Fqs/Pma0uPL1PZvF9L2b2CxaZi1isTh/fgO7xdana5gszja9Ybe4vGsOm8Xn3iOMFp1fZrFZ
 XDzlanG7cQWbxaS1Uxktzj7ztmjde4Td4t+1jSwWP3fNY7HY/OAYm4OIx/sbreweO2fdZfe4
 dO4Ps8emVZ1sHneu7WHzuN99nMmjt/kdm0ffllWMHp83yQVwRnHZpKTmZJalFunbJXBlfNvY
 xlywwaiie6FPA+MsjS5GTg4JAROJq5c/sHcxcnEICexmlPjQs5wJIiEpMe3iUeYuRg4gW1ji
 8OFiiJq3jBI7d+5gA6kRFkiTaJg4lwUkISJwl0Vi0o9bbCAOs8AMRok/GzZCjd3GKHHwRS8r
 SAubgJbE/hc3wNr5BRQlrv54zAhi8wrYSTzf0AQWZxFQkejb9RzsDFGBMImdSx4zQdQISpyc
 +YQFxOYUMJf4vGUmWC+zgLrEn3mXmCFscYlbT+YzQdjyEtvfzmGewCg8C0n7LCQts5C0zELS
 soCRZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnDca2nuYNy+6oPeIUYmDsZDjBIc
 zEoivGpSZ+OFeFMSK6tSi/Lji0pzUosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRq
 YGrTU3NiYKnPyTm2oz/+RUOt3otLtY3XZm09dur0uy+vXysdkrqkOif0xifxPT/3zdb4+/Nz
 b2iBr5jP8l0KFWxNBg+lPxUVvzm53mrF05YHsmGn/BONP6h0iF/Y1GMWp/zIa0d8zy1Z6YJT
 jwvms+wxib1yZtEPY5Y7zWY/px3tmHjdx3vTHpMjcp/anOYKM7atqvu60fOERscm8YOd0bGv
 mvuKlog/O96joNLEx7Gf6eSN6E//PicxXy09WL2qz/pwzbNiblOh1G7J5dYz2TdPqXiX7Jmh
 rKNx4fOz16L/UlV/LGF8Iih1bfKdQ/O4u6bItvlNudTelCnFoKXn7Ttdzebz31kuV+N8D3ne
 VVdiKc5INNRiLipOBABoDeQ/agMAAA==
X-CMS-MailID: 20201207011809epcas1p3124acd8fe6ffd2eb9ff34267e8939e75
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201203192723epcas1p372e53c3e1443b7cd3010c44faff735ec
References: <20201203192439.16177-1-digetx@gmail.com>
 <CGME20201203192723epcas1p372e53c3e1443b7cd3010c44faff735ec@epcas1p3.samsung.com>
 <20201203192439.16177-10-digetx@gmail.com>
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

On 12/4/20 4:24 AM, Dmitry Osipenko wrote:
> This patch moves ACTMON driver away from generating OPP table by itself,
> transitioning it to use the table which comes from device-tree. This
> change breaks compatibility with older device-trees and brings support
> for the interconnect framework to the driver. This is a mandatory change
> which needs to be done in order to implement interconnect-based memory
> DVFS, i.e. device-trees need to be updated. Now ACTMON issues a memory
> bandwidth requests using dev_pm_opp_set_bw() instead of driving EMC clock
> rate directly.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 79 +++++++++++++++----------------
>  1 file changed, 37 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 38cc0d014738..145ef91ae092 100644
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
> @@ -822,11 +816,25 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
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
> @@ -850,23 +858,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
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
> @@ -882,7 +873,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  
>  	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
> -	tegra_devfreq_profile.initial_freq /= KHZ;
>  
>  	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
>  				     "tegra_actmon", NULL);
> @@ -902,6 +892,10 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
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
> @@ -913,11 +907,12 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
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
> 

Applied it. Thanks for your work for a long time.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
