Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294BC15570
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7F10E5EB;
	Tue, 28 Oct 2025 15:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fbKhzdPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54B310E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:08:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2977C48EF3;
 Tue, 28 Oct 2025 15:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD92C4CEE7;
 Tue, 28 Oct 2025 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761664096;
 bh=nC5h8Ln9RiB4A32t/cW1wNQwvbwaWDrUshVJEGXjFc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fbKhzdPgXB6ebEOtYoiN0anfPBW7d1hKD0//YiiPI3FuBSIyfyD9VBl77gtua8cu8
 4RwdhGEvDTAaZY7L/D+CCB6bRrc951CgS4CC9y/yCrA119TKIAnFWCAyyKa+9nbsYt
 v8rzUMm76rCFx3tTG/fndXoJh9ZtnTiDirpoj+GLgGU/rySShcDsHGryvdZBMWH/xO
 A9ji6Y6VaBlnxY14gXdiBqRaOIn7+otKFBPj45AapTN2uMOG3uLJKQyMHQl+pDfCKB
 YU9uZftiy3bTTLXxX1hQJzLT077SVX7AKputTk8wfh1XIADHdDmTS9uX7yIPLkzLvb
 LztIRjbGUtr8A==
Date: Tue, 28 Oct 2025 15:08:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Message-ID: <5678895e-2647-42db-b3f0-86a21b9bc225@sirena.org.uk>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
 <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
 <63003a7e-8d3d-433a-8a44-54fe8740bc3a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hHHi8VVPfq5V2b8D"
Content-Disposition: inline
In-Reply-To: <63003a7e-8d3d-433a-8a44-54fe8740bc3a@collabora.com>
X-Cookie: Your canceled check is your receipt.
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


--hHHi8VVPfq5V2b8D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 28, 2025 at 04:57:03PM +0200, Cristian Ciocaltea wrote:

> This seems to have been already addressed:

> https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/

Ah, good.  Hopefully that lands soon, do you have any idea what's
holding it up?

--hHHi8VVPfq5V2b8D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkA3FYACgkQJNaLcl1U
h9AVOQf/TT3cHQKKcbpTXY1jqeGzTtOf4Q+lasiQNfgPQnTeq/V2uYagmZRlgVFc
9SDXeRkcFN/u7GiPt9+nQ4tWJaWkAV3BOnqPndzPF4mCtBqDuI68jq1wdjnY2ILB
ptsrNz1xkUu+oJlsPWALqlSsQHWGNsYENLDExWjs4/MkM45mOHEH2b/jPAoD4GTT
lmp2TmEYZ03SR8wl362H8XVg8GAHFZLVVdetTwdB3TknjZf5aJD8L3cf0uSqkufw
3lk0lx+xFMh6hk3IBLAiuqdhVMDEkUaSEpgy5lHGhpSraZYjJ6cvcyV/s8m7lGl4
s9ZOEfXvUgqO8XcY36AaBaNolFqsSw==
=AwHR
-----END PGP SIGNATURE-----

--hHHi8VVPfq5V2b8D--
