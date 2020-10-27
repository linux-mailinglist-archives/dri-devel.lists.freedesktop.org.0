Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4529ADC2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1216EB79;
	Tue, 27 Oct 2020 13:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D726EB70
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:48:10 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id k3so2284596ejj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/FTHZdzvqCseo98fRgDOb6fRX9suqxJ/WwgCBZT0Cm8=;
 b=Hvt3Tf0TC+5W1qfI97WIOnRuW9+7iWPJMa754njMXL4UhU57uiA1AZDMx3yVUxcdg4
 pJCccGj0VtZ2OJhWipWNU6qmKZi7U4WC7dOnA4PIWTWNlVD98ACT7WPsy/2ZAd+ubQmj
 1XDwUH5qEajyuVg2bkPWQBIvofJSLjv5hledn9IrdsdIIpgVgRczLujoWZLHNMpELmkA
 Jslu8hu23Go839sbhREvuNQk97xFCUmMEn3gI3nM/EKx8Ng/UhMR3K2LRrbfDreIUOiw
 o/BVfb/zlDdRFXFgJUn/awCYd0ivf7KH6lZEw8PHXYwAY5kzHEFEm/4XYjtutvLbb6c0
 mNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/FTHZdzvqCseo98fRgDOb6fRX9suqxJ/WwgCBZT0Cm8=;
 b=fxYwxB/MtmXP/4nL7GbKJ5FYmiiOsxa2sxJCIpkZ8lcGZtn+K2j4FmMMrEwsehfnXj
 PexvMSpM6+fRTjM182OlZlhvC5HFo1JDu6jNR6ImIfo/5SzgC65X7kY68D+Vkrb+qHqL
 yPtLdNevcyMxK9AKI2Twfs/bCob/66AyT67ik43Zg143ruM0NEW8nIctYj5DOE50RHhc
 bh0FceeA9iNG8+EGsNMAXlrOGlwrMpWFm9nuvtduLpn4eTVlmbvUf4vwXieebj+ddYH+
 Hlu/3F/DM2SG5ZRYFzI6TcIAIwanZsgHbkvYGwH0PasTSC978NIZAriF74Ty732sq7Fw
 3F6w==
X-Gm-Message-State: AOAM531iN+ztP05jLI9R2RSa6yIW6QQeQ1qj0zbVHJHPslrKyGKRI+Dn
 OFYAmu5xgutj/wTbNr1m7Cs=
X-Google-Smtp-Source: ABdhPJyPkOft8TbKPYvQCS1QSA6hi7IuaN8bPx6S0Pds6rTEf2atLpBjKnIb6RBkuX2ueZYRYKCrlg==
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr2389799ejb.521.1603806488859; 
 Tue, 27 Oct 2020 06:48:08 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id p3sm1014684edy.38.2020.10.27.06.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:48:07 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:48:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 29/52] memory: tegra-mc: Add interconnect framework
Message-ID: <20201027134805.GJ1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-30-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-30-digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0493218004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0493218004==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jIYo0VRlfdMI9fLa"
Content-Disposition: inline


--jIYo0VRlfdMI9fLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:17:12AM +0300, Dmitry Osipenko wrote:
> Now Memory Controller is a memory interconnection provider. This allows
> us to use interconnect API for tuning of memory configuration. This patch
> adds common ICC core and adds hooks which should be implemented by the SoC
> drivers.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig |   1 +
>  drivers/memory/tegra/mc.c    | 129 +++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/mc.h    |   8 +++
>  include/soc/tegra/mc.h       |  16 +++++
>  4 files changed, 154 insertions(+)
>=20
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 9f0a96bf9ccc..b38e5255effe 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -3,6 +3,7 @@ config TEGRA_MC
>  	bool "NVIDIA Tegra Memory Controller support"
>  	default y
>  	depends on ARCH_TEGRA
> +	select INTERCONNECT
>  	help
>  	  This driver supports the Memory Controller (MC) hardware found on
>  	  NVIDIA Tegra SoCs.
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 12ea2c79205a..53d61b05ebf8 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -639,6 +639,133 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(in=
t irq, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static struct icc_node_data *
> +tegra_mc_of_icc_xlate_extended(struct of_phandle_args *spec, void *data)
> +{
> +	struct icc_provider *provider =3D data;
> +	unsigned int idx =3D spec->args[0];
> +	struct icc_node_data *ndata;
> +	struct icc_node *node;
> +
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		if (node->id !=3D idx)
> +			continue;
> +
> +		ndata =3D kzalloc(sizeof(*ndata), GFP_KERNEL);
> +		if (!ndata)
> +			return ERR_PTR(-ENOMEM);
> +
> +		ndata->node =3D node;
> +
> +		/* these clients are isochronous by default on all SoCs */
> +		if (strstarts(node->name, "display") ||
> +		    strstarts(node->name, "ptc") ||
> +		    strstarts(node->name, "vi"))
> +			ndata->tag =3D TEGRA_MC_ICC_TAG_ISO;

This looks like something that might be better left to the drivers to
decide. Doing this here seems okay for now, but I suspect that this will
get fairly complicated to keep accurate as we add more clients later on.

> +
> +		return ndata;
> +	}
> +
> +	pr_err("%s: invalid client index %u\n", __func__, idx);

Perhaps use "dev_err(provider->dev, ...);"?

> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +/*
> + * Memory Controller (MC) has few Memory Clients that are issuing memory
> + * bandwidth allocation requests to the MC interconnect provider. The MC
> + * provider aggregates the requests and then sends the aggregated request
> + * up to the External Memory Controller (EMC) interconnect provider which
> + * re-configures hardware interface to External Memory (EMEM) in accorda=
nce
> + * to the required bandwidth. Each MC interconnect node represents an
> + * individual Memory Client.
> + *
> + * Memory interconnect topology:
> + *
> + *               +----+
> + * +--------+    |    |
> + * | TEXSRD +--->+    |
> + * +--------+    |    |
> + *               |    |    +-----+    +------+
> + *    ...        | MC +--->+ EMC +--->+ EMEM |
> + *               |    |    +-----+    +------+
> + * +--------+    |    |
> + * | DISP.. +--->+    |
> + * +--------+    |    |
> + *               +----+
> + */
> +static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
> +{
> +	struct icc_node *node;
> +	unsigned int i;
> +	int err;
> +
> +	/* older device-trees don't have interconnect properties */
> +	if (!of_find_property(mc->dev->of_node, "#interconnect-cells", NULL) ||
> +	    !mc->soc->icc_ops)
> +		return 0;

This indicates that this property is indeed optional, so the bindings
should reflect that.

> +
> +	mc->provider.dev =3D mc->dev;
> +	mc->provider.data =3D &mc->provider;
> +	mc->provider.set =3D mc->soc->icc_ops->set;
> +	mc->provider.aggregate =3D mc->soc->icc_ops->aggregate;
> +	mc->provider.xlate_extended =3D tegra_mc_of_icc_xlate_extended;
> +
> +	err =3D icc_provider_add(&mc->provider);
> +	if (err)
> +		goto err_msg;
> +
> +	/* create Memory Controller node */
> +	node =3D icc_node_create(TEGRA_ICC_MC);
> +	err =3D PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name =3D "Memory Controller";
> +	icc_node_add(node, &mc->provider);
> +
> +	/* link Memory Controller to External Memory Controller */
> +	err =3D icc_link_create(node, TEGRA_ICC_EMC);
> +	if (err)
> +		goto remove_nodes;
> +
> +	for (i =3D 0; i < mc->soc->num_clients; i++) {
> +		/* create MC client node */
> +		node =3D icc_node_create(mc->soc->clients[i].id);
> +		err =3D PTR_ERR_OR_ZERO(node);
> +		if (err)
> +			goto remove_nodes;
> +
> +		node->name =3D mc->soc->clients[i].name;
> +		icc_node_add(node, &mc->provider);

I'm not fully familiar with how these nodes are set up, but would it be
possible to set the isochronous tag here already? I'd still prefer this
to be up to the drivers because I think that nicely localizes the
device-specific information in the driver, but if that's not an option,
then doing it here, based on lookup data from the MC clients table
sounds like the next best thing.

> +		/* link Memory Client to Memory Controller */
> +		err =3D icc_link_create(node, TEGRA_ICC_MC);
> +		if (err)
> +			goto remove_nodes;
> +	}
> +
> +	/*
> +	 * MC driver is registered too early, so early that generic driver
> +	 * syncing doesn't work for the MC. But it doesn't really matter
> +	 * since syncing works for the EMC drivers, hence the we can sync
> +	 * the MC driver by ourselves and then EMC will complete syncing of
> +	 * the whole ICC state.
> +	 */
> +	icc_sync_state(mc->dev);
> +
> +	return 0;
> +
> +remove_nodes:
> +	icc_nodes_remove(&mc->provider);
> +del_provider:
> +	icc_provider_del(&mc->provider);
> +err_msg:
> +	dev_err(mc->dev, "failed to initialize ICC: %d\n", err);
> +
> +	return err;
> +}
> +
>  static int tegra_mc_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -747,6 +874,8 @@ static int tegra_mc_probe(struct platform_device *pde=
v)
>  		}
>  	}
> =20
> +	tegra_mc_interconnect_setup(mc);

Do you want to check the return value here for errors? If not, might as
well make the function return void.

> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index afa3ba45c9e6..abeb6a2cc36a 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -115,4 +115,12 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
>  extern const struct tegra_mc_soc tegra210_mc_soc;
>  #endif
> =20
> +/*
> + * These IDs are for internal use of Tegra's ICC, the values are chosen
> + * such that they don't conflict with the device-tree ICC node IDs.
> + */
> +#define TEGRA_ICC_EMC		1000
> +#define TEGRA_ICC_EMEM		2000
> +#define TEGRA_ICC_MC		3000

Sounds to me like these could equally well be 1000, 1001 and 1002. Why
leave these large holes in the number space?

Thierry

--jIYo0VRlfdMI9fLa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YJRMACgkQ3SOs138+
s6Et4BAAv24Xi6hJLtqrXMwwXWuVn9rCYMZhjWYKdiD80cw1gpefrEbNXkaMdOAB
fMB0dMlKfaC3oMvx/JMft021wzm3vAU3nTX1agj0dBtclFW7b2ceDUN3nvwMCauy
//6IKx9BArWOPiuHknaqhquBz0lh9WIW+3qJGATp1CDZj49CmsnztA0liOUMI37h
HNEF2aO6M5ghuLfVTxSduviGrhygTaR2lLo7dIVevlU+8tJ9E/bQB1rMCHxHCYOV
49XRJ9kbEPGdgWXmjY7v8ViwIJPO0fax18etKikptMCa+6cGGU6QheUy5b2NjhM8
MylnoiBUaKLLimZeBOmyfiVGtpsd3QxcP6lDPDfntUdh9Tn9OIKCaYYN1C+0pA0c
rC+UdH6z0BZB0hDBQHZJtdYzQAnQWm7HemV026N8bnoKe/3Bc5GiccDIjUUM17Hz
0xrYJJhVcpGFs5iFg4hlk8bnpKspWsaZsG1UVDMrI2KNGxNvgCgidoo0xzXA+3X9
HlVyArZSGR7SwPZh0cpDfLOq3Akmk9PmVImht/AJbpr4CX9BCP+PKPVKCm4Ne5eV
p/rdVsRtQJKiS4T0jov3iEEftDFkDTy+z9bN4PWw3GHTAaqnuaA10oocnyb6Wmqs
ksDd1yf5MHAne18Sn6kti91GBh4tqV0EtPaBHSxfrxMSm6DehhQ=
=m83N
-----END PGP SIGNATURE-----

--jIYo0VRlfdMI9fLa--

--===============0493218004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0493218004==--
