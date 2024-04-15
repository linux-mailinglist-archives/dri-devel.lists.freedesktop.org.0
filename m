Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7F8A4D8A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25FE112495;
	Mon, 15 Apr 2024 11:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yyl0jw8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9752112495
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:21:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6634D60C2D;
 Mon, 15 Apr 2024 11:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F5DC113CC;
 Mon, 15 Apr 2024 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713180110;
 bh=zaeta5YRsGP9vG705wmBldVE6zWx2ubesmRsCMtwiKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yyl0jw8FOgIlaxoOAe3p2F9YP256URFG19ccbzwnvLP+nXPKhgD5ZpMounJJGJTGl
 W56F7hvPz3yssyAye//nUgEICHyExmh3si6KPUCTQVp+F3t+vLFGf9crAm/lbPZ/tG
 oYVox67bc7RG6kHrc53DAHLbGGYZcw0qIMfntJXAZfcS1WFZVqdlHmxrcw0KYz+okp
 Pkrupra89W8My0fKez1OycDL7lFi3BMj9x0gWr6hV/lLIp2y2H5n0Od+vGtF3NYO0c
 CRzHx1TYaq8LcPQqKjZbGk4YUzmaWnW59PnqFLEdHv4oY9iqpgJNXI7PCDHsTpTWV7
 4/moMdyU2qz2A==
Date: Mon, 15 Apr 2024 13:21:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Russell King <linux@armlinux.org.uk>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, 
 linux-mips@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] drm/display: Fix display helpers depends on fallouts
Message-ID: <20240415-sloppy-invisible-crocodile-da4545@houat>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
 <117b0d3b-a60b-4bc0-9f2c-f0e4fffe634a@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wn4eudraeu4chaua"
Content-Disposition: inline
In-Reply-To: <117b0d3b-a60b-4bc0-9f2c-f0e4fffe634a@sirena.org.uk>
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


--wn4eudraeu4chaua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark

On Wed, Apr 10, 2024 at 07:06:39PM +0100, Mark Brown wrote:
> On Wed, Apr 03, 2024 at 12:56:18PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series addressing the various regressions that were reported
> > after the Kconfig rework for the DRM display helpers.
> >=20
> > Let me know what you think,
> > Maxime
>=20
> Is there any news on getting the rest of this merged?  It's been more
> than a week now and the Designware display controllers are all still
> broken in -next, causing widespread breakage in CI.  For bisection
> purposes it probably makes sense for the defconfig updates to go along
> with the changes to the Kconfig for the driver...

I was on holidays so I've admittedly hoped that it would be picked up /
reviewed by the relevant maintainers.

Aside from the changes on sunxi_defconfig, I haven't seen any review
=66rom the relevant maintainers so I'm not sure how to merge this. Should
we get an Acked-by from Arnd, Olof, Catalin or Will and merge everything
through drm-misc?

Maxime


--wn4eudraeu4chaua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZh0NywAKCRAnX84Zoj2+
dorNAX9YIzjToH375MPL7Ax5ZuueLWq41eVy07FoPTf31aMEQyEy/VR56sILKVLf
TzYFX28BgODebjC3eC3QNfJYDoWKcB+vda0h0cCbUxE3QnqF2xMfORawm4oSmu2E
dt3E8cNkCg==
=f2Da
-----END PGP SIGNATURE-----

--wn4eudraeu4chaua--
