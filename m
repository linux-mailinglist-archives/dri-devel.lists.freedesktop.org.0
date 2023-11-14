Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B557EAE13
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 11:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F62110E1F3;
	Tue, 14 Nov 2023 10:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF16010E1F3;
 Tue, 14 Nov 2023 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699957794; x=1731493794;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d6i9FHmktpfgMkbgbmJHRXpdZtzXysfYy93orzsNwM8=;
 b=VY8JetUeOH3tz9O8DeM/notvKatXQ55zQtyCa2o21TMn5KDjMaHzxT8E
 mSFfBUBIlfQmGpatJfp0SHb36Sst/xVA9wqpViylHam+LYRVwGSBvdQkA
 u2GGJ69fegsPSyqJEqPebvSWURXJ0FopyTyOPYAeMtkZyfuX5oFkz/Z5l
 RQRwyWdg7i4p/Qoo8BLsqbqoOi4/PHPCMh+ixqO+vC553nZMMEUBaGXxG
 XfdZ1yvFq3fr42V75IZPRUk28GuncK6imHV3TYKQjQ3XlKjGaqhmD3AuP
 KfpXDhHpzQP+QOx2Ttt2TR341y4i4NcNm3vKv+WiWyKsUbpPmsyTms8K2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387790664"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="387790664"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="764626341"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="764626341"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 14 Nov 2023 02:29:47 -0800
Received: from [10.249.134.195] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.195])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 792D536C0A;
 Tue, 14 Nov 2023 10:29:46 +0000 (GMT)
Message-ID: <3ca5d761-f504-421c-8fb1-4f71037777aa@intel.com>
Date: Tue, 14 Nov 2023 11:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH] drm/doc/rfc: SR-IOV support on the new Xe
 driver
To: Francois Dugast <francois.dugast@intel.com>
References: <20231110182231.1730-1-michal.wajdeczko@intel.com>
 <ZVNHFwKWjNTBa_e6@fdugast-desk.home>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZVNHFwKWjNTBa_e6@fdugast-desk.home>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.11.2023 11:08, Francois Dugast wrote:
> On Fri, Nov 10, 2023 at 07:22:31PM +0100, Michal Wajdeczko wrote:
>> The Single Root I/O Virtualization (SR-IOV) extension to the PCI
>> Express (PCIe) specification suite is supported starting from 12th
>> generation of Intel Graphics processors.
>>
>> This RFC aims to explain how do we want to add support for SR-IOV
>> to the new Xe driver and to propose related additions to the sysfs.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> ---
>>  Documentation/gpu/rfc/index.rst             |   5 +
>>  Documentation/gpu/rfc/sysfs-driver-xe-sriov | 501 ++++++++++++++++++++
>>  Documentation/gpu/rfc/xe_sriov.rst          | 192 ++++++++
>>  3 files changed, 698 insertions(+)
>>  create mode 100644 Documentation/gpu/rfc/sysfs-driver-xe-sriov
>>  create mode 100644 Documentation/gpu/rfc/xe_sriov.rst
>>
>> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
>> index e4f7b005138d..fc5bc447f30d 100644
>> --- a/Documentation/gpu/rfc/index.rst
>> +++ b/Documentation/gpu/rfc/index.rst
>> @@ -35,3 +35,8 @@ host such documentation:
>>  .. toctree::
>>  
>>     xe.rst
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   xe_sriov.rst
>> diff --git a/Documentation/gpu/rfc/sysfs-driver-xe-sriov b/Documentation/gpu/rfc/sysfs-driver-xe-sriov
>> new file mode 100644
>> index 000000000000..77748204dd83
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/sysfs-driver-xe-sriov
>> @@ -0,0 +1,501 @@
>> +﻿.. Documentation/ABI/testing/sysfs-driver-xe-sriov
>> +..
>> +.. Intel Xe driver ABI (SR-IOV extensions)
>> +..
>> +    The Single Root I/O Virtualization (SR-IOV) extension to
>> +    the PCI Express (PCIe) specification suite is supported
>> +    starting from 12th generation of Intel Graphics processors.
>> +
>> +    This document describes Xe driver specific additions.
>> +
>> +    For description of generic SR-IOV sysfs attributes see
>> +    "Documentation/ABI/testing/sysfs-bus-pci" document.
>> +
>> +    /sys/bus/pci/drivers/xe/BDF/
>> +    ├── sriov_auto_provisioning
>> +    │   ├── admin_mode
>> +    │   ├── enabled
>> +    │   ├── reset_defaults
>> +    │   ├── resources
>> +    │   │   ├── default_contexts_quota
>> +    │   │   ├── default_doorbells_quota
>> +    │   │   ├── default_ggtt_quota
>> +    │   │   └── default_lmem_quota
>> +    │   ├── scheduling
>> +    │   │   ├── default_exec_quantum_ms
>> +    │   │   └── default_preempt_timeout_us
>> +    │   └── monitoring
>> +    │       ├── default_cat_error_count
>> +    │       ├── default_doorbell_time_us
>> +    │       ├── default_engine_reset_count
>> +    │       ├── default_h2g_time_us
>> +    │       ├── default_irq_time_us
>> +    │       └── default_page_fault_count
>> +
>> +    /sys/bus/pci/drivers/xe/BDF/
>> +    ├── sriov_extensions
>> +    │   ├── monitoring_period_ms
>> +    │   ├── strict_scheduling_enabled
>> +    │   ├── pf
>> +    │   │   ├── device -> ../../../BDF
>> +    │   │   ├── priority
>> +    │   │   ├── tile0
>> +    │   │   │   ├── gt0
>> +    │   │   │   │   ├── exec_quantum_ms
>> +    │   │   │   │   ├── preempt_timeout_us
>> +    │   │   │   │   └── thresholds
>> +    │   │   │   │       ├── cat_error_count
>> +    │   │   │   │       ├── doorbell_time_us
>> +    │   │   │   │       ├── engine_reset_count
>> +    │   │   │   │       ├── h2g_time_us
>> +    │   │   │   │       ├── irq_time_us
>> +    │   │   │   │       └── page_fault_count
>> +    │   │   │   └── gtX
>> +    │   │   └── tileT
>> +    │   ├── vf1
>> +    │   │   ├── device -> ../../../BDF+1
>> +    │   │   ├── stop
>> +    │   │   ├── tile0
>> +    │   │   │   ├── ggtt_quota
>> +    │   │   │   ├── lmem_quota
>> +    │   │   │   ├── gt0
>> +    │   │   │   │   ├── contexts_quota
>> +    │   │   │   │   ├── doorbells_quota
>> +    │   │   │   │   ├── exec_quantum_ms
>> +    │   │   │   │   ├── preempt_timeout_us
>> +    │   │   │   │   └── thresholds
>> +    │   │   │   │       ├── cat_error_count
>> +    │   │   │   │       ├── doorbell_time_us
>> +    │   │   │   │       ├── engine_reset_count
>> +    │   │   │   │       ├── h2g_time_us
>> +    │   │   │   │       ├── irq_time_us
>> +    │   │   │   │       └── page_fault_count
>> +    │   │   │   └── gtX
>> +    │   │   └── tileT
>> +    │   └── vfN
>> +..
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This directory appears on the device when:
>> +
>> +		 - device supports SR-IOV, and
>> +		 - device is a Physical Function (PF), and
>> +		 - xe driver supports SR-IOV PF on given device, and
>> +		 - xe driver supports automatic VFs provisioning.
>> +
>> +		This directory is used as a root for all attributes related to
>> +		automatic provisioning of SR-IOV Physical Function (PF) and/or
>> +		Virtual Functions (VFs).
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/enabled
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(RW) bool (0, 1)
>> +
>> +		This file represents configuration flag for the automatic VFs
>> +		(un)provisioning that could be performed by the PF.
>> +
>> +		The default value is 1 (true).
>> +
>> +		This flag can be set to false, unless manual provisioning is not
>> +		applicable for given platform or it is not supported by current
>> +		PF implementation. In such cases -EPERM will be returned.
>> +
>> +		This flag will be automatically set to false when there will be
>> +		other attempts to change any of VF's resource provisioning.
>> +		See "sriov_extensions" section for details.
>> +
>> +		This flag can be set back to true if and only if all VFs are
>> +		fully unprovisioned, otherwise -EEXIST error will be returned.
>> +
>> +		false = "disabled"
>> +			When disabled, then PF will not attempt to do automatic
>> +			VFs provisioning when VFs are being enabled and will not
>> +			perform automatic unprovisioning of the VFs when VFs will
>> +			be disabled.
>> +
>> +		true = "enabled"
>> +			When enabled, then on VFs enabling PF will do automatic
>> +			VFs provisioning based on the default settings described
>> +			below.
>> +
>> +			If automatic VFs provisioning fails due to some reasons,
>> +			then VFs will not be enabled.
>> +
>> +			If enabled, all resources allocated during VFs enabling
>> +			will be released during VFs disabling (automatic unprovisioning).
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/admin_mode
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(RW) bool (0, 1)
>> +
>> +		This file represents configuration flag for the automatic VFs
>> +		provisioning that could be performed by the PF.
>> +
>> +		The default value depends on the platform type.
>> +
>> +		This flag can be changed any time, but will have no effect if
>> +		VFs are already provisioned.
>> +
>> +		If enabled (default on discrete platforms) then the PF will
>> +		retain only minimum hardcoded resources for its own use when
>> +		doing VFs automatic provisioning and will not use any default
>> +		values described below for its own configuration.
>> +
>> +		If disabled (default on integrated platforms) then the PF will
>> +		treat itself like yet another additional VF in all fair resource
>> +		allocations and will also try to apply default provisioning
>> +		values described below for its own configuration.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/reset_defaults
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(WO) bool (1)
>> +
>> +		Writing to this file will reset all default provisioning parameters
>> +		listed below to the default values.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_contexts_quota
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_doorbells_quota
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_ggtt_quota
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/resources/default_lmem_quota
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/scheduling/default_exec_quantum_ms
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/scheduling/default_preempt_timeout_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_cat_error_count
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_doorbell_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_engine_reset_count
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_h2g_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_irq_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_auto_provisioning/monitoring/default_page_fault_count
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		These files represent default provisioning that should be used
>> +		for VFs automatic provisioning.
>> +
>> +		These values can be changed any time, but will have no effect if
>> +		VFs are already provisioned.
>> +
>> +		default_contexts_quota: (RW) integer 0..U32_MAX
>> +			The number of GuC context IDs to provide to the VF.
>> +			The default value is 0 (use fair allocations).
>> +			See "sriov_extensions/vfN/tileT/gtX/contexts_quota" for details.
>> +
>> +		default_doorbells_quota: (RW) integer 0..U32_MAX
>> +			The number of GuC doorbells to provide to the VF.
>> +			The default value is 0 (use fair allocations).
>> +			See "sriov_extensions/vfN/tileT/gtX/doorbells_quota" for details.
>> +
>> +		default_ggtt_quota: (RW) integer 0..U32_MAX
>> +			The size of the GGTT address space (in bytes) to provide to the VF.
>> +			The default value is 0 (use fair allocations).
>> +			See "sriov_extensions/vfN/tileT/ggtt_quota" for details.
>> +
>> +		default_lmem_quota: (RW) integer 0..U32_MAX
>> +			The size of the LMEM (in bytes) to provide to the VF.
>> +			The default value is 0 (use fair allocations).
>> +			See "sriov_extensions/vfN/tileT/lmem_quota" for details.
>> +
>> +		default_exec_quantum_ms: (RW) integer 0..U32_MAX
>> +			The GT execution quantum (in millisecs) assigned to the function.
>> +			The default value is 0 (infinify).
>> +			See "sriov_extensions/vfN/tileT/gtX/exec_quantum_ms" for details.
>> +
>> +		default_preempt_timeout_us: (RW) integer 0..U32_MAX
>> +			The GT preemption timeout (in microsecs) assigned to the function.
>> +			The default value is 0 (infinity).
>> +			See "sriov_extensions/vfN/tileT/gtX/preempt_timeout_us" for details.
>> +
>> +		default_cat_error_count: (RW) integer 0..U32_MAX
>> +		default_doorbell_time_us: (RW) integer 0..U32_MAX
>> +		default_engine_reset_count: (RW) integer 0..U32_MAX
>> +		default_h2g_time_us: (RW) integer 0..U32_MAX
>> +		default_irq_time_us: (RW) integer 0..U32_MAX
>> +		default_page_fault_count: (RW) integer 0..U32_MAX
>> +			The monitoring threshold to be set for the function.
>> +			The default value is 0 (don't monitor).
>> +			See "sriov_extensions/vfN/tileT/gtX/thresholds" for details.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This directory appears on Xe device when:
>> +
>> +		 - device supports SR-IOV, and
>> +		 - device is a Physical Function (PF), and
>> +		 - driver is enabled to support SR-IOV PF on given device.
>> +
>> +		This directory is used as a root for all attributes required to
>> +		manage both Physical Function (PF) and Virtual Functions (VFs).
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/strict_scheduling_enabled
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(RW) bool
>> +
>> +		This file represents a flag used to determine if scheduling
>> +		parameters should be respected even if there is no active
>> +		workloads submitted by the PF or VFs.
>> +
>> +		This flag is disabled by default, unless strict scheduling is
>> +		not applicable on given platform. In such case this file will
>> +		be read-only.
>> +
>> +		The change to this file may have no effect if VFs are not yet enabled.
>> +		If strict scheduling can't be enabled in GuC then write will fail with -EIO.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/monitoring_period_ms
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(RW) integer
>> +
>> +		This file represents the configuration knob used by adverse event
>> +		monitoring. A value here is the period in millisecs during which
>> +		events are counted and the total is checked against a threshold.
>> +		See "sriov_extensions/vfN/tileT/gtX/thresholds" for more details.
>> +
>> +		Default is 0 (monitoring is disabled).
>> +
>> +		If monitoring capability is not available, then attempt to enable
>> +		will fail with -EPERM error. If monitoring can't be enabled in
>> +		GuC then write will fail with -EIO.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This directory holds all attributes related to the SR-IOV
>> +		Physical Function (PF).
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This directory holds all attributes related to the SR-IOV
>> +		Virtual Function (VF).
>> +
>> +		Note that VF numbers (N) are 1-based as described in PCI SR-IOV specification.
>> +		The Xe driver implementaton follows that naming schema.
>> +
>> +		There will be "vf1", "vf2" up to "vfN" directories, where N matches
>> +		value of the PCI "sriov_totalvfs" attribute.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This directory holds all SR-IOV attributes related to the device tile.
>> +		The tile numbers (T) start from 0.
>> +
>> +		There is at least one "tile0/" directory present.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This directory holds all SR-IOV attributes related to the device GT.
>> +		The GT numbers (X) start from 0.
>> +
>> +		There is at least one "gt0/" directory present.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/device
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/device
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(symbolic link)
>> +
>> +		Backlink to the PCI device entry representing given function.
>> +		For PF this link is always present.
>> +		For VF this link is present only for currently enabled VFs.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/priority
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(RW) string
>> +
>> +		This file represents a GuC Scheduler knob to override the default
>> +		round-robin or FIFO scheduler policies implemented by the GuC.
>> +
>> +		The default value is "peer".
>> +
>> +		This flag can be changed, unless such change is not applicable
>> +		for given platform or is not supported by current GuC firmware.
>> +		In such case this file could be read-only or will return -EPERM
>> +		on write attempt.
>> +
>> +		"immediate"
>> +			GuC will Schedule PF workloads immediately and PF
>> +			workloads only until the PF's work queues in GuC
>> +			are empty.
>> +
>> +		"lazy"
>> +			GuC will Schedule PF workloads at the next opportune
>> +			moment and PF workloads only until the PF work queues
>> +			in GuC are empty.
>> +
>> +		"peer"
>> +			GuC Scheduler will treat PF and VFs with equal priority.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/stop
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		(WO) bool (1)
>> +
>> +		Write to this file will force GuC to stop handle any requests from
>> +		this VF, but without triggering a FLR.
>> +		To recover, the full FLR must be issued using generic "device/reset".
>> +
>> +		This file allows to implement custom policy mechanism when VF is
>> +		misbehaving and triggering adverse events above defined thresholds.
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/exec_quantum_ms
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/preempt_timeout_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/exec_quantum_ms
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/preempt_timeout_us
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		These files represent scheduling parameters of the functions.
>> +
>> +		These scheduling parameters can be changed even if VFs are enabled
>> +		and running, unless such change is not applicable on given platform
>> +		due to fixed hardware or firmware assignment.
>> +
>> +		exec_quantum_ms: (RW) integer 0..U32_MAX
>> +			The GT execution quantum in [ms] assigned to the function.
>> +			Requested quantum might be aligned per HW/FW requirements.
>> +
>> +			Default is 0 (unlimited).
>> +
>> +		preempt_timeout_us: (RW) integer 0..U32_MAX
>> +			The GT preemption timeout in [us] assigned to the function.
>> +			Requested timeout might be aligned per HW/FW requirements.
>> +
>> +			Default is 0 (unlimited).
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/ggtt_quota
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/lmem_quota
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/contexts_quota
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/doorbells_quota
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		These files represent shared resource assigned to the functions.
>> +
>> +		These resource parameters can be changed, unless VF is already running,
>> +		or such change is not applicable on given platform due to fixed hardware
>> +		or firmware assignment.
>> +
>> +		Writes to these attributes may fail with:
>> +			-EPERM if change is not applicable on give HW/FW.
>> +			-E2BIG if value larger that HW/FW limit.
>> +			-EDQUOT if value is larger than maximum quota defined by the PF.
>> +			-ENOSPC if PF can't allocate required quota.
>> +			-EBUSY if the resource is currently in use by the VF.
>> +			-EIO if GuC refuses to change provisioning.
>> +
>> +		ggtt_quota: (RW) integer 0..U64_MAX
>> +			The size of the GGTT address space (in bytes) assigned to the VF.
>> +			The value might be aligned per HW/FW requirements.
>> +
>> +			Default is 0 (unprovisioned).
>> +
>> +		lmem_quota: (RW) integer 0..U64_MAX
>> +			The size of the Local Memory (in bytes) assigned to the VF.
>> +			The value might be aligned per HW/FW requirements.
>> +
>> +			This attribute is only available on discrete platforms.
>> +
>> +			Default is 0 (unprovisioned).
>> +
>> +		contexts_quota: (RW) 0..U16_MAX
>> +			The number of GuC submission contexts assigned to the VF.
>> +			This value might be aligned per HW/FW requirements.
>> +
>> +			Default is 0 (unprovisioned).
>> +
>> +		doorbells_quota: (RW) 0..U16_MAX
>> +			The number of GuC doorbells assigned to the VF.
>> +			This value might be aligned per HW/FW requirements.
>> +
>> +			Default is 0 (unprovisioned).
>> +
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/cat_error_count
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/doorbell_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/engine_reset_count
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/h2g_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/irq_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/pf/tileT/gtX/thresholds/page_fault_count
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/cat_error_count
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/doorbell_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/engine_reset_count
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/h2g_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/irq_time_us
>> +What:		/sys/bus/pci/drivers/xe/.../sriov_extensions/vfN/tileT/gtX/thresholds/page_fault_count
>> +Date:		2024
>> +KernelVersion:	TBD
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		These files represent threshold values used by the GuC to trigger
>> +		security events if adverse event monitoring is enabled.
>> +
>> +		These thresholds are checked every "monitoring_period_ms".
>> +		Refer to GuC ABI for details about each threshold category.
>> +
>> +		Default value for all thresholds is 0 (disabled).
>> +
>> +		cat_error_count: (RW) integer
>> +		doorbell_time_us: (RW) integer
>> +		engine_reset_count: (RW) integer
>> +		h2g_time_us: (RW) integer
>> +		irq_time_us: (RW) integer
>> +		page_fault_count: (RW) integer
>> diff --git a/Documentation/gpu/rfc/xe_sriov.rst b/Documentation/gpu/rfc/xe_sriov.rst
>> new file mode 100644
>> index 000000000000..574f6414eabb
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/xe_sriov.rst
>> @@ -0,0 +1,192 @@
>> +.. SPDX-License-Identifier: MIT
>> +
>> +========================
>> +Xe – SR-IOV Support Plan
>> +========================
>> +
>> +The Single Root I/O Virtualization (SR-IOV) extension to the PCI Express (PCIe)
>> +specification suite is supported starting from 12th generation of Intel Graphics
>> +processors.
>> +
>> +This document describes planned ABI of the new Xe driver (see xe.rst) that will
>> +provide flexible configuration and management options related to the SR-IOV.
>> +It will also highlight few most important changes to the Xe driver
>> +implementation to deal with Intel GPU SR-IOV specific requirements.
>> +
>> +
>> +SR-IOV Capability
>> +=================
>> +
>> +Due to SR-IOV complexity and required co-operation between hardware, firmware
>> +and kernel drivers, not all Xe architecture platforms might have SR-IOV enabled
>> +or fully functional.
>> +
>> +To control at the driver level which platform will provide support for SR-IOV,
>> +as we can't just rely on the PCI configuration data exposed by the hardware,
>> +we will introduce "has_sriov" flag to the struct xe_device_desc that describes
>> +a device capabilities that driver checks during the probe.
>> +
>> +Initially this flag will be set to disabled even on platforms that we plan to
>> +support. We will enable this flag only once we finish merging all required
>> +changes to the driver and related validated firmwares are also made available.
>> +
>> +
>> +SR-IOV Platforms
>> +================
>> +
>> +Initially we plan to add SR-IOV functionality to the following SDV platforms
>> +already supported by the Xe driver:
>> +
>> + - TGL (up to 7 VFs)
>> + - ADL (up to 7 VFs)
>> + - MTL (up to 7 VFs)
>> + - ATSM (up to 31 VFs)
>> + - PVC (up to 63 VFs)
>> +
>> +Newer platforms will be supported later, but we hope that enabling will be
>> +much faster, as majority of the driver changes are either platform agnostic
>> +or are similar between earlier platforms (hence we start with SDVs).
>> +
>> +
>> +PF Mode
>> +=======
>> +
>> +Support in the driver for acting in Physical Function (PF) mode, i.e. mode
>> +that allows configuration of VFs, depends on the CONFIG_PCI_IOV and will be
>> +enabled by default.
>> +
>> +However, due to potentially conflicting requirements for SR-IOV and other mega
>> +features, we might want to have an option to disable SR-IOV PF mode support at
>> +the driver load time.
> 
> What about making SR-IOV support in Xe dependent on a separate build option, such
> as CONFIG_DRM_XE_SRIOV? This would allow users to enable SR-IOV with CONFIG_PCI_IOV
> to virtualize other devices, let's say a network adapter, but to keep this feature
> compiled out of Xe.

We can try to hide all SR-IOV specific code behind another configs:
	XE_SRIOV_PF bool depends on PCI_IOV default PCI_IOV
	XE_SRIOV_VF bool default n
but that's not so flexible and may still not work for all scenarios
where we have to manage multiple devices on one system (like use SRIOV
PF on one dgfx device, but not on other dgfx)

Michal

> 
> Francois
> 
>> +
>> +Thus, we plan to use additional modparam named "sriov_totalvfs" which if set to
>> +0 will force the driver to operate in the native (non-virtualized) mode.
>> +The same modparam could be used to limit number of supported Virtual Functions
>> +(VFs) by the driver compared to the hardware limit exposed in PCI configuration.
>> +
>> +The name of this modparam corresponds to the existing PCI sysfs attribute, that
>> +by default exposes hardware capability.
>> +
>> +The default value of this param will allow to support all possible VFs as
>> +claimed by the hardware.
>> +
>> +This modparam will have no effect if driver is running on the VF device.
>> +
>> +
>> +VFs Enabling
>> +============
>> +
>> +To enable or disable VFs we plan to rely on existing sysfs attribute exposed by
>> +the PCI subsystem named "sriov_numvfs". We will provide all necessary tweaks to
>> +provision VFs in our custom implementation of the "sriov_configure" hook from
>> +the struct pci_driver.
>> +
>> +If for some reason, including explicit request to disable SR-IOV PF mode using
>> +modparam, we will not be able to correctly support any VFs, driver will change
>> +number of supported VFs, exposed to the userspace by "sriov_totalvfs" attribute,
>> +to 0, thus preventing configuration of the VFs.
>> +
>> +
>> +VF Mode
>> +=======
>> +
>> +When driver is running on the VF device, then due to hardware enforcements,
>> +access to the privileged registers is not possible. To avoid relying on these
>> +registers, we plan to perform early detection if we are running on the VF
>> +device using dedicated VF_CAP(0x1901f8) register and then use global macro
>> +IS_SRIOV_VF(xe) to control the driver logic.
>> +
>> +To speed up merging of the required changes, we might first introduce dummy
>> +macro that is always set to false, to prepare driver to avoid some code paths
>> +before we finalize our VF mode detection and other VFs enabling changes.
>> +
>> +
>> +Resources
>> +=========
>> +
>> +Most of the hardware (or firmware) resources available on the Xe architecture,
>> +like GGTT, LMEM, GuC context IDs, GuC doorbells, will be shared between PF and
>> +VFs and will require some provisioning steps to assign those resources for use
>> +by the VF.
>> +
>> +Until VFs are provisioned with resources, the PF driver will be able to use all
>> +resources, in the same way as it would be running in non-virtualized mode.
>> +
>> +If some resource (of part or region of it) is assigned to specific VF, then PF
>> +is not allowed to use that part or region of the resource, but can continue to
>> +use whatever is left available.
>> +
>> +Those resources are usually fully virtualized, so they will not require any
>> +special handling when used by the VF driver, except that VF driver must know
>> +the assigned quota.
>> +
>> +The most notable exception is the GGTT address space, as on some platforms,
>> +the VF driver must additionally know the real range that it can access.
>> +
>> +Once the resources were assigned to the VF use and the VF driver has started,
>> +then it is not allowed to change such provisioning, as that would break the
>> +VF driver. To make changes the VF driver, which was using these resources,
>> +must be unloaded (or the VM is terminated) and the VF device must be reset
>> +using the FLR.
>> +
>> +
>> +Scheduling
>> +==========
>> +
>> +The workloads from PF driver and VF drivers must be submitted to the hardware
>> +always by using the GuC submission mechanism. Unless VF has exclusive access
>> +to the GT then submissions from different VFs are time-sliced and controlled
>> +with additional "execution_quantum" and "preemption_timeout" parameters.
>> +
>> +In contrast to the resource provisioning, those scheduling parameters can be
>> +changed even if VF drivers are already running and are active.
>> +
>> +
>> +Automatic VFs Provisioning
>> +==========================
>> +
>> +To provide out-of-the box experience when user will be enabling VFs using
>> +generic "sriov_numvfs" attribute without requiring complex provisioning steps,
>> +the SR-IOV PF driver will implement automatic VFs resource provisioning.
>> +
>> +By default, all VFs will be allocated with the fair amount of the mandatory
>> +resources (like GGTT, GuC IDs) and with unrestricted scheduling parameters.
>> +Such provisioning should be sufficient for most of the normal usages, when
>> +no strict SLA is required.
>> +
>> +The PF driver will also expose some additional sysfs files to allow adjusting
>> +this automatic VFs provisioning, like default values for most of the
>> +provisioning parameters that PF will then apply for each enabled VF.
>> +
>> +    Details about those extension can be found in
>> +    :download:`Preliminary Xe driver ABI <sysfs-driver-xe-sriov>`.
>> +
>> +
>> +Manual VFs Provisioning
>> +=======================
>> +
>> +If automatic VFs provisioning, which applies same configuration to every VF,
>> +is not sufficient or there is a need for advanced customization of some VF,
>> +the PF driver will also provide extended sysfs interface which will allow
>> +control every provisioning attribute to the lowest feasible level.
>> +
>> +It is expected that these low-level attributes will be mostly used by the
>> +advanced users or by the custom tools that will setup configurations that
>> +meet predefined and validated SLA as required by the customers.
>> +
>> +    Details about those extension can be found in
>> +    :download:`Preliminary Xe driver ABI <sysfs-driver-xe-sriov>`.
>> +
>> +
>> +VFs Monitoring
>> +==============
>> +
>> +In addition to the resource provisioning or changing scheduling parameters,
>> +the PF driver might also allow configure some monitoring parameters, like
>> +thresholds of adverse events or sample period, to track undesired behavior
>> +of the VFs that could impact the whole system.
>> +
>> +Once those thresholds are setup and sampling period is defined, the GuC will
>> +notify the PF driver about which VF is excessing the threshold and then PF is
>> +able to trigger the uevent to notify the administrator (or VMM) that could
>> +take some action against the VF.
>> -- 
>> 2.25.1
>>
