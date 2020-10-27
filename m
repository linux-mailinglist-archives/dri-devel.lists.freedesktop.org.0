Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5F529A916
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 11:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DFF6E1B8;
	Tue, 27 Oct 2020 10:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713CF6E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:09:56 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id w25so819460edx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 03:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bLSxqWlRWeWmLdqmeHTbNCMyQV0CNePnET7TnJ4RmSM=;
 b=WQeC20UWYYvuPZ0NSQqbHzIsi+CQe48Grch6PznNaIj16m81L6FrjcQmIt+Hh06Mal
 stLOoALFXAZsVeaUT5NGQ7JImFWkEFvgaKv8PLnPMeVe6AHPet6V/y1WqIYZuN2g5Nr1
 j6fkcDs1Fo57a2d4ecA4p7VirtqGFhWi1t9iPf+ssX+IOc+brew4xB0D+MuqSka1QRnW
 zupCsk7NEmZbDeHN4+xwknZqyFDU15ecNhJSR8WH+tm4U0KwT3VoLj5WqO+zLToH+rwz
 ps+pdYN+MwaCzVt2T1FCTgScr7qHMGeV0JPV9BAqTvpu+DI0VEKwpcrHsSkeCe/esbyQ
 Rzww==
X-Gm-Message-State: AOAM533wTuPo7JoabjEc2Q+3nIPHNOBpeRhdxA3YpSiyZHCXcg0+uNMn
 NgLAB9Map8zQMkElIdXtqDA=
X-Google-Smtp-Source: ABdhPJydgamypsr6hBaDut2KCeh7NMWQzr0HQ9Xs5NCEX26/MJBL1bCkARqcSZWGa7SESvWc6DpjJg==
X-Received: by 2002:a50:f785:: with SMTP id h5mr1327577edn.249.1603793395015; 
 Tue, 27 Oct 2020 03:09:55 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id dp1sm739361ejc.74.2020.10.27.03.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 03:09:53 -0700 (PDT)
Date: Tue, 27 Oct 2020 11:09:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 33/52] memory: tegra20: Support interconnect framework
Message-ID: <20201027100951.GA17089@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-34-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-34-digetx@gmail.com>
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
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:17:16AM +0300, Dmitry Osipenko wrote:
> Now Internal and External Memory Controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |   3 +-
>  drivers/memory/tegra/mc.h          |  12 ++
>  drivers/memory/tegra/tegra20-emc.c | 176 +++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra20.c     |  34 ++++++
>  4 files changed, 224 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index ff426747cd7d..ac3dfe155505 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -11,7 +11,8 @@ config TEGRA_MC
>  config TEGRA20_EMC
>  	tristate "NVIDIA Tegra20 External Memory Controller driver"
>  	default y
> -	depends on ARCH_TEGRA_2x_SOC
> +	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
> +	select PM_OPP
>  	help
>  	  This driver is for the External Memory Controller (EMC) found on
>  	  Tegra20 chips. The EMC controls the external DRAM on the board.
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index abeb6a2cc36a..531fb4fb7b17 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -78,6 +78,18 @@
>  
>  #define MC_TIMING_UPDATE				BIT(0)
>  
> +static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
> +{
> +	val = val * percents;
> +	do_div(val, 100);
> +
> +	/*
> +	 * High freq + high boosting percent + large polling interval are
> +	 * resulting in integer overflow when watermarks are calculated.
> +	 */
> +	return min_t(u64, val, U32_MAX);
> +}
> +
>  static inline u32 mc_readl(struct tegra_mc *mc, unsigned long offset)
>  {
>  	return readl_relaxed(mc->regs + offset);
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 34085e26dced..69ccb3fe5b0b 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -9,6 +9,7 @@
>  #include <linux/clk/tegra.h>
>  #include <linux/debugfs.h>
>  #include <linux/err.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -16,11 +17,15 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/slab.h>
>  #include <linux/sort.h>
>  #include <linux/types.h>
>  
>  #include <soc/tegra/fuse.h>
>  
> +#include "mc.h"
> +
>  #define EMC_INTSTATUS				0x000
>  #define EMC_INTMASK				0x004
>  #define EMC_DBG					0x008
> @@ -144,6 +149,9 @@ struct emc_timing {
>  
>  struct tegra_emc {
>  	struct device *dev;
> +	struct tegra_mc *mc;
> +	struct opp_table *opp_table;
> +	struct icc_provider provider;
>  	struct notifier_block clk_nb;
>  	struct clk *clk;
>  	void __iomem *regs;
> @@ -658,6 +666,166 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
>  			    emc, &tegra_emc_debug_max_rate_fops);
>  }
>  
> +static inline struct tegra_emc *
> +to_tegra_emc_provider(struct icc_provider *provider)
> +{
> +	return container_of(provider, struct tegra_emc, provider);
> +}
> +
> +static struct icc_node_data *
> +emc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
> +{
> +	struct icc_provider *provider = data;
> +	struct icc_node_data *ndata;
> +	struct icc_node *node;
> +
> +	/* External Memory is the only possible ICC route */
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		if (node->id != TEGRA_ICC_EMEM)
> +			continue;
> +
> +		ndata = kzalloc(sizeof(*ndata), GFP_KERNEL);
> +		if (!ndata)
> +			return ERR_PTR(-ENOMEM);
> +
> +		/*
> +		 * SRC and DST nodes should have matching TAG in order to have
> +		 * it set by default for a requested path.
> +		 */
> +		ndata->tag = TEGRA_MC_ICC_TAG_ISO;
> +		ndata->node = node;
> +
> +		return ndata;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
> +	unsigned long long peak_bw = icc_units_to_bps(dst->peak_bw);
> +	unsigned long long avg_bw = icc_units_to_bps(dst->avg_bw);
> +	unsigned long long rate = max(avg_bw, peak_bw);
> +	unsigned int dram_data_bus_width_bytes = 4;
> +	long rounded_rate;
> +	int err;
> +
> +	/*
> +	 * Tegra20 EMC runs on x2 clock rate of SDRAM bus because DDR data
> +	 * is sampled on both clock edges. This means that EMC clock rate
> +	 * equals to the peak data rate.
> +	 */
> +	do_div(rate, dram_data_bus_width_bytes);
> +	rate = min_t(u64, rate, U32_MAX);
> +
> +	rounded_rate = emc_round_rate(rate, 0, U32_MAX, emc);
> +	if (rounded_rate < 0)
> +		return rounded_rate;
> +
> +	err = dev_pm_opp_set_rate(emc->dev, rounded_rate);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int tegra_emc_interconnect_init(struct tegra_emc *emc)
> +{
> +	const struct tegra_mc_soc *soc;
> +	struct icc_node *node;
> +	int err;
> +
> +	emc->mc = devm_tegra_get_memory_controller(emc->dev);
> +	if (IS_ERR(emc->mc))
> +		return PTR_ERR(emc->mc);
> +
> +	soc = emc->mc->soc;
> +
> +	emc->provider.dev = emc->dev;
> +	emc->provider.set = emc_icc_set;
> +	emc->provider.data = &emc->provider;
> +	emc->provider.aggregate = soc->icc_ops->aggregate;
> +	emc->provider.xlate_extended = emc_of_icc_xlate_extended;
> +
> +	err = icc_provider_add(&emc->provider);
> +	if (err)
> +		goto err_msg;
> +
> +	/* create External Memory Controller node */
> +	node = icc_node_create(TEGRA_ICC_EMC);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name = "External Memory Controller";
> +	icc_node_add(node, &emc->provider);
> +
> +	/* link External Memory Controller to External Memory (DRAM) */
> +	err = icc_link_create(node, TEGRA_ICC_EMEM);
> +	if (err)
> +		goto remove_nodes;
> +
> +	/* create External Memory node */
> +	node = icc_node_create(TEGRA_ICC_EMEM);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto remove_nodes;
> +
> +	node->name = "External Memory (DRAM)";
> +	icc_node_add(node, &emc->provider);
> +
> +	return 0;
> +
> +remove_nodes:
> +	icc_nodes_remove(&emc->provider);
> +del_provider:
> +	icc_provider_del(&emc->provider);
> +err_msg:
> +	dev_err(emc->dev, "failed to initialize ICC: %d\n", err);

You will print such errors on all existing DTBs. Since it is not a
failure of probe (it is actually quite expected, normal situation when
booting with older DTB), let's change it to warning (here and in all
other places and drivers).

> +
> +	return err;
> +}
> +
> +static int tegra_emc_opp_table_init(struct tegra_emc *emc)
> +{
> +	const char *rname = "core";
> +	int err;
> +
> +	/*
> +	 * Legacy device-trees don't have OPP table and EMC driver isn't
> +	 * useful in this case.
> +	 */
> +	if (!device_property_present(emc->dev, "operating-points-v2")) {
> +		dev_err(emc->dev, "OPP table not found\n");
> +		dev_err(emc->dev, "please update your device tree\n");
> +		return -ENODEV;
> +	}
> +
> +	/* voltage scaling is optional */
> +	if (device_property_present(emc->dev, "core-supply"))
> +		emc->opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> +	else
> +		emc->opp_table = dev_pm_opp_get_opp_table(emc->dev);
> +
> +	if (IS_ERR(emc->opp_table))
> +		return dev_err_probe(emc->dev, PTR_ERR(emc->opp_table),
> +				     "failed to prepare OPP table\n");
> +
> +	err = dev_pm_opp_of_add_table(emc->dev);
> +	if (err) {
> +		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
> +		goto put_table;
> +	}
> +
> +	return 0;
> +
> +put_table:
> +	dev_pm_opp_put_opp_table(emc->opp_table);
> +
> +	return err;
> +}
> +
>  static int tegra_emc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np;
> @@ -717,8 +885,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  		goto unset_cb;
>  	}
>  
> +	err = tegra_emc_opp_table_init(emc);
> +	if (err)
> +		goto unreg_notifier;

This looks like the ABI break I mentioned around DT bindings. Are the
bindings marked as unstable?

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
