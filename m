Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2360E088
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 14:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904C10E4EF;
	Wed, 26 Oct 2022 12:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850410E40B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666786889; x=1698322889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gkIgiwlK3MrAXqH+OTg9IaUq1fSgmzGt0pDG2PPhZ3I=;
 b=aLlrSHPSW1sytWp6qhAUAhM1SX99FVqAEXrxC6bZn9Sj869ZMuG0nZXb
 +u3CKZAnoqWu1zzWSFuR2sok+OIhm1NZOrH69pyVNHFcs8/t/MZ/QcdN8
 9kO9Z9B4D9m4yqHqMVgei7xiC4UBgMPG8rb2aHCepTG8C7QIBwlqn7ynz
 6WcOxIqHYvFYqhAei5Ja3WynRjUUuxA5QnZM4srS3HOLyCnRrQmHUL/P5
 9yolm/UiTstiGZmo5+hD3LpRvjYQ4tzpV6ahuYZ1U6Hb8YylkBIHIF0Nd
 DRHdra9qN+Xprs5jMylTGQGbF0P7gMAYCzQTBu7wqsud761KyAEgCJLxj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="288326427"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="288326427"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 05:21:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="695342692"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="695342692"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.140.135])
 ([10.249.140.135])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 05:21:27 -0700
Message-ID: <7dff7713-7d24-4946-f113-62195c088c61@linux.intel.com>
Date: Wed, 26 Oct 2022 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
 <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
 <8c91d7de-753c-3a3b-4835-afeacde0d2b0@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8c91d7de-753c-3a3b-4835-afeacde0d2b0@quicinc.com>
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/25/2022 4:08 PM, Jeffrey Hugo wrote:
> On 10/25/2022 5:42 AM, Jacek Lawrynowicz wrote:
>> Hi, thanks for detailed review. My responses inline.
>>
>> On 10/25/2022 1:00 AM, Jeffrey Hugo wrote:
>>> On 9/24/2022 9:11 AM, Jacek Lawrynowicz wrote:
>>>> VPU stands for Versatile Processing Unit and it's a CPU-integrated
>>>> inference accelerator for Computer Vision and Deep Learning
>>>> applications.
>>>>
>>>> The VPU device consist of following componensts:
> 
> Just noticed this.  "components"

Fixed.

>>>>     - Buttress - provides CPU to VPU integration, interrupt, frequency and
>>>>       power management.
>>>>     - Memory Management Unit (based on ARM MMU-600) - translates VPU to
>>>>       host DMA addresses, isolates user workloads.
>>>>     - RISC based microcontroller - executes firmware that provides job
>>>>       execution API for the kernel-mode driver
>>>>     - Neural Compute Subsystem (NCS) - does the actual work, provides
>>>>       Compute and Copy engines.
>>>>     - Network on Chip (NoC) - network fabric connecting all the components
>>>>
>>>> This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
>>>> client CPUs (14th generation).
>>>>
>>>> Module sources are at drivers/gpu/drm/ivpu and module name is
>>>> "intel_vpu.ko".
>>>>
>>>> This patch includes only very besic functionality:
>>>>     - module, PCI device and IRQ initialization
>>>>     - register definitions and low level register manipulation functions
>>>>     - SET/GET_PARAM ioctls
>>>>     - power up without firmware
>>>>
>>>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>> ---
>>>>    MAINTAINERS                            |    8 +
>>>>    drivers/gpu/drm/Kconfig                |    2 +
>>>>    drivers/gpu/drm/Makefile               |    1 +
>>>>    drivers/gpu/drm/ivpu/Kconfig           |   12 +
>>>>    drivers/gpu/drm/ivpu/Makefile          |    8 +
>>>>    drivers/gpu/drm/ivpu/TODO              |    7 +
>>>>    drivers/gpu/drm/ivpu/ivpu_drv.c        |  392 +++++++++
>>>>    drivers/gpu/drm/ivpu/ivpu_drv.h        |  153 ++++
>>>>    drivers/gpu/drm/ivpu/ivpu_hw.h         |  169 ++++
>>>>    drivers/gpu/drm/ivpu/ivpu_hw_mtl.c     | 1021 ++++++++++++++++++++++++
>>>>    drivers/gpu/drm/ivpu/ivpu_hw_mtl_reg.h |  468 +++++++++++
>>>>    drivers/gpu/drm/ivpu/ivpu_hw_reg_io.h  |  115 +++
>>>>    include/uapi/drm/ivpu_drm.h            |   95 +++
>>>>    13 files changed, 2451 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/ivpu/Kconfig
>>>>    create mode 100644 drivers/gpu/drm/ivpu/Makefile
>>>>    create mode 100644 drivers/gpu/drm/ivpu/TODO
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_drv.c
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_drv.h
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw.h
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_mtl_reg.h
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_reg_io.h
>>>>    create mode 100644 include/uapi/drm/ivpu_drm.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 9475aa701a3f..d72ceef107e6 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -7046,6 +7046,14 @@ F:    Documentation/devicetree/bindings/gpu/vivante,gc.yaml
>>>>    F:    drivers/gpu/drm/etnaviv/
>>>>    F:    include/uapi/drm/etnaviv_drm.h
>>>>    +DRM DRIVERS FOR VPU
>>>> +M:    Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>> +M:    Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>>> +S:    Supported
>>>> +T:    git git://anongit.freedesktop.org/drm/drm-misc
>>>> +F:    drivers/gpu/drm/ivpu/
>>>> +F:    include/uapi/drm/ivpu_drm.h
>>>
>>> No mail list?
>>
>> OK, I will add a link to dri-devel.
>>
>>>> +
>>>>    DRM DRIVERS FOR XEN
>>>>    M:    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>    L:    dri-devel@lists.freedesktop.org
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index 198ba846d34b..0aaac0e5366f 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -364,6 +364,8 @@ source "drivers/gpu/drm/v3d/Kconfig"
>>>>      source "drivers/gpu/drm/vc4/Kconfig"
>>>>    +source "drivers/gpu/drm/ivpu/Kconfig"
>>>> +
>>>
>>> Why here of all places?  Just randomly in the middle of the list of sourced Kconfigs?
>>
>> I'll move it to the end.
>>
>>>>    source "drivers/gpu/drm/etnaviv/Kconfig"
>>>>      source "drivers/gpu/drm/hisilicon/Kconfig"
>>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>>> index 25d0ba310509..1bfd7415c2d0 100644
>>>> --- a/drivers/gpu/drm/Makefile
>>>> +++ b/drivers/gpu/drm/Makefile
>>>> @@ -94,6 +94,7 @@ obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
>>>>    obj-$(CONFIG_DRM_MGAG200) += mgag200/
>>>>    obj-$(CONFIG_DRM_V3D)  += v3d/
>>>>    obj-$(CONFIG_DRM_VC4)  += vc4/
>>>> +obj-$(CONFIG_DRM_IVPU)  += ivpu/
>>>
>>> Again, why here?
>>
>> I'll move it to the end.
>>
>>>> diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
>>>> new file mode 100644
>>>> index 000000000000..e59dc65abe6a
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ivpu/Makefile
>>>> @@ -0,0 +1,8 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +# Copyright © 2022 Intel Corporation
>>>
>>> I'm pretty sure (C) is preferred.  Looks like you do this in multiple places.  I'm only going to mention it here.
>>
>> OK, I'll use (C) everywhere.
>>
>>>> +int ivpu_dbg_mask;
>>>> +module_param_named(dbg_mask, ivpu_dbg_mask, int, 0644);
>>>> +MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
>>>
>>> Shouldn't this be unnecessary with the DRM_DEBUG levels, or making the things tracepoints?
>>
>> drm logging doesn't provide the granuality we need.
>> We plan to add tracepoints in future patches.
>>
>>>> +char *ivpu_platform_to_str(u32 platform)
>>>> +{
>>>> +    switch (platform) {
>>>> +    case IVPU_PLATFORM_SILICON:
>>>> +        return "IVPU_PLATFORM_SILICON";
>>>> +    case IVPU_PLATFORM_SIMICS:
>>>> +        return "IVPU_PLATFORM_SIMICS";
>>>> +    case IVPU_PLATFORM_FPGA:
>>>> +        return "IVPU_PLATFORM_FPGA";
>>>> +    default:
>>>> +        return "Invalid platform";
>>>> +    }
>>>> +}
>>>
>>> In this entire series, this is only used in this patch, and only in one file.  Seems pointless to define it here, and have it in the header. Why shouldn't this be moved to the file it is used in, and made static?
>>
>> OK, I'll move it.
>>
>>>> +static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>> +{
>>>> +    struct ivpu_file_priv *file_priv = file->driver_priv;
>>>> +    struct ivpu_device *vdev = file_priv->vdev;
>>>> +    struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>>>> +    struct drm_ivpu_param *args = data;
>>>> +    int ret = 0;
>>>> +    switch (args->param) {
>>>> +    case DRM_IVPU_PARAM_DEVICE_ID:
>>>> +        args->value = pdev->device;
>>>> +        break;
>>>> +    case DRM_IVPU_PARAM_DEVICE_REVISION:
>>>> +        args->value = pdev->revision;
>>>> +        break;
>>>> +    case DRM_IVPU_PARAM_PLATFORM_TYPE:
>>>> +        args->value = vdev->platform;
>>>> +        break;
>>>> +    case DRM_IVPU_PARAM_CORE_CLOCK_RATE:
>>>> +        args->value = ivpu_hw_reg_pll_freq_get(vdev);
>>>> +        break;
>>>> +    case DRM_IVPU_PARAM_NUM_CONTEXTS:
>>>> +        args->value = ivpu_get_context_count(vdev);
>>>> +        break;
>>>> +    case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>>>> +        args->value = vdev->hw->ranges.user_low.start;
>>>> +        break;
>>>> +    case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>>>> +        args->value = file_priv->priority;
>>>> +        break;
>>>> +    default:
>>>> +        ret = -EINVAL;
>>>
>>> This doesn't cause a switch case fallthrough warning?
>>
>> No, but I will add break for consistency.
>>
>>>> +static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>>>> +{
>>>> +    struct ivpu_device *vdev = to_ivpu_device(dev);
>>>> +    struct ivpu_file_priv *file_priv;
>>>> +
>>>> +    file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>>>> +    if (!file_priv)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    file_priv->vdev = vdev;
>>>> +    file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
>>>> +
>>>> +    kref_init(&file_priv->ref);
>>>
>>> VFS is going to maintain a refcount on the fd.  This looks like you are duplicating that ref count, which seems pointless.
>>>
>>> Later on you use this for jobs, as each job takes a ref, but why would it be valid for jobs to hang around after the fd is closed?
>>
>> This allows user space to close fd immediately without blocking the process in case the job is still being processed by the HW.
> 
> Eh.  Ok.  Maybe add a comment to that effect?

OK.

Regards,
Jacek
