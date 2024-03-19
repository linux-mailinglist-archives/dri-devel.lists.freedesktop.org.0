Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7A287FF7C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A3710FB08;
	Tue, 19 Mar 2024 14:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DkrGmuNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C88A10FA4D;
 Tue, 19 Mar 2024 14:23:39 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5d8b519e438so3782474a12.1; 
 Tue, 19 Mar 2024 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710858218; x=1711463018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHcrtgAdZ0/W5jhSETAZ00A+7ScVqcDvyheQBPQH8FI=;
 b=DkrGmuNak9lLG0TeNntFSkcNt5LipKDutHhIt82duLcYNFEsuSDdiSu3MzP9/i4ss1
 GZhDD/lMk1nGwPOqIin08dXELbUqW+zzuPGJYL+aXQzR61ndIAtmT+uw1YVflXfSuCmI
 eU9mBZ7tcQlGGlcyte9fwzWHSPIK9rUZpLXOYlvGV+JmT4NmQFm7u0vYSLNko/Wf1TBp
 Kg9XrigA7NQYbDNU3p+2LR2XNyUK7mqM2oxu58gQzTqjeLIzTkbFMY3UsUKqlXpNbPmz
 XzgNVquJPRxASrxIJeoM9SJUTWE8VQif3qwyY3mWr2Iw3FN3CFPTOtk2ZbeePlx33Bwc
 sK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710858218; x=1711463018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHcrtgAdZ0/W5jhSETAZ00A+7ScVqcDvyheQBPQH8FI=;
 b=HR8EfrF61ug4rQTzj8/nXC6Q2PrMHdmMSp0d8lU+s0GjOXDu28z74JZZUn+Zy4pHMv
 l2TzHbiKqU3a8OZ22+PqXhfk6+z3z8xFJ52LxjJmsWWhDCAm4fa/iPltCqHWikoYzOAZ
 Yh899vVqWG6YOLc/ZeQa6SXeXWyFEC2UYdRVSmg9PCkuyjAvLnCFNvEED53T1rlruKDO
 ZNzKQENH4Km2s3B4jwMHvyeI3NPTz6b1vL/mTB0xEF4pKn2ye10ipE4D3Obls7ReXrta
 l9JAmYCd6mXnM9gr5kBlv2bqX1KjcHXNm52qSYl3x0vTK/aqlKibMh3HzBx9XkMj3LdM
 b35g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWobUfLbx7OAm/5gwRaH1QOYIBMlt2ywpL0xB+/+p5x1ZdMDvFzexntzoU3y9sPVCdfj2Ww3swbRf1EXBdWprWcpZ4B13l9xqGFDUtejDyjgepIXSQ47fZTCFqLVr2Z2YFUsgvmaa84+Wxd477nIQ==
X-Gm-Message-State: AOJu0YzBXSugKwaijsG+7mnk0JeEITcXz4O4j3xcJmpQSzlZFgY0K601
 tTsGUEO8zgacnm+UDw9w2x4RGxm1iuGoxCjO5OOMxYYua2BT0cb0d7u8mNxLzB9AHgGj0hHh7f8
 wcn7FuI23ZE730ylkjZ7Avt5PrQs85sGi
X-Google-Smtp-Source: AGHT+IHJG2tA8TWB6nTfeJgNiB0E9ufuXz1j3Q8MPX8RXpKgYSuwBp+T7IZ3KWUBmYZbho03s1Gpk59e01ugB6EcHwE=
X-Received: by 2002:a17:90b:24e:b0:299:73b3:cf15 with SMTP id
 fz14-20020a17090b024e00b0029973b3cf15mr11856325pjb.12.1710858218368; Tue, 19
 Mar 2024 07:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240319123208.851901-1-sunil.khatri@amd.com>
 <a0fe5024-c1d0-49f4-ba5c-f81161d448e2@amd.com>
 <bcefa332-d29b-4fa0-9195-39dc77625e5b@amd.com>
 <6b00e84a-1720-4417-81bb-416ef6f01560@amd.com>
In-Reply-To: <6b00e84a-1720-4417-81bb-416ef6f01560@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Mar 2024 10:23:25 -0400
Message-ID: <CADnq5_M5RYSPeHXwx0ztAPUJ1xpci9Q-ipL0XwTQyJ07_6PC0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 19, 2024 at 10:22=E2=80=AFAM Lazar, Lijo <lijo.lazar@amd.com> w=
rote:
>
>
>
> On 3/19/2024 7:27 PM, Khatri, Sunil wrote:
> >
> > On 3/19/2024 7:19 PM, Lazar, Lijo wrote:
> >>
> >> On 3/19/2024 6:02 PM, Sunil Khatri wrote:
> >>> Refactor the code so debugfs and devcoredump can reuse
> >>> the common information and avoid unnecessary copy of it.
> >>>
> >>> created a new file which would be the right place to
> >>> hold functions which will be used between sysfs, debugfs
> >>> and devcoredump.
> >>>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 +++++++++++++++++=
+++
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
> >>>   4 files changed, 157 insertions(+), 115 deletions(-)
> >>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
> >>> b/drivers/gpu/drm/amd/amdgpu/Makefile
> >>> index 4536c8ad0e11..05d34f4b18f5 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> >>> @@ -80,7 +80,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o
> >>> amdgpu_kms.o \
> >>>       amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
> >>>       amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> >>>       amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> >>> -    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
> >>> +    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
> >>> amdgpu_devinfo.o
> >>>     amdgpu-$(CONFIG_PROC_FS) +=3D amdgpu_fdinfo.o
> >>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >>> index 9c62552bec34..0267870aa9b1 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >>> @@ -1609,4 +1609,5 @@ extern const struct attribute_group
> >>> amdgpu_vram_mgr_attr_group;
> >>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> >>>   extern const struct attribute_group amdgpu_flash_attr_group;
> >>>   +int amdgpu_device_info(struct amdgpu_device *adev, struct
> >>> drm_amdgpu_info_device *dev_info);
> >>>   #endif
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> >>> new file mode 100644
> >>> index 000000000000..d2c15a1dcb0d
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> >>> @@ -0,0 +1,151 @@
> >>> +// SPDX-License-Identifier: MIT
> >>> +/*
> >>> + * Copyright 2024 Advanced Micro Devices, Inc.
> >>> + *
> >>> + * Permission is hereby granted, free of charge, to any person
> >>> obtaining a
> >>> + * copy of this software and associated documentation files (the
> >>> "Software"),
> >>> + * to deal in the Software without restriction, including without
> >>> limitation
> >>> + * the rights to use, copy, modify, merge, publish, distribute,
> >>> sublicense,
> >>> + * and/or sell copies of the Software, and to permit persons to whom
> >>> the
> >>> + * Software is furnished to do so, subject to the following conditio=
ns:
> >>> + *
> >>> + * The above copyright notice and this permission notice shall be
> >>> included in
> >>> + * all copies or substantial portions of the Software.
> >>> + *
> >>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >>> EXPRESS OR
> >>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> >>> MERCHANTABILITY,
> >>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> >>> EVENT SHALL
> >>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
> >>> DAMAGES OR
> >>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> >>> OTHERWISE,
> >>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> >>> USE OR
> >>> + * OTHER DEALINGS IN THE SOFTWARE.
> >>> + *
> >>> + */
> >>> +
> >>> +#include "amdgpu.h"
> >>> +#include "amd_pcie.h"
> >>> +
> >>> +#include <drm/amdgpu_drm.h>
> >>> +
> >>> +int amdgpu_device_info(struct amdgpu_device *adev, struct
> >>> drm_amdgpu_info_device *dev_info)
> >>> +{
> >>> +    int ret;
> >>> +    uint64_t vm_size;
> >>> +    uint32_t pcie_gen_mask;
> >>> +
> >>> +    if (dev_info =3D=3D NULL)
> >>> +        return -EINVAL;
> >>> +
> >>> +    dev_info->device_id =3D adev->pdev->device;
> >>> +    dev_info->chip_rev =3D adev->rev_id;
> >>> +    dev_info->external_rev =3D adev->external_rev_id;
> >>> +    dev_info->pci_rev =3D adev->pdev->revision;
> >>> +    dev_info->family =3D adev->family;
> >>> +    dev_info->num_shader_engines =3D adev->gfx.config.max_shader_eng=
ines;
> >>> +    dev_info->num_shader_arrays_per_engine =3D
> >>> adev->gfx.config.max_sh_per_se;
> >>> +    /* return all clocks in KHz */
> >>> +    dev_info->gpu_counter_freq =3D amdgpu_asic_get_xclk(adev) * 10;
> >>> +    if (adev->pm.dpm_enabled) {
> >>> +        dev_info->max_engine_clock =3D amdgpu_dpm_get_sclk(adev,
> >>> false) * 10;
> >>> +        dev_info->max_memory_clock =3D amdgpu_dpm_get_mclk(adev,
> >>> false) * 10;
> >>> +        dev_info->min_engine_clock =3D amdgpu_dpm_get_sclk(adev, tru=
e)
> >>> * 10;
> >>> +        dev_info->min_memory_clock =3D amdgpu_dpm_get_mclk(adev, tru=
e)
> >>> * 10;
> >>> +    } else {
> >>> +        dev_info->max_engine_clock =3D
> >>> +            dev_info->min_engine_clock =3D
> >>> +                adev->clock.default_sclk * 10;
> >>> +        dev_info->max_memory_clock =3D
> >>> +            dev_info->min_memory_clock =3D
> >>> +                adev->clock.default_mclk * 10;
> >>> +        }
> >>> +    dev_info->enabled_rb_pipes_mask =3D
> >>> adev->gfx.config.backend_enable_mask;
> >>> +    dev_info->num_rb_pipes =3D adev->gfx.config.max_backends_per_se =
*
> >>> +        adev->gfx.config.max_shader_engines;
> >>> +    dev_info->num_hw_gfx_contexts =3D adev->gfx.config.max_hw_contex=
ts;
> >>> +    dev_info->ids_flags =3D 0;
> >>> +    if (adev->flags & AMD_IS_APU)
> >>> +        dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_FUSION;
> >>> +    if (adev->gfx.mcbp)
> >>> +        dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_PREEMPTION;
> >>> +    if (amdgpu_is_tmz(adev))
> >>> +        dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_TMZ;
> >>> +    if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> >>> +        dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_C=
OORD;
> >>> +
> >>> +    vm_size =3D adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
> >>> +    vm_size -=3D AMDGPU_VA_RESERVED_TOP;
> >>> +
> >>> +    /* Older VCE FW versions are buggy and can handle only 40bits */
> >>> +    if (adev->vce.fw_version && adev->vce.fw_version <
> >>> AMDGPU_VCE_FW_53_45)
> >>> +        vm_size =3D min(vm_size, 1ULL << 40);
> >>> +
> >>> +    dev_info->virtual_address_offset =3D AMDGPU_VA_RESERVED_BOTTOM;
> >>> +    dev_info->virtual_address_max =3D min(vm_size,
> >>> AMDGPU_GMC_HOLE_START);
> >>> +
> >>> +    if (vm_size > AMDGPU_GMC_HOLE_START) {
> >>> +        dev_info->high_va_offset =3D AMDGPU_GMC_HOLE_END;
> >>> +        dev_info->high_va_max =3D AMDGPU_GMC_HOLE_END | vm_size;
> >>> +    }
> >>> +    dev_info->virtual_address_alignment =3D max_t(u32, PAGE_SIZE,
> >>> AMDGPU_GPU_PAGE_SIZE);
> >>> +    dev_info->pte_fragment_size =3D (1 <<
> >>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
> >>> +    dev_info->gart_page_size =3D max_t(u32, PAGE_SIZE,
> >>> AMDGPU_GPU_PAGE_SIZE);
> >>> +    dev_info->cu_active_number =3D adev->gfx.cu_info.number;
> >>> +    dev_info->cu_ao_mask =3D adev->gfx.cu_info.ao_cu_mask;
> >>> +    dev_info->ce_ram_size =3D adev->gfx.ce_ram_size;
> >>> +    memcpy(&dev_info->cu_ao_bitmap[0],
> >>> &adev->gfx.cu_info.ao_cu_bitmap[0],
> >>> +           sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> >>> +    memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
> >>> +           sizeof(dev_info->cu_bitmap));
> >>> +    dev_info->vram_type =3D adev->gmc.vram_type;
> >>> +    dev_info->vram_bit_width =3D adev->gmc.vram_width;
> >>> +    dev_info->vce_harvest_config =3D adev->vce.harvest_config;
> >>> +    dev_info->gc_double_offchip_lds_buf =3D
> >>> +        adev->gfx.config.double_offchip_lds_buf;
> >>> +    dev_info->wave_front_size =3D adev->gfx.cu_info.wave_front_size;
> >>> +    dev_info->num_shader_visible_vgprs =3D adev->gfx.config.max_gprs=
;
> >>> +    dev_info->num_cu_per_sh =3D adev->gfx.config.max_cu_per_sh;
> >>> +    dev_info->num_tcc_blocks =3D
> >>> adev->gfx.config.max_texture_channel_caches;
> >>> +    dev_info->gs_vgt_table_depth =3D adev->gfx.config.gs_vgt_table_d=
epth;
> >>> +    dev_info->gs_prim_buffer_depth =3D
> >>> adev->gfx.config.gs_prim_buffer_depth;
> >>> +    dev_info->max_gs_waves_per_vgt =3D adev->gfx.config.max_gs_threa=
ds;
> >>> +
> >>> +    if (adev->family >=3D AMDGPU_FAMILY_NV)
> >>> +        dev_info->pa_sc_tile_steering_override =3D
> >>> +            adev->gfx.config.pa_sc_tile_steering_override;
> >>> +
> >>> +    dev_info->tcc_disabled_mask =3D adev->gfx.config.tcc_disabled_ma=
sk;
> >>> +
> >>> +    /* Combine the chip gen mask with the platform (CPU/mobo) mask. =
*/
> >>> +    pcie_gen_mask =3D adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_ma=
sk
> >>> >> 16);
> >>> +    dev_info->pcie_gen =3D fls(pcie_gen_mask);
> >>> +    dev_info->pcie_num_lanes =3D
> >>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ?
> >>> 32 :
> >>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ?
> >>> 16 :
> >>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ?
> >>> 12 :
> >>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8=
 :
> >>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4=
 :
> >>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2
> >>> : 1;
> >>> +
> >>> +    dev_info->tcp_cache_size =3D adev->gfx.config.gc_tcp_l1_size;
> >>> +    dev_info->num_sqc_per_wgp =3D adev->gfx.config.gc_num_sqc_per_wg=
p;
> >>> +    dev_info->sqc_data_cache_size =3D
> >>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> >>> +    dev_info->sqc_inst_cache_size =3D
> >>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> >>> +    dev_info->gl1c_cache_size =3D
> >>> adev->gfx.config.gc_gl1c_size_per_instance *
> >>> +                    adev->gfx.config.gc_gl1c_per_sa;
> >>> +    dev_info->gl2c_cache_size =3D adev->gfx.config.gc_gl2c_per_gpu;
> >>> +    dev_info->mall_size =3D adev->gmc.mall_size;
> >>> +
> >>> +
> >>> +    if (adev->gfx.funcs->get_gfx_shadow_info) {
> >>> +        struct amdgpu_gfx_shadow_info shadow_info;
> >>> +
> >>> +        ret =3D amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
> >> This failure is ignored in the present logic and rest of the informati=
on
> >> is filled. Probably, need to continue the same way.
> >
> > Since this is the information that we are sharing with user and on any
> > failure we just decide not to populate those fields. By default all the
> > members are initialized to zero and they
> >
> > are updated when we have valid values. To me seems the right logic
> > instead of failing the complete call, we provide the information what w=
e
> > have.
> >
>
> Actually, this is not what is really done. If you fail here, then this
> happens down the call. It doesn't copy, instead frees without copying to
> userspace.

Right.  We need to retain the same functionality in the IOCTL.

Alex

>
> +        ret =3D amdgpu_device_info(adev, dev_info);
> +        if (!ret) {
>
> Thanks,
> Lijo
>
> > Regards
> > Sunil
> >
> >>
> >> Thanks,
> >> Lijo
> >>
> >>> +        if (!ret) {
> >>> +            dev_info->shadow_size =3D shadow_info.shadow_size;
> >>> +            dev_info->shadow_alignment =3D shadow_info.shadow_alignm=
ent;
> >>> +            dev_info->csa_size =3D shadow_info.csa_size;
> >>> +            dev_info->csa_alignment =3D shadow_info.csa_alignment;
> >>> +        }
> >>> +    }
> >>> +    return ret;
> >>> +}
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>> index a66d47865e3b..24f775c68a51 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev,
> >>> void *data, struct drm_file *filp)
> >>>       }
> >>>       case AMDGPU_INFO_DEV_INFO: {
> >>>           struct drm_amdgpu_info_device *dev_info;
> >>> -        uint64_t vm_size;
> >>> -        uint32_t pcie_gen_mask;
> >>>             dev_info =3D kzalloc(sizeof(*dev_info), GFP_KERNEL);
> >>>           if (!dev_info)
> >>>               return -ENOMEM;
> >>>   -        dev_info->device_id =3D adev->pdev->device;
> >>> -        dev_info->chip_rev =3D adev->rev_id;
> >>> -        dev_info->external_rev =3D adev->external_rev_id;
> >>> -        dev_info->pci_rev =3D adev->pdev->revision;
> >>> -        dev_info->family =3D adev->family;
> >>> -        dev_info->num_shader_engines =3D
> >>> adev->gfx.config.max_shader_engines;
> >>> -        dev_info->num_shader_arrays_per_engine =3D
> >>> adev->gfx.config.max_sh_per_se;
> >>> -        /* return all clocks in KHz */
> >>> -        dev_info->gpu_counter_freq =3D amdgpu_asic_get_xclk(adev) * =
10;
> >>> -        if (adev->pm.dpm_enabled) {
> >>> -            dev_info->max_engine_clock =3D amdgpu_dpm_get_sclk(adev,
> >>> false) * 10;
> >>> -            dev_info->max_memory_clock =3D amdgpu_dpm_get_mclk(adev,
> >>> false) * 10;
> >>> -            dev_info->min_engine_clock =3D amdgpu_dpm_get_sclk(adev,
> >>> true) * 10;
> >>> -            dev_info->min_memory_clock =3D amdgpu_dpm_get_mclk(adev,
> >>> true) * 10;
> >>> -        } else {
> >>> -            dev_info->max_engine_clock =3D
> >>> -                dev_info->min_engine_clock =3D
> >>> -                    adev->clock.default_sclk * 10;
> >>> -            dev_info->max_memory_clock =3D
> >>> -                dev_info->min_memory_clock =3D
> >>> -                    adev->clock.default_mclk * 10;
> >>> -        }
> >>> -        dev_info->enabled_rb_pipes_mask =3D
> >>> adev->gfx.config.backend_enable_mask;
> >>> -        dev_info->num_rb_pipes =3D adev->gfx.config.max_backends_per=
_se *
> >>> -            adev->gfx.config.max_shader_engines;
> >>> -        dev_info->num_hw_gfx_contexts =3D
> >>> adev->gfx.config.max_hw_contexts;
> >>> -        dev_info->ids_flags =3D 0;
> >>> -        if (adev->flags & AMD_IS_APU)
> >>> -            dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_FUSION;
> >>> -        if (adev->gfx.mcbp)
> >>> -            dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_PREEMPTION;
> >>> -        if (amdgpu_is_tmz(adev))
> >>> -            dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_TMZ;
> >>> -        if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> >>> -            dev_info->ids_flags |=3D
> >>> AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
> >>> -
> >>> -        vm_size =3D adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
> >>> -        vm_size -=3D AMDGPU_VA_RESERVED_TOP;
> >>> -
> >>> -        /* Older VCE FW versions are buggy and can handle only
> >>> 40bits */
> >>> -        if (adev->vce.fw_version &&
> >>> -            adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
> >>> -            vm_size =3D min(vm_size, 1ULL << 40);
> >>> -
> >>> -        dev_info->virtual_address_offset =3D AMDGPU_VA_RESERVED_BOTT=
OM;
> >>> -        dev_info->virtual_address_max =3D
> >>> -            min(vm_size, AMDGPU_GMC_HOLE_START);
> >>> -
> >>> -        if (vm_size > AMDGPU_GMC_HOLE_START) {
> >>> -            dev_info->high_va_offset =3D AMDGPU_GMC_HOLE_END;
> >>> -            dev_info->high_va_max =3D AMDGPU_GMC_HOLE_END | vm_size;
> >>> -        }
> >>> -        dev_info->virtual_address_alignment =3D max_t(u32, PAGE_SIZE=
,
> >>> AMDGPU_GPU_PAGE_SIZE);
> >>> -        dev_info->pte_fragment_size =3D (1 <<
> >>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
> >>> -        dev_info->gart_page_size =3D max_t(u32, PAGE_SIZE,
> >>> AMDGPU_GPU_PAGE_SIZE);
> >>> -        dev_info->cu_active_number =3D adev->gfx.cu_info.number;
> >>> -        dev_info->cu_ao_mask =3D adev->gfx.cu_info.ao_cu_mask;
> >>> -        dev_info->ce_ram_size =3D adev->gfx.ce_ram_size;
> >>> -        memcpy(&dev_info->cu_ao_bitmap[0],
> >>> &adev->gfx.cu_info.ao_cu_bitmap[0],
> >>> -               sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> >>> -        memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0]=
,
> >>> -               sizeof(dev_info->cu_bitmap));
> >>> -        dev_info->vram_type =3D adev->gmc.vram_type;
> >>> -        dev_info->vram_bit_width =3D adev->gmc.vram_width;
> >>> -        dev_info->vce_harvest_config =3D adev->vce.harvest_config;
> >>> -        dev_info->gc_double_offchip_lds_buf =3D
> >>> -            adev->gfx.config.double_offchip_lds_buf;
> >>> -        dev_info->wave_front_size =3D adev->gfx.cu_info.wave_front_s=
ize;
> >>> -        dev_info->num_shader_visible_vgprs =3D adev->gfx.config.max_=
gprs;
> >>> -        dev_info->num_cu_per_sh =3D adev->gfx.config.max_cu_per_sh;
> >>> -        dev_info->num_tcc_blocks =3D
> >>> adev->gfx.config.max_texture_channel_caches;
> >>> -        dev_info->gs_vgt_table_depth =3D
> >>> adev->gfx.config.gs_vgt_table_depth;
> >>> -        dev_info->gs_prim_buffer_depth =3D
> >>> adev->gfx.config.gs_prim_buffer_depth;
> >>> -        dev_info->max_gs_waves_per_vgt =3D
> >>> adev->gfx.config.max_gs_threads;
> >>> -
> >>> -        if (adev->family >=3D AMDGPU_FAMILY_NV)
> >>> -            dev_info->pa_sc_tile_steering_override =3D
> >>> -                adev->gfx.config.pa_sc_tile_steering_override;
> >>> -
> >>> -        dev_info->tcc_disabled_mask =3D
> >>> adev->gfx.config.tcc_disabled_mask;
> >>> -
> >>> -        /* Combine the chip gen mask with the platform (CPU/mobo)
> >>> mask. */
> >>> -        pcie_gen_mask =3D adev->pm.pcie_gen_mask &
> >>> (adev->pm.pcie_gen_mask >> 16);
> >>> -        dev_info->pcie_gen =3D fls(pcie_gen_mask);
> >>> -        dev_info->pcie_num_lanes =3D
> >>> -            adev->pm.pcie_mlw_mask &
> >>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
> >>> -            adev->pm.pcie_mlw_mask &
> >>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
> >>> -            adev->pm.pcie_mlw_mask &
> >>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
> >>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8
> >>> ? 8 :
> >>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4
> >>> ? 4 :
> >>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2
> >>> ? 2 : 1;
> >>> -
> >>> -        dev_info->tcp_cache_size =3D adev->gfx.config.gc_tcp_l1_size=
;
> >>> -        dev_info->num_sqc_per_wgp =3D
> >>> adev->gfx.config.gc_num_sqc_per_wgp;
> >>> -        dev_info->sqc_data_cache_size =3D
> >>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> >>> -        dev_info->sqc_inst_cache_size =3D
> >>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> >>> -        dev_info->gl1c_cache_size =3D
> >>> adev->gfx.config.gc_gl1c_size_per_instance *
> >>> -                        adev->gfx.config.gc_gl1c_per_sa;
> >>> -        dev_info->gl2c_cache_size =3D adev->gfx.config.gc_gl2c_per_g=
pu;
> >>> -        dev_info->mall_size =3D adev->gmc.mall_size;
> >>> -
> >>> -
> >>> -        if (adev->gfx.funcs->get_gfx_shadow_info) {
> >>> -            struct amdgpu_gfx_shadow_info shadow_info;
> >>> -
> >>> -            ret =3D amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_inf=
o);
> >>> -            if (!ret) {
> >>> -                dev_info->shadow_size =3D shadow_info.shadow_size;
> >>> -                dev_info->shadow_alignment =3D
> >>> shadow_info.shadow_alignment;
> >>> -                dev_info->csa_size =3D shadow_info.csa_size;
> >>> -                dev_info->csa_alignment =3D shadow_info.csa_alignmen=
t;
> >>> -            }
> >>> +        ret =3D amdgpu_device_info(adev, dev_info);
> >>> +        if (!ret) {
> >>> +            kfree(dev_info);
> >>> +            return ret;
> >>>           }
> >>>             ret =3D copy_to_user(out, dev_info,
