Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CCA2A2BC1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3776E51C;
	Mon,  2 Nov 2020 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DBC6E4B1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:53:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 10135FB1;
 Mon,  2 Nov 2020 06:53:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 06:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=BRcY9bXW6iyySYtK9/vKleS2zdA
 uDeIr+DS15B9CnFY=; b=c7H0akqn0lnYa0HDw+68QP0EU/KH/5y5qln4PCkBtAc
 Nj5VGROvIoOK2fGMBYj+6k/pJFzDovhwbgvgGC1CBNUAI7cMiiWkl3OQDXV1aXLj
 pb4gpPjKhac+Cje3OwJzue53BhxIKz2WUZys4W2xgjPOdq8TUS9C2R49F6sHvlSK
 FQXAziBNRROQGysvIutUq1IGrkGvk1LRUSCfSxy0t4TAi2nOND5peOeBlhvixrUL
 /5lWuV+w3EUFb8fND7BE4P2nbAAVhWqClx5S0LgrcMghRKOFRURAYel+MHIpJH5f
 74tUsdgGqKSFballsgRg8+TcZC2iN0dn50jnnPJyw3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BRcY9b
 XW6iyySYtK9/vKleS2zdAuDeIr+DS15B9CnFY=; b=Ef9JAlo1F7ZnZ6el5RlkQZ
 nhpnnhJhMGnITd0p8LznWCtsaYCjbNCFMewqeFWLll85tTdUDNQM6OSH0GNDe4ys
 aLVlYhF8POHJ0VxJ+mEM18AFkfyXLNAcWGN3J1aP7gGcYMc4H30jNPJJpZe7r7xb
 LHlNriMQc4nNOO8PURjhUnE/5Qd1Duk51/fcYUzhYW1tbj/9T4gH7E/oIqrDAheX
 /tPRWlmyBrq1MLN3TGTI9nxaGy4XuOJb+c9H0UqLT7FdAO4mLE3nVhEufamG0G+t
 ybj0BAG4iSgF7l2glK6zA9zIKBA4ct+5JiO+rNuh+GCQMQNevtKl05U5WQTxwabw
 ==
X-ME-Sender: <xms:OfOfX7iTAqYiEYdt5UF4Q094Y9nvjrtH-qWzEme_vV0JWGresOYOPg>
 <xme:OfOfX4BRZgW-XeAtSzauey0DqtYem5hoKkZr_ytuDxkLHyKGKLZ0QLQGCtB2Z4LkZ
 4SwaYKoGsERXeK06Xc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OfOfX7ELKlNNC13Jiol9WlW3fSyuWAUc5FWvygp0GgFj88zfiS7pLQ>
 <xmx:OfOfX4Rsd7kJXJ2_RMfTW-hxQQ5zvjWbQkABUFqFjgbcpyOpqNeSjw>
 <xmx:OfOfX4yQSwHS-oQ_ehIlKwrkwgZBEF_B3TqL9ZJWMvN_8oDipyoeHQ>
 <xmx:PPOfXz-ji66POMIk60AI2UCrmsQmCct441MEXyZu7wlBKbrV8qVTBg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3EB3F3280059;
 Mon,  2 Nov 2020 06:53:29 -0500 (EST)
Date: Mon, 2 Nov 2020 12:53:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
Message-ID: <20201102115327.6vh6x2b2q7ahfdhi@gilmour.lan>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20201028123222.1732139-2-maxime@cerno.tech>
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1298997501=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1298997501==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qamymlquyumttp2q"
Content-Disposition: inline


--qamymlquyumttp2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 01:32:22PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
>=20
> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
>=20
> Let's start convert all the remaining helpers to provide a consistent
> interface, starting with the CRTC's atomic_begin and atomic_flush.
>=20
> The conversion was done using the coccinelle script below, built tested on
> all the drivers and actually tested on vc4.
>=20
> virtual report
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> identifier old_crtc_state, old_state;
> identifier crtc;
> identifier f;
> @@
>=20
>  f(struct drm_crtc_state *old_crtc_state)
>  {
> 	...
>  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
> 	<...
> -	FUNCS->atomic_begin(crtc, old_crtc_state);
> +	FUNCS->atomic_begin(crtc, old_state);
> 	...>
>  }
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> identifier old_crtc_state, old_state;
> identifier crtc;
> identifier f;
> @@
>=20
>  f(struct drm_crtc_state *old_crtc_state)
>  {
> 	...
>  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
> 	<...
> -	FUNCS->atomic_flush(crtc, old_crtc_state);
> +	FUNCS->atomic_flush(crtc, old_state);
> 	...>
>  }
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> struct drm_crtc *crtc;
> struct drm_crtc_state *crtc_state;
> identifier dev, state;
> identifier f;
> @@
>=20
>  f(struct drm_device *dev, struct drm_atomic_state *state, ...)
>  {
> 	<...
> -	FUNCS->atomic_begin(crtc, crtc_state);
> +	FUNCS->atomic_begin(crtc, state);
> 	...>
>  }
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> struct drm_crtc *crtc;
> struct drm_crtc_state *crtc_state;
> identifier dev, state;
> identifier f;
> @@
>=20
>  f(struct drm_device *dev, struct drm_atomic_state *state, ...)
>  {
> 	<...
> -	FUNCS->atomic_flush(crtc, crtc_state);
> +	FUNCS->atomic_flush(crtc, state);
> 	...>
>  }
>=20
> @@
> identifier crtc, old_state;
> @@
>=20
>  struct drm_crtc_helper_funcs {
> 	...
> -	void (*atomic_begin)(struct drm_crtc *crtc, struct drm_crtc_state *old_=
state);
> +	void (*atomic_begin)(struct drm_crtc *crtc, struct drm_atomic_state *st=
ate);
> 	...
> -	void (*atomic_flush)(struct drm_crtc *crtc, struct drm_crtc_state *old_=
state);
> +	void (*atomic_flush)(struct drm_crtc *crtc, struct drm_atomic_state *st=
ate);
> 	...
> }
>=20
> @ crtc_atomic_func @
> identifier helpers;
> identifier func;
> @@
>=20
> (
> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_begin =3D func,
> 	...,
> };
> |
> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_flush =3D func,
> 	...,
> };
> )
>=20
> @ ignores_old_state @
> identifier crtc_atomic_func.func;
> identifier crtc, old_state;
> @@
>=20
> void func(struct drm_crtc *crtc,
> 		struct drm_crtc_state *old_state)
> {
> 	... when !=3D old_state
> }
>=20
> @ adds_old_state depends on crtc_atomic_func && !ignores_old_state @
> identifier crtc_atomic_func.func;
> identifier crtc, old_state;
> @@
>=20
> void func(struct drm_crtc *crtc, struct drm_crtc_state *old_state)
> {
> +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(stat=
e, crtc);
> 	...
> }
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> expression E;
> type T;
> @@
>=20
> void func(...)
> {
> 	...
> -	T state =3D E;
> +	T crtc_state =3D E;
> 	<+...
> -	state
> +	crtc_state
> 	...+>
>=20
> }
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> type T;
> @@
>=20
> void func(...)
> {
> 	...
> -	T state;
> +	T crtc_state;
> 	<+...
> -	state
> +	crtc_state
> 	...+>
>=20
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   )
> {
> +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(stat=
e, crtc);
> 	...
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   );
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   )
> {
> 	...
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   );
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   )
> {
> 	...
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   );
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> identifier old_state;
> identifier crtc;
> @@
>=20
> void func(struct drm_crtc *crtc,
> -	       struct drm_crtc_state *old_state
> +	       struct drm_atomic_state *state
> 	       )
> 		{ ... }
>=20
> @ include depends on adds_old_state @
> @@
>=20
>  #include <drm/drm_atomic.h>
>=20
> @ no_include depends on !include && adds_old_state @
> @@
>=20
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied both. I'll send a few more patches to fix the issues Ville and
you mentioned.

Thanks!
Maxime

--qamymlquyumttp2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5/zNwAKCRDj7w1vZxhR
xeAQAQCPnn1dyme4YGhQs0z58hXq4037SUcrV/aI1Uhd+GqL/AEAxn+vfY4FOhzK
Qebua3PsZ2uqKNMnsQw8zoX6DbwqZwM=
=unv4
-----END PGP SIGNATURE-----

--qamymlquyumttp2q--

--===============1298997501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1298997501==--
