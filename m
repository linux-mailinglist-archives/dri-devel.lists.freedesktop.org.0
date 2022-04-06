Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03E04F5DE9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47910E3FC;
	Wed,  6 Apr 2022 12:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B712410ED8C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:42:53 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r10so2484499eda.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ovHH/C0HWoBwSlByLGNUEbymQevCRcIpFe3qwN0NyEs=;
 b=YOmOVdl6HOfXMI0bzpFvynjT2MzGQARctFxLLHG0ON+dG0HMkgsVL4q2vxqhkeX2xn
 MpchKhp2KAoRfCwTyhXF78gbvN07oZmBHhV7rGNZJD1c5rG3Xe+OazBeYp+GNSJT0l+k
 xYc+Cw65jDib+rd3PDBrPJejH7VS+EG+3m72U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ovHH/C0HWoBwSlByLGNUEbymQevCRcIpFe3qwN0NyEs=;
 b=IPIVfGu7uH1Btn4iEp+YOZ2jKt8jTkcpkw7EvnEme3uGUUIM4VtO3oryhI7ORx8uQ+
 bXP0N9klvBIQtz7jSzPzHH05aH85MqYR2jHsLnqg1856GP8xUJVPGQkXEE/XePrMuYgp
 97hEHKPnuPeqDPwbX7OlUclUi0sf5bXJFFoHFr+tbtNuVevt7VlmmJrXlwZWnFniycyy
 vAi29/BDi91AiA39gKjmYXF/7qgHaeuQuAD3vy9+kYHp8Dtw4ChxXQUFqTbuBqJS4am9
 SZ1Zr06fR2Zvl+ieMWeyv3lsTnFYhXNO6//jRD1E4AgbhM4U82qr5oa+VPz+YMAIs1kh
 SJvQ==
X-Gm-Message-State: AOAM533JF+DzRD1+S/4UHL563aJm2YNZjCVdL6M9gWJLWO2WSo64WyXj
 gGzFF2ANJQx9GhoA84gfSsEC4A==
X-Google-Smtp-Source: ABdhPJybn315wjhMMT4/cyLyZ1fW6l3ydDjLiOTqqM6dW58BsvsSdIS061DO9S6bie0jXyqaLm6VPQ==
X-Received: by 2002:aa7:dac7:0:b0:41c:c456:3d5c with SMTP id
 x7-20020aa7dac7000000b0041cc4563d5cmr8680509eds.117.1649248972229; 
 Wed, 06 Apr 2022 05:42:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q21-20020aa7d455000000b0041cdebcbfd6sm2573770edr.24.2022.04.06.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:42:51 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:42:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 06/16] drm/amdgpu: use DMA_RESV_USAGE_KERNEL
Message-ID: <Yk2Kyhf7Ah9IkNne@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-7-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-7-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:22AM +0200, Christian König wrote:
> Wait only for kernel fences before kmap or UVD direct submission.
> 
> This also makes sure that we always wait in amdgpu_bo_kmap() even when
> returning a cached pointer.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c    |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index a3cdf8a24377..5832c05ab10d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -761,6 +761,11 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>  	if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
>  		return -EPERM;
>  
> +	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
> +				  false, MAX_SCHEDULE_TIMEOUT);
> +	if (r < 0)
> +		return r;
> +
>  	kptr = amdgpu_bo_kptr(bo);
>  	if (kptr) {
>  		if (ptr)
> @@ -768,11 +773,6 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>  		return 0;
>  	}
>  
> -	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
> -				  false, MAX_SCHEDULE_TIMEOUT);
> -	if (r < 0)
> -		return r;
> -
>  	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);

I wonder whether waiting for kernel fences shouldn't be ttm's duty here.
Anyway patch makes some sense to me.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 3654326219e0..6eac649499d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1164,7 +1164,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>  
>  	if (direct) {
>  		r = dma_resv_wait_timeout(bo->tbo.base.resv,
> -					  DMA_RESV_USAGE_WRITE, false,
> +					  DMA_RESV_USAGE_KERNEL, false,
>  					  msecs_to_jiffies(10));
>  		if (r == 0)
>  			r = -ETIMEDOUT;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
