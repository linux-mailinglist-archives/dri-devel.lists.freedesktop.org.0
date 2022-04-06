Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE84F5DEB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C359C10E6FC;
	Wed,  6 Apr 2022 12:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E4A10E6FC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:43:43 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id n6so3925801ejc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DkMzDu6T+x0da8vjG2nfPs3/5TawCvp8ewTe2Jh2QkE=;
 b=O+oHz/4+Ea7vJ66eB9isoEa3TAZwi4sx5JjH/BGi37Q6qV4/gG9zD2aNZJDlQ7n2MW
 Zb3vy3mkXrba4dJxSvxZNkjGNAMp2uVHSslcMFe7DQeDqv7M5EquWKYzKH+a9gPQtdx5
 JDr/9jTbfQoXeIrmggPSzj+/JfCLkyZR7fFJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DkMzDu6T+x0da8vjG2nfPs3/5TawCvp8ewTe2Jh2QkE=;
 b=mGZ78bUwe4zJoFDWAnxx8r7Nl4WFXsRhLriWlsLZjpldciCU4kmwmXiKZihptvambS
 kYNo66TyxRwNj19LWo3D++gc1MYgbG2CM6zEit46QSOn6OEacfHwdTp0wlVEK/lhEryb
 v4cchfaYq0CrKbMv5wn4w2+m20rSL49bnYfLJUjU2LlIHOhXhTf91P/+f0dLUvOt3dvP
 hXLCDi2KrL6VE2x2oWKV+YoQtqhjI92h1Ln+saTTePWBHy+/q+EDkQJ18pIybad/AaiA
 r3eWJjKL9/3nHXA1oRcneHAk8ADxZupLJgyfZNlSm1991Muo0AZc+hNzknqyD52NhYbM
 H0cQ==
X-Gm-Message-State: AOAM531ixoXkwdqLxoyb5Cq0ROqlGEmj99lpj111Nq3nWWb4Ei3VHZqI
 5K2gtn5WSGN+yTqaIC6NrfguAA==
X-Google-Smtp-Source: ABdhPJy3fsy8OkajpJVgcB6GfrQO7t0ixlde0IGVXEraeNwb/p/DFIU8gYzRM/s6XXErlqrcGNGbYQ==
X-Received: by 2002:a17:907:6e04:b0:6e0:736b:d786 with SMTP id
 sd4-20020a1709076e0400b006e0736bd786mr8144237ejc.667.1649249021913; 
 Wed, 06 Apr 2022 05:43:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y27-20020a170906519b00b006dfaf4466ebsm6545403ejk.116.2022.04.06.05.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:43:41 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:43:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 07/16] drm/radeon: use DMA_RESV_USAGE_KERNEL
Message-ID: <Yk2K+wy/WejQTVb0@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-8-christian.koenig@amd.com>
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

On Wed, Apr 06, 2022 at 09:51:23AM +0200, Christian König wrote:
> Always wait for kernel fences before kmap and not only for UVD kmaps.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/radeon_object.c |  7 ++++++-
>  drivers/gpu/drm/radeon/radeon_uvd.c    | 12 ++----------
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index cb5c4aa45cef..6c4a6802ca96 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -219,7 +219,12 @@ int radeon_bo_create(struct radeon_device *rdev,
>  int radeon_bo_kmap(struct radeon_bo *bo, void **ptr)
>  {
>  	bool is_iomem;
> -	int r;
> +	long r;
> +
> +	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
> +				  false, MAX_SCHEDULE_TIMEOUT);

Maybe another reason why we should push this wait into ttm kmap helpers?

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +	if (r < 0)
> +		return r;
>  
>  	if (bo->kptr) {
>  		if (ptr) {
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index a50750740ab0..a2cda184b2b2 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -470,24 +470,16 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>  	int32_t *msg, msg_type, handle;
>  	unsigned img_size = 0;
>  	void *ptr;
> -	long r;
> -	int i;
> +	int i, r;
>  
>  	if (offset & 0x3F) {
>  		DRM_ERROR("UVD messages must be 64 byte aligned!\n");
>  		return -EINVAL;
>  	}
>  
> -	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
> -				  false, MAX_SCHEDULE_TIMEOUT);
> -	if (r <= 0) {
> -		DRM_ERROR("Failed waiting for UVD message (%ld)!\n", r);
> -		return r ? r : -ETIME;
> -	}
> -
>  	r = radeon_bo_kmap(bo, &ptr);
>  	if (r) {
> -		DRM_ERROR("Failed mapping the UVD message (%ld)!\n", r);
> +		DRM_ERROR("Failed mapping the UVD message (%d)!\n", r);
>  		return r;
>  	}
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
