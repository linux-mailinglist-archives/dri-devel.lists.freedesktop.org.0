Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499982A5F7A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF11C6F3C6;
	Wed,  4 Nov 2020 08:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3C86ECD8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 16:16:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7B9F440F;
 Tue,  3 Nov 2020 11:15:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 11:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ViJa3c7UbTHFtJgZ9vTiiUSLQ1B
 32z/E+qxzAm5oLG4=; b=gWqpXvFq+Iwxdynjf2yCL7o2R/w5IxiwnYVJu/dO5ae
 cpOYoVa51dJkp8AgBGuQFs6DbodSZCO6n0nXuMoUo30VZmNC0v0LgU+x9ch0raIT
 pl99t56Jp9G2iz+nq7/UEvdlpOAxmWNhBMOh9kiPDbCA0d5BI5Chbg4N10HiVIB3
 6uwcYWezaqesO6Su9GgKYFPY/XS7ABQtpCXEUDJ2gE6bC9UcRZMHLtOfMBM4Z3uS
 1MFWiJX2pasb7k/oktnc6kOb+KzdeTjJCwLXmGqZGsz7ZT+HjgHoMxZ2/+CJR/Qx
 dECHiqhfwBG57w4EnSNvP3UZzUmKtwb8tnQtlSaK/5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ViJa3c
 7UbTHFtJgZ9vTiiUSLQ1B32z/E+qxzAm5oLG4=; b=S5+ZGEdXt5PSbXhYn+pnzv
 8HcSCutu7di6DPYBwuPx/xcZuF2qXKVzhOtIya4zOWmGGvlwMCgMT+9DKL0vOS9T
 46d6ARyeZBC5xjvEeOfBJk+Q+PilFrwG/LTar73YmihiIrpSOb44kXDPMSKy2XP7
 a2/+Qwm7l7B3brmlYNw3JR53hesOV/rH9RT756Fz7ecOQM+/17KkjdIxC20KW5Ar
 NZ8plu3JM983GSangb5q9syMIyxzuvIm2UY2CfKcNbXluLn8HmcofCTYsaMSe0oX
 omIIZexs4JvrqhOK9UeRhX+Pxt+8t9O3JbNqrM4jmWesCbIQKCNQwXy78+NF26ag
 ==
X-ME-Sender: <xms:OIKhX1katj7WjL7HdBmq7YSuPHhhuKiunrjrGbixPsFWLsWVmEHw-Q>
 <xme:OIKhXw1KNw9zD_3lwEJyYnAeDJPKPF_IriXKAtW8XNtgHQZh9VU31ZRdcaONdH_Rs
 m1zbkC94ZdhPCMjl4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OIKhX7qNbqgdQbSQfV6RkFoY4W77SeerCcLx9dR0-EhgNoXUWj5leA>
 <xmx:OIKhX1ngwkJhQCYUuV2qh7weWj_QanV5AIO6Y7pEoTvZxFzgOLd9RA>
 <xmx:OIKhXz1A2b7oTXDdamwavYoJSZUWVXoMwWDM1uBArX9aTfccnSoItA>
 <xmx:PIKhX0xI_NbSg_aRmHECbyK75QzGaZXOtg-g4T8TUa0BXuoPRoCySw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8CD313280067;
 Tue,  3 Nov 2020 11:15:52 -0500 (EST)
Date: Tue, 3 Nov 2020 17:15:51 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/3] drm: Use state helper instead of CRTC state pointer
Message-ID: <20201103161551.tokfhcsfjtgli7wm@gilmour.lan>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102133834.1176740-2-maxime@cerno.tech>
 <20201102160406.GN6112@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201102160406.GN6112@intel.com>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Content-Type: multipart/mixed; boundary="===============1877769446=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1877769446==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sqjycy5zpmm46ao7"
Content-Disposition: inline


--sqjycy5zpmm46ao7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Mon, Nov 02, 2020 at 06:04:06PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Nov 02, 2020 at 02:38:33PM +0100, Maxime Ripard wrote:
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
>=20
> These reanames seem a bit out of scpe for this patch. But I guess you
> needed then to get the rest of the cocci to work on some drivers?

Yeah, those two drivers already had a variable named crtc_state, calling
container_of on crtc->state

It was cleaner to me to have an intermediate variable storing the result
of drm_atomic_get_new_crtc_state, but then the most obvious name was
taken so I had to rename those two variables before doing so.

> The basic idea looks good:
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> But I guess up to the individual driver folks to bikeshed the variable
> naming and whatnot.
>=20
> One thing I spotted is that a few drivers now gained two aliasing crtc
> state pointers in the function: one with the drm type, the other with
> a driver specific type. That's something we've outlawed in i915 since
> it was making life rather confusing. In i915 we now prefer to use only
> the i915 specific types in most places.

I didn't spot any of those cases, do you have an example of where it
happened?

Thanks!
Maxime

--sqjycy5zpmm46ao7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6GCNwAKCRDj7w1vZxhR
xRk5AP41cr61WjFXfY/dUBMnN8a0eBFWmm2nvv/5+0ARb5CPsAEA0ED55q6nSQw7
Vd9KM+CHqUNRAEl/B9KNyi8aZbeBWw0=
=34S+
-----END PGP SIGNATURE-----

--sqjycy5zpmm46ao7--

--===============1877769446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1877769446==--
