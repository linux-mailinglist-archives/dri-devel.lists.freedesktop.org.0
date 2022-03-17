Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445234DC997
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68CC10E74C;
	Thu, 17 Mar 2022 15:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EDA10E6E9;
 Thu, 17 Mar 2022 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647529719; x=1679065719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q2+TipMuP6Eri4UIx+/IiRxHb0cv1DVcASwAJEbrBzs=;
 b=Q56g/b709nLhED+8sx/fmEj9HEw+zlyBAtLi7e8DYSF/rS+7AKQ3oHYz
 lQv5BxZ+ZH8NU+P0lHaHEOSyMvwiOsz2Be6EFnQodFqBktWZJNnvH8+LI
 m5X9VpjqByVpEMSTAKQRri/6ErNxUePFyAn4vi3nPBiedQwoWGqLvZvSL
 GvuJSExHadIXIgPY3LTIFP7KmFHf/8LW1ghJ53Eb4j5u1hWPwLJzcN+re
 V1DITmNgBItGflVxn5qrpVt3hsBYsIHdQfQCpeivLYyEFEbI1AjPmsMzx
 YR2cho514Vy2lsU9b6OWYk1/24blpILzeXB2w/f+eSuYwtFQTVoT/iNX5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257073430"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="257073430"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 08:04:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="498855940"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 08:04:26 -0700
Date: Thu, 17 Mar 2022 07:58:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Message-ID: <20220317145821.GA331@jons-linux-dev-box>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 03:06:18AM -0700, Christian König wrote:
> Am 17.03.22 um 10:59 schrieb Daniel Vetter:
> > On Thu, Mar 10, 2022 at 03:46:05PM -0800, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> In the system suspend path, we don't want to be racing with the
> >> scheduler kthreads pushing additional queued up jobs to the hw
> >> queue (ringbuffer).  So park them first.  While we are at it,
> >> move the wait for active jobs to complete into the new system-
> >> suspend path.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/adreno_device.c | 68 ++++++++++++++++++++--
> >>   1 file changed, 64 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> index 8859834b51b8..0440a98988fc 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -619,22 +619,82 @@ static int active_submits(struct msm_gpu *gpu)
> >>   static int adreno_runtime_suspend(struct device *dev)
> >>   {
> >>   	struct msm_gpu *gpu = dev_to_gpu(dev);
> >> -	int remaining;
> >> +
> >> +	/*
> >> +	 * We should be holding a runpm ref, which will prevent
> >> +	 * runtime suspend.  In the system suspend path, we've
> >> +	 * already waited for active jobs to complete.
> >> +	 */
> >> +	WARN_ON_ONCE(gpu->active_submits);
> >> +
> >> +	return gpu->funcs->pm_suspend(gpu);
> >> +}
> >> +
> >> +static void suspend_scheduler(struct msm_gpu *gpu)
> >> +{
> >> +	int i;
> >> +
> >> +	/*
> >> +	 * Shut down the scheduler before we force suspend, so that
> >> +	 * suspend isn't racing with scheduler kthread feeding us
> >> +	 * more work.
> >> +	 *
> >> +	 * Note, we just want to park the thread, and let any jobs
> >> +	 * that are already on the hw queue complete normally, as
> >> +	 * opposed to the drm_sched_stop() path used for handling
> >> +	 * faulting/timed-out jobs.  We can't really cancel any jobs
> >> +	 * already on the hw queue without racing with the GPU.
> >> +	 */
> >> +	for (i = 0; i < gpu->nr_rings; i++) {
> >> +		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> >> +		kthread_park(sched->thread);
> > Shouldn't we have some proper interfaces for this?
> 
> If I'm not completely mistaken we already should have one, yes.
> 
> > Also I'm kinda wondering how other drivers do this, feels like we should have a standard
> > way.
> >
> > Finally not flushing out all in-flight requests sounds a bit like a bad
> > idea for system suspend/resume since that's also the hibernation path, and
> > that would mean your shrinker/page reclaim stops working. At least in full
> > generality. Which ain't good for hibernation.
> 
> Completely agree, that looks like an incorrect workaround to me.
> 
> During suspend all userspace applications should be frozen and all f 
> their hardware activity flushed out and waited for completion.
>

Isn't that what Rob is doing?

He kills the scheduler preventing any new job from being submitted then
waits for an outstanding jobs to complete naturally complete (see the
wait_event_timeout below). If the jobs don't naturally complete the
suspend seems to be aborted? That flow makes sense to me and seems like
a novel way to avoid races.

Matt 
 
> I do remember that our internal guys came up with pretty much the same 
> idea and it sounded broken to me back then as well.
> 
> Regards,
> Christian.
> 
> >
> > Adding Christian and Andrey.
> > -Daniel
> >
> >> +	}
> >> +}
> >> +
> >> +static void resume_scheduler(struct msm_gpu *gpu)
> >> +{
> >> +	int i;
> >> +
> >> +	for (i = 0; i < gpu->nr_rings; i++) {
> >> +		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> >> +		kthread_unpark(sched->thread);
> >> +	}
> >> +}
> >> +
> >> +static int adreno_system_suspend(struct device *dev)
> >> +{
> >> +	struct msm_gpu *gpu = dev_to_gpu(dev);
> >> +	int remaining, ret;
> >> +
> >> +	suspend_scheduler(gpu);
> >>   
> >>   	remaining = wait_event_timeout(gpu->retire_event,
> >>   				       active_submits(gpu) == 0,
> >>   				       msecs_to_jiffies(1000));
> >>   	if (remaining == 0) {
> >>   		dev_err(dev, "Timeout waiting for GPU to suspend\n");
> >> -		return -EBUSY;
> >> +		ret = -EBUSY;
> >> +		goto out;
> >>   	}
> >>   
> >> -	return gpu->funcs->pm_suspend(gpu);
> >> +	ret = pm_runtime_force_suspend(dev);
> >> +out:
> >> +	if (ret)
> >> +		resume_scheduler(gpu);
> >> +
> >> +	return ret;
> >>   }
> >> +
> >> +static int adreno_system_resume(struct device *dev)
> >> +{
> >> +	resume_scheduler(dev_to_gpu(dev));
> >> +	return pm_runtime_force_resume(dev);
> >> +}
> >> +
> >>   #endif
> >>   
> >>   static const struct dev_pm_ops adreno_pm_ops = {
> >> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> >> +	SET_SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resume)
> >>   	SET_RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
> >>   };
> >>   
> >> -- 
> >> 2.35.1
> >>
> 
