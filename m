Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66F951B17
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 14:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2398110E468;
	Wed, 14 Aug 2024 12:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWFiGO3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C07D10E468;
 Wed, 14 Aug 2024 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723639568; x=1755175568;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1LFzHv1EgAsODIk8cUxn3A6wKs7cDu8hN7kzemot/Us=;
 b=DWFiGO3hH/j3+9XpKp6aBNWp68VJQoqnkziZXSnDtgBMV+o9IrYC/VV9
 NxZ4CiIuS2DQBavREajz5ilzuBqc9sJUlHmdYsw6lOTjN06GyeSrA1jxH
 RMUeRYuxGqoB/Vz22ns4NEdlIX8vnLCH278YiSfXEiXawUdw5aiEjnres
 txWeK5WQMZVVQN7Wpkpv2K4eiMjR00gLKvh6tak8MZ4DXcb8uFXq2QeEO
 ceVT/nvzaMpFOrzGS4JgfUBgqCR5UGeWbRrv37KqqU1SB+qkkUvWrEv+J
 lOC9npfsUHq0y6RKByfwj7n8l+mvBFzVdh0MOw+29DjegFnNj6I0+w7Gg g==;
X-CSE-ConnectionGUID: +kJi9aiqTCGTLSaOWXrvIQ==
X-CSE-MsgGUID: xduHxnFhRHWROJiKg98NAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39303656"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="39303656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 05:46:08 -0700
X-CSE-ConnectionGUID: NyWnuxwCRvqNQEp/bc4YtA==
X-CSE-MsgGUID: udnj1nMVTaKmYrxYBlXvtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="89701917"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 05:46:05 -0700
Message-ID: <319e05a2-ac54-44f9-8e8e-d806f0c6abbf@linux.intel.com>
Date: Wed, 14 Aug 2024 18:19:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
To: Raag Jadav <raag.jadav@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, anshuman.gupta@intel.com
References: <20240812074812.1457164-1-raag.jadav@intel.com>
 <801bf720-6131-489c-8440-34d2267fe73b@linux.intel.com>
 <ZrtfgGY1YFr22Pg9@black.fi.intel.com> <ZruPtcniJzXOlumA@intel.com>
 <deb48edf-0a35-49bf-a4b3-b7d60f127b44@linux.intel.com>
 <Zrx1E-Xd1bAl5kBw@black.fi.intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <Zrx1E-Xd1bAl5kBw@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 14/08/24 14:42, Raag Jadav wrote:
> On Wed, Aug 14, 2024 at 12:16:41PM +0530, Aravind Iddamsetty wrote:
>> On 13/08/24 22:24, Rodrigo Vivi wrote:
>>> On Tue, Aug 13, 2024 at 04:28:32PM +0300, Raag Jadav wrote:
>>>> On Mon, Aug 12, 2024 at 03:08:14PM +0530, Aravind Iddamsetty wrote:
>>>>> On 12/08/24 13:18, Raag Jadav wrote:
>>>>>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>
>>>>>> This was dropped in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset
>>>>>> uevent for now") as part of refactoring.
>>>>>>
>>>>>> Now that we have better uapi semantics and naming for the uevent,
>>>>>> bring it back. With this in place, userspace will be notified of
>>>>>> wedged device along with its reason.
>>>>>>
>>>>>> $ udevadm monitor --property --kernel
>>>>>> monitor will print the received events for:
>>>>>> KERNEL - the kernel uevent
>>>>>>
>>>>>> KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
>>>>>> ACTION=change
>>>>>> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
>>>>>> SUBSYSTEM=pci
>>>>>> DEVICE_STATUS=NEEDS_RESET
>>>>>> REASON=GT_RESET_FAILED
>>>>>> TILE_ID=0
>>>>>> GT_ID=0
>>>>>> DRIVER=xe
>>>>>> PCI_CLASS=30000
>>>>>> PCI_ID=8086:56B1
>>>>>> PCI_SUBSYS_ID=8086:1210
>>>>>> PCI_SLOT_NAME=0000:03:00.0
>>>>>> MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
>>>>>> SEQNUM=6104
>>>>>>
>>>>>> v2: Change authorship to Himal (Aravind)
>>>>>>     Add uevent for all device wedged cases (Aravind)
>>>>>>
>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/xe/xe_device.c     | 10 +++++++++-
>>>>>>  drivers/gpu/drm/xe/xe_device.h     |  2 +-
>>>>>>  drivers/gpu/drm/xe/xe_gt.c         | 23 +++++++++++++++++++----
>>>>>>  drivers/gpu/drm/xe/xe_guc.c        | 13 ++++++++++++-
>>>>>>  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
>>>>>>  include/uapi/drm/xe_drm.h          | 29 +++++++++++++++++++++++++++++
>>>>>>  6 files changed, 82 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>>>> index 1aba6f9eaa19..d975bdce4a7d 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>> @@ -955,6 +955,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>>>  /**
>>>>>>   * xe_device_declare_wedged - Declare device wedged
>>>>>>   * @xe: xe device instance
>>>>>> + * @event_params: parameters to be sent along with uevent
>>>>>>   *
>>>>>>   * This is a final state that can only be cleared with a mudule
>>>>>>   * re-probe (unbind + bind).
>>>>>> @@ -965,8 +966,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>>>>>   * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>>>>>>   * snapshot capture. In this mode, GT reset won't be attempted so the state of
>>>>>>   * the issue is preserved for further debugging.
>>>>>> + * Caller is expected to pass respective parameters to be sent along with
>>>>>> + * uevent. Pass NULL in case of no params.
>>>>>>   */
>>>>>> -void xe_device_declare_wedged(struct xe_device *xe)
>>>>>> +void xe_device_declare_wedged(struct xe_device *xe, char **event_params)
>>>>>>  {
>>>>>>  	struct xe_gt *gt;
>>>>>>  	u8 id;
>>>>>> @@ -984,12 +987,17 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>>>>  	xe_pm_runtime_get_noresume(xe);
>>>>>>  
>>>>>>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>>>>> +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>> +
>>>>>>  		xe->needs_flr_on_fini = true;
>>>>>>  		drm_err(&xe->drm,
>>>>>>  			"CRITICAL: Xe has declared device %s as wedged.\n"
>>>>>>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>>>>>>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>>>>>>  			dev_name(xe->drm.dev));
>>>>>> +
>>>>>> +		/* Notify userspace about reset required */
>>>>>> +		kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, event_params);
>>>>>>  	}
>>>>>>  
>>>>>>  	for_each_gt(gt, xe, id)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>>>> index db6cc8d0d6b8..5d40fc6f0904 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>>>> @@ -174,7 +174,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>>>>>  	return atomic_read(&xe->wedged.flag);
>>>>>>  }
>>>>>>  
>>>>>> -void xe_device_declare_wedged(struct xe_device *xe);
>>>>>> +void xe_device_declare_wedged(struct xe_device *xe, char **reset_event);
>>>>>>  
>>>>>>  struct xe_file *xe_file_get(struct xe_file *xef);
>>>>>>  void xe_file_put(struct xe_file *xef);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>>> index 58895ed22f6e..519f3c2cf9e2 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>>> @@ -741,6 +741,24 @@ static int do_gt_restart(struct xe_gt *gt)
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> +static void xe_gt_reset_failed(struct xe_gt *gt, int err)
>>>>>> +{
>>>>>> +	char *event_params[5];
>>>>>> +
>>>>>> +	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>>>>> +
>>>>>> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>>>>>> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
>>>>>> +	event_params[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", gt_to_tile(gt)->id);
>>>>>> +	event_params[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt->info.id);
>>>>> the TILE_ID and GT_ID can be passed for other events as well, with that you can
>>>>> have a common function to send uevent which would take reason as an input.
>>>> But is that required for all cases? There could be potential cases atleast
>>>> in the future where it is not needed.
>>
>> At least in these cases it makes sense as they (other reasons)
>> can be associated to a GT and a Tile. If in future they arises a
>> reason where these details are not needed i guess we can handle that.
> But then we'll have to modify it with every new addition, which doesn't
> look like a win. With current implementation the callers atleast have
> the autonomy to send params as-needed.

My intention is to have a common code at least for these events
as much as possible as all the fields are same except reason.

The only place in future that might not have a tile or gt is 
for gobal (entire device) level event for that I thought we 
can have a check based on reason type. Otherwise most of the 
reasons can be associated to a Tile or a GT.

Thanks,
Aravind,
>
> Raag
