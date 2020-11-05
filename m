Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CD52A917F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35206EE2F;
	Fri,  6 Nov 2020 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947B16E17D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 16:35:32 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9F8FEB27;
 Thu,  5 Nov 2020 11:35:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 05 Nov 2020 11:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=vmjAsiDqlapEF3rFexMfeeIFKBP
 I06hmDX+9LrQAzNo=; b=NLwNQdhlwdAJJhlV7669bVJ/+KRpH3ntGwJrXk217xt
 r94VPT9WbhjPtr58RzfDxnXLPzYUjWUXbIMyennPh67DkOiLTDLtNOCl6DQ/LPlA
 JQhV7Y0qxTNWYUCJUM/54h0LwaLUoGwh7AWhBcYVR+Uw9PubwRIBjfQVW1jQWBT/
 iG2q383aoH+KZ5ZynSPxP0q5pau7T4dLhA+TwImaovONeBCynVSTHNsQ509RUrfe
 M497RP82wTA5XwfLYqPhmUo/OZmr0GqX8b0IcDGtSdz6h+ZbnBOciuQz1dI9fjqU
 wLRsaFvxMG5VUjprmpWgZFLIWRUgpjttIBUvPxEiPfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vmjAsi
 DqlapEF3rFexMfeeIFKBPI06hmDX+9LrQAzNo=; b=He3pX6gxDjIqfFhnG9GRAx
 BNlrnrejpJvd8ytjaWGCiO1Zqyxt1cbUsZ4Fx9tfQA2OGtPK0voXfI5gyWGKb5EG
 zvSL/ZfjkMcsoQA2r2rHnnxMUMg23D6sKGX9U0qNBHgwByrXb75lZGygOaPGNdNJ
 atK+tmtRC7vddV2YgyVfQdMjtg0furMz0+Lys1Nq3bWQ0bme25w7Szk2WMMop5QX
 zM7wIu+1uaRJUI/GZ5jh6iTvYe3SSNNUzrKv938Aa4J0Th7dQBhLf9NS2UHNW7is
 IEd3/q1r/YrDbElnXeLEz8wG8CQKT9jIqt3riWrJYLdyTNmvje8X7Xx49GM/tNtA
 ==
X-ME-Sender: <xms:0SmkX-1kpDiVX5MezMfs5CziAgjAcLk78vuORcoIfMp1Ne2rKh0mgg>
 <xme:0SmkXxEDHqkwB3Z0i8wdchTUTR4HZwzvzzluBDeYBJUT0Rr873xh0ljw2H8Z86nnL
 f3CasFgjMAj4GV4W3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0SmkX27slIEkOIyz70XFYp0OOZPxB-xXDP-3Is_j7302vYh5TYOvng>
 <xmx:0SmkX_3qHpccpVK2Bq8bnM1mcxQdafVtqJgvMujHFK_pwRz3qW1_5g>
 <xmx:0SmkXxEgyWKNUrsrqOZm2qyuOv-XWOhDLY40ieuKwPuI_6lkgzd5-Q>
 <xmx:0ymkXxDyWButIO4BLb1EnwN1EhxbBhx_985g3m3oHHkC2PiwZE7crA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 641CE32801D7;
 Thu,  5 Nov 2020 11:35:29 -0500 (EST)
Date: Thu, 5 Nov 2020 17:35:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/3] drm: Use state helper instead of CRTC state pointer
Message-ID: <20201105163528.lghgwaigdmir7ujt@gilmour.lan>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102133834.1176740-2-maxime@cerno.tech>
 <20201102160406.GN6112@intel.com>
 <20201103161551.tokfhcsfjtgli7wm@gilmour.lan>
 <20201103162824.GR6112@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201103162824.GR6112@intel.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0523926891=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0523926891==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4hlzsnrbkrv4m6n5"
Content-Disposition: inline


--4hlzsnrbkrv4m6n5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 06:28:24PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Nov 03, 2020 at 05:15:51PM +0100, Maxime Ripard wrote:
> > Hi Ville,
> >=20
> > On Mon, Nov 02, 2020 at 06:04:06PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Mon, Nov 02, 2020 at 02:38:33PM +0100, Maxime Ripard wrote:
> > > > Many drivers reference the crtc->pointer in order to get the curren=
t CRTC
> > > > state in their atomic_begin or atomic_flush hooks, which would be t=
he new
> > > > CRTC state in the global atomic state since _swap_state happened wh=
en those
> > > > hooks are run.
> > > >=20
> > > > Use the drm_atomic_get_new_crtc_state helper to get that state to m=
ake it
> > > > more obvious.
> > > >=20
> > > > This was made using the coccinelle script below:
> > > >=20
> > > > @ crtc_atomic_func @
> > > > identifier helpers;
> > > > identifier func;
> > > > @@
> > > >=20
> > > > (
> > > > static struct drm_crtc_helper_funcs helpers =3D {
> > > > 	...,
> > > > 	.atomic_begin =3D func,
> > > > 	...,
> > > > };
> > > > |
> > > > static struct drm_crtc_helper_funcs helpers =3D {
> > > > 	...,
> > > > 	.atomic_flush =3D func,
> > > > 	...,
> > > > };
> > > > )
> > > >=20
> > > > @@
> > > > identifier crtc_atomic_func.func;
> > > > identifier crtc, state;
> > > > symbol crtc_state;
> > > > expression e;
> > > > @@
> > > >=20
> > > >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> > > >   ...
> > > > - struct tegra_dc_state *crtc_state =3D e;
> > > > + struct tegra_dc_state *dc_state =3D e;
> > > >   <+...
> > > > -       crtc_state
> > > > +	dc_state
> > > >   ...+>
> > > >   }
> > > >=20
> > > > @@
> > > > identifier crtc_atomic_func.func;
> > > > identifier crtc, state;
> > > > symbol crtc_state;
> > > > expression e;
> > > > @@
> > > >=20
> > > >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> > > >   ...
> > > > - struct mtk_crtc_state *crtc_state =3D e;
> > > > + struct mtk_crtc_state *mtk_crtc_state =3D e;
> > > >   <+...
> > > > -       crtc_state
> > > > +	mtk_crtc_state
> > > >   ...+>
> > > >   }
> > >=20
> > > These reanames seem a bit out of scpe for this patch. But I guess you
> > > needed then to get the rest of the cocci to work on some drivers?
> >=20
> > Yeah, those two drivers already had a variable named crtc_state, calling
> > container_of on crtc->state
> >=20
> > It was cleaner to me to have an intermediate variable storing the result
> > of drm_atomic_get_new_crtc_state, but then the most obvious name was
> > taken so I had to rename those two variables before doing so.
> >=20
> > > The basic idea looks good:
> > > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >=20
> > > But I guess up to the individual driver folks to bikeshed the variable
> > > naming and whatnot.
> > >=20
> > > One thing I spotted is that a few drivers now gained two aliasing crtc
> > > state pointers in the function: one with the drm type, the other with
> > > a driver specific type. That's something we've outlawed in i915 since
> > > it was making life rather confusing. In i915 we now prefer to use only
> > > the i915 specific types in most places.
> >=20
> > I didn't spot any of those cases, do you have an example of where it
> > happened?
>=20
> eg. ast:
> +       struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_sta=
te(state,                              =20
> +                                                                        =
 crtc);                              =20
>         struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc=
_state(state,                          =20
>                                                                          =
     crtc);                          =20
>         struct ast_private *ast =3D to_ast_private(crtc->dev);           =
                                       =20
> -       struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc-=
>state);                               =20
> +       struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc_=
state);      =20
>=20
> So here both 'crtc_state' and 'ast_crtc_state' are basically the same
> thing, which can get a bit confusing especially within larger functions
> with lots of variables.=20

Ah, that kind of aliasing, ok. So it's purely an issue with
ergonomics/convenience?

It seems to be a widespread pattern (I know we're using it in vc4 and
sun4i, and from those reworks I've seen a number of drivers doing so).
I'm not entirely sure how we should fix it through coccinelle too :/

Thanks!
Maxime

--4hlzsnrbkrv4m6n5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6Qp0AAKCRDj7w1vZxhR
xZEeAPsGGubApDQQ0A13jovn1VDrhtvJJli1XpyoOXaTNea/7wEAs9H5JLDFpBlI
v3vIQl3eJrjhi+eHmlsIVyqHyrcnNwE=
=Q8eU
-----END PGP SIGNATURE-----

--4hlzsnrbkrv4m6n5--

--===============0523926891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0523926891==--
