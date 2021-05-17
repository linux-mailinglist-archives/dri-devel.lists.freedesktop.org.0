Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF8386B7E
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A776E175;
	Mon, 17 May 2021 20:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126E36E175
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:36:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r12so7802840wrp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oT1kfOKsvB3eKB/ISFtj3GgwhSj6SpZpAhs3W98vSHQ=;
 b=cigLzIjZCzsk3str9RA+LvaYg5qDuYK4bV4zG751sXnbfbLXPo7JG0jGrX5B+oeHSD
 VUTJ1FhtRYnSQkfdvekyXpHAPp5K9WTP1WnKoQwqYEOLX/1h81y3vYsymZ8sIK5+FpmJ
 t4ZHqG1/rvPEFLfhsgz8Dlz8Zzzj/WG+MtGJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oT1kfOKsvB3eKB/ISFtj3GgwhSj6SpZpAhs3W98vSHQ=;
 b=ngJVsqo17wy+23gjCwBLkSfzBxIQhpZXS4kIRMc1KptRFUXoI9GYVBSsXQ+FX8b/m8
 VnKrUpMRYUNok6DfKyrghuxEKVuIJXBgAwAe0DT8/d/Kcw89EGq+/54OvIOxtEDoJ4Qk
 CyC+wV2g4Q9ji3igzmCY1I8GxmuNSRrzKclLxpp6+01GYCKoIvKI8Nh2htlUvVRSU1lg
 D8zo0nA3v8/mucn8IxQTfCpstNjEPD718jiC3y2jOI2SLxPxtnoRLt4Eig6vVh+1/TL6
 Lhl/0KZe6yDn3l+P6SehLf9O2Y9uFQlYyudfKWOGHcOfy/YDXkoNzOHFYB/QIyl93a3G
 deNg==
X-Gm-Message-State: AOAM532a20wFp+zQWjIpxb8NColPccWZEbc7f1Pm/18IcDbspQivciBX
 IZ/+JB5p3rsUopc+IVkcQB8MhMu/qUQvLw==
X-Google-Smtp-Source: ABdhPJwfJaR6KRK5ct+Ys2UmzHOgpFgn5mw/saiMD8v2rH8oK3eVm9SpzLl799wQWfRSdgjXyON5SQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr1797059wrv.354.1621283816448; 
 Mon, 17 May 2021 13:36:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 6sm17840361wry.60.2021.05.17.13.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:36:55 -0700 (PDT)
Date: Mon, 17 May 2021 22:36:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 09/11] dma-buf: add shared fence usage flags
Message-ID: <YKLT5WO+7dKUVhyP@phenom.ffwll.local>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <20210517141129.2225-10-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210517141129.2225-10-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 04:11:27PM +0200, Christian König wrote:
> Add usage flags for shared fences and improve the documentation.
> 
> This allows driver to better specify what shared fences
> are doing with the resource.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 16b869d9b1d6..c9bbc4630afc 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -700,7 +700,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  		return ret;
>  	}
>  
> -	dma_resv_add_shared_fence(bo->base.resv, fence);
> +	dma_resv_add_shared(bo->base.resv, fence, DMA_RESV_USAGE_RW);

Entirely aside, but I ended up scratching my head a lot for why exactly
this here is a shared fence, and why that's ok. Since just looking at this
it seems like waiting for the memory allocation to actually be owned by
this driver is optional.

Is this ok because the next thing we'll do is a move, which will then set
the exclusive fence here. Which will then wait on the shared one here, so
it doesn't matter? Or well, allows us to pipeline the eviction of ttm_man
against whatever might be currently keeping the bo busy in it's current
place?

Might be good candidate to explain this in a comment or something like
that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
