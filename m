Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29D89FF66
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 20:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80CB10E9BA;
	Wed, 10 Apr 2024 18:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lu35qvDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE02910E9BA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 18:06:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 732A7CE2AF3;
 Wed, 10 Apr 2024 18:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55443C433C7;
 Wed, 10 Apr 2024 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712772408;
 bh=9mHUvsMCvHI/lEf3R28H/lWIRLZtajg6D7uHi+gu8Xc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lu35qvDvmqNkvq1o9nxg+w5hL5Uh7lDNWfNvkA5+kkFTIkp1zcQ2dCvhQ7Bmyxiky
 srIkPzXyQsbllzfitfQ3qBA04frMons8w+N3qunJ0qiyagfuyd8VP3Wuf7DsDyJCX4
 sADFRrR0lpwBWt2T/VQjb2jupa0lm1/2y1SDR5He9xfnB53rtkenMoKQxAXzpQxaIg
 g/QgpMxZFgNPTpg/nPfDmiJRljqUaN2o19G9m8w1lUwu/8qPu2foYaJ0CJBQaut8gi
 mhsGnnBNyndkfB8TLRrdqBenQDhN1PWT6Wo8fCofnQbnBcmDG7c1G0chPGnp2afnGE
 5WTuil65Gnjfg==
Date: Wed, 10 Apr 2024 19:06:39 +0100
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
Message-ID: <117b0d3b-a60b-4bc0-9f2c-f0e4fffe634a@sirena.org.uk>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m8uHuXe8Pt8zgPJR"
Content-Disposition: inline
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
X-Cookie: A bachelor is an unaltared male.
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


--m8uHuXe8Pt8zgPJR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 12:56:18PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here's a series addressing the various regressions that were reported
> after the Kconfig rework for the DRM display helpers.
>=20
> Let me know what you think,
> Maxime

Is there any news on getting the rest of this merged?  It's been more
than a week now and the Designware display controllers are all still
broken in -next, causing widespread breakage in CI.  For bisection
purposes it probably makes sense for the defconfig updates to go along
with the changes to the Kconfig for the driver...

--m8uHuXe8Pt8zgPJR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYW1S4ACgkQJNaLcl1U
h9DOSwf/cU2i83arQzeCO07s0n4/uba3xhNrWfvc7xN0GLO+Z8KtAnVQfRMhXF5j
ayRYwyjGMYcJmGugvdeX68HEbnVSq3PF1F0CSIjX4ElPZ9S7Wbiik4vnL45HJP6c
IveEkj+HqtAvILP5/07YrflUuqawBsUKDiELWs2p8AqwcpiDy4j6sMJpPZd6n9gf
9GzlZ5KCvzOua+GmCz9skxnIsXwSIB2HQ2y2zA0hyBbte7XjFFBUE36JW/kSt4z5
eRZ8AW4MG2hO6f/x965L+SShk1aLPhnYQXx/683Eu5MhYCGzGW7XPuGQDJJ1rAZU
YkvZX/nVERJeD10LMsjYYPcH/8N8Cw==
=swV+
-----END PGP SIGNATURE-----

--m8uHuXe8Pt8zgPJR--
