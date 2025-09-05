Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74DB46275
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D700110EC2C;
	Fri,  5 Sep 2025 18:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qCIlkDyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAB810EC2C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 18:41:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C79626029F;
 Fri,  5 Sep 2025 18:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7463EC4CEF4;
 Fri,  5 Sep 2025 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757097707;
 bh=WeIi89SnQNGL1h0wUByw5oTYq2pGLFI5/okk2z2uiNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qCIlkDyErCLZHaLujkCIP5Sjwzjevn4YLIshmhPJ4GhqLkw14x4zNw7KtMWf7uaB1
 26PTyKLassS7U109RQy40I5zHqBwOTy1jYameg+UJXRe5NOlLOFeBCIes+hLU36N7P
 /Fr/QRfeI6nNqfAKCm/PtOlZX10w1fRRE7OG4MmdXlzYXck02g0f4UiB3LKx9uLnv0
 LFbT0qLFaKmpZwZbszPhaIk2684dpe8tvmlPKnPoL3IbWCHUz1uJyRlTV0XTbzxP4+
 z8ol1YCajtUQUx9Z6XllhsamNncyT+OGy6PXoPnGSiIXRmPxBFOavaEpgCZMmT2Ici
 90aXSvmgobHlA==
Date: Fri, 5 Sep 2025 19:41:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
Message-ID: <20250905-uncorrupt-stream-c8dec3b86d66@spud>
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FVrm5AoPyokpwu95"
Content-Disposition: inline
In-Reply-To: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
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


--FVrm5AoPyokpwu95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 10:01:08PM +0200, Marek Vasut wrote:
> The ILI9881C is a DSI panel, which can be tied to a DSI controller
> using OF graph port/endpoint. Allow the port subnode in the binding.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--FVrm5AoPyokpwu95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsu5gAKCRB4tDGHoIJi
0hSEAP4/qmZ7UvMGCy1vid0r+6oo/ExhIo6I+mAIWegcOfW1lQEA75NLP0m9asCZ
p4qFonDTerxvGlSyGD+ZhOB3ayeqKwI=
=bLcv
-----END PGP SIGNATURE-----

--FVrm5AoPyokpwu95--
