Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74756188B0D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 17:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64CF6E243;
	Tue, 17 Mar 2020 16:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706E06E243
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 16:48:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z13so38701wml.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OD9FuwDDG0da4KeudVDubOUcHxfWY0Nj0pIiBKsww3w=;
 b=A6+A5ao4lhYXDfjR31CtRR6eRlIG9boSOk0LtFwG9coQIGNl+zHshCpcveFSX+4Gn4
 8d8WOF3x79ojpchRsP7CKK5l91Y4s5WxEDf/cCoElXqCviNyvWdVWcvHxLZZR7NjHInk
 xJ5fiLtz23awk8+C5cF3rJlh0G6NDkSaI7Mxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=OD9FuwDDG0da4KeudVDubOUcHxfWY0Nj0pIiBKsww3w=;
 b=U0V4/I0rqf/fzWqldzOU+pDdJ6x33vH4fAYyrGikyvendzxP2YeA7M/UCr0Au9IO8J
 ylU6XWnnlMaSPkxl/zVdk/jt9sE0kxR6GvxhWqXFYgU2dYT3eWtRESdwdF0biHXH5epd
 gVG7SnQ9N001uRCSbA3sO0pwMZ0l4bMHyKtoBZ2FNPzpc/HEBTi6khEpqCqpQFKgWjrw
 bMS4yZMR4PC95nVau0u82syx756Km/RdwzKgf+dwydtxp0kHOQfkCNXHyOQdrxrQ56Oz
 Nih9Bk1eQ0NuGja6jaMHZx/tNH/q58vUWR5xtXdlfmIheJnGwTWkG3+fg2I/8m2o1ync
 OLpw==
X-Gm-Message-State: ANhLgQ2JxwlFm6bi3oUbUNg+dkHoMFgdi5KLTFMWfaN0NaMfdi3v1EWJ
 8eaDiwxZpeYDAFVJ9zFCz7mVeDySG66rZX19
X-Google-Smtp-Source: ADFU+vsm2JQbBpClsKbjdFmau5rDZaXHJnGmGZ52VylYOGNH7n6jFxhR5zm2VXPCTiOMmVSNFurUQA==
X-Received: by 2002:a05:600c:29cf:: with SMTP id
 s15mr180084wmd.117.1584463689832; 
 Tue, 17 Mar 2020 09:48:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t124sm20732wmg.13.2020.03.17.09.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 09:48:08 -0700 (PDT)
Date: Tue, 17 Mar 2020 17:48:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/3] drm: drm_vm: Use fallthrough;
Message-ID: <20200317164806.GO2363188@phenom.ffwll.local>
Mail-Followup-To: Joe Perches <joe@perches.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1584040050.git.joe@perches.com>
 <398db73cdc8a584fd7f34f5013c04df13ba90f64.1584040050.git.joe@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <398db73cdc8a584fd7f34f5013c04df13ba90f64.1584040050.git.joe@perches.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 12:17:12PM -0700, Joe Perches wrote:
> Convert /* fallthrough */ style comments to fallthrough;
> 
> Convert the various uses of fallthrough comments to fallthrough;
> 
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/
> 
> And by hand:
> 
> This file has a fallthrough comment outside of an #ifdef block
> that causes gcc to emit a warning if converted in-place.
> 
> So move the new fallthrough; inside the containing #ifdef/#endif too.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming this all lands through a special pull? Or should I apply
this?
-Daniel

> ---
>  drivers/gpu/drm/drm_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> index 64619f..fd65c59 100644
> --- a/drivers/gpu/drm/drm_vm.c
> +++ b/drivers/gpu/drm/drm_vm.c
> @@ -595,8 +595,8 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
>  			vma->vm_ops = &drm_vm_ops;
>  			break;
>  		}
> +		fallthrough;	/* to _DRM_FRAME_BUFFER... */
>  #endif
> -		/* fall through - to _DRM_FRAME_BUFFER... */
>  	case _DRM_FRAME_BUFFER:
>  	case _DRM_REGISTERS:
>  		offset = drm_core_get_reg_ofs(dev);
> @@ -621,7 +621,7 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
>  		    vma->vm_end - vma->vm_start, vma->vm_page_prot))
>  			return -EAGAIN;
>  		vma->vm_page_prot = drm_dma_prot(map->type, vma);
> -		/* fall through - to _DRM_SHM */
> +		fallthrough;	/* to _DRM_SHM */
>  	case _DRM_SHM:
>  		vma->vm_ops = &drm_vm_shm_ops;
>  		vma->vm_private_data = (void *)map;
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
