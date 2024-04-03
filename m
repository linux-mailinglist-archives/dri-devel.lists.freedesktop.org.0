Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE0897BEC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 01:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B94112FE2;
	Wed,  3 Apr 2024 23:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qpy/c9+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E3F112FE1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 23:15:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DA0ECE2DFC;
 Wed,  3 Apr 2024 23:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C237C433F1;
 Wed,  3 Apr 2024 23:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712186121;
 bh=7YP3abqizRPoAPL8obPaJDqiuw0+wj9ZdRKndmVtWO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qpy/c9+xzO52cbTnZVZQNwr/ma8IJrDqRf3Q1uoZRVZmSfrqidlLNOhkIHDPJoJC3
 utFvpj8ghJVowSGnlB57QR1V4M1W22XOEbU7wvl5FUztrdxLuN1L322EH5QQE49ofX
 o9Ivk8XkN/SvXzSVGclTvJ1n+egjPz0eCLHWQAuPwOFkxO4exu1cUikXCF5rrB8dLr
 t5nkXMVBzwJWvik/+k4/P+XMb95SyH37eT4p+tA1xIO7RPtZFAhDkfjRVLf8RNVQUv
 hyfxyhBY1oZHJacBmfWXTlfmMHlxdpP7ZxBAoUumEoFhYMY661Nhllx8IX9KCHK8qs
 7MPUrns95zUPA==
Date: Thu, 4 Apr 2024 00:15:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] drm/display: Fix display helpers depends on fallouts
Message-ID: <b0ac6a85-d40c-4360-a164-ef7f2518a508@sirena.org.uk>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t5XS027i4Mgf+9A4"
Content-Disposition: inline
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
X-Cookie: Knowledge is power.
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


--t5XS027i4Mgf+9A4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 12:56:18PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here's a series addressing the various regressions that were reported
> after the Kconfig rework for the DRM display helpers.

This makes sense to me and looks like it does the right thing for
multi_v7_defconfig so

Reviewed-by: Mark Brown <broonie@kernel.org>

Between the arm64 defconfig update not applying on -next and unrelated
breakage on arm I didn't actually do a proper test.

--t5XS027i4Mgf+9A4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYN4v8ACgkQJNaLcl1U
h9APkgf+MD+F72G2etxjJQQnDLLpAUSedXzD9qG7v6PJcIYiQhEHyncENGiWMsro
JNXG/Uiuu7sJtoW9VqjSHeZynUGV610eWCnRx7iXGEzVWCsQwMsHgOZOXPMi/ygx
DHV5IEHQy9NXNdT5a+36vbujPacH1sJspLJ0b2Yp6blws16L4rbwk/jpKRckQA90
ZDtMRrlyWvK7/7gVjAfnHnu3bVFF2ZgQ6m7iP8wJOCVEd8U9T3tqAweFBREyNECn
HME9N5UtA1Ee3V1X2SVlvkC9HKEtky4u6ysnULdlNB2DF3i3VtopCMwrcT1AAOrA
SkNkR/WHG8F9KFz2/dh84C0Oug43EA==
=0WKT
-----END PGP SIGNATURE-----

--t5XS027i4Mgf+9A4--
