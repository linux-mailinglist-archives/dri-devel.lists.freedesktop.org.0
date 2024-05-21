Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0338CAE6D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C05010E834;
	Tue, 21 May 2024 12:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Sreore0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DB310E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:38:37 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-354c3a7f972so97504f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716295116; x=1716899916; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/Z8wMDpCRGL6ymc+tphf7A5z76HQxRHJoC5TqayrDUY=;
 b=Sreore0xsGD0PzYQLMmLX7G07d8cSWx/j2fXibxXg9VKeW/Uwb+vsb/K0sen2idSch
 gWd5hh+vyrvo1gey/owCHq0mEck/9X07sgalUJnPCAH7+nJCH43Vc4dXnYVkzffbIwGM
 EQyJybP3ishj3c8os6VSnydC5t3XFgq3c89So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716295116; x=1716899916;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Z8wMDpCRGL6ymc+tphf7A5z76HQxRHJoC5TqayrDUY=;
 b=h7ZziHWwCGGpTemLf14pjmBBq+jnC20m+nkRufyz2fWLBeuuviIx2WPTYkZODaBSC2
 ny5z0/c8MQpn5FV6AQD3nf6YT5/kQMN4Ru/HAQa+IsB+tU0IF6efp8vtAtt+KYgCOKL1
 Nm/EDzFwcTV2T+7ZKHvJBPJUWCVWwb7JMdbaFTft7q/iqAfe+V69zl1VeLdI3Fr3+KiA
 PmyVSVfp1BDP/45BG3b/3576iVkqxE5CViYAaGvaFwixpTvSst9Qz6Kd+6d8kTD9cPVl
 fKxrpC4VX3tqMZYz6UWQz/QPekX1NoDESGEZtf4pvvfSuHMyyGNa9S7MabVeXJQVXMZA
 NDtA==
X-Gm-Message-State: AOJu0Yzal8dw6VZUEGnmF5A5fQ1XTKExyrkSw+k//JrBH/JSnU1ZmRhV
 5XivrDgm+hJ+q4HlEURHM62Q5umbMpsl/EtSPaorHdtpSQdWDrKIjMNEnTFKvVQ=
X-Google-Smtp-Source: AGHT+IFTghMdwTacSsVfy7EO6W3QxK6g6vt6x5SzPCadiSfw8FyInuVxjElraI0YQ0pBe7pld/vWnQ==
X-Received: by 2002:a05:600c:3582:b0:41a:bb50:92bb with SMTP id
 5b1f17b1804b1-41fea539aafmr234868955e9.0.1716295115811; 
 Tue, 21 May 2024 05:38:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee9292sm464641525e9.37.2024.05.21.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 05:38:34 -0700 (PDT)
Date: Tue, 21 May 2024 14:38:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Eric Anholt <eric@anholt.net>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE,
 MAP_PRIVATE)
Message-ID: <ZkyVyLVQn25taxCn@phenom.ffwll.local>
References: <20240520100514.925681-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240520100514.925681-1-jacek.lawrynowicz@linux.intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Mon, May 20, 2024 at 12:05:14PM +0200, Jacek Lawrynowicz wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> Lack of check for copy-on-write (COW) mapping in drm_gem_shmem_mmap
> allows users to call mmap with PROT_WRITE and MAP_PRIVATE flag
> causing a kernel panic due to BUG_ON in vmf_insert_pfn_prot:
> BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
> 
> Return -EINVAL early if COW mapping is detected.
> 
> This bug affects all drm drivers using default shmem helpers.
> It can be reproduced by this simple example:
> void *ptr = mmap(0, size, PROT_WRITE, MAP_PRIVATE, fd, mmap_offset);
> ptr[0] = 0;
> 
> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.2+
> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Excellent catch!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I reviewed the other helpers, and ttm/vram helpers already block this with
the check in ttm_bo_mmap_obj.

But the dma helpers does not, because the remap_pfn_range that underlies
the various dma_mmap* function (at least on most platforms) allows some
limited use of cow. But it makes no sense at all to all that only for
gpu buffer objects backed by specific allocators.

Would you be up for the 2nd patch that also adds this check to
drm_gem_dma_mmap, so that we have a consistent uapi?

I'll go ahead and apply this one to drm-misc-fixes meanwhile.

Thanks, Sima

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 177773bcdbfd..885a62c2e1be 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -611,6 +611,9 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  		return ret;
>  	}
>  
> +	if (is_cow_mapping(vma->vm_flags))
> +		return -EINVAL;
> +
>  	dma_resv_lock(shmem->base.resv, NULL);
>  	ret = drm_gem_shmem_get_pages(shmem);
>  	dma_resv_unlock(shmem->base.resv);
> -- 
> 2.45.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
