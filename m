Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD94CB420A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 23:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188BD10E289;
	Wed, 10 Dec 2025 22:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F4810E677
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 22:10:09 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 173B61F8005D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 22:09:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 37360B127FB; Wed, 10 Dec 2025 22:09:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from collins (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id EBB48B127E9;
 Wed, 10 Dec 2025 22:09:35 +0000 (UTC)
Date: Wed, 10 Dec 2025 23:09:33 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Janne Grunau <j@jannau.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 chrome-platform@lists.linux.dev, Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 linux-sh@vger.kernel.org, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
Message-ID: <aTnvnaRuJ5lF4dVv@collins>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
 <20251208200555.GA333481@robin.jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MEb6eXQ93P1+3Wd8"
Content-Disposition: inline
In-Reply-To: <20251208200555.GA333481@robin.jannau.net>
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


--MEb6eXQ93P1+3Wd8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Janne,

Le Mon 08 Dec 25, 21:05, Janne Grunau a =C3=A9crit :
> On Mon, Dec 08, 2025 at 07:13:50PM +0100, Paul Kocialkowski wrote:
> > Hi Randy,
> >=20
> > On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> > > from  https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
> > >=20
> > > The bugzilla entry includes a Perl script and a shell script.
> > > This is the edited result of running them (I removed some entries tha=
t were noise).
> >=20
> > [...]
> >=20
> > > DRM_KMS_DMA_HELPER ---
> > > drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> > > drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> >=20
> > For these two, the symbol was removed in commit
> > 09717af7d13d63df141ae6e71686289989d17efd
>=20
> That commit removed DRM_KMS_CMA_HELPER. Later commit 6bcfe8eaeef0
> ("drm/fb: rename FB CMA helpers to FB DMA helpers") renamed
> DRM_KMS_CMA_HELPER erroneously to DRM_KMS_DMA_HELPER.
>=20
> > but these two drivers either were
> > missed by the batch rename or were introduced a bit later.
>=20
> In the case of drivers/gpu/drm/adp/Kconfig it was missed much later
> during review (but iirc went through the same rename out of tree).
>=20
> > Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by =
the
> > drivers), it should be replaced with DRM_GEM_CMA_HELPER.
>=20
> That symbol doesn't exist anymore either. It's now DRM_GEM_DMA_HELPER
> which is already present in both files.

Thanks for the details! It seems that I was looking at an older tree.

> So the "select DRM_KMS_DMA_HELPER" lines can be removed from both files.

Good, then I'll craft a patch removing these two lines.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--MEb6eXQ93P1+3Wd8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmk5750ACgkQhP3B6o/u
lQxOag/+J9Lwmq+hqcg9BxoDCZl6KmFGAh/RmelPeBUew6LlQphMcDpjQ0yJavK3
bxojss4r12rV5307+f47JlSMFJa/100MablzoWV0koupx/JCRszhYf2w1lxYHKJh
7jwy8GLd9NnaZGaiscrckVEcfaVRufzSM2I6ErSZIMSYEZ1LUTCakTPAwrgtarZb
b9FzHmCrau56mdC2M6StWaolU90t4em1/We8XVRtLY87MEY/VQK6qLylL2fbpuIX
5+DjnOBDMrvyB7UJFVbzcQA4ev1ckCBvnB2JdzGOfquj6XTO23m5/L5qfxTVk6qa
yp9ShU6lQZ9RjinifpGWf8JTYl46U7hch9PrUCE/n0FgVl2frQHb/N08ynKUniCB
1U76zgnG48Wkj08Sz6anRvER3dqEhzJgxJxpkW1UqoXFOSBQeeJZzZONuuUxYw3M
8JKSldwJVj/oLlvCOI6QO0Q9T+U4YS1gpNBfHbysPaJgZyqld5tXaElOo9k8P8pX
kAMhcvAn6FaXqkX5qJOAN+91M+CkQwQlWf16G7HKV0LcOvzCtGHYWVrxb7xWw9Em
JBZRsrdq4CaQc34D8GkBR14H6WGWkGR4OQSTqxshPv7x/S4u9vV8FQWIhLW2LToY
kw9ephtALgBj6D79R84K2DGlmZwPH2sunV3y9huDh3SNlR5dZg8=
=EEMR
-----END PGP SIGNATURE-----

--MEb6eXQ93P1+3Wd8--
