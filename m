Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A136992FE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6867E10ED3E;
	Thu, 16 Feb 2023 11:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A79B10ED3E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:19:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1344054wmo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1676546374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v1NMRRyQOywvaZogCCyi2MW6NDc+I5u1uYK1FhNbOt4=;
 b=EV6W1JzKo2HpIIs2yZqrf+PHUF7A3Ah8PoS+8fqnoGNhhnJhuiMmrqYoSaa4/GG77m
 0kRAhk+rnznmDpm3/Gs87cabpJ4hxKGMeARN9vi2J1IkJye5zGmtmrHCJNlJ8/m4Yrfh
 hZpUxkUuDZbF5NG4AkztCUlgoMj9d/HhRUBEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676546374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1NMRRyQOywvaZogCCyi2MW6NDc+I5u1uYK1FhNbOt4=;
 b=nUzYKDBJQ7Fym6y3jdtsqr890uKWw4bqW3mOiuTnEAHjqRfoFbtMZqPXykaBrKzzAY
 rsjkbsai7hO2HGJQ0VS0uw3VmSiQUVq7clGmG1ZOKCcJNWfMCNq2CMlPO6nz97wJ3gs6
 EWYFb6WKlwE06HQpZYmZiG6nY2vzgE6hy2khJmrYhTNw6gSvvHtrWGnxaPhxFqBqK7ce
 yb1SxGWt/cvth+fkPAzVWc+2kR6W9Sy5ntUXxcdlxjfb8yZJIuWFqPhLnr0fyMgFt2tz
 c+zqAr7Y6bheQAVHz3ygbDgJT/5X9cnY8PWvm0ku6XZga6RqVwIK4tceWCff76bZ/2sa
 j1lg==
X-Gm-Message-State: AO0yUKX34N4FvJeF15TP9ntlujHoUDyAWW9C6FRpCJXI3gQbFy3J3Ers
 Mk9b+KhhPC30JLJ8MXUtrIWKNCQV47lo1CM4
X-Google-Smtp-Source: AK7set/FIlFfDUxs/WDRZvNwTbIH6MjATnYz+1IrtnrRVz02UYgqmpW4bnlcF0hvm++EEwerbhtvWg==
X-Received: by 2002:a05:600c:1d91:b0:3e2:15c2:b8ab with SMTP id
 p17-20020a05600c1d9100b003e215c2b8abmr676215wms.4.1676546373801; 
 Thu, 16 Feb 2023 03:19:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003dc59d6f2f8sm1527610wmb.17.2023.02.16.03.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:19:33 -0800 (PST)
Date: Thu, 16 Feb 2023 12:19:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC v3 0/9] Waitboost drm syncobj waits
Message-ID: <Y+4RPE1pdxJapfKu@phenom.ffwll.local>
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 10:59:12AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In i915 we have this concept of "wait boosting" where we give a priority boost
> for instance to fences which are actively waited upon from userspace. This has
> it's pros and cons and can certainly be discussed at lenght. However fact is
> some workloads really like it.
> 
> Problem is that with the arrival of drm syncobj and a new userspace waiting
> entry point it added, the waitboost mechanism was bypassed. AFAIU this mostly
> happens with all Vulkan based userspaces. Hence I cooked up this mini series to
> see if discussion about restoring the waitboost can be had.
> 
> The series adds a concept of "wait count" to dma fence which is intended to
> represent explicit userspace waits. It is therefore incremented for every
> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> dma_fence_add_callback but from explicit/userspace wait paths). Individual
> drivers can then inspect this via dma_fence_wait_count() and decide to wait
> boost the waits on such fences.
> 
> Patch has been slightly tested for performance impact by Google using some clvk
> workloads and shows a good improvement (frame time improved from 16ms to 13ms).
> 
> It is also important to mention that benefits of waitboosting are not only about
> workloads related to frame presentation time, but also for serialized
> computations which constantly move between the CPU and GPU.

I think this should be integrated with https://lore.kernel.org/all/20210903184806.1680887-1-robdclark@gmail.com/
so that we have one overall approach here that works for all drivers.
Obviously should include support for all interested parties.
-Daniel

> 
> *)
> https://gitlab.freedesktop.org/drm/intel/-/issues/8014
> 
> v2:
>  * Small fixups based on CI feedback:
>     * Handle decrement correctly for already signalled case while adding callback.
>     * Remove i915 assert which was making sure struct i915_request does not grow.
>  * Split out the i915 patch into three separate functional changes.
> 
> v3:
>  * Handle drivers which open-code callback additions.
> 
> Tvrtko Ursulin (9):
>   dma-fence: Move i915 helpers into common
>   dma-fence: Add callback initialization helper
>   drm/i915: Use fence callback initialization helper
>   drm/vmwgfx: Use fence callback initialization helper
>   dma-fence: Track explicit waiters
>   drm/syncobj: Mark syncobj waits as external waiters
>   drm/i915: Waitboost external waits
>   drm/i915: Mark waits as explicit
>   drm/i915: Wait boost requests waited upon by others
> 
>  drivers/dma-buf/dma-fence.c                 | 137 ++++++++++++++------
>  drivers/gpu/drm/drm_syncobj.c               |   6 +-
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c |  22 ----
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c   |   1 -
>  drivers/gpu/drm/i915/i915_active.c          |   2 +-
>  drivers/gpu/drm/i915/i915_active.h          |   2 +-
>  drivers/gpu/drm/i915/i915_request.c         |  13 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c       |   2 +-
>  include/linux/dma-fence.h                   |  26 ++++
>  9 files changed, 141 insertions(+), 70 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
