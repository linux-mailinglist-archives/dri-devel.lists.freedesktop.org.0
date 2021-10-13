Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE38842C74B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756DB6E0DE;
	Wed, 13 Oct 2021 17:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FAE6E0DE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 17:08:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v17so10611240wrv.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3nI5U0ZpLaIjy8FhD+C/CcSbZEO6CXA5UznElWCfT/Q=;
 b=fFxzt8rxdiwciz6Erno48JPj3dipZWFDn8C4T16UK43q/Hut1cfrtSmR348qD95b2W
 YLs7yblfF8q9ywbStc8KW4rQ81A608Zmar6EGgalJr5XhdaBm2Vg7vUhX8boDD9kSMw3
 On8H51pRNU11UmGWv08tK+5o4wKKFf4/SEiYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3nI5U0ZpLaIjy8FhD+C/CcSbZEO6CXA5UznElWCfT/Q=;
 b=0OcoUh3XZENtC8cUixHxo/O/E+H6UnGHMfG9yNE9J/hx2UGqxWqV5X4yxXxsFNozZ8
 v6p5wUF0KARE7hLmgL7GdKxzYlVFnKeDdh1svcijHE/isOtLmvO1/MMHM7dJZ0mG7h3K
 RgSnScypimMHShNz2LbM8EvEc5HcIKRSCK2Bj5dsNW+rKO3MwWmZTS/OziwZjUvVsRk9
 aHbYGY5GTSnv5kIHIgsVE5JeZrgSvruBZ0FWhNkTE0hZf3bOZ08YqdlPAmlMixBShNIn
 7obDeVXwVpvZCuUpXYkEwHvKWGjKtujPNSsMfbcSageUY/W7vH68JC9/MTmpA+ibRf3r
 qncg==
X-Gm-Message-State: AOAM532CtcET5Dt6jbJlbl9fETH0B+56P58mkC1X9cJC6SytH+E0wAsQ
 65J9usPbH6+b7kozZlJSeplnIg==
X-Google-Smtp-Source: ABdhPJxIE8picqCj8GJeJWovIGO6l4qJyVFiL9sSOtrZJ8kssUMRKwzHoF8LmRxV75zI0t4HQ+ZMtw==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr13202172wmq.149.1634144925827; 
 Wed, 13 Oct 2021 10:08:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a16sm167367wrp.14.2021.10.13.10.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:08:45 -0700 (PDT)
Date: Wed, 13 Oct 2021 19:08:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/cma-helper: Set VM_DONTEXPAND for mmap
Message-ID: <YWcSm6szGFdnAvOe@phenom.ffwll.local>
Mail-Followup-To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
References: <20211013143654.39031-1-alyssa@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013143654.39031-1-alyssa@rosenzweig.io>
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

On Wed, Oct 13, 2021 at 10:36:54AM -0400, Alyssa Rosenzweig wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> drm_gem_cma_mmap() cannot assume every implementation of dma_mmap_wc()
> will end up calling remap_pfn_range() (which happens to set the relevant
> vma flag, among others), so in order to make sure expectations around
> VM_DONTEXPAND are met, let it explicitly set the flag like most other
> GEM mmap implementations do.
> 
> This avoids repeated warnings on a small minority of systems where the
> display is behind an IOMMU, and has a simple driver which does not
> override drm_gem_cma_default_funcs. Arm hdlcd is an in-tree affected
> driver. Out-of-tree, the Apple DCP driver is affected; this fix is
> required for DCP to be mainlined.

How/where does this warn? Also there should be a lot more drivers than
just these two which have an iommu for the display block, so this not
working is definitely a more wide-spread issue.
-Daniel

> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-and-tested-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index d53388199f34..63e48d98263d 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -510,6 +510,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  	 */
>  	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>  	vma->vm_flags &= ~VM_PFNMAP;
> +	vma->vm_flags |= VM_DONTEXPAND;
>  
>  	cma_obj = to_drm_gem_cma_obj(obj);
>  
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
