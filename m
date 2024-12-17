Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5DB9F4EAB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90134895C1;
	Tue, 17 Dec 2024 15:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G8HrnkHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E608B895C1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6FF4AA419D8;
 Tue, 17 Dec 2024 14:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55759C4CED3;
 Tue, 17 Dec 2024 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734447640;
 bh=VodShXdWCpbBVKCy8e5GaNuMf0HhKLV7ooZXobsFe9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8HrnkHx3Z01KwxYSdVrcySzZAyq7YjyJUe8DddDbWcHIV9SAsY77YUIkBoVZE0TB
 VWnniMScYNRuxl+CMZiD5+cGjvBJaJi0MzIS/5TDSaKO8pxicwHpz6r4mQdLh2fNkI
 RTkNlXz1+r00BM1kDRurtPJbQlRCGNsmQ+hHXyawVgMqZ2Qsrk0cumfsGETwj4Qniu
 7gRfT4bYsYp1xdZ8CPyognqSaS90N7TqG8xEFJTVP/dufFVmMyab5khRpYnJfV3ihs
 rrZ9Rbt/PQJOsfrsgStCmnVTXi5iMhCw2cUVtSrUrLRTj3QgSN9x0H4QGs6P7aD2pu
 ZmkU80QWEL3ag==
Date: Tue, 17 Dec 2024 16:00:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
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
Message-ID: <20241217-ubiquitous-refreshing-finch-aceade@houat>
References: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
 <1820767.5KxKD5qtyk@diego>
 <a4ex3s23r4k6wehyoaw3aylpcexfrclrxxykjpabhdfne2jgmu@ii6riiiga2zj>
 <1756448.izSxrag8PF@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="z2odzs7z5tukhvub"
Content-Disposition: inline
In-Reply-To: <1756448.izSxrag8PF@diego>
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


--z2odzs7z5tukhvub
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes
 handling on RK3588 HDMI0
MIME-Version: 1.0

On Wed, Dec 11, 2024 at 07:01:15PM +0100, Heiko St=FCbner wrote:
> Am Mittwoch, 11. Dezember 2024, 18:47:44 CET schrieb Maxime Ripard:
> > On Wed, Dec 11, 2024 at 06:23:03PM +0100, Heiko St=FCbner wrote:
> > > Am Mittwoch, 11. Dezember 2024, 18:07:57 CET schrieb Maxime Ripard:
> > > > On Wed, Dec 11, 2024 at 12:15:07PM +0200, Cristian Ciocaltea wrote:
> > > > > The RK3588 specific implementation is currently quite limited in =
terms
> > > > > of handling the full range of display modes supported by the conn=
ected
> > > > > screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are j=
ust a
> > > > > few of them.
> > > > >=20
> > > > > Additionally, it doesn't cope well with non-integer refresh rates=
 like
> > > > > 59.94, 29.97, 23.98, etc.
> > > > >=20
> > > > > Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
> > > > > all display modes up to 4K@60Hz.
> > > > >=20
> > > > > Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> > > > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.c=
om>
> > > > > ---
> > > > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 ++++++++++++++=
++++++++++++++
> > > > >  1 file changed, 34 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drive=
rs/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > index 8b2f53ffefdbf1cc8737b3a86e630a03a7fd9348..393fe6aa170aaee96=
63c4a6d98c1cd6a5ef79392 100644
> > > > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > > @@ -158,6 +158,7 @@ struct vop2_video_port {
> > > > >  	struct drm_crtc crtc;
> > > > >  	struct vop2 *vop2;
> > > > >  	struct clk *dclk;
> > > > > +	struct clk *dclk_src;
> > > > >  	unsigned int id;
> > > > >  	const struct vop2_video_port_data *data;
> > > > > =20
> > > > > @@ -212,6 +213,7 @@ struct vop2 {
> > > > >  	struct clk *hclk;
> > > > >  	struct clk *aclk;
> > > > >  	struct clk *pclk;
> > > > > +	struct clk *pll_hdmiphy0;
> > > > > =20
> > > > >  	/* optional internal rgb encoder */
> > > > >  	struct rockchip_rgb *rgb;
> > > > > @@ -220,6 +222,8 @@ struct vop2 {
> > > > >  	struct vop2_win win[];
> > > > >  };
> > > > > =20
> > > > > +#define VOP2_MAX_DCLK_RATE		600000 /* kHz */
> > > > > +
> > > > >  #define vop2_output_if_is_hdmi(x)	((x) =3D=3D ROCKCHIP_VOP2_EP_H=
DMI0 || \
> > > > >  					 (x) =3D=3D ROCKCHIP_VOP2_EP_HDMI1)
> > > > > =20
> > > > > @@ -1033,6 +1037,9 @@ static void vop2_crtc_atomic_disable(struct=
 drm_crtc *crtc,
> > > > > =20
> > > > >  	vop2_crtc_disable_irq(vp, VP_INT_DSP_HOLD_VALID);
> > > > > =20
> > > > > +	if (vp->dclk_src)
> > > > > +		clk_set_parent(vp->dclk, vp->dclk_src);
> > > > > +
> > > > >  	clk_disable_unprepare(vp->dclk);
> > > > > =20
> > > > >  	vop2->enable_count--;
> > > > > @@ -2049,6 +2056,27 @@ static void vop2_crtc_atomic_enable(struct=
 drm_crtc *crtc,
> > > > > =20
> > > > >  	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
> > > > > =20
> > > > > +	/*
> > > > > +	 * Switch to HDMI PHY PLL as DCLK source for display modes up
> > > > > +	 * to 4K@60Hz, if available, otherwise keep using the system CR=
U.
> > > > > +	 */
> > > > > +	if (vop2->pll_hdmiphy0 && mode->crtc_clock <=3D VOP2_MAX_DCLK_R=
ATE) {
> > > > > +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->enco=
der_mask) {
> > > > > +			struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(en=
coder);
> > > > > +
> > > > > +			if (rkencoder->crtc_endpoint_id =3D=3D ROCKCHIP_VOP2_EP_HDMI0=
) {
> > > > > +				if (!vp->dclk_src)
> > > > > +					vp->dclk_src =3D clk_get_parent(vp->dclk);
> > > > > +
> > > > > +				ret =3D clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> > > > > +				if (ret < 0)
> > > > > +					drm_warn(vop2->drm,
> > > > > +						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
> > > > > +				break;
> > > > > +			}
> > > > > +		}
> > > > > +	}
> > > > > +
> > > >=20
> > > > It seems pretty fragile to do it at atomic_enable time, even more so
> > > > since you don't lock the parent either.
> > > >=20
> > > > Any reason not to do it in the DRM or clock driver probe, and make =
sure
> > > > you never change the parent somehow?
> > >=20
> > > On rk3588 we have 3 dclk_s and 2 hdmi controllers. Each video-port can
> > > use the clock generated from either the hdmi0phy or hdmi1phy, dependi=
ng
> > > on which hdmi-controller it uses.
> > >=20
> > > So you actually need to know which vpX will output to which hdmiY to =
then
> > > reparent that dclk to the hdmiphy output.
> >=20
> > The Rockchip nomenclature isn't super obvious to me, sorry. Is there a
> > datasheet for this somewhere? Also, does this vpX -> HDMI-Y mapping need
> > to be dynamic?
>=20
> VPs are CRTCs in drm-language and each of them can drive a differing
> number of output encoders. Those video-ports also have differing output
> characteristics in terms of supported resolution and other properties.
>=20
> The rk3588 TRM has leaked in a number of places, and if you find a
> TRM-part2, there is a section labeled "Display Output Interface Descripti=
on"
> that has a nice graphic for that.
>=20
> Or in short:
> - CRTC(VP)0 supports 8K resolution and can drive DP0+1, HDMI0+1, eDP0+1
>   [if I'm reading things correctly, 8K together with CRTC1 somehow)
> - CRTC(VP)1 supports 4K resolution and can drive DP0+1, HDMI0+1, eDP0+1
> - CRTC(VP)2 supports 4K resolution and can drive DP0+1, HDMI0+1, eDP01, D=
SI0+1
> - CRTC(VP)3 supports 2K resolution and can drive DSI0+1 and some BT1120,B=
T656
>=20
> so for the 3 higher resolution CRTCs there are essentially 6 or 8 output =
options
> depending on the board design

That's much clearer, thanks. I'm not entirely sure how that links to the
need for the PLL to change its parent depending on the ouput. Do you
need to always have all the outputs on the same PLL?

Maxime

--z2odzs7z5tukhvub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GSEAAKCRAnX84Zoj2+
dkN+AYDKiegGGxyLroYATo3bu+9NgN4V6vFWsPV3cL+HVPIO90qdD/0wwB0osZRt
dB2fqqcBgNf1bwZw2HAzUfRG17f2sop0XVke4ZouF27bWL3FGwuw/pJuGLisMUbr
X5LOWugv4Q==
=MSfB
-----END PGP SIGNATURE-----

--z2odzs7z5tukhvub--
