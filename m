Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8F2DAA8B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70F689FC3;
	Tue, 15 Dec 2020 10:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC29089FC3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:01:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 91so19209473wrj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=T5oGv0G7I5GRBdSZoMEquZtD9DLE+SjefBj4bPO/vkI=;
 b=frynj94H7IGy/9Q8RPr61N+F8nH4OVFjsMrrWHFryJI2FloGO8luDqS/9YOa9BHf3x
 o4LyUHBYBoIHBolRzD9XoXVf0kozqTNkMNZRdiXlytdeWeLqToZiO8QyHbBvMGoVsT5L
 PGSA6rEkuaWCLTqjwPzhJezFJMqobMIOlxGPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=T5oGv0G7I5GRBdSZoMEquZtD9DLE+SjefBj4bPO/vkI=;
 b=TuZTEvCEWSVtmUVpgHPA//+7ZnVtdzLJavqg/gR763vkut6Bk9737/RzOS8TTtDagi
 ukzr4P+G2VOS48jLdUJmZinhnpf/AzZvKGNdBh9rYyVA3cbSK3jW61b6jqK/tc0+7bfr
 0pvJDEwbwMRF1KD/yssexzNo95UTCUOGQ0DEgew5PFSaDU/zbwfMxdFSYiPCM5Xo8oNA
 ghg7lt7BU2daATwfzK0j4gV5E9Svwi49+QOVc8gY2Pv9nMlTAFVc0w5OG4gYv+QRR9Km
 j1QwPsH2H2kQzpG7t07lmtlcv8DoNaW5VEvU7m+5/pHcslWdaSP1mcOfrehxm8Zz7tVN
 tKig==
X-Gm-Message-State: AOAM533LxL0imCFXErjwFZsT9z8h8bFMSH/YpC5P+Dvr/HEVRkHSXQvj
 qXCmUCW75W7VzbFVbs/IAwP81g==
X-Google-Smtp-Source: ABdhPJzZXFapJWgWIfvKcJ3+/UdAj25+uaJRo93WQmS+BF8W09ylZz40b903EwBp/2EysM9KsYlwCw==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr33297033wrv.124.1608026494688; 
 Tue, 15 Dec 2020 02:01:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b14sm36489094wrx.77.2020.12.15.02.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 02:01:33 -0800 (PST)
Date: Tue, 15 Dec 2020 11:01:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v1 1/1] drm: mxsfb: Silence -EPROBE_DEFER while waiting
 for bridge
Message-ID: <X9iJe2GdJ2VteOwl@phenom.ffwll.local>
Mail-Followup-To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1608020391.git.agx@sigxcpu.org>
 <d5761eb871adde5464ba112b89d966568bc2ff6c.1608020391.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5761eb871adde5464ba112b89d966568bc2ff6c.1608020391.git.agx@sigxcpu.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 09:23:38AM +0100, Guido G=FCnther wrote:
> It can take multiple iterations until all components for an attached DSI
> bridge are up leading to several:
> =

> [    3.796425] mxsfb 30320000.lcd-controller: Cannot connect bridge: -517
> [    3.816952] mxsfb 30320000.lcd-controller: [drm:mxsfb_probe [mxsfb]] *=
ERROR* failed to attach bridge: -517
> =

> Silence this by checking for -EPROBE_DEFER and using dev_err_probe() so
> we set a deferred reason in case a dependency fails to probe (which
> quickly happens on small config/DT changes due to the rather long probe
> chain which can include bridges, phys, panels, backights, leds, etc.).
> =

> This also removes the only DRM_DEV_ERROR() usage, the rest of the driver
> uses dev_err().
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> Fixes: c42001e357f7 ("drm: mxsfb: Use drm_panel_bridge")

Queued up for 5.11, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index 6faf17b6408d..6da93551e2e5 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -134,11 +134,8 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_priv=
ate *mxsfb)
>  		return -ENODEV;
>  =

>  	ret =3D drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
> -	if (ret) {
> -		DRM_DEV_ERROR(drm->dev,
> -			      "failed to attach bridge: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
>  =

>  	mxsfb->bridge =3D bridge;
>  =

> @@ -212,7 +209,8 @@ static int mxsfb_load(struct drm_device *drm,
>  =

>  	ret =3D mxsfb_attach_bridge(mxsfb);
>  	if (ret) {
> -		dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
>  		goto err_vblank;
>  	}
>  =

> -- =

> 2.29.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
