Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63992B514BA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE7A10E8D1;
	Wed, 10 Sep 2025 11:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m63mlDWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F4310E8CE;
 Wed, 10 Sep 2025 11:03:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D5200601A8;
 Wed, 10 Sep 2025 11:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E7DC4CEF0;
 Wed, 10 Sep 2025 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757502230;
 bh=UYWjKMF523Ekw7Bw98UkIXft7Kwx3TmgLpB7L6tfh5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m63mlDWZ7UyN+YkBriu39v3Ml8OZYHJ3sS5ToGI1uYGEV0tY8Mw311B0m7uz4rSAz
 Mutosf2rsQjrnV5ZDOBgQIUu+tfNhSiBPAB+Q7vvxX4ETm3mdqOoQHSepfpTgIN2h8
 zt+OLeR1dqvb/3HJUVjycOW1w3CtW88+vYJxpqvqlFhtr5LO08O71IdfjaF7lylFyb
 BQsEeUwWcx11sL74qqXz85TbRe/47Qz2+SFz+UVY7RZ9fO2+vjbFXaGP44XfJVZM1n
 EXkppE0EdiRuuC7kXQv6rxvJVAh2sd31GMdGiMm2lPL3Ee1+B1IH44xysygemd65Rr
 eyHLSSxTHEr7Q==
Date: Wed, 10 Sep 2025 13:03:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <20250910-furry-singing-axolotl-9aceac@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3kg3zivfcuv2t4hc"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
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


--3kg3zivfcuv2t4hc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire. Drivers are also expected to
> return success even for unsuppoted InfoFrame types.
>=20
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface. Make the affected drivers return
> -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which are
> not supported.
>=20
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Again, I still believe that it's a bad idea, goes against what the spec
states, and the framework was meant to be.

So, no, sorry. That's still a no for me. Please stop sending that patch
unless we have a discussion about it and you convince me that it's
actually something that we'd need.

Maxime

--3kg3zivfcuv2t4hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFbEwAKCRAnX84Zoj2+
dkRzAYCzQpQA/Ir3LWPQqxuIKthe+HVoEPQaMUjRgX+Ula46AjgZs5sQpXIzARWP
HvEZaiABfRY0fHLOQ/3ITnlioCgiECUTHWtXvwzwkeZPy/td6Zv8anX5A/E13TVJ
iH3N5Vfh4A==
=wXjx
-----END PGP SIGNATURE-----

--3kg3zivfcuv2t4hc--
