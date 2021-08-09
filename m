Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F53E48F5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 17:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF00689804;
	Mon,  9 Aug 2021 15:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0E989804
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 15:36:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z4so22043142wrv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fdoXuHuVIB3SEqhDkl4mX/S1KqqfY2mnHrL57EwTK6w=;
 b=WwDDErn4ed+/8YWz8B4R61IMRvo+DbB7q9DB0WatRJ1DKRo4vLwH2E9fXcZ+nWnrAa
 wRaEzffewZA+u9G4XktblHbbg8/aX4k5hH4Mkr3v3suQssYgV6IfH5Z3KQfnDGHFOteQ
 CW3FMdKvmY6tVJPiUB4tsbH+yEj8iG7pLfKOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fdoXuHuVIB3SEqhDkl4mX/S1KqqfY2mnHrL57EwTK6w=;
 b=FkkCr4XVGMKgWGBLCrOTtqSZGlVqrXT8q0hQBPFQ5gu1392uzs9GPpVTnjsAbhr5W7
 nFQ+nB6tM1VaQHH9O18HzjY+OTxZFdv4A2vVx4HU6UghnsW5AOX768ozfGjgwtec7LHU
 N6a0M5STbgvBHqtbtHOt/rdi+NJYt/LCjicP4NLHQxqZdKBSZnFWd52BHaLN8q6MRKQh
 8mXLQaiNu32oo5KSrAYgnk0YS5KRwB4wRg3SRUB+8nLX1sdyXWPP4edCEQg/0RNAogUI
 1JMLoHPhypmwOSfcIas+DWOQH0pdCkfZJZGNuf4ukormQYuBfe8xVSQ+rWbSeZ+sm98/
 QkqA==
X-Gm-Message-State: AOAM530kifmJYYVJ0Z4qKf7cQejejOWCIdA/en7uWqpiI6fRbNMjh5Ic
 5VoYL4Z845spDbOxA1q98WGGFg==
X-Google-Smtp-Source: ABdhPJzO0oBCcpBVe6X5op/XQyOGEKVr/IW5ry56OQZOCRPkOUwgjnEEoKq6rO6L0Y/3ard6TkyxEA==
X-Received: by 2002:a5d:68cc:: with SMTP id p12mr26312342wrw.161.1628523374560; 
 Mon, 09 Aug 2021 08:36:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m39sm19962208wms.28.2021.08.09.08.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 08:36:14 -0700 (PDT)
Date: Mon, 9 Aug 2021 17:36:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 21/46] drm/i915/guc: Add
 guc_child_context_destroy
Message-ID: <YRFLbB2Ayzf+KDz/@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-22-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803222943.27686-22-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Tue, Aug 03, 2021 at 03:29:18PM -0700, Matthew Brost wrote:
> Since child contexts do not own the guc_ids or GuC context registration,
> child contexts can simply be freed on destroy. Add
> guc_child_context_destroy context operation to do this.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 2d8296bcc583..850edeff9230 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2828,6 +2828,13 @@ static void destroy_worker_func(struct work_struct *w)
>  		intel_gt_pm_unpark_work_add(gt, destroy_worker);
>  }
>  
> +/* Future patches will use this function */
> +__maybe_unused

Pure bikeshed, but for something this small just squash it in with the
first user. This kinda does nothing alone.
-Daniel

> +static void guc_child_context_destroy(struct kref *kref)
> +{
> +	__guc_context_destroy(container_of(kref, struct intel_context, ref));
> +}
> +
>  static void guc_context_destroy(struct kref *kref)
>  {
>  	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
