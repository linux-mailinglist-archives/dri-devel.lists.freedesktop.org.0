Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E864B3DADC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411E010E395;
	Mon,  1 Sep 2025 07:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qvRDcRrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133F010E395;
 Mon,  1 Sep 2025 07:12:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 88BDB43627;
 Mon,  1 Sep 2025 07:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41B7C4CEF0;
 Mon,  1 Sep 2025 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756710768;
 bh=sqbENlpFH5Ccvd/AgXy87AdCw0HQL2r94DTlakLOXkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qvRDcRrJ3D2orbIXD7WnuTXHeCCjdEyWTuDs2ehGvhH6g092TdwffObCqw6c3uPLj
 /LyQnIM2gYrkY8DFOfIK0y8o9dXYqaB/y6NMyGkRxKvMlT3K9spwFFMDYRtxMCKJej
 1wrFpvr9L++WHzsNl28uYkEvkhaQTo3ziwnt7z0yMtJCHEWdaOMCxn8TX4Jvo9oQPX
 fYB3jIhQEdxqsmSzY+6qM25gbImIAMBuY2woXO5cFVs9o3SpRem6K0tuRgzRzeu/NI
 DR/Ca/K5KgS2GLJQRe0egTW1bfKVOFXUd2fX+2D36zBgNZ0ccw7or48CslrIcmF8Or
 A5QRwxc+l8WBw==
Date: Mon, 1 Sep 2025 09:12:45 +0200
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
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported infoframes
Message-ID: <20250901-tidy-auburn-tarsier-e7b1e7@houat>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pqxavipok3t73ium"
Content-Disposition: inline
In-Reply-To: <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
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


--pqxavipok3t73ium
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported
 infoframes
MIME-Version: 1.0

On Sat, Aug 30, 2025 at 03:22:58AM +0300, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface. Audio infoframe is handled separately.
>=20
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545e=
d270665e692b12c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct=
 drm_bridge *bridge,
>  		break;
>  	default:
>  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;
>  	}
> =20
>  	return 0;
> @@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct=
 drm_bridge *bridge,
>  		break;
>  	default:
>  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;

We do need to document that it's what drivers must return though.

Maxime

--pqxavipok3t73ium
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVHbQAKCRAnX84Zoj2+
dt3KAX0ZWp21D5I1WfwgyhTb7vH2ZBY8xOTpHJNqK0/JL81whZT+fJo0wz4+NRJx
iBLn7D4BfRsIiD6leCOIITTZsJxThT9rcAz5duWccxLZ5gpctOvKi1BZ0t0qCcPY
yc40IvF47Q==
=adUS
-----END PGP SIGNATURE-----

--pqxavipok3t73ium--
