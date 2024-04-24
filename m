Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B438AFF2D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 05:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3099610F588;
	Wed, 24 Apr 2024 03:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTON2mD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B024B10F0BC;
 Wed, 24 Apr 2024 03:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713928199; x=1745464199;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QkzhqEMGUpv65oSYVtv0gpW4DXR8o9nU+R25hQjV0U8=;
 b=MTON2mD4cAMT656P//jD5DPR9ZME3Vvo5MEGLH0LKbXc0QA5EKkdTEKU
 V0GsH4EjIwIAr5euHKdE8mCW5+kpfCuJxbuy25XyoYRIf9v22RJsw5n6h
 QVV3v3LmXGebsSY6TaKC3MbvgGFkU0Dn5PBuN9WcIHV/c20C125mRjoq5
 4zI1I0wNi/KDaP9BzKSuYGFVMiNA38Q8vIaYZzTKULf8pdRBNFs6TArrw
 Wjd7M7xRVkuNvCpJOS/V3V7C1qjJU5cGkN1QfmCLo3+ifS8++jC5TsXLF
 HL26oOoWaqPEIEKiRGlTjTG96GAU9UZkpkcPeHg0AmLz1lS8IpJ1DO8Yq A==;
X-CSE-ConnectionGUID: 6mbpJWDgRlaHRLqDXI0dAQ==
X-CSE-MsgGUID: 7Wkc4RLaSpGr+5otjheQkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9407702"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9407702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:09:58 -0700
X-CSE-ConnectionGUID: DqBKnrdRR5mLXXfdllmpUQ==
X-CSE-MsgGUID: BmzBVdrCTHuN+tUo7LsNuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="25084446"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:09:56 -0700
Message-ID: <180ea256-fbdb-48fd-aef1-ebb99afb58e0@linux.intel.com>
Date: Wed, 24 Apr 2024 08:42:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
 <b3db0863-80b5-421e-b0cb-e2a9e0114206@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <b3db0863-80b5-421e-b0cb-e2a9e0114206@intel.com>
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


On 23/04/24 20:34, Nilawar, Badal wrote:
>
>
> On 22-04-2024 12:27, Aravind Iddamsetty wrote:
>> PCI subsystem provides callbacks to inform the driver about a request to
>> do function level reset by user, initiated by writing to sysfs entry
>> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>> without the need to do unbind and rebind as the driver needs to
>> reinitialize the device afresh post FLR.
>>
>> v2:
>> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
>> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
>>
>> v3: declare xe_pci_err_handlers as static(Michal)
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>>   drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
>>   drivers/gpu/drm/xe/xe_pci.h          |  2 +
>>   drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>>   7 files changed, 119 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 8bc62bfbc679..693971a1fac0 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>       xe_module.o \
>>       xe_pat.o \
>>       xe_pci.o \
>> +    xe_pci_err.o \
>>       xe_pcode.o \
>>       xe_pm.o \
>>       xe_preempt_fence.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 0a66555229e9..8c749b378a92 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -465,6 +465,9 @@ struct xe_device {
>>       /** @pci_state: PCI state of device */
>>       struct pci_saved_state *pci_state;
>>   +    /** @pci_device_is_reset: device went through PCIe FLR */
>> +    bool pci_device_is_reset;
>> +
>>       /* private: */
>>     #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 509649d0e65e..efba0fbe2f5c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>>           return;
>>       }
>>   +    /* We already have done this before going through a reset, so skip here */
>> +    if (xe->pci_device_is_reset)
>> +        return;
>> +
>>       XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>>       XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>       XE_WARN_ON(xe_guc_pc_stop(pc));
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index a62300990e19..b5a582afc9e7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> +#include "xe_pci_err.h"
>>   #include "xe_pci_types.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>       pci_set_drvdata(pdev, NULL);
>>   }
>>   -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>   {
>>       const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>       const struct xe_subplatform_desc *subplatform_desc;
>> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
>>   };
>>   #endif
>>   +static const struct pci_error_handlers xe_pci_err_handlers = {
>> +    .reset_prepare = xe_pci_reset_prepare,
>> +    .reset_done = xe_pci_reset_done,
>> +};
>> +
>>   static struct pci_driver xe_pci_driver = {
>>       .name = DRIVER_NAME,
>>       .id_table = pciidlist,
>> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
>>   #ifdef CONFIG_PM_SLEEP
>>       .driver.pm = &xe_pm_ops,
>>   #endif
>> +    .err_handler = &xe_pci_err_handlers,
>>   };
>>     int xe_register_pci_driver(void)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>> index 73b90a430d1f..9faf5380a09e 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.h
>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>> @@ -7,8 +7,10 @@
>>   #define _XE_PCI_H_
>>     struct pci_dev;
>> +struct pci_device_id;
>>     int xe_register_pci_driver(void);
>>   void xe_unregister_pci_driver(void);
>>   void xe_load_pci_state(struct pci_dev *pdev);
>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>> new file mode 100644
>> index 000000000000..5306925ea2fa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>> @@ -0,0 +1,88 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/pci.h>
>> +#include <drm/drm_drv.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_pci.h"
>> +#include "xe_pci_err.h"
>> +#include "xe_pm.h"
>> +#include "xe_uc.h"
>> +
>> +/**
>> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
>> + * via /sys/bus/pci/devices/.../reset.
>> + * @pdev: PCI device struct
>> + */
>> +void xe_pci_reset_prepare(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>> +    struct xe_gt *gt;
>> +    int id, err;
>> +
>> +    pci_warn(pdev, "preparing for PCIe reset\n");
>> +
>> +    drm_warn(&xe->drm, "removing device access to userspace\n");
>> +    drm_dev_unplug(&xe->drm);
>> +
>> +    xe_pm_runtime_get(xe);
>> +    /* idle the GTs */
>> +    for_each_gt(gt, xe, id) {
>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +        if (err)
>> +            goto reset;
>> +        xe_uc_reset_prepare(&gt->uc);
>> +        xe_gt_idle(gt);
>> +        err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +        XE_WARN_ON(err);
>> +    }
>> +    xe_pm_runtime_put(xe);
> Is xe_save_pci_state() needed here?

No, as the state has already been saved post driver probe.

Regards,
Aravind.
>
> Regards,
> Badal Nilawar> +
>> +reset:
>> +    pci_disable_device(pdev);
>> +}
>> +
>> +/**
>> + * xe_pci_reset_done - Called when PCIe reset is done.
>> + * @pdev: PCI device struct
>> + */
>> +void xe_pci_reset_done(struct pci_dev *pdev)
>> +{
>> +    const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>> +
>> +    dev_info(&pdev->dev,
>> +         "device went through PCIe reset, reenabling the device\n");
>> +
>> +    if (pci_enable_device(pdev)) {
>> +        dev_err(&pdev->dev,
>> +            "Cannot re-enable PCI device after reset\n");
>> +        return;
>> +    }
>> +    pci_set_master(pdev);
>> +    xe_load_pci_state(pdev);
>> +
>> +    xe->pci_device_is_reset = true;
>> +    /*
>> +     * We want to completely clean the driver and even destroy
>> +     * the xe private data and reinitialize afresh similar to
>> +     * probe
>> +     */
>> +    pdev->driver->remove(pdev);
>> +    if (pci_dev_msi_enabled(pdev))
>> +        pci_free_irq_vectors(pdev);
>> +
>> +    devm_drm_dev_release_action(&xe->drm);
>> +    pci_disable_device(pdev);
>> +
>> +    /*
>> +     * if this fails the driver might be in a stale state, only option is
>> +     * to unbind and rebind
>> +     */
>> +    xe_pci_probe(pdev, ent);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
>> new file mode 100644
>> index 000000000000..95a4c8ce9cf1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PCI_ERR_H_
>> +#define _XE_PCI_ERR_H_
>> +
>> +struct pci_dev;
>> +
>> +void xe_pci_reset_prepare(struct pci_dev *pdev);
>> +void xe_pci_reset_done(struct pci_dev *pdev);
>> +#endif
