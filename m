Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA595B51C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 14:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5B910E8AD;
	Thu, 22 Aug 2024 12:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="eC0Tf4Mu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34510E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 12:36:26 +0000 (UTC)
Delivered-To: daniel.almeida@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724330180; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=azhOFkXSznyw5G04VoBx5MKTwpR6ixBsd9c8t2tUp5+hyvAEh6GNk45HNIZBB/7X+KTqhjOh2j1J/OvOO3HNOP75MMkJn47uzTQar8mc60gdY1A0KPE39yFK3G2uy8RzwUIs/fAri3HmKjfrK2hCzdoCwbHUI11lyv6ml916tMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724330180;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ec363QkCLP4KD8xSeOi8b8K870mSXT4Tm6Uy/rkLhnw=; 
 b=NQrZtevNYCqr/ZkA+g3dWumiJ7zPWENJBBr4fqbtgEsFwmKhRcnRIIjVyC+2cKTjs/EpBtsTTYErBh2xVXrpEcGbuc2K9eM5ptW8lvpASG9BFgjUEHsprWzKBDsWKOiRLB7VugYUeGeatMqzL1KgJ0vR7v2vRFqr9lIn/DN5XNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724330180; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Ec363QkCLP4KD8xSeOi8b8K870mSXT4Tm6Uy/rkLhnw=;
 b=eC0Tf4MuS/ipbqs/TrCFWeUvKl5WWfy67QYRCaDlipFlPpOzMwpAM/2EDQq3yixe
 2GqggesT7gpNzU2Qtm4COavXgeVIsegswhMrx1Y1vvwejOz/AHl/ChDq7AZllNWO+iW
 /gDK3NIRJTDXl505wwwQ8iXYY8wr9wr21eawm/GA=
Received: by mx.zohomail.com with SMTPS id 172433017839347.8194884756972;
 Thu, 22 Aug 2024 05:36:18 -0700 (PDT)
Date: Thu, 22 Aug 2024 13:36:15 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com, 
 boris.brezillon@collabora.com, robh@kernel.org, faith.ekstrand@collabora.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 RESEND 4/5] drm: panthor: add debugfs knob to dump
 successful jobs
Message-ID: <tsui2rjbzxwj4wg2gw5o6y4ruap7yvimoshknvrmbxnyylsqoc@mkh54dzmpkfu>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <20240821143826.3720-1-daniel.almeida@collabora.com>
 <20240821143826.3720-5-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240821143826.3720-5-daniel.almeida@collabora.com>
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

Hi Daniel,

> On 21.08.2024 11:37, Daniel Almeida wrote:
> It can be advantageous for userspace to have access to successful jobs.

While it's true that perhaps having additional jobs as part of the same devcoredump file
could provide further information as to why a later job failed, I see a few snags with this
approach:

- The time since the debugfs knob is triggered and therefore some successful jobs dumped
until a later job fails might be very long, so the preceding jobs maybe won't provide
much context.
- Besides being mostly interested in immediately preceding jobs, I think we'd want these
to belong to the same scheduling group and VM as the failing job, but this approach
will dump them all consecutively, even if they belong to a different open DRM file.
- In my experience writing a similar feature for the Panfrost driver, I think it's best
to wait until users of the driver run into specific bugs for us to come up with debug
features that would be useful for them, rather than sort of trying to guess them instead,
because there's the risk they'll never be used and then just add cruft into the codebase.

Other than that, the preceding patches look absolutely gorgeous to me, so I
think it's best if you resubmit them, and maybe keep patches 3-5 on hold until
we run into a bug scenario where they might prove useful.

Cheers,
Adrian

> Allow this as an opt-in through a debugfs file.
> 
> Note that the devcoredump infrastructure will discard new dumps if a
> previous dump hasn't been read. A future patch will add support for
> multi-job dumps which will work around this limitation.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index afd644c7d9f1..ea2696c1075a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/build_bug.h>
>  #include <linux/clk.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dma-resv.h>
> @@ -317,6 +318,9 @@ struct panthor_scheduler {
>  		 */
>  		struct list_head stopped_groups;
>  	} reset;
> +
> +	/** @dump_successful_jobs: whether to dump successful jobs through coredumpv */
> +	bool dump_successful_jobs;
>  };
>  
>  /**
> @@ -2946,6 +2950,16 @@ queue_run_job(struct drm_sched_job *sched_job)
>  	queue->iface.input->extract = queue->iface.output->extract;
>  	queue->iface.input->insert = job->ringbuf.end;
>  
> +	if (sched->dump_successful_jobs) {
> +		struct panthor_core_dump_args core_dump_args = {
> +			.ptdev = ptdev,
> +			.group_vm = job->group->vm,
> +			.group = job->group,
> +		};
> +
> +		panthor_core_dump(&core_dump_args);
> +	}
> +
>  	if (group->csg_id < 0) {
>  		/* If the queue is blocked, we want to keep the timeout running, so we
>  		 * can detect unbounded waits and kill the group when that happens.
> @@ -3609,5 +3623,8 @@ void panthor_sched_debugfs_init(struct drm_minor *minor)
>  	struct panthor_device *ptdev =
>  		container_of(minor->dev, struct panthor_device, base);
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> +
> +	debugfs_create_bool("dump_successful_jobs", 0644, minor->debugfs_root,
> +			    &sched->dump_successful_jobs);
>  }
>  #endif /* CONFIG_DEBUG_FS */
> -- 
> 2.45.2
