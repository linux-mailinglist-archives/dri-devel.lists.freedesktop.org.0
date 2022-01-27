Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356849ED44
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 22:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E7810E16F;
	Thu, 27 Jan 2022 21:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7058710E16F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 21:13:38 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 o16-20020a17090aac1000b001b62f629953so1406079pjq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ttcznpmjNvZVZe6O6wtlR333FpEjIJT83FNFWegcMUc=;
 b=fnxEJ9l1xhuurPcrEdm2RtQ33HjR55zaif5WOS20vyx5d4EBgS14mRrlD4mJLfiLBp
 4BOGeU/mu3ZWrNF2owQjzUFwGqIJqLBZNWGfoQ8Aq0MNS6BJZP6vS4zSz2AYZ5bfuU+C
 exJxs/64Gc7XuZyVent8VsheKyRyp+r04Mt6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ttcznpmjNvZVZe6O6wtlR333FpEjIJT83FNFWegcMUc=;
 b=pqXytTH0X1a0tPGIPhhrScYgBiV34nFCyifYygSv04n8cX5uvGXQqnVvpveFW95cxi
 nCqs56ulUgApYfN/qEgB8rDwvMbWkOOY5NSVpRLED4MWFQIf9W0YO5Y58/ledxwOHj3R
 yi0jOMBWFfCyPKRjfSsdGAuUXFCbMPM6dpfKQlIq8dWGntKCm8QYJFnT1pBR0sYWn/4I
 sqpyqUE0BUOQJZAcplYL7A1pVtSJFTSRJzzfXon0YO9imnjIDSEUKceARvGlyExBCAku
 VPHeZF20FlooCS/Wni7ISHLZptdXGGoo5KtBGcM9fioJU2ZYo+wBPzQ/8ay2ex7qjMBQ
 Cz0Q==
X-Gm-Message-State: AOAM530Kh+A9oNmRIsiz/NnjCe43a6ij26848dgGxI//qkFXeuYSB2tE
 hxQcJmL6v2Gb03+2wTM2Gwm8Sw==
X-Google-Smtp-Source: ABdhPJyytDnSXIvbMyECjoVId3KSVIR9kQrbhsXzWFHR8Nqj+U802h7/RgfYeV95PZ9PkHxr74kZWw==
X-Received: by 2002:a17:902:8c81:: with SMTP id
 t1mr5265594plo.16.1643318017955; 
 Thu, 27 Jan 2022 13:13:37 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m21sm6853917pfk.26.2022.01.27.13.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 13:13:37 -0800 (PST)
Date: Thu, 27 Jan 2022 13:13:36 -0800
From: Kees Cook <keescook@chromium.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH] drm/kmb: Fix for build errors with Warray-bounds
Message-ID: <202201271312.85B63F9@keescook>
References: <20220127194227.2213608-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127194227.2213608-1-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 sfr@canb.auug.org.au
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 11:42:27AM -0800, Anitha Chrisanthus wrote:
> This fixes the following build error
> 
> drivers/gpu/drm/kmb/kmb_plane.c: In function 'kmb_plane_atomic_disable':
> drivers/gpu/drm/kmb/kmb_plane.c:165:34: error: array subscript 3 is
> above array bounds of 'struct layer_status[2]' [-Werror=array-bounds]
>   165 |                 kmb->plane_status[plane_id].ctrl =
>   LCD_CTRL_GL2_ENABLE;
>   |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
>   In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
>   drivers/gpu/drm/kmb/kmb_drv.h:61:41: note: while referencing
>   'plane_status'
>   61 |         struct layer_status
>   plane_status[KMB_MAX_PLANES];

This would be better without the line wrapping (to match the actual
output), but otherwise:

Reviewed-by: Kees Cook <keescook@chromium.org>

>   |                                         ^~~~~~~~~~~~
>   drivers/gpu/drm/kmb/kmb_plane.c:162:34: error: array
>   subscript 2 is above array bounds of 'struct
>   layer_status[2]' [-Werror=array-bounds]
>   162 |
>   kmb->plane_status[plane_id].ctrl =
>   LCD_CTRL_GL1_ENABLE;
>   |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
>   In file included from
>   drivers/gpu/drm/kmb/kmb_plane.c:17:
>   drivers/gpu/drm/kmb/kmb_drv.h:61:41: note:
>   while referencing 'plane_status'
>   61 |         struct layer_status
>   plane_status[KMB_MAX_PLANES];
>   |
>   ^~~~~~~~~~~~
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_plane.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
> index 00404ba4126d..2735b8eb3537 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -158,12 +158,6 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
>  	case LAYER_1:
>  		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
>  		break;
> -	case LAYER_2:
> -		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
> -		break;
> -	case LAYER_3:
> -		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
> -		break;
>  	}
>  
>  	kmb->plane_status[plane_id].disable = true;
> -- 
> 2.25.1
> 

-- 
Kees Cook
