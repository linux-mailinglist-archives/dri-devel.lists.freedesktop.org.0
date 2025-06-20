Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749BAAE1A2B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 13:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D6510EB4E;
	Fri, 20 Jun 2025 11:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RLEauDJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F2210EB4E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:41:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C7B561786;
 Fri, 20 Jun 2025 11:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0233EC4CEE3;
 Fri, 20 Jun 2025 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750419711;
 bh=NJeI8YppKOxLx0T0KsWLoadLL/ubvvWy8yozXSRreC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RLEauDJR6/Gfwu+2GELnsQ59RddEchkKxm1P0c2X+quuWtrfShq4LkfIuAvC+wbvb
 i/nm1eaRttO/55Bly+rtsywkqF7DLy0RflVAcgR+CuDiscv5Af3pE+9Bwmk2X+8GDf
 y3uZvjwdjg3EkQxREQ9i42N2e98WWKTbx1A0cgxqBGSkjyiSNnmdhuXgh4NLhVvd3c
 VBoUHOpzBTN086z1NDz6grEqzcQUesleYAmCPfyxV0odsx9vDtDtyA6A7u6SBHUVy0
 2hz7d4YqtJ4QENnF1Xk9Z9VTA050zo4KtOCTDW9RaIxoSkjJzHOJRyVn2onTgfmA6s
 knIrvzY0/yAbw==
Date: Fri, 20 Jun 2025 13:41:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Anusha Srivatsa <asrivats@redhat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
Message-ID: <20250620-adaptable-loutish-oryx-fee75c@houat>
References: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-0-bad7eba5d117@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-3-bad7eba5d117@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="biluwndv5kawvnzs"
Content-Disposition: inline
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm-bridge-c-v1-3-bad7eba5d117@bootlin.com>
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


--biluwndv5kawvnzs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] drm/bridge: add warning for bridges not using
 devm_drm_bridge_alloc()
MIME-Version: 1.0

Hi Luca,

On Fri, Jun 20, 2025 at 11:32:08AM +0200, Luca Ceresoli wrote:
> To the best of my knowledge, all drivers in the mainline kernel adding a
> DRM bridge are now converted to using devm_drm_bridge_alloc() for
> allocation and initialization. Among others this ensures initialization of
> the bridge refcount, allowing dynamic allocation lifetime.
>=20
> devm_drm_bridge_alloc() is now mandatory for all new bridges. Code using
> the old pattern ([devm_]kzalloc + filling the struct fields +
> drm_bridge_add) is not allowed anymore.
>=20
> Any drivers that might have been missed during the conversion, patches in
> flight towards mainline and out-of-tre drivers still using the old pattern
> will already be caught by a warning looking like:
>=20
>   ------------[ cut here ]------------
>   refcount_t: addition on 0; use-after-free.
>   WARNING: CPU: 2 PID: 83 at lib/refcount.c:25 refcount_warn_saturate+0x1=
20/0x148
>   [...]
>   Call trace:
>    refcount_warn_saturate+0x120/0x148 (P)
>    drm_bridge_get.part.0+0x70/0x98 [drm]
>    drm_bridge_add+0x34/0x108 [drm]
>    sn65dsi83_probe+0x200/0x480 [ti_sn65dsi83]
>    [...]
>=20
> This warning comes from the refcount code and happens because
> drm_bridge_add() is increasing the refcount, which is uninitialized and
> thus initially zero.
>=20
> Having a warning and the corresponding stack trace is surely useful, but
> the warning text does not clarify the root problem nor how to fix it.
>=20
> Add a DRM_WARN() just before increasing the refcount, so the log will be
> much more readable:
>=20
>   [drm] DRM bridge corrupted or not allocated by devm_drm_bridge_alloc()
>   ------------[ cut here ]------------
>   refcount_t: addition on 0; use-after-free.
>   [...etc...]
>=20
> A DRM_WARN is used because drm_warn and drm_WARN require a struct
> drm_device pointer which is not yet available when adding a bridge.
>=20
> Do not print the dev_name() in the warning because struct drm_bridge has =
no
> pointer to the struct device. The affected driver should be easy to catch
> based on the following stack trace however.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v8
> ---
>  drivers/gpu/drm/drm_bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f001bbe95559aabf0aac9f25f89250ad4e1ad9c8..7d511c28608f1d8ea8fbb81d0=
0efa9e227b02a13 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -295,6 +295,9 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
>   */
>  void drm_bridge_add(struct drm_bridge *bridge)
>  {
> +	if (kref_read(&bridge->refcount) =3D=3D 0)
> +		DRM_WARN("DRM bridge corrupted or not allocated by devm_drm_bridge_all=
oc()\n");
> +

I'm fine with it on principle, but I wonder if using bridge->container
is set wouldn't be a more obvious way to check it?

Maxime

--biluwndv5kawvnzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFVI9wAKCRAnX84Zoj2+
dru/AYDf1o82ABSqpVDUzoRUAi2lnvEW2Ru8cHWndoy8kfCGn3V0PIo/dHgnQGzG
Km9lf6gBfiMcTbF2bR6qv6gaCVUy87maQ0869Q1HyfDa31GCT7YV4OaKHt6Ztel1
NSnRrqzLJw==
=gzYf
-----END PGP SIGNATURE-----

--biluwndv5kawvnzs--
