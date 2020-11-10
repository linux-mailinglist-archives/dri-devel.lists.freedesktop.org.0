Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1332AE0F0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 21:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A3389CB3;
	Tue, 10 Nov 2020 20:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E260889CB3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 20:47:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so4545596wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 12:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JKOlzvpbWFsw2iYUxRdGhDaWwqhcm/XwpcwUseGbR74=;
 b=BfwOe253mIIwyuY9vhdchEEJQznuJuf8hgScBzwQXYqtOaWL2thJUGjBjxHsW4ciuW
 hsCBqPkfl0FEaHdmn9kHXW5Oll4hJH7gQltVRSnpowkkCOQOdI7mZfiE8OxFD3eAgdTn
 nhsMQRSvI65+IdSdXPHUpTgOL3AYOzq8HzvuxO2xLdFjZRskbr1F4do0f1RcFiXdN71z
 IOqjoFpRGHKbkk8UF9MBrBFB4HqsXeyiCYx/lrKvthDCNRoXo/DIBHj4RbiF13dGUTcA
 cZqO/z22HSS63vf3/Fdnx9ZJSvhgTSdeKLjSXmnDLt6m9U/oJ0dOH47CYuMxCuHbvS/E
 qhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JKOlzvpbWFsw2iYUxRdGhDaWwqhcm/XwpcwUseGbR74=;
 b=qe+Bh9samepJi1bmjjT0YgOrD/4VVNsdp1itzc+96dMWB24OUF8A6cJ/ErEKFR56Jc
 8bJf46mE+haE+WtyadZc9FBNDhUPpagZYnM4IVpfHI0MG6o2Zu41XEeKLw/sOULQy+qS
 DHNzNv9am8v0n7QKkfdnFubeYP8Ysn5BYcLWt7xejRhnkPKzUQME9Cd7s9HlkW8ERkVs
 JlRE248Tdo8LHBhtUNhCgAlnDp7Zl71yJ069Yv+2bNMuWfvklTBoND+qnbagdDJ1plsK
 DqAQQPOFGq9rOYOoS4QRg+ORH8yDF5znU9WVu+FU0s1c1QS8y+EXgOPHWHO2BHnZGBD0
 uEUA==
X-Gm-Message-State: AOAM530wPkMV4kGMirn/moVoXRYH1KmaJkFCja+VjEQTI0p31KZfoNBc
 /R9eYR1kO+ZsmJClg8vY7yg=
X-Google-Smtp-Source: ABdhPJy49c1lUX+wu+3W3Zy5IcL9JRUtvkaxAgpOAl1TJEHa60imDaQR8PoYxaPbPv19myRFV1n2IQ==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr969948wmk.127.1605041250538;
 Tue, 10 Nov 2020 12:47:30 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id f4sm18998572wrq.54.2020.11.10.12.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 12:47:29 -0800 (PST)
Date: Tue, 10 Nov 2020 21:47:27 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 07/30] soc/tegra: Add sync state API
Message-ID: <20201110204727.GG2375022@ulmo>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-8-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201104234427.26477-8-digetx@gmail.com>
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: multipart/mixed; boundary="===============0139322835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0139322835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NY6JkbSqL3W9mApi"
Content-Disposition: inline


--NY6JkbSqL3W9mApi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 02:44:04AM +0300, Dmitry Osipenko wrote:
> Introduce sync state API that will be used by Tegra device drivers. This
> new API is primarily needed for syncing state of SoC devices that are left
> ON after bootloader or permanently enabled. All these devices belong to a
> shared CORE voltage domain, and thus, we needed to bring all the devices
> into expected state before the voltage scaling could be performed.
>=20
> All drivers of DVFS-critical devices shall sync theirs the state before
> Tegra's voltage regulator coupler will be allowed to perform a system-wide
> voltage scaling.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/common.c | 152 ++++++++++++++++++++++++++++++++++++-
>  include/soc/tegra/common.h |  22 ++++++
>  2 files changed, 170 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> index 3dc54f59cafe..f9b2b6f57887 100644
> --- a/drivers/soc/tegra/common.c
> +++ b/drivers/soc/tegra/common.c
> @@ -3,13 +3,52 @@
>   * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
> +#define dev_fmt(fmt)	"%s: " fmt, __func__
> +#define pr_fmt(fmt)	"%s: " fmt, __func__
> +
> +#include <linux/export.h>
> +#include <linux/init.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
> =20
>  #include <soc/tegra/common.h>
> =20
> +#define terga_soc_for_each_device(__dev) \

tegra_soc_for_each_device

> +	for ((__dev) =3D tegra_soc_devices; (__dev) && (__dev)->compatible; \
> +	     (__dev)++)
> +
> +struct tegra_soc_device {
> +	const char *compatible;
> +	const bool dvfs_critical;
> +	unsigned int sync_count;
> +};
> +
> +static DEFINE_MUTEX(tegra_soc_lock);
> +static struct tegra_soc_device *tegra_soc_devices;
> +
> +/*
> + * DVFS-critical devices are either active at a boot time or permanently
> + * active, like EMC for example.  System-wide DVFS should be deferred un=
til
> + * drivers of the critical devices synced theirs state.
> + */
> +
> +static struct tegra_soc_device tegra20_soc_devices[] =3D {
> +	{ .compatible =3D "nvidia,tegra20-dc", .dvfs_critical =3D true, },
> +	{ .compatible =3D "nvidia,tegra20-emc", .dvfs_critical =3D true, },
> +	{ }
> +};
> +
> +static struct tegra_soc_device tegra30_soc_devices[] =3D {
> +	{ .compatible =3D "nvidia,tegra30-dc", .dvfs_critical =3D true, },
> +	{ .compatible =3D "nvidia,tegra30-emc", .dvfs_critical =3D true, },
> +	{ .compatible =3D "nvidia,tegra30-pwm", .dvfs_critical =3D true, },
> +	{ }
> +};
> +
>  static const struct of_device_id tegra_machine_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra20", },
> -	{ .compatible =3D "nvidia,tegra30", },
> +	{ .compatible =3D "nvidia,tegra20", .data =3D tegra20_soc_devices, },
> +	{ .compatible =3D "nvidia,tegra30", .data =3D tegra30_soc_devices, },
>  	{ .compatible =3D "nvidia,tegra114", },
>  	{ .compatible =3D "nvidia,tegra124", },
>  	{ .compatible =3D "nvidia,tegra132", },
> @@ -17,7 +56,7 @@ static const struct of_device_id tegra_machine_match[] =
=3D {
>  	{ }
>  };
> =20
> -bool soc_is_tegra(void)
> +static const struct of_device_id *tegra_soc_of_match(void)
>  {
>  	const struct of_device_id *match;
>  	struct device_node *root;
> @@ -29,5 +68,110 @@ bool soc_is_tegra(void)
>  	match =3D of_match_node(tegra_machine_match, root);
>  	of_node_put(root);
> =20
> -	return match !=3D NULL;
> +	return match;
> +}
> +
> +bool soc_is_tegra(void)
> +{
> +	return tegra_soc_of_match() !=3D NULL;
> +}
> +
> +void tegra_soc_device_sync_state(struct device *dev)
> +{
> +	struct tegra_soc_device *soc_dev;
> +
> +	mutex_lock(&tegra_soc_lock);
> +	terga_soc_for_each_device(soc_dev) {

tegra_soc_for_each_device

> +		if (!of_device_is_compatible(dev->of_node, soc_dev->compatible))
> +			continue;
> +
> +		if (!soc_dev->sync_count) {
> +			dev_err(dev, "already synced\n");
> +			break;
> +		}
> +
> +		/*
> +		 * All DVFS-capable devices should have the CORE regulator
> +		 * phandle.  Older device-trees don't have it, hence state
> +		 * won't be synced for the older DTBs, allowing them to work
> +		 * properly.
> +		 */
> +		if (soc_dev->dvfs_critical &&
> +		    !device_property_present(dev, "core-supply")) {
> +			dev_dbg(dev, "doesn't have core supply\n");
> +			break;
> +		}
> +
> +		soc_dev->sync_count--;
> +		dev_dbg(dev, "sync_count=3D%u\n", soc_dev->sync_count);
> +		break;
> +	}
> +	mutex_unlock(&tegra_soc_lock);
> +}
> +EXPORT_SYMBOL_GPL(tegra_soc_device_sync_state);
> +
> +bool tegra_soc_dvfs_state_synced(void)
> +{
> +	struct tegra_soc_device *soc_dev;
> +	bool synced_state =3D true;
> +
> +	/*
> +	 * CORE voltage scaling is limited until drivers of the critical
> +	 * devices synced theirs state.
> +	 */
> +	mutex_lock(&tegra_soc_lock);
> +	terga_soc_for_each_device(soc_dev) {

tegra_soc_for_each_device

I wonder if you copy/pasted this or if you got really lucky to mistype
this all three times.

> +		if (!soc_dev->sync_count || !soc_dev->dvfs_critical)
> +			continue;
> +
> +		pr_debug_ratelimited("%s: sync_count=3D%u\n",
> +				     soc_dev->compatible, soc_dev->sync_count);
> +
> +		synced_state =3D false;
> +		break;
> +	}
> +	mutex_unlock(&tegra_soc_lock);
> +
> +	return synced_state;
> +}
> +
> +static int __init tegra_soc_devices_init(void)
> +{
> +	struct device_node *np, *prev_np =3D NULL;
> +	struct tegra_soc_device *soc_dev;
> +	const struct of_device_id *match;
> +
> +	if (!soc_is_tegra())
> +		return 0;
> +
> +	match =3D tegra_soc_of_match();
> +	tegra_soc_devices =3D (void *)match->data;
> +
> +	/*
> +	 * If device node is disabled in a device-tree, then we shouldn't
> +	 * care about this device. Even if device is active during boot,
> +	 * its clock will be disabled by CCF as unused.
> +	 */
> +	terga_soc_for_each_device(soc_dev) {
> +		do {
> +			/*
> +			 * Devices like display controller have multiple
> +			 * instances with the same compatible. Hence we need
> +			 * to walk up the whole tree in order to account those
> +			 * multiple instances.
> +			 */
> +			np =3D of_find_compatible_node(prev_np, NULL,
> +						     soc_dev->compatible);
> +			of_node_put(prev_np);
> +			prev_np =3D np;
> +
> +			if (of_device_is_available(np)) {
> +				pr_debug("added %s\n", soc_dev->compatible);
> +				soc_dev->sync_count++;
> +			}
> +		} while (np);

Maybe use for_each_compatible_node() for that inside loop?

> +	}
> +
> +	return 0;
>  }
> +postcore_initcall_sync(tegra_soc_devices_init);

This is unfortunate. I recall having this discussion multiple times and
one idea that has been floating around for a while was to let a driver
bind against the top-level "bus" node. That has the advantage that it
both anchors the code somewhere, so we don't have to play this game of
checking for the SoC with soc_is_tegra(), and it properly orders this
with respect to the child devices, so we wouldn't have to make this a
postcore_initcall.

Might be worth looking at that again, but for now this seems okay.

Thierry

--NY6JkbSqL3W9mApi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q/F0ACgkQ3SOs138+
s6Ffhg//ZzNuVrroPGuv4tZqVJ5AXAx//1JvKJJ/APDlLKqIvIYw77b6jIxkHb/t
Ay3psh0eNC+cr8tegl6spNx7S66HX1FEbKezsbGO0XqgebaZPtvHx4mtU7L1nBxw
ysDX2sRKNa//bxU8YyLrhm/2jlrGBBOFQvxmYu62fE6vgN5tQqECAcmscFy+BsgA
74wHiJRnj0PJXFoQZ6T2lkFfWkfhexPGIq988VELclUjQTfn6kQiXHfHwEPNcni0
haS3AuFGLsTZqb6c9aI0DKcOS0y+gFEUx+WYWV3z33I6rUS3f1mfJXpIyTTAlU1j
ENciW+rTnKilsQlE9WqY7B5gmH4f8hZnq35JK2HRDFXQj8g/03C02XjPp2aoDczm
/3Nv2feu//pkYpMMTZaqeUu7AJVUnfavOMCBlwhyEuaieiVFE31X1BRdLcJ+mpyF
JbKlY/+i+UCb14jP6sGMKvnxG5dxkm3pYs90XcVHMIAsXsrPNIL0r04Eh1QszqOJ
uxGf7bpt7L09Yl7CyxahtA+AO+Ntd5dGuDHlRAOSUaMF4BaXHe3LgoNfWhEnF/Qa
BRIZ3zewRwMVSNCted4nf5x9hymxF743g3kj6AxTmQqbEs5gmR9BxG+I4oEU/jjb
d6Q/+Zk40xAgCn9dyBkNIqKbUTcQCvcDxSNGYsmkzduZ3tqiieU=
=CsZi
-----END PGP SIGNATURE-----

--NY6JkbSqL3W9mApi--

--===============0139322835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0139322835==--
