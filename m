Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D642C2D8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D766EA03;
	Wed, 13 Oct 2021 14:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9769A6EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:21:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t2so8977757wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KGV5+XgnGGbgyKsBWGvZeJz+/eWLXpcVDfX0Eq6feqQ=;
 b=CDVxwOlatCqAQJ8IC7a7zwRg9FBupYDWMsfWNq6dSGIGWx8SOFh/5Oatw+InCNkBUz
 c81RlmRhS9qtZoUZcmEsSMPAdlgsuta7BhGZ7UsryDpPe5MAUMCPAKQmoXkCXin7aSEQ
 csk1THJ9vzr7MQlqGmrxP6ZpOIYWcJmMrX1o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KGV5+XgnGGbgyKsBWGvZeJz+/eWLXpcVDfX0Eq6feqQ=;
 b=hYDILnWnmdZ12ZuwxDMnNAInoAWpPGb53Vv2Y/9eQwcWV2y0v95WmCxOed0O/wlwNA
 yWNzHw8upL19GeSjOMjEA7J785EuysGh/nNxJ1cukBtRnv80u/0lvVAmMerXQHrVJIZf
 3mqFTVQCG0OZph7DzTZ5x+d6jD//sK4B5RwH1ioN700tvzUEFiD9BCtdwS+Vruf7YVLW
 p4txdOtyJZ+1Byc9Ffp8oWDAk/g8M/TZPEaiqLOtVenF9AR0vbkkOBMGzMR8S4Ns+qOz
 uGVbWOpcPy587qqlOey0DzWzFsTnmSODUe4K9RoeWOQLcp7zBpbMJ4pm6CY829xibnRv
 2qvQ==
X-Gm-Message-State: AOAM532ERYAaFVHOBtZNgYJh9stOGA0qRuC/F9/+IB+079fVbu6B0ddD
 lZafplz/07sBJzN9O5xozjWRLA==
X-Google-Smtp-Source: ABdhPJxMaiINoMOB6u6wWQi7pvYuDM8TL3L0oupZrIcFiKmpMteTsfoTnacdbIv/SDv8AHoif0NupA==
X-Received: by 2002:a1c:21d7:: with SMTP id
 h206mr13058751wmh.163.1634134898166; 
 Wed, 13 Oct 2021 07:21:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm7119388wrw.55.2021.10.13.07.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:21:37 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:21:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 23/28] drm: use new iterator in
 drm_gem_fence_array_add_implicit v3
Message-ID: <YWbrb7xQfTWU15U1@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-24-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-24-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 01:37:37PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> v2: add missing rcu_read_lock()/unlock()
> v3: switch to locked version
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Please make sure you also apply this to the new copy of this code in
drm/sched. This one here is up for deletion, once I get all the driver
conversions I have landed ...
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 09c820045859..4dcdec6487bb 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>  				     struct drm_gem_object *obj,
>  				     bool write)
>  {
> -	int ret;
> -	struct dma_fence **fences;
> -	unsigned int i, fence_count;
> -
> -	if (!write) {
> -		struct dma_fence *fence =
> -			dma_resv_get_excl_unlocked(obj->resv);
> -
> -		return drm_gem_fence_array_add(fence_array, fence);
> -	}
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	int ret = 0;
>  
> -	ret = dma_resv_get_fences(obj->resv, NULL,
> -						&fence_count, &fences);
> -	if (ret || !fence_count)
> -		return ret;
> -
> -	for (i = 0; i < fence_count; i++) {
> -		ret = drm_gem_fence_array_add(fence_array, fences[i]);
> +	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> +		ret = drm_gem_fence_array_add(fence_array, fence);
>  		if (ret)
>  			break;
>  	}
> -
> -	for (; i < fence_count; i++)
> -		dma_fence_put(fences[i]);
> -	kfree(fences);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
