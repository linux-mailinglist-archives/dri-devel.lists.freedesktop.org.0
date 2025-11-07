Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A8C4108C
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5883B10E11E;
	Fri,  7 Nov 2025 17:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gzAvUWk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2654410E11E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:26:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE3C940762;
 Fri,  7 Nov 2025 17:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6269C113D0;
 Fri,  7 Nov 2025 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762536381;
 bh=CG3sp03scUguoBw/Rgi9tbhANOp5T1t4Ii9zLGB26UU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gzAvUWk8x8FBe1LtHXxG1aRk04wwvE3F08YIXAmXwOCs+6cLJQBvszupU0s1V5L+P
 aELjti1enD4epEJ6iym2408P+xvhlLVI5NYsreYRzvVAcCrWQXnsdBJBtaRMBL8eDk
 VykIE3J4BzuQevfvteuIoPYZxnhrB+5DTDhHwcPIMGd3X557rmGMrBySXKjPeiEfxw
 cyT76EXUQEPBF+QswNKyoZ1dMMOzinx+CSdHZADWHKRsBxGtYhUUbdmOK06gO9QZkI
 qzEUQrzDFjpLXSNOvy7C46ga7CYh9sNHa5ryAwCnbNRFD3xmnFNKAKfsv1y7I1mY7e
 kwsqLAfvYotdg==
Date: Fri, 7 Nov 2025 17:26:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
 rfoss@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 andy.yan@rock-chips.com, heiko@sntech.de,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: rockchip: Add no-hpd for
 dw-hdmi-qp controller
Message-ID: <20251107-salutary-flatbed-0a9d343ea233@spud>
References: <20251106180914.768502-1-macroalpha82@gmail.com>
 <20251106180914.768502-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nv5aRATXfvkz/qx9"
Content-Disposition: inline
In-Reply-To: <20251106180914.768502-2-macroalpha82@gmail.com>
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


--nv5aRATXfvkz/qx9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 12:09:12PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add an attribute of "no-hpd" for the Rockchip dw-hdmi-qp controller.
> This is used to describe implementations where the HPD pin is not
> connected or used for other purposes, such as in the RK3588S based
> Gameforce Ace which repurposed the GPIO for an additional face
> button.
>=20
> The "no-hpd" option was chosen to be consistent with other devices
> which already define this parameter for broken or missing hpd
> functionality.

Glad you mentioned this, so we could avoid the "why have you no vendor
prefix" conversation :)

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nv5aRATXfvkz/qx9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4rtwAKCRB4tDGHoIJi
0uPcAQCQYx52aKQ9WBWwYIfanyKVna1IMoK9mSl5rQD2kACGUgD/Z92gV37yqP21
NuwDcsmdPlMhKmsGtM52wv5NRkPf5Ak=
=/cD2
-----END PGP SIGNATURE-----

--nv5aRATXfvkz/qx9--
