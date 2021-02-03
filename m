Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681A30D7AD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0BA89F6D;
	Wed,  3 Feb 2021 10:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDD989F6D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:36:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b3so5455506wrj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 02:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tTejM5PSEqb8zv1Gnbm4ubTcew/cvnsTZAR9JZjwF8U=;
 b=SsZazcT2X/uNTdy5rSP48rSLaJnHdDONCm+7AQ0ww8+5PUWYF1NqT2tMCHn0u+nJGf
 FdWqxZSI3ILRGHlyDRfCZFG0h0N5sdgbcq/nwnisqcSNS1NQBC3XYihld3jQ0mpwvJ3x
 YkJCOsYKbUxtBAa5hD8mXt5ngWSuz2JBnHV/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tTejM5PSEqb8zv1Gnbm4ubTcew/cvnsTZAR9JZjwF8U=;
 b=tRinEYAPaEb2ll/nM8D769w+ir7Mu1/MVL3tt6fLXL9gykrds4xZv91bSwJW2SSGmP
 MicA2rh6pT7Vp68IpotXzQ1RzfFxplRikVNB63mYvjBxLcoYNsaN0KQ5K/WPFJ7274G3
 e8ik6ZJC+1oXnxwk5M1Zi4MYSSVa5QDBZX1vj57c57UT7JjrSGmC1thVeyXAaTHdSr/C
 ARmdOzxQn9otrr6XCbsSGDCFzFAl3tfOs8aIWSFkM400RfwgiBq2GWe6smbolsXiCWqv
 IMUOK9I3NFdwyXrlA14fKQ6mHVkAeHr3JEXHinNM+QaZuc2VLspWDeQY51AvKYDIG4l7
 KRZQ==
X-Gm-Message-State: AOAM533x5DRtzaB8XoNVatOchEKfsL81sGqRHAc6Guh0fLeHENFzBJP+
 FDg/dxoHL0zABWyCf0i/XwyOgA==
X-Google-Smtp-Source: ABdhPJxlKj8wRfBnbkFKZQxMeEJF5ziI/XN6d2Wa/LXcUbk2rcJ3/44HmfpgIZyW6ml/e6y4XF29VQ==
X-Received: by 2002:adf:f905:: with SMTP id b5mr2642716wrr.129.1612348618618; 
 Wed, 03 Feb 2021 02:36:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 13sm1454431wmj.11.2021.02.03.02.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:36:57 -0800 (PST)
Date: Wed, 3 Feb 2021 11:36:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH] drm/v3d: Fix incorrect return type to timedout_job
Message-ID: <YBp8yGQuP4spzWNJ@phenom.ffwll.local>
References: <20210129155439.10128-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210129155439.10128-1-patrik.r.jakobsson@gmail.com>
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
Cc: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 04:54:39PM +0100, Patrik Jakobsson wrote:
> The commit a6a1f036c74e ("drm/scheduler: Job timeout handler returns
> status (v3)") incorrectly uses "enum drm_task_status" for v3d and causes
> a build failure. "enum drm_task_status" got changed into "enum
> drm_gpu_sched_status" in v3 of the patch but the change for v3d got
> lost.
> 
> Fixes: ("drm/scheduler: Job timeout handler returns status (v3)")
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

I think I r-b'ed such a patch already, but maybe not yet merged.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/v3d/v3d_sched.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index ef2338a294ca..ceb33f8e4379 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -259,7 +259,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
>  	return NULL;
>  }
>  
> -static enum drm_gpu_sched_status
> +static enum drm_gpu_sched_stat
>  v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>  {
>  	enum v3d_queue q;
> @@ -294,7 +294,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>   * could fail if the GPU got in an infinite loop in the CL, but that
>   * is pretty unlikely outside of an i-g-t testcase.
>   */
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>  		    u32 *timedout_ctca, u32 *timedout_ctra)
>  {
> @@ -312,7 +312,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>  	return v3d_gpu_reset_for_timeout(v3d, sched_job);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_bin_job *job = to_bin_job(sched_job);
> @@ -321,7 +321,7 @@ v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>  				   &job->timedout_ctca, &job->timedout_ctra);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_render_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_render_job *job = to_render_job(sched_job);
> @@ -330,7 +330,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
>  				   &job->timedout_ctca, &job->timedout_ctra);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_job *job = to_v3d_job(sched_job);
> @@ -338,7 +338,7 @@ v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>  	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_csd_job *job = to_csd_job(sched_job);
> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
