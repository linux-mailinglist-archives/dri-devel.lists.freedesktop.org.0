Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A189A4A931
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 06:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09110ED75;
	Sat,  1 Mar 2025 05:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzXI0Yr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFEF10E104;
 Sat,  1 Mar 2025 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740808394; x=1772344394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SOKX+bxG8+nhQMIjkrqXwpSaA/qreBbJ3mAB/IkyMSo=;
 b=FzXI0Yr8lMeVc9DPhgSFTfTHNtXvFUJPQ/rfjjzygxNIcwqSmvAcCse6
 WeKaMP5WCUpBPRfIW6LzxG3DXuiVKLLkGVj0HkEdQf9ahqPDWgUwdEy88
 Gsqv91pAN94jZYZu0rA93AlyHRtjDS8+CKL5ewGMooFHfROJUKQpUDSuM
 b/5+Qx8QzcEoh/OS+n+TEgcvU4FxD8QQLuteq2wSBnzYncuOGGpzv5ucM
 SlrPPpel3ixUsE/9taOwJpgIyRkoOQYAD1RBVKJfDPAYpQZxKRdPeQZU7
 Ldq8q/QDuzAf4QAI/Ty89qAh3FnbP5BJGK4NU0Db1MopLTRVF7xCfCG+T Q==;
X-CSE-ConnectionGUID: ImOnxhpHRWuXUCllrA4ocA==
X-CSE-MsgGUID: dmFNIhXWSquUobQrEheI3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45394244"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="45394244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 21:53:13 -0800
X-CSE-ConnectionGUID: 1GMxVJ97S22CtsYmBWheHA==
X-CSE-MsgGUID: nUaMSS53Tr6jbFoeUT9Mew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="117279593"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 21:53:10 -0800
Date: Sat, 1 Mar 2025 07:53:06 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 'Christian =?iso-8859-1?Q?K=F6nig'?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 lucas.demarchi@intel.com
Subject: Re: [PATCH 1/2] drm: Create an app info option for wedge events
Message-ID: <Z8KgwswQQyGxhsR1@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-2-andrealmeid@igalia.com>
 <Z8HGFRGOYvyCCWWu@black.fi.intel.com>
 <58763d8e-46a1-4753-9401-987fb3dac50b@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58763d8e-46a1-4753-9401-987fb3dac50b@igalia.com>
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

On Fri, Feb 28, 2025 at 06:54:12PM -0300, André Almeida wrote:
> Hi Raag,
> 
> On 2/28/25 11:20, Raag Jadav wrote:
> > Cc: Lucas
> > 
> > On Fri, Feb 28, 2025 at 09:13:52AM -0300, André Almeida wrote:
> > > When a device get wedged, it might be caused by a guilty application.
> > > For userspace, knowing which app was the cause can be useful for some
> > > situations, like for implementing a policy, logs or for giving a chance
> > > for the compositor to let the user know what app caused the problem.
> > > This is an optional argument, when `PID=-1` there's no information about
> > > the app caused the problem, or if any app was involved during the hang.
> > > 
> > > Sometimes just the PID isn't enough giving that the app might be already
> > > dead by the time userspace will try to check what was this PID's name,
> > > so to make the life easier also notify what's the app's name in the user
> > > event.
> > > 
> > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
> > >   drivers/gpu/drm/drm_drv.c                  | 16 +++++++++++++---
> > >   drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
> > >   drivers/gpu/drm/xe/xe_device.c             |  3 ++-
> > >   include/drm/drm_device.h                   |  8 ++++++++
> > >   include/drm/drm_drv.h                      |  3 ++-
> > >   7 files changed, 29 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index 24ba52d76045..00b9b87dafd8 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -6124,7 +6124,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> > >   	atomic_set(&adev->reset_domain->reset_res, r);
> > >   	if (!r)
> > > -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> > > +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> > >   	return r;
> > >   }
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > index ef1b77f1e88f..3ed9cbcab1ad 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > @@ -150,7 +150,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
> > >   			amdgpu_fence_driver_force_completion(ring);
> > >   			if (amdgpu_ring_sched_ready(ring))
> > >   				drm_sched_start(&ring->sched, 0);
> > > -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> > > +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> > >   			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> > >   			goto exit;
> > >   		}
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 17fc5dc708f4..48faafd82a99 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -522,6 +522,7 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > >    * drm_dev_wedged_event - generate a device wedged uevent
> > >    * @dev: DRM device
> > >    * @method: method(s) to be used for recovery
> > > + * @info: optional information about the guilty app
> > >    *
> > >    * This generates a device wedged uevent for the DRM device specified by @dev.
> > >    * Recovery @method\(s) of choice will be sent in the uevent environment as
> > > @@ -534,13 +535,14 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > >    *
> > >    * Returns: 0 on success, negative error code otherwise.
> > >    */
> > > -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> > > +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> > > +			 struct drm_wedge_app_info *info)
> > >   {
> > >   	const char *recovery = NULL;
> > >   	unsigned int len, opt;
> > >   	/* Event string length up to 28+ characters with available methods */
> > > -	char event_string[32];
> > > -	char *envp[] = { event_string, NULL };
> > > +	char event_string[32], pid_string[15], comm_string[TASK_COMM_LEN];
> > > +	char *envp[] = { event_string, pid_string, comm_string, NULL };
> > >   	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
> > > @@ -562,6 +564,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> > >   	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
> > >   		 "but recovered through reset" : "needs recovery");
> > > +	if (info) {
> > > +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> > > +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> > > +	} else {
> > > +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
> > > +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");
> > > +	}
> > This is not much use for wedge cases that needs recovery, since at that point
> > the userspace will need to clean house anyway.
> > 
> > Which leaves us with only 'none' case and perhaps the need for standardization
> > of "optional telemetry collection".
> > 
> > Thoughts?
> 
> I had the feeling that 'none' was already meant to be used for that. Do you
> think we should move to another naming? Given that we didn't reach the merge
> window yet we could potentially change that name without much damage.

No, I meant thoughts on possible telemetry data that the drivers might
think is useful for userspace (along with PID) and can be presented in
a vendor agnostic manner (just like wedged event).

Raag
