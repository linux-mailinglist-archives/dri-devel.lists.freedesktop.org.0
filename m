Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D64360E8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 14:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B2F6EC48;
	Thu, 21 Oct 2021 12:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5246B6EC48
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 12:00:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v17so652463wrv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 05:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O/myxfNZE6l6JAF1b6VRwM7QSCEWO8BFwzyy5ZEURFo=;
 b=ipS4vzmLWORnQTtt6ZY8HazeLJKym84DkBKkhffTB+wfhUWXvJcKYDjsetYBcYNb+H
 OeKetbvYOaAFFgc6/htufKKzLbMwiG313FHGoklBoPYeKu+2grXADR/TJ+A+rd0CrmCH
 umaOcTUeyBLWbAPiihVEHEZy5C4UWFkamhjKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O/myxfNZE6l6JAF1b6VRwM7QSCEWO8BFwzyy5ZEURFo=;
 b=V1F9tUBmpqlojsOU2CdsW5IXDowWqJihsQnqrSVOpAhx8CRUQHtqf5KOpCf+D93rLh
 ikdtrjIvGv12GxCeKpd4/09ciWYW+cDYkBAs2pGVlTncC3m+uKhydWuq63ZWBu1DZ7yZ
 y7WAFCbEsAEmGTCtHlvj8NpzAbiHAh50iERUlO701U9TAKic6GbXjaeNouyPJHxAq8jg
 ja+mPGMg6qEihG8Ye4ZI0sLoZ8bCY0cHZxPE0xEfPEgGGL1yPOYe5sE06uUPawGFwem4
 c08KBH2Kn9inDGk9MLF+vd9QQ4s/emnHjQvgKJK8kyIndcsmHM5Q/C+/vxVFjYo8HC8u
 u1sw==
X-Gm-Message-State: AOAM533URbxwQxdxuzeocpplMUvSn+Ca1OuK59jAxOZ9TA7SpwD0VQIc
 UjRpr7ve5Bs+9RL30oWUax6Smg==
X-Google-Smtp-Source: ABdhPJxooanE2OI4m6OKfJuO4mxdokhfjdqBzrsGEPsV110bkOO7wG65og3H0iLFZaDD0R/0xvuEXg==
X-Received: by 2002:adf:f812:: with SMTP id s18mr6508576wrp.347.1634817636906; 
 Thu, 21 Oct 2021 05:00:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r128sm8099363wma.44.2021.10.21.05.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 05:00:36 -0700 (PDT)
Date: Thu, 21 Oct 2021 14:00:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: dri-devel@lists.freedesktop.org, kaleshsingh@google.com,
 daniel@ffwll.ch, rostedt@goodmis.org
Subject: Re: [RFC PATCH 0/8] GPU memory tracepoints
Message-ID: <YXFWYlC2nr4scxtz@phenom.ffwll.local>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
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

On Wed, Oct 20, 2021 at 08:10:19PM -0700, Gurchetan Singh wrote:
> This is latest iteration of GPU memory tracepoints [1].
> 
> In the past, there were questions about the "big picture" of memory  
> accounting [2], especially given related work on dma-buf heaps and DRM
> cgroups [3].  Also, there was a desire for a non-driver specific solution.
> 
> The great news is the dma-buf heaps work as recently landed [4].  It uses
> sys-fs and the plan is to use it in conjunction with the tracepoint
> solution [5].  We're aiming for the GPU tracepoint to calculate totals
> per DRM-instance (a proxy for per-process on Android) and per-DRM device.
> 
> The cgroups work looks terrific too and hopefully we can deduplicate code once
> that's merged.  Though that's abit of an implementation detail, so long as
> the "GPU tracepoints" +  "dma-buf heap stats" plan sounds good for Android.

Can we please start out with depulicated code, and integrate this with
cgroups?

The problem with gpu memory account is that everyone wants their own
thing, they're all slightly differently, and all supported by a different
subset of drivers. That doesn't make sense to support in upstream at all.

Please huddle together so that there's one set of "track gpu memory"
calls, and that does cgroups, tracepoints and everything else that an OS
might want to have.

Also ideally this thing works for both integrated soc gpu (including an
answer for special memory pools like cma) _and_ discrete gpus using ttm.
Or at least has an answer to both, because again if we end up with totally
different tracking for the soc vs the discrete gpu world, we've lost.
-Daniel

> 
> This series modifies the GPU memory tracepoint API in a non-breaking fashion
> (patch 1), and adds accounting via the GEM subsystem (patches 2 --> 7). Given
> the multiple places where memory events happen, there's a bunch trace events
> scattered in various places.  The hardest part is allocation, where each driver
> has their own API.  If there's a better way, do say so.
> 
> The last patch is incomplete; we would like general feedback before proceeding
> further.
> 
> [1] https://lore.kernel.org/lkml/20200302235044.59163-1-zzyiwei@google.com/
> [2] https://lists.freedesktop.org/archives/dri-devel/2021-January/295120.html
> [3] https://www.spinics.net/lists/cgroups/msg27867.html
> [4] https://www.spinics.net/lists/linux-doc/msg97788.html
> [5] https://source.android.com/devices/graphics/implement-dma-buf-gpu-mem
> 
> Gurchetan Singh (8):
>   tracing/gpu: modify gpu_mem_total
>   drm: add new tracepoint fields to drm_device and drm_file
>   drm: add helper functions for gpu_mem_total and gpu_mem_instance
>   drm: start using drm_gem_trace_gpu_mem_total
>   drm: start using drm_gem_trace_gpu_mem_instance
>   drm: track real and fake imports in drm_prime_member
>   drm: trace memory import per DRM file
>   drm: trace memory import per DRM device
> 
>  drivers/gpu/drm/Kconfig        |  1 +
>  drivers/gpu/drm/drm_gem.c      | 65 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/drm_internal.h |  4 +--
>  drivers/gpu/drm/drm_prime.c    | 22 +++++++++---
>  include/drm/drm_device.h       | 16 +++++++++
>  include/drm/drm_file.h         | 16 +++++++++
>  include/drm/drm_gem.h          |  7 ++++
>  include/trace/events/gpu_mem.h | 61 +++++++++++++++++++++----------
>  8 files changed, 166 insertions(+), 26 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
