Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE698AEE4E0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 18:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEF110E050;
	Mon, 30 Jun 2025 16:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="em3+dwoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2538910E050
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 16:44:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 39E0D61126;
 Mon, 30 Jun 2025 16:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95545C4CEE3;
 Mon, 30 Jun 2025 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751301866;
 bh=haXvT+qQr0i3RgUWCpz7Aw4aNiyZnhRNaMKipc3yGj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=em3+dwoJ3pHs3lEeFsL2W74Mcz/LgGWdwAFLqq6i7Htvr8nAFHlutcddnCLl51/nX
 om5RH6ctWyTYy1NqlOJ6Js81jAjQwonp/1FjM1FwaP9QGZtXOd6wCqIhnmpcZvd111
 IrmmgoteQjsgbtFAPtKAS7n6WhDzN8rBeD0E27NCmF2yhG3x+IadjjFWlHVlJPFWMo
 qwV6UCz/29M4iDTQV7hZomt8M5O7RXVDhFmt9Ue+lSblvX7BNT+n3c6seMY0YG0HKq
 gJtHw0YOBDGrFVltJNDTcEeaNCwuEzLcZA/6vxWIUQxodsriSDXl0anv9JYy9OyvVA
 IotCJ06/4kEGg==
Date: Mon, 30 Jun 2025 18:44:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Damon Ding <damon.ding@rock-chips.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
Message-ID: <20250630-famous-dark-boar-89bed7@houat>
References: <CGME20250627165702eucas1p12dbc50fea261d6846e67880bbef5c564@eucas1p1.samsung.com>
 <20250627165652.580798-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6teofcthvsm2miws"
Content-Disposition: inline
In-Reply-To: <20250627165652.580798-1-m.szyprowski@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6teofcthvsm2miws
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API
MIME-Version: 1.0

Hi,

On Fri, Jun 27, 2025 at 06:56:52PM +0200, Marek Szyprowski wrote:
> -static int analogix_dp_create_bridge(struct drm_device *drm_dev,
> -				     struct analogix_dp_device *dp)
> -{
> -	struct drm_bridge *bridge;
> -
> -	bridge =3D devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
> -	if (!bridge) {
> -		DRM_ERROR("failed to allocate for drm bridge\n");
> -		return -ENOMEM;
> -	}
> -
> -	dp->bridge =3D bridge;
> -
> -	bridge->driver_private =3D dp;
> -	bridge->funcs =3D &analogix_dp_bridge_funcs;
> -
> -	return drm_bridge_attach(dp->encoder, bridge, NULL, 0);
> -}
> -
>  static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>  {
>  	struct device_node *dp_node =3D dp->dev->of_node;
> @@ -1491,7 +1472,8 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> -	dp =3D devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
> +	dp =3D devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
> +				   &analogix_dp_bridge_funcs);
>  	if (!dp)
>  		return ERR_PTR(-ENOMEM);
> =20
> @@ -1643,7 +1625,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp,=
 struct drm_device *drm_dev)
>  		return ret;
>  	}
> =20
> -	ret =3D analogix_dp_create_bridge(drm_dev, dp);
> +	ret =3D drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>  	if (ret) {
>  		DRM_ERROR("failed to create bridge (%d)\n", ret);
>  		goto err_unregister_aux;

It looks like you don't set bridge->driver_private anymore. Is it on purpos=
e?

Maxime

--6teofcthvsm2miws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGK+5wAKCRAnX84Zoj2+
djVpAX0Z6MZl8v8xqFbZF7mqxqnavBFSBRm21J+8CaTdUn+C9Roa0ZEruIdFs6ca
XarlnqMBgIG5WuXHb1l1eWzviOMHAebsR2QV8ZpGtxvMCXa4QuCG/QtIR6/tZsdx
EB2OCp9y6Q==
=+FUM
-----END PGP SIGNATURE-----

--6teofcthvsm2miws--
