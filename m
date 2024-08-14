Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57295951771
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8C10E446;
	Wed, 14 Aug 2024 09:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L40W6ka4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AEE10E446;
 Wed, 14 Aug 2024 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723626779; x=1755162779;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b/QTqVFmGCLtCcOSp73NGjl9YqYR33hUlqohTYUI1CM=;
 b=L40W6ka4ElXK/UmTpp09nA1c54gsN/EbWMhKDL+Q833quoU5ASXEXKer
 5wCNPKi/l9SjXi3qA+0Yu4cLnOIZ2gOre6ofvulxh5rWfgAK7dE+9iKfJ
 nQmzC5nwyh2G+WwHjYT/E1JsT0WXiB8QP1Lmj0Q0EpRUtd0uTBkFntZkm
 JJsqFjHoRZsTRSOr9mAQTsY6vo/sjos2xRhUX1uXwM2srxmcqv8WqJL1W
 eQcU5+lBycM8f5/IjicjHB7wxjrJ9r+aq+qfim880thS6nzNIyE1EIa5W
 l2obBRtvYkK7vFL0IVmuz18yx/riM5fYDrjnlO8DcD0x5uneZ0Ct84rx3 A==;
X-CSE-ConnectionGUID: MxkFr0fpTvqRGmSRzJcH3g==
X-CSE-MsgGUID: 3r+IhrBWR+GBHVyjfqNL3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32974095"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="32974095"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:12:59 -0700
X-CSE-ConnectionGUID: 4Rb8TXWARyK8OczE0sqXww==
X-CSE-MsgGUID: K0MSAYQrQP+Xog0lnt0N7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="89643951"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:12:55 -0700
Date: Wed, 14 Aug 2024 12:12:51 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, anshuman.gupta@intel.com
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
Message-ID: <Zrx1E-Xd1bAl5kBw@black.fi.intel.com>
References: <20240812074812.1457164-1-raag.jadav@intel.com>
 <801bf720-6131-489c-8440-34d2267fe73b@linux.intel.com>
 <ZrtfgGY1YFr22Pg9@black.fi.intel.com> <ZruPtcniJzXOlumA@intel.com>
 <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
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

On Wed, Aug 14, 2024 at 12:16:41PM +0530, Aravind Iddamsetty wrote:
>
>On 13/08/24 22:24, Rodrigo Vivi wrote:
>> On Tue, Aug 13, 2024 at 04:28:32PM +0300, Raag Jadav wrote:
>>> On Mon, Aug 12, 2024 at 03:08:14PM +0530, Aravind Iddamsetty wrote:
>>>> On 12/08/24 13:18, Raag Jadav wrote:
>>>>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>
>>>>> This was dropped in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset
>>>>> uevent for now") as part of refactoring.
>>>>>
>>>>> Now that we have better uapi semantics and naming for the uevent,
>>>>> bring it back. With this in place, userspace will be notified of
>>>>> wedged device along with its reason.
>>>>>
>>>>> $ udevadm monitor --property --kernel
>>>>> monitor will print the received events for:
>>>>> KERNEL - the kernel uevent
>>>>>
>>>>> KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
>>>>> ACTION=change
>>>>> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
>>>>> SUBSYSTEM=pci
>>>>> DEVICE_STATUS=NEEDS_RESET
>>>>> REASON=GT_RESET_FAILED
>>>>> TILE_ID=0
>>>>> GT_ID=0
>>>>> DRIVER=xe
>>>>> PCI_CLASS=30000
>>>>> PCI_ID=8086:56B1
>>>>> PCI_SUBSYS_ID=8086:1210
>>>>> PCI_SLOT_NAME=0000:03:00.0
>>>>> MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
>>>>> SEQNUM=6104
>>>>>
>>>>> v2: Change authorship to Himal (Aravind)
>>>>>     Add uevent for all device wedged cases (Aravind)
>>>>>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_device.c     | 10 +++++++++-
>>>>>  drivers/gpu/drm/xe/xe_device.h     |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_gt.c         | 23 +++++++++++++++++++----
>>>>>  drivers/gpu/drm/xe/xe_guc.c        | 13 ++++++++++++-
>>>>>  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
>>>>>  include/uapi/drm/xe_drm.h          | 29 +++++++++++++++++++++++++++++
>>>>>  6 files changed, 82 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>>> index 1aba6f9eaa19..d975bdce4a7d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>> @@ -955,6 +955,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>>  /**
>>>>>   * xe_device_declare_wedged - Declare device wedged
>>>>>   * @xe: xe device instance
>>>>> + * @event_params: parameters to be sent along with uevent
>>>>>   *
>>>>>   * This is a final state that can only be cleared with a mudule
>>>>>   * re-probe (unbind + bind).
>>>>> @@ -965,8 +966,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>>   * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>>>>>   * snapshot capture. In this mode, GT reset won't be attempted so the state of
>>>>>   * the issue is preserved for further debugging.
>>>>> + * Caller is expected to pass respective parameters to be sent along with
>>>>> + * uevent. Pass NULL in case of no params.
>>>>>   */
>>>>> -void xe_device_declare_wedged(struct xe_device *xe)
>>>>> +void xe_device_declare_wedged(struct xe_device *xe, char **event_params)
>>>>>  {
>>>>>  	struct xe_gt *gt;
>>>>>  	u8 id;
>>>>> @@ -984,12 +987,17 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>>>  	xe_pm_runtime_get_noresume(xe);
>>>>>  
>>>>>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>>>> +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>> +
>>>>>  		xe->needs_flr_on_fini = true;
>>>>>  		drm_err(&xe->drm,
>>>>>  			"CRITICAL: Xe has declared device %s as wedged.\n"
>>>>>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>>>>>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>>>>>  			dev_name(xe->drm.dev));
>>>>> +
>>>>> +		/* Notify userspace about reset required */
>>>>> +		kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, event_params);
>>>>>  	}
>>>>>  
>>>>>  	for_each_gt(gt, xe, id)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>>> index db6cc8d0d6b8..5d40fc6f0904 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>>> @@ -174,7 +174,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>>>>  	return atomic_read(&xe->wedged.flag);
>>>>>  }
>>>>>  
>>>>> -void xe_device_declare_wedged(struct xe_device *xe);
>>>>> +void xe_device_declare_wedged(struct xe_device *xe, char **reset_event);
>>>>>  
>>>>>  struct xe_file *xe_file_get(struct xe_file *xef);
>>>>>  void xe_file_put(struct xe_file *xef);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index 58895ed22f6e..519f3c2cf9e2 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -741,6 +741,24 @@ static int do_gt_restart(struct xe_gt *gt)
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> +static void xe_gt_reset_failed(struct xe_gt *gt, int err)
>>>>> +{
>>>>> +	char *event_params[5];
>>>>> +
>>>>> +	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>>>> +
>>>>> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>>>>> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
>>>>> +	event_params[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", gt_to_tile(gt)->id);
>>>>> +	event_params[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt->info.id);
>>>> the TILE_ID and GT_ID can be passed for other events as well, with that you can
>>>> have a common function to send uevent which would take reason as an input.
>>> But is that required for all cases? There could be potential cases atleast
>>> in the future where it is not needed.
> 
> 
> At least in these cases it makes sense as they (other reasons)
> can be associated to a GT and a Tile. If in future they arises a
> reason where these details are not needed i guess we can handle that.

But then we'll have to modify it with every new addition, which doesn't
look like a win. With current implementation the callers atleast have
the autonomy to send params as-needed.

Raag
