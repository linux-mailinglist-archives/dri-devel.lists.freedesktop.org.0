Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866D89B740
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 07:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E8F1120BA;
	Mon,  8 Apr 2024 05:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/uk7c5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34F31120BA;
 Mon,  8 Apr 2024 05:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712555263; x=1744091263;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=dviuG++J2rxAMUsQFEUZixHm6bLk7jbvyHNBbs8ViXs=;
 b=D/uk7c5w20wA2uYMAm9gXhEsRLcInqkWVdRPClROjx2SEfjuyvjFry63
 MrZYNdZxLx924pbr50N5z/mnGcDBVBHCLy1L6V7yw573bfG7uBvhgTgQC
 PhqALukH2fAIAX8fRRd4K0iN317Y7atkllgK/YbuO3hdtn1rENBOVAr9v
 +CpYW18SfTSGKdEV+CIzEDJuJJfIrmv/JPa9k3GCn2pgCM9ZT23wRCqgq
 O9/aYY6BZxBxNgHWPxpHL06O15cRyE0JydXBqnu6KedBNeUD3O7oe06kS
 rYeM4zE7r6uDhgcIYzNMVwm3hM3OhXeTZd4wgX7jyObN1vzexjHOD7jCr g==;
X-CSE-ConnectionGUID: Qlr08vDtQsCfHykACptnTw==
X-CSE-MsgGUID: yp6QCmorSMWcRYg2yD6YXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7998616"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7998616"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 22:47:42 -0700
X-CSE-ConnectionGUID: 9Xhz41K7S3+V2PeakWdZZA==
X-CSE-MsgGUID: e1NspWM+QSeJYY7FhM0wqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24506784"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 22:47:38 -0700
Message-ID: <45e36b75-54c8-45cb-9683-b16faab15833@linux.intel.com>
Date: Mon, 8 Apr 2024 11:20:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/xe: Support PCIe FLR
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
References: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
 <Zg8o2W5whJFJzf8-@intel.com>
 <6cbe2744-d184-4c7b-8972-eb09a87b5295@linux.intel.com>
In-Reply-To: <6cbe2744-d184-4c7b-8972-eb09a87b5295@linux.intel.com>
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


On 05/04/24 10:30, Aravind Iddamsetty wrote:
> On 05/04/24 03:55, Rodrigo Vivi wrote:
>> On Tue, Apr 02, 2024 at 02:28:55PM +0530, Aravind Iddamsetty wrote:
>>> PCI subsystem provides callbacks to inform the driver about a request to
>>> do function level reset by user, initiated by writing to sysfs entry
>>> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>>> without the need to do unbind and rebind as the driver needs to
>>> reinitialize the device afresh post FLR.
>>>
>>> v2:
>> all the patches looks good to me here. feel free to use
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> on them.
> Thank you!
>
>> but I do have some concerns (below)
>>
>>> 1. Directly expose the devm_drm_dev_release_action instead of introducing
>>> a helper (Rodrigo)
>>> 2. separate out gt idle and pci save/restore to a separate patch (Lucas)
>>> 3. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
>> On this I also had to fight to get something working on the wedged_mode=2:
>> lore.kernel.org/all/20240403150732.102678-4-rodrigo.vivi@intel.com
>>
>> perhaps we can unify things here.
> I guess we dealing with different scenarios, in this the warning in xe_guc_submit_stop
> was because not invoking xe_uc_reset_prepare before. and we needn't invoke
> xe_guc_pc_fini as guc is already in stopped.
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>> dmesg snip showing FLR recovery:
>> things came different at my DG2 here with display working and all:
> after you mentioned this i tested on DG2 i got warnings but no segmentation fault
> and NPD, i have tested my branch which might not be update to date, will re test with the
> latest branch.

While I check upon this is it ok to have this version of series to be merged, as I see
even with warnings with display the device and driver are recoverable.

Thanks,
Aravind.
>
>
> Thanks,
> Aravnd.
>> root@rdvivi-desk:/sys/module/xe/drivers/pci:xe/0000:03:00.0# echo 1 > reset
>> Segmentation fault
>>
>> and many kernel warnings
>>  WARNING: CPU: 8 PID: 2389 at drivers/gpu/drm/i915/display/intel_display_power_well.c:281 hsw_wait_for_power_well_enable+0x3e7/0x570 [xe]
>>  WARNING: CPU: 9 PID: 1700 at drivers/gpu/drm/drm_mm.c:999 drm_mm_takedown+0x41/0x60
>>
>> [  117.128330] KASAN: null-ptr-deref in range [0x00000000000004e8-0x00000000000004ef]
>> [  117.128332] CPU: 13 PID: 2389 Comm: bash Tainted: G        W          6.9.0-rc1+ #9
>> [  117.135501]  ? exc_invalid_op+0x13/0x40
>> [  117.143626] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIOS F5 12/17/2021
>> [  117.143627] RIP: 0010:__mutex_lock+0x124/0x14a0
>> [  117.143631] Code: d0 7c 08 84 d2 0f 85 62 0f 00 00 8b 0d 85 c8 8f 04 85 c9 75 29 48 b8 00 00 00 00 00 fc ff df 49 8d 7f 68 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 46 0f 00 00 4d 3b 7f 68 0f 85 aa 0e 00 00 bf 01
>> [  117.150630]  ? asm_exc_invalid_op+0x16/0x20
>> [  117.156401] RSP: 0018:ffffc90005a37690 EFLAGS: 00010202
>> [  117.156403] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
>> [  117.163571]  ? drm_buddy_fini+0x181/0x220
>>
>>
>> and more issues.
>>
>> so it looks like we are still missing some parts of the puzzle here...
>>
>>
>>> [  590.486336] xe 0000:4d:00.0: enabling device (0140 -> 0142)
>>> [  590.506933] xe 0000:4d:00.0: [drm] Using GuC firmware from
>>> xe/pvc_guc_70.20.0.bin version 70.20.0
>>> [  590.542355] xe 0000:4d:00.0: [drm] Using GuC firmware from
>>> xe/pvc_guc_70.20.0.bin version 70.20.0
>>> [  590.578532] xe 0000:4d:00.0: [drm] VISIBLE VRAM: 0x0000202000000000,
>>> 0x0000002000000000
>>> [  590.578556] xe 0000:4d:00.0: [drm] VRAM[0, 0]: Actual physical size
>>> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
>>> accessible size 0x0000000fff000000
>>> [  590.578560] xe 0000:4d:00.0: [drm] VRAM[0, 0]: DPA range:
>>> [0x0000000000000000-1000000000], io range:
>>> [0x0000202000000000-202fff000000]
>>> [  590.578585] xe 0000:4d:00.0: [drm] VRAM[1, 1]: Actual physical size
>>> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
>>> accessible size 0x0000000fff000000
>>> [  590.578589] xe 0000:4d:00.0: [drm] VRAM[1, 1]: DPA range:
>>> [0x0000001000000000-2000000000], io range:
>>> [0x0000203000000000-203fff000000]
>>> [  590.578592] xe 0000:4d:00.0: [drm] Total VRAM: 0x0000202000000000,
>>> 0x0000002000000000
>>> [  590.578594] xe 0000:4d:00.0: [drm] Available VRAM:
>>> 0x0000202000000000, 0x0000001ffe000000
>>> [  590.738899] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  590.889991] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  590.892835] [drm] Initialized xe 1.1.0 20201103 for 0000:4d:00.0 on
>>> minor 1
>>> [  590.900215] xe 0000:9a:00.0: enabling device (0140 -> 0142)
>>> [  590.915991] xe 0000:9a:00.0: [drm] Using GuC firmware from
>>> xe/pvc_guc_70.20.0.bin version 70.20.0
>>> [  590.957450] xe 0000:9a:00.0: [drm] Using GuC firmware from
>>> xe/pvc_guc_70.20.0.bin version 70.20.0
>>> [  590.989863] xe 0000:9a:00.0: [drm] VISIBLE VRAM: 0x000020e000000000,
>>> 0x0000002000000000
>>> [  590.989888] xe 0000:9a:00.0: [drm] VRAM[0, 0]: Actual physical size
>>> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
>>> accessible size 0x0000000fff000000
>>> [  590.989893] xe 0000:9a:00.0: [drm] VRAM[0, 0]: DPA range:
>>> [0x0000000000000000-1000000000], io range:
>>> [0x000020e000000000-20efff000000]
>>> [  590.989918] xe 0000:9a:00.0: [drm] VRAM[1, 1]: Actual physical size
>>> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
>>> accessible size 0x0000000fff000000
>>> [  590.989921] xe 0000:9a:00.0: [drm] VRAM[1, 1]: DPA range:
>>> [0x0000001000000000-2000000000], io range:
>>> [0x000020f000000000-20ffff000000]
>>> [  590.989924] xe 0000:9a:00.0: [drm] Total VRAM: 0x000020e000000000,
>>> 0x0000002000000000
>>> [  590.989927] xe 0000:9a:00.0: [drm] Available VRAM:
>>> 0x000020e000000000, 0x0000001ffe000000
>>> [  591.142061] xe 0000:9a:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  591.293505] xe 0000:9a:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  591.295487] [drm] Initialized xe 1.1.0 20201103 for 0000:9a:00.0 on
>>> minor 2
>>> [  610.685993] Console: switching to colour dummy device 80x25
>>> [  610.686118] [IGT] xe_exec_basic: executing
>>> [  610.755398] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  610.771783] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  610.773542] [IGT] xe_exec_basic: starting subtest once-basic
>>> [  610.960251] [IGT] xe_exec_basic: finished subtest once-basic, SUCCESS
>>> [  610.962741] [IGT] xe_exec_basic: exiting, ret=0
>>> [  610.977203] Console: switching to colour frame buffer device 128x48
>>> [  611.006675] xe_exec_basic (3237) used greatest stack depth: 11128
>>> bytes left
>>> [  644.682201] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  644.699060] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  644.699118] xe 0000:4d:00.0: preparing for PCIe FLR reset
>>> [  644.699149] xe 0000:4d:00.0: [drm] removing device access to
>>> userspace
>>> [  644.928577] xe 0000:4d:00.0: PCI device went through FLR, reenabling
>>> the device
>>> [  656.104233] xe 0000:4d:00.0: [drm] Using GuC firmware from
>>> xe/pvc_guc_70.20.0.bin version 70.20.0
>>> [  656.149525] xe 0000:4d:00.0: [drm] Using GuC firmware from
>>> xe/pvc_guc_70.20.0.bin version 70.20.0
>>> [  656.182711] xe 0000:4d:00.0: [drm] VISIBLE VRAM: 0x0000202000000000,
>>> 0x0000002000000000
>>> [  656.182737] xe 0000:4d:00.0: [drm] VRAM[0, 0]: Actual physical size
>>> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
>>> accessible size 0x0000000fff000000
>>> [  656.182742] xe 0000:4d:00.0: [drm] VRAM[0, 0]: DPA range:
>>> [0x0000000000000000-1000000000], io range:
>>> [0x0000202000000000-202fff000000]
>>> [  656.182768] xe 0000:4d:00.0: [drm] VRAM[1, 1]: Actual physical size
>>> 0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
>>> accessible size 0x0000000fff000000
>>> [  656.182772] xe 0000:4d:00.0: [drm] VRAM[1, 1]: DPA range:
>>> [0x0000001000000000-2000000000], io range:
>>> [0x0000203000000000-203fff000000]
>>> [  656.182775] xe 0000:4d:00.0: [drm] Total VRAM: 0x0000202000000000,
>>> 0x0000002000000000
>>> [  656.182778] xe 0000:4d:00.0: [drm] Available VRAM:
>>> 0x0000202000000000, 0x0000001ffe000000
>>> [  656.348657] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  656.507619] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  656.510848] [drm] Initialized xe 1.1.0 20201103 for 0000:4d:00.0 on
>>> minor 1
>>> [  665.754402] Console: switching to colour dummy device 80x25
>>> [  665.754484] [IGT] xe_exec_basic: executing
>>> [  665.805853] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  665.819825] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
>>> num_engines:1, num_slices:4
>>> [  665.820359] [IGT] xe_exec_basic: starting subtest once-basic
>>> [  665.968899] [IGT] xe_exec_basic: finished subtest once-basic, SUCCESS
>>> [  665.969534] [IGT] xe_exec_basic: exiting, ret=0
>>> [  665.981027] Console: switching to colour frame buffer device 128x48
>>>
>>>
>>> Aravind Iddamsetty (4):
>>>   drm: add devm release action
>>>   drm/xe: Save and restore PCI state
>>>   drm/xe: Extract xe_gt_idle() helper
>>>   drm/xe/FLR: Support PCIe FLR
>>>
>>>  drivers/gpu/drm/drm_drv.c            |  6 ++
>>>  drivers/gpu/drm/xe/Makefile          |  1 +
>>>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++
>>>  drivers/gpu/drm/xe/xe_gt.c           | 31 +++++++---
>>>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>>>  drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>>>  drivers/gpu/drm/xe/xe_pci.c          | 57 +++++++++++++++--
>>>  drivers/gpu/drm/xe/xe_pci.h          |  6 +-
>>>  drivers/gpu/drm/xe/xe_pci_err.c      | 93 ++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>>>  include/drm/drm_drv.h                |  2 +
>>>  11 files changed, 205 insertions(+), 15 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
>>>
>>> -- 
>>> 2.25.1
>>>
