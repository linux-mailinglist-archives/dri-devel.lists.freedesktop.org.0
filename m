Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7845C2A7548
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 03:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442396E96C;
	Thu,  5 Nov 2020 02:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7156E96C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:11:36 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201105021134epoutp049c7d25928dc6f5b00f5079ff0b664d4d~EerdMvWCA1407014070epoutp04K
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:11:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201105021134epoutp049c7d25928dc6f5b00f5079ff0b664d4d~EerdMvWCA1407014070epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604542294;
 bh=bLCu3+OUvhKy8kWgr2odzuoXhqfmbxQmyfZ7LRPN5v8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FaI8i4UxSk5Vn/OuXmA/VnowEYORLbyzobDGqjEfYKcMAJ8dNcNv3uxMcQvLx89o4
 TSxLfFqqotwJE+FDqupyor3haSOwi29ZIbJcmyORN+tehXEmyAL4Svc5h4B0z/d4Zi
 z1Nn1yiH/8lVgZc6/dEFRWEbwBS+0ZlQb+NCEz9U=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201105021133epcas1p4593df0a41f66575c31e10c2d72bab9e8~EercNhzk_2401224012epcas1p4o;
 Thu,  5 Nov 2020 02:11:33 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CRRpW0lGvzMqYks; Thu,  5 Nov
 2020 02:11:31 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 88.D9.10463.05F53AF5; Thu,  5 Nov 2020 11:11:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201105021127epcas1p281f316c62893cf1e2fb86660743c31cc~EerWTYYp21753817538epcas1p22;
 Thu,  5 Nov 2020 02:11:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201105021127epsmtrp12b9e2414db86e817af789bc67579c602~EerWSiE0J0352003520epsmtrp10;
 Thu,  5 Nov 2020 02:11:27 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-7c-5fa35f504fb0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 83.CF.13470.F4F53AF5; Thu,  5 Nov 2020 11:11:27 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201105021127epsmtip20c85438cc55f7233717fc2451e44efb2~EerV3lMfS1061210612epsmtip2O;
 Thu,  5 Nov 2020 02:11:27 +0000 (GMT)
Subject: Re: [PATCH v7 47/47] PM / devfreq: tegra20: Deprecate in a favor of
 emc-stat based driver
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
Message-ID: <cdceb3f7-9c58-5d2c-70ab-7947b4cb173e@samsung.com>
Date: Thu, 5 Nov 2020 11:25:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201104164923.21238-48-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUVRzu3Hv37q7T2mUBPeDE49IMA7Swy8tDI6agtWQF1eQUf7Rd2QvL
 sI87u0sRVGIigUokPaiNV2hKQIUrLxFmG56iPFYgQpNAQUXjpWZpGLbL1Yn/vu/7/b7zO995
 iHDpH6SnKFVvZo16RkuTa4jGjoBgWYLqsEqeUydD87euCFB554AA1dycAmjkzgKJitusJMqx
 VBJocLBOiBqu1GKo/6NZIRpuKSHR7YJOgPL/tJDo3Jnt6Lc9VSQq+uELgPqv7kD72jqFaHn0
 OIHutZQR6MRkN7nFTbkwtk+oPGkZFyqHBu7jSmt1Pqm8ONpKKicO9GDKgr3zpPKT+mqgvG31
 ShAnpm3SsIyaNfqw+iSDOlWfEk3veE0Vq4qIlCtkiii0kfbRMzo2mt72YoLsuVStIxnt8w6j
 TXdICYzJRIds3mQ0pJtZH43BZI6mWU6t5aK4YBOjM6XrU4KTDLpnFHJ5aISj8e00TW1dHeDK
 4jKmPr+KZ4OxqP1ALIJUOMy/W4vvB2tEUqoZwNlrlzCe3AKwqOMByZO/AGy9uYQ/spzNrQN8
 oQ3AqYplAU8WAJzoK3MQkciVUsP2nACn7kadJ+CxqmXS6caprwC82OrnxCQVCG0zYyv6E5Qv
 /OXuFHB6JdRmuHSecMoE9RQ8UnVM4MTu1E7Y25gDnFhCucDer6dXesTURnjZfoHgl18PL0yX
 Yzz2hk1zJSvZIPWNGM582w/4BNtgqe36wzSu8EZPvZDHnvB6Ye5DnAW/7+0keXMegPU2u4Av
 hEHbd59hzo3iVAD8qSWEl33hyaVSwA9eC+fvHFw5B0hJYF6ulG/xg8OT4xiPPeDhj/PJTwFt
 WRXHsiqCZVUEy//DKgBRDdaxnEmXwpoUXPjq27aClVcfiJpB6dxicDvARKAdQBFOu0nsL1eq
 pBI1814mazSojOla1tQOIhwHfAj3dE8yOL6N3qxSRISGhYWhcEVkhEJBr5fcD8pTSakUxsym
 sSzHGh/5MJHYMxt7elEX7vvkBq23LPr3F7ZWrF0s9h7wP9D8L3XZPnnDun0pLjNqYYjLeP20
 NqnngwahOmbPtGuhxlOGZf5YFr67012TVlssXXxeFFrQoG4T7E5OLBlRto76/7w44R8pbnj1
 73Uuha+cmRz7p8srH++z5Q4ln33QNVoT0vC4m/L9AEVXsscJ8ujgnC1rNmbXFsF4GPahXy4z
 It+QOCM9fSq0Eh30k+2qDykiPMo0IXFV5YceG1BvfTZm7pzwlMelpr43Jt60au7Fcl/66V0F
 Qfap6RbAmcVNc3a3ve3XYkfij2ZLhpO65V7Zv3akxJu7qSMuxxvj383iaqQz8UHNPm9lvLST
 JkwaRhGIG03Mf3RQLpx+BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsWy7bCSvK5//OJ4gykd4hbvPj1ltZh/5Byr
 xeqPjxktrnx9z2Yxfe8mNouWWYtYLM6f38BusfXpGiaLs01v2C0u75rDZvG59wijReeXWWwW
 F0+5WtxuXMFmMWntVEaLs8+8LVr3HmG3+HdtI4vFz13zWCw2PzjG5iDi8f5GK7vHzll32T0u
 nfvD7LFpVSebx51re9g87ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZazZs
 YCyY51nxeMoz5gbGG5ZdjJwcEgImEqfbNjB2MXJxCAnsZpT43/6QFSIhKTHt4lHmLkYOIFtY
 4vDhYoiat4wS5+6eYQeJCwukSBxq0QSJiwjcZZGY9OMWG4jDLDCDUeLPho3sEB3bGCV2nPnE
 BDKVTUBLYv+LG2wgNr+AosTVH48ZQSbxCthJ/L7JAhJmEVCRWLJiOdgRogJhEjuXPAZr5RUQ
 lDg58wlYDaeAucSjC7fAbGYBdYk/8y4xQ9jiEreezGeCsOUltr+dwzyBUXgWkvZZSFpmIWmZ
 haRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4KjX0tzBuH3VB71DjEwcjIcY
 JTiYlUR4L/gtihfiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6NwYZyQQHpiSWp2ampBahFMlomD
 U6qBSeF76hS307OeGAmrhwWqLD8p93jq4ZSa3zO3MTWU3418Gd7taxXF0epbn13t2L2Tb1LV
 3sUSC7e+LWOUunT1amFuEfvmx9rmQese5Jmw5eW/yz/7evspzqZbuu2rzH5dtjW9nnI7z2qx
 jR/zhHuP2A3+/0vJ7csxyAvQzL179cPv4ND2y3LaG37xLN5Vy5qds/KW0APppcxzZgdpP7qt
 N7HU3GaRdLmlIutNkaZN2z6+j/wZeE1On+GB5MaX794++FSXmHJS3F373h+x/C/PzPd1vrmy
 wJ3xu6nws1gFMZ6VRRdT8nPWbvDme7LrEfvFf40ZShee5jpwHroo/rG2Is12Oeu7iRk1Le8C
 8xPblViKMxINtZiLihMBHAR1/2kDAAA=
X-CMS-MailID: 20201105021127epcas1p281f316c62893cf1e2fb86660743c31cc
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201104165117epcas1p1fe44f76f99454bcbbbf8b26882422224
References: <20201104164923.21238-1-digetx@gmail.com>
 <CGME20201104165117epcas1p1fe44f76f99454bcbbbf8b26882422224@epcas1p1.samsung.com>
 <20201104164923.21238-48-digetx@gmail.com>
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

You need to update the MAINTAINERS file about tegra20-devfreq.c

11343 MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA                               
11344 M:      Dmitry Osipenko <digetx@gmail.com>                                      
11345 L:      linux-pm@vger.kernel.org                                                
11346 L:      linux-tegra@vger.kernel.org                                             
11347 T:      git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git     
11348 S:      Maintained                                                              
11349 F:      drivers/devfreq/tegra20-devfreq.c                                       
11350 F:      drivers/devfreq/tegra30-devfreq.c 

Except of missing the updating of MAINTAINERS,
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi

On 11/5/20 1:49 AM, Dmitry Osipenko wrote:
> Remove tegra20-devfreq in order to replace it with a EMC_STAT based
> devfreq driver. Previously we were going to use MC_STAT based
> tegra20-devfreq driver because EMC_STAT wasn't working properly, but
> now that problem is resolved. This resolves complications imposed by
> the removed driver since it was depending on both EMC and MC drivers
> simultaneously.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/Kconfig           |  10 --
>  drivers/devfreq/Makefile          |   1 -
>  drivers/devfreq/tegra20-devfreq.c | 210 ------------------------------
>  3 files changed, 221 deletions(-)
>  delete mode 100644 drivers/devfreq/tegra20-devfreq.c
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 0ee36ae2fa79..00704efe6398 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -121,16 +121,6 @@ config ARM_TEGRA_DEVFREQ
>  	  It reads ACTMON counters of memory controllers and adjusts the
>  	  operating frequencies and voltages with OPP support.
>  
> -config ARM_TEGRA20_DEVFREQ
> -	tristate "NVIDIA Tegra20 DEVFREQ Driver"
> -	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
> -	depends on COMMON_CLK
> -	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> -	help
> -	  This adds the DEVFREQ driver for the Tegra20 family of SoCs.
> -	  It reads Memory Controller counters and adjusts the operating
> -	  frequencies and voltages with OPP support.
> -
>  config ARM_RK3399_DMC_DEVFREQ
>  	tristate "ARM RK3399 DMC DEVFREQ Driver"
>  	depends on (ARCH_ROCKCHIP && HAVE_ARM_SMCCC) || \
> diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> index 3ca1ad0ecb97..a16333ea7034 100644
> --- a/drivers/devfreq/Makefile
> +++ b/drivers/devfreq/Makefile
> @@ -13,7 +13,6 @@ obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
>  obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
>  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
>  obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
> -obj-$(CONFIG_ARM_TEGRA20_DEVFREQ)	+= tegra20-devfreq.o
>  
>  # DEVFREQ Event Drivers
>  obj-$(CONFIG_PM_DEVFREQ_EVENT)		+= event/
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> deleted file mode 100644
> index fd801534771d..000000000000
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ /dev/null
> @@ -1,210 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * NVIDIA Tegra20 devfreq driver
> - *
> - * Copyright (C) 2019 GRATE-DRIVER project
> - */
> -
> -#include <linux/clk.h>
> -#include <linux/devfreq.h>
> -#include <linux/io.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm_opp.h>
> -#include <linux/slab.h>
> -
> -#include <soc/tegra/mc.h>
> -
> -#include "governor.h"
> -
> -#define MC_STAT_CONTROL				0x90
> -#define MC_STAT_EMC_CLOCK_LIMIT			0xa0
> -#define MC_STAT_EMC_CLOCKS			0xa4
> -#define MC_STAT_EMC_CONTROL			0xa8
> -#define MC_STAT_EMC_COUNT			0xb8
> -
> -#define EMC_GATHER_CLEAR			(1 << 8)
> -#define EMC_GATHER_ENABLE			(3 << 8)
> -
> -struct tegra_devfreq {
> -	struct devfreq *devfreq;
> -	struct clk *emc_clock;
> -	void __iomem *regs;
> -};
> -
> -static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
> -				u32 flags)
> -{
> -	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
> -	struct devfreq *devfreq = tegra->devfreq;
> -	struct dev_pm_opp *opp;
> -	unsigned long rate;
> -	int err;
> -
> -	opp = devfreq_recommended_opp(dev, freq, flags);
> -	if (IS_ERR(opp))
> -		return PTR_ERR(opp);
> -
> -	rate = dev_pm_opp_get_freq(opp);
> -	dev_pm_opp_put(opp);
> -
> -	err = clk_set_min_rate(tegra->emc_clock, rate);
> -	if (err)
> -		return err;
> -
> -	err = clk_set_rate(tegra->emc_clock, 0);
> -	if (err)
> -		goto restore_min_rate;
> -
> -	return 0;
> -
> -restore_min_rate:
> -	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
> -
> -	return err;
> -}
> -
> -static int tegra_devfreq_get_dev_status(struct device *dev,
> -					struct devfreq_dev_status *stat)
> -{
> -	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
> -
> -	/*
> -	 * EMC_COUNT returns number of memory events, that number is lower
> -	 * than the number of clocks. Conversion ratio of 1/8 results in a
> -	 * bit higher bandwidth than actually needed, it is good enough for
> -	 * the time being because drivers don't support requesting minimum
> -	 * needed memory bandwidth yet.
> -	 *
> -	 * TODO: adjust the ratio value once relevant drivers will support
> -	 * memory bandwidth management.
> -	 */
> -	stat->busy_time = readl_relaxed(tegra->regs + MC_STAT_EMC_COUNT);
> -	stat->total_time = readl_relaxed(tegra->regs + MC_STAT_EMC_CLOCKS) / 8;
> -	stat->current_frequency = clk_get_rate(tegra->emc_clock);
> -
> -	writel_relaxed(EMC_GATHER_CLEAR, tegra->regs + MC_STAT_CONTROL);
> -	writel_relaxed(EMC_GATHER_ENABLE, tegra->regs + MC_STAT_CONTROL);
> -
> -	return 0;
> -}
> -
> -static struct devfreq_dev_profile tegra_devfreq_profile = {
> -	.polling_ms	= 500,
> -	.target		= tegra_devfreq_target,
> -	.get_dev_status	= tegra_devfreq_get_dev_status,
> -};
> -
> -static struct tegra_mc *tegra_get_memory_controller(void)
> -{
> -	struct platform_device *pdev;
> -	struct device_node *np;
> -	struct tegra_mc *mc;
> -
> -	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra20-mc-gart");
> -	if (!np)
> -		return ERR_PTR(-ENOENT);
> -
> -	pdev = of_find_device_by_node(np);
> -	of_node_put(np);
> -	if (!pdev)
> -		return ERR_PTR(-ENODEV);
> -
> -	mc = platform_get_drvdata(pdev);
> -	if (!mc)
> -		return ERR_PTR(-EPROBE_DEFER);
> -
> -	return mc;
> -}
> -
> -static int tegra_devfreq_probe(struct platform_device *pdev)
> -{
> -	struct tegra_devfreq *tegra;
> -	struct tegra_mc *mc;
> -	unsigned long max_rate;
> -	unsigned long rate;
> -	int err;
> -
> -	mc = tegra_get_memory_controller();
> -	if (IS_ERR(mc)) {
> -		err = PTR_ERR(mc);
> -		dev_err(&pdev->dev, "failed to get memory controller: %d\n",
> -			err);
> -		return err;
> -	}
> -
> -	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
> -	if (!tegra)
> -		return -ENOMEM;
> -
> -	/* EMC is a system-critical clock that is always enabled */
> -	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(tegra->emc_clock))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->emc_clock),
> -				     "failed to get emc clock\n");
> -
> -	tegra->regs = mc->regs;
> -
> -	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
> -
> -	for (rate = 0; rate <= max_rate; rate++) {
> -		rate = clk_round_rate(tegra->emc_clock, rate);
> -
> -		err = dev_pm_opp_add(&pdev->dev, rate, 0);
> -		if (err) {
> -			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
> -			goto remove_opps;
> -		}
> -	}
> -
> -	/*
> -	 * Reset statistic gathers state, select global bandwidth for the
> -	 * statistics collection mode and set clocks counter saturation
> -	 * limit to maximum.
> -	 */
> -	writel_relaxed(0x00000000, tegra->regs + MC_STAT_CONTROL);
> -	writel_relaxed(0x00000000, tegra->regs + MC_STAT_EMC_CONTROL);
> -	writel_relaxed(0xffffffff, tegra->regs + MC_STAT_EMC_CLOCK_LIMIT);
> -
> -	platform_set_drvdata(pdev, tegra);
> -
> -	tegra->devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
> -					    DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
> -	if (IS_ERR(tegra->devfreq)) {
> -		err = PTR_ERR(tegra->devfreq);
> -		goto remove_opps;
> -	}
> -
> -	return 0;
> -
> -remove_opps:
> -	dev_pm_opp_remove_all_dynamic(&pdev->dev);
> -
> -	return err;
> -}
> -
> -static int tegra_devfreq_remove(struct platform_device *pdev)
> -{
> -	struct tegra_devfreq *tegra = platform_get_drvdata(pdev);
> -
> -	devfreq_remove_device(tegra->devfreq);
> -	dev_pm_opp_remove_all_dynamic(&pdev->dev);
> -
> -	return 0;
> -}
> -
> -static struct platform_driver tegra_devfreq_driver = {
> -	.probe		= tegra_devfreq_probe,
> -	.remove		= tegra_devfreq_remove,
> -	.driver		= {
> -		.name	= "tegra20-devfreq",
> -	},
> -};
> -module_platform_driver(tegra_devfreq_driver);
> -
> -MODULE_ALIAS("platform:tegra20-devfreq");
> -MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
> -MODULE_DESCRIPTION("NVIDIA Tegra20 devfreq driver");
> -MODULE_LICENSE("GPL v2");
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
