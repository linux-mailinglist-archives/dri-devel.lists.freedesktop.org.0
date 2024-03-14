Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A287BDB2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 14:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433DE10EED5;
	Thu, 14 Mar 2024 13:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="5WPWnxVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B54E10EED5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710422964;
 bh=OPR+be61xu6eBXXnp/++w/CdEI4VsQSdO9wap5rADAM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=5WPWnxVZdkpSnbPDaqckpBPCssY2Hg/K0OrsDXKRkP93nL6O798hS2lVJ8VGpAr9i
 Gm5yjE/4UDwgUpil+LWnEMsNuDZvt8WdeDY92NIZPLL4fIBXPrcBBnU792WAHRS66U
 COQdtC9HP3o4aZqf0YsWx1WJ+tk0E8CUUz8l4XjDGld/V/VF7RtzQWd0GPyT+R8S4g
 sQBp3e3m7nqwyUFOYcMmR1Goy5FqUTjgK4fry7VtgCYe0aqL3/NYNkAgE+K0MVfwCD
 rGk1WYmQvIHbF5OY8MmCfT9u0dJPvvAA5pwXrfoY2v4Ovj5+WKl069rXGpodICRZ26
 9tagenpHUGexw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B1753781013;
 Thu, 14 Mar 2024 13:29:23 +0000 (UTC)
Date: Thu, 14 Mar 2024 15:29:12 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Louis Chauvet
 <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH 1/7] drm: Fix drm_fixp2int_round() making it add 0.5
Message-ID: <20240314152912.7925242f.pekka.paalanen@collabora.com>
In-Reply-To: <nzce3m2okiqdd6iqj6ynymus64vjcpdep3jwqgs4uw3rvkvqkz@tz4i34w7b6es>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
 <yyrvbqpmqplwtqfdsjkhzmx7wrk4h67kn5443bdou7c7uciouy@hac7zfxiff7t>
 <16f8867c-147a-4149-ba96-ae70f8eaf903@riseup.net>
 <nzce3m2okiqdd6iqj6ynymus64vjcpdep3jwqgs4uw3rvkvqkz@tz4i34w7b6es>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dOumZZ=j4VZBSK8qbc0+7gS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/dOumZZ=j4VZBSK8qbc0+7gS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Mar 2024 09:59:39 -0300
Melissa Wen <mwen@igalia.com> wrote:

> On 03/13, Arthur Grillo wrote:
> >=20
> >=20
> > On 12/03/24 15:27, Melissa Wen wrote: =20
> > > On 03/06, Arthur Grillo wrote: =20
> > >> As well noted by Pekka[1], the rounding of drm_fixp2int_round is wro=
ng.
> > >> To round a number, you need to add 0.5 to the number and floor that,
> > >> drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
> > >>
> > >> [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paala=
nen@collabora.com/
> > >> =20
> > > Hi Arthur,
> > >=20
> > > thanks for addressing this issue.
> > >=20
> > > Please, add a fix tag to the commit that you are fixing, so we can
> > > easily backport. Might be this commit:
> > > https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vkms=
?id=3Dab87f558dcfb2562c3497e89600dec798a446665 =20
> > >> Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > >> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > >> ---
> > >>  include/drm/drm_fixed.h | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> > >> index 0c9f917a4d4b..de3a79909ac9 100644
> > >> --- a/include/drm/drm_fixed.h
> > >> +++ b/include/drm/drm_fixed.h
> > >> @@ -90,7 +90,7 @@ static inline int drm_fixp2int(s64 a)
> > >> =20
> > >>  static inline int drm_fixp2int_round(s64 a)
> > >>  {
> > >> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1))); =20
> > > Also, this is the only usage of DRM_FIXED_POINT_HALF. Can you also
> > > remove it as it won't be used anymore?
> > >  =20
> > >> +	return drm_fixp2int(a + DRM_FIXED_ONE / 2); =20
> > > Would this division be equivalent to just shifting 1ULL by 31 instead=
 of
> > > 32 as done in DRM_FIXED_ONE? =20
> >=20
> > Yes, but I think the division makes it easier to understand what is
> > going on. =20
>=20
> Right. I was thinking about slightly better performance, but I don't
> have any data. We can go with this since you consider more readable,
> anyway.

Those are constants, the compiler should compute it at build time in
both styles.

I like the DRM_FIXED_ONE / 2 style, it's semantically obvious. Bit
shift is less obvious.


Thanks,
pq

--Sig_/dOumZZ=j4VZBSK8qbc0+7gS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXy+6gACgkQI1/ltBGq
qqdypA/8DP+ZPFALvLB10UlVV9UNUurMWlycc6po5VFxXLt8YZcWvGHTaTTAzLyT
cGkOiq+fq1qXx68+trjpYt1M9f/yfu0BO+YLgVvMYXkJQKqkFFbRxGlUDwltM8SQ
pGFFKzMX3nPEenfaGJXP53EYRGmZmKND8vSIJgmWXmelgAeHjM0yIB0P5v+FhV4b
RJbvNNZzqElFqlpowCCk2uE/Yz+9a8eMWQFPu6AIB8UPtB2BbFnVOquMbujHDYuI
O0oxuoIJOoj+OwIwlZ6yokwiuIugJURsU6No9WD10bLB84uqbCowejdUHOPL42wl
xBZWVWOCoje18BOKTZFln9NrUW5xxkzGmjCpBrlCKXA9lfzqTcXFWegZEuAms3Ow
8pHRQ6Exd1GAdSmPjbhu0/KQKhR1EL0FmmaPaRLyVcCYh/Wd3xaFR0wg8GgbiRu2
emBXRLmffKh36wa8FqnKl+FWNRc354xZ6TN5pw6r0oQRJChwTlGPA4P2SjGqZXGs
bYOTFXkXzTB20rLFH6rDPKWhVu4RuD8wtQoOp8Gx7mJf2hXszKwIcQj0MFXVPyKe
05oF8mMGF73HloECl2mV/gEecHLPyjqBIILV6h91DB6Ph0bZ/uXXi53Q99kvK639
hu/wQTHWNAznEhVFsYtPgd4Uk6q4pPjNM3Nz8fRd+2Hgs+C5Kys=
=2qYl
-----END PGP SIGNATURE-----

--Sig_/dOumZZ=j4VZBSK8qbc0+7gS--
