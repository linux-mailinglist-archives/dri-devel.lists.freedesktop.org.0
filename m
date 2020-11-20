Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F82BBEA8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C6C6E998;
	Sat, 21 Nov 2020 11:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ABF6E8AB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:26:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13F8F5802F5;
 Fri, 20 Nov 2020 06:26:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 20 Nov 2020 06:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=7lOeFFSMJheQMwXtv8HoYXCVp6X
 2rvWNJeiUTK1VOAI=; b=W2emX9339hpFZNESq0ZQcb/wwEVfOQgWr2eRIVtlBEn
 f9TDBVP/qB/tS20qlwR28pbQfC4z0aG0JalJo0casW9c0DrwvlDdBGxxRQSJ383L
 1Zh3uHud2YoNpvKdRx+RhrTMQselLd/gSJPHHEkShYlXRMsIxU5eqS+dzGsoikVN
 m6jRayb9yNAwiMbF8zIwOtpXiwm9XNFSmpjxgrdx4tgV928zKBrWdwGxWsysYT0N
 /mys2gNm73FdqOE9G8JYXDCUssmdZ+sHA510bxmmOlE5q16vMlmYMK/v3gppQHUI
 zmgwk7zzHWy9OHatGVy2qcajCd2QT6dC+UkQpBOGPXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7lOeFF
 SMJheQMwXtv8HoYXCVp6X2rvWNJeiUTK1VOAI=; b=NQFgGEPFLNYu6ZEN28ZWM5
 Ksls6A+rhr80x2eOJiNw1ltGvw4fBB4zKZWhA0jYG4+zap2SJgP8mecNz8v12nHS
 xilzAIEMRO53kVOXPz+6w8mjp6rScMYtSp96rL31mTEZvC1TsMTLR94C+IuK2WO6
 WNfegWH3LlwaLTruRwhoUZek1+qRqZePEUDAi7vMVIkpadkflOP2yLCR2MLiaxSl
 LKuDlSFT/HeMFQBbmthiLX6Rnzf+uyAjZjpvihco6dOt5o4u1zON40OZWJXADTiG
 YVe4/XSuuCAUBAN8AHlkgvNJKrBCJqInoAQ5aSKJuLzEp4jaAkg5NuUDzCCyVbnQ
 ==
X-ME-Sender: <xms:x6e3X9Z6Tb4N-NaGcLe3SgsnqlmyY86bNLzMfCkjMowA66t4DdwQFQ>
 <xme:x6e3X0atl7x6WMaAVO5MsA5Nh-ubbqQLQDPJhieGcZs4NGFTISBU5TzwwKbGJLcRJ
 xVC8woYLU9XlPUtXbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x6e3X_8CKvrOVBZVAXRh6NjpL6ieWdsgsmKKt7PU_FcWoMgg1SW6mg>
 <xmx:x6e3X7rMi2zkIb71CnS6wup1EvWZRsf_jZS1xoxiUkao11WIqhMCxA>
 <xmx:x6e3X4oLMRXOUjha4DGC4AXwV9MuIQs7AZipgB0ucj-dbVne9rOtHA>
 <xmx:yKe3X9RBqeq9KzwJekNMSeONQ8Fwm1Zgq4SRKRiEUlFATA4yhWzvyA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B6A083064AB2;
 Fri, 20 Nov 2020 06:25:58 -0500 (EST)
Date: Fri, 20 Nov 2020 12:25:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm: Pass the full state to connectors atomic functions
Message-ID: <20201120112557.wxtjzrh4msnphjlx@gilmour>
References: <20201118094758.506730-1-maxime@cerno.tech>
 <20201119152148.GI6112@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201119152148.GI6112@intel.com>
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0492222307=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0492222307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tlpbcmjqa4olzcmg"
Content-Disposition: inline


--tlpbcmjqa4olzcmg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 19, 2020 at 05:21:48PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Nov 18, 2020 at 10:47:58AM +0100, Maxime Ripard wrote:
> > The current atomic helpers have either their object state being passed =
as
> > an argument or the full atomic state.
> >=20
> > The former is the pattern that was done at first, before switching to t=
he
> > latter for new hooks or when it was needed.
> >=20
> > Now that the CRTCs have been converted, let's move forward with the
> > connectors to provide a consistent interface.
> >=20
> > The conversion was done using the coccinelle script below, and built te=
sted
> > on all the drivers.
> >=20
> > @@
> > identifier connector, connector_state;
> > @@
> >=20
> >  struct drm_connector_helper_funcs {
> > 	...
> > 	struct drm_encoder* (*atomic_best_encoder)(struct drm_connector *conne=
ctor,
> > -						   struct drm_connector_state *connector_state);
> > +						   struct drm_atomic_state *state);
> > 	...
> > }
> >=20
> > @@
> > identifier connector, connector_state;
> > @@
> >=20
> >  struct drm_connector_helper_funcs {
> > 	...
> > 	void (*atomic_commit)(struct drm_connector *connector,
> > -			      struct drm_connector_state *connector_state);
> > +			      struct drm_atomic_state *state);
> > 	...
> > }
> >=20
> > @@
> > struct drm_connector_helper_funcs *FUNCS;
> > identifier state;
> > identifier connector, connector_state;
> > identifier f;
> > @@
> >=20
> >  f(..., struct drm_atomic_state *state, ...)
> >  {
> > 	<+...
> > -	FUNCS->atomic_commit(connector, connector_state);
> > +	FUNCS->atomic_commit(connector, state);
> > 	...+>
> >  }
> >=20
> > @@
> > struct drm_connector_helper_funcs *FUNCS;
> > identifier state;
> > identifier connector, connector_state;
> > identifier var, f;
> > @@
> >=20
> >  f(struct drm_atomic_state *state, ...)
>=20
> I think there was some way to deal with these variants using a single
> rule, but maybe that required the use of the parameter list stuff
> which IIRC was a bit ugly. Probably not worth the hassle here.

Do you have any recollection of some patch that used it? I couldn't find
a cleaner way to deal with it, but I'd really like to use it if
available.

> >  {
> > 	<+...
> > -	var =3D FUNCS->atomic_best_encoder(connector, connector_state);
> > +	var =3D FUNCS->atomic_best_encoder(connector, state);
> > 	...+>
> >  }
> >=20
> > @ connector_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > (
> > static struct drm_connector_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_best_encoder =3D func,
> > 	...,
> > };
> > |
> > static struct drm_connector_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_commit =3D func,
> > 	...,
> > };
> > )
> >=20
> > @@
> > identifier connector_atomic_func.func;
> > identifier connector;
> > symbol state;
> > @@
> >=20
> >  func(struct drm_connector *connector,
> > -      struct drm_connector_state *state
> > +      struct drm_connector_state *connector_state
> >       )
> >  {
> > 	...
> > -	state
> > +	connector_state
> >  	...
> >  }
> >=20
> > @ ignores_state @
> > identifier connector_atomic_func.func;
> > identifier connector, connector_state;
> > @@
> >=20
> >  func(struct drm_connector *connector,
> >       struct drm_connector_state *connector_state)
> > {
> > 	... when !=3D connector_state
> > }
> >=20
> > @ adds_state depends on connector_atomic_func && !ignores_state @
> > identifier connector_atomic_func.func;
> > identifier connector, connector_state;
> > @@
> >=20
> >  func(struct drm_connector *connector, struct drm_connector_state *conn=
ector_state)
> >  {
> > +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_co=
nnector_state(state, connector);
> > 	...
> >  }
> >=20
> > @ depends on connector_atomic_func @
> > identifier connector_atomic_func.func;
> > identifier connector_state;
> > identifier connector;
> > @@
> >=20
> >  func(struct drm_connector *connector,
> > -     struct drm_connector_state *connector_state
> > +     struct drm_atomic_state *state
> > 	   )
> >  { ... }
> >=20
> > @ include depends on adds_state @
> > @@
> >=20
> >  #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && adds_state @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >   #include <drm/...>
>=20
> Nicely done with the depends. Also never used that stuff myself
> so thanks for the tutorial :)

You're welcome :)

> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks! I've applied it

Maxime

--tlpbcmjqa4olzcmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7enxQAKCRDj7w1vZxhR
xZcpAQD21Htg6xtbdsuuLG4jglT42HbaHs4iOzfiRlcuj8xfZwEA6E+4NtFwHZ/6
rFoOMdI0GiEVhi5DbcwvXq1Kw/JWjwA=
=gOJz
-----END PGP SIGNATURE-----

--tlpbcmjqa4olzcmg--

--===============0492222307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0492222307==--
