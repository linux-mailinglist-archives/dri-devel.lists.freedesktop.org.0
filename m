Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93EB8BE9BA
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3809C11251E;
	Tue,  7 May 2024 16:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jVT4gjEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29964112528
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:51:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5C2CECE10C5;
 Tue,  7 May 2024 16:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7700C4AF63;
 Tue,  7 May 2024 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715100716;
 bh=/Bkd2IwTGaLgZju05dzWdon64EKKSvHjfKDMLbB1/9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jVT4gjEb4Ki4lwgfVfMSSKV0FIB3ScF4nul0QK+99jzj5PVrZ3AtEeNPhY4pFU5Fz
 uoHE+fuhAU8AyEq0THAcQX62DyEiiih3bCSIgsxvRFyfmIQfPoJwjvCFN7nzin0gjr
 IIe3enl8vX1GyZb3/34PtMv2iV9FF1VIijBprcDnVIrdUbZAR7dfzOqvjbd+H1vvyP
 filpHMehhCOwzz65GnbEu7rM7EM7nq73GBrl2dEJ5ova65j3SaeVx/b8PUhDDV2EH9
 mtPcdnsVdHUnkTo4iGbgL+UokMvKKBFfM5EQTHkdBOKvjc0vaJLSE+xxMEq1yLLlTs
 Mzi9nuysRBvBQ==
Date: Tue, 7 May 2024 17:51:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
Message-ID: <20240507-cardiac-obsessed-89f3b0894bec@spud>
References: <20240506194343.282119-1-knaerzche@gmail.com>
 <20240506194343.282119-3-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MJDZAnqOutdsOh4Y"
Content-Disposition: inline
In-Reply-To: <20240506194343.282119-3-knaerzche@gmail.com>
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


--MJDZAnqOutdsOh4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 09:43:37PM +0200, Alex Bee wrote:
> The DPHY's APB clock is required to be exposed in order to be able to
> enable it and access the phy's registers.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--MJDZAnqOutdsOh4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpcJgAKCRB4tDGHoIJi
0s4UAQDtrMr/zcll7XLRlmogcgoAfSJQZq1AEQQeJxIADgIQwwEA+aBSIaagtafp
+CaYRxpIvw/qSd+oMTrkzEpnz5opSg8=
=o2x0
-----END PGP SIGNATURE-----

--MJDZAnqOutdsOh4Y--
