Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595EA361BBE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 10:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B2D6EB30;
	Fri, 16 Apr 2021 08:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2A6E1CD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 08:54:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so13774577wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mhwolVfB4+fwYFGVZVMaMHwj2Wwi06L4O2mU6F6bnZ8=;
 b=BivPCXotv50fVGsBLggSshOV7Z3wjPLpyA//8zGE1bIfu2TEeQfIiZPAkBJIu/124l
 E+utNiwsDBLnc69GbWdcCf8QCVl1w533///ZAUOCZ73U6BMAGeqJlQznSh0Sge2ZFGac
 K6PUu584M0gd6HuOh+BLXNpvxhzxdjl1PwPqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mhwolVfB4+fwYFGVZVMaMHwj2Wwi06L4O2mU6F6bnZ8=;
 b=YMMJITuNmvZUTwX4u4s0SewmeeCyarZh66on3ILH8m0Q8ZJTnAzxYyD6SO3EBFbNXL
 XBWpmWhreZ/yYHwso2eZXq/0D3euRYxIdy7/VG9l59yc6tM7omnHGV3Cx/Obkqfdw+VU
 urwzxm6PmLAkB4CSRyGwdZxjJHnLe2BwTxTuxjhyba8sh6ZgCrSdu5OLbPJWD7aVp3vS
 cXl8r1lJU13ER3mjrogjSrcEjNz7F9xcSARye5EO0Nd2R3/Dc+wpUZsvVSpfC6oZkVsu
 0kN/PG9UVy/D/f1mmxdKH/X8ziyMXY9aL25yJISB23vYq4Ye9aCpusXtVuYA+LalZLUH
 LzVw==
X-Gm-Message-State: AOAM530PNmKGfCOJDplgyc3mYcK5SZquvv5VO5Dngcdn+8ePtTp7bvKi
 MkYfqUtRNG1U/PY9bpPYz+lMyA==
X-Google-Smtp-Source: ABdhPJz+FKwqJNJV6V9ky2Q3Pr1I/gyRjCM8ffvR9zGtjRVijd+/pM7L9NaYnxr3wGs7x2HDGcVHOw==
X-Received: by 2002:a7b:c10e:: with SMTP id w14mr7002846wmi.8.1618563269995;
 Fri, 16 Apr 2021 01:54:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v189sm8175612wmg.9.2021.04.16.01.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 01:54:29 -0700 (PDT)
Date: Fri, 16 Apr 2021 10:54:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 1/4] drm/i915/uapi: hide kernel doc warnings
Message-ID: <YHlQw7QQ1oPbWUBX@phenom.ffwll.local>
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <YHlObAzsosrxXdm2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHlObAzsosrxXdm2@phenom.ffwll.local>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 10:44:28AM +0200, Daniel Vetter wrote:
> On Thu, Apr 15, 2021 at 04:59:55PM +0100, Matthew Auld wrote:
> > It's not properly formatted kernel doc, just nerf the warnings for now.
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: mesa-dev@lists.freedesktop.org
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ok I need to revise, we need to pull this into Documentation/gpu/. I think
best would be to create a new driver-uapi.rst file, put it right after
drm-uapi.rst, and then add a section for drm/i915 uapi or similar.

Also since pxp patches, Jason's ctx cleanup and lmem all need this prep
work in patches 1-3 here, can you pls just resend those with the review
feedback so we can fast-track merging?

Thanks, Daniel

> 
> > ---
> >  include/uapi/drm/i915_drm.h | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index ddc47bbf48b6..a50257cde9ff 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -1054,12 +1054,12 @@ struct drm_i915_gem_exec_fence {
> >  	__u32 flags;
> >  };
> >  
> > -/**
> > +/*
> >   * See drm_i915_gem_execbuffer_ext_timeline_fences.
> >   */
> >  #define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
> >  
> > -/**
> > +/*
> >   * This structure describes an array of drm_syncobj and associated points for
> >   * timeline variants of drm_syncobj. It is invalid to append this structure to
> >   * the execbuf if I915_EXEC_FENCE_ARRAY is set.
> > @@ -1700,7 +1700,7 @@ struct drm_i915_gem_context_param {
> >  	__u64 value;
> >  };
> >  
> > -/**
> > +/*
> >   * Context SSEU programming
> >   *
> >   * It may be necessary for either functional or performance reason to configure
> > @@ -2067,7 +2067,7 @@ struct drm_i915_perf_open_param {
> >  	__u64 properties_ptr;
> >  };
> >  
> > -/**
> > +/*
> >   * Enable data capture for a stream that was either opened in a disabled state
> >   * via I915_PERF_FLAG_DISABLED or was later disabled via
> >   * I915_PERF_IOCTL_DISABLE.
> > @@ -2081,7 +2081,7 @@ struct drm_i915_perf_open_param {
> >   */
> >  #define I915_PERF_IOCTL_ENABLE	_IO('i', 0x0)
> >  
> > -/**
> > +/*
> >   * Disable data capture for a stream.
> >   *
> >   * It is an error to try and read a stream that is disabled.
> > @@ -2090,7 +2090,7 @@ struct drm_i915_perf_open_param {
> >   */
> >  #define I915_PERF_IOCTL_DISABLE	_IO('i', 0x1)
> >  
> > -/**
> > +/*
> >   * Change metrics_set captured by a stream.
> >   *
> >   * If the stream is bound to a specific context, the configuration change
> > @@ -2103,7 +2103,7 @@ struct drm_i915_perf_open_param {
> >   */
> >  #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
> >  
> > -/**
> > +/*
> >   * Common to all i915 perf records
> >   */
> >  struct drm_i915_perf_record_header {
> > @@ -2151,7 +2151,7 @@ enum drm_i915_perf_record_type {
> >  	DRM_I915_PERF_RECORD_MAX /* non-ABI */
> >  };
> >  
> > -/**
> > +/*
> >   * Structure to upload perf dynamic configuration into the kernel.
> >   */
> >  struct drm_i915_perf_oa_config {
> > -- 
> > 2.26.3
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
