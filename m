Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3512AEC98
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 10:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F16D89DD2;
	Wed, 11 Nov 2020 09:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902FD89DD2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 09:04:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e18so1478189edy.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xqfa1iT+ZZpWE8GkCIqSLv9Q9pkQ/v9Ezg9Ex3j/dwg=;
 b=lpbxAddsOvLdmc/+SnsbZs+kTOHfWEGTyJuhRvVjn6FA5KDsD3hexOQ+xK7eSCE8qB
 PttIapZuUcnn0HmbIzjK5bZPH+9KDVvNV4mxVbQdA/0wMsPzN4hYyczm+QuSgzJVIbAc
 2p3CevwXZvHVIczK87AwwJAcA6/A/A2yltXfvphIoH+bL7rtFL+1jkgBMyauD32JKNCN
 X7ImajkCFsXiuOQs39SIyAVXxi6dathAT7mzT81jvtkHdMvHLtFFhBqqPiwTLlYnb8k1
 I/Z1roFME3MsKxLi2F2iONL29IWbjdc4XjgTftoQsv0btszH1o61NsjicrlI9SjR1aYe
 IphA==
X-Gm-Message-State: AOAM533uWhPAXJHtvFfhFfWg2VCLreXYjUafEGlR9dFZkv6C5sg500Gf
 aQvQaLzTsWKVNagdTuBbxOA=
X-Google-Smtp-Source: ABdhPJw1pm9nytxVa2XlUQf5jdx6Q8J3ILJzhJY9rW9k0q2ArtCga/+xaEANxXa+Stsw3Sqm0miaBg==
X-Received: by 2002:a50:e08e:: with SMTP id f14mr24993244edl.374.1605085477081; 
 Wed, 11 Nov 2020 01:04:37 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id s12sm598478ejy.25.2020.11.11.01.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:04:35 -0800 (PST)
Date: Wed, 11 Nov 2020 10:04:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 11/26] memory: tegra124-emc: Make driver modular
Message-ID: <20201111090434.GB4050@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-12-digetx@gmail.com>
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 04:14:41AM +0300, Dmitry Osipenko wrote:
> Add modularization support to the Tegra124 EMC driver, which now can be
> compiled as a loadable kernel module.
> 
> Note that EMC clock must be registered at clk-init time, otherwise PLLM
> will be disabled as unused clock at boot time if EMC driver is compiled
> as a module. Hence add a prepare/complete callbacks. similarly to what is
> done for the Tegra20/30 EMC drivers.
> 
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/Makefile           |  3 +-
>  drivers/clk/tegra/clk-tegra124-emc.c | 41 ++++++++++++++++++++++++----
>  drivers/clk/tegra/clk-tegra124.c     | 27 ++++++++++++++++--
>  drivers/clk/tegra/clk.h              | 16 +++--------
>  drivers/memory/tegra/Kconfig         |  2 +-
>  drivers/memory/tegra/tegra124-emc.c  | 31 ++++++++++++++-------
>  include/linux/clk/tegra.h            |  8 ++++++
>  include/soc/tegra/emc.h              | 16 -----------
>  8 files changed, 96 insertions(+), 48 deletions(-)
>  delete mode 100644 include/soc/tegra/emc.h
> 
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index eec2313fd37e..53b76133e905 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -22,7 +22,8 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
>  obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
> -obj-$(CONFIG_TEGRA124_EMC)		+= clk-tegra124-emc.o
> +obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-emc.o
> +obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124-emc.o

How is it related to modularization? It looks like different issue is
fixed here.

>  obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
>  obj-y					+= cvb.o
>  obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
> index 745f9faa98d8..bdf6f4a51617 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -11,7 +11,9 @@
>  #include <linux/clk-provider.h>
>  #include <linux/clk.h>
>  #include <linux/clkdev.h>
> +#include <linux/clk/tegra.h>
>  #include <linux/delay.h>
> +#include <linux/export.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -21,7 +23,6 @@
>  #include <linux/string.h>
>  
>  #include <soc/tegra/fuse.h>
> -#include <soc/tegra/emc.h>
>  
>  #include "clk.h"
>  
> @@ -80,6 +81,9 @@ struct tegra_clk_emc {
>  	int num_timings;
>  	struct emc_timing *timings;
>  	spinlock_t *lock;
> +
> +	tegra124_emc_prepare_timing_change_cb *prepare_timing_change;
> +	tegra124_emc_complete_timing_change_cb *complete_timing_change;
>  };
>  
>  /* Common clock framework callback implementations */
> @@ -176,6 +180,9 @@ static struct tegra_emc *emc_ensure_emc_driver(struct tegra_clk_emc *tegra)
>  	if (tegra->emc)
>  		return tegra->emc;
>  
> +	if (!tegra->prepare_timing_change || !tegra->complete_timing_change)
> +		return NULL;
> +
>  	if (!tegra->emc_node)
>  		return NULL;
>  
> @@ -241,7 +248,7 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
>  
>  	div = timing->parent_rate / (timing->rate / 2) - 2;
>  
> -	err = tegra_emc_prepare_timing_change(emc, timing->rate);
> +	err = tegra->prepare_timing_change(emc, timing->rate);
>  	if (err)
>  		return err;
>  
> @@ -259,7 +266,7 @@ static int emc_set_timing(struct tegra_clk_emc *tegra,
>  
>  	spin_unlock_irqrestore(tegra->lock, flags);
>  
> -	tegra_emc_complete_timing_change(emc, timing->rate);
> +	tegra->complete_timing_change(emc, timing->rate);
>  
>  	clk_hw_reparent(&tegra->hw, __clk_get_hw(timing->parent));
>  	clk_disable_unprepare(tegra->prev_parent);
> @@ -473,8 +480,8 @@ static const struct clk_ops tegra_clk_emc_ops = {
>  	.get_parent = emc_get_parent,
>  };
>  
> -struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
> -				   spinlock_t *lock)
> +struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np,
> +				      spinlock_t *lock)
>  {
>  	struct tegra_clk_emc *tegra;
>  	struct clk_init_data init;
> @@ -538,3 +545,27 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
>  
>  	return clk;
>  };
> +
> +void tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change_cb *prep_cb,
> +				    tegra124_emc_complete_timing_change_cb *complete_cb)
> +{
> +	struct clk *clk = __clk_lookup("emc");
> +	struct tegra_clk_emc *tegra;
> +	struct clk_hw *hw;
> +
> +	if (clk) {
> +		hw = __clk_get_hw(clk);
> +		tegra = container_of(hw, struct tegra_clk_emc, hw);
> +
> +		tegra->prepare_timing_change = prep_cb;
> +		tegra->complete_timing_change = complete_cb;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(tegra124_clk_set_emc_callbacks);
> +
> +bool tegra124_clk_emc_driver_available(struct clk_hw *hw)
> +{
> +	struct tegra_clk_emc *tegra = container_of(hw, struct tegra_clk_emc, hw);
> +
> +	return tegra->prepare_timing_change && tegra->complete_timing_change;
> +}
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> index e931319dcc9d..b4f2ae4066a6 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -929,6 +929,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __initdata = {
>  	[tegra_clk_audio4_mux] = { .dt_id = TEGRA124_CLK_AUDIO4_MUX, .present = true },
>  	[tegra_clk_spdif_mux] = { .dt_id = TEGRA124_CLK_SPDIF_MUX, .present = true },
>  	[tegra_clk_cec] = { .dt_id = TEGRA124_CLK_CEC, .present = true },
> +	[tegra_clk_emc] = { .dt_id = TEGRA124_CLK_EMC, .present = false },
>  };
>  
>  static struct tegra_devclk devclks[] __initdata = {
> @@ -1500,6 +1501,26 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
>  	writel(plld_base, clk_base + PLLD_BASE);
>  }
>  
> +static struct clk *tegra124_clk_src_onecell_get(struct of_phandle_args *clkspec,
> +						void *data)
> +{
> +	struct clk_hw *hw;
> +	struct clk *clk;
> +
> +	clk = of_clk_src_onecell_get(clkspec, data);
> +	if (IS_ERR(clk))
> +		return clk;
> +
> +	hw = __clk_get_hw(clk);
> +
> +	if (clkspec->args[0] == TEGRA124_CLK_EMC) {
> +		if (!tegra124_clk_emc_driver_available(hw))
> +			return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	return clk;
> +}
> +
>  /**
>   * tegra124_132_clock_init_post - clock initialization postamble for T124/T132
>   * @np: struct device_node * of the DT node for the SoC CAR IP block
> @@ -1516,10 +1537,10 @@ static void __init tegra124_132_clock_init_post(struct device_node *np)
>  				  &pll_x_params);
>  	tegra_init_special_resets(1, tegra124_reset_assert,
>  				  tegra124_reset_deassert);
> -	tegra_add_of_provider(np, of_clk_src_onecell_get);
> +	tegra_add_of_provider(np, tegra124_clk_src_onecell_get);
>  
> -	clks[TEGRA124_CLK_EMC] = tegra_clk_register_emc(clk_base, np,
> -							&emc_lock);
> +	clks[TEGRA124_CLK_EMC] = tegra124_clk_register_emc(clk_base, np,
> +							   &emc_lock);
>  
>  	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
>  
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 6b565f6b5f66..2da7c93c1a6c 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -881,18 +881,6 @@ void tegra_super_clk_gen5_init(void __iomem *clk_base,
>  			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
>  			struct tegra_clk_pll_params *pll_params);
>  
> -#ifdef CONFIG_TEGRA124_EMC
> -struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
> -				   spinlock_t *lock);
> -#else
> -static inline struct clk *tegra_clk_register_emc(void __iomem *base,
> -						 struct device_node *np,
> -						 spinlock_t *lock)
> -{
> -	return NULL;
> -}
> -#endif

Why clock changes are so tightly coupled with making an EMC driver
modular? Usually this should be a separate change - you adjust any
dependencies to accept late or deferred probing, exported symbols,
loosen the coupling between drivers, etc. and then you convert something
to module.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
