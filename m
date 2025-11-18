Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC5C6843B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A0210E439;
	Tue, 18 Nov 2025 08:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h9BqL9sC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E655610E439
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:46:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4B531418DA;
 Tue, 18 Nov 2025 08:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C75C16AAE;
 Tue, 18 Nov 2025 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763455568;
 bh=YvYiPjHOM8NIfQlhPdCRp5N/8V+pXh6nu4IWU6ay+Gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h9BqL9sC7rSP2RImewjIFVoW79HEVhDLrOFjaKLV3WStkQLGIYKDw2gbRi4bHwzCv
 DX93oswySb5t3bTJ1i1EN7asT8ZVNrmhpXDyBD2ojzGAFCOzv9tkFeBB3e22n+ksTM
 gd0md+SdHFkFqaQxmSp/B16ihoP7zLogEsUDYF/tG2VEhH76wm1nDzNk0MMc0r7GPf
 t5D44hH7TrTQmhRR2ZUMGQf9HH1lTH+oAMahf2/R/d6x0u6Esn/A5Um87yvxNppur8
 b5PZD51EiTTEdxs5ZsQIsTq52QeWoUQbrL2KuSVsmfkuhYjwfam8bJ7fsDbWupfbTz
 df38LuO01hLyA==
Date: Tue, 18 Nov 2025 09:46:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>, rfoss@kernel.org, 
 tzimmermann@suse.de, jonas@kwiboo.se, neil.armstrong@linaro.org,
 heiko@sntech.de, 
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, krzk+dt@kernel.org,
 robh@kernel.org, Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
Message-ID: <avdnpwnxs6cql7eyckdt37szpcf5ztgxlc7juwu6tqj5xxu56a@nrwljig2p67i>
References: <20251113192939.30031-1-macroalpha82@gmail.com>
 <20251113192939.30031-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vhhdw6enyjwagv75"
Content-Disposition: inline
In-Reply-To: <20251113192939.30031-3-macroalpha82@gmail.com>
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


--vhhdw6enyjwagv75
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing
 HPD
MIME-Version: 1.0

Hi,

On Thu, Nov 13, 2025 at 01:29:38PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add support for the dw-hdmi-qp driver to handle devices with missing
> HPD pins.
>=20
> Since in this situation we are now polling for the EDID data via i2c
> change the error message to a debug message when we are unable to
> complete an i2c read, as a disconnected device would otherwise fill
> dmesg with i2c read errors.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

You must also disable any mode using the scrambler when there's no
hotplug interrupt available.

Maxime

--vhhdw6enyjwagv75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRwyRAAKCRAnX84Zoj2+
dgS7AYDBkt3cBPdcMD/mu/EnEtZBCdmbK+q861NQ/ztfDgSf9WrJs+FyQ72/qz5L
ahgVQHkBfi45ZGU7evYuDl47wxsJJd0obRVJDJlNk3eavEFouTcjjuIx3BjGwWhe
Tm+tve3o3w==
=LiPG
-----END PGP SIGNATURE-----

--vhhdw6enyjwagv75--
