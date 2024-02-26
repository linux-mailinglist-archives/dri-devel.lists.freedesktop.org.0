Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C017F866D7B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE0B10E395;
	Mon, 26 Feb 2024 09:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TXXemsJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D0B10E395;
 Mon, 26 Feb 2024 09:04:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F071F60ED1;
 Mon, 26 Feb 2024 09:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F30CC433C7;
 Mon, 26 Feb 2024 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708938258;
 bh=AOhnnfzeFccWaPh6IGPowe4gy919YNwS22AyIgMywL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXXemsJUNz9ZTl6Sp95ZNxXrWGLVZ3U88vdeW4k27sA8Exr172c9xHIUDudsPhIdG
 +/ILB+s+K9QjrxgB6CZduwd1K+BSkFjWNup/KjWEZFu5q/y266GI8ejOoxs6lTfqcX
 pSmtjggWK+VjWtuk176K2VNSB/qsDknF0lixg7A9EeCohn88LP4xbbCtL39ZlGBvaf
 y73PJXpfIJth5SvruQwNpfXVJdPrllGio9UkZ4YEjzSDjEkuDwBjLfPCpvpjY25kAl
 pXlmQBNp1xJXFSeFebfkMAfJHet5NUMEEatTjhzpks8r3XLJwPcTpcAg7uRmtQvSm0
 +YFyPl5Di+wbA==
Date: Mon, 26 Feb 2024 10:04:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/xe/kunit: fix link failure with built-in xe
Message-ID: <e5vndkeqsxozognnsn4snuhbvpvmxvz5foj44nrwpsucajwrkr@kvlqsijrehll>
References: <20240224121528.1972719-1-arnd@kernel.org>
 <7hfobmmgs6ntnusobalqxslcyv3kqdlnhxjoxbaful4ameavj2@niodl55l7b7g>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mzwthjftv6ebzjkj"
Content-Disposition: inline
In-Reply-To: <7hfobmmgs6ntnusobalqxslcyv3kqdlnhxjoxbaful4ameavj2@niodl55l7b7g>
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


--mzwthjftv6ebzjkj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 09:42:06PM -0600, Lucas De Marchi wrote:
> On Sat, Feb 24, 2024 at 01:14:59PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > When the driver is built-in but the tests are in loadable modules,
> > the helpers don't actually get put into the driver:
> >=20
> > ERROR: modpost: "xe_kunit_helper_alloc_xe_device" [drivers/gpu/drm/xe/t=
ests/xe_test.ko] undefined!
> >=20
> > Change the Makefile to ensure they are always part of the driver
> > even when the rest of the kunit tests are in loadable modules.
> >=20
> > The tests/xe_kunit_helpers.c file depends on DRM_KUNIT_TEST_HELPERS,
> > so this has to always be selected by the main XE module now, rather
> > than the actual tests. In turn, the "depends on (m || (y && KUNIT=3Dy))"
> > doesn't really do what it tried and can just be removed.
>=20
> it actually did, which was to workaround issues prior to the commit you
> are pointing out.  What it did  was to make sure xe.ko is m, or if it's
> built-in, kunit is also built-in. Apparently the problem here is that
> the xe_test.ko is missing the symbols.
>=20
> See commit 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm").
>=20
> I'm happy to remove it though if it's indeed not needed anymore.

I think the main issue with that original patch is that it keeps the
direct include of the test files.

I assume it was done to allow kunit tests of static functions, but now
that VISIBLE_IF_KUNIT and EXPORT_SYMBOL_IF_KUNIT are a thing, you don't
have the need for that include, and you can build your tests in a module
while the code is builtin.

And the conversion should be pretty minimal.

Maxime

--mzwthjftv6ebzjkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdxUCgAKCRDj7w1vZxhR
xbo0AQCXLjOUMPlHPDRJQNooVy21X6D9u5gkUwNThw78/qfJIAEAkWn/qdsZFs/j
xH9z/KXXCorD31m1Jpr4RqDpaELZMwg=
=mYq4
-----END PGP SIGNATURE-----

--mzwthjftv6ebzjkj--
