Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78888CB0350
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952FD10E5F4;
	Tue,  9 Dec 2025 14:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="npz5d4O0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F29C10E5F3;
 Tue,  9 Dec 2025 14:11:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 93A8B600B0;
 Tue,  9 Dec 2025 14:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04F8C4CEF5;
 Tue,  9 Dec 2025 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765289482;
 bh=wKR6M3heNWDWgben29U6U09LDt6ie/nrp3hxYzAUbek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npz5d4O0CrdapJo0o6NJdOiCHFzhMkLMMVdLRp/dcDZKrV/FhAuf5fMKy52dgkDN/
 /bnA/l5fbnBdKLBohLzES2idJj/UNpdncLONYwRy4nsJszm+f+VutpArhc5gQnzYf6
 EHsAMKk8GVDoyusqLZ+T9yM4mGFDsNTTzFM57rPeelHww1nUffQxXB9QrTdb9Wm93d
 ncIwthjTHH2GP8w1jojEZ3YrMC2rYFDy17DLf4QB+rfovrHlhmOvwDUzfWo4gKgFmG
 pmJTnqh0lLVVHdOx1g3HEZpzm76QC9q8Y5Hyz3sVxWHIhn5EVnkvHK1UKv0tGPySq4
 lEz9zwyjLvNjg==
Date: Tue, 9 Dec 2025 15:11:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Andri Yngvason <andri@yngvason.is>, Werner Sembach <wse@tuxedocomputers.com>, 
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v5 02/17] drm: Add new general DRM property "color format"
Message-ID: <20251209-gifted-coyote-of-endurance-b81bf5@houat>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-2-63e82f1db1e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xmgtsad7bfjv2vcw"
Content-Disposition: inline
In-Reply-To: <20251128-color-format-v5-2-63e82f1db1e1@collabora.com>
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


--xmgtsad7bfjv2vcw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 02/17] drm: Add new general DRM property "color format"
MIME-Version: 1.0

Hi,

On Fri, Nov 28, 2025 at 10:05:38PM +0100, Nicolas Frattaroli wrote:
> From: Andri Yngvason <andri@yngvason.is>
>=20
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
>=20
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)

I'm not entirely sure that's how we should document it. i915, amdgpu,
and every driver using the hdmi helpers uses the same algorithm: first
try with RGB, then fallback to YUV420 if it doesn't work.

I think we should document that, and every driver exposing this property
should behave that way. It's going to be a mess otherwise.

Maxime

--xmgtsad7bfjv2vcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTguAQAKCRAnX84Zoj2+
duXEAX4/CZjEf/Vz9OyLVH222nBTa0uS2T+fskhBgao890YpCT1nvetsMg1D+aIo
gc27WY8Bf1WyDvIujAc3Iyfya9WQrPgrl28osjHsEQzd3REVZ5vzuOsRVp8IxnF2
E9P+eFkHmg==
=aoBp
-----END PGP SIGNATURE-----

--xmgtsad7bfjv2vcw--
