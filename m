Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830DA311CB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFCA10E721;
	Tue, 11 Feb 2025 16:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HRKoVjAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC2010E70C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:39:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 059525C3A69;
 Tue, 11 Feb 2025 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53221C4CEDD;
 Tue, 11 Feb 2025 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739291986;
 bh=n1tpYT/FEf64u/FY9tw6DOskntyo3y2tuWRaFzOfXeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HRKoVjAoNV23MiZEh232xe9tnhznnaeFXbMrp4QefhLnMVVU9pCCI/PKRaWA+pDw6
 oeXVK+i0FVh0BIKa3csOFNLoCRTEsq/8gR1Ikp7EfiM7XVkrUFoY1I6F69zFojJ75K
 ioqz9u6EQw9LUZBM5My2PCz6+xG7I619YP7m4lOzVrroJEFhFnFGH5XMVmI97ekAtU
 /7hNSOSUi+LNrbMDoyGsA505m7IxOIZlWXtdUhfOn43o9dZg/onQO4fusBQU+XsYdm
 TH3JKhxWtJ7rAQL2BgiMjYMs0IyTpHUF1tOL470mQLwwfPzZ/5F3EIUbhI4uF7+OMb
 /gzQhctary9NQ==
Date: Tue, 11 Feb 2025 16:39:41 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, pablo.sun@mediatek.com
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add Himax
 HX8279/HX8279-D
Message-ID: <20250211-manly-backlight-a3904a9e79a7@spud>
References: <20250211114429.1519148-1-angelogioacchino.delregno@collabora.com>
 <20250211114429.1519148-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K61yT/4xlRiEL2k9"
Content-Disposition: inline
In-Reply-To: <20250211114429.1519148-2-angelogioacchino.delregno@collabora.com>
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


--K61yT/4xlRiEL2k9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 12:44:28PM +0100, AngeloGioacchino Del Regno wrote:
> Himax HX8279 is a Display DriverIC suitable for driving LCD
> MIPI-DSI panels.
>=20
> Describe this DriverIC and the Startek KD070FHFID078 panel found
> on newer revisions of the MediaTek Genio 510/700/1200 Evaluation
> Kits (EVK).
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--K61yT/4xlRiEL2k9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t9TQAKCRB4tDGHoIJi
0ud/AQCyEFDNhfi2DVH9b/xngpiFAhVpDl6JRDylVWH/AZlctAEAlkIBgrYHlqU2
+EYBA87Nu6Xj4HxqvNkVjhqzQZWqugw=
=aCqm
-----END PGP SIGNATURE-----

--K61yT/4xlRiEL2k9--
