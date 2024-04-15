Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F498A573E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 18:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F4C10E341;
	Mon, 15 Apr 2024 16:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DY8VYQg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8599E1126C8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 16:12:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 691A360EE9;
 Mon, 15 Apr 2024 16:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F5DC113CC;
 Mon, 15 Apr 2024 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713197542;
 bh=lf/eRIj/5j8u//ixELV2WwrUVkIcFMU4DZBF09ROLs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DY8VYQg/kDNpT3Ypyl8UjW7PsG4RSdEPOB6e3kuF2CNnSRuRavvwKX6f6RSqwoQ9b
 1HpcQ+crapieVK1m6Mj4P1xFow5OxmtSXkhNVWYYoENy+R9l2uTz8A4zGY+MnqA4w/
 l+0v5f+bymKN5I30nFS14A9YNgqxkH/IZXupSnyV/08Eawydb27eqtCQ5ADpvuRDjJ
 Rb5RYbes+mITOi+GjZwmWsvHlUqsFxq1+wCnToKsyRruUuy76FdQUySHmbNfcUeqK6
 QMGib7Xdse50YxBeKbcUtyq4EStoqGHUfzDGrAQikpu+KTz6nbmIb+Bdg6QdxOvSEK
 IRK4ia7EuCYKQ==
Date: Mon, 15 Apr 2024 17:12:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, markyao0591@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add #sound-dai-cells
 property to rockchip dw hdmi
Message-ID: <20240415-even-credible-385b03941c85@spud>
References: <3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AEo7oWbtHZPZ4TpT"
Content-Disposition: inline
In-Reply-To: <3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com>
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


--AEo7oWbtHZPZ4TpT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2024 at 05:38:05PM +0200, Johan Jonker wrote:
> The Rockchip DWC HDMI TX Encoder can take one I2S input and transmit it
> over the HDMI output. Add #sound-dai-cells (=3D 0) to the binding for it.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Please send cover letters for multi-patch series, for all 3:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Chees,
Conor.

--AEo7oWbtHZPZ4TpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh1R4AAKCRB4tDGHoIJi
0rvCAP9DMAtQlMI0B9a808d60hETrodKbxFqTBwuNCFIwujrSAEAuM+sNixMih38
zXZd/R0HJhwIqi6+r0qVmT4pKU4+DQg=
=qORJ
-----END PGP SIGNATURE-----

--AEo7oWbtHZPZ4TpT--
