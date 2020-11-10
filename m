Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205BD2AEA76
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906C589F41;
	Wed, 11 Nov 2020 07:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F495895C8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:41:47 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 25B07580174;
 Tue, 10 Nov 2020 06:41:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 10 Nov 2020 06:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=EL8T3i21O+9NemHLKGezGmah5D5
 zkofFQZGbF5cmq8E=; b=LcF5ShO400rXjkaNvzTeEN4hAFxutyILmwPIyvPFd04
 28U7HIQz6a6l0cesvc/PWYIfyYyE9JBI06tagieW1Tp/zoSPRVeU25lTP8NfVbHA
 iMzThJwEnSZqzNIpVIhQKM86A3tK1mx27s2DUZxpByO0Pt5xRFiPqaZT565z2qSq
 /IzZsF0y91qGp1P9DFOh6Yrpniw488oAXW+0xJyvI+mX8P5ZbyQJM1xh0jVryM54
 PQDvUp4MBDQtJUVLx2goqyJFXzkg6scd7yvMU4pd4GalvrCYpQdLfLSVEDVO3Kvl
 d15qD8phjbQrVwLCJus0wyVqMvW2P/ieoDpflpjbjFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EL8T3i
 21O+9NemHLKGezGmah5D5zkofFQZGbF5cmq8E=; b=NMBQdy/AFnSn0Pm4a9n+am
 nsL1tcI/pwzyzNYAYR1OnKYxF9Fja83rAFdQh9nKx9IpqlzybCiO4nTkN12J5XRD
 7kvCpi4h+tV0gB2DMNa4qlgXUJ1ZsT3hfu7kWh66Zq+ew0B7Fn6c4SfhLo2h28CJ
 BloK5BBOocDn/pTxMcPKiaSWGiouqeC0nv7ZZkSx8Mp0b/XPO3S9imjPMfNfKNqm
 FUnbBZJ3K2CfCl646d0+mACUAnjoSTvimNsbG5TdwAB5s/rQ70V2Fp/72kyNz5Df
 cu7FM5zqdDxwE4OCuaJp3CnzrR8LD0akBsG2fvn1TTsfzcrN30DXRUpSWGUegyKA
 ==
X-ME-Sender: <xms:dXyqX30LnVzaf5LC1sahEjYi7mNsNzdibgpeVB55O6OsX55spn9fxQ>
 <xme:dXyqX2FOYsyO96DSeKNpq2oiKeYY4E6Ql24_ap-eQn2KJLPLbMhPanDuQ7fyfRDAy
 DOEQu2DMIx199oR5I4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddujedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dXyqX37dEq-RWiQFGQoQ19tkYIMQJvbyjXlZyWYet46Fv72zJhy4_A>
 <xmx:dXyqX83uEjdXLdeox6sC6kmAQxRru-JBuSQ2Pbw4RslJi7h9d611iA>
 <xmx:dXyqX6Gf25xeOzUs6wXHI-7kddX3X7nikmaR5vRypjz_fv7QkyYwnQ>
 <xmx:eHyqX4HdXFI4mDgwSBuTBhK1Ke_ozEUXo3LHAF67jccycoqTfnldtw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CBFF328006E;
 Tue, 10 Nov 2020 06:41:40 -0500 (EST)
Date: Tue, 10 Nov 2020 12:41:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm: Use state helper instead of CRTC state pointer
Message-ID: <20201110114139.ok7j6ydoilgog3tz@gilmour.lan>
References: <20201105164518.392891-1-maxime@cerno.tech>
 <15237bbb-24e8-f3b9-0d94-321bc2863fe8@suse.de>
MIME-Version: 1.0
In-Reply-To: <15237bbb-24e8-f3b9-0d94-321bc2863fe8@suse.de>
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: multipart/mixed; boundary="===============1690319250=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1690319250==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="upfzmeex5wpknoua"
Content-Disposition: inline


--upfzmeex5wpknoua
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 08:07:57PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 05.11.20 um 17:45 schrieb Maxime Ripard:
> > Many drivers reference the crtc->pointer in order to get the current CR=
TC
> > state in their atomic_begin or atomic_flush hooks, which would be the n=
ew
> > CRTC state in the global atomic state since _swap_state happened when t=
hose
> > hooks are run.
> >=20
> > Use the drm_atomic_get_new_crtc_state helper to get that state to make =
it
> > more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ crtc_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > (
> > static struct drm_crtc_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_begin =3D func,
> > 	...,
> > };
> > |
> > static struct drm_crtc_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_flush =3D func,
> > 	...,
> > };
> > )
> >=20
> > @@
> > identifier crtc_atomic_func.func;
> > identifier crtc, state;
> > symbol crtc_state;
> > expression e;
> > @@
> >=20
> >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> >   ...
> > - struct tegra_dc_state *crtc_state =3D e;
> > + struct tegra_dc_state *dc_state =3D e;
> >   <+...
> > -       crtc_state
> > +	dc_state
> >   ...+>
> >   }
> >=20
> > @@
> > identifier crtc_atomic_func.func;
> > identifier crtc, state;
> > symbol crtc_state;
> > expression e;
> > @@
> >=20
> >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> >   ...
> > - struct mtk_crtc_state *crtc_state =3D e;
> > + struct mtk_crtc_state *mtk_crtc_state =3D e;
> >   <+...
> > -       crtc_state
> > +	mtk_crtc_state
> >   ...+>
> >   }
> >=20
> > @ replaces_new_state @
> > identifier crtc_atomic_func.func;
> > identifier crtc, state, crtc_state;
> > @@
> >=20
> >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> >   ...
> > - struct drm_crtc_state *crtc_state =3D crtc->state;
> > + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate, crtc);
> >   ...
> >  }
> >=20
> > @@
> > identifier crtc_atomic_func.func;
> > identifier crtc, state, crtc_state;
> > @@
> >=20
> >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> >   struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate, crtc);
> >   ...
> > - crtc->state
> > + crtc_state
> >   ...
> >  }
> >=20
> > @ adds_new_state @
> > identifier crtc_atomic_func.func;
> > identifier crtc, state;
> > @@
> >=20
> >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> > + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate, crtc);
> >   ...
> > - crtc->state
> > + crtc_state
> >   ...
> >  }
> >=20
> > @ include depends on adds_new_state || replaces_new_state @
> > @@
> >=20
> >  #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && (adds_new_state || replaces_new_sta=
te) @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >   #include <drm/...>
> >=20
> > Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Sandy Huang <hjc@rock-chips.com>
> > Cc: "Heiko St=FCbner" <heiko@sntech.de>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied, thanks!
Maxime

--upfzmeex5wpknoua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6p8cwAKCRDj7w1vZxhR
xUmHAQCyLfmfINbSdwMdYNPN0dYUjRT9U8luFa2xK0OmaWlgwwEAlZpRSGOcLx5E
U/ZZQFWrL+2nLzWav3RY2oDaN27FugQ=
=83W1
-----END PGP SIGNATURE-----

--upfzmeex5wpknoua--

--===============1690319250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1690319250==--
