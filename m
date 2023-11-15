Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AF7EBFE8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7286710E51E;
	Wed, 15 Nov 2023 10:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EC010E51C;
 Wed, 15 Nov 2023 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700042444; x=1731578444;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=U8tBVasnRY9rmC5uGgbs4Ycf6EVax/i//AZ0mNG5cAw=;
 b=DzVggsIUw9ZcxrynPydlKP5lJNViS8cbU963I0H2qS8gPx3zERjGz4qM
 m/9vWeXoPahsXLxw/TuWYdrz7MpzbWNoFXgMO2ki6PE13gFSQ5fuOESW+
 w7Yx429/acpzNZpYkWbd6aMj6kCTMYWVTHsiPSyXTKTo/MtR4DlzK2ZFs
 kjFgSTpnEwxG68sFUl5HaSWsdu821GTE0Jvxeyr4oYsVPF91JlUuqadf5
 ySyjnCPfeWCKtYcZjMfTk2hCiaSU/lZ5W/z5w0p/kb7HV0JEtovCyZhNu
 lE6aRBMLyk/viTCuu+8+E08svJBLWgd2LwZrRTK37CxUwbRmKTo2G7b41 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370196055"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="370196055"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 02:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855606094"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="855606094"
Received: from jcornall-mobl3.ger.corp.intel.com (HELO [10.213.211.209])
 ([10.213.211.209])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 02:00:40 -0800
Message-ID: <9142e0f2-a4ae-4eb7-8280-25d797810dd5@linux.intel.com>
Date: Wed, 15 Nov 2023 10:00:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/doc/rfc: SR-IOV support on the new Xe driver
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231110182231.1730-1-michal.wajdeczko@intel.com>
 <a2f1748f-e6d9-473f-943f-6f709f15282f@linux.intel.com>
 <a3569132-0372-41d8-9add-db291d25a27b@intel.com>
Content-Language: en-US
Organization: Intel Corporation UK Plc
In-Reply-To: <a3569132-0372-41d8-9add-db291d25a27b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/11/2023 16:55, Michal Wajdeczko wrote:
> On 14.11.2023 13:37, Tvrtko Ursulin wrote:
>> On 10/11/2023 18:22, Michal Wajdeczko wrote:
>>> The Single Root I/O Virtualization (SR-IOV) extension to the PCI
>>> Express (PCIe) specification suite is supported starting from 12th
>>> generation of Intel Graphics processors.
>>>
>>> This RFC aims to explain how do we want to add support for SR-IOV
>>> to the new Xe driver and to propose related additions to the sysfs.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> ---
>>>    Documentation/gpu/rfc/index.rst             |   5 +
>>>    Documentation/gpu/rfc/sysfs-driver-xe-sriov | 501 ++++++++++++++++++++
>>>    Documentation/gpu/rfc/xe_sriov.rst          | 192 ++++++++
>>>    3 files changed, 698 insertions(+)
>>>    create mode 100644 Documentation/gpu/rfc/sysfs-driver-xe-sriov
>>>    create mode 100644 Documentation/gpu/rfc/xe_sriov.rst
>>>
>>> diff --git a/Documentation/gpu/rfc/index.rst
>>> b/Documentation/gpu/rfc/index.rst
>>> index e4f7b005138d..fc5bc447f30d 100644
>>> --- a/Documentation/gpu/rfc/index.rst
>>> +++ b/Documentation/gpu/rfc/index.rst
>>> @@ -35,3 +35,8 @@ host such documentation:
>>>    .. toctree::
>>>         xe.rst
>>> +
>>> +.. toctree::
>>> +   :maxdepth: 1
>>> +
>>> +   xe_sriov.rst
>>> diff --git a/Documentation/gpu/rfc/sysfs-driver-xe-sriov
>>> b/Documentation/gpu/rfc/sysfs-driver-xe-sriov
>>> new file mode 100644
>>> index 000000000000..77748204dd83
>>> --- /dev/null
>>> +++ b/Documentation/gpu/rfc/sysfs-driver-xe-sriov
>>> @@ -0,0 +1,501 @@
>>> +﻿.. Documentation/ABI/testing/sysfs-driver-xe-sriov
>>> +..
>>> +.. Intel Xe driver ABI (SR-IOV extensions)
>>> +..
>>> +    The Single Root I/O Virtualization (SR-IOV) extension to
>>> +    the PCI Express (PCIe) specification suite is supported
>>> +    starting from 12th generation of Intel Graphics processors.
>>> +
>>> +    This document describes Xe driver specific additions.
>>> +
>>> +    For description of generic SR-IOV sysfs attributes see
>>> +    "Documentation/ABI/testing/sysfs-bus-pci" document.
>>> +
>>> +    /sys/bus/pci/drivers/xe/BDF/
>>> +    ├── sriov_auto_provisioning
>>> +    │   ├── admin_mode
>>> +    │   ├── enabled
>>> +    │   ├── reset_defaults
>>> +    │   ├── resources
>>> +    │   │   ├── default_contexts_quota
>>> +    │   │   ├── default_doorbells_quota
>>> +    │   │   ├── default_ggtt_quota
>>> +    │   │   └── default_lmem_quota
>>> +    │   ├── scheduling
>>> +    │   │   ├── default_exec_quantum_ms
>>> +    │   │   └── default_preempt_timeout_us
>>> +    │   └── monitoring
>>> +    │       ├── default_cat_error_count
>>> +    │       ├── default_doorbell_time_us
>>> +    │       ├── default_engine_reset_count
>>> +    │       ├── default_h2g_time_us
>>> +    │       ├── default_irq_time_us
>>> +    │       └── default_page_fault_count
>>
>>  From the department of bike-shedding, one alternative could be to have a
>> directory called defaults which avoids having to have the default_
>> prefix on everything under it.
> 
> like this ?
> 
>      /sys/bus/pci/drivers/xe/BDF/
>      ├── sriov_auto_provisioning
>      │   ├── admin_mode
>      │   ├── enabled
>      │   └── defaults
>      │       ├── resources
>      │       │   ├── contexts_quota
>      │       │   ├── doorbells_quota
>      │       │   ├── ggtt_quota
>      │       │   └── lmem_quota
>      │       ├── scheduling
>      │       │   ├── exec_quantum_ms
>      │       │   └── preempt_timeout_us
>      │       └── monitoring
>      │           ├── cat_error_count
>      │           ├── doorbell_time_us
>      │           ├── engine_reset_count
>      │           ├── h2g_time_us
>      │           ├── irq_time_us
>      │           └── page_fault_count

Looks better to me but it may be just a matter of taste so I was just 
roughly outlining an alternative.

>>
>>> +
>>> +    /sys/bus/pci/drivers/xe/BDF/
>>> +    ├── sriov_extensions
>>
>> Should this be xe_sriov_extensions or if not doesn't it need agreement
>> to reserve the keyword in Documentation/ABI/testing/sysfs-bus-pci?
>> Sriov_auto_provisioning too I guess.
> 
> I didn't spot in ABI documents any driver specific additions to device
> that were using extra prefix, nor the "reservation" placeholders.
> 
> but if we want to go with a prefix, then maybe all our additions at
> device level should have one, including already added tileT:
> 
> 	tile0 -> xe_tile0
> 
> or even to match existing mei file we should use "xe." prefix instead:
> 
> 	xe.sriov_auto_provisioning
> 	xe.sriov_extension
> 	xe.tile0
> 	xe.mei-gsc...

I don't know really - I assumed since there are common sriov_ prefix 
controls at the PCI level, that adding driver specific things using the 
same namespace might require agreement from the PCI core folks. Perhaps 
a topic to consult the respestive mailing list(s).

>>> +    │   ├── monitoring_period_ms
>>> +    │   ├── strict_scheduling_enabled
>>> +    │   ├── pf
>>> +    │   │   ├── device -> ../../../BDF
>>> +    │   │   ├── priority
>>> +    │   │   ├── tile0
>>> +    │   │   │   ├── gt0
>>> +    │   │   │   │   ├── exec_quantum_ms
>>> +    │   │   │   │   ├── preempt_timeout_us
>>> +    │   │   │   │   └── thresholds
>>> +    │   │   │   │       ├── cat_error_count
>>> +    │   │   │   │       ├── doorbell_time_us
>>> +    │   │   │   │       ├── engine_reset_count
>>> +    │   │   │   │       ├── h2g_time_us
>>> +    │   │   │   │       ├── irq_time_us
>>> +    │   │   │   │       └── page_fault_count
>>> +    │   │   │   └── gtX
>>> +    │   │   └── tileT
>>> +    │   ├── vf1
>>> +    │   │   ├── device -> ../../../BDF+1
>>> +    │   │   ├── stop
>>> +    │   │   ├── tile0
>>> +    │   │   │   ├── ggtt_quota
>>> +    │   │   │   ├── lmem_quota
>>> +    │   │   │   ├── gt0
>>> +    │   │   │   │   ├── contexts_quota
>>> +    │   │   │   │   ├── doorbells_quota
>>> +    │   │   │   │   ├── exec_quantum_ms
>>> +    │   │   │   │   ├── preempt_timeout_us
>>> +    │   │   │   │   └── thresholds
>>> +    │   │   │   │       ├── cat_error_count
>>> +    │   │   │   │       ├── doorbell_time_us
>>> +    │   │   │   │       ├── engine_reset_count
>>> +    │   │   │   │       ├── h2g_time_us
>>> +    │   │   │   │       ├── irq_time_us
>>> +    │   │   │   │       └── page_fault_count
>>> +    │   │   │   └── gtX
>>> +    │   │   └── tileT
>>> +    │   └── vfN
>>> +..
>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This directory appears on the device when:
>>> +
>>> +         - device supports SR-IOV, and
>>> +         - device is a Physical Function (PF), and
>>> +         - xe driver supports SR-IOV PF on given device, and
>>> +         - xe driver supports automatic VFs provisioning.
>>> +
>>> +        This directory is used as a root for all attributes related to
>>> +        automatic provisioning of SR-IOV Physical Function (PF) and/or
>>> +        Virtual Functions (VFs).
>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/enabled
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (RW) bool (0, 1)
>>> +
>>> +        This file represents configuration flag for the automatic VFs
>>> +        (un)provisioning that could be performed by the PF.
>>> +
>>> +        The default value is 1 (true).
>>> +
>>> +        This flag can be set to false, unless manual provisioning is not
>>> +        applicable for given platform or it is not supported by current
>>> +        PF implementation. In such cases -EPERM will be returned.
>>> +
>>> +        This flag will be automatically set to false when there will be
>>> +        other attempts to change any of VF's resource provisioning.
>>> +        See "sriov_extensions" section for details.
>>> +
>>> +        This flag can be set back to true if and only if all VFs are
>>> +        fully unprovisioned, otherwise -EEXIST error will be returned.
>>> +
>>> +        false = "disabled"
>>> +            When disabled, then PF will not attempt to do automatic
>>> +            VFs provisioning when VFs are being enabled and will not
>>> +            perform automatic unprovisioning of the VFs when VFs will
>>> +            be disabled.
>>> +
>>> +        true = "enabled"
>>> +            When enabled, then on VFs enabling PF will do automatic
>>> +            VFs provisioning based on the default settings described
>>> +            below.
>>> +
>>> +            If automatic VFs provisioning fails due to some reasons,
>>> +            then VFs will not be enabled.
>>> +
>>> +            If enabled, all resources allocated during VFs enabling
>>> +            will be released during VFs disabling (automatic
>>> unprovisioning).
>>> +
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/admin_mode
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (RW) bool (0, 1)
>>> +
>>> +        This file represents configuration flag for the automatic VFs
>>> +        provisioning that could be performed by the PF.
>>> +
>>> +        The default value depends on the platform type.
>>> +
>>> +        This flag can be changed any time, but will have no effect if
>>> +        VFs are already provisioned.
>>> +
>>> +        If enabled (default on discrete platforms) then the PF will
>>> +        retain only minimum hardcoded resources for its own use when
>>> +        doing VFs automatic provisioning and will not use any default
>>> +        values described below for its own configuration.
>>> +
>>> +        If disabled (default on integrated platforms) then the PF will
>>> +        treat itself like yet another additional VF in all fair resource
>>> +        allocations and will also try to apply default provisioning
>>> +        values described below for its own configuration.
>>> +
>>
>> One alternative could be to expose two sets of defaults, the PF and VF
>> ones. With the advantage of allowing the "admin mode" / "minimal PF" to
>> be explicitly configurable instead of hardcoded. Should be more flexible.
> 
> but this "admin_mode" is supposed to be configurable, only default
> setting will depend on the platform.
> 
> the only "hardcoded" values will be what is needed (or already used) by
> the PF for it's basic operations (load firmwares, communication, clears)
> 
> also note that when running in "minimal PF" mode then "defaults" are not
> applicable to the PF, as PF is not treated like a VF, and IMO any
> customization of PF scheduling parameters should be done directly using
> "sriov_extensions/pf/tile/gt/*" attributes, not inside
> "auto_provisioning/defaults"
> 
> only in "non-admin-mode" the PF will benefit from the default
> scheduling/monitoring attributes, as then it will be treated as "yet
> another VF"
> 
> regarding regular resources, PF will always be able to use what was not
> allocated to other VFs (as primary goal is to have equal allocations on
> each VF, PF will take any remaining anyway)

Right, I was simply suggesting to allow configuring this hardcoded 
"minimal" PF mode by exposing a second set of tunables. So that they 
don't have to be hardcoded but users can set up the parameters for their 
own "admin mode". I was not suggesting not having the admin_mode boolean 
control. But maybe it is not even needed? Maybe it would work to allow 
individual "reserve for PF" resources be individually controlled at runtime?

>> If the discrete vs integrated distinction is wanted it could simply be
>> made by initialy populating (driver init) the respective defaults based
>> on the platform type.
>>
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/reset_defaults
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (WO) bool (1)
>>> +
>>> +        Writing to this file will reset all default provisioning
>>> parameters
>>> +        listed below to the default values.
>>
>> Maybe this isn't required if you can say it is the responsibility of
>> whoever changes the defaults to either know what they are doing, or to
>> save and restore themselves if they. It is not a major concern but if
>> writing kernel code can be avoided perhaps it can be considered.
> 
> true, it's optional, added only as a way to make sure no residual
> changes impacts new auto-provisioning (without it we will have to ask to
> reload the driver)

Why reload? If someone modified the defaults they can restore it, if so 
they want. If they can't, tough luck to them.

> 
>>
>>> +
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_contexts_quota
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_doorbells_quota
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_ggtt_quota
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_lmem_quota
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/scheduling/default_exec_quantum_ms
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/scheduling/default_preempt_timeout_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_cat_error_count
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_doorbell_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_engine_reset_count
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_h2g_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_irq_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_page_fault_count
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        These files represent default provisioning that should be used
>>> +        for VFs automatic provisioning.
>>> +
>>> +        These values can be changed any time, but will have no effect if
>>> +        VFs are already provisioned.
>>> +
>>> +        default_contexts_quota: (RW) integer 0..U32_MAX
>>> +            The number of GuC context IDs to provide to the VF.
>>> +            The default value is 0 (use fair allocations).
>>> +            See "sriov_extensions/vfN/tileT/gtX/contexts_quota" for
>>> details.
>>> +
>>> +        default_doorbells_quota: (RW) integer 0..U32_MAX
>>> +            The number of GuC doorbells to provide to the VF.
>>> +            The default value is 0 (use fair allocations).
>>> +            See "sriov_extensions/vfN/tileT/gtX/doorbells_quota" for
>>> details.
>>> +
>>> +        default_ggtt_quota: (RW) integer 0..U32_MAX
>>> +            The size of the GGTT address space (in bytes) to provide
>>> to the VF.
>>> +            The default value is 0 (use fair allocations).
>>> +            See "sriov_extensions/vfN/tileT/ggtt_quota" for details.
>>> +
>>> +        default_lmem_quota: (RW) integer 0..U32_MAX
>>> +            The size of the LMEM (in bytes) to provide to the VF.
>>> +            The default value is 0 (use fair allocations).
>>> +            See "sriov_extensions/vfN/tileT/lmem_quota" for details.
>>> +
>>> +        default_exec_quantum_ms: (RW) integer 0..U32_MAX
>>> +            The GT execution quantum (in millisecs) assigned to the
>>> function.
>>> +            The default value is 0 (infinify).
>>> +            See "sriov_extensions/vfN/tileT/gtX/exec_quantum_ms" for
>>> details.
>>> +
>>> +        default_preempt_timeout_us: (RW) integer 0..U32_MAX
>>> +            The GT preemption timeout (in microsecs) assigned to the
>>> function.
>>> +            The default value is 0 (infinity).
>>> +            See "sriov_extensions/vfN/tileT/gtX/preempt_timeout_us"
>>> for details.
>>
>> I have a slight concern here on the usability of GuC specific tunables.
>>
>> Whereas one can imagine an external entity (some admin, somewhere) to
>> probably pretty much understand what it means to partition the local
>> memory, address space, and set the scheduling timeouts (all are intuitve
>> and obvious concepts), how are they suppose to approach the GuC
>> doorbells and contexts?
> 
> GuC submission is mandatory for SRIOV feature to work and both GuC
> doorbells and contexts IDs are almost the same kind of resources like
> memory or address space.

What does a random server admin do with them? When are they supposed to 
change them and with what considerations and parameters? Maybe this 
document is not the place to explain that but presumable it has to be 
somewhere otherwise it is an unusable part of the ABI.

> but agree, they might be not something that were highly visible (on
> Linux we don't use doorbells at all, and we had 64K of contexts so never
> worried about running out of them).
> 
>>
>> It could be a matter of adding more documentation for those two, or it
>> even could make sense to shove them under a guc prefix (or
>> subdirectory?) to signify the fact they are implementation details and
>> not a fundamental concept.
> 
> IMO "guc_" prefix would be better, as with yet another subdirectory we
> might have too complex structure and GuC stuff is to some extend a
> "fundamental concept" for current platforms.
> 
>>
>>> +
>>> +        default_cat_error_count: (RW) integer 0..U32_MAX
>>> +        default_doorbell_time_us: (RW) integer 0..U32_MAX
>>> +        default_engine_reset_count: (RW) integer 0..U32_MAX
>>> +        default_h2g_time_us: (RW) integer 0..U32_MAX
>>> +        default_irq_time_us: (RW) integer 0..U32_MAX
>>> +        default_page_fault_count: (RW) integer 0..U32_MAX
>>> +            The monitoring threshold to be set for the function.
>>> +            The default value is 0 (don't monitor).
>>> +            See "sriov_extensions/vfN/tileT/gtX/thresholds" for details.
>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This directory appears on Xe device when:
>>> +
>>> +         - device supports SR-IOV, and
>>> +         - device is a Physical Function (PF), and
>>> +         - driver is enabled to support SR-IOV PF on given device.
>>> +
>>> +        This directory is used as a root for all attributes required to
>>> +        manage both Physical Function (PF) and Virtual Functions (VFs).
>>> +
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/strict_scheduling_enabled
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (RW) bool
>>> +
>>> +        This file represents a flag used to determine if scheduling
>>> +        parameters should be respected even if there is no active
>>> +        workloads submitted by the PF or VFs.
>>> +
>>> +        This flag is disabled by default, unless strict scheduling is
>>> +        not applicable on given platform. In such case this file will
>>> +        be read-only.
>>> +
>>> +        The change to this file may have no effect if VFs are not yet
>>> enabled.
>>> +        If strict scheduling can't be enabled in GuC then write will
>>> fail with -EIO.
>>
>> I think the semantics of this need to be documented ie. how it interacts
>> with exec_quantum_ms. If it does? I am guessing that it has to otherwise
>> I don't know what it would mean - presumably unused timeslices are not
>> given to other entities but time just goes wasted? But it is also a
> 
> if strict scheduling is disabled and given VF has no work, then it's
> execution quantum expires immediately, allowing work from next VF to be
> submitted to the GPU, thus maximizing GPU load.
> 
> if strict scheduling is set but given VF has no work, then VF's
> timeslice is effectively wasted, as GPU will be idle, but at the benefit
> that other VFs will see no fluctuations in their interval.

Therefore I suggest explaining the semantics and providing examples in 
the docs. :)

But it does seem like a confusing setting. You cannot for instance 
guarantee a certain time budget per VM unless you can control and 
configure all the VMs and even then only by wasting computing resources. :(

> if you own all VMs then you probably don't want to set this ;)
> 
>> question on over what time interval. Or that too is purely defined by
>> the number of PF+VFs and their respective allocated quanta.
>>
>> Also, would there be benefit, assuming it is possible with GuC, to allow
>> configuring it per PF/VF?
> 
> this is a policy setting, applicable per each GuC scheduler, not per PF
> or VF, but moved level up here to make sure we apply same settings for
> the whole device (all GuCs) in the same, otherwise it would be too messy
> 
> note that the is other related attribute named "priority" that GuC will
> implement for the PF, but with later plans to extend this to VFs too.

Ok.

>>> +
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/monitoring_period_ms
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (RW) integer
>>> +
>>> +        This file represents the configuration knob used by adverse
>>> event
>>> +        monitoring. A value here is the period in millisecs during which
>>> +        events are counted and the total is checked against a threshold.
>>> +        See "sriov_extensions/vfN/tileT/gtX/thresholds" for more
>>> details.
>>> +
>>> +        Default is 0 (monitoring is disabled).
>>> +
>>> +        If monitoring capability is not available, then attempt to
>>> enable
>>> +        will fail with -EPERM error. If monitoring can't be enabled in
>>> +        GuC then write will fail with -EIO.
>>
>> Could the docs explain if there is a downside to enabling it, which is
>> probably why it isn't enabled by default? Because it does sound natural
>> that adverse events should be noticed.
> 
> the problem is that the definition what should be treated as unwanted VF
> activity is very blurred and depends what kind of WLs will be run on VM,
> as in some scenarios some sporadic issues are just "normal"
> 
> that's why we want to expose only knobs and notification mechanism,
> without enforcing any policy on firmware or PF driver level, leaving
> that to the administrator

Okay but runtime cost wise there are no downsides to say constantly run 
with enabled reporting of VF GPU resets of faults?

>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This directory holds all attributes related to the SR-IOV
>>> +        Physical Function (PF).
>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This directory holds all attributes related to the SR-IOV
>>> +        Virtual Function (VF).
>>> +
>>> +        Note that VF numbers (N) are 1-based as described in PCI
>>> SR-IOV specification.
>>> +        The Xe driver implementaton follows that naming schema.
>>> +
>>> +        There will be "vf1", "vf2" up to "vfN" directories, where N
>>> matches
>>> +        value of the PCI "sriov_totalvfs" attribute.
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This directory holds all SR-IOV attributes related to the
>>> device tile.
>>> +        The tile numbers (T) start from 0.
>>> +
>>> +        There is at least one "tile0/" directory present.
>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        This directory holds all SR-IOV attributes related to the
>>> device GT.
>>> +        The GT numbers (X) start from 0.
>>> +
>>> +        There is at least one "gt0/" directory present.
>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/device
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/device
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (symbolic link)
>>> +
>>> +        Backlink to the PCI device entry representing given function.
>>> +        For PF this link is always present.
>>> +        For VF this link is present only for currently enabled VFs.
>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/priority
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (RW) string
>>> +
>>> +        This file represents a GuC Scheduler knob to override the
>>> default
>>> +        round-robin or FIFO scheduler policies implemented by the GuC.
>>> +
>>> +        The default value is "peer".
>>> +
>>> +        This flag can be changed, unless such change is not applicable
>>> +        for given platform or is not supported by current GuC firmware.
>>> +        In such case this file could be read-only or will return -EPERM
>>> +        on write attempt.
>>> +
>>> +        "immediate"
>>> +            GuC will Schedule PF workloads immediately and PF
>>> +            workloads only until the PF's work queues in GuC
>>> +            are empty.
>>> +
>>> +        "lazy"
>>> +            GuC will Schedule PF workloads at the next opportune
>>> +            moment and PF workloads only until the PF work queues
>>> +            in GuC are empty.
>>> +
>>> +        "peer"
>>> +            GuC Scheduler will treat PF and VFs with equal priority.
>>
>> Hmmm this is too very GuC specific and I wonder what is the usecase for
>> lazy? Lazy = "don't care when it runs, but when it runs it will run
>> everything queued so far", right? Feels a bit odd on first.
>>
>> "Immediate" may also not be depending on preemption granularity and
>> workloads, right?
>>
>> Are there any ideas to express the knobs in a more generic fashion?
> 
> will talk with GuC architect to provide a better explanation.
> 
> in the meantime, we can treat that as a "placeholder" for the knob that
> will provide flexibility when GuC shall attempt to submit, usually
> sporadic, workloads from the otherwise idle PF.
> 
> this is important in the "admin-mode" and with "strict-scheduling" as we
> don't want to waste PF's execution_quantum
> 
> if you think that it is too unstable knob, we can try to hide it in
> debugfs first, expose when more mature

I didn't know it is unstable so yes, if it is not know how "priority" 
control will work then it is too early to document/comment.

Otherwise what I saw it appears to be composed of two booleans, with one 
combination missing. Say like this:

   PF preempts | PF greedy | Mode
  -------------+-----------+-------------------
         +     +     +     + "immediate"
  -------------+-----------+-------------------
         -     +     +     + "lazy"
  -------------+-----------+-------------------
         -     +     -     + "peer"
  -------------+-----------+-------------------
         +     +     -     +  not implemented?
  -------------+-----------+-------------------

First thought was who ever would want the "lazy" mode?

Second thought was why not expose the booleans directly.

Third thought was that the unimplemented mode, the one where queued PF 
work would preempt the VF, but not consume everything queued (up to 
execution quanta only) could be an interesting one.

Sounds like could be useful for Chrome use cases where PF would be the 
compositor and VF a game, so that everytime compositor wants to flip it 
gets the priority, but not so much starves everyone else if something 
else happens to be running there. But it is not as simple as that and in 
reality "immediate" is probably good enough so meh.

Oh one more thing, would it be useful for "admin mode" to control this 
too? Presumably some sort of admin console wants to have good 
interactivity and not be UI starved.

>>> +
>>> +
>>> +What:        /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/stop
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        (WO) bool (1)
>>> +
>>> +        Write to this file will force GuC to stop handle any requests
>>> from
>>> +        this VF, but without triggering a FLR.
>>> +        To recover, the full FLR must be issued using generic
>>> "device/reset".
>>> +
>>> +        This file allows to implement custom policy mechanism when VF is
>>> +        misbehaving and triggering adverse events above defined
>>> thresholds.
>>> +
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/exec_quantum_ms
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/preempt_timeout_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/exec_quantum_ms
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/preempt_timeout_us
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        These files represent scheduling parameters of the functions.
>>> +
>>> +        These scheduling parameters can be changed even if VFs are
>>> enabled
>>> +        and running, unless such change is not applicable on given
>>> platform
>>> +        due to fixed hardware or firmware assignment.
>>> +
>>> +        exec_quantum_ms: (RW) integer 0..U32_MAX
>>> +            The GT execution quantum in [ms] assigned to the function.
>>> +            Requested quantum might be aligned per HW/FW requirements.
>>> +
>>> +            Default is 0 (unlimited).
>>> +
>>> +        preempt_timeout_us: (RW) integer 0..U32_MAX
>>> +            The GT preemption timeout in [us] assigned to the function.
>>> +            Requested timeout might be aligned per HW/FW requirements.
>>> +
>>> +            Default is 0 (unlimited).
>>
>> Alignment for the above two will be visible after read-back?
> 
> unfortunately not, as GuC does not expose any interface to query final
> values (sometimes they depend on HW clocks, some are FW implementation
> details, that could change with new release)

I would say there has to be some feedback otherwise it is a very bad 
uapi. My 2c at least.. it does not sound acceptable to have controls 
which we cannot know if they did anything.

>>> +
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/ggtt_quota
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/lmem_quota
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/contexts_quota
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/doorbells_quota
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        These files represent shared resource assigned to the functions.
>>> +
>>> +        These resource parameters can be changed, unless VF is
>>> already running,
>>> +        or such change is not applicable on given platform due to
>>> fixed hardware
>>> +        or firmware assignment.
>>> +
>>> +        Writes to these attributes may fail with:
>>> +            -EPERM if change is not applicable on give HW/FW.
>>> +            -E2BIG if value larger that HW/FW limit.
>>> +            -EDQUOT if value is larger than maximum quota defined by
>>> the PF.
>>> +            -ENOSPC if PF can't allocate required quota.
>>> +            -EBUSY if the resource is currently in use by the VF.
>>> +            -EIO if GuC refuses to change provisioning.
>>
>> Why it would refuse if input is valid? In other words, what is the
>> user/admin supposed to do on -EIO?
> 
> in early implementations we were fully relying on the GuC and return
> -EIO on every error, as we didn't track the VF state that would allow us
> to catch improper changes while VF is running (-EBUSY above) but even if
> we (PF) do our best then GuC is still a decider here and may return
> (unlikely) error.
> 
> as recovery we will be suggesting a VF FLR and then retry.

Sounds like another bad uapi. User might have got everything right, 
avoided all the list errnos by respecting all restrictions and provided 
good inputs, but can still receive an unexplained error and "have you 
tried turning it off and on again" will be the solution. :(

I guess it is not the end of the world if -EIO will truly never happen 
but it still doesn't sound nice.

It would be much nicer if GuC would actually say why so that the right 
errno can be passed on.

>>
>>> +
>>> +        ggtt_quota: (RW) integer 0..U64_MAX
>>> +            The size of the GGTT address space (in bytes) assigned to
>>> the VF.
>>> +            The value might be aligned per HW/FW requirements.
>>> +
>>> +            Default is 0 (unprovisioned).
>>> +
>>> +        lmem_quota: (RW) integer 0..U64_MAX
>>> +            The size of the Local Memory (in bytes) assigned to the VF.
>>> +            The value might be aligned per HW/FW requirements.
>>> +
>>> +            This attribute is only available on discrete platforms.
>>> +
>>> +            Default is 0 (unprovisioned).
>>> +
>>> +        contexts_quota: (RW) 0..U16_MAX
>>> +            The number of GuC submission contexts assigned to the VF.
>>> +            This value might be aligned per HW/FW requirements.
>>> +
>>> +            Default is 0 (unprovisioned).
>>> +
>>> +        doorbells_quota: (RW) 0..U16_MAX
>>> +            The number of GuC doorbells assigned to the VF.
>>> +            This value might be aligned per HW/FW requirements.
>>> +
>>> +            Default is 0 (unprovisioned).
>>> +
>>> +
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/cat_error_count
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/doorbell_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/engine_reset_count
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/h2g_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/irq_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/page_fault_count
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/cat_error_count
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/doorbell_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/engine_reset_count
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/h2g_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/irq_time_us
>>> +What:
>>> /sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/page_fault_count
>>> +Date:        2024
>>> +KernelVersion:    TBD
>>> +Contact:    intel-xe@lists.freedesktop.org
>>> +Description:
>>> +        These files represent threshold values used by the GuC to
>>> trigger
>>> +        security events if adverse event monitoring is enabled.
>>
>> How are the security events delivered? There is mention of uevents in a
>> later paragraph - are they already defined or should be together with
>> this so the link can be place here?
> 
> chicken/egg problem - we don't have uevent fully defined as we were
> waiting for these threshold definitions to be accepted, and without them
> being available we didn't generate uevent, but in early code we had:
> 
> "THRESHOLD_EXCEEDED=1"
> "THRESHOLD_ID=%#x"
> "VF_ID=%u"

It should be possible to include the uvents definitions in the RFC too? 
It would make the story complete for review.

>>> +
>>> +        These thresholds are checked every "monitoring_period_ms".
>>> +        Refer to GuC ABI for details about each threshold category.
>>
>> Is it possible to have a link here to GuC ABI?
> 
> (shared offline, as GuC spec is not public yet)

That could be problematic I think. I don't know if there are such 
precedents or not, like is it okay to upstream not publicly documented 
knobs.

Regards,

Tvrtko
