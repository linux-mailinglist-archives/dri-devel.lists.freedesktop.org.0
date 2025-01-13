Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E46A0B465
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E09010E046;
	Mon, 13 Jan 2025 10:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EjhOTYmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3058610E046
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 10:20:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C63305C54A4;
 Mon, 13 Jan 2025 10:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BC9C4CED6;
 Mon, 13 Jan 2025 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736763621;
 bh=16oofN4qwhzS8LEeINjrgxH2C44aM93J8ktG1xFg7rA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjhOTYmmAyPKO3heeoShuA3AMFeWLhQUGVciofToWvEHui+pjQ7m3I9clR35Xq9Gv
 rnuV0FhvIwwudrw6LO+bq/HwScqvX6/tPh9aPSHZur5gzNVvbuK5uNmKhGNB3S9/VN
 2MRu9XuePYtU/ZYUJ6imghbfvirJp5E+TK2PvasOS7oYkTTFdXj78bDzhdCCEIFPb/
 u6UZCIhzAYPWgCu6pYzNVufXzdG8I8sS1sObrXOy5kim7nG0pD8z+RyePBmdRR0e2s
 Qp4m67p74emtJ0kXqLYNXSSBXnUxy4xHqeJ8rF/xktcPTBGFbxbPUDD34xWgqyTAYb
 ZM42jz0w4H0vA==
Date: Mon, 13 Jan 2025 11:20:15 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/3] drm/sched: Adjust outdated docu for run_job()
Message-ID: <Z4To3x2dCGEi6hJX@pollux>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-5-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109133710.39404-5-phasta@kernel.org>
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

On Thu, Jan 09, 2025 at 02:37:11PM +0100, Philipp Stanner wrote:
> The documentation for drm_sched_backend_ops.run_job() mentions a certain
> function called drm_sched_job_recovery(). This function does not exist.
> What's actually meant is drm_sched_resubmit_jobs(), which is by now also
> deprecated.
> 
> Remove the mention of the deprecated function.
> 
> Discourage the behavior of drm_sched_backend_ops.run_job() being called
> multiple times for the same job.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  include/drm/gpu_scheduler.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d5cd2a78f27c..c4e65f9f7f22 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -421,9 +421,12 @@ struct drm_sched_backend_ops {
>  
>  	/**
>  	 * @run_job: Called to execute the job once all of the dependencies
> -	 * have been resolved. This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> -	 * try it again.
> +	 * have been resolved.
> +	 *
> +	 * The deprecated drm_sched_resubmit_jobs() (called from
> +	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
> +	 * same parameters. Doing this is strongly discouraged because it

Maybe "invoke this again for the same job"?

> +	 * violates dma_fence rules.

Does it? AFAIU it puts certain expectations on the driver, before a driver can
call this function, which likely leads to the driver to violate dma_fence rules,
right?

Maybe we should also list the exact rules that are (likely to be) violated to
allow drivers to fix it at their end more easily.

>  	 *
>  	 * @sched_job: the job to run
>  	 *
> -- 
> 2.47.1
> 
