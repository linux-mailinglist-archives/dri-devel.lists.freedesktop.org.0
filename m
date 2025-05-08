Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7AAAFD51
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 16:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285ED10E914;
	Thu,  8 May 2025 14:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t4x4rTXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (unknown [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A796910E914
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 14:38:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 248E95C633E;
 Thu,  8 May 2025 14:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395BDC4CEED;
 Thu,  8 May 2025 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746715126;
 bh=9yOcdIne5y4Mf4C+Ln8+C/5lI4uoJxGEYh5DXK7tSvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t4x4rTXQ7kusjUppFTp4Ck5eMgH7su/kfpNqnzpfIgdisfxmOm3v0y7tw/2OoJ/xC
 OGQs+U0IchViQTO8Tc3KyzHzZkpLSRKKhkFURNHIBpcvW6nqpKy90nEhV4J7e1Uesn
 yvf/Inrwlcl0ocDa03cjavV1U/XW3ibBjDfmC85gPvq3qBZ+bapDRM5CNz44n0ppEC
 xdTBwvO5l9L5pTnch/VSXsLvsYqvsK+Gh3fifVnX2slKHv3g+1dPmD2mL/3ZRyLvLU
 cwifnydE/LqsxyVPb7musWatO/16oUjd+H2Nghv039r5ej5iubHSvohkxqOHkkcr1c
 3a2HnHEZdd+zA==
Date: Thu, 8 May 2025 15:38:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37801
Message-ID: <20250508-unplowed-uneasily-7f075bdf380d@spud>
References: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
 <20250508-sm8750-display-panel-v2-1-3ca072e3d1fa@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3W9tYwD3JkBFR5uI"
Content-Disposition: inline
In-Reply-To: <20250508-sm8750-display-panel-v2-1-3ca072e3d1fa@linaro.org>
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


--3W9tYwD3JkBFR5uI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 04:34:47PM +0200, Krzysztof Kozlowski wrote:
> Add bindings for the Novatek NT37801 or NT37810 AMOLED DSI panel.
> Sources, like downstream DTS, schematics and hardware manuals, use two
> model names (NT37801 and NT37810), so choose one and hope it is correct.
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3W9tYwD3JkBFR5uI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzB8AAKCRB4tDGHoIJi
0geyAP9vnIZd5waQjrk3f24fmdDXXRBH1tAOFAgrVTxWJg/AcQD9FSjdHHh/rK+K
szh1K8B+7TvVUXzIOrlx6txW6wIfng8=
=vxm7
-----END PGP SIGNATURE-----

--3W9tYwD3JkBFR5uI--
