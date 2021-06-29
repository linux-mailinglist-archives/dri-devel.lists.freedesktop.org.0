Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E243C3B6FDC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 11:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DB36E831;
	Tue, 29 Jun 2021 09:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8643B6E831
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 09:05:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m18so24875186wrv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XPks+2TMR5KziSg2KQQmIFbCybcjT3FN3c06ZXQ9tVM=;
 b=R4/bJGDZ4yR8kNc1lw5fWfXYqrEhb2viouVNqTFPbYRChhO+gj7iX1jlsQc3xAnOJJ
 wnwJwG3skav1xiY4mOqhKNz3vT2QbOEHb7x+JUTLaW1m4rB4/hMkk2x6BtGcLg/GG1nh
 3/maFtNYGLXO75Otw4ZPzKH3P6rG8bKcSwibw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XPks+2TMR5KziSg2KQQmIFbCybcjT3FN3c06ZXQ9tVM=;
 b=LVR/M7IZtZC0k3xD3mpTS1CEWiPYGx2cDWaIiA4rFJz3l5yM6FkYlp5zvraZ/d7bfM
 96HZxdzJ45Y6GCT+7PkXy3NR1MJyse+3ojF8gZKhfGmxY0vxXD6OSlH9Al+2Cx/TYFUU
 gFOfco2/z8eRPfj1XSTVcEnkked6Phy9DZ6QzpwEfTEBplJuN9CLAHrRonWYKQ6Xaek8
 yax8AWidG/XsNWDXT+FSnhoI5Qx4G+ceU/iQ8fBxtbUMOf4alSeJF7Dq9VgRRqeM9LO7
 YHQtM0Mqi1HBZsmCODvHZCO0LKpX/VF8CGyfZnhvSoHo866FSC59EBOxlTtHaLQNrv/+
 4dUA==
X-Gm-Message-State: AOAM5328nArQBja6QUNM2uZuameig47NACL0TA28n3/yMoxpWjSBUP75
 HaE0MRW2w75c+8ItX2gZfmdZYQ==
X-Google-Smtp-Source: ABdhPJymGncmAtxnAjwPTgjrFP92WAqwcvlNvpwKjgSnjtXglPMuCDyJX9RpnEzfhTRUeLSOeQwMfw==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr24799852wry.210.1624957546231; 
 Tue, 29 Jun 2021 02:05:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k4sm9307105wmj.19.2021.06.29.02.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 02:05:45 -0700 (PDT)
Date: Tue, 29 Jun 2021 11:05:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 01/16] drm/sched: Document what the timedout_job
 method should do
Message-ID: <YNriZzHcNQkmt9zh@phenom.ffwll.local>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629073510.2764391-2-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 09:34:55AM +0200, Boris Brezillon wrote:
> The documentation is a bit vague and doesn't really describe what the
> ->timedout_job() is expected to do. Let's add a few more details.
> 
> v5:
> * New patch
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/gpu_scheduler.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 10225a0a35d0..65700511e074 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -239,6 +239,20 @@ struct drm_sched_backend_ops {
>  	 * @timedout_job: Called when a job has taken too long to execute,
>  	 * to trigger GPU recovery.
>  	 *
> +	 * This method is called in a workqueue context.
> +	 *
> +	 * Drivers typically issue a reset to recover from GPU hangs, and this
> +	 * procedure usually follows the following workflow:
> +	 *
> +	 * 1. Stop the scheduler using drm_sched_stop(). This will park the
> +	 *    scheduler thread and cancel the timeout work, guaranteeing that
> +	 *    nothing is queued while we reset the hardware queue
> +	 * 2. Try to gracefully stop non-faulty jobs (optional)
> +	 * 3. Issue a GPU reset (driver-specific)
> +	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> +	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
> +	 *    jobs can be queued, and the scheduler thread is unblocked
> +	 *
>  	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
>  	 * and the underlying driver has started or completed recovery.
>  	 *
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
