Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75DDC1699E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20AA10E08C;
	Tue, 28 Oct 2025 19:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GrLIAFo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8882E10E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:25:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A18DF6117F;
 Tue, 28 Oct 2025 19:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C818FC4CEE7;
 Tue, 28 Oct 2025 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761679510;
 bh=XzkzbGZFJX7fWGHnbE/Y5oGhVPC5GuyUzPdnHmqzKb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GrLIAFo837yv+OWNyDu2d7MfcVLAIEW1OGZDv4EX/FNQrHRPhEHQqqadlnFzzWtbP
 pN6M2yGl+gQB88R+iroqnT2AlMq8biC3DoeyZ+uljYwqUIneHquhv29cbQZvEXcKu4
 ACazwHy3RZlY96Dfaseqoa9pF2FiAxEMvs7fjak2Xbf+2PalNuQDUCa6SmcoIUExaz
 Dd8Mef7vf09/9VhSGzDewGXOFDXKZGBht9veqw1xiqKow6c4c1KclcYhyaCClWtqks
 i8NU6u9vULZaqPSZDOj1ylhaYG+E+CQesRtsfboIF7pcycyey9qxpWSxPN7wyJ4Muv
 Chs3znba4NPSw==
Date: Tue, 28 Oct 2025 19:25:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: rk3588-dw-hdmi-qp: Add
 frl-enable-gpios property
Message-ID: <20251028-villain-baboon-a52e54d46050@spud>
References: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
 <20251027222641.25066-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iclSnaj8umiVc3sR"
Content-Disposition: inline
In-Reply-To: <20251027222641.25066-2-laurent.pinchart@ideasonboard.com>
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


--iclSnaj8umiVc3sR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 12:26:40AM +0200, Laurent Pinchart wrote:
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>=20
> Add an optional property to RK3588 HDMI TX Controller binding describing
> a GPIO line to be asserted when operating in HDMI 2.1 FRL mode and
> deasserted for HDMI 1.4/2.0 TMDS.
>=20
> This is used to control an external voltage bias for HDMI data lines.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iclSnaj8umiVc3sR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEYkQAKCRB4tDGHoIJi
0piUAP9EBL9wyve+A7DplHmvD/iHMXkse+rSUiPoBFdlzDNptAEAvqsaVjGlt25G
KP2c82RyKgToVpl0b7ZzHc5UWZ26bQ4=
=a3Iy
-----END PGP SIGNATURE-----

--iclSnaj8umiVc3sR--
