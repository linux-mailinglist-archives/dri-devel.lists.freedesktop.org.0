Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C721AB514C6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D022610E8E1;
	Wed, 10 Sep 2025 11:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GN+OSMOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9140110E8D8;
 Wed, 10 Sep 2025 11:05:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2083C43FA2;
 Wed, 10 Sep 2025 11:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7297FC4CEF0;
 Wed, 10 Sep 2025 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757502350;
 bh=3vKUwDPyxY+sseiR8nmx7Ts9m3y+/etlfgrvBDkuze4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GN+OSMORf3Q12T8aH7Eft8BEU//JedXUgIkbxmsGUx58zRf9KX5PvOyrcBi0vbgyw
 Pr89t4+LtMmnoiEWrNUrLMhgVSGgEVloMZegmdixkK4NShwrgW4+PVb/kVuW4IcA7l
 Xorw2zDPzxGGf0ZCxeJqaNq8a/wY8uggmxrzvuzQzOoCMum5Pi+DFSEh/+SOoIoUgj
 D2DeEykRtyj8suBVThYLqmCb79dYgeWkJyexyfE1xYlScYk8WzeWrIvB+bKuAHwKzz
 MbBXnbDh5DOJt87aKD2uO4EuAurSyIJ48849AGijGDkHUm/cWOWrIVfdPGHosi0hVp
 OyE0tSWrtAZdA==
Date: Wed, 10 Sep 2025 13:05:47 +0200
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
Subject: Re: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Message-ID: <20250910-magic-natural-saluki-4aca9d@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6mjdewn6swmhkqjp"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
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


--6mjdewn6swmhkqjp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:52:08PM +0300, Dmitry Baryshkov wrote:
> Sending Audio InfoFrames is mandatory for getting audio to work over the
> HDMI link. Warn if the driver requests HDMI audio support for the HDMI
> connector, but there is no support for Audio InfoFrames.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_audio_helper.c
> index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa=
86c154c3a5531fe 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -10,6 +10,7 @@
> =20
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_print.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
> =20
>  #include <sound/hdmi-codec.h>
> @@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connect=
or *connector,
>  	    !funcs->shutdown)
>  		return -EINVAL;
> =20
> +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> +	    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
> +		unsigned long supported_infoframes =3D
> +			connector->hdmi.supported_infoframes;
> +
> +		if (supported_infoframes &&
> +		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
> +			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFr=
ames\n");
> +	}
> +
> +

That's not what I suggested. What I suggested was that we tould check
the return code of write_infoframe, and warn if it is set by the
framework, but returns EOPNOTSUPP.

Maxime

--6mjdewn6swmhkqjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFbiwAKCRAnX84Zoj2+
dirGAX4uKxTLTYBVNw7Full2UUa5VuWquXM6Yf9V75SJdwVH/LBdZKdEu2L5zcFu
4A/bxOwBfipkuEzUY5FfJt6YBzOLmgB9EMwhn/Z1a+okQD5MuPEy0LtOtwYYWOvQ
oQFyrwx8zg==
=PKSd
-----END PGP SIGNATURE-----

--6mjdewn6swmhkqjp--
