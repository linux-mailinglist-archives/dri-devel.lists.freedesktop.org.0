Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC170C3CE46
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 18:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEAD10E994;
	Thu,  6 Nov 2025 17:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WbVAZQip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2032E10E994
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 17:40:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B61F943D6B;
 Thu,  6 Nov 2025 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61498C4CEF7;
 Thu,  6 Nov 2025 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762450832;
 bh=5p+0b8Clnp2p5Xtmd2HAgDF9wUuv2mhGSLMgm4qPzSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WbVAZQipRy2EOOC/+c4YnyS5CnGncofhBgcTLtxgo57Vi7S2g6t8qmZFAWLYZX/F2
 /0AOOa9hsy4dEf43OgNMW3JNI6AY8xpKxci0/GF4QNnlUUEUcPG55l2/Tx+PtCwLmr
 eat0Hxn776b2QtDXjfjeEf5TeYI7QanWe3gut+fFOzewH+59DwCl7z+nGTLOM4CHTV
 oTIhRG/0q+c7v3g4EAdeh8JYCuDtCq8mhu2H1jTxMzHNdfOt48HN5GHQUagdiT5b1w
 yMygHch6XapHLUSu881s3yoauCoKF7pqh4XKN2HIyh/zQiNcIdpB3F2ErnccTTCvYB
 f/t2xr/4mx+vA==
Date: Thu, 6 Nov 2025 17:40:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE7800
 GPU in Renesas R-Car V3U
Message-ID: <20251106-tint-thicken-c1144805dbe4@spud>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nug6ibDGNUNHBi09"
Content-Disposition: inline
In-Reply-To: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
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


--nug6ibDGNUNHBi09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nug6ibDGNUNHBi09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzdiwAKCRB4tDGHoIJi
0q5zAQDQO3HU4rBHEYYaA6op6DN3b+E6VTQEq+5YjfFxJtsiDQEAqJ3q5tQGcerO
A41x5Hh8DasWQ9gqFNN1XGWaoCJ8fg0=
=ba9X
-----END PGP SIGNATURE-----

--nug6ibDGNUNHBi09--
