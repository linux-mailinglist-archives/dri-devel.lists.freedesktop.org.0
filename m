Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076459571B6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8116210E313;
	Mon, 19 Aug 2024 17:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ys22w7Ei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1293010E313
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 17:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 526D460BBB;
 Mon, 19 Aug 2024 17:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD86C32782;
 Mon, 19 Aug 2024 17:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724087585;
 bh=1YUwhTkKQuYH/5TElmbzoXnn4fa4YlXoJnkDBxAa+zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ys22w7EiHHHRoGumTUbPFSawlSz7sDUgPDBI0K5FlkLh3SW923Fn+5EVdtrmy+1YM
 pb1f9NB32raKnuvPQYOyNsVXt4Olm0h7cmBcwxvfsJbfChoGXvwFg6dv+poAKJhIRc
 7jp0sDNQPYS2cccA81vdmR9dr11sAdZs+HNVKIzkKSJy7piE42x2qhOL8IcPAcaUuS
 IuHyxSkIipFeJFRB2+Bem4+z28idh91eKVRlbvT/kr95jtg/ZPzifHq5sXx24y/5ZY
 8elODxvlMXOPVT5zk9KVWXyckJrV1/0iYP9ZdXKqa67en/xKKvypriJrhzs9+ssvOZ
 SVsnDifu1MRKw==
Date: Mon, 19 Aug 2024 18:12:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
Message-ID: <20240819-slam-pandemic-1e8464f8694f@spud>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uDC2vKcryAk+Ed2e"
Content-Disposition: inline
In-Reply-To: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
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


--uDC2vKcryAk+Ed2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts or resets must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uDC2vKcryAk+Ed2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN9GwAKCRB4tDGHoIJi
0qPVAP98hiUU5eVPGOTJ1UGLU2LGxJEw1yP/JSQO5PogiR6iZAD/RzmaR4O4KwZp
lvFvfmz3HHReF1QQAOG6BlAjM85Zqwk=
=/aZ7
-----END PGP SIGNATURE-----

--uDC2vKcryAk+Ed2e--
