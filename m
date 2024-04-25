Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76058B19CF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 06:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CF011A07F;
	Thu, 25 Apr 2024 04:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIitSSk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C828F11A080;
 Thu, 25 Apr 2024 04:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714017855; x=1745553855;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Otoj3dRTMrGZdkPkYjUhfO1TWN6T4Vb1+VzNBIDfE2I=;
 b=CIitSSk0CUyOKWqF3p3kKvcucq+/cPEF3tbFkoKsDX8A1J2TM0ejx8R6
 4AeAnUDLSg29V125AzitUdcKXrbZ4khbx37z3V/OdNdpvt4Vz55ujzMTk
 zq1Mw8PZwJipTyn29YBrwfw8WswNoxV81U30KiHIQhPmH8hF+8BMYe8xr
 m0gowmykL2rEAL3tGUSb7b5FEED9ZHjsni9XHEWf3dWsmn8+O0vysS9Pm
 9gfJLw7wiu4SI3MC2P7kEqtq169wY+acpxum/Jcblmozx4VPbz/4wD00P
 1+5xRP33qteTCCRjXghNABZohiKQt8xVNKTtIPusEc/edX/Qega/l7A4J w==;
X-CSE-ConnectionGUID: 1c8+DQanQnSgqVmUg6QWHw==
X-CSE-MsgGUID: oqYeIW9fR22bA7+x02Q94Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9805205"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9805205"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:04:15 -0700
X-CSE-ConnectionGUID: W/QMbyrBSGSH4lbYh5SOhQ==
X-CSE-MsgGUID: U3Akfji2TAy+X8n/fEu3kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24937162"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:04:12 -0700
Message-ID: <9905154f-d598-4767-8553-d64f40a14557@linux.intel.com>
Date: Thu, 25 Apr 2024 09:37:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
Content-Language: en-US
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
 <b3db0863-80b5-421e-b0cb-e2a9e0114206@intel.com>
 <180ea256-fbdb-48fd-aef1-ebb99afb58e0@linux.intel.com>
 <48f22c33-87e5-4dd6-856d-441ebef49341@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <48f22c33-87e5-4dd6-856d-441ebef49341@intel.com>
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


On 24/04/24 16:42, Nilawar, Badal wrote:
>
>
> On 24-04-2024 08:42, Aravind Iddamsetty wrote:
>>
>> On 23/04/24 20:34, Nilawar, Badal wrote:
>>>
>>>
>>> On 22-04-2024 12:27, Aravind Iddamsetty wrote:
>>>> PCI subsystem provides callbacks to inform the driver about a request to
>>>> do function level reset by user, initiated by writing to sysfs entry
>>>> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>>>> without the need to do unbind and rebind as the driver needs to
>>>> reinitialize the device afresh post FLR.
>>>>
>>>> v2:
>>>> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
>>>> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
>>>>
>>>> v3: declare xe_pci_err_handlers as static(Michal)
>>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>
>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/Makefile          |  1 +
>>>>    drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>>>    drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>>>>    drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
>>>>    drivers/gpu/drm/xe/xe_pci.h          |  2 +
>>>>    drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>>>>    7 files changed, 119 insertions(+), 1 deletion(-)
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 8bc62bfbc679..693971a1fac0 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>>>        xe_module.o \
>>>>        xe_pat.o \
>>>>        xe_pci.o \
>>>> +    xe_pci_err.o \
>>>>        xe_pcode.o \
>>>>        xe_pm.o \
>>>>        xe_preempt_fence.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 0a66555229e9..8c749b378a92 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -465,6 +465,9 @@ struct xe_device {
>>>>        /** @pci_state: PCI state of device */
>>>>        struct pci_saved_state *pci_state;
>>>>    +    /** @pci_device_is_reset: device went through PCIe FLR */
>>>> +    bool pci_device_is_reset;
>>>> +
>>>>        /* private: */
>>>>      #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> index 509649d0e65e..efba0fbe2f5c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>>>>            return;
>>>>        }
>>>>    +    /* We already have done this before going through a reset, so skip here */
>>>> +    if (xe->pci_device_is_reset)
>>>> +        return;
>>>> +
>>>>        XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>>>>        XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>>>        XE_WARN_ON(xe_guc_pc_stop(pc));
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index a62300990e19..b5a582afc9e7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -23,6 +23,7 @@
>>>>    #include "xe_macros.h"
>>>>    #include "xe_mmio.h"
>>>>    #include "xe_module.h"
>>>> +#include "xe_pci_err.h"
>>>>    #include "xe_pci_types.h"
>>>>    #include "xe_pm.h"
>>>>    #include "xe_sriov.h"
>>>> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>>        pci_set_drvdata(pdev, NULL);
>>>>    }
>>>>    -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>    {
>>>>        const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>>>        const struct xe_subplatform_desc *subplatform_desc;
>>>> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
>>>>    };
>>>>    #endif
>>>>    +static const struct pci_error_handlers xe_pci_err_handlers = {
>>>> +    .reset_prepare = xe_pci_reset_prepare,
>>>> +    .reset_done = xe_pci_reset_done,
>>>> +};
>>>> +
>>>>    static struct pci_driver xe_pci_driver = {
>>>>        .name = DRIVER_NAME,
>>>>        .id_table = pciidlist,
>>>> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
>>>>    #ifdef CONFIG_PM_SLEEP
>>>>        .driver.pm = &xe_pm_ops,
>>>>    #endif
>>>> +    .err_handler = &xe_pci_err_handlers,
>>>>    };
>>>>      int xe_register_pci_driver(void)
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>>>> index 73b90a430d1f..9faf5380a09e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>>>> @@ -7,8 +7,10 @@
>>>>    #define _XE_PCI_H_
>>>>      struct pci_dev;
>>>> +struct pci_device_id;
>>>>      int xe_register_pci_driver(void);
>>>>    void xe_unregister_pci_driver(void);
>>>>    void xe_load_pci_state(struct pci_dev *pdev);
>>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>>>> new file mode 100644
>>>> index 000000000000..5306925ea2fa
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>>>> @@ -0,0 +1,88 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/pci.h>
>>>> +#include <drm/drm_drv.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_gt_printk.h"
>>>> +#include "xe_pci.h"
>>>> +#include "xe_pci_err.h"
>>>> +#include "xe_pm.h"
>>>> +#include "xe_uc.h"
>>>> +
>>>> +/**
>>>> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
>>>> + * via /sys/bus/pci/devices/.../reset.
>>>> + * @pdev: PCI device struct
>>>> + */
>>>> +void xe_pci_reset_prepare(struct pci_dev *pdev)
>>>> +{
>>>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>>>> +    struct xe_gt *gt;
>>>> +    int id, err;
>>>> +
>>>> +    pci_warn(pdev, "preparing for PCIe reset\n");
>>>> +
>>>> +    drm_warn(&xe->drm, "removing device access to userspace\n");
>>>> +    drm_dev_unplug(&xe->drm);
>>>> +
>>>> +    xe_pm_runtime_get(xe);
>>>> +    /* idle the GTs */
>>>> +    for_each_gt(gt, xe, id) {
>>>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> +        if (err)
>>>> +            goto reset;
>>>> +        xe_uc_reset_prepare(&gt->uc);
>>>> +        xe_gt_idle(gt);
>>>> +        err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> +        XE_WARN_ON(err);
>>>> +    }
>>>> +    xe_pm_runtime_put(xe);
>>> Is xe_save_pci_state() needed here?
>>
>> No, as the state has already been saved post driver probe.
>
> Thanks for clarification. One more doubt I have is in FLR flow what will happen to buffer objects especially mmaped BOs. Will all the BOs get destroyed? I couldn't figure out it in the code.

buffer ummaping is handled in drm_dev_unplug called above.

Thanks,
Aravind.
>
> Badal
>>
>> Regards,
>> Aravind.
>>>
>>> Regards,
>>> Badal Nilawar> +
>>>> +reset:
>>>> +    pci_disable_device(pdev);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_pci_reset_done - Called when PCIe reset is done.
>>>> + * @pdev: PCI device struct
>>>> + */
>>>> +void xe_pci_reset_done(struct pci_dev *pdev)
>>>> +{
>>>> +    const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>>>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>>>> +
>>>> +    dev_info(&pdev->dev,
>>>> +         "device went through PCIe reset, reenabling the device\n");
>>>> +
>>>> +    if (pci_enable_device(pdev)) {
>>>> +        dev_err(&pdev->dev,
>>>> +            "Cannot re-enable PCI device after reset\n");
>>>> +        return;
>>>> +    }
>>>> +    pci_set_master(pdev);
>>>> +    xe_load_pci_state(pdev);
>>>> +
>>>> +    xe->pci_device_is_reset = true;
>>>> +    /*
>>>> +     * We want to completely clean the driver and even destroy
>>>> +     * the xe private data and reinitialize afresh similar to
>>>> +     * probe
>>>> +     */
>>>> +    pdev->driver->remove(pdev);
>>>> +    if (pci_dev_msi_enabled(pdev))
>>>> +        pci_free_irq_vectors(pdev);
>>>> +
>>>> +    devm_drm_dev_release_action(&xe->drm);
>>>> +    pci_disable_device(pdev);
>>>> +
>>>> +    /*
>>>> +     * if this fails the driver might be in a stale state, only option is
>>>> +     * to unbind and rebind
>>>> +     */
>>>> +    xe_pci_probe(pdev, ent);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
>>>> new file mode 100644
>>>> index 000000000000..95a4c8ce9cf1
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
>>>> @@ -0,0 +1,13 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_PCI_ERR_H_
>>>> +#define _XE_PCI_ERR_H_
>>>> +
>>>> +struct pci_dev;
>>>> +
>>>> +void xe_pci_reset_prepare(struct pci_dev *pdev);
>>>> +void xe_pci_reset_done(struct pci_dev *pdev);
>>>> +#endif
