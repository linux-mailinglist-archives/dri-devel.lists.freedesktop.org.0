Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA1390332
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33A489CFA;
	Tue, 25 May 2021 13:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F180E6E140
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:57:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d11so32340390wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UdWUY1PBd7H5PAODbf7NSnVpl+zNYiQtpVY+c4z2LdQ=;
 b=CcQkWVter9jrvjgS+nzESAfN83o7vsCSXduTezGW0zs0KOhZanNgnaUspxbGJ2UAH6
 AXzmKf0YjhzicCs7bLKme6kIAejhu5p7tv3CglhNgnfE3x6FVscZvJPD5CBXg6/OJPof
 3rth6vKrsfdl15xOJbbb2HOGp5HPqQKlKCEuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UdWUY1PBd7H5PAODbf7NSnVpl+zNYiQtpVY+c4z2LdQ=;
 b=g10LzaFpVxRlzi9A6gMRutC9JWIcaifdFQjfmNS9t+F5clvmnt+HhzhN+pjxJ8heBq
 CbNqvg3lGzBTB1CZYSN9ngUIZ2oBRK1kOWh6k5RvOk875nVXDAvaulMqoc10HbnA7Vj0
 WjidUyZnjIzEHz42Q/iimoCTtf0es7E715CW/Vv5CZQXqznIIq1avJIMc3GhHV3D1QjW
 RVviJx0wmhS8DYGyEKvtbUNpFnpe7uVsZYMLGjRLz9unVgVe5RcycH8BTZ3XrxuU1UYU
 4c+O6nfJLnBfs0SfLMreGwfyoNfbY3AXnMWjzViCQaYBnchgqrdhvWs+66CorgK5vkBA
 NYdg==
X-Gm-Message-State: AOAM531nJPZgKMICRMmZodcSJdq5i53qyeAfVfOLSyN1sjapJKYKBGU8
 qAzINrrc3gGbInSCzZHNhRw8dA==
X-Google-Smtp-Source: ABdhPJzBcw12nnLNLwYw4wG0Aex2S+sM0sDXzzJhgVavjHfSpGVaHh/bRhMQkVERQ3obZZVaNeVNfw==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr28129904wri.260.1621951019676; 
 Tue, 25 May 2021 06:56:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k205sm11217666wmf.13.2021.05.25.06.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:56:58 -0700 (PDT)
Date: Tue, 25 May 2021 15:56:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 0/3] Clean a few backend interfaces in the i915
Message-ID: <YK0CKLSCx0qowxhy@phenom.ffwll.local>
References: <20210521183215.65451-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521183215.65451-1-matthew.brost@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 11:32:12AM -0700, Matthew Brost wrote:
> As discussed in [1] start merging some support patches as a precursor to
> GuC submission the i915. This is step #1 mentioned in [1].
> 
> [1] https://patchwork.freedesktop.org/series/89844/
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Pushed to drm-intel-gt-next, thanks for patches&reviews. Btw you can also
ping John H or Daniele for pushing stuff for you, should be quicker than
waiting for me to return from a lon w/e :-)

Plus I _really_ don't want to get back into the business of pushing other
people's work ...

Cheers, Daniel

> 
> Chris Wilson (3):
>   drm/i915/gt: Move engine setup out of set_default_submission
>   drm/i915/gt: Move submission_method into intel_gt
>   drm/i915/gt: Move CS interrupt handler to the backend
> 
>  drivers/gpu/drm/i915/gt/intel_engine.h        |  8 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 19 +++-
>  drivers/gpu/drm/i915/gt/intel_engine_types.h  | 14 +--
>  .../drm/i915/gt/intel_execlists_submission.c  | 95 +++++++++++++------
>  .../drm/i915/gt/intel_execlists_submission.h  |  3 -
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 82 +++++-----------
>  drivers/gpu/drm/i915/gt/intel_gt_irq.h        | 23 +++++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h      |  7 ++
>  drivers/gpu/drm/i915/gt/intel_reset.c         |  7 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   | 12 ++-
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
>  drivers/gpu/drm/i915/gt/selftest_execlists.c  |  2 +-
>  .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 64 ++++++-------
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  1 -
>  drivers/gpu/drm/i915/i915_irq.c               | 10 +-
>  drivers/gpu/drm/i915/i915_perf.c              | 10 +-
>  17 files changed, 199 insertions(+), 162 deletions(-)
> 
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
