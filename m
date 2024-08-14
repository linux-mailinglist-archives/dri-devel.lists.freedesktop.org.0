Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4842F9514C6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 08:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DFD10E070;
	Wed, 14 Aug 2024 06:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lq9KlyG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8985510E070;
 Wed, 14 Aug 2024 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723617817; x=1755153817;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=acy7JpKwTKOzUZppdRJ58fe3crRCWXF4RoigMB9yCgQ=;
 b=lq9KlyG2r8xx4sLziV7hfC9qFrTXmoAQVNPfs92okYZwbr+Ug63vrM7B
 PYVRNtSiCABTsqBBrBFa2JuAZiyY1wiUbcXia4vAKs9EzqRnDv+z0U94J
 3YFfBNjrV5Rp5lBI8X3EYtA9PNq9IP8FCdwd4P0KJiNg1vj8/y4ZIbUQI
 ehY47hvrKqpkjobLusOy1K8KTDjMuQL2mqofNHA01yfVH0oEmPGUGEgxy
 o3oky3M1sLB27SD2waMPbOeDrFMZgpH2C6OHPEkVclWWcvs/OfUDN2KAi
 Qh6wBveWU4meAlfAY3LyAeFx9h+B41HyaUe8uZA22cEtXUvO06PipD/IB w==;
X-CSE-ConnectionGUID: 9MLnJ5QcTw+M8kalDhmtEQ==
X-CSE-MsgGUID: mwFTWX+ORVSko0uLIZFnSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32493355"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="32493355"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:43:37 -0700
X-CSE-ConnectionGUID: 7wHTuFSWT0iEOChV4oZjfQ==
X-CSE-MsgGUID: NKQ0gUZKTni/Uka/IiwzFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58786002"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:43:34 -0700
Message-ID: <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
Date: Wed, 14 Aug 2024 12:16:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 anshuman.gupta@intel.com
References: <20240812074812.1457164-1-raag.jadav@intel.com>
 <801bf720-6131-489c-8440-34d2267fe73b@linux.intel.com>
 <ZrtfgGY1YFr22Pg9@black.fi.intel.com> <ZruPtcniJzXOlumA@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZruPtcniJzXOlumA@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 13/08/24 22:24, Rodrigo Vivi wrote:
> On Tue, Aug 13, 2024 at 04:28:32PM +0300, Raag Jadav wrote:
>> On Mon, Aug 12, 2024 at 03:08:14PM +0530, Aravind Iddamsetty wrote:
>>> On 12/08/24 13:18, Raag Jadav wrote:
>>>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>
>>>> This was dropped in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset
>>>> uevent for now") as part of refactoring.
>>>>
>>>> Now that we have better uapi semantics and naming for the uevent,
>>>> bring it back. With this in place, userspace will be notified of
>>>> wedged device along with its reason.
>>>>
>>>> $ udevadm monitor --property --kernel
>>>> monitor will print the received events for:
>>>> KERNEL - the kernel uevent
>>>>
>>>> KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
>>>> ACTION=change
>>>> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
>>>> SUBSYSTEM=pci
>>>> DEVICE_STATUS=NEEDS_RESET
>>>> REASON=GT_RESET_FAILED
>>>> TILE_ID=0
>>>> GT_ID=0
>>>> DRIVER=xe
>>>> PCI_CLASS=30000
>>>> PCI_ID=8086:56B1
>>>> PCI_SUBSYS_ID=8086:1210
>>>> PCI_SLOT_NAME=0000:03:00.0
>>>> MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
>>>> SEQNUM=6104
>>>>
>>>> v2: Change authorship to Himal (Aravind)
>>>>     Add uevent for all device wedged cases (Aravind)
>>>>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_device.c     | 10 +++++++++-
>>>>  drivers/gpu/drm/xe/xe_device.h     |  2 +-
>>>>  drivers/gpu/drm/xe/xe_gt.c         | 23 +++++++++++++++++++----
>>>>  drivers/gpu/drm/xe/xe_guc.c        | 13 ++++++++++++-
>>>>  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
>>>>  include/uapi/drm/xe_drm.h          | 29 +++++++++++++++++++++++++++++
>>>>  6 files changed, 82 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 1aba6f9eaa19..d975bdce4a7d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -955,6 +955,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>  /**
>>>>   * xe_device_declare_wedged - Declare device wedged
>>>>   * @xe: xe device instance
>>>> + * @event_params: parameters to be sent along with uevent
>>>>   *
>>>>   * This is a final state that can only be cleared with a mudule
>>>>   * re-probe (unbind + bind).
>>>> @@ -965,8 +966,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>   * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>>>>   * snapshot capture. In this mode, GT reset won't be attempted so the state of
>>>>   * the issue is preserved for further debugging.
>>>> + * Caller is expected to pass respective parameters to be sent along with
>>>> + * uevent. Pass NULL in case of no params.
>>>>   */
>>>> -void xe_device_declare_wedged(struct xe_device *xe)
>>>> +void xe_device_declare_wedged(struct xe_device *xe, char **event_params)
>>>>  {
>>>>  	struct xe_gt *gt;
>>>>  	u8 id;
>>>> @@ -984,12 +987,17 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>>  	xe_pm_runtime_get_noresume(xe);
>>>>  
>>>>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>>> +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>> +
>>>>  		xe->needs_flr_on_fini = true;
>>>>  		drm_err(&xe->drm,
>>>>  			"CRITICAL: Xe has declared device %s as wedged.\n"
>>>>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>>>>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>>>>  			dev_name(xe->drm.dev));
>>>> +
>>>> +		/* Notify userspace about reset required */
>>>> +		kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, event_params);
>>>>  	}
>>>>  
>>>>  	for_each_gt(gt, xe, id)
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>> index db6cc8d0d6b8..5d40fc6f0904 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> @@ -174,7 +174,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>>>  	return atomic_read(&xe->wedged.flag);
>>>>  }
>>>>  
>>>> -void xe_device_declare_wedged(struct xe_device *xe);
>>>> +void xe_device_declare_wedged(struct xe_device *xe, char **reset_event);
>>>>  
>>>>  struct xe_file *xe_file_get(struct xe_file *xef);
>>>>  void xe_file_put(struct xe_file *xef);
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 58895ed22f6e..519f3c2cf9e2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -741,6 +741,24 @@ static int do_gt_restart(struct xe_gt *gt)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static void xe_gt_reset_failed(struct xe_gt *gt, int err)
>>>> +{
>>>> +	char *event_params[5];
>>>> +
>>>> +	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>>> +
>>>> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>>>> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
>>>> +	event_params[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", gt_to_tile(gt)->id);
>>>> +	event_params[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt->info.id);
>>> the TILE_ID and GT_ID can be passed for other events as well, with that you can
>>> have a common function to send uevent which would take reason as an input.
>> But is that required for all cases? There could be potential cases atleast
>> in the future where it is not needed.


At least in these cases it makes sense as they (other reasons)
can be associated to a GT and a Tile. If in future they arises a
reason where these details are not needed i guess we can handle that.


>>
>>>> +	event_params[4] = NULL;
>>>> +
>>>> +	xe_device_declare_wedged(gt_to_xe(gt), event_params);
>>>> +
>>>> +	kfree(event_params[2]);
>>>> +	kfree(event_params[3]);
>>>> +}
>>>> +
>>>>  static int gt_reset(struct xe_gt *gt)
>>>>  {
>>>>  	int err;
>>>> @@ -796,10 +814,7 @@ static int gt_reset(struct xe_gt *gt)
>>>>  	XE_WARN_ON(xe_uc_start(&gt->uc));
>>>>  	xe_pm_runtime_put(gt_to_xe(gt));
>>>>  err_fail:
>>>> -	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>>> -
>>>> -	xe_device_declare_wedged(gt_to_xe(gt));
>>>> -
>>>> +	xe_gt_reset_failed(gt, err);
>>>>  	return err;
>>>>  }
>>>>  
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index de0fe9e65746..b544012f5b11 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -560,6 +560,17 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>>>  	return ret ? ret : freq;
>>>>  }
>>>>  
>>>> +static void xe_guc_load_failed(struct xe_gt *gt)
>>>> +{
>>>> +	char *event_params[3];
>>>> +
>>>> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>>>> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC;
>>>> +	event_params[2] = NULL;
>>>> +
>>>> +	xe_device_declare_wedged(gt_to_xe(gt), event_params);
>>>> +}
>>>> +
>>>>  /*
>>>>   * Wait for the GuC to start up.
>>>>   *
>>>> @@ -684,7 +695,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>>>>  			break;
>>>>  		}
>>>>  
>>>> -		xe_device_declare_wedged(gt_to_xe(gt));
>>>> +		xe_guc_load_failed(gt);
>>>>  	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>>>>  		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>>>>  			   delta_ms, status, count);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index 460808507947..33ed6221f465 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -891,6 +891,17 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>>>>  	mutex_unlock(&guc->submission_state.lock);
>>>>  }
>>>>  
>>>> +static void xe_exec_queue_timedout(struct xe_device *xe)
>>>> +{
>>>> +	char *event_params[3];
>>>> +
>>>> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>>>> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT;
>>>> +	event_params[2] = NULL;
>>>> +
>>>> +	xe_device_declare_wedged(xe, event_params);
>>>> +}
>>>> +
>>>>  static bool guc_submit_hint_wedged(struct xe_guc *guc)
>>>>  {
>>>>  	struct xe_device *xe = guc_to_xe(guc);
>>>> @@ -901,7 +912,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>>>>  	if (xe_device_wedged(xe))
>>>>  		return true;
>>>>  
>>> i see that this is even called from xe_guc_exec_queue_lr_cleanup which is for long running queue
>>> from various call paths need to check in what scenarios those happen.
>> Should we add a reason for long running queue?
> Both of your questions would probably be answered if this was getting developed
> at the same time of the user space usage of these uevents.

Can't we consider the generic Linux user as a consumer, via udevadm.

Thanks,
Aravind.
>
>> Raag
