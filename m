Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BBABD60F4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 22:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E56010E1F6;
	Mon, 13 Oct 2025 20:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nqxEukwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8199210E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:19:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD61161DB4;
 Mon, 13 Oct 2025 19:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151EBC4CEF8;
 Mon, 13 Oct 2025 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760384548;
 bh=ixwFdgEDV1vu1vzeg2qqQRwOw909mWVq2oy7W8xBU8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqxEukwIUDgo85pIstDgdKdZE+8YzI57ha+0WdxwRe9i2ov5PZOK2WtAwViW6mIRW
 hkceeBaoWdDZNZ4v4FG17UGNiK4029Aispld2PGhF3CXts8gLz+OwSCFxyBzI5wh7q
 dipFaT8oNyEK2VonPte6vulHKxLAo+qXp4R30GKLVlGqeYoOEQ6cwkOkFA2noNhXWO
 fHOay3Ul5BE50A0Ay29/98aleZN8tsJOjy1OftGqkz8NULfFTAx1TuIfe1bH2WnYgG
 H6kb55VjmmQ9TpNNcQs/HWh+oE5cm0lRCS7pRlkb7Z0l7nW6Ln/WEGnYdry8I77vMg
 2RzaaOTTEdgvA==
Date: Mon, 13 Oct 2025 20:42:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img, powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
Message-ID: <20251013-antiquely-unflawed-acba8cd30277@spud>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="POmQqzPbtUQG0SRW"
Content-Disposition: inline
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
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


--POmQqzPbtUQG0SRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--POmQqzPbtUQG0SRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO1WHgAKCRB4tDGHoIJi
0md2AP93sXHNI+r51S7+e52a5fQ3zBG8dz6mP6G+x+3DQmyQeQEA+pvsrxIei9Rf
epAILOGpCNuTKgdzwuz6M74yE/by1AY=
=/GHk
-----END PGP SIGNATURE-----

--POmQqzPbtUQG0SRW--
