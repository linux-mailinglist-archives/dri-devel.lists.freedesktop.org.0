Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A85E9DCE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 11:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7965F10E3B5;
	Mon, 26 Sep 2022 09:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7DA10E3B5;
 Mon, 26 Sep 2022 09:36:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A27792B0689B;
 Mon, 26 Sep 2022 05:36:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 26 Sep 2022 05:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664184976; x=1664192176; bh=iMhV2MQCYE
 l08x7MCNwj+bMXhT0kipZzBnwNpIfB8gg=; b=nJeRGFALZvB203VwJ3MiqZV0H9
 SgOgeQdWX4BuXqw5zho/RS25xCKP8KzdQRqm2mCuyRCuOyNsg99A+lAMh76HqDOD
 x+eTg6WYdZgrHKS0zSICLvO8j/3SJP13HCCOJDkPl0uPhzva8dlItg1Ao8XIGumK
 Vbx9nh+ELeMIBIDKskokk2eSRhBBTy+Ebrn/rCkgwq5UieGaMJkByqoK+baIJH2C
 5/HTEUfuOUF0Aewimr0CqDc5o4qad0/cuXBZvtQDDPTeP6obnNVGzbrPy1O7EYyt
 KA2581CvfZVH/CjRitmTgJKzFxhYz6lW5pJezzh6VmVJ0W1Vk1jK/Rf7r3oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664184976; x=1664192176; bh=iMhV2MQCYEl08x7MCNwj+bMXhT0k
 ipZzBnwNpIfB8gg=; b=SvSPhEi02+Ihox7kOmDVhX4pbeqMyi4CJjvjX99cbEyr
 +Smb2FJx3Ykc2JdeOsoir0jS89/4SjDKcOp0VS69YroKe5ZScShh/wzbeal++grP
 T3kz/sLVTtvTxyWcC7amFT8p0IQ7unvvIhjLZMctMR9p2aebfl5O2flACUCM2iCZ
 2P5b3wXbgjghbYrR6Kyohv5VMzKI7Yp0WJKOOxliNMEAlU2NYmH7nDfcOatZJmwA
 R60diWPuTdqMHff6/EjwHJOUIq8bKG5D5uiy2lrUcwW+cHnxd0gbHlloPbAiVSxw
 3+0du3C5VZZ06FibJPIilHWQYsr44TrJRhrXkcRR1Q==
X-ME-Sender: <xms:j3IxY2-QhYgO74s3trfwff3DryeNTqQlmXsu9yGRCxphn4GACYCIvw>
 <xme:j3IxY2tV7NB_e-mau1S7WaAft2UEAesKgySU0wjigMGs7JoPvAF_XnZv8xyRwLir7
 96x3L2BZSiZ3G5aD1o>
X-ME-Received: <xmr:j3IxY8DYYskkI72wKJw06xyNYUTiZjyG07uxoj73uLs5P24I9NFaDGqbqIho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:j3IxY-c1tiNct3gIbQHjSvEYT5Xb3k1T-pot_aoZBis1vo7mxgBG4A>
 <xmx:j3IxY7NBOijxM_Ba2H7o24TnGSFShkp4aYK8hhYtoN3RnR8bUq6Ebw>
 <xmx:j3IxY4lnv8PCJVU1vCHuVIUJ7mwiGoNPkRCtxB_VBaxHfk_3O1upOg>
 <xmx:kHIxY0ttx0rynzRFEyFoPEdNc13wMnnQR88F_DEk4Ml1iNEFAY-Kynb_HoE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 05:36:14 -0400 (EDT)
Date: Mon, 26 Sep 2022 11:36:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 02/33] drm/tests: Add Kunit Helpers
Message-ID: <20220926093612.wvbou2srbo3uinar@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-2-f733a0ed9f90@cerno.tech>
 <3f7000ab-b845-a7e8-f215-02121da779b7@tronnes.org>
 <c7bd9bcb-77a1-9f2d-fe93-afefac5e6def@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wdbx6g5pylyw5se6"
Content-Disposition: inline
In-Reply-To: <c7bd9bcb-77a1-9f2d-fe93-afefac5e6def@tronnes.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wdbx6g5pylyw5se6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Sat, Sep 24, 2022 at 08:06:17PM +0200, Noralf Tr=F8nnes wrote:
> Den 24.09.2022 19.56, skrev Noralf Tr=F8nnes:
> >=20
> >=20
> > Den 22.09.2022 16.25, skrev Maxime Ripard:
> >> As the number of kunit tests in KMS grows further, we start to have
> >> multiple test suites that, for example, need to register a mock DRM
> >> driver to interact with the KMS function they are supposed to test.
> >>
> >> Let's add a file meant to provide those kind of helpers to avoid
> >> duplication.
> >>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>
> >> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Ma=
kefile
> >> index 2d9f49b62ecb..b29ef1085cad 100644
> >> --- a/drivers/gpu/drm/tests/Makefile
> >> +++ b/drivers/gpu/drm/tests/Makefile
> >> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \
> >>  	drm_format_helper_test.o \
> >>  	drm_format_test.o \
> >>  	drm_framebuffer_test.o \
> >> +	drm_kunit_helpers.o \
> >>  	drm_mm_test.o \
> >>  	drm_plane_helper_test.o \
> >>  	drm_rect_test.o
> >> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/d=
rm/tests/drm_kunit_helpers.c
> >> new file mode 100644
> >> index 000000000000..7ebd620481c1
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> >> @@ -0,0 +1,54 @@
> >> +#include <drm/drm_drv.h>
> >> +#include <drm/drm_managed.h>
> >> +
> >> +#include <linux/device.h>
> >> +
> >> +static const struct drm_mode_config_funcs drm_mode_config_funcs =3D {
> >> +};
> >> +
> >> +static const struct drm_driver drm_mode_driver =3D {
> >> +};
> >> +
> >> +static void drm_kunit_free_device(struct drm_device *drm, void *ptr)
> >> +{
> >> +	struct device *dev =3D ptr;
> >> +
> >> +	root_device_unregister(dev);
> >> +}
> >> +
> >> +struct drm_device *drm_kunit_device_init(const char *name)
> >> +{
> >> +	struct drm_device *drm;
> >> +	struct device *dev;
> >> +	int ret;
> >> +
> >> +	dev =3D root_device_register(name);
> >> +	if (IS_ERR(dev))
> >> +		return ERR_CAST(dev);
> >> +
> >> +	drm =3D drm_dev_alloc(&drm_mode_driver, dev);
> >=20
> > I can't find drm being freed anywhere?
> > Maybe you could assign it to drm->managed.final_kfree.

There's a drm_dev_put in the test_exit hook which should free it.

> Perhaps a better solution would be to use devm_drm_dev_alloc() and
> unregister the root device on exit. That avoids reaching into the drm
> managed internals and it looks more like a regular driver.

But yeah, this is a good idea, I'll do it.

Maxime

--wdbx6g5pylyw5se6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzFyjAAKCRDj7w1vZxhR
xfL5AP9r8SOCVdiPcnR+tkP1VdDT4xdxvsJmgcz60MJ5iuvezwEAwp/UpYjOSXCb
YrQ0Vm/0KNnlKIDIInbF28eMSo1bSw0=
=31r4
-----END PGP SIGNATURE-----

--wdbx6g5pylyw5se6--
