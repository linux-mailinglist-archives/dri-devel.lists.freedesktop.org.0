Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA65880033
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F3210E11C;
	Tue, 19 Mar 2024 15:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iIOzrJil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5455A10E11C;
 Tue, 19 Mar 2024 15:04:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso23215085e9.0; 
 Tue, 19 Mar 2024 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710860645; x=1711465445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PLvzWjzNWj19XjG/NLwNckq7ex0/hC6EP3dD2UDErZM=;
 b=iIOzrJilkIOr3rrjQsJe5IBG4t6cXMI+zIqlCZY9uX4T9EysGyTlnQZCi3SgSVXDz2
 OXVPRrac0N+yB1HiEA0a1fS/83kl/9QkbcqkjJH4on1g80eLZrWqql6AFpr9XkLPU+15
 zRxB060jx6i+8KtHs/QSqNatF4k7QjIAG/A5mmezfdmqQ7Bit97tUNlss9Z3e1Q9LQit
 loDzCoIieapkBY3xVxeSvx/hQsiSekguXw65+KlBfo+Zn+UmQkjhXJEJIk4B3W4ukCiQ
 kWxHOm2K6b5+Meiw0GEqyfgccZLzLGT350J4IFQnGfNMa1jCKOlM/X83WON/82pH1uMa
 4lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710860645; x=1711465445;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PLvzWjzNWj19XjG/NLwNckq7ex0/hC6EP3dD2UDErZM=;
 b=HEFh8zz5ip4bt3GsuXpAl0UmXRTLc8TQq6tn8rfTnfK6rLxB7gxS+rmSNAsQIuBFl1
 kuwb0Y2OR9Ai36z2sCLBMdf2+ANFQbI0vA6MsgOvEQ1q1TW7HqR3XcfD8gkd0ZIBW1mY
 wSNyaxMpAWbVQq48owcb4lObSlIiS52jWsblF8TfcDjfcjC5jmejYSrS/djl2lyJJwNI
 0tbJUd7vI7E0d4pLshyK8tRtZPf/SzdwLD8jHz2m0VK5Rd+2djNVBRWZdgCJDiIV+H+J
 ht9FFJkVXGVDaDpQjXfAjy1fs4Ir4YXbWxHXXhdkfni7+ARFvrNAqQcXsG8HuwPlEFVx
 i2kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIUZU4c4YGLUeEzQNjbxxJtYzlvJnEXbo82Xg8RW0XC1XtmxUlVmN5fqLnKxhYeaB8wNDaMmeTfEh7WY7MC+h9eaEMF4/oizRJVl4VZ9FiPJJvs/PpdF0JwFYFgOsQ0db7Wz+C0jtZRJv6DAQdAA==
X-Gm-Message-State: AOJu0YyAnQmpjc+m4LKJihsDqoiiKJmZxeJnGinvNI2bszYGqVONi8je
 8SK6hIWFb+Ebxo4iVzvOcpS780dx2JRy2mmEeveQ95fgSJS8JoQH
X-Google-Smtp-Source: AGHT+IH5c7WgrhCB9CotAuzJ8seyTtsIngDYlxysxfxkISfiZE2jPcB5TxWPGt05hcFKtorjApobfA==
X-Received: by 2002:a05:6000:888:b0:33e:2d7b:c5a8 with SMTP id
 cs8-20020a056000088800b0033e2d7bc5a8mr2650743wrb.17.1710860645248; 
 Tue, 19 Mar 2024 08:04:05 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b0033e756ed840sm12491654wry.47.2024.03.19.08.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:04:04 -0700 (PDT)
Message-ID: <4f2d5b6a-a1ce-4cdb-bb17-55f19e8898d5@gmail.com>
Date: Tue, 19 Mar 2024 16:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240319123208.851901-1-sunil.khatri@amd.com>
 <CADnq5_PW2ZQ8sP9NcX=f5QhHM-Ne=EQA7k9BKwwwZbgsRyV4-A@mail.gmail.com>
 <8e36fae9-6501-435e-a01c-93990bef57f7@gmail.com>
 <CADnq5_PRXnBVtUVk+7iTHr43KGTbbfHxCwB1jZPo-sGCadY5Qw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_PRXnBVtUVk+7iTHr43KGTbbfHxCwB1jZPo-sGCadY5Qw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.03.24 um 15:59 schrieb Alex Deucher:
> On Tue, Mar 19, 2024 at 10:56 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 19.03.24 um 15:26 schrieb Alex Deucher:
>>> On Tue, Mar 19, 2024 at 8:32 AM Sunil Khatri <sunil.khatri@amd.com> wrote:
>>>> Refactor the code so debugfs and devcoredump can reuse
>>>> the common information and avoid unnecessary copy of it.
>>>>
>>>> created a new file which would be the right place to
>>>> hold functions which will be used between sysfs, debugfs
>>>> and devcoredump.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>>>>    4 files changed, 157 insertions(+), 115 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> index 4536c8ad0e11..05d34f4b18f5 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>>>>           amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>>>           amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>>>           amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>>>> -       amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>>>> +       amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_devinfo.o
>>>>
>>>>    amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> index 9c62552bec34..0267870aa9b1 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> @@ -1609,4 +1609,5 @@ extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>>>    extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>>    extern const struct attribute_group amdgpu_flash_attr_group;
>>>>
>>>> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>> new file mode 100644
>>>> index 000000000000..d2c15a1dcb0d
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>> @@ -0,0 +1,151 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright 2024 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>>> + * copy of this software and associated documentation files (the "Software"),
>>>> + * to deal in the Software without restriction, including without limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>>> + * Software is furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>> + *
>>>> + */
>>>> +
>>>> +#include "amdgpu.h"
>>>> +#include "amd_pcie.h"
>>>> +
>>>> +#include <drm/amdgpu_drm.h>
>>>> +
>>>> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info)
>>> We can probably keep this in amdgpu_kms.c unless that file is getting
>>> too big.  I don't think it warrants a new file at this point.  If you
>>> do keep it in amdgpu_kms.c, I'd recommend renaming it to something
>>> like amdgpu_kms_device_info() to keep the naming conventions.
>> We should not be using this for anything new in the first place.
>>
>> A whole bunch of the stuff inside the devinfo structure has been
>> deprecated because we found that putting everything into one structure
>> was a bad idea.
> It's a convenient way to collect a lot of useful information that we
> want in the core dump.  Plus it's not going anywhere because we need
> to keep compatibility in the IOCTL.

Yeah and exactly that is what I'm strictly against. The devinfo wasn't 
used for new stuff because we found that it is way to inflexible.

That's why we have multiple separate IOCTLs for the memory and firmware 
information for example.

We should really *not* reuse that for the device core dumping.

Rather just use the same information from the different IPs and 
subsystems directly. E.g. add a function to the VM, GFX etc for printing 
out devcoredump infos.

Christian.

>
> Alex
>
>> Regards,
>> Christian.
>>
>>>> +{
>>>> +       int ret;
>>>> +       uint64_t vm_size;
>>>> +       uint32_t pcie_gen_mask;
>>>> +
>>>> +       if (dev_info == NULL)
>>>> +               return -EINVAL;
>>>> +
>>>> +       dev_info->device_id = adev->pdev->device;
>>>> +       dev_info->chip_rev = adev->rev_id;
>>>> +       dev_info->external_rev = adev->external_rev_id;
>>>> +       dev_info->pci_rev = adev->pdev->revision;
>>>> +       dev_info->family = adev->family;
>>>> +       dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
>>>> +       dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
>>>> +       /* return all clocks in KHz */
>>>> +       dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>>>> +       if (adev->pm.dpm_enabled) {
>>>> +               dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
>>>> +               dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
>>>> +               dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
>>>> +               dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
>>>> +       } else {
>>>> +               dev_info->max_engine_clock =
>>>> +                       dev_info->min_engine_clock =
>>>> +                               adev->clock.default_sclk * 10;
>>>> +               dev_info->max_memory_clock =
>>>> +                       dev_info->min_memory_clock =
>>>> +                               adev->clock.default_mclk * 10;
>>>> +               }
>>>> +       dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
>>>> +       dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>>>> +               adev->gfx.config.max_shader_engines;
>>>> +       dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
>>>> +       dev_info->ids_flags = 0;
>>>> +       if (adev->flags & AMD_IS_APU)
>>>> +               dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>>>> +       if (adev->gfx.mcbp)
>>>> +               dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>>>> +       if (amdgpu_is_tmz(adev))
>>>> +               dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>>> +       if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>>> +               dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>>> +
>>>> +       vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>>> +       vm_size -= AMDGPU_VA_RESERVED_TOP;
>>>> +
>>>> +       /* Older VCE FW versions are buggy and can handle only 40bits */
>>>> +       if (adev->vce.fw_version && adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>>>> +               vm_size = min(vm_size, 1ULL << 40);
>>>> +
>>>> +       dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>>>> +       dev_info->virtual_address_max = min(vm_size, AMDGPU_GMC_HOLE_START);
>>>> +
>>>> +       if (vm_size > AMDGPU_GMC_HOLE_START) {
>>>> +               dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>>>> +               dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>>>> +       }
>>>> +       dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>>>> +       dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>>> +       dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>>>> +       dev_info->cu_active_number = adev->gfx.cu_info.number;
>>>> +       dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>>> +       dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>>> +       memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
>>>> +              sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>>> +       memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>>>> +              sizeof(dev_info->cu_bitmap));
>>>> +       dev_info->vram_type = adev->gmc.vram_type;
>>>> +       dev_info->vram_bit_width = adev->gmc.vram_width;
>>>> +       dev_info->vce_harvest_config = adev->vce.harvest_config;
>>>> +       dev_info->gc_double_offchip_lds_buf =
>>>> +               adev->gfx.config.double_offchip_lds_buf;
>>>> +       dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>>>> +       dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>>>> +       dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>>>> +       dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
>>>> +       dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
>>>> +       dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
>>>> +       dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
>>>> +
>>>> +       if (adev->family >= AMDGPU_FAMILY_NV)
>>>> +               dev_info->pa_sc_tile_steering_override =
>>>> +                       adev->gfx.config.pa_sc_tile_steering_override;
>>>> +
>>>> +       dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
>>>> +
>>>> +       /* Combine the chip gen mask with the platform (CPU/mobo) mask. */
>>>> +       pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
>>>> +       dev_info->pcie_gen = fls(pcie_gen_mask);
>>>> +       dev_info->pcie_num_lanes =
>>>> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>>>> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>>>> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>>>> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>>>> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>>>> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
>>>> +
>>>> +       dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>>>> +       dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
>>>> +       dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>>> +       dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>>> +       dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
>>>> +                                   adev->gfx.config.gc_gl1c_per_sa;
>>>> +       dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>>>> +       dev_info->mall_size = adev->gmc.mall_size;
>>>> +
>>>> +
>>>> +       if (adev->gfx.funcs->get_gfx_shadow_info) {
>>>> +               struct amdgpu_gfx_shadow_info shadow_info;
>>>> +
>>>> +               ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>>>> +               if (!ret) {
>>>> +                       dev_info->shadow_size = shadow_info.shadow_size;
>>>> +                       dev_info->shadow_alignment = shadow_info.shadow_alignment;
>>>> +                       dev_info->csa_size = shadow_info.csa_size;
>>>> +                       dev_info->csa_alignment = shadow_info.csa_alignment;
>>>> +               }
>>>> +       }
>>>> +       return ret;
>>>> +}
>>> As noted by Lijo, this should probably be a void function since we
>>> want to populate as much information as we can and we can't break the
>>> IOCTL interface.
>>>
>>> Alex
>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> index a66d47865e3b..24f775c68a51 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>>>>           }
>>>>           case AMDGPU_INFO_DEV_INFO: {
>>>>                   struct drm_amdgpu_info_device *dev_info;
>>>> -               uint64_t vm_size;
>>>> -               uint32_t pcie_gen_mask;
>>>>
>>>>                   dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>>>>                   if (!dev_info)
>>>>                           return -ENOMEM;
>>>>
>>>> -               dev_info->device_id = adev->pdev->device;
>>>> -               dev_info->chip_rev = adev->rev_id;
>>>> -               dev_info->external_rev = adev->external_rev_id;
>>>> -               dev_info->pci_rev = adev->pdev->revision;
>>>> -               dev_info->family = adev->family;
>>>> -               dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
>>>> -               dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
>>>> -               /* return all clocks in KHz */
>>>> -               dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>>>> -               if (adev->pm.dpm_enabled) {
>>>> -                       dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
>>>> -                       dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
>>>> -                       dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
>>>> -                       dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
>>>> -               } else {
>>>> -                       dev_info->max_engine_clock =
>>>> -                               dev_info->min_engine_clock =
>>>> -                                       adev->clock.default_sclk * 10;
>>>> -                       dev_info->max_memory_clock =
>>>> -                               dev_info->min_memory_clock =
>>>> -                                       adev->clock.default_mclk * 10;
>>>> -               }
>>>> -               dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
>>>> -               dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>>>> -                       adev->gfx.config.max_shader_engines;
>>>> -               dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
>>>> -               dev_info->ids_flags = 0;
>>>> -               if (adev->flags & AMD_IS_APU)
>>>> -                       dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>>>> -               if (adev->gfx.mcbp)
>>>> -                       dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>>>> -               if (amdgpu_is_tmz(adev))
>>>> -                       dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>>> -               if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>>> -                       dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>>> -
>>>> -               vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>>> -               vm_size -= AMDGPU_VA_RESERVED_TOP;
>>>> -
>>>> -               /* Older VCE FW versions are buggy and can handle only 40bits */
>>>> -               if (adev->vce.fw_version &&
>>>> -                   adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>>>> -                       vm_size = min(vm_size, 1ULL << 40);
>>>> -
>>>> -               dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>>>> -               dev_info->virtual_address_max =
>>>> -                       min(vm_size, AMDGPU_GMC_HOLE_START);
>>>> -
>>>> -               if (vm_size > AMDGPU_GMC_HOLE_START) {
>>>> -                       dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>>>> -                       dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>>>> -               }
>>>> -               dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>>>> -               dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>>> -               dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>>>> -               dev_info->cu_active_number = adev->gfx.cu_info.number;
>>>> -               dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>>> -               dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>>> -               memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
>>>> -                      sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>>> -               memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>>>> -                      sizeof(dev_info->cu_bitmap));
>>>> -               dev_info->vram_type = adev->gmc.vram_type;
>>>> -               dev_info->vram_bit_width = adev->gmc.vram_width;
>>>> -               dev_info->vce_harvest_config = adev->vce.harvest_config;
>>>> -               dev_info->gc_double_offchip_lds_buf =
>>>> -                       adev->gfx.config.double_offchip_lds_buf;
>>>> -               dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>>>> -               dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>>>> -               dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>>>> -               dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
>>>> -               dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
>>>> -               dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
>>>> -               dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
>>>> -
>>>> -               if (adev->family >= AMDGPU_FAMILY_NV)
>>>> -                       dev_info->pa_sc_tile_steering_override =
>>>> -                               adev->gfx.config.pa_sc_tile_steering_override;
>>>> -
>>>> -               dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
>>>> -
>>>> -               /* Combine the chip gen mask with the platform (CPU/mobo) mask. */
>>>> -               pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
>>>> -               dev_info->pcie_gen = fls(pcie_gen_mask);
>>>> -               dev_info->pcie_num_lanes =
>>>> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>>>> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>>>> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>>>> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>>>> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>>>> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
>>>> -
>>>> -               dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>>>> -               dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
>>>> -               dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>>> -               dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>>> -               dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
>>>> -                                           adev->gfx.config.gc_gl1c_per_sa;
>>>> -               dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>>>> -               dev_info->mall_size = adev->gmc.mall_size;
>>>> -
>>>> -
>>>> -               if (adev->gfx.funcs->get_gfx_shadow_info) {
>>>> -                       struct amdgpu_gfx_shadow_info shadow_info;
>>>> -
>>>> -                       ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>>>> -                       if (!ret) {
>>>> -                               dev_info->shadow_size = shadow_info.shadow_size;
>>>> -                               dev_info->shadow_alignment = shadow_info.shadow_alignment;
>>>> -                               dev_info->csa_size = shadow_info.csa_size;
>>>> -                               dev_info->csa_alignment = shadow_info.csa_alignment;
>>>> -                       }
>>>> +               ret = amdgpu_device_info(adev, dev_info);
>>>> +               if (!ret) {
>>>> +                       kfree(dev_info);
>>>> +                       return ret;
>>>>                   }
>>>>
>>>>                   ret = copy_to_user(out, dev_info,
>>>> --
>>>> 2.34.1
>>>>

