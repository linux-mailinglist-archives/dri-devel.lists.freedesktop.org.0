Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42468A811DD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 18:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A096E10E257;
	Tue,  8 Apr 2025 16:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Np+QzJ1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDCE10E6F3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 16:17:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF49A5C3EFD;
 Tue,  8 Apr 2025 16:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4644DC4CEE5;
 Tue,  8 Apr 2025 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744129022;
 bh=D/u6fyxlHSleLdCoQek7uwAEz8bqYvcQCAlKrKE1QFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Np+QzJ1sEoTb+6Un2YVwu0qVVvBRJFUz8qUudB4McJxCY71Rp7MuX0YCBnByq0MNg
 9tl2nKluUeqmEVMjvU9Qdwpkr48AcAwDtrfEuejkvne6Le4WN8xdwIUuGRFhuTdfNR
 zT1PUUOTQ9yeB0Q7Hl4Mt/b7PK/4pjL2rMmbQC47LU8dqKiHUB2uwSgKCBvrajSMJ7
 W1SbaZsDNYYJ5v5aqvISyoOOUMXbPLPgN8mx6JfmWtmxXuAv9duaogRj4+gYCHHA91
 nbGalk0MWaEuSwpTbhTk1FNIAd+/tD/1Ybe31ho7i0ZETQfVInNISK5pEluaGz2KgH
 R2r4Y4VQU81tw==
Date: Tue, 8 Apr 2025 17:16:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Message-ID: <20250408-aloof-bobcat-982662a5b448@spud>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-1-200693efec57@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OKJtP93zrhfExoEX"
Content-Disposition: inline
In-Reply-To: <20250408-st7571-v3-1-200693efec57@gmail.com>
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


--OKJtP93zrhfExoEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 09:04:28AM +0200, Marcus Folkesson wrote:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--OKJtP93zrhfExoEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VL+gAKCRB4tDGHoIJi
0gamAQC0ifWDbCg05xEoWFlGsNIIHRu0xfM905aHXX6nF+Eh9QEAmqT0keC2p8QY
XrPKp65ATH1bYfg+XqgjzdKDVOcsngY=
=/fDX
-----END PGP SIGNATURE-----

--OKJtP93zrhfExoEX--
