Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBEC8BC88F
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 09:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B0410EAC4;
	Mon,  6 May 2024 07:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="daqEwQT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3485810EAC4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 07:50:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7643961085;
 Mon,  6 May 2024 07:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2080C116B1;
 Mon,  6 May 2024 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714981799;
 bh=PScBbjAnxeZJlVZobb9RkhFjTBeBleYHRdB7+WbwtCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=daqEwQT72wzzVhhxaadbP0J7TfhVeGtkoDLVZBhP67FR+IrIX9JHHo5CMTt+aeT2o
 5fctJhDPhApWE6WV6FdDfuDqZFLm63Lonzwveroz2A3WUVGRjCWfv1GO6DdiUYCSbs
 iWg8thDix9w6nDLLjKVHPRm89YVBA4CgH0uwE1o98twpcLoR4sDWHKbJwpSFoGTtmq
 GoO1+LeN1pys+rFLW30DL8rfeo7kPYlTewsrNBRffJy23vjB7xLjIes4dwzyF78zzR
 gP65FY8VYbf5uWYIqxCQemcDrv9wvkDIWZa8F0plLIKNXcPQoze93iXeAwJoUTo+m7
 u0qAt/aGZx7Og==
Date: Mon, 6 May 2024 09:49:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v12 27/28] drm/rockchip: inno_hdmi: Switch to HDMI
 connector
Message-ID: <20240506-elated-cheetah-of-awe-bd10cb@houat>
References: <20240423-kms-hdmi-connector-state-v12-0-3338e4c0b189@kernel.org>
 <20240423-kms-hdmi-connector-state-v12-27-3338e4c0b189@kernel.org>
 <bab90a27-b742-4587-aec6-e4e1fdf2d186@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5r5gd5hzylmqbla5"
Content-Disposition: inline
In-Reply-To: <bab90a27-b742-4587-aec6-e4e1fdf2d186@rock-chips.com>
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


--5r5gd5hzylmqbla5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Apr 27, 2024 at 06:12:26PM GMT, Andy Yan wrote:
> On 4/23/24 18:45, Maxime Ripard wrote:
> > The new HDMI connector infrastructure allows to remove some boilerplate,
> > especially to generate infoframes. Let's switch to it.
> >=20
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/rockchip/Kconfig     |   1 +
> >   drivers/gpu/drm/rockchip/inno_hdmi.c | 143 +++++++++++++-------------=
---------
> >   2 files changed, 53 insertions(+), 91 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchi=
p/Kconfig
> > index 4c7072e6e34e..e2ec20c2e2eb 100644
> > --- a/drivers/gpu/drm/rockchip/Kconfig
> > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > @@ -72,10 +72,11 @@ config ROCKCHIP_DW_MIPI_DSI
> >   	  enable MIPI DSI on RK3288 or RK3399 based SoC, you should
> >   	  select this option.
> >   config ROCKCHIP_INNO_HDMI
> >   	bool "Rockchip specific extensions for Innosilicon HDMI"
> > +	depends on
>=20
> Is this supposed to be  DRM_DISPLAY_HDMI_STATE_HELPER whith you introduce=
d in PATCH 04/28?
> I couldn't find any place where  DRM_HDMI_STATE_HELPER is defined.

Yes, it was a typo indeed. I've fixed it in the next version.

Thanks!
Maxime

--5r5gd5hzylmqbla5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjiLowAKCRAnX84Zoj2+
dhERAX4hDKKQK0zUSiy8s+7HxdEWgMiPtGfXL1zjlOPBVdxa0oBEfrdf0wSgA6ZC
GvcBlYYBfiq7TVSrJMvpZnnDzUsshI7PPYS7GaVjK5IcPqxFB7jgVDcNihybvsg/
4zQYJv8UYA==
=CFE1
-----END PGP SIGNATURE-----

--5r5gd5hzylmqbla5--
