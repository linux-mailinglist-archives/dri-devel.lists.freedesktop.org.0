Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F5792304
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 15:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35D810E512;
	Tue,  5 Sep 2023 13:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D43510E506;
 Tue,  5 Sep 2023 13:28:19 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso24104565e9.2; 
 Tue, 05 Sep 2023 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693920497; x=1694525297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HO60y5WvecntGMap+7ti8637GtVXXtrbirknYBL6Q24=;
 b=FlQAyFQNK/BHXuK3A3+GzQ/ahXcyYwEYohsqtdXggwfUDL0di68lxE1t82nWbkHVNH
 9H4y598jlcymkjXv5Vl4gMkeo5y1GMKxd3ExeafUnU9cZ/wvkorTWZn36nyfUByraDMn
 OvJ5zfT9XVkaw8q2082Lbw2pVMLd3kr3bYIfbs8rDDE1v8qqn9fb+NZf/JOplb1ht/Pt
 MrAJRW9981kBQFpeKWebi44oDMpurtFCVBBUb3pfdC02dPQLWTATDF3L+RrHixrNpKbS
 ikYs6H6tUSQtKfHN4irN5UVmXRbNtXASU0DDY3y9Q8YaW6gDcY1v6v9coHc1JxRjCENP
 Iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693920497; x=1694525297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HO60y5WvecntGMap+7ti8637GtVXXtrbirknYBL6Q24=;
 b=U2kosq0OW3eYNwdq0iuZldMCNraG5UsZrbCC9Pz3ciGASf/uARiB1T0+HL7MFmmIm1
 Xb4HfAQeucHX1x5b8ybvDNG+s5Wk6ERMaj5YiOSO1mL+R5Ftkh8rdUCNI2xtHc1cFaA7
 T3V7pPYeX9bBcJ2mz2Qztl+GcGp1FC2Uizb3atv+x/rMBweA7zkju/p7jrUTstyNzRsq
 nxUTQlz2mYoxhAAUe5NAh7NDvHDSBevfGpFuNvwRGQsIUFM9sEJiM+HQNserZJiBfB/V
 xW5g+85kSdISE9nxaEnsJTWg7xctkUtDNUDULK2G00FDZWl+4nkue4kbRB3Ck0zfYOWq
 ynag==
X-Gm-Message-State: AOJu0YzuBqVNxothL7dwUwE1iQccaOPqYVDDfXQbdeGynsK2JntTz1BG
 btGKCONenLtPiInJzWeWfSs=
X-Google-Smtp-Source: AGHT+IE9N4h9DnLrGBA6w0mD6fm9bBMgaxlwOB4SKAbQC3od7Yg6OmwCuXYoDvsI34rJ37MMdyjrhQ==
X-Received: by 2002:a5d:4408:0:b0:313:f399:6cea with SMTP id
 z8-20020a5d4408000000b00313f3996ceamr9182865wrq.4.1693920497247; 
 Tue, 05 Sep 2023 06:28:17 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 n10-20020adfe78a000000b0031aca6cc69csm17618765wrm.2.2023.09.05.06.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 06:28:16 -0700 (PDT)
Message-ID: <b11fedb4-d577-d007-0ef8-ac62775d9eee@gmail.com>
Date: Tue, 5 Sep 2023 15:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user to select
 the primary video adapter at boot time
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <874jk8j45s.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <874jk8j45s.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.09.23 um 12:38 schrieb Jani Nikula:
> On Tue, 05 Sep 2023, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> On a machine with multiple GPUs, a Linux user has no control over which
>> one is primary at boot time. This series tries to solve above mentioned
>> problem by introduced the ->be_primary() function stub. The specific
>> device drivers can provide an implementation to hook up with this stub by
>> calling the vga_client_register() function.
>>
>> Once the driver bound the device successfully, VGAARB will call back to
>> the device driver. To query if the device drivers want to be primary or
>> not. Device drivers can just pass NULL if have no such needs.
>>
>> Please note that:
>>
>> 1) The ARM64, Loongarch, Mips servers have a lot PCIe slot, and I would
>>     like to mount at least three video cards.

Well, you rarely find a board which can actually handle a single one :)

>>
>> 2) Typically, those non-86 machines don't have a good UEFI firmware
>>     support, which doesn't support select primary GPU as firmware stage.
>>     Even on x86, there are old UEFI firmwares which already made undesired
>>     decision for you.
>>
>> 3) This series is attempt to solve the remain problems at the driver level,
>>     while another series[1] of me is target to solve the majority of the
>>     problems at device level.
>>
>> Tested (limited) on x86 with four video card mounted, Intel UHD Graphics
>> 630 is the default boot VGA, successfully override by ast2400 with
>> ast.modeset=10 append at the kernel cmd line.
> The value 10 is incredibly arbitrary, and multiplied as a magic number
> all over the place.

+1

>
>> $ lspci | grep VGA
>>
>>   00:02.0 VGA compatible controller: Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]
>>   01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Caicos XTX [Radeon HD 8490 / R5 235X OEM]
>>   04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30)
>>   05:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 720] (rev a1)
> In this example, all of the GPUs are driven by different drivers. What
> good does a module parameter do if you have multiple GPUs of the same
> model, all driven by the same driver module?

Completely agree. Question is what is the benefit for the end user to 
actually specify this?

If you want the initial console on a different device than implement a 
kernel options for vgaarb and *not* the drivers.

Regards,
Christian.

>
> BR,
> Jani.
>
>> $ sudo dmesg | grep vgaarb
>>
>>   pci 0000:00:02.0: vgaarb: setting as boot VGA device
>>   pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
>>   pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>>   pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>>   pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>>   vgaarb: loaded
>>   ast 0000:04:00.0: vgaarb: Override as primary by driver
>>   i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
>>   radeon 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
>>   ast 0000:04:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
>>
>> v2:
>> 	* Add a simple implemment for drm/i915 and drm/ast
>> 	* Pick up all tags (Mario)
>> v3:
>> 	* Fix a mistake for drm/i915 implement
>> 	* Fix patch can not be applied problem because of merge conflect.
>> v4:
>> 	* Focus on solve the real problem.
>>
>> v1,v2 at https://patchwork.freedesktop.org/series/120059/
>>     v3 at https://patchwork.freedesktop.org/series/120562/
>>
>> [1] https://patchwork.freedesktop.org/series/122845/
>>
>> Sui Jingfeng (9):
>>    PCI/VGA: Allowing the user to select the primary video adapter at boot
>>      time
>>    drm/nouveau: Implement .be_primary() callback
>>    drm/radeon: Implement .be_primary() callback
>>    drm/amdgpu: Implement .be_primary() callback
>>    drm/i915: Implement .be_primary() callback
>>    drm/loongson: Implement .be_primary() callback
>>    drm/ast: Register as a VGA client by calling vga_client_register()
>>    drm/hibmc: Register as a VGA client by calling vga_client_register()
>>    drm/gma500: Register as a VGA client by calling vga_client_register()
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 11 +++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 ++++-
>>   drivers/gpu/drm/ast/ast_drv.c                 | 31 ++++++++++
>>   drivers/gpu/drm/gma500/psb_drv.c              | 57 ++++++++++++++++++-
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 15 +++++
>>   drivers/gpu/drm/i915/display/intel_vga.c      | 15 ++++-
>>   drivers/gpu/drm/loongson/loongson_module.c    |  2 +-
>>   drivers/gpu/drm/loongson/loongson_module.h    |  1 +
>>   drivers/gpu/drm/loongson/lsdc_drv.c           | 10 +++-
>>   drivers/gpu/drm/nouveau/nouveau_vga.c         | 11 +++-
>>   drivers/gpu/drm/radeon/radeon_device.c        | 10 +++-
>>   drivers/pci/vgaarb.c                          | 43 ++++++++++++--
>>   drivers/vfio/pci/vfio_pci_core.c              |  2 +-
>>   include/linux/vgaarb.h                        |  8 ++-
>>   14 files changed, 210 insertions(+), 19 deletions(-)

