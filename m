Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0C29AF56
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 15:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023C6E08E;
	Tue, 27 Oct 2020 14:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C9B6E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 14:11:57 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id t20so1567466edr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=orRVVCF+rMM6CLEejDnAwA+y2RO0n8KvYKy9sf+Illo=;
 b=ZFUyAmdcSuaTryuw+AMgJUSZ9ng9P5+QWJF7nDK+zmeM8HEG2WPF1WdLdzff9cKvX9
 A8CCkdoGOLH7RwzNeFVE2DyHPFOmquwouV6QrCjTGO5eOInfvJULQ6d0RNCFFRxtjuws
 DsXpSKMctrmqF2PXc9TDDpp2PcwmNpfldGb5yBZ+98PJApX231yTtQB9u8tI8vj5Vs9S
 gdU0/8MS6wMBIYa7P7aoTU7lbetu760nlsA3bXOPkspD2YVcbEE5tlRQtDK3i3iyRIpV
 o//lLuB7e4aG2HLVv2Uekuj9BrrJAm2kg/8AFyiOzKgfwi2h29KMZQbhFZZ85296ieXt
 mIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=orRVVCF+rMM6CLEejDnAwA+y2RO0n8KvYKy9sf+Illo=;
 b=gRvO2NhUcqnyy6f16GcAhxUxJDEmYM/fyI1hICt726Fgv1X9qtotjwghY0XGBnfeyd
 RRFUBILeQut4PPN2SrrbA0lMnNRZBDIuV1ABQvEUzGBbYFahs6rb8HJPszVjzeWdKGlk
 EhcyOwF3MRxrfhW6z+p8t7OhSlvxJuQ3Nq5+ASZYXX0yiQKloNmL5vyoN7HVC32wImAd
 ekb1lMfHyK+4Ga0v2fmkSLyXCL/b9fqx6AMj8hsDM4ipZFfpEMb+uuVxhtdHP/VVjfFv
 AJAmaTugKfPtYD8Gq5zR/GcYKCk3r72mJObBpaOR0BS302dhUwhK8vEJOyI/2MTuYkGD
 ig6g==
X-Gm-Message-State: AOAM531cA9DBBeID7aqRonEoc3z6WOMFbORMPEHZpp+3R3qv5/iBOlmr
 LmnxiIAyuJB8p1s4KQnJ6dU=
X-Google-Smtp-Source: ABdhPJygNBt2zIcdsiaIRtak0ehcne4aFcCD22CIMiesT5KQJbgOk/sJyK6XnUNqiVUAfhTFmli2Jw==
X-Received: by 2002:a50:8426:: with SMTP id 35mr2464381edp.156.1603807915238; 
 Tue, 27 Oct 2020 07:11:55 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id lj18sm1114839ejb.71.2020.10.27.07.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 07:11:53 -0700 (PDT)
Date: Tue, 27 Oct 2020 15:11:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 33/52] memory: tegra20: Support interconnect framework
Message-ID: <20201027141152.GN1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-34-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-34-digetx@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/mixed; boundary="===============2126156660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2126156660==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GOzekVbrLdOLv44p"
Content-Disposition: inline


--GOzekVbrLdOLv44p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:17:16AM +0300, Dmitry Osipenko wrote:
> Now Internal and External Memory Controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |   3 +-
>  drivers/memory/tegra/mc.h          |  12 ++
>  drivers/memory/tegra/tegra20-emc.c | 176 +++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra20.c     |  34 ++++++
>  4 files changed, 224 insertions(+), 1 deletion(-)
>=20
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
> =20
>  #define MC_TIMING_UPDATE				BIT(0)
> =20
> +static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
> +{
> +	val =3D val * percents;
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
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/te=
gra20-emc.c
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
> =20
>  #include <soc/tegra/fuse.h>
> =20
> +#include "mc.h"
> +
>  #define EMC_INTSTATUS				0x000
>  #define EMC_INTMASK				0x004
>  #define EMC_DBG					0x008
> @@ -144,6 +149,9 @@ struct emc_timing {
> =20
>  struct tegra_emc {
>  	struct device *dev;
> +	struct tegra_mc *mc;
> +	struct opp_table *opp_table;
> +	struct icc_provider provider;
>  	struct notifier_block clk_nb;
>  	struct clk *clk;
>  	void __iomem *regs;
> @@ -658,6 +666,166 @@ static void tegra_emc_debugfs_init(struct tegra_emc=
 *emc)
>  			    emc, &tegra_emc_debug_max_rate_fops);
>  }
> =20
> +static inline struct tegra_emc *
> +to_tegra_emc_provider(struct icc_provider *provider)
> +{
> +	return container_of(provider, struct tegra_emc, provider);
> +}
> +
> +static struct icc_node_data *
> +emc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
> +{
> +	struct icc_provider *provider =3D data;
> +	struct icc_node_data *ndata;
> +	struct icc_node *node;
> +
> +	/* External Memory is the only possible ICC route */
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		if (node->id !=3D TEGRA_ICC_EMEM)
> +			continue;
> +
> +		ndata =3D kzalloc(sizeof(*ndata), GFP_KERNEL);
> +		if (!ndata)
> +			return ERR_PTR(-ENOMEM);
> +
> +		/*
> +		 * SRC and DST nodes should have matching TAG in order to have
> +		 * it set by default for a requested path.
> +		 */
> +		ndata->tag =3D TEGRA_MC_ICC_TAG_ISO;
> +		ndata->node =3D node;
> +
> +		return ndata;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct tegra_emc *emc =3D to_tegra_emc_provider(dst->provider);
> +	unsigned long long peak_bw =3D icc_units_to_bps(dst->peak_bw);
> +	unsigned long long avg_bw =3D icc_units_to_bps(dst->avg_bw);
> +	unsigned long long rate =3D max(avg_bw, peak_bw);
> +	unsigned int dram_data_bus_width_bytes =3D 4;

Perhaps use something shorter for this variable (like dram_bus_width)? Also,
since it's never modified, perhaps make it const? Or a #define?

> +	long rounded_rate;
> +	int err;
> +
> +	/*
> +	 * Tegra20 EMC runs on x2 clock rate of SDRAM bus because DDR data
> +	 * is sampled on both clock edges. This means that EMC clock rate
> +	 * equals to the peak data rate.
> +	 */
> +	do_div(rate, dram_data_bus_width_bytes);
> +	rate =3D min_t(u64, rate, U32_MAX);
> +
> +	rounded_rate =3D emc_round_rate(rate, 0, U32_MAX, emc);
> +	if (rounded_rate < 0)
> +		return rounded_rate;
> +
> +	err =3D dev_pm_opp_set_rate(emc->dev, rounded_rate);
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
> +	emc->mc =3D devm_tegra_get_memory_controller(emc->dev);
> +	if (IS_ERR(emc->mc))
> +		return PTR_ERR(emc->mc);
> +
> +	soc =3D emc->mc->soc;
> +
> +	emc->provider.dev =3D emc->dev;
> +	emc->provider.set =3D emc_icc_set;
> +	emc->provider.data =3D &emc->provider;
> +	emc->provider.aggregate =3D soc->icc_ops->aggregate;
> +	emc->provider.xlate_extended =3D emc_of_icc_xlate_extended;
> +
> +	err =3D icc_provider_add(&emc->provider);
> +	if (err)
> +		goto err_msg;
> +
> +	/* create External Memory Controller node */
> +	node =3D icc_node_create(TEGRA_ICC_EMC);
> +	err =3D PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;

As far as I can tell, icc_node_create() always returns either a valid
pointer or an ERR_PTR-encoded negative error-code. So I think the more
idiomatic way to write this would be:

	node =3D icc_node_create(TEGRA_ICC_EMC);
	if (IS_ERR(node)) {
		err =3D PTR_ERR(node);
		goto del_provider;
	}

> +
> +	node->name =3D "External Memory Controller";
> +	icc_node_add(node, &emc->provider);
> +
> +	/* link External Memory Controller to External Memory (DRAM) */
> +	err =3D icc_link_create(node, TEGRA_ICC_EMEM);
> +	if (err)
> +		goto remove_nodes;
> +
> +	/* create External Memory node */
> +	node =3D icc_node_create(TEGRA_ICC_EMEM);
> +	err =3D PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto remove_nodes;

Same here.

> +
> +	node->name =3D "External Memory (DRAM)";
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

It might be worth duplicating this error message to the failure
locations so that the exact failure can be identified.

> +
> +	return err;
> +}
> +
> +static int tegra_emc_opp_table_init(struct tegra_emc *emc)
> +{
> +	const char *rname =3D "core";
> +	int err;
> +
> +	/*
> +	 * Legacy device-trees don't have OPP table and EMC driver isn't
> +	 * useful in this case.
> +	 */
> +	if (!device_property_present(emc->dev, "operating-points-v2")) {
> +		dev_err(emc->dev, "OPP table not found\n");
> +		dev_err(emc->dev, "please update your device tree\n");

This should be a single error message. These messages end up in kmsg
records and having this split into two dev_err() calls makes them into
two separate records and that in turn makes it more difficult to
determine whether they belong together or not.

> +		return -ENODEV;
> +	}
> +
> +	/* voltage scaling is optional */
> +	if (device_property_present(emc->dev, "core-supply"))
> +		emc->opp_table =3D dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> +	else
> +		emc->opp_table =3D dev_pm_opp_get_opp_table(emc->dev);
> +
> +	if (IS_ERR(emc->opp_table))
> +		return dev_err_probe(emc->dev, PTR_ERR(emc->opp_table),
> +				     "failed to prepare OPP table\n");
> +
> +	err =3D dev_pm_opp_of_add_table(emc->dev);
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
> @@ -717,8 +885,13 @@ static int tegra_emc_probe(struct platform_device *p=
dev)
>  		goto unset_cb;
>  	}
> =20
> +	err =3D tegra_emc_opp_table_init(emc);
> +	if (err)
> +		goto unreg_notifier;
> +
>  	platform_set_drvdata(pdev, emc);
>  	tegra_emc_debugfs_init(emc);
> +	tegra_emc_interconnect_init(emc);
> =20
>  	/*
>  	 * Don't allow the kernel module to be unloaded. Unloading adds some
> @@ -729,6 +902,8 @@ static int tegra_emc_probe(struct platform_device *pd=
ev)
> =20
>  	return 0;
> =20
> +unreg_notifier:
> +	clk_notifier_unregister(emc->clk, &emc->clk_nb);
>  unset_cb:
>  	tegra20_clk_set_emc_round_callback(NULL, NULL);
> =20
> @@ -747,6 +922,7 @@ static struct platform_driver tegra_emc_driver =3D {
>  		.name =3D "tegra20-emc",
>  		.of_match_table =3D tegra_emc_of_match,
>  		.suppress_bind_attrs =3D true,
> +		.sync_state =3D icc_sync_state,
>  	},
>  };
>  module_platform_driver(tegra_emc_driver);
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra2=
0.c
> index a8098bff91d9..5127e8e8250f 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -280,6 +280,39 @@ static const struct tegra_mc_reset_ops tegra20_mc_re=
set_ops =3D {
>  	.reset_status =3D tegra20_mc_reset_status,
>  };
> =20
> +static int tegra20_mc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	/*
> +	 * Technically, it should be possible to tune arbitration knobs here,
> +	 * but the default values are known to work well on all devices.
> +	 * Hence nothing to do here so far.
> +	 */
> +	return 0;
> +}
> +
> +static int tegra20_mc_icc_aggreate(struct icc_node *node, u32 tag, u32 a=
vg_bw,
> +				   u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> +{
> +	/*
> +	 * ISO clients need to reserve extra bandwidth up-front because
> +	 * there could high bandwidth pressure during initial fulling-up

"filling of the client's FIFO buffers"

> +	 * of the client's FIFO buffers. Secondly, we need to take into
> +	 * account impurities of the memory subsystem.
> +	 */
> +	if (tag =3D=3D TEGRA_MC_ICC_TAG_ISO)
> +		peak_bw =3D tegra_mc_scale_percents(peak_bw, 300);

300% sounds a bit excessive. Do we really need that much?

> +
> +	*agg_avg +=3D avg_bw;
> +	*agg_peak =3D max(*agg_peak, peak_bw);

I'm not very familiar with ICC, but shouldn't the aggregated peak value
be the sum of the current aggregated peak and the new peak bandwidth?
Currently you're selecting the maximum peak bandwidth across all
clients, so isn't that going to be too small if for whatever reason
multiple clients need peak bandwidth at the same time?

Thierry

--GOzekVbrLdOLv44p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YKqUACgkQ3SOs138+
s6HRMxAAkFiUAoB+sUnNejlj9cJmOhxaHFBELR+B8z/8a7mlQNwMrnDNnUgSXX0q
SS9Ji65B+uY/hFQmRcL+D5tW/NL9HHlu7EHTMURjltzx31mU5h2ln5bMZywwIrTm
pwApnnQzLN1Snr8YkuAjZMM/MOukDc9Mvyvrhno0w+5AE1Ba0QpnumABJUoY4w8N
qEb9TDyspYiKA4rG/824jDUymMC4nfPGinHkN6zcK/6x9eLDFcvAUI4eWw70pPBe
xs+qEaZN5tdGxvMKWQzp45hFsogCn8OPx3DujWpmnxI7ADxxdgkocImr51sD3lqV
z25vvWBeC0AQ8rDOGSnCOJj/oHKTz4lzF5xLCsZY8bVFQcpNppmAfql+zK9IGOHy
8k/U26EWrg/vA9YtkvRwvMF+kMejSg7HjLREiLKyUIKJcXbgACDUA00C/H3OvtWv
VASDNK8mxjdACeX9QVSF+/hmzPB480Z0qHfDw4TpQU5S7Y9c9fVIKwqXL1veZTPR
TZVsQp4fy92957r0rSLMWtLe/8tn/Kl3Xt9h5kkAQKmBaaRdL4q4n/chcpe5Wn62
2JYpTwdTekI+gyvy56wdhMBgyqbMT9/NuUkbumvZkQUyL0dPrcmO6IHMNQ7p44Qc
FDNgfmD1gM9e1mwbT7BPCN9p5O+48BkolaEx+ItvZ/b9wW+NzZk=
=GwaY
-----END PGP SIGNATURE-----

--GOzekVbrLdOLv44p--

--===============2126156660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2126156660==--
