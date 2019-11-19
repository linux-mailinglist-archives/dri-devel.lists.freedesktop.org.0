Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF6101961
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 07:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543DA6E10F;
	Tue, 19 Nov 2019 06:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AA96E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 06:30:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f3so2038883wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 22:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YsmhS9/WSzNVSjXt0MJQBCV4WFPjiik8d6InzmTm0h0=;
 b=GTyP9aFJF3IPzjviWeApGFwzioOoj1eEZJ1CZsvpydlLe3Yy30VLXgzSXb/JGfCjDC
 QGY/O1gskmtz9e7ujbpTyTIfp4+2xr5DRY1AJ52K4+46fwLOd2wZRfOhvq8Ir0BozWY9
 Z4jfNNjRB31LkDJVSWQz6RD1EMCn0j7igRQ5MZ3qw9OccK4XfHtNJ1yT9bELAVL1CTS7
 rNsw7ttO5SsOeS/ptZWSLAlYjrmhig8NvJUddZ3jCukuEnUQ6umCG86xk+fsyAo6Ti8M
 MMPi5z2pOpe63k0aHOMJ38q9edYORrL+JkiKA4d8ZE5nb7k7nAYBtBOrfAUrf0+vPIlh
 Au4Q==
X-Gm-Message-State: APjAAAX6W7hRkfIlKHMVRONWLc/I+6uXVlaauYS983g3BozczQ2Sw9NW
 Bzb8EKs/OknBgjNVc7A3imc=
X-Google-Smtp-Source: APXvYqzZuuus/7u0MxeQbtdVV3Kc2SednvD0wQA6ox0MmNZNpgMxxeTURE/N6gjoQvaY30JAiVmuUA==
X-Received: by 2002:a05:600c:2102:: with SMTP id
 u2mr3491806wml.49.1574145005034; 
 Mon, 18 Nov 2019 22:30:05 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v9sm25322311wrs.95.2019.11.18.22.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 22:30:03 -0800 (PST)
Date: Tue, 19 Nov 2019 07:30:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
Message-ID: <20191119063002.GE2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191118200247.3567-13-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YsmhS9/WSzNVSjXt0MJQBCV4WFPjiik8d6InzmTm0h0=;
 b=Fp55xNTFLjKH34M1+8mgpLRDBR72eso1z/gpnxwpE5XVyhoZ4ffu9JQ9jGNzF47uSf
 xiPSU1PbO3IkxBCQm0nwWOk5IXblysjEWBAfPbEMm2Jm44ppVJTJB++zjc0xNY68J+on
 0qAHWIYAyTADR1BPnT3tuzPyMksPNf44z7kUvjdkJwKeOSmXHghtqTzbRtEZR4LowjOW
 U/okiGLlaQDxsTSHFSXdh7hhpiXyvOUH1dyKkIABkagfOLZDD4joTXyrLx5vm5xE1exD
 YTYCO+XNvStGGYL6/SJMDQV9zfbC3xbcABhpyHlJXvTJ44Lrg3iIJ79vKXc75MML551/
 S0ZA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: multipart/mixed; boundary="===============2131677171=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2131677171==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:30PM +0300, Dmitry Osipenko wrote:
> All NVIDIA Tegra SoCs have identical topology in regards to memory
> interconnection between memory clients and memory controllers.
> The memory controller (MC) and external memory controller (EMC) are
> providing memory clients with required memory bandwidth. The memory
> controller performs arbitration between memory clients, while the
> external memory controller transfers data from/to DRAM and pipes that
> data from/to memory controller. Memory controller interconnect provider
> aggregates bandwidth requests from memory clients and sends the aggregated
> request to EMC provider that scales DRAM frequency in order to satisfy the
> bandwidth requirement. Memory controller provider could adjust hardware
> configuration for a more optimal arbitration depending on bandwidth
> requirements from memory clients, but this is unimplemented for now.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/interconnect/Kconfig               |   1 +
>  drivers/interconnect/Makefile              |   1 +
>  drivers/interconnect/tegra/Kconfig         |   6 +
>  drivers/interconnect/tegra/Makefile        |   4 +
>  drivers/interconnect/tegra/tegra-icc-emc.c | 138 +++++++++++++++++++++
>  drivers/interconnect/tegra/tegra-icc-mc.c  | 130 +++++++++++++++++++
>  include/soc/tegra/mc.h                     |  26 ++++
>  7 files changed, 306 insertions(+)
>  create mode 100644 drivers/interconnect/tegra/Kconfig
>  create mode 100644 drivers/interconnect/tegra/Makefile
>  create mode 100644 drivers/interconnect/tegra/tegra-icc-emc.c
>  create mode 100644 drivers/interconnect/tegra/tegra-icc-mc.c

Why does this have to be separate from the memory controller driver in
drivers/memory/tegra? It seems like this requires a bunch of boilerplate
just so that this code can live in the drivers/interconnect directory.
If Georgi doesn't insist, I'd prefer if we carried this code directly in
the drivers/memory/tegra directory so that we don't have so many
indirections.

Also, and I already briefly mentioned this in another reply, I think we
don't need two providers here. The only one we're really interested in
is the memory-client to memory-controller paths. The MC to EMC path is
static.

Thierry

> diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
> index bfa4ca3ab7a9..b11ca09665bb 100644
> --- a/drivers/interconnect/Kconfig
> +++ b/drivers/interconnect/Kconfig
> @@ -12,5 +12,6 @@ menuconfig INTERCONNECT
>  if INTERCONNECT
> =20
>  source "drivers/interconnect/qcom/Kconfig"
> +source "drivers/interconnect/tegra/Kconfig"
> =20
>  endif
> diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
> index 28f2ab0824d5..a37d419e262c 100644
> --- a/drivers/interconnect/Makefile
> +++ b/drivers/interconnect/Makefile
> @@ -4,3 +4,4 @@ icc-core-objs				:=3D core.o
> =20
>  obj-$(CONFIG_INTERCONNECT)		+=3D icc-core.o
>  obj-$(CONFIG_INTERCONNECT_QCOM)		+=3D qcom/
> +obj-$(CONFIG_INTERCONNECT_TEGRA)	+=3D tegra/
> diff --git a/drivers/interconnect/tegra/Kconfig b/drivers/interconnect/te=
gra/Kconfig
> new file mode 100644
> index 000000000000..b724781da71e
> --- /dev/null
> +++ b/drivers/interconnect/tegra/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config INTERCONNECT_TEGRA
> +	bool "NVIDIA Tegra interconnect drivers"
> +	depends on ARCH_TEGRA || COMPILE_TEST
> +	help
> +	  Say Y here to enable support for NVIDIA Tegra interconnect drivers.
> diff --git a/drivers/interconnect/tegra/Makefile b/drivers/interconnect/t=
egra/Makefile
> new file mode 100644
> index 000000000000..74ff2e53dbdc
> --- /dev/null
> +++ b/drivers/interconnect/tegra/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_INTERCONNECT_TEGRA) +=3D tegra-icc-mc.o
> +obj-$(CONFIG_INTERCONNECT_TEGRA) +=3D tegra-icc-emc.o
> diff --git a/drivers/interconnect/tegra/tegra-icc-emc.c b/drivers/interco=
nnect/tegra/tegra-icc-emc.c
> new file mode 100644
> index 000000000000..b594ce811153
> --- /dev/null
> +++ b/drivers/interconnect/tegra/tegra-icc-emc.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Author: Dmitry Osipenko <digetx@gmail.com>
> + * Copyright (C) 2019 GRATE-DRIVER project
> + */
> +
> +#include <dt-bindings/interconnect/tegra-icc.h>
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +
> +#include <soc/tegra/mc.h>
> +
> +struct tegra_emc_provider {
> +	struct icc_provider provider;
> +	struct clk *clk;
> +	unsigned int dram_data_bus_width_bytes;
> +};
> +
> +static inline struct tegra_emc_provider *
> +to_tegra_emc_provider(struct icc_provider *provider)
> +{
> +	return container_of(provider, struct tegra_emc_provider, provider);
> +}
> +
> +static struct icc_node *
> +tegra_emc_of_icc_xlate_onecell(struct of_phandle_args *spec, void *data)
> +{
> +	struct icc_provider *provider =3D data;
> +	struct icc_node *node;
> +
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		if (node->id =3D=3D spec->args[0])
> +			return node;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int tegra_emc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct tegra_emc_provider *emc =3D to_tegra_emc_provider(dst->provider);
> +	unsigned long long rate =3D icc_units_to_bps(dst->avg_bw);
> +	unsigned int ddr =3D 2;
> +	int err;
> +
> +	do_div(rate, ddr * emc->dram_data_bus_width_bytes);
> +	rate =3D min_t(u64, rate, U32_MAX);
> +
> +	err =3D clk_set_min_rate(emc->clk, rate);
> +	if (err)
> +		return err;
> +
> +	err =3D clk_set_rate(emc->clk, rate);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int tegra_emc_icc_aggregate(struct icc_node *node,
> +				   u32 tag, u32 avg_bw, u32 peak_bw,
> +				   u32 *agg_avg, u32 *agg_peak)
> +{
> +	*agg_avg =3D min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
> +	*agg_peak =3D max(*agg_peak, peak_bw);
> +
> +	return 0;
> +}
> +
> +int tegra_icc_emc_setup_interconnect(struct device *emc_dev,
> +				     unsigned int dram_data_bus_width_bytes)
> +{
> +	struct tegra_emc_provider *emc;
> +	struct icc_node *node, *tmp;
> +	int err;
> +
> +	emc =3D devm_kzalloc(emc_dev, sizeof(*emc), GFP_KERNEL);
> +	if (!emc)
> +		return -ENOMEM;
> +
> +	emc->clk =3D devm_clk_get(emc_dev, "emc");
> +	err =3D PTR_ERR_OR_ZERO(emc->clk);
> +	if (err)
> +		return err;
> +
> +	emc->dram_data_bus_width_bytes =3D dram_data_bus_width_bytes;
> +
> +	emc->provider.dev =3D emc_dev;
> +	emc->provider.set =3D tegra_emc_icc_set;
> +	emc->provider.data =3D &emc->provider;
> +	emc->provider.xlate =3D tegra_emc_of_icc_xlate_onecell;
> +	emc->provider.aggregate =3D tegra_emc_icc_aggregate;
> +
> +	err =3D icc_provider_add(&emc->provider);
> +	if (err)
> +		return err;
> +
> +	/* create External Memory Controller node */
> +	node =3D icc_node_create(TEGRA_ICC_EMC);
> +	err =3D PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name =3D "EMC";
> +	icc_node_add(node, &emc->provider);
> +
> +	/* link External Memory Controller with External Memory */
> +	err =3D icc_link_create(node, TEGRA_ICC_EMEM);
> +	if (err)
> +		goto destroy_nodes;
> +
> +	/* create External Memory node */
> +	node =3D icc_node_create(TEGRA_ICC_EMEM);
> +	err =3D PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto destroy_nodes;
> +
> +	node->name =3D "EMEM";
> +	icc_node_add(node, &emc->provider);
> +
> +	return 0;
> +
> +destroy_nodes:
> +	list_for_each_entry_safe(node, tmp, &emc->provider.nodes, node_list) {
> +		icc_node_del(node);
> +		icc_node_destroy(node->id);
> +	}
> +
> +del_provider:
> +	icc_provider_del(&emc->provider);
> +
> +	return err;
> +}
> diff --git a/drivers/interconnect/tegra/tegra-icc-mc.c b/drivers/intercon=
nect/tegra/tegra-icc-mc.c
> new file mode 100644
> index 000000000000..f1ff8f98def3
> --- /dev/null
> +++ b/drivers/interconnect/tegra/tegra-icc-mc.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Author: Dmitry Osipenko <digetx@gmail.com>
> + * Copyright (C) 2019 GRATE-DRIVER project
> + */
> +
> +#include <dt-bindings/interconnect/tegra-icc.h>
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/of.h>
> +
> +#include <soc/tegra/mc.h>
> +
> +static struct icc_node *
> +tegra_mc_of_icc_xlate_onecell(struct of_phandle_args *spec, void *data)
> +{
> +	struct icc_provider *provider =3D data;
> +	struct icc_node *node;
> +
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		if (node->id =3D=3D spec->args[0])
> +			return node;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int tegra_mc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	return 0;
> +}
> +
> +static int tegra_mc_icc_aggregate(struct icc_node *node,
> +				  u32 tag, u32 avg_bw, u32 peak_bw,
> +				  u32 *agg_avg, u32 *agg_peak)
> +{
> +	*agg_avg =3D min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
> +	*agg_peak =3D max(*agg_peak, peak_bw);
> +
> +	return 0;
> +}
> +
> +/*
> + * Memory Controller (MC) has few Memory Clients that are issuing memory
> + * bandwidth allocation requests to the MC interconnect provider. The MC
> + * provider aggregates the requests and then sends the aggregated request
> + * up to the External Memory Controller (EMC) interconnect provider which
> + * re-configures hardware interface to External Memory (EMEM) in accorda=
nce
> + * to the required bandwidth.
> + *
> + * Memory interconnect topology:
> + *
> + *               +----+
> + *   +-----+     |    |
> + *   | GPU +---->+    |
> + *   +-----+     |    |
> + *               |    |     +-----+     +------+
> + *    ...        | MC +---->+ EMC +---->+ EMEM |
> + *               |    |     +-----+     +------+
> + *  +------+     |    |
> + *  | DISP +---->+    |
> + *  +------+     |    |
> + *               +----+
> + */
> +int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc)
> +{
> +	struct icc_provider *provider;
> +	struct icc_node *node, *tmp;
> +	unsigned int i;
> +	int err;
> +
> +	provider =3D devm_kzalloc(mc->dev, sizeof(*provider), GFP_KERNEL);
> +	if (!provider)
> +		return -ENOMEM;
> +
> +	provider->dev =3D mc->dev;
> +	provider->set =3D tegra_mc_icc_set;
> +	provider->data =3D provider;
> +	provider->xlate =3D tegra_mc_of_icc_xlate_onecell;
> +	provider->aggregate =3D tegra_mc_icc_aggregate;
> +
> +	err =3D icc_provider_add(provider);
> +	if (err)
> +		return err;
> +
> +	/* create Memory Controller node */
> +	node =3D icc_node_create(TEGRA_ICC_MC);
> +	err =3D PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name =3D "MC";
> +	icc_node_add(node, provider);
> +
> +	/* link Memory Controller with External Memory Controller */
> +	err =3D icc_link_create(node, TEGRA_ICC_EMC);
> +	if (err)
> +		goto destroy_nodes;
> +
> +	for (i =3D 0; i < mc->soc->num_icc_nodes; i++) {
> +		/* create MC client node */
> +		node =3D icc_node_create(mc->soc->icc_nodes[i].id);
> +		err =3D PTR_ERR_OR_ZERO(node);
> +		if (err)
> +			goto destroy_nodes;
> +
> +		node->name =3D mc->soc->icc_nodes[i].name;
> +		icc_node_add(node, provider);
> +
> +		/* link Memory Client with Memory Controller */
> +		err =3D icc_link_create(node, TEGRA_ICC_MC);
> +		if (err)
> +			goto destroy_nodes;
> +	}
> +
> +	return 0;
> +
> +destroy_nodes:
> +	list_for_each_entry_safe(node, tmp, &provider->nodes, node_list) {
> +		icc_node_del(node);
> +		icc_node_destroy(node->id);
> +	}
> +
> +del_provider:
> +	icc_provider_del(provider);
> +
> +	return err;
> +}
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 1238e35653d1..593954324259 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -141,6 +141,11 @@ struct tegra_mc_reset_ops {
>  			    const struct tegra_mc_reset *rst);
>  };
> =20
> +struct tegra_mc_icc_node {
> +	const char *name;
> +	unsigned int id;
> +};
> +
>  struct tegra_mc_soc {
>  	const struct tegra_mc_client *clients;
>  	unsigned int num_clients;
> @@ -160,6 +165,9 @@ struct tegra_mc_soc {
>  	const struct tegra_mc_reset_ops *reset_ops;
>  	const struct tegra_mc_reset *resets;
>  	unsigned int num_resets;
> +
> +	const struct tegra_mc_icc_node *icc_nodes;
> +	unsigned int num_icc_nodes;
>  };
> =20
>  struct tegra_mc {
> @@ -184,4 +192,22 @@ struct tegra_mc {
>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long=
 rate);
>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> =20
> +#ifdef CONFIG_INTERCONNECT_TEGRA
> +int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
> +int tegra_icc_emc_setup_interconnect(struct device *emc_dev,
> +				     unsigned int dram_data_bus_width_bytes);
> +#else
> +static inline int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
> +{
> +	return 0;
> +}
> +
> +static inline int
> +tegra_icc_emc_setup_interconnect(struct device *emc_dev,
> +				 unsigned int dram_data_bus_width_bytes)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #endif /* __SOC_TEGRA_MC_H__ */
> --=20
> 2.23.0
>=20

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Ti+oACgkQ3SOs138+
s6ESnhAAtsCzzcEro34fpNnlQuhEZH1i/XBe/4ov15c5oUkYEsH1mOknLVSZqL8v
N0nt/FgWhCJElVOf034/KhBw2VEFyMRKjJwt2fCKgXuUURB4tQhpRO2iHRSC9QsK
fz51THkDUALA4JoPamAglahRlRGNT65+h+C8/KC7I0a2JyK9qAWIDaCD4M8qek4B
yUktD34GmD6HHnHxha+eqrPbR9i/qvJe9lcJcj8pGPHcloYO/xekaHsHffJwVutA
pAlGUSXuqMC+xMH6Fb9YyfUXFQCmhCOUt++jkOJBPxx2ok4NOWKIJpz8XtMLhjz9
3lau6bcZAsIjPOAd8BA1a3OT0X7CtEziGU6IEPupZFV1+McrH3CUyjQ1zT6aMt1e
vQEUqwLngUsx17gU6+bSyorwSQEwSnV63QMtD2+YgtXzMLQfJJZgtRrWOdnNxdYD
d6qJr5bgulmT8RfNpVduYNtxHfESopvbecAQyJRvYgncM5+LQ73HeiFKKetGV3GX
d87EIt4pS1nTdaEGIjyfU6ze+I/bRM6kaPdpk+KL+HW9KdQx2A6B7yq84ICHFaw+
Yj+Cbw8rRyxXy16HN4oKpDprKUVHIcy/cZi/Rn0YzdCODMMC7wcqCgKt11qsep9i
5Aq35XQPNsmMufrA6fBNDJyq9iFCpl4akvwFNr1TAHfDBw57Bas=
=Ue8q
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--

--===============2131677171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2131677171==--
