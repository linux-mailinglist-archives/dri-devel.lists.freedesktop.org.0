Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7C9BD1EC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BB110E413;
	Tue,  5 Nov 2024 16:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cmUmzpkQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052D10E413
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 16:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6774A42B8F;
 Tue,  5 Nov 2024 16:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07BEC4CECF;
 Tue,  5 Nov 2024 16:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730823209;
 bh=eSDIHL9Lx3jVJUWMPjnlix71KpWYWYL873yuyuGqT0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmUmzpkQx1/Q9DXUjX6qBSgVLuVoYrjwF7maZOnNTP8rntuCaih5cVAODKLgP9Xbx
 Id6wrA4M1+sJJ2WctqX/t7/5OCTjNwoMHWGoIn1QxU6eeJYjMN4XVSEMLtiLq2o6nB
 X6CKGQFei6HirQn0NHS0yRf2FTbNpy2rCxLVYnM3Pk+ukAYZnsaUruILjxVCMOxmHL
 omX9drWCXTUEdVuzq8Zgft3AJdTsXqIguxqAilbQYBkfaIZxF0ZchCJdBGl2814h1Y
 F+uZ6xxrw3ycJNUY5agKm0WxD883qreG94QfZBKxl7MDtdfTCRSRscfP/QrywxmrOm
 zr78CgKSUV1Lw==
Date: Tue, 5 Nov 2024 17:13:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
 andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <20241105-secret-seriema-of-anger-7acfdf@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ttos2pb3wymv4mp7"
Content-Disposition: inline
In-Reply-To: <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
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


--ttos2pb3wymv4mp7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
MIME-Version: 1.0

On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> > function.  IT6263 product link can be found at [1].
> >=20
> > Patch 1 is a preparation patch to allow display mode of an existing
> > panel to pass the added mode validation logic in patch 3.
> >=20
> > [...]
>=20
> Applied to drm-misc-next, thanks!
>=20
> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc

Where's the immutable branch Laurent asked for?

Maxime

--ttos2pb3wymv4mp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZypEJgAKCRAnX84Zoj2+
dpfjAYCXCR61pzRZkuGkWB3Yv+7EqMH0dEZY3hO4ujeNE9k4Yn3LG2W7QlAouHUq
cGDO9t4BgPfRY/sKNRxOUREUKrW7wHa0QyC5uc8aFlYphEWapGbIqlEboX1Y6kAW
ANhpVKTYMw==
=83wB
-----END PGP SIGNATURE-----

--ttos2pb3wymv4mp7--
