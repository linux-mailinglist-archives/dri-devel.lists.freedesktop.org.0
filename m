Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4BD880023
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB0D10FB5B;
	Tue, 19 Mar 2024 14:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NFP8m7vw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F97E10FB52;
 Tue, 19 Mar 2024 14:59:19 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-29fb12a22afso1490042a91.3; 
 Tue, 19 Mar 2024 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710860359; x=1711465159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgtJsc9TdGVIfUhBSLZPUUFwAS2wM6yn9g2vhnX/KTE=;
 b=NFP8m7vws0GnCIualhi67odpm22ksRFXvF61KSA1qk1oqT1GUuoqU9hf+0OI3A0vpD
 RU4pFePI9nlt6tDe/XnPzkLthyDws4kB7kXxJ8TAa6gIYPCKbbEhVr+feHYmnCYQk72A
 afm5nY0wolacAsKgx1yhfBtIQYcnVfCaGHeAueTx6ynO0x0gwGPdt11XBSMAAK1CwMGp
 MoIZ1CPHXke5Osp8tKD1KCTIh4w65u4InrPgex8ARyiqETlxTZs6RmcnbrA3Qa7IyEHl
 1mKcRwmINaT/WuWWct6XG08T7dilF/aeN7ebWBamNvU7CtJtLPb/ASvACVskLN4WQkti
 lm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710860359; x=1711465159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgtJsc9TdGVIfUhBSLZPUUFwAS2wM6yn9g2vhnX/KTE=;
 b=CT1WQ7v3Gi5Apzkh5gdjiLWtvoAWJR3u08teslqEATtM4KJtJeoEH9fnCHmnQTj65+
 CfvZWjBF16V+VvZzJK02fkj5q6TUiD024mQG8HKDniBnl9CI4sSW9nthr7fS/bZtbWVh
 +2MQ0E5rJ1yA1dFIfEKh7m3xZCEEDRMlpr+zYLdd8FVI/ti4ItsyqXDPksN4JEirmDm0
 5e9CCt7qH+iNkKTTWHtQIvTQi9P3lx/KCvtk8OXnhcQfFAgecH2ufJ0JInAIw3svSMCn
 JnSQFZAfIaOJsChWZrGqv/eHi7vqiK/fptHKq/9YmCRvlJ1O2rdKEtl6JcWvOZ0LyTK8
 I+cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+JANPDQKAtRPggkcK+m/dIxvISRbPNpaL8ndmXZ8M1m+9v/D5hPJw1YRgW78vSaEFZC+Pyl/H9OWqO9tNRM35xXdA30nx1RszYAudn6X9Kj0OVSgHf5ql25VijXVMNw1eg6UNdnDoWn8lvIlWEQ==
X-Gm-Message-State: AOJu0Yx6ePygajeWOuDeMeGvjPcbYSX6ZP12RCQDDvcgTc9sGj5ro5WW
 xEydz6iyU//p+emQmVnIvbSjYv75rpN8rI3Ea6yg1mg/fB71p6L6jARlF2D5GN2SZO+UuQqcabN
 4CKO+lsmSbzVBKlBeOAepm18LfnJ+A35D
X-Google-Smtp-Source: AGHT+IFeGJw5dSQSVa0YWNywJ9/jdeC6d5h17ZKkWqDW0topkx7SDMpybtQVqbEBtygYDqGKE7R7S0CMOYQvdml9Gbo=
X-Received: by 2002:a17:90a:68cd:b0:29c:6ff8:fa32 with SMTP id
 q13-20020a17090a68cd00b0029c6ff8fa32mr10015525pjj.3.1710860358678; Tue, 19
 Mar 2024 07:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240319123208.851901-1-sunil.khatri@amd.com>
 <CADnq5_PW2ZQ8sP9NcX=f5QhHM-Ne=EQA7k9BKwwwZbgsRyV4-A@mail.gmail.com>
 <8e36fae9-6501-435e-a01c-93990bef57f7@gmail.com>
In-Reply-To: <8e36fae9-6501-435e-a01c-93990bef57f7@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Mar 2024 10:59:06 -0400
Message-ID: <CADnq5_PRXnBVtUVk+7iTHr43KGTbbfHxCwB1jZPo-sGCadY5Qw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
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

On Tue, Mar 19, 2024 at 10:56=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 19.03.24 um 15:26 schrieb Alex Deucher:
> > On Tue, Mar 19, 2024 at 8:32=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.=
com> wrote:
> >> Refactor the code so debugfs and devcoredump can reuse
> >> the common information and avoid unnecessary copy of it.
> >>
> >> created a new file which would be the right place to
> >> hold functions which will be used between sysfs, debugfs
> >> and devcoredump.
> >>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++=
++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
> >>   4 files changed, 157 insertions(+), 115 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd=
/amdgpu/Makefile
> >> index 4536c8ad0e11..05d34f4b18f5 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> >> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> >> @@ -80,7 +80,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o =
amdgpu_kms.o \
> >>          amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o=
 \
> >>          amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> >>          amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> >> -       amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
> >> +       amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amd=
gpu_devinfo.o
> >>
> >>   amdgpu-$(CONFIG_PROC_FS) +=3D amdgpu_fdinfo.o
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu.h
> >> index 9c62552bec34..0267870aa9b1 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >> @@ -1609,4 +1609,5 @@ extern const struct attribute_group amdgpu_vram_=
mgr_attr_group;
> >>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> >>   extern const struct attribute_group amdgpu_flash_attr_group;
> >>
> >> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_=
info_device *dev_info);
> >>   #endif
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_devinfo.c
> >> new file mode 100644
> >> index 000000000000..d2c15a1dcb0d
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> >> @@ -0,0 +1,151 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright 2024 Advanced Micro Devices, Inc.
> >> + *
> >> + * Permission is hereby granted, free of charge, to any person obtain=
ing a
> >> + * copy of this software and associated documentation files (the "Sof=
tware"),
> >> + * to deal in the Software without restriction, including without lim=
itation
> >> + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,
> >> + * and/or sell copies of the Software, and to permit persons to whom =
the
> >> + * Software is furnished to do so, subject to the following condition=
s:
> >> + *
> >> + * The above copyright notice and this permission notice shall be inc=
luded in
> >> + * all copies or substantial portions of the Software.
> >> + *
> >> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> >> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> >> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT=
 SHALL
> >> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMA=
GES OR
> >> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> >> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR
> >> + * OTHER DEALINGS IN THE SOFTWARE.
> >> + *
> >> + */
> >> +
> >> +#include "amdgpu.h"
> >> +#include "amd_pcie.h"
> >> +
> >> +#include <drm/amdgpu_drm.h>
> >> +
> >> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_=
info_device *dev_info)
> > We can probably keep this in amdgpu_kms.c unless that file is getting
> > too big.  I don't think it warrants a new file at this point.  If you
> > do keep it in amdgpu_kms.c, I'd recommend renaming it to something
> > like amdgpu_kms_device_info() to keep the naming conventions.
>
> We should not be using this for anything new in the first place.
>
> A whole bunch of the stuff inside the devinfo structure has been
> deprecated because we found that putting everything into one structure
> was a bad idea.

It's a convenient way to collect a lot of useful information that we
want in the core dump.  Plus it's not going anywhere because we need
to keep compatibility in the IOCTL.

Alex

>
> Regards,
> Christian.
>
> >
> >> +{
> >> +       int ret;
> >> +       uint64_t vm_size;
> >> +       uint32_t pcie_gen_mask;
> >> +
> >> +       if (dev_info =3D=3D NULL)
> >> +               return -EINVAL;
> >> +
> >> +       dev_info->device_id =3D adev->pdev->device;
> >> +       dev_info->chip_rev =3D adev->rev_id;
> >> +       dev_info->external_rev =3D adev->external_rev_id;
> >> +       dev_info->pci_rev =3D adev->pdev->revision;
> >> +       dev_info->family =3D adev->family;
> >> +       dev_info->num_shader_engines =3D adev->gfx.config.max_shader_e=
ngines;
> >> +       dev_info->num_shader_arrays_per_engine =3D adev->gfx.config.ma=
x_sh_per_se;
> >> +       /* return all clocks in KHz */
> >> +       dev_info->gpu_counter_freq =3D amdgpu_asic_get_xclk(adev) * 10=
;
> >> +       if (adev->pm.dpm_enabled) {
> >> +               dev_info->max_engine_clock =3D amdgpu_dpm_get_sclk(ade=
v, false) * 10;
> >> +               dev_info->max_memory_clock =3D amdgpu_dpm_get_mclk(ade=
v, false) * 10;
> >> +               dev_info->min_engine_clock =3D amdgpu_dpm_get_sclk(ade=
v, true) * 10;
> >> +               dev_info->min_memory_clock =3D amdgpu_dpm_get_mclk(ade=
v, true) * 10;
> >> +       } else {
> >> +               dev_info->max_engine_clock =3D
> >> +                       dev_info->min_engine_clock =3D
> >> +                               adev->clock.default_sclk * 10;
> >> +               dev_info->max_memory_clock =3D
> >> +                       dev_info->min_memory_clock =3D
> >> +                               adev->clock.default_mclk * 10;
> >> +               }
> >> +       dev_info->enabled_rb_pipes_mask =3D adev->gfx.config.backend_e=
nable_mask;
> >> +       dev_info->num_rb_pipes =3D adev->gfx.config.max_backends_per_s=
e *
> >> +               adev->gfx.config.max_shader_engines;
> >> +       dev_info->num_hw_gfx_contexts =3D adev->gfx.config.max_hw_cont=
exts;
> >> +       dev_info->ids_flags =3D 0;
> >> +       if (adev->flags & AMD_IS_APU)
> >> +               dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_FUSION;
> >> +       if (adev->gfx.mcbp)
> >> +               dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_PREEMPTION;
> >> +       if (amdgpu_is_tmz(adev))
> >> +               dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_TMZ;
> >> +       if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> >> +               dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_CONFORMANT_T=
RUNC_COORD;
> >> +
> >> +       vm_size =3D adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
> >> +       vm_size -=3D AMDGPU_VA_RESERVED_TOP;
> >> +
> >> +       /* Older VCE FW versions are buggy and can handle only 40bits =
*/
> >> +       if (adev->vce.fw_version && adev->vce.fw_version < AMDGPU_VCE_=
FW_53_45)
> >> +               vm_size =3D min(vm_size, 1ULL << 40);
> >> +
> >> +       dev_info->virtual_address_offset =3D AMDGPU_VA_RESERVED_BOTTOM=
;
> >> +       dev_info->virtual_address_max =3D min(vm_size, AMDGPU_GMC_HOLE=
_START);
> >> +
> >> +       if (vm_size > AMDGPU_GMC_HOLE_START) {
> >> +               dev_info->high_va_offset =3D AMDGPU_GMC_HOLE_END;
> >> +               dev_info->high_va_max =3D AMDGPU_GMC_HOLE_END | vm_siz=
e;
> >> +       }
> >> +       dev_info->virtual_address_alignment =3D max_t(u32, PAGE_SIZE, =
AMDGPU_GPU_PAGE_SIZE);
> >> +       dev_info->pte_fragment_size =3D (1 << adev->vm_manager.fragmen=
t_size) * AMDGPU_GPU_PAGE_SIZE;
> >> +       dev_info->gart_page_size =3D max_t(u32, PAGE_SIZE, AMDGPU_GPU_=
PAGE_SIZE);
> >> +       dev_info->cu_active_number =3D adev->gfx.cu_info.number;
> >> +       dev_info->cu_ao_mask =3D adev->gfx.cu_info.ao_cu_mask;
> >> +       dev_info->ce_ram_size =3D adev->gfx.ce_ram_size;
> >> +       memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bi=
tmap[0],
> >> +              sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> >> +       memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
> >> +              sizeof(dev_info->cu_bitmap));
> >> +       dev_info->vram_type =3D adev->gmc.vram_type;
> >> +       dev_info->vram_bit_width =3D adev->gmc.vram_width;
> >> +       dev_info->vce_harvest_config =3D adev->vce.harvest_config;
> >> +       dev_info->gc_double_offchip_lds_buf =3D
> >> +               adev->gfx.config.double_offchip_lds_buf;
> >> +       dev_info->wave_front_size =3D adev->gfx.cu_info.wave_front_siz=
e;
> >> +       dev_info->num_shader_visible_vgprs =3D adev->gfx.config.max_gp=
rs;
> >> +       dev_info->num_cu_per_sh =3D adev->gfx.config.max_cu_per_sh;
> >> +       dev_info->num_tcc_blocks =3D adev->gfx.config.max_texture_chan=
nel_caches;
> >> +       dev_info->gs_vgt_table_depth =3D adev->gfx.config.gs_vgt_table=
_depth;
> >> +       dev_info->gs_prim_buffer_depth =3D adev->gfx.config.gs_prim_bu=
ffer_depth;
> >> +       dev_info->max_gs_waves_per_vgt =3D adev->gfx.config.max_gs_thr=
eads;
> >> +
> >> +       if (adev->family >=3D AMDGPU_FAMILY_NV)
> >> +               dev_info->pa_sc_tile_steering_override =3D
> >> +                       adev->gfx.config.pa_sc_tile_steering_override;
> >> +
> >> +       dev_info->tcc_disabled_mask =3D adev->gfx.config.tcc_disabled_=
mask;
> >> +
> >> +       /* Combine the chip gen mask with the platform (CPU/mobo) mask=
. */
> >> +       pcie_gen_mask =3D adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_=
mask >> 16);
> >> +       dev_info->pcie_gen =3D fls(pcie_gen_mask);
> >> +       dev_info->pcie_num_lanes =3D
> >> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_=
X32 ? 32 :
> >> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_=
X16 ? 16 :
> >> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_=
X12 ? 12 :
> >> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_=
X8 ? 8 :
> >> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_=
X4 ? 4 :
> >> +               adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_=
X2 ? 2 : 1;
> >> +
> >> +       dev_info->tcp_cache_size =3D adev->gfx.config.gc_tcp_l1_size;
> >> +       dev_info->num_sqc_per_wgp =3D adev->gfx.config.gc_num_sqc_per_=
wgp;
> >> +       dev_info->sqc_data_cache_size =3D adev->gfx.config.gc_l1_data_=
cache_size_per_sqc;
> >> +       dev_info->sqc_inst_cache_size =3D adev->gfx.config.gc_l1_instr=
uction_cache_size_per_sqc;
> >> +       dev_info->gl1c_cache_size =3D adev->gfx.config.gc_gl1c_size_pe=
r_instance *
> >> +                                   adev->gfx.config.gc_gl1c_per_sa;
> >> +       dev_info->gl2c_cache_size =3D adev->gfx.config.gc_gl2c_per_gpu=
;
> >> +       dev_info->mall_size =3D adev->gmc.mall_size;
> >> +
> >> +
> >> +       if (adev->gfx.funcs->get_gfx_shadow_info) {
> >> +               struct amdgpu_gfx_shadow_info shadow_info;
> >> +
> >> +               ret =3D amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_i=
nfo);
> >> +               if (!ret) {
> >> +                       dev_info->shadow_size =3D shadow_info.shadow_s=
ize;
> >> +                       dev_info->shadow_alignment =3D shadow_info.sha=
dow_alignment;
> >> +                       dev_info->csa_size =3D shadow_info.csa_size;
> >> +                       dev_info->csa_alignment =3D shadow_info.csa_al=
ignment;
> >> +               }
> >> +       }
> >> +       return ret;
> >> +}
> > As noted by Lijo, this should probably be a void function since we
> > want to populate as much information as we can and we can't break the
> > IOCTL interface.
> >
> > Alex
> >
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_kms.c
> >> index a66d47865e3b..24f775c68a51 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev, v=
oid *data, struct drm_file *filp)
> >>          }
> >>          case AMDGPU_INFO_DEV_INFO: {
> >>                  struct drm_amdgpu_info_device *dev_info;
> >> -               uint64_t vm_size;
> >> -               uint32_t pcie_gen_mask;
> >>
> >>                  dev_info =3D kzalloc(sizeof(*dev_info), GFP_KERNEL);
> >>                  if (!dev_info)
> >>                          return -ENOMEM;
> >>
> >> -               dev_info->device_id =3D adev->pdev->device;
> >> -               dev_info->chip_rev =3D adev->rev_id;
> >> -               dev_info->external_rev =3D adev->external_rev_id;
> >> -               dev_info->pci_rev =3D adev->pdev->revision;
> >> -               dev_info->family =3D adev->family;
> >> -               dev_info->num_shader_engines =3D adev->gfx.config.max_=
shader_engines;
> >> -               dev_info->num_shader_arrays_per_engine =3D adev->gfx.c=
onfig.max_sh_per_se;
> >> -               /* return all clocks in KHz */
> >> -               dev_info->gpu_counter_freq =3D amdgpu_asic_get_xclk(ad=
ev) * 10;
> >> -               if (adev->pm.dpm_enabled) {
> >> -                       dev_info->max_engine_clock =3D amdgpu_dpm_get_=
sclk(adev, false) * 10;
> >> -                       dev_info->max_memory_clock =3D amdgpu_dpm_get_=
mclk(adev, false) * 10;
> >> -                       dev_info->min_engine_clock =3D amdgpu_dpm_get_=
sclk(adev, true) * 10;
> >> -                       dev_info->min_memory_clock =3D amdgpu_dpm_get_=
mclk(adev, true) * 10;
> >> -               } else {
> >> -                       dev_info->max_engine_clock =3D
> >> -                               dev_info->min_engine_clock =3D
> >> -                                       adev->clock.default_sclk * 10;
> >> -                       dev_info->max_memory_clock =3D
> >> -                               dev_info->min_memory_clock =3D
> >> -                                       adev->clock.default_mclk * 10;
> >> -               }
> >> -               dev_info->enabled_rb_pipes_mask =3D adev->gfx.config.b=
ackend_enable_mask;
> >> -               dev_info->num_rb_pipes =3D adev->gfx.config.max_backen=
ds_per_se *
> >> -                       adev->gfx.config.max_shader_engines;
> >> -               dev_info->num_hw_gfx_contexts =3D adev->gfx.config.max=
_hw_contexts;
> >> -               dev_info->ids_flags =3D 0;
> >> -               if (adev->flags & AMD_IS_APU)
> >> -                       dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_FUSI=
ON;
> >> -               if (adev->gfx.mcbp)
> >> -                       dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_PREE=
MPTION;
> >> -               if (amdgpu_is_tmz(adev))
> >> -                       dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_TMZ;
> >> -               if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> >> -                       dev_info->ids_flags |=3D AMDGPU_IDS_FLAGS_CONF=
ORMANT_TRUNC_COORD;
> >> -
> >> -               vm_size =3D adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE=
_SIZE;
> >> -               vm_size -=3D AMDGPU_VA_RESERVED_TOP;
> >> -
> >> -               /* Older VCE FW versions are buggy and can handle only=
 40bits */
> >> -               if (adev->vce.fw_version &&
> >> -                   adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
> >> -                       vm_size =3D min(vm_size, 1ULL << 40);
> >> -
> >> -               dev_info->virtual_address_offset =3D AMDGPU_VA_RESERVE=
D_BOTTOM;
> >> -               dev_info->virtual_address_max =3D
> >> -                       min(vm_size, AMDGPU_GMC_HOLE_START);
> >> -
> >> -               if (vm_size > AMDGPU_GMC_HOLE_START) {
> >> -                       dev_info->high_va_offset =3D AMDGPU_GMC_HOLE_E=
ND;
> >> -                       dev_info->high_va_max =3D AMDGPU_GMC_HOLE_END =
| vm_size;
> >> -               }
> >> -               dev_info->virtual_address_alignment =3D max_t(u32, PAG=
E_SIZE, AMDGPU_GPU_PAGE_SIZE);
> >> -               dev_info->pte_fragment_size =3D (1 << adev->vm_manager=
.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
> >> -               dev_info->gart_page_size =3D max_t(u32, PAGE_SIZE, AMD=
GPU_GPU_PAGE_SIZE);
> >> -               dev_info->cu_active_number =3D adev->gfx.cu_info.numbe=
r;
> >> -               dev_info->cu_ao_mask =3D adev->gfx.cu_info.ao_cu_mask;
> >> -               dev_info->ce_ram_size =3D adev->gfx.ce_ram_size;
> >> -               memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.=
ao_cu_bitmap[0],
> >> -                      sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> >> -               memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bit=
map[0],
> >> -                      sizeof(dev_info->cu_bitmap));
> >> -               dev_info->vram_type =3D adev->gmc.vram_type;
> >> -               dev_info->vram_bit_width =3D adev->gmc.vram_width;
> >> -               dev_info->vce_harvest_config =3D adev->vce.harvest_con=
fig;
> >> -               dev_info->gc_double_offchip_lds_buf =3D
> >> -                       adev->gfx.config.double_offchip_lds_buf;
> >> -               dev_info->wave_front_size =3D adev->gfx.cu_info.wave_f=
ront_size;
> >> -               dev_info->num_shader_visible_vgprs =3D adev->gfx.confi=
g.max_gprs;
> >> -               dev_info->num_cu_per_sh =3D adev->gfx.config.max_cu_pe=
r_sh;
> >> -               dev_info->num_tcc_blocks =3D adev->gfx.config.max_text=
ure_channel_caches;
> >> -               dev_info->gs_vgt_table_depth =3D adev->gfx.config.gs_v=
gt_table_depth;
> >> -               dev_info->gs_prim_buffer_depth =3D adev->gfx.config.gs=
_prim_buffer_depth;
> >> -               dev_info->max_gs_waves_per_vgt =3D adev->gfx.config.ma=
x_gs_threads;
> >> -
> >> -               if (adev->family >=3D AMDGPU_FAMILY_NV)
> >> -                       dev_info->pa_sc_tile_steering_override =3D
> >> -                               adev->gfx.config.pa_sc_tile_steering_o=
verride;
> >> -
> >> -               dev_info->tcc_disabled_mask =3D adev->gfx.config.tcc_d=
isabled_mask;
> >> -
> >> -               /* Combine the chip gen mask with the platform (CPU/mo=
bo) mask. */
> >> -               pcie_gen_mask =3D adev->pm.pcie_gen_mask & (adev->pm.p=
cie_gen_mask >> 16);
> >> -               dev_info->pcie_gen =3D fls(pcie_gen_mask);
> >> -               dev_info->pcie_num_lanes =3D
> >> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_=
SUPPORT_X32 ? 32 :
> >> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_=
SUPPORT_X16 ? 16 :
> >> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_=
SUPPORT_X12 ? 12 :
> >> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_=
SUPPORT_X8 ? 8 :
> >> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_=
SUPPORT_X4 ? 4 :
> >> -                       adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_=
SUPPORT_X2 ? 2 : 1;
> >> -
> >> -               dev_info->tcp_cache_size =3D adev->gfx.config.gc_tcp_l=
1_size;
> >> -               dev_info->num_sqc_per_wgp =3D adev->gfx.config.gc_num_=
sqc_per_wgp;
> >> -               dev_info->sqc_data_cache_size =3D adev->gfx.config.gc_=
l1_data_cache_size_per_sqc;
> >> -               dev_info->sqc_inst_cache_size =3D adev->gfx.config.gc_=
l1_instruction_cache_size_per_sqc;
> >> -               dev_info->gl1c_cache_size =3D adev->gfx.config.gc_gl1c=
_size_per_instance *
> >> -                                           adev->gfx.config.gc_gl1c_p=
er_sa;
> >> -               dev_info->gl2c_cache_size =3D adev->gfx.config.gc_gl2c=
_per_gpu;
> >> -               dev_info->mall_size =3D adev->gmc.mall_size;
> >> -
> >> -
> >> -               if (adev->gfx.funcs->get_gfx_shadow_info) {
> >> -                       struct amdgpu_gfx_shadow_info shadow_info;
> >> -
> >> -                       ret =3D amdgpu_gfx_get_gfx_shadow_info(adev, &=
shadow_info);
> >> -                       if (!ret) {
> >> -                               dev_info->shadow_size =3D shadow_info.=
shadow_size;
> >> -                               dev_info->shadow_alignment =3D shadow_=
info.shadow_alignment;
> >> -                               dev_info->csa_size =3D shadow_info.csa=
_size;
> >> -                               dev_info->csa_alignment =3D shadow_inf=
o.csa_alignment;
> >> -                       }
> >> +               ret =3D amdgpu_device_info(adev, dev_info);
> >> +               if (!ret) {
> >> +                       kfree(dev_info);
> >> +                       return ret;
> >>                  }
> >>
> >>                  ret =3D copy_to_user(out, dev_info,
> >> --
> >> 2.34.1
> >>
>
