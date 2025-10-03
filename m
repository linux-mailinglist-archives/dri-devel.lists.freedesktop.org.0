Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D01BB6C9A
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 15:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB8310E908;
	Fri,  3 Oct 2025 13:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TlgeRQrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFD910E903;
 Fri,  3 Oct 2025 13:06:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A517E6212B;
 Fri,  3 Oct 2025 13:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFE9C4CEF5;
 Fri,  3 Oct 2025 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759496767;
 bh=eNt1Gcmgl05avc3eJ3PssbmGBA5Ku1mD4+vRG6E3X5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TlgeRQrw/M/6sxS4v8nGdyP6hV7p3O70yJjDCJGZFC+inkUh9Ps0AhfTa/nxa4X4s
 c5mIsJuUAJ1SM0H9oXjZxh7YGRM0fyCx0t+3LKBkziJfXMEhm7gLUhLcGaJTjWaoNN
 Mlv1UYzSydNzNCvXwtLHYaRJyf05IPnqemhWLsaqD3trgPH0KR96fz8GQ3D5/umi1j
 cv975MVhvL4sCQuSvzk44+FKxYfrbhoC7/4kCt4eFd06r7NZnvcehFAifZTGNmodWS
 RJBegdKK+9SK9eeGQVJcqhRkIKG0fRflr4hVRrx9fdmEjr4EGLHB1xtUD6tcxikWl4
 D1iOe0AW6IoWA==
Date: Fri, 3 Oct 2025 15:06:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
Message-ID: <20251003-crystal-monkey-of-fantasy-ea4a1a@houat>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
 <20250928-limit-infoframes-2-v2-2-6f8f5fd04214@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="54ncbnvuigfo4z2w"
Content-Disposition: inline
In-Reply-To: <20250928-limit-infoframes-2-v2-2-6f8f5fd04214@oss.qualcomm.com>
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


--54ncbnvuigfo4z2w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/9] drm/bridge: adv7511: handle unsupported InfoFrames
MIME-Version: 1.0

Hi,

On Sun, Sep 28, 2025 at 11:24:47AM +0300, Dmitry Baryshkov wrote:
> Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
> return -EOPNOTSUPP for unsupported InfoFrames and make sure that
> atomic_check() callback doesn't allow unsupported InfoFrames to be
> enabled.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index b9be8654130758e69ac7ccbc73a82cc25d731a5c..241f02143f59322a814b4b277=
082637d59be7d5f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -906,8 +906,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct=
 drm_bridge *bridge,
>  		adv7511_packet_disable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
>  		break;
>  	default:
> -		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;
>  	}
> =20
>  	return 0;
> @@ -966,19 +965,32 @@ static int adv7511_bridge_hdmi_write_infoframe(stru=
ct drm_bridge *bridge,
>  		adv7511_packet_enable(adv7511, ADV7511_PACKET_ENABLE_SPARE1);
>  		break;
>  	default:
> -		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n",=
 type);
> -		break;
> +		return -EOPNOTSUPP;
>  	}

I'm completely fine with that part.

>  	return 0;
>  }
> =20
> +static int adv7511_bridge_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
> +{
> +	/* should not happen, HDR support not enabled */
> +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> +			     conn_state->hdmi.infoframes.hdr_drm.set))
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +

However, I'm not sure we need that boilerplate in any driver. I'd rather
expand the kunit test suite to make sure it never happens rather than
adding it to every driver.

Maxime

--54ncbnvuigfo4z2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/KMwAKCRAnX84Zoj2+
dnyuAX42GfxKCL/3093it2n3uUpzK4IH9zfQ3SHTXOJGmhKXFE5M88bQKfBUgIh/
+g4R80YBf2MDvgokTCDsxDGAEu7jkpWUmqQgAkHrI1IDGnk4vLKev6hUVpls0k2z
ag0XePnvhw==
=iLh5
-----END PGP SIGNATURE-----

--54ncbnvuigfo4z2w--
