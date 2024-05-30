Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCDD8D4831
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8726211BA41;
	Thu, 30 May 2024 09:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LkAHxZxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4D911B81F;
 Thu, 30 May 2024 09:16:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF0AE6255A;
 Thu, 30 May 2024 09:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276A1C2BBFC;
 Thu, 30 May 2024 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717060571;
 bh=AQM2lahhdlmVdayxw+qgYQXGA18NxsTQtlliH668hJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LkAHxZxmhRTGUGj2f/G9QVsM8D2wrN7oOowdxnoP7N6WJwEfDiuZX8/9nzcmH/biA
 oBavLoTbTAPZm7vcTo0+Afpr6JDTGaDkjq33No4kNo0P5PSjJEfziInY0Bu0qhx6iA
 1ABi1ogr2oJvJmQoweDbBHHupRbvVs+nZN5xc9jgupqQub/JdgI4shrW2rZEesTIO1
 PjzlAOR0q6NmiJSaPtPWarr9DQGeimOHgRqr3MPMUzHSSMX7jEr62fyq3CeGj926gH
 tAmo8NYb7e8+Whde8PIkKZeyAWzWXrfO281beyIXR3bsnC/QdO+MMPV0A6prb+fzdI
 /L2K1HqhXt3+Q==
Date: Thu, 30 May 2024 11:16:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
Message-ID: <20240530-poised-burgundy-petrel-7affed@houat>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-5-a1d184d68fe3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5forzva7txjtgmqb"
Content-Disposition: inline
In-Reply-To: <20240530-bridge-hdmi-connector-v3-5-a1d184d68fe3@linaro.org>
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


--5forzva7txjtgmqb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 02:12:28AM GMT, Dmitry Baryshkov wrote:
> Setup the HDMI connector on the MSM HDMI outputs. Make use of
> atomic_check hook and of the provided Infoframe infrastructure.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a general comment: I really like it, it looks super tidy. Thanks!

There's a couple of minor issues below

> -int msm_hdmi_audio_update(struct hdmi *hdmi)
> +static int msm_hdmi_audio_update(struct hdmi *hdmi)
>  {
>  	struct hdmi_audio *audio =3D &hdmi->audio;
> -	struct hdmi_audio_infoframe *info =3D &audio->infoframe;
>  	const struct hdmi_msm_audio_arcs *arcs =3D NULL;
>  	bool enabled =3D audio->enabled;
>  	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
> -	uint32_t infofrm_ctrl, audio_config;
> +	uint32_t audio_config;
> +
> +	if (!hdmi->hdmi_mode)
> +		return -EINVAL;
> +
> +	DBG("audio: enabled=3D%d, channels=3D%d, rate=3D%d",
> +	    audio->enabled, audio->channels, audio->rate);
> =20
> -	DBG("audio: enabled=3D%d, channels=3D%d, channel_allocation=3D0x%x, "
> -		"level_shift_value=3D%d, downmix_inhibit=3D%d, rate=3D%d",
> -		audio->enabled, info->channels,  info->channel_allocation,
> -		info->level_shift_value, info->downmix_inhibit, audio->rate);
>  	DBG("video: power_on=3D%d, pixclock=3D%lu", hdmi->power_on, hdmi->pixcl=
ock);

pixclock should come from the connector state too. It's still calculated
by the driver in msm_hdmi_bridge_mode_set

> @@ -341,8 +425,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
>  	bridge->funcs =3D &msm_hdmi_bridge_funcs;
>  	bridge->ddc =3D hdmi->i2c;
>  	bridge->type =3D DRM_MODE_CONNECTOR_HDMIA;
> +	bridge->vendor =3D "Qualcomm";
> +	bridge->product =3D "Snapdragon";
>  	bridge->ops =3D DRM_BRIDGE_OP_HPD |
>  		DRM_BRIDGE_OP_DETECT |
> +		DRM_BRIDGE_OP_HDMI |
>  		DRM_BRIDGE_OP_EDID;
> =20
>  	ret =3D devm_drm_bridge_add(hdmi->dev->dev, bridge);

It looks like you're not setting either the supported formats or bpc?

Maxime

--5forzva7txjtgmqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlhD2AAKCRAnX84Zoj2+
dvdkAYCryHF7SD2wn1N8TdrGd15DJPIga+r9drDaxTr0rBTOxzbQF7x7YiyX2hH0
CTeY9AsBgKWaEKe7Dbe67TtNLnv9K8XLecp8Gdd4Q7qOdun/xGlo9UWqcOTNeHVb
uIQEISEO9A==
=tPbA
-----END PGP SIGNATURE-----

--5forzva7txjtgmqb--
