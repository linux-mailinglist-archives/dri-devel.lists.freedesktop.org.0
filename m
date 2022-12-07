Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8010B6456D7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 10:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370D910E1A1;
	Wed,  7 Dec 2022 09:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10210E1AC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670406645; x=1701942645;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3Wu4vLcIbS+5iBdEV0xARzWRaNAmNA0obMDVqIp1fpU=;
 b=MB5QsSOFEHc+pNhfw2AksIpW8wiax3zEw5X8kCWvMxdNjo8aYlNCQMbn
 4s60aGaEW42lPV7N2Et8uCroIADov3gs2anW4r73/EDt0Yya2kDGUexVt
 H9Zh7jNf3ae0Twyp8GrETLmxgbF+S/82yi80EESkPbMrccDlm9NPhKeTH
 OeUzcA8Vq8UubpcxvERGP7gI9fCiUWbRmO636Guzy+MYbF5xkErPn80r/
 IqUGZzkHquuDDx6By0jUlhmhyb2nIGe886G+aNucfSrnD3d5RgFt+rH1K
 5RdrjyRTCqYqni+CW5ZLF5wgPpT2Wlyp/faG858PhBYp1JxNmxaUuh6bI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="314498210"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="314498210"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 01:50:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="715129175"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="715129175"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.150.189])
 ([10.249.150.189])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 01:50:40 -0800
Message-ID: <03151389-ecc2-cb07-9c2d-14dd3d679f5d@linux.intel.com>
Date: Wed, 7 Dec 2022 10:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 RESEND 0/7] New DRM driver for Intel VPU
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <49050012-a53b-98bb-16ec-bc84000cf969@suse.de>
 <138350d9-5d17-ed95-e169-a5f36d5a400e@suse.de>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <138350d9-5d17-ed95-e169-a5f36d5a400e@suse.de>
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

On 11/1/2022 11:17 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 01.11.22 um 09:58 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 24.09.22 um 17:11 schrieb Jacek Lawrynowicz:
>>> Hi,
>>>
>>> This patchset contains a new Linux* Kernel Driver for Intel® VPUs.
>>>
>>> VPU stands for Versatile Processing Unit and it is an AI inference accelerator
>>> integrated with Intel non-server CPUs starting from 14th generation.
>>> VPU enables efficient execution of Deep Learning applications
>>> like object detection, classification etc.
>>>
>>> Driver is part of gpu/drm subsystem because VPU is similar in operation to
>>> an integrated GPU. Reusing drm driver init, ioctl handling, gem and prime
>>> helpers and drm_mm allows to minimize code duplication in the kernel.
>>>
>>> The whole driver is licensed under GPL-2.0-only except for two headers imported
>>> from the firmware that are MIT licensed.
>>>
>>> User mode driver stack consists of Level Zero API driver and OpenVINO plugin.
>>> Both should be open-sourced by the end of Q4.
>>> The firmware for the VPU will be distributed as a closed source binary.
>>>
>>> I'm resending v3 patchset with correct Dave's email.
>>>
>>> Regards,
>>> Jacek
>>>
>>> v3:
>>> - Fixed alignment warning in ivpu_ipc.c when building with W=1
>>>
>>> v2: https://lore.kernel.org/all/20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com/
>>> - Rename the driver from "drm/vpu" to "drm/ivpu"
>>> - Add a TODO file
>>> - Add support for WC buffers
>>>
>>> v1: https://lore.kernel.org/all/20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com/
>>>
>>> Jacek Lawrynowicz (7):
>>>    drm/ivpu: Introduce a new DRM driver for Intel VPU
>>>    drm/ivpu: Add Intel VPU MMU support
>>>    drm/ivpu: Add GEM buffer object management
>>>    drm/ivpu: Add IPC driver and JSM messages
>>>    drm/ivpu: Implement firmware parsing and booting
>>>    drm/ivpu: Add command buffer submission logic
>>>    drm/ivpu: Add PM support
>>>
>>>   MAINTAINERS                             |    8 +
>>>   drivers/gpu/drm/Kconfig                 |    2 +
>>>   drivers/gpu/drm/Makefile                |    1 +
>>>   drivers/gpu/drm/ivpu/Kconfig            |   12 +
>>>   drivers/gpu/drm/ivpu/Makefile           |   16 +
>>>   drivers/gpu/drm/ivpu/TODO               |    7 +
>>>   drivers/gpu/drm/ivpu/ivpu_drv.c         |  643 ++++++++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_drv.h         |  178 ++++
>>>   drivers/gpu/drm/ivpu/ivpu_fw.c          |  426 +++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_fw.h          |   38 +
>>>   drivers/gpu/drm/ivpu/ivpu_gem.c         |  836 ++++++++++++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_gem.h         |  128 +++
>>>   drivers/gpu/drm/ivpu/ivpu_hw.h          |  169 ++++
>>>   drivers/gpu/drm/ivpu/ivpu_hw_mtl.c      | 1060 +++++++++++++++++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_hw_mtl_reg.h  |  468 ++++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_hw_reg_io.h   |  115 +++
>>>   drivers/gpu/drm/ivpu/ivpu_ipc.c         |  508 +++++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_ipc.h         |   90 ++
>>>   drivers/gpu/drm/ivpu/ivpu_job.c         |  629 ++++++++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_job.h         |   73 ++
>>>   drivers/gpu/drm/ivpu/ivpu_jsm_msg.c     |  220 +++++
>>>   drivers/gpu/drm/ivpu/ivpu_jsm_msg.h     |   25 +
>>>   drivers/gpu/drm/ivpu/ivpu_mmu.c         |  888 +++++++++++++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_mmu.h         |   53 ++
>>>   drivers/gpu/drm/ivpu/ivpu_mmu_context.c |  419 +++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_mmu_context.h |   49 ++
>>>   drivers/gpu/drm/ivpu/ivpu_pm.c          |  352 ++++++++
>>>   drivers/gpu/drm/ivpu/ivpu_pm.h          |   38 +
>>>   drivers/gpu/drm/ivpu/vpu_boot_api.h     |  241 ++++++
>>>   drivers/gpu/drm/ivpu/vpu_jsm_api.h      |  616 +++++++++++++
>>>   include/uapi/drm/ivpu_drm.h             |  343 ++++++++
>>
>> You have to add yourself to MAINTAINERS.
>>
>> I assume that there's a FOSS userspace available?
> 
> Rereading the cover letter, it will be opensourced. I think DRM policy is that we first need an OSS userspace befor the kernel driver get's merged. Nevertheless it's now a good time to get the driver in shape.
> 
> I've finished looking trough the patchset and left comments on some of them.

Thanks for the in-depth review and sorry for late response but it took us some time to implement all review changes.
The user space should be opensourced in coming weeks.

Regards,
Jacek
 
