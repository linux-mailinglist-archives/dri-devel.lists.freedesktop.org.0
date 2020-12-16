Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C362DC20F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D106E1BA;
	Wed, 16 Dec 2020 14:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3556E1BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:23:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r7so23360899wrc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qrsao+nujeBamJmHLTsU5WvEaqvxN1flt/+dTlLBAsU=;
 b=NMnIvWE2K9sytfsXtxLp3TVQUBlpcn5QPdMhls1Gdn0p7rAfZhpApRrKBPGfp+uLwX
 PdckzWwrj9mAynQn+lcZTD02ZOWkeUWEQ/F5agKvI4WG1HR733yzrvgYcyG3BthXNCbj
 jOaYik+y1sOOxT++GiuD+xfj0z314sejg+n1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qrsao+nujeBamJmHLTsU5WvEaqvxN1flt/+dTlLBAsU=;
 b=JAfFASIm+HPZYG7hhp+H4+eVCdnhsJGcQd0Vy7xA/RDoUwyTI5VDreiBzkSEwpngQZ
 +9MHXM4yp7IC2oJ5/+29PtY6ZV8MQ/JGHoyZClrn1wB1gZHvYnTslnkAcUplBOtlI7/1
 M4zMPAs0ISSz+oXeTzjjsBKNEvuOioo6pdN732YLMehXkezjdCLglBqz+yUBbBLk4KUg
 DOyS685B1CEEMAE3VfOGJ8fMtExitth0DBwGu04DDa8ZVmffYrdGx5C3L6/zusXEiJmW
 TmUlVnIpWPzRHAj9yASf0/2WaiNIB3QvCsghPSs6SqPOJUCvj8mdv53KaRZmUzuff4vR
 8GEw==
X-Gm-Message-State: AOAM533r3b2A9Z9eqkaXLPigN/BpMjGfBxL+M7GieszvnqyNdt7M6H+L
 dkgH/2zz38IG4sS/o6X2MbIjcA==
X-Google-Smtp-Source: ABdhPJy+JczXcpjpG4mPKUvI6U0V5LFT/nmNb5Kh5FM7HlemTtwtHhFJedA+4OCT1QjO/sVoNtQ+Jg==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr38962868wrl.406.1608128581850; 
 Wed, 16 Dec 2020 06:23:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a14sm3396939wrn.3.2020.12.16.06.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:23:01 -0800 (PST)
Date: Wed, 16 Dec 2020 15:22:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 4/4] drm: zte: Remove unnecessary drm_plane_cleanup()
 wrapper
Message-ID: <X9oYQ/hLVh2MCwJY@phenom.ffwll.local>
References: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201215193755.26160-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215193755.26160-4-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 09:37:55PM +0200, Laurent Pinchart wrote:
> Use the drm_plane_cleanup() function directly as the drm_plane_funcs
> .destroy() handler without creating an unnecessary wrapper around it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming you'll apply this somewhere.
-Daniel

> ---
>  drivers/gpu/drm/zte/zx_plane.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
> index c8f7b21fa09e..78d787afe594 100644
> --- a/drivers/gpu/drm/zte/zx_plane.c
> +++ b/drivers/gpu/drm/zte/zx_plane.c
> @@ -438,15 +438,10 @@ static const struct drm_plane_helper_funcs zx_gl_plane_helper_funcs = {
>  	.atomic_disable = zx_plane_atomic_disable,
>  };
>  
> -static void zx_plane_destroy(struct drm_plane *plane)
> -{
> -	drm_plane_cleanup(plane);
> -}
> -
>  static const struct drm_plane_funcs zx_plane_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = zx_plane_destroy,
> +	.destroy = drm_plane_cleanup,
>  	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
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
