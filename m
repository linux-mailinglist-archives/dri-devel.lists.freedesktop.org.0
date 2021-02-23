Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF22C322C92
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 15:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2D16E9C0;
	Tue, 23 Feb 2021 14:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BD76E9C6;
 Tue, 23 Feb 2021 14:41:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8A11E580292;
 Tue, 23 Feb 2021 09:41:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 23 Feb 2021 09:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=W5Ow9fvH75ZU0EulrQV4vENorU9
 mrOKzv5PjfArajy8=; b=GU22XeFWKMGcAZu6NWqRYgkFYnXryfc3+rlB2tk1nhN
 zH1yO4BroV86D8Wj+siHaUgnYeJECPYuoxUrrb83MoTFpzJSJphB7CNYaw5EteJZ
 Rfe2uUFGY6BHcoPSg4DF4SQKrsvwPDYYdobiTIUwMYND4GTIu0kbe2QDQrUJz9Ys
 XL+8v06HcJxiYtSVO/5pD1twtzjjYfm8ikS3vacu5DbMHaCdJ/0Bb0eQOCqUJ+xJ
 NIaaer0XVasP54dsztAiOD81TbYaNwUKzT83ztyWAR6aGwJqfbXvuoSxWKtBKTYP
 sX/HgxIZrBTwnzz8GG1ss6/7GOr1ivxZ14BClrGyHWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=W5Ow9f
 vH75ZU0EulrQV4vENorU9mrOKzv5PjfArajy8=; b=qgr4AecZXNy49Pwwcr3zO7
 TdV+JR/XzKNcIDbvGOHn1gyMulZmqUgjZE15uY4QiiJDSs5yNTNDlDvrT8aqmBBw
 m+TXy7tppkYi/athZQuOT688uMOAKQ7dD0wKr2fATxKmEcNhGq/hRsEf67pAYWel
 CW2ClVZEj/WtvMd8w9vOaLZF4/vbQKAGVKEf5TRK7VzsxG4xPY/90O6t9lIKeVT/
 1DcSLdifDN3mbzrRQzXSpVMVk4u14TpKcyvkgpa1j+tLel53b9ATvGlQIXWSFb9A
 HU6MQUGYedLJ6xeOJ9x1CoCFAY6BRqNMM/TVvqlknPHnkpZPBT690jCUju/aYCIQ
 ==
X-ME-Sender: <xms:DxQ1YHcwLkacrL4buHESnYHKnUzjsYIPVVlJYBMfFvRDM6MqeiMrAw>
 <xme:DxQ1YNINX6ny7m8oyXghU1wTT_mRfZ_k9-vxor2IQNCD8oH5QjnGopn2JvmXfufFs
 FrwJdNAWEr_OSJSzjU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DxQ1YNaDoP46QK6II2Npge5z11oEm9Qdi527yfK1TS9XQKwgMuLiVQ>
 <xmx:DxQ1YAtTvX9P0b2VSBPnZpGywjzTaKaYjRz8OjAsZ4ZT-xr086WGuA>
 <xmx:DxQ1YCtHW6OQizQezuGIpR8i1BG7bAFrv_z_qt-lNwGn9thFMHtHFQ>
 <xmx:EhQ1YGbmP5bQbsmz_bNtZPrY7XxwA4fy1g0NHauspJh91sPMYVo-bw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74C8124005D;
 Tue, 23 Feb 2021 09:41:19 -0500 (EST)
Date: Tue, 23 Feb 2021 15:41:17 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 06/11] drm: Use state helper instead of plane state
 pointer in atomic_check
Message-ID: <20210223144117.6lhuizr2zrutbkzi@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-6-maxime@cerno.tech>
 <e6e8191d-08d9-7144-bb1a-ddaa6c21eccb@suse.de>
MIME-Version: 1.0
In-Reply-To: <e6e8191d-08d9-7144-bb1a-ddaa6c21eccb@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Daniel Vetter <daniel.vetter@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2041800703=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2041800703==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="etokcv6rtvultpe4"
Content-Disposition: inline


--etokcv6rtvultpe4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Feb 22, 2021 at 10:12:49AM +0100, Thomas Zimmermann wrote:
> Am 19.02.21 um 13:00 schrieb Maxime Ripard:
> > Many drivers reference the plane->state pointer in order to get the
> > current plane state in their atomic_check hook, which would be the old
> > plane state in the global atomic state since _swap_state hasn't happened
> > when atomic_check is run.
> >=20
> > Use the drm_atomic_get_old_plane_state helper to get that state to make
> > it more obvious.
> >=20
> > This was made using the coccinelle script below:
> >=20
> > @ plane_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> >=20
> > static struct drm_plane_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_check =3D func,
> > 	...,
> > };
> >=20
> > @ replaces_old_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state, plane_state;
> > @@
> >=20
> >   func(struct drm_plane *plane, struct drm_atomic_state *state) {
> >   	...
> > -	struct drm_plane_state *plane_state =3D plane->state;
> > +	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
> >   	...
> >   }
> >=20
> > @@
> > identifier plane_atomic_func.func;
> > identifier plane, state, plane_state;
> > @@
> >=20
> >   func(struct drm_plane *plane, struct drm_atomic_state *state) {
> >   	struct drm_plane_state *plane_state =3D drm_atomic_get_old_plane_sta=
te(state, plane);
> >   	<...
> > -	plane->state
> > +	plane_state
> >   	...>
> >   }
> >=20
> > @ adds_old_state @
> > identifier plane_atomic_func.func;
> > identifier plane, state;
> > @@
> >=20
> >   func(struct drm_plane *plane, struct drm_atomic_state *state) {
> > +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_=
state(state, plane);
> >   	<...
> > -	plane->state
> > +	old_plane_state
> >   	...>
> >   }
> >=20
> > @ include depends on adds_old_state || replaces_old_state @
> > @@
> >=20
> >   #include <drm/drm_atomic.h>
> >=20
> > @ no_include depends on !include && (adds_old_state || replaces_old_sta=
te) @
> > @@
> >=20
> > + #include <drm/drm_atomic.h>
> >    #include <drm/...>
> >=20
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> However, I find 'old plane state' somewhat confusing in this context,
> because it's actually the current plane state. Would it make sense to use
> drm_atomic_get_existing_plane_state() instead?

drm_atomic_get_existing_plane_state is deprecated nowadays, in favour of ei=
ther
drm_atomic_get_old_plane_state or drm_atomic_get_new_plane_state

Maxime

--etokcv6rtvultpe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDUUDQAKCRDj7w1vZxhR
xRvbAP9dHjMFrJJN6sPJ07XtwTqAGn3EfEWhkDvhKpwZr1R6KQEAq1fU0dcu291f
xFwjCPWCaX5tqUHCQKox185muDdxKgU=
=fkaC
-----END PGP SIGNATURE-----

--etokcv6rtvultpe4--

--===============2041800703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2041800703==--
