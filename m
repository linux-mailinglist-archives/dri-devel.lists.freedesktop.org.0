Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB060CB14
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 13:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D89110E33C;
	Tue, 25 Oct 2022 11:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1615A10E334
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666698133; x=1698234133;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=OB6wndj2lh5mmlpsJWHt637Dz2iul+STCiB79TZHvuo=;
 b=VLwjnKBPtZN+ZDUme+spZA1hZw06uO51YF7F92O+T6FfIpq6MrtPRPcc
 PkclD9m/YEMgpSFadL86sRC7xgZFZSi9TqRvVy4UFHgehVskCZuUBMlXq
 Zr1/yQan3ZQprdlpxVbGljZDQMJ6yVo6N1wtoQCtQW6x8dVsy1fFWpoKd
 fQ3rYxKxxtpl0i/w671HF+pewS7kGwJlQ3SXYAfz3aAjYBIzs5nv0Fdjf
 1K92p0tzxZ7pviNNhaAZjmYGh4ZpETllzNWcWz66xUZc242pdleBiLCNE
 8KZuCUfZptxXCiTxDIlGx7hRNu0xth1Y+Brwa3E4RGk/VFFz6+ybQFoic Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308745120"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="308745120"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 04:42:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="664878835"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; d="scan'208";a="664878835"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [172.22.250.37])
 ([172.22.250.37])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 04:42:10 -0700
Message-ID: <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
Date: Tue, 25 Oct 2022 13:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
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

Hi, thanks for detailed review. My responses inline.

On 10/25/2022 1:00 AM, Jeffrey Hugo wrote:
> On 9/24/2022 9:11 AM, Jacek Lawrynowicz wrote:
>> VPU stands for Versatile Processing Unit and it's a CPU-integrated
>> inference accelerator for Computer Vision and Deep Learning
>> applications.
>>
>> The VPU device consist of following componensts:
>>    - Buttress - provides CPU to VPU integration, interrupt, frequency and
>>      power management.
>>    - Memory Management Unit (based on ARM MMU-600) - translates VPU to
>>      host DMA addresses, isolates user workloads.
>>    - RISC based microcontroller - executes firmware that provides job
>>      execution API for the kernel-mode driver
>>    - Neural Compute Subsystem (NCS) - does the actual work, provides
>>      Compute and Copy engines.
>>    - Network on Chip (NoC) - network fabric connecting all the components
>>
>> This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
>> client CPUs (14th generation).
>>
>> Module sources are at drivers/gpu/drm/ivpu and module name is
>> "intel_vpu.ko".
>>
>> This patch includes only very besic functionality:
>>    - module, PCI device and IRQ initialization
>>    - register definitions and low level register manipulation functions
>>    - SET/GET_PARAM ioctls
>>    - power up without firmware
>>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   MAINTAINERS                            |    8 +
>>   drivers/gpu/drm/Kconfig                |    2 +
>>   drivers/gpu/drm/Makefile               |    1 +
>>   drivers/gpu/drm/ivpu/Kconfig           |   12 +
>>   drivers/gpu/drm/ivpu/Makefile          |    8 +
>>   drivers/gpu/drm/ivpu/TODO              |    7 +
>>   drivers/gpu/drm/ivpu/ivpu_drv.c        |  392 +++++++++
>>   drivers/gpu/drm/ivpu/ivpu_drv.h        |  153 ++++
>>   drivers/gpu/drm/ivpu/ivpu_hw.h         |  169 ++++
>>   drivers/gpu/drm/ivpu/ivpu_hw_mtl.c     | 1021 ++++++++++++++++++++++++
>>   drivers/gpu/drm/ivpu/ivpu_hw_mtl_reg.h |  468 +++++++++++
>>   drivers/gpu/drm/ivpu/ivpu_hw_reg_io.h  |  115 +++
>>   include/uapi/drm/ivpu_drm.h            |   95 +++
>>   13 files changed, 2451 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ivpu/Kconfig
>>   create mode 100644 drivers/gpu/drm/ivpu/Makefile
>>   create mode 100644 drivers/gpu/drm/ivpu/TODO
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_drv.c
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_drv.h
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw.h
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_mtl_reg.h
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_hw_reg_io.h
>>   create mode 100644 include/uapi/drm/ivpu_drm.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9475aa701a3f..d72ceef107e6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7046,6 +7046,14 @@ F:    Documentation/devicetree/bindings/gpu/vivante,gc.yaml
>>   F:    drivers/gpu/drm/etnaviv/
>>   F:    include/uapi/drm/etnaviv_drm.h
>>   +DRM DRIVERS FOR VPU
>> +M:    Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> +M:    Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> +S:    Supported
>> +T:    git git://anongit.freedesktop.org/drm/drm-misc
>> +F:    drivers/gpu/drm/ivpu/
>> +F:    include/uapi/drm/ivpu_drm.h
> 
> No mail list?

OK, I will add a link to dri-devel. 

>> +
>>   DRM DRIVERS FOR XEN
>>   M:    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>   L:    dri-devel@lists.freedesktop.org
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 198ba846d34b..0aaac0e5366f 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -364,6 +364,8 @@ source "drivers/gpu/drm/v3d/Kconfig"
>>     source "drivers/gpu/drm/vc4/Kconfig"
>>   +source "drivers/gpu/drm/ivpu/Kconfig"
>> +
> 
> Why here of all places?  Just randomly in the middle of the list of sourced Kconfigs?

I'll move it to the end.

>>   source "drivers/gpu/drm/etnaviv/Kconfig"
>>     source "drivers/gpu/drm/hisilicon/Kconfig"
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 25d0ba310509..1bfd7415c2d0 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -94,6 +94,7 @@ obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
>>   obj-$(CONFIG_DRM_MGAG200) += mgag200/
>>   obj-$(CONFIG_DRM_V3D)  += v3d/
>>   obj-$(CONFIG_DRM_VC4)  += vc4/
>> +obj-$(CONFIG_DRM_IVPU)  += ivpu/
> 
> Again, why here?

I'll move it to the end.

>> diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
>> new file mode 100644
>> index 000000000000..e59dc65abe6a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ivpu/Makefile
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +# Copyright © 2022 Intel Corporation
> 
> I'm pretty sure (C) is preferred.  Looks like you do this in multiple places.  I'm only going to mention it here.

OK, I'll use (C) everywhere.

>> +int ivpu_dbg_mask;
>> +module_param_named(dbg_mask, ivpu_dbg_mask, int, 0644);
>> +MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
> 
> Shouldn't this be unnecessary with the DRM_DEBUG levels, or making the things tracepoints?

drm logging doesn't provide the granuality we need.
We plan to add tracepoints in future patches.

>> +char *ivpu_platform_to_str(u32 platform)
>> +{
>> +    switch (platform) {
>> +    case IVPU_PLATFORM_SILICON:
>> +        return "IVPU_PLATFORM_SILICON";
>> +    case IVPU_PLATFORM_SIMICS:
>> +        return "IVPU_PLATFORM_SIMICS";
>> +    case IVPU_PLATFORM_FPGA:
>> +        return "IVPU_PLATFORM_FPGA";
>> +    default:
>> +        return "Invalid platform";
>> +    }
>> +}
> 
> In this entire series, this is only used in this patch, and only in one file.  Seems pointless to define it here, and have it in the header. Why shouldn't this be moved to the file it is used in, and made static?

OK, I'll move it.

>> +static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> +{
>> +    struct ivpu_file_priv *file_priv = file->driver_priv;
>> +    struct ivpu_device *vdev = file_priv->vdev;
>> +    struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>> +    struct drm_ivpu_param *args = data;
>> +    int ret = 0;
>> +    switch (args->param) {
>> +    case DRM_IVPU_PARAM_DEVICE_ID:
>> +        args->value = pdev->device;
>> +        break;
>> +    case DRM_IVPU_PARAM_DEVICE_REVISION:
>> +        args->value = pdev->revision;
>> +        break;
>> +    case DRM_IVPU_PARAM_PLATFORM_TYPE:
>> +        args->value = vdev->platform;
>> +        break;
>> +    case DRM_IVPU_PARAM_CORE_CLOCK_RATE:
>> +        args->value = ivpu_hw_reg_pll_freq_get(vdev);
>> +        break;
>> +    case DRM_IVPU_PARAM_NUM_CONTEXTS:
>> +        args->value = ivpu_get_context_count(vdev);
>> +        break;
>> +    case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>> +        args->value = vdev->hw->ranges.user_low.start;
>> +        break;
>> +    case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>> +        args->value = file_priv->priority;
>> +        break;
>> +    default:
>> +        ret = -EINVAL;
> 
> This doesn't cause a switch case fallthrough warning?

No, but I will add break for consistency.

>> +static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>> +{
>> +    struct ivpu_device *vdev = to_ivpu_device(dev);
>> +    struct ivpu_file_priv *file_priv;
>> +
>> +    file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>> +    if (!file_priv)
>> +        return -ENOMEM;
>> +
>> +    file_priv->vdev = vdev;
>> +    file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
>> +
>> +    kref_init(&file_priv->ref);
> 
> VFS is going to maintain a refcount on the fd.  This looks like you are duplicating that ref count, which seems pointless.
> 
> Later on you use this for jobs, as each job takes a ref, but why would it be valid for jobs to hang around after the fd is closed?

This allows user space to close fd immediately without blocking the process in case the job is still being processed by the HW.

>> +static const struct drm_ioctl_desc ivpu_drm_ioctls[] = {
>> +    DRM_IOCTL_DEF_DRV(IVPU_GET_PARAM, ivpu_get_param_ioctl, DRM_RENDER_ALLOW),
>> +    DRM_IOCTL_DEF_DRV(IVPU_SET_PARAM, ivpu_set_param_ioctl, DRM_RENDER_ALLOW),
>> +};
>> +
>> +DEFINE_DRM_GEM_FOPS(ivpu_fops);
>> +
>> +int ivpu_shutdown(struct ivpu_device *vdev)
>> +{
>> +    int ret;
>> +
>> +    ivpu_hw_irq_disable(vdev);
>> +
>> +    ret = ivpu_hw_power_down(vdev);
>> +    if (ret)
>> +        ivpu_warn(vdev, "Failed to power down HW: %d\n", ret);
>> +
>> +    return ret;
>> +}
> 
> Feels odd to have this function definition sit between the DEFINE_DRM_GEM_FOPS and the drm_driver

OK, I will move this function up.

>> +static int ivpu_irq_init(struct ivpu_device *vdev)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>> +    int ret;
>> +
>> +    ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
>> +    if (ret < 0) {
>> +        ivpu_err(vdev, "Failed to allocate and MSI IRQ: %d\n", ret);
> 
> "a MSI"?

Yes, it's a typo. 

>> +static int ivpu_pci_init(struct ivpu_device *vdev)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>> +    struct resource *bar0 = &pdev->resource[0];
>> +    struct resource *bar4 = &pdev->resource[4];
>> +    int ret;
>> +
>> +    ivpu_dbg(MISC, "Mapping BAR0 (RegV) %pR\n", bar0);
>> +    vdev->regv = devm_ioremap_resource(vdev->drm.dev, bar0);
>> +    if (IS_ERR(vdev->regv)) {
>> +        ivpu_err(vdev, "Failed to map bar 0\n");
>> +        return -ENOMEM;
> 
> You have a particular reason for recasting the error in vdev->regv to ENOMEM?

No, I'll use PTR_ERR.

>> +static struct pci_device_id ivpu_pci_ids[] = {
>> +    { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_MTL) },
> 
> Why not use include/linux/pci_ids.h for the VID?

Sure, I will use it.

>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_DESCRIPTION(DRIVER_DESC);
>> +MODULE_LICENSE("GPL and additional rights");
> 
> I don't think this is valid.  Pretty sure should just be "GPL".

We have two firmware API headers under MIT. Can we still say "GPL"? Some drivers use "GPL v2", wouldn't this be better as it's more specific?

Regards,
Jacek
