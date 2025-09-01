Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF0B3DAAF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7CC10E386;
	Mon,  1 Sep 2025 07:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rP/Q0WPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47DA10E386;
 Mon,  1 Sep 2025 07:03:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0B26601BC;
 Mon,  1 Sep 2025 07:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F408EC4CEF0;
 Mon,  1 Sep 2025 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756710212;
 bh=0sWYT/ZaAhbNgFwFtfXmdwfjqQLZ2xdw0LRrPXgMr24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rP/Q0WPi2UZ19fxbGP6Sge18m+HOXvCRKlJC5/jutB0TV8oWdx8o/teLpYtmawJ/H
 1fuOzy0RG8cFHr9OVhlcz58RDr9fkYh86fScJj3jIGZ4rQWCW47N1JI4GQrrDPRRxR
 9oJtgtXNyNSfMd7ldwhWmhg6YlVwbB2opwCmoxilOW0D9/T8z6fA91caao6eCCYrGe
 98rWo+iCqKaIIEIk86c6awjMAjDQaeLd4idRzKqsiBNXPRcO9ElA+fFslpuIRxaWyu
 n0MBUgUhjUqalKWxsbYswBMLi+UnTzICE8SgGuP96DTGVMGYlQ2kd3Zm4FKvIP0yVB
 pLGw9PNX3n+xQ==
Date: Mon, 1 Sep 2025 09:03:30 +0200
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 01/11] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <20250901-precious-observant-kiwi-cc5283@houat>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-1-32fcbec4634e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="d2n7j42lzxyhexut"
Content-Disposition: inline
In-Reply-To: <20250830-drm-limit-infoframes-v3-1-32fcbec4634e@oss.qualcomm.com>
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


--d2n7j42lzxyhexut
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/11] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Sat, Aug 30, 2025 at 03:22:57AM +0300, Dmitry Baryshkov wrote:
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire.
>=20
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface.
>=20
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I still don't think it's a good idea on principle, see my answer to your v2.

Maxime

--d2n7j42lzxyhexut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVFQQAKCRAnX84Zoj2+
dqWLAX4+87bZ7fsBevn2MdqNcQfYWCtBzCpIt7Ur2RMiKoK90YPBq18Wjbz7XTPj
6eoW9gUBf1/qZoIAUuLYXaWhDcYy/kgyI7+UbRWoALTKdYd+i3+BpclRaOQ4KZuy
jWcl9fVvJQ==
=xP3w
-----END PGP SIGNATURE-----

--d2n7j42lzxyhexut--
