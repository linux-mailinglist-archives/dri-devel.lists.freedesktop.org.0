Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C59AD244C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 18:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEE210E21F;
	Mon,  9 Jun 2025 16:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZGpygfuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE89310E21F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 16:41:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF4105C462E;
 Mon,  9 Jun 2025 16:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A5DC4CEEB;
 Mon,  9 Jun 2025 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749487307;
 bh=n93YRT55tXc9tbl3XYCTeVbqkoJGRfkc8a+57xFlO9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZGpygfuQD7nH/8Xgo5iqvTCx3DHg226iju7zdE+0x3iNpM8PJynWLc9ykM8jJLOAD
 8ZZYTIzbCDgkIdYnujLlz/A7+NJOtRd1LxFCsCblq6OpqM3NTntCy6RZM6Bp3duhQR
 Gf/7Sj5ggOVDzjc37/9CYZ4g6gZWqSVWpChksf44DyfSLbuIy7ZKMTDOFbU33ISXs7
 +ljgs/DioyNPg8ZtrAIhrp7ujPEantS8d1UKkcNuoJOA/yRAo1JsHsqQ34Y8mSMBTO
 vAOufuVbwKh2WQeu8KqV9BwyOpvAm6mW4KaC9pP2xh1+iOjYS04X7L0sRTi8s5l7lr
 V2eCpYjPEdu1A==
Date: Mon, 9 Jun 2025 17:41:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi
 720x1280
Message-ID: <20250609-habitat-oxford-a9abba471303@spud>
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jIsME3oLcJFkBqGc"
Content-Disposition: inline
In-Reply-To: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
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


--jIsME3oLcJFkBqGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 08, 2025 at 04:28:16PM +0200, Marek Vasut wrote:
> Document the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jIsME3oLcJFkBqGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcOxQAKCRB4tDGHoIJi
0lmPAP4pIv3sgq4LD66AOamHXrQc/NzJVU0NWG2keJQb3rlYKgEAqYAKGnGLeUuJ
p/l7RxdEHGzoMyn/1VAOoD80Ay55sQs=
=agje
-----END PGP SIGNATURE-----

--jIsME3oLcJFkBqGc--
