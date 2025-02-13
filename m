Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D8A345FB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D3210E0D9;
	Thu, 13 Feb 2025 15:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UgIc7qdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218C110E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:21:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA1295C57AD;
 Thu, 13 Feb 2025 15:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFD3C4CEE4;
 Thu, 13 Feb 2025 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739460073;
 bh=1r8Npm9BUrgfWKv/Ig1u/J729ZLsay612p1P+FDuxQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UgIc7qdMlU26bzgYV6RFmFfTu15BK/pkzjamfYIao6kGcQLNiZlHkpN3NXS2ksGVf
 lHkN+oSW3ZD57Oe1A11LMXXZcNeQVeiALFDXHc9CCcR33bFfkt00Z1vp5FNnRKtVmS
 zHpI76AV2s8D1geP5X7zjWGjQ2UWj70d+vjxuneXVAv4B94xOLjLwKOGYSRoKC4lpH
 88Hex7Bnh89hUOEVIp+78yiHOu6Hih+UdnbPonBZAsl12Hq7zLDh+vmtudPvdklMRd
 kU3qojnPZXWy30+3ys8z7pk3PjR9xpaQ0XyHrvfY8dqoihOEbifI8jAj3Lxt33EDCg
 w+fgtl/Q4juSg==
Date: Thu, 13 Feb 2025 16:21:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 0/4] Add support for errors recovery in the TI
 SN65DSI83 bridge driver
Message-ID: <20250213-sceptical-coral-crocodile-c8c4b6@houat>
References: <20250210132620.42263-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="l2ycl75au4yfqn5p"
Content-Disposition: inline
In-Reply-To: <20250210132620.42263-1-herve.codina@bootlin.com>
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


--l2ycl75au4yfqn5p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/4] Add support for errors recovery in the TI
 SN65DSI83 bridge driver
MIME-Version: 1.0

On Mon, Feb 10, 2025 at 02:26:15PM +0100, Herve Codina wrote:
> Hi,
>=20
> Usually the TI SN65DSI83 recovers from error by itself but during ESD
> tests, we have some cases where the TI SN65DSI83 didn't recover.
>=20
> In order to handle those cases, this series adds support for a recovery
> mechanism.
>=20
> Compare to the previous iteration, this v6 series fixes a NULL
> pointer dereference.

Applied to drm-misc-next, thanks
Maxime

--l2ycl75au4yfqn5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ64N5gAKCRAnX84Zoj2+
duDnAX43dyDoYgSMO7AJmHTKGeMZSm8GBT/8SI46i62wiRVeedKdQvx/IbptPACw
z5u0l+IBfRlKzXIejmMI+r4uHcuSgOuPKGomH+BNnedzyRNtBFbgl4LW1NjcmtPH
RCS2989e2g==
=41Yj
-----END PGP SIGNATURE-----

--l2ycl75au4yfqn5p--
