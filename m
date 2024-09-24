Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A55984289
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B71110E69A;
	Tue, 24 Sep 2024 09:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="W+Zovp0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E7810E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:47:29 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so7171212a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727171247; x=1727776047; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YV2iCBRK5Q+X4tUpQBES8HhvtaTUQ8RL4eIdJs5NGkI=;
 b=W+Zovp0q9NWWaPcWK7alHHekrj2+Ke+6kiDWDwq7iRJTpum+XLurv5Vjv30bgZPqIg
 QKpvAXxePtJZt+3iIjp9JtWM1+3Wtb9BI59Jgl/QTBZLZfSkBTrhUMsdYVmf8WriBNs7
 oCvlyuar24n9hsCIxdSjyILGR2KvxFCF0ixe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727171247; x=1727776047;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YV2iCBRK5Q+X4tUpQBES8HhvtaTUQ8RL4eIdJs5NGkI=;
 b=H4ml4Sh6804/744wTOdFN2l6Af8QUctyigenIP5Aa1CaJhskjQk1TLmTdGE8r45Z2p
 sNzqsqWUq35YxLJA65wdC1L+Q9cP9dwksnSD5la+2cagXnC6mPfyMGiunaCW8X9qq76h
 EIx+b3tsU8BihUIvz0mpjH43FdRXNKDGZUfZ369Rueaa3VUd1o5NPWBj6gsAImRiSvSs
 Pg+t4e1i9J6qjIPP0Nuq5UI46rjXTwfuDWFkSrD5w7IxIzvIlrt51bV73wvbFvwadlu8
 AbJghDuojVcXlzi3ixvAF55qlA1rh0VTSPFXUG6D90SIcDSCzsJEGGt9uxe/CgYDWqbR
 PIxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3vySxoKW8rJd9vmRS0b0MeGMC7N8zMtgXpydk0bMMCAu9o4yoHwgmsiXH+NcV6MAU1+jyCh0HgRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWPIdOoNOMCarHHShVGKRh4Wpq8ivwBD3muuA0kB/qbXdMCnun
 l1qxJNq4o5gC3Fje4rwIb8k22I7AGH9RjfLjcNhuwD2/PXIP0LGTNVIbGb7wWPs=
X-Google-Smtp-Source: AGHT+IHuGjBnipnxlF7i7sfrTnTWi6Ouktdr6E7mDHuAcyX6gaKPsL0iC6yc/NvOAcCppmyiX7jjmw==
X-Received: by 2002:a17:907:f193:b0:a7a:9144:e256 with SMTP id
 a640c23a62f3a-a90d4fdfe85mr1437722266b.6.1727171247310; 
 Tue, 24 Sep 2024 02:47:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f46ffsm62565466b.155.2024.09.24.02.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:47:26 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:47:25 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/7] drm/writeback: remove pointless enable_signaling
 implementation
Message-ID: <ZvKKrQQq52yUgx7D@phenom.ffwll.local>
References: <20240911085903.1496-1-christian.koenig@amd.com>
 <20240911085903.1496-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911085903.1496-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Wed, Sep 11, 2024 at 10:58:59AM +0200, Christian König wrote:
> Just returning true here is a no-op, remove the optional callback.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Patches 1-3:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_writeback.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index a031c335bdb9..33a3c98a962d 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -100,15 +100,9 @@ drm_writeback_fence_get_timeline_name(struct dma_fence *fence)
>  	return wb_connector->timeline_name;
>  }
>  
> -static bool drm_writeback_fence_enable_signaling(struct dma_fence *fence)
> -{
> -	return true;
> -}
> -
>  static const struct dma_fence_ops drm_writeback_fence_ops = {
>  	.get_driver_name = drm_writeback_fence_get_driver_name,
>  	.get_timeline_name = drm_writeback_fence_get_timeline_name,
> -	.enable_signaling = drm_writeback_fence_enable_signaling,
>  };
>  
>  static int create_writeback_properties(struct drm_device *dev)
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
