Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1B931821
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 18:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1D110E436;
	Mon, 15 Jul 2024 16:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JHbuhEK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17F510E442
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 16:09:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01476611EC;
 Mon, 15 Jul 2024 16:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AF1C32782;
 Mon, 15 Jul 2024 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721059770;
 bh=mZvCojP8oJ4JhW6pFDzplfbDNtPCohsUZ4sNPPz9XVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JHbuhEK9hbzLOYDlRBVabugewcucVIukRV3QMube4oVXCn64OuALIlG8nvGxtrx2Q
 pblrKcdTCqr268kAvy/t1e2dVI2SNgDuNY4exuMzRwtAbfzZSX7/i3NJqvBD+pwIm2
 3N0qrHY8HDIIojdgzBWVju38dAMyalkOI05ngssn30R09ehQyEtDSqbcWjx5ihK1tq
 dmjU0zincZh31591UkAa6fqWr+KQ9wUwiOT4D8GWHnvLzlXW79cWDXOo9Vr+tnG47k
 BHuIHs/vA6VX94PCOGSuo8HaRy6iQ9c4lwX4Zwwr3IS7LfZLN8jTxBJzGdncMJ8KYo
 U+RturPsBB6/g==
Date: Mon, 15 Jul 2024 17:09:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, arnd@arndb.de, Jason@zx2c4.com,
 rdunlap@infradead.org, akpm@linux-foundation.org,
 geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Hari.PrasathGE@microchip.com
Subject: Re: [PATCH v2 1/4] dt-bindings: display: bridge: add
 sam9x75-mipi-dsi binding
Message-ID: <20240715-washable-keenly-a76abaa59f60@spud>
References: <20240715095736.618246-1-manikandan.m@microchip.com>
 <20240715095736.618246-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rtMNhwSapse+vIdd"
Content-Disposition: inline
In-Reply-To: <20240715095736.618246-2-manikandan.m@microchip.com>
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


--rtMNhwSapse+vIdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2024 at 03:27:33PM +0530, Manikandan Muralidharan wrote:
> +  clocks:
> +    items:
> +      - description:
> +          Peripheral clock for the hardware block functionality
> +      - description:
> +          Generic clock to drive the D-PHY PLL block

What is "generic" about this clock?

> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: refclk

nit: clk is redundant here, they're all clocks :)

--rtMNhwSapse+vIdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVJswAKCRB4tDGHoIJi
0q2RAQD8xX97GhfraF1NjbALVGWRMAFNTzFTnzurzE9Q3k80dAEA/np8raSeahoP
MDtmFTYmVvQEWF6ifUxJrGmaQHcEzAg=
=a1J+
-----END PGP SIGNATURE-----

--rtMNhwSapse+vIdd--
