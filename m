Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0360E047
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 14:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FDD10E4CC;
	Wed, 26 Oct 2022 12:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E564B10E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666786030; x=1698322030;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jB08NwQCiGC9m3e9QGK/BWEeRweIWpwunr/U+FEAG7w=;
 b=dkkBioXZ5kzgL+jpCMlC0XVisRIBSgqRdm4sR2us3Sj5Efmptq8b0rp7
 e7CtWLv5+Eo3FQRwB2ZXUM+XwejAJ9ol69IwNJUbHPyMMaUdx49e+3eza
 ByMXf8Jfbyc8gdXzSP4Qh/wE/NKRat0UcttVYXfhaNGivPKDxebzpXfBf
 FIniF/CYmpTTK4rHLxEqlgoT5GPeVo27ll/atbF2uyupUisk0fIHGFhy1
 fjetQ5x7mH5tdTDOI9iUZH4NRtczwyjyZ1DN3Up15pz5WsXPV3rFsZVfk
 eNqZFSnjzhsiVcOtoBox4jjWHp9HBpfNp8/qmgKfxWUfEuaqo5em8XfM+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="369996196"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="369996196"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 05:07:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="774560750"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="774560750"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.140.135])
 ([10.249.140.135])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 05:07:08 -0700
Message-ID: <73d2e8b4-6b31-4b7e-3b8a-0e60b2fd6a51@linux.intel.com>
Date: Wed, 26 Oct 2022 14:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
 <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
 <c276b8c2-9639-37ff-9253-06cfa52d3fd7@suse.de>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c276b8c2-9639-37ff-9253-06cfa52d3fd7@suse.de>
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

Hi,

On 10/25/2022 1:57 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.10.22 um 13:42 schrieb Jacek Lawrynowicz:
>> Hi, thanks for detailed review. My responses inline.
>>
>> On 10/25/2022 1:00 AM, Jeffrey Hugo wrote:
>>> On 9/24/2022 9:11 AM, Jacek Lawrynowicz wrote:
>>>> VPU stands for Versatile Processing Unit and it's a CPU-integrated
>>>> inference accelerator for Computer Vision and Deep Learning
>>>> applications.
>>>>
>>>> The VPU device consist of following componensts:
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
> 
> I known that the Kconfigs and Makefiles are chaotic. But if you can, try to sort it alphabetically.

Man, this is an impossible task :)
Would the line under i915 be OK?

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
> 
> Same.

Under i915?

Regards,
Jacek

