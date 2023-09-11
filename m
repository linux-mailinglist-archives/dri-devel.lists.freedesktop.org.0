Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751D79A53F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342AF10E120;
	Mon, 11 Sep 2023 08:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A464110E120
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:00:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D1A57CE0A2B;
 Mon, 11 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42D1C433C8;
 Mon, 11 Sep 2023 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694419244;
 bh=JHbPrcise+/P/GKewnA0AHCsFPoqJCSTNKxWzvwxnmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbQFztU9p87RS2T1tgOE70lHIZmbUe7bwhGzVitu3M4UEIIGWOjOBkRs+grlgO8dk
 JK9rBKNPWWdpQFwHyaRjDm9e4kcvCHxCGzq5AQBI8CmosY79qNr/MUxdQGu4dK6Rr0
 teFI0XJrM9fSfI3o8YtXaeJFsr3g2s4r/LjDG+vQAT6PN8lJpE6ePOyM3/SXqQohuP
 AMBc5eeilizLoyD/iUK8a/qHo6sVWJg3pI3VFW/UZwKiPY0lR+b7tzM7Bow99Svx65
 SK3Zp2HZjMlHnnJHYWZb0yqkHZ0Go4uCS1Fz/Df99kdxdhbeb6ATZ6Ze2CZz1/7bih
 +XGuYlx1d8MYA==
Date: Mon, 11 Sep 2023 10:00:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Maira Canal <mairacanal@riseup.net>
Subject: Re: [PATCH 05/10] drm/tests: Add test for drm_framebuffer_cleanup()
Message-ID: <jyceyofh7wtrdmua3iwozjmbzgcyejbbpmcfjg7v6533w7bdgd@fv6degdp74b6>
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-6-gcarlos@disroot.org>
 <b78cc390-3d2f-1f02-23e1-7f94d38d03a4@riseup.net>
 <5d660868-a1d2-ae41-30ee-e90b12aece9c@disroot.org>
 <3da121e8-b21e-3184-86fa-270e089c56da@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mobalq7lo5cphg27"
Content-Disposition: inline
In-Reply-To: <3da121e8-b21e-3184-86fa-270e089c56da@riseup.net>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlos <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 David Gow <davidgow@google.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mobalq7lo5cphg27
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 05:42:07PM -0300, Maira Canal wrote:
> Hi Carlos,
>=20
> On 9/4/23 14:22, Carlos wrote:
> > Hi Ma=EDra,
> >=20
> > On 8/26/23 11:06, Ma=EDra Canal wrote:
> > > Hi Carlos,
> > >=20
> > > On 8/25/23 13:07, Carlos Eduardo Gallo Filho wrote:
> > > > Add a single KUnit test case for the drm_framebuffer_cleanup functi=
on.
> > > >=20
> > > > Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> > > > ---
> > > > =A0 drivers/gpu/drm/tests/drm_framebuffer_test.c | 49 +++++++++++++=
+++++++
> > > > =A0 1 file changed, 49 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> > > > b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> > > > index 0e0e8216bbbc..16d9cf4bed88 100644
> > > > --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> > > > +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> > > > @@ -370,6 +370,9 @@ static int drm_framebuffer_test_init(struct
> > > > kunit *test)
> > > > =A0=A0=A0=A0=A0 KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
> > > > =A0=A0=A0=A0=A0 dev =3D &mock->dev;
> > > > =A0 +=A0=A0=A0 mutex_init(&dev->mode_config.fb_lock);
> > >=20
> > > What about drmm_mutex_init()?
> > I took a look into it and as far I understand it would be useful if
> > the drm_device was allocated with drmm_kalloc(), sure? As far we
>=20
> I'm not sure if we can allocate drm_device with drmm_kzalloc(), as we
> need a DRM device for drmm_kzalloc(). drmm_kzalloc() is just a
> &drm_device managed version of kzalloc().

We should use drm_kunit_helper_alloc_drm_device_with_driver

Maxime

--mobalq7lo5cphg27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZP7JKQAKCRDj7w1vZxhR
xTIKAQDbBWCByqv8snBN97J7qLMJG+4m0IH2sBBFt/HbtRsutwEA0PEuNUPsrl8V
ag0QcOci8OeiaO/wXdBX+apeHPpNVw4=
=BiNT
-----END PGP SIGNATURE-----

--mobalq7lo5cphg27--
