Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564D9ED312
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 18:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A7110EBBA;
	Wed, 11 Dec 2024 17:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aMm4vFRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85D110EBBA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 17:08:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 963ED5C6754;
 Wed, 11 Dec 2024 17:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98649C4CED4;
 Wed, 11 Dec 2024 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733936884;
 bh=WurS4i/vhYhierKFv+fQ7duUGagXxLOTVVTuNS+f3Zg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aMm4vFRcQrWLa64Jnnv8vMbznT5rJ6oRYP14InrnsLYxxFEd8DijAXDOvQJCdyff4
 4PFmCoL/UgZbOj7rxwbQT/ij4PtZFoNAxEpnkvDRK84mf+e0KO7KmBE9LaTPw8Nmye
 j0pLsAtsvb/z2I127QyTdNGnzEAxHhA8HREgjesLgz+Pxwox1rjIKzqAuriMTedo30
 9BENI1HujkH+QG5saPh+z2UR4BI8Qdy7qmL3vJWYJsRCGuSTOGafRc5Fn1SzbRczYc
 LgCYHDf9iv4AMpe+w5r2u5aMTxx9hus4oH0E6QfbQxTPWktcBvCYMxCC8yObI73L5n
 55EFEWZb14+jw==
Date: Wed, 11 Dec 2024 18:07:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes
 handling on RK3588 HDMI0
Message-ID: <64vc5pkj44w3qxf5wkcxgghpwhvoagzemcsfqmi7fhsxt7vlqd@yfcgloi45ygh>
References: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
 <20241211-vop2-hdmi0-disp-modes-v2-3-471cf5001e45@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gljxsvjk34mjobss"
Content-Disposition: inline
In-Reply-To: <20241211-vop2-hdmi0-disp-modes-v2-3-471cf5001e45@collabora.com>
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


--gljxsvjk34mjobss
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes
 handling on RK3588 HDMI0
MIME-Version: 1.0

On Wed, Dec 11, 2024 at 12:15:07PM +0200, Cristian Ciocaltea wrote:
> The RK3588 specific implementation is currently quite limited in terms
> of handling the full range of display modes supported by the connected
> screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are just a
> few of them.
>=20
> Additionally, it doesn't cope well with non-integer refresh rates like
> 59.94, 29.97, 23.98, etc.
>=20
> Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
> all display modes up to 4K@60Hz.
>=20
> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 ++++++++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 8b2f53ffefdbf1cc8737b3a86e630a03a7fd9348..393fe6aa170aaee9663c4a6d9=
8c1cd6a5ef79392 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -158,6 +158,7 @@ struct vop2_video_port {
>  	struct drm_crtc crtc;
>  	struct vop2 *vop2;
>  	struct clk *dclk;
> +	struct clk *dclk_src;
>  	unsigned int id;
>  	const struct vop2_video_port_data *data;
> =20
> @@ -212,6 +213,7 @@ struct vop2 {
>  	struct clk *hclk;
>  	struct clk *aclk;
>  	struct clk *pclk;
> +	struct clk *pll_hdmiphy0;
> =20
>  	/* optional internal rgb encoder */
>  	struct rockchip_rgb *rgb;
> @@ -220,6 +222,8 @@ struct vop2 {
>  	struct vop2_win win[];
>  };
> =20
> +#define VOP2_MAX_DCLK_RATE		600000 /* kHz */
> +
>  #define vop2_output_if_is_hdmi(x)	((x) =3D=3D ROCKCHIP_VOP2_EP_HDMI0 || \
>  					 (x) =3D=3D ROCKCHIP_VOP2_EP_HDMI1)
> =20
> @@ -1033,6 +1037,9 @@ static void vop2_crtc_atomic_disable(struct drm_crt=
c *crtc,
> =20
>  	vop2_crtc_disable_irq(vp, VP_INT_DSP_HOLD_VALID);
> =20
> +	if (vp->dclk_src)
> +		clk_set_parent(vp->dclk, vp->dclk_src);
> +
>  	clk_disable_unprepare(vp->dclk);
> =20
>  	vop2->enable_count--;
> @@ -2049,6 +2056,27 @@ static void vop2_crtc_atomic_enable(struct drm_crt=
c *crtc,
> =20
>  	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
> =20
> +	/*
> +	 * Switch to HDMI PHY PLL as DCLK source for display modes up
> +	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
> +	 */
> +	if (vop2->pll_hdmiphy0 && mode->crtc_clock <=3D VOP2_MAX_DCLK_RATE) {
> +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask=
) {
> +			struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(encoder);
> +
> +			if (rkencoder->crtc_endpoint_id =3D=3D ROCKCHIP_VOP2_EP_HDMI0) {
> +				if (!vp->dclk_src)
> +					vp->dclk_src =3D clk_get_parent(vp->dclk);
> +
> +				ret =3D clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> +				if (ret < 0)
> +					drm_warn(vop2->drm,
> +						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
> +				break;
> +			}
> +		}
> +	}
> +

It seems pretty fragile to do it at atomic_enable time, even more so
since you don't lock the parent either.

Any reason not to do it in the DRM or clock driver probe, and make sure
you never change the parent somehow?

Maxime

--gljxsvjk34mjobss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1nG7QAKCRAnX84Zoj2+
dpdmAYCCcouiF/N2wsyzoJ03sS1P6+Vt3Goa72/Bp5LrI0BNyZANLkbqfClu1Jcb
N3gpVKsBf2Fo7XESPECmzfBSnoFo1ZnN7OYvO+VaqOlfsdQFJ87erU462RtfsyrY
62pq8Cr9hg==
=5eEH
-----END PGP SIGNATURE-----

--gljxsvjk34mjobss--
