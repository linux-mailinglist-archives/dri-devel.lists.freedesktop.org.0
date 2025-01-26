Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5AA1CCAC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 17:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1086010E1F0;
	Sun, 26 Jan 2025 16:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bEl95+vU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F6810E1F0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 16:37:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3EAC9A40A5F;
 Sun, 26 Jan 2025 16:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4846AC4CED3;
 Sun, 26 Jan 2025 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737909454;
 bh=YeiaYiNSdYRRliwZKuUjsNZ1KssdzoykpkOT2ym0LEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEl95+vUPNR84VxhulnX1M2fc7JD+wrPtdqKRpEqDEeW8xDbK8I2U3O6iSo+4uPZ/
 k80vBbz43Uw812p+pQCZCRBuQTF5IpvKQ5j4LoVNSAgubN2CTbHX3pKRofE0Ad9A9I
 K70j/CsKOHSLOPQjLMFHprp4+1Ra5rBUTmQm+PDIT2NUJBYbK8owI0srNzrndQI5A/
 97VRPd8ZjYkspd5KPMgwaidyhbebDQ5A1IMCjmKFKpYrqR4JyTSDJj6n7yCpR7/QOb
 ZHxfL6RM8+CyPH0F/Ue7BCUgDW62oNT2uYLoKOPYi3WHySEW7n6qpMkeAJRlVGalsX
 vDT5LQw5cNwyQ==
Date: Sun, 26 Jan 2025 17:37:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: oushixiong1025@163.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH v2] drm/bridge: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ywsnnvdm7ju6gkjxa6qevhry5vzdixnmyvvxhyoxs5anxyks3m@s4tab36srpmg>
References: <20250122025600.53825-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="seypns5o3in5cxhs"
Content-Disposition: inline
In-Reply-To: <20250122025600.53825-1-oushixiong1025@163.com>
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


--seypns5o3in5cxhs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/bridge: Use
 devm_platform_get_and_ioremap_resource()
MIME-Version: 1.0

On Wed, Jan 22, 2025 at 10:56:00AM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single call=
 to
> devm_platform_get_and_ioremap_resource().
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
> V1 -> V2: Add Missing commit message.
>=20
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 +---
>  drivers/gpu/drm/bridge/microchip-lvds.c            | 5 ++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 3 +--
>  3 files changed, 4 insertions(+), 8 deletions(-)

Please split it into one patch per driver.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index bfa88409a7ff..284fd186eb5f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1605,9 +1605,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>  		return ERR_CAST(dp->clock);
>  	}
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	dp->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	dp->reg_base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);

Why do we need to use devm_platform_get_and_ioremap_resource() over
devm_platform_ioremap_resource()?

Maxime

--seypns5o3in5cxhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5ZksgAKCRAnX84Zoj2+
dkVbAYCGVFneg8cNinruXjYNYVtCVcETAOAABPTD1tXPFvr/eA1Bp9GoOp7eLuFb
j3z1Zo0Bfj7X6DYFuqc0u9avixW2Q0CaatTX+Txvv3YKGUFCLW0WqHVRIizF86Rd
i78vVWq3tQ==
=U+2v
-----END PGP SIGNATURE-----

--seypns5o3in5cxhs--
