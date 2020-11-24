Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FD2C2A63
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725836E43D;
	Tue, 24 Nov 2020 14:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D8D6E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:49:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 10so2654238wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 06:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E7wW1UNVzMZXQ5oQM/ZhqTTBRfJ7bxXAdv+2boiN/RQ=;
 b=BtmS2C62X+xmrO2iPvkPEXDuNSBqHMcS//zSJ872psX+aoVBAF0SE1wWiuj1HN7VSp
 ugdDIdLNB9zB4YNFhMA7uusFj2dtStFlUZMM++xZUKMnMoj4f1ijzcuYpqL8+PQwCuvc
 busB8oz/awj6DfAlABOcEUYt6/t9LZf4nvP+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E7wW1UNVzMZXQ5oQM/ZhqTTBRfJ7bxXAdv+2boiN/RQ=;
 b=rw/30JOyPkEP3epAz6TT9IJQTnYDx3Dg8VKqFBOqVgyYKbN+F6L97g3tiiG2VoCE0A
 avCcqSpKXXhI12oFMWuRZggQ1GNljps4gryMuARq6k6sGcAD6L7jPKy+n+8jOFFfTclZ
 U7bWZ3/KTo6AXmXekOJCoI9iywQW4LH/vnE/YJ5q0Gz6k6Rt4jpjfxAYzgmehdHxQeRu
 4Rfbkm4yuLWRSah/hVwGL0Jf/68iNWsXa5LLUnuOKQY9P4uaVK1Upnxr3suyY/2CQ9RF
 MndBP6kcobqmOc0lCC+GkX98jhEcocj2Yr1iiLyz2WNGbwfZZu5OyIIuWIj+bsVxpF0q
 Glnw==
X-Gm-Message-State: AOAM530L6UBPArPhtrxZ4WNQ4mYh/2FCkn+CgYgMKPWg2fmO+C6GJm4w
 y8+6wCiD00ceu/iuR4WUe9SfRA==
X-Google-Smtp-Source: ABdhPJwQHzXUETcIye9E/dyfK8rvoGMEmJ6s9krLqRQak9XeA+herJfYpJ27nR79XFpGHEU7++A4uA==
X-Received: by 2002:a1c:e4d4:: with SMTP id b203mr4699716wmh.141.1606229381522; 
 Tue, 24 Nov 2020 06:49:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l3sm6473848wmf.0.2020.11.24.06.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:49:40 -0800 (PST)
Date: Tue, 24 Nov 2020 15:49:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post
 device unplug
Message-ID: <20201124144938.GR401619@phenom.ffwll.local>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-11-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605936082-3099-11-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: gregkh@linuxfoundation.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 21, 2020 at 12:21:20AM -0500, Andrey Grodzovsky wrote:
> Avoids NULL ptr due to kobj->sd being unset on device removal.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index caf828a..812e592 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -27,6 +27,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/reboot.h>
>  #include <linux/syscalls.h>
> +#include <drm/drm_drv.h>
>  
>  #include "amdgpu.h"
>  #include "amdgpu_ras.h"
> @@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struct amdgpu_device *adev)
>  		.attrs = attrs,
>  	};
>  
> -	sysfs_remove_group(&adev->dev->kobj, &group);
> +	if (!drm_dev_is_unplugged(&adev->ddev))
> +		sysfs_remove_group(&adev->dev->kobj, &group);

This looks wrong. sysfs, like any other interface, should be
unconditionally thrown out when we do the drm_dev_unregister. Whether
hotunplugged or not should matter at all. Either this isn't needed at all,
or something is wrong with the ordering here. But definitely fishy.
-Daniel

>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> index 2b7c90b..54331fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -24,6 +24,7 @@
>  #include <linux/firmware.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> +#include <drm/drm_drv.h>
>  
>  #include "amdgpu.h"
>  #include "amdgpu_ucode.h"
> @@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)
>  
>  void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
>  {
> -	sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
> +	if (!drm_dev_is_unplugged(&adev->ddev))
> +		sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
>  }
>  
>  static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
