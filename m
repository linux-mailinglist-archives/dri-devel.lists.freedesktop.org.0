Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735B2C003D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 07:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A188C89B7D;
	Mon, 23 Nov 2020 06:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B6689B7D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:48:13 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201123064811epoutp012c26e6568d304d0a89d5998a93635eff~KEEG0dbRj1815218152epoutp013
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:48:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201123064811epoutp012c26e6568d304d0a89d5998a93635eff~KEEG0dbRj1815218152epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606114091;
 bh=lcDKjZ+U9Db0F5hQBrE+mcrhjCcbBQBIaAD7QPcR3f8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=nPyloAzS+v99deEmI+Wp92vJoD7j5PG56gvyZNejG68GezGSsVE7749/DmwNauPNl
 RBd+BOKhs0GQW22oZZ27oqkk0MbJBrZA7wk9TfMfkNe0jqsSGtu3sQ/mZEiyxTI3Gu
 s7o3jY7CvttSqRoEVZ8GZMGjiFtupum/afC8r+JA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201123064810epcas1p22a9009c2e8120e6af8c22e6d80d2fdf7~KEEGA3qmZ1393413934epcas1p2g;
 Mon, 23 Nov 2020 06:48:10 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.156]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Cfd5N0phNzMqYkk; Mon, 23 Nov
 2020 06:48:08 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 4B.67.10463.72B5BBF5; Mon, 23 Nov 2020 15:48:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201123064807epcas1p2e110146738744eadc501ee5de8ca2483~KEEDSG57W2090020900epcas1p2l;
 Mon, 23 Nov 2020 06:48:07 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201123064807epsmtrp2355cdb6e88910663d4c54d4a9b0d17b8~KEEDRC4Ec1092710927epsmtrp2R;
 Mon, 23 Nov 2020 06:48:07 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-d9-5fbb5b27a2c2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 60.C9.08745.72B5BBF5; Mon, 23 Nov 2020 15:48:07 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201123064807epsmtip13f76a1dea9f3c57e2923becaa965bc42~KEECuk7og1625516255epsmtip12;
 Mon, 23 Nov 2020 06:48:07 +0000 (GMT)
Subject: Re: [PATCH v10 11/19] PM / devfreq: tegra20: Deprecate in a favor
 of emc-stat based driver
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
Message-ID: <8b173eba-1587-19e3-296a-84f3c88ee96c@samsung.com>
Date: Mon, 23 Nov 2020 16:02:26 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201123002723.28463-12-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1BUVRzHPfcud+86s3hZMI4UBpdRAgfkuqweHFCmpFaJYjIb03GWDe4s
 O+xr9pFANWm4vEFXImxbEOlFS4yysAgrG7SQDDYGoRHyGCDBIR+QkmXCOLFcm/jv8/v9vr/z
 O9/zIHHRDBFEKjVGVq+Rq2hiLa+1OyIqKvzwJVnM4+l4NPdgxgc13L8J0PWH8wSqcjsIdMJa
 x0P9/Rf4yDnzLYaufnSXj665bARaKOsBqOhPK4F+vpKERo/XE+h0YyVAV28lI7O7h4+eDDXx
 0D+uGh5qnrxMJPpL54fNfGm7dZwvHfxpCZc67EWEdGyog5BOlPRi0rK8OUJa3mIH0gXHxlTB
 oaz4TFaewepDWE26NkOpUSTQyftlL8kk22OYKCYO7aBDNHI1m0DveTU16mWlatkUHfKuXGVa
 TqXKDQZ66654vdZkZEMytQZjAs3qMlS6OF20Qa42mDSK6HSteicTE7NNsixMy8r8rmIS1xW/
 km3uyyOOgf64YiAgIRULGxvLQTFYS4qoNgC7LGaCCx4AWGCvehosADjen48XA3KlpbLLj8u7
 AFy0NPC5YB5A6+NOzLuuP8XCU7YO3FsIoG7w4Nf1TwhvN07lQsdSsldDUJGwc3aY8PI6KhT+
 8ugm8LKQ2gX/Pn+O52UetQmOTD3Cvbyeegv2tZ54qvGDfZ9Or2gE1A44X/ubj5dxKhCOTJ/F
 OH4eXrxnW9kDpE4K4EzpxxjnYA90Dio5//7wdm8Ln+MguDDnJjh+D37T10NwvYUAtnQO+HAF
 Mez8sgLjvETA866tXDoUti9WA26uL5x7WOrDjRLCwnwRJwmD1ybHMY43wM8LiohTgLaucmNd
 5cC6yoH1/2G1gGcHz7A6g1rBGhhd7OrLdoCV9x6J2kD1vT+iPQAjgQdAEqcDhOaN7TKRMEOe
 k8vqtTK9ScUaPECyfL4WPGh9unb5w2iMMkayTSwWo1hmu4Rh6EDh0pZCmYhSyI1sFsvqWP1/
 fRgpCDqGve5s/7VvNz+tMZ/uUPcczVOQqRN4hItJnHIXqfZ2Zee87b585MPmizMpmGu41BPd
 PbgvxnHHUz15+B2TOMK3Tv/i2Ce295dYUU2wc/OPwtNfJDW1zuY0+VW1hGfvrqjZ+dWByCt3
 xPXG/LGAfWbPqKb4oL6yaWJ4TdJs6O3AEnViyobPLGPDUw2tYf5TA3fPbTrYm21brHsj8f7Z
 sjcPrbFHVRdIkybHlKOSklu67/+qv27RNR3JrbJdYo6yRSnNpL+D6B4fKHd2lTy32F/KlJel
 DB3/3enX+kHwgdciz0yEkls2074XTOGWoGc7EoiwdW3BvUgh+CFz5Ia7dvqFqv1pNM+QKWci
 cb1B/i+6UtxYeAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsWy7bCSnK569O54gyPv5SzefXrKarH642NG
 iytf37NZTN+7ic2iZdYiFovz5zewW2x9uobJ4mzTG3aLy7vmsFl87j3CaNH5ZRabxcVTrha3
 G1ewWUxaO5XR4uwzb4vWvUfYLf5d28hi8XPXPBaLzQ+OsTkIe7y/0crusXPWXXaPS+f+MHts
 WtXJ5nHn2h42j/vdx5k8epvfsXn0bVnF6PF5k1wAZxSXTUpqTmZZapG+XQJXxr7JD5gLutwr
 Wk82szUwnrfsYuTgkBAwkZh6QLCLkZNDSGAHo0TDoUgQW0JAUmLaxaPMECXCEocPF3cxcgGV
 vGWUaLu7lhWkRlggVWLD212MIAkRgbssEpN+3GIDSTALVEksXLuYDWLoNkaJLX25IDabgJbE
 /hc3wOL8AooSV388ZgSxeQXsJL6vX8gCYrMIqErceviDGcQWFQiT2LnkMRNEjaDEyZlPwGo4
 Bcwl3i94xAqxS13iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSehaR9FpKWWUhaZiFpWcDIsopR
 MrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzjOtbR2MO5Z9UHvECMTB+MhRgkOZiUR3la5
 nfFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeb/OWhgnJJCeWJKanZpakFoEk2Xi4JRqYGrdwsNh
 2cDOc/YS/6HMhZuTa9auu1Xa+UsyOXvv/RkeF42T7u/f9NF2a5mtwuKFXU78mo83GayRDuQ5
 3C/7cX572wtuPgGedSzGMzMFNVR2p+431xPn1mex2jy1xPzd5YV6ummLbsYV3lbb8yI1cWnU
 nQ1XbrxeolEewKRZm/77ZdWfW0/zLmnt+/dq7rLqDq2t1/f2ZfxsmTmnIydK0dY/992KRW18
 WUopF8VZn5QuZsx49UPrgnLJI8l4I6uIXX9u1wscuPhKTeX2QYPpjozfau95m9Xd+7dOwOyf
 xPzODx0dUq9TfbJneZ7pu7WaP/Dw4uS4OxYlkzKXxkj8Whtim8dQfLvx+qnDD1skvZVYijMS
 DbWYi4oTAYThl0ZiAwAA
X-CMS-MailID: 20201123064807epcas1p2e110146738744eadc501ee5de8ca2483
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201123003309epcas1p4b8eead07cefc84537160a2b867d61ee7
References: <20201123002723.28463-1-digetx@gmail.com>
 <CGME20201123003309epcas1p4b8eead07cefc84537160a2b867d61ee7@epcas1p4.samsung.com>
 <20201123002723.28463-12-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/20 9:27 AM, Dmitry Osipenko wrote:
> Remove tegra20-devfreq in order to replace it with a EMC_STAT based
> devfreq driver. Previously we were going to use MC_STAT based
> tegra20-devfreq driver because EMC_STAT wasn't working properly, but
> now that problem is resolved. This resolves complications imposed by
> the removed driver since it was depending on both EMC and MC drivers
> simultaneously.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  MAINTAINERS                       |   1 -
>  drivers/devfreq/Kconfig           |  10 --
>  drivers/devfreq/Makefile          |   1 -
>  drivers/devfreq/tegra20-devfreq.c | 210 ------------------------------
>  4 files changed, 222 deletions(-)
>  delete mode 100644 drivers/devfreq/tegra20-devfreq.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f10105cac6f..56c560320f00 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11370,7 +11370,6 @@ L:	linux-pm@vger.kernel.org
>  L:	linux-tegra@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
>  S:	Maintained
> -F:	drivers/devfreq/tegra20-devfreq.c
>  F:	drivers/devfreq/tegra30-devfreq.c
>  
>  MEMORY MANAGEMENT
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

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
