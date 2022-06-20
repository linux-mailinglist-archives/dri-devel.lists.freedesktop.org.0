Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A061551C36
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 15:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D74110E37A;
	Mon, 20 Jun 2022 13:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609F410E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:48:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4D33B3200955;
 Mon, 20 Jun 2022 09:48:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 20 Jun 2022 09:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655732905; x=1655819305; bh=G65emyLKXE
 BG7PvJD/wJNoXQP0L1yQgCGqaAeM7XI5A=; b=1Etd0BSyzbia5YOA/dO5L4kpt/
 38N3idpgmz0resvJn12leqbh9MI20icXWtK40HE9MIw7emrc9gQe9XPweMvvaCts
 nBq7keU5VkttSeA304fANZ6O9wj88uP47+QB9WXA7qZ6Wa12vVILq3OkwmCceU3d
 5ybmSqirc5MsE/DW6va8Mcgrp+6UrrtqvRtEgOd6XalKsB01aud5d3IUDQeooRQM
 eZqSdi8DwcldRGCVldB/z/hAUgshnvoosRFbhTX1kOWwjv9TDrtIlsu+713z3XLh
 GshoyZU6P2a7Sh2FHrEhExp+1SGLj5T/YKCEojU95iuCCPqoTJnQ1NxIiDCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655732905; x=1655819305; bh=G65emyLKXEBG7PvJD/wJNoXQP0L1
 yQgCGqaAeM7XI5A=; b=Rd1oDaok5wesivnhip0PZicRGYgSqDhkLOzlzkJLE6Tm
 lCwOgcIcWD01UVHN5YZwCaXzBlIL/nlEN0NV95rE0s3UT39LWT5avjuUva3VBfWF
 WLy+4eI+bGr3XF/2EiKhq2a/TnLm787xhh5/tO93SRp/Ji/iVOnzRRc89aQAeBRE
 mZH+ujEjcsFZKotN3FjPDZY18K6pYP1IZFcxUozViIZ5TUraliwl04DzTH+LJmEr
 xXt4dbhubVjuh226/zo7XlPEhHmH81GffPC3emO6oeDRXRh+85Os27JnjcZTnOFz
 c8K4CjSwTznEBfOPNH9Ip8FTfzYVN4yB1b1a6u3KSg==
X-ME-Sender: <xms:qXqwYoSouLclXLy-1D74AQPbxK99Csfx7pTazkE_E5gnlvT5LjEaAg>
 <xme:qXqwYlx0rDr2NzQNozUnih6EpKDXYhBaZ978yqQQsjYaO7sp-fNjkC0F-AkcczL8s
 cWjRcDHNHGdgQ4lj_k>
X-ME-Received: <xmr:qXqwYl2LKPCA8pwlIFAyakWA2Gcgcty93BJA2G7ss2KlteVuCCRfUQdOTxar6hv7rfgp5KZjbb9qWIgHueoJ47E2DZWUUdgUWBzbo_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefuddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qXqwYsBQGBMfCnV4DJsVSAMtyT-REMm7NWloxFkthLRexietY95lSA>
 <xmx:qXqwYhimKicd2wdMs0NvxoqeJPU6zYTMVYx2teqeoIyZSDbv94RBKA>
 <xmx:qXqwYorkaG3MsBURhmbtXUUMyVZWkDMG0RMI5KSaQt93qfVzpaVvxw>
 <xmx:qXqwYmuREeSvAG3b159hfITpYZC9f5SETfn4_SYKzb6DP6FmyXD4iA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 09:48:25 -0400 (EDT)
Date: Mon, 20 Jun 2022 15:48:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Message-ID: <20220620134823.oqjrbnlsce3erhum@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vs6gl3s2yjatfye7"
Content-Disposition: inline
In-Reply-To: <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vs6gl3s2yjatfye7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 20, 2022 at 12:44:24PM +0200, Thomas Zimmermann wrote:
> Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > The DRM-managed function to register an encoder is
> > drmm_simple_encoder_alloc() and its variants, which will allocate the
> > underlying structure and initialisation the encoder.
> >=20
> > However, we might want to separate the structure creation and the encod=
er
> > initialisation, for example if the structure is shared across multiple =
DRM
> > entities, for example an encoder and a connector.
> >=20
> > Let's create an helper to only initialise an encoder that would be pass=
ed
> > as an argument.
> >=20
>=20
> There's nothing wrong with this patch, but I have to admit that adding
> drm_simple_encoder_init() et al was a mistake.

Why do you think it was a mistake?

> It would have been better to add an initializer macro like
>=20
> #define DRM_STATIC_ENCODER_DEFAULT_FUNCS \
>   .destroy =3D drm_encoder_cleanup
>=20
> It's way more flexible and similarly easy to use. Anyway...

We can still have this. It would simplify this series so I could
definitely squeeze that patch in and add a TODO item / deprecation
notice for simple encoders if you think it's needed

Maxime

--vs6gl3s2yjatfye7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrB6pwAKCRDj7w1vZxhR
xVbWAQDwgeg8BYDKVFmxna1mWhd9Ke7bRsLwQrp3zSGfWL1CDQEAvp29cgX5cDnf
CtQA/zMrgVGbJnqfYeGFMX7P3SBOHAw=
=8hc0
-----END PGP SIGNATURE-----

--vs6gl3s2yjatfye7--
