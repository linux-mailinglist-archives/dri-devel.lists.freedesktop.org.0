Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECDDA6194C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 19:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB9010EA36;
	Fri, 14 Mar 2025 18:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L1wVNbwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8ED310EA36
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 18:21:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 820085C54A7;
 Fri, 14 Mar 2025 18:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB48C4CEE3;
 Fri, 14 Mar 2025 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741976464;
 bh=kl2X8mVwSaZH4P+oC1wMNXj/evjiX1wGJ3tMBcCpssU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1wVNbwKbDzm3i2OHiUkdhMC2cbWxtIPNWUQYV9lrxpezJqu7/HcWGVSBkBHgv48N
 h+BdVTb3qNZMfrDpcM3B4GZ/PhumzL62IDZidEjyswRZCpH2TfYb31PUyXpr3wT7yY
 USIdnYdZ0h+c0sB/4qMNrorcGKWJUs0IJ3GZAQIhAy/YdIoEGX3IHc5/sTg9g8F78W
 rI2IIP5+93xW68HrYA/Sl2+m6OSHtXcW6+9gLZ6OmF40AudM8wVzRSALKjgjMPAvOi
 /7AkeQFVPNQkFJhs0h9XNEqOYZAyRlkufGEHwC2oukZrkODksegJdB9AqZLVZ1aLOK
 bBAuiJCUSEr7w==
Date: Fri, 14 Mar 2025 19:21:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with
 bridge refcount
Message-ID: <20250314-daft-woodoo-cheetah-e029c5@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mifitjekzidylpjw"
Content-Disposition: inline
In-Reply-To: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
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


--mifitjekzidylpjw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 00/11] drm/bridge: add devm_drm_bridge_alloc() with
 bridge refcount
MIME-Version: 1.0

Hi,

On Fri, Mar 14, 2025 at 11:31:13AM +0100, Luca Ceresoli wrote:
> This series improves the way DRM bridges are allocated and initialized and
> makes them reference-counted. The goal of reference counting is to avoid
> use-after-free by drivers which got a pointer to a bridge and keep it
> stored and used even after the bridge has been deallocated.
>=20
> The overall goal is supporting Linux devices with a DRM pipeline whose
> final components can be hot-plugged and hot-unplugged, including one or
> more bridges. For more details see the big picture [0].
>=20
> DRM bridge drivers will have to be adapted to the new API, which is pretty
> simple for most cases. Refcounting will have to be adopted on the two
> sides: all functions returning a bridge pointer and all code obtaining su=
ch
> a pointer. This series has just an overview of some of those conversions,
> because for now the main goal is to agree on the API.
>=20
> Series layout:
>=20
>  1. Add the new API and refcounting:
>=20
>     drm/bridge: add devm_drm_bridge_alloc()
>     drm/bridge: add support for refcounting
>=20
>  2. get/put the reference in basic operations in the bridge core:
>=20
>     drm/bridge: get/put the bridge reference in drm_bridge_add/remove()
>     drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()
>=20
>  3. as an example of changes for bridge consumers, get a reference for the
>     bridge returned by drm_bridge_chain_get_first_bridge(), have it put by
>     all callers (all users will be covered later on separately):
>=20
>     drm/bridge: add a cleanup action for scope-based drm_bridge_put() inv=
ocation
>     drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bri=
dge()
>     drm/mxsfb: put the bridge returned by drm_bridge_chain_get_first_brid=
ge()
>     drm/atomic-helper: put the bridge returned by drm_bridge_chain_get_fi=
rst_bridge()
>     drm/probe-helper: put the bridge returned by drm_bridge_chain_get_fir=
st_bridge()
>=20
>  4. convert a few bridge drivers (bridge providers) to the new API:
>=20
>     drm/bridge: ti-sn65dsi83: use dynamic lifetime management
>     drm/bridge: samsung-dsim: use dynamic lifetime management
>=20
> This work was formerly a part of my v6 DRM bridge hotplug series[0], now
> split as a standalone series with many improvements, hence the "v7" versi=
on
> number.

Except for one patch where I had comments, I think the series is in
excellent shape. We're still missing a couple of things to close this
topic though:

  - Converting the other bridge iterators/accessors to take / put the refer=
ences
  - Mass converting the drivers to devm_drm_bridge_alloc
  - Documenting somewhere (possibly in drm_bridge_init?) that it really
    shouldn't be used anymore

Maxime

--mifitjekzidylpjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9RzjQAKCRAnX84Zoj2+
diSPAYD12sjIXgXPRf7BpM6STJktvb89YmsuXfj5+lHzeniMrs6Zp+V4ziemLado
cqXTAAgBfj5T5uiMZqBaPy+UxbyoWpdNB5xJ8B5O7i7F+qiCLQoCXZjhFQdI1vaR
wbgQnB8LMA==
=oW4m
-----END PGP SIGNATURE-----

--mifitjekzidylpjw--
