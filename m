Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569902B8697
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 22:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BB96E4C4;
	Wed, 18 Nov 2020 21:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72546E4C4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 21:28:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so3574209wrc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HS6nUspWVEnRH3DktJ6lTOTBrBar/ajeOsAdlwxAVfA=;
 b=YKzFgtkkMHlSLwlLC/Mkiiy5BraPDGwk2MuvSz2qMiEPCoLC/nICjiXxmVBQtcMNKR
 YEwOVxtQb5fA4gateHWy9KZG4GX7tF/c+TXVDQ0CRWHYQw/96bO5jk6Nj9kCVJn9qdYt
 ghPCbXx5vR0BY/kZW1Mo8vh77aT9X1lKadhRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HS6nUspWVEnRH3DktJ6lTOTBrBar/ajeOsAdlwxAVfA=;
 b=NWoTfwglFKFoAeVueMfyvgQXVrsEf7aHnDrDgzm6keDJXpSeZBZH6uo+l3HB5bb4h6
 iXrxP7O/wHJItEFAsIaExq8WxgxddSSx8nr/ljfmNzvYKFGtqqY5bIQrfJkR6y5xv87h
 VWAuTXMXjY1gDqTytSVHr60CbAcAsKjrRrqzGNyBxvm72w+71n7MZOlkOnlATMeFTMXG
 gD1+SrDO5DJJG90K4AU596pUm0gSl/uJY1WlAZSZ9q0bA9Pwl7PR1tjxY5QQDWVOBrep
 +i4PBwcKvRLssudQrmE87nMW1o6XuoN2F9A7rQDVQid6YBrA6kUYTMrGkiDMUiH0mGTX
 bvww==
X-Gm-Message-State: AOAM5326m0lWVdK67H3Wb+upNjRGWFDgRO66iCOyr7uot50BkUajNV+L
 jcOU34tzBqaJWJJTFIzjszuwITR6v65E1Q==
X-Google-Smtp-Source: ABdhPJwyxkCdrn5AqiDgzx2c3AYE8913FWq4KNbg5UOleL8BNb0m1507hLivk7jAW0U7Oh+xiLH5Pw==
X-Received: by 2002:adf:e607:: with SMTP id p7mr6648704wrm.93.1605734890452;
 Wed, 18 Nov 2020 13:28:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x2sm29456487wru.44.2020.11.18.13.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:28:09 -0800 (PST)
Date: Wed, 18 Nov 2020 22:28:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/via: fix assignment in if condition
Message-ID: <20201118212807.GA401619@phenom.ffwll.local>
Mail-Followup-To: Bernard Zhao <bernard@vivo.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20201118114021.105502-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118114021.105502-1-bernard@vivo.com>
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
Cc: David Airlie <airlied@linux.ie>, opensource.kernel@vivo.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 03:40:19AM -0800, Bernard Zhao wrote:
> Fix check_patch.pl warning:
> ERROR: do not use assignment in if condition
> +                       if ((HALCYON_HEADER2 == (cmd = *buf)) &&
> 
> ERROR: do not use assignment in if condition
> +                       if (HALCYON_HEADER2 == (cmd = *buf))
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/via/via_verifier.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/via/via_verifier.c b/drivers/gpu/drm/via/via_verifier.c
> index 8d8135f424ef..3d6e3a70f318 100644
> --- a/drivers/gpu/drm/via/via_verifier.c
> +++ b/drivers/gpu/drm/via/via_verifier.c
> @@ -1001,8 +1001,8 @@ via_verify_command_stream(const uint32_t * buf, unsigned int size,
>  			state = via_check_vheader6(&buf, buf_end);
>  			break;
>  		case state_command:
> -			if ((HALCYON_HEADER2 == (cmd = *buf)) &&
> -			    supported_3d)
> +			cmd = *buf;
> +			if ((cmd == HALCYON_HEADER2) && supported_3d)
>  				state = state_header2;
>  			else if ((cmd & HALCYON_HEADER1MASK) == HALCYON_HEADER1)
>  				state = state_header1;
> @@ -1064,7 +1064,8 @@ via_parse_command_stream(struct drm_device *dev, const uint32_t *buf,
>  			state = via_parse_vheader6(dev_priv, &buf, buf_end);
>  			break;
>  		case state_command:
> -			if (HALCYON_HEADER2 == (cmd = *buf))
> +			cmd = *buf;
> +			if (cmd == HALCYON_HEADER2)
>  				state = state_header2;
>  			else if ((cmd & HALCYON_HEADER1MASK) == HALCYON_HEADER1)
>  				state = state_header1;
> -- 
> 2.29.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
