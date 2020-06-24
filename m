Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8B206D91
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 09:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220C56EA7D;
	Wed, 24 Jun 2020 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8946EA7D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 07:25:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r12so1153716wrj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 00:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=59LdoHCMUE99a5VBVhHttZqJdAjYmBAszvOnaO6uxUc=;
 b=h5QTW6Wp1t7lOC6edzPr/1HV5Yt7vxI2e6KtCp5rxbAqbcYb1PMtX1j2MoTbpvxXKf
 oryGzpP9RgkplwQ56fsP14JtCKPV+MQXPKtiluIBqbQ6NS/OEQvGs1Vyp29Z84F1XhLn
 UuUAfzB6w0z4JAXx/LMK3ykNNZ/ntExAAqBSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=59LdoHCMUE99a5VBVhHttZqJdAjYmBAszvOnaO6uxUc=;
 b=nBQfo5lGjLfZADDMJc2PS0Q5vtFpN/xB2kpyMIeLrobYmbASEh7GVdNGr7CpUKXRp0
 2j9MeW/H0kEDMafrFt6cD6tjA4TSq8py7sA/cnRfE/RoozVDB3+btndJ98loOx+GfCne
 V1FJM4/GrmwDekkzaDnn8o9TE1+yiEGKvHci1hXXdzWKpL39JpsA+xRCEtyIKEs1CX/D
 uEdnlwJDsnnnGnh2gQtwl8uzJ7rX9D/xNOymv7Q5EZaWjABTDK4NIjji8S5a8hFjABvZ
 K/HmFZoVDyJWXdjvAscdlglJ5C/EG8VS2bn14lqZtmMuYeywXqIVMAmZ+ybRGoGfjyiA
 Vxzg==
X-Gm-Message-State: AOAM533b4qj5NDLiRWT+mBqDoEmQ0xDlQaFQ5ZMJ9RAKA9IrphAqpHgm
 X+gBi1jAZkNw90tk+ry7pPXO3ObgMew=
X-Google-Smtp-Source: ABdhPJwk5Ro7IJexQpMzboOlp8iEf2aJfM+12bWlMWIZNQf0/dNyRGAp+3rrz/1ODEs4xG9kyADLVw==
X-Received: by 2002:adf:b6a4:: with SMTP id j36mr2009109wre.260.1592983533906; 
 Wed, 24 Jun 2020 00:25:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a81sm7361041wmd.25.2020.06.24.00.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 00:25:33 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:25:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/8] drm/imx: Use __drm_atomic_helper_crtc_reset
Message-ID: <20200624072531.GU20149@phenom.ffwll.local>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612160056.2082681-3-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 06:00:51PM +0200, Daniel Vetter wrote:
> Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
> which means vblank state isn't ill-defined and fail-y at driver load
> before the first modeset on each crtc.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org

Ping for some ack/review on this pls.

Thanks, Daniel

> ---
>  drivers/gpu/drm/imx/ipuv3-crtc.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
> index 63c0284f8b3c..02c2f848f2d1 100644
> --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> @@ -109,20 +109,15 @@ static void imx_drm_crtc_reset(struct drm_crtc *crtc)
>  {
>  	struct imx_crtc_state *state;
>  
> -	if (crtc->state) {
> -		if (crtc->state->mode_blob)
> -			drm_property_blob_put(crtc->state->mode_blob);
> -
> -		state = to_imx_crtc_state(crtc->state);
> -		memset(state, 0, sizeof(*state));
> -	} else {
> -		state = kzalloc(sizeof(*state), GFP_KERNEL);
> -		if (!state)
> -			return;
> -		crtc->state = &state->base;
> -	}
> +	if (crtc->state)
> +		__drm_atomic_helper_crtc_destroy_state(crtc->state);
>  
> -	state->base.crtc = crtc;
> +	kfree(to_imx_crtc_state(crtc->state));
> +	crtc->state = NULL;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (state)
> +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
>  }
>  
>  static struct drm_crtc_state *imx_drm_crtc_duplicate_state(struct drm_crtc *crtc)
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
