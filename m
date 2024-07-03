Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79404926515
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5F010E985;
	Wed,  3 Jul 2024 15:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tdNtc0oj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5B210E979
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5DD09CE2CE6;
 Wed,  3 Jul 2024 15:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F6FC2BD10;
 Wed,  3 Jul 2024 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720021144;
 bh=AAX3Z9qKXX6pCk5hoyj4TQaQ10/3VlDd1N2fKFMii1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdNtc0ojh1GNdXct6tj8gKB1FBS/E/p9NzDXoFw3t1PA243S/cbK1AD0Bjm8J5BX1
 6h63QoToM6KsFnwQKrNjZ935Q1KVhXCtROmx5EcGez6jpMRWbXNPVKvL8kUjxmDPb5
 Z4LJ3J8iPzMqC834XQh39N2iD39mma8x5u5kvbKAMu2Le1FWKehWtK06y0Hld6RcMz
 uG8YKkCTnuy3W1cO2fPYHRIHmuME04KMwK1zt10EfpJqsVD3jR8rwCGDsr7blh2B8D
 b+wU7eNfnQlQd2hu2lyZVmPjVVZUaWewo/bTkVBFtFpX7hKrsQHLOtTuVf+uhhmdcM
 mcX3DUHMG1kRw==
Date: Wed, 3 Jul 2024 16:38:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Rename WL-355608-A8
 panel
Message-ID: <20240703-dynamite-monsieur-6d026ccb979b@spud>
References: <20240703103710.31169-1-ryan@testtoast.com>
 <20240703103710.31169-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tF1aKqlVgejw4feN"
Content-Disposition: inline
In-Reply-To: <20240703103710.31169-2-ryan@testtoast.com>
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


--tF1aKqlVgejw4feN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 10:31:44PM +1200, Ryan Walklin wrote:
> The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
> OEM used in a number of handheld gaming devices made by Anbernic.
> Previously committed using the OEM serial without a vendor prefix,
> however following subsequent discussion the preference is to use the
> integrating device vendor and name where the OEM is unknown.
>=20
> Alter the filename and compatible string to reflect the convention.
>=20
> Fixes: f08aac40639c ("drm: panel: nv3052c: Add WL-355608-A8 panel")
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tF1aKqlVgejw4feN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVwkwAKCRB4tDGHoIJi
0jEPAQC/80YDu9SBIC9n7gCzVDjm5fGbTUgsDl3yz56idKPYrQD/ch6xUHkRL1ip
24opH0VBBd9Ga00ZPyzUtY3PXWgt/gk=
=O1yN
-----END PGP SIGNATURE-----

--tF1aKqlVgejw4feN--
