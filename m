Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA85A4DAF1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0AC10E57C;
	Tue,  4 Mar 2025 10:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L5hRRGei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2342110E57C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:40:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 40C9CA445A0;
 Tue,  4 Mar 2025 10:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73554C4CEE5;
 Tue,  4 Mar 2025 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741084813;
 bh=zeuR33V6Nig3YTRf30aeCyZJpnmVoH5asRZEzpfD4kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5hRRGei3/msl+PS8pM7qByJEABWMzDWKEMhUqqHGRhAffKerYH4+XUI4212pyfgs
 FqJjeAf7G41blnAqyzAf6knJs6Yz9BWUcypZfqH/2U0Iqq6iE2prArWEP7lFmtk3wx
 34+t8NXHvJHH7Tc14Bfp3MTlZoBhsJMZD7ImF8bSPQGTSP2kIMjLY2/LEraiVZYmwB
 jzjiVHSmaDFn81j9RUEJjR8nQIO4rtur5bKTsZpJuts7o156sZfxxBTAPlunINowQw
 DPpc2B3WcCGVBUVHOLqxzPZ3l7P0a2mZjZLuGh5i/zh6iCPfgyg97kbKHRIQdDe8Dq
 cc9mQN/LOljpg==
Date: Tue, 4 Mar 2025 11:40:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch
Subject: Re: [PATCH 4/5] drm/bridge: simple-bridge: Add DPI color encoder
 support
Message-ID: <20250304-diamond-toucanet-of-pizza-6faa2d@houat>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-5-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cvg5trahoe45bnma"
Content-Disposition: inline
In-Reply-To: <20250304101530.969920-5-victor.liu@nxp.com>
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


--cvg5trahoe45bnma
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] drm/bridge: simple-bridge: Add DPI color encoder
 support
MIME-Version: 1.0

On Tue, Mar 04, 2025 at 06:15:29PM +0800, Liu Ying wrote:
> A DPI color encoder, as a simple display bridge, converts input DPI color
> coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
> converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
> bits in every color component though). Add the DPI color encoder support
> in the simple bridge driver.
>=20
> [1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downlo=
ads
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 104 ++++++++++++++++++++++++-
>  1 file changed, 102 insertions(+), 2 deletions(-)

Same thing, I think it's easy enough to write a transparent bridge to
just put it into another driver.

Maxime

--cvg5trahoe45bnma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8bYigAKCRAnX84Zoj2+
dkiDAYCgU0NDy1jNNt5ll1AoLdiTQdjBqC3CiomoIEQeInCOcNZGk32SYUau3oIa
nH69OMEBgJDUtmPZ9EnGSsDmK6PCaWlzXdFmyC1Jgt2fTwkEEY3QPSHAty8LFgG4
6EfonZdIGw==
=02dW
-----END PGP SIGNATURE-----

--cvg5trahoe45bnma--
