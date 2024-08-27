Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2B4960B63
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 15:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B62710E09A;
	Tue, 27 Aug 2024 13:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FuFtNbHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2610E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:10:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87224A41967;
 Tue, 27 Aug 2024 13:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901F5C61048;
 Tue, 27 Aug 2024 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724764222;
 bh=5OdpWp2toBhBU4WiZZkZyU0CSsGAOTFhIgqBBr3Gf08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FuFtNbHdx3SZEei1GEAIMUJ4wuCBV4B7FWlGvusTjhuOlggK9s7nmn3DlivoEy6Q2
 9G/ZaIgtYTtVNHa8BUJMwwwW6L6CnrZvRChrNmr2NhWPkNl4rShgK7hnlyip3Mf28D
 6uZOczQKhpMF0v7HKeT8W5HYtbEVH2Fh/Vx55zVn+8tf83KRauN4TkOpTw5VWEJYld
 YhtPD6373ai0jeL8N4ofVHJW889s3OWbQRNeYzFwgUkl9grQgtNtvpZpQi0+EFgU28
 z3sb1GidZQ3turUSf5kHSBaJRk4dMmS1Kubqat2zaFEErFv5R3VlhTdqaVAbdtZq1V
 pVot1GEj4Tzig==
Date: Tue, 27 Aug 2024 15:10:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Hironori KIKUCHI <kikuchan98@gmail.com>, Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 0/3] Correct WL-355608-A8 panel compatible
Message-ID: <20240827-rose-tuna-of-science-4d0812@houat>
References: <20240626112005.248576-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ssshyrjley2mfxjz"
Content-Disposition: inline
In-Reply-To: <20240626112005.248576-1-ryan@testtoast.com>
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


--ssshyrjley2mfxjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 26, 2024 at 11:17:47PM GMT, Ryan Walklin wrote:
> The previous patch adding support for this panel [1] referred to previous=
ly by its serial number only. As discussed after the patch was committed, t=
he preference is to use the integrating device vendor and name in this circ=
umstance.
>=20
> This series corrects the panel compatible to reflect the vendor (Anbernic=
, already in the vendor prefix table), updates the NV3052C panel driver wit=
h the new compatible, and lastly adds num-chipselects and sck-gpios to the =
DT binding example, identified by make dt_bindings_check as required for bi=
t-banged SPI over GPIO lines.

Where are we on this?

The 6.11 release comes dangerously close now.

Maxime

--ssshyrjley2mfxjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs3QNgAKCRAnX84Zoj2+
dk3fAYDWAKctf+llbgLTK6fI/TBSYkj9E0xKs1oZVzwr4vDTQxE2IDjrlArAHLag
e7UvZvYBgKzeGYOtmiqfnedlIIclS6gozCtHbuvjaBKzmubRIJwL6Lg8GmUGtnnO
Ha1qhyGYOw==
=vIPI
-----END PGP SIGNATURE-----

--ssshyrjley2mfxjz--
