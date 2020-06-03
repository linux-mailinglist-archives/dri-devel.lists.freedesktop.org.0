Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B31ECB4E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 10:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8154F89CAC;
	Wed,  3 Jun 2020 08:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6889CAC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 08:20:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f5so1029553wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 01:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qqSfUcuYSimpv1pY0MOtTK6ENtmyLiNpO2CHDsrQJPg=;
 b=W4XwgRX78yTs21VYw37XJaiPJr+ds6tBEvPHhONZEkyXI3FHz1REEfj9atvbamSSE5
 gDOFQmZtCXGec41Zr6Jy7qVo4YToOF5gA+if0yhcx+DOeEcIJI5fMyZVSRHn9wNWbkgX
 FBCxHRmu0n6P6HisaE8TsbipDj2jgkTYMoWkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qqSfUcuYSimpv1pY0MOtTK6ENtmyLiNpO2CHDsrQJPg=;
 b=aJJ743Z0aCFCz2DEvG885H2w1wRjXli2wmTixEHLmgDhMCTAh26EWTejTTQXOpDkIv
 FO4m0DHQniJCVWcsDx1SK9M7xsC0eZ2PBbPyyhvAXvgiyoVxtwUTTL0jqgnpViR7KtBb
 Svk3IM47cPO3JpWxfTM4D2U7mcHf38+THR+6nATRNb4DRRZeopACPZpn5eqYIj1hWYQM
 fGWvuthyzErSXJpQFe5K16fh6PyV9ObZHFtrGhd8im+GAO571AlDJfueWG9FCtmg8b3R
 3lZW7GEl1Sll0E2q8d4n+NNgaU70NI6cosJkQgYadcW478yb0RKGRx2XiCgO4fiouMAB
 kRBw==
X-Gm-Message-State: AOAM531BAdJwx+8smp1CTn4SGRV7raB7RDR2JhV3S8m4UR9KcvQyPUfd
 pARxdLKwn7T8iOlL1WeiwtHs2PYJVlI=
X-Google-Smtp-Source: ABdhPJyAok+p0tloM34wEtx6jTzyd+T5gsn4sUs6+bam35QnC0kVmQVGklro2bV4AsjCa4K/3DZ3iA==
X-Received: by 2002:a1c:7dd5:: with SMTP id y204mr7131250wmc.182.1591172432314; 
 Wed, 03 Jun 2020 01:20:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e5sm2255451wrw.19.2020.06.03.01.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 01:20:31 -0700 (PDT)
Date: Wed, 3 Jun 2020 10:20:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: simple: Set connector type for DSI panels
Message-ID: <20200603082030.GH20149@phenom.ffwll.local>
References: <20200602171240.2785-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602171240.2785-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 08:12:40PM +0300, Laurent Pinchart wrote:
> None of the DSI panels set the connector_type in their panel_desc
> descriptor. As they are all guaranteed to be DSI panels, that's an easy
> fix, set the connector type to DRM_MODE_CONNECTOR_DSI.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b6ecd1552132..b86b52bfece7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4082,6 +4082,7 @@ static const struct panel_desc_dsi auo_b080uan01 = {
>  			.width = 108,
>  			.height = 272,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4110,6 +4111,7 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
>  			.width = 107,
>  			.height = 172,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO |
>  		 MIPI_DSI_MODE_VIDEO_BURST |
> @@ -4140,6 +4142,7 @@ static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
>  			.width = 94,
>  			.height = 151,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4168,6 +4171,7 @@ static const struct panel_desc_dsi lg_lh500wx1_sd03 = {
>  			.width = 62,
>  			.height = 110,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4196,6 +4200,7 @@ static const struct panel_desc_dsi panasonic_vvx10f004b00 = {
>  			.width = 217,
>  			.height = 136,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>  		 MIPI_DSI_CLOCK_NON_CONTINUOUS,
> @@ -4225,6 +4230,7 @@ static const struct panel_desc_dsi lg_acx467akm_7 = {
>  			.width = 62,
>  			.height = 110,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = 0,
>  	.format = MIPI_DSI_FMT_RGB888,
> @@ -4254,6 +4260,7 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
>  			.width = 217,
>  			.height = 136,
>  		},
> +		.connector_type = DRM_MODE_CONNECTOR_DSI,
>  	},
>  	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>  		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
