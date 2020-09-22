Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48295274593
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 17:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119716E8A0;
	Tue, 22 Sep 2020 15:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FEB6E84B;
 Tue, 22 Sep 2020 15:41:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v12so1995722wmh.3;
 Tue, 22 Sep 2020 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Cbe74dQYS26tlKuXG2nmZit12ZE13LkNg/TYRM8EF0=;
 b=Mb4qv5RRsHgf4TheKQKAjNb+btsujvWoRv5n/Fawxz90sqTHE8ajFjEnN20a1ACwOP
 G+J1OANpx8s2OM43mvB3KSEGtD6Z7AleVSqCE4T/KHMu1So1QdeTk3tYePDzkOQuSmUt
 aMWaG1LcjGiRdOhwl1I+WWtN0l8uESdOqF9xqERHkXJRZKfHPf1Zt5kG3ssdOEljP4Sg
 lO7d8H8lhVA9DrDtJQ646b93JCYvMDylekCaTniSyatFkhp8Mpl0YHpQyXqpMc85rtAT
 srDkMcWNPUAar1EnRkMrLrw0fN3zA2Ua3ak2A6BzAcuuqUpzp28y+yHx4i67c8Ezi6b6
 RTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Cbe74dQYS26tlKuXG2nmZit12ZE13LkNg/TYRM8EF0=;
 b=hgFp+nzQrhpGRNZNDN08WZ70BVeKgoJpwSAwXksLJaD9UJZANDgWIkKPpjc3et43Rv
 PfUpWjeeQk1RRkNCJS0HLALi57QARM2JcxL5wXKbyIm1/segQGV32T0Z7AJjyA0cU/dl
 FXreQuhVBPX9U1hG+Kx15ixQhaAfyOwtyiUTNXMg/ChR1kSoUMArU2/mkUySI58hlMhj
 /HkWTlqBFVg6ew5QsQ3RIs0/CaXQ6fqRrlrUBqElDsgnTTf2pxz2Ek+0HygmN9fVAIE1
 tNhqK79qESiW5hJ/SGop3bn8nmoUw5lmqv5fr0dW35E24KtMPZTjIxBVb4XsTKsR7X+q
 qCRQ==
X-Gm-Message-State: AOAM530gjfB4pcuQnxKssgsUx3Q+3iDlyrOHtTQbEpm0rBPXhEmMD3y5
 6RFvhKF6CepNkgURw5/0NtjS7e/pIBl12zHiKoo=
X-Google-Smtp-Source: ABdhPJwZUwy5qOgLBDJ3rndDnNGg29MsKwc8L72EOLM53unhVSRkufehHY2fqbfHZ3NijmF6JttkVh0uCCd1m6Tr3QM=
X-Received: by 2002:a1c:a184:: with SMTP id k126mr1640799wme.39.1600789270900; 
 Tue, 22 Sep 2020 08:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200922125431.27943-1-bernard@vivo.com>
In-Reply-To: <20200922125431.27943-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Sep 2020 11:40:59 -0400
Message-ID: <CADnq5_Mdn6xh4OczCK=2d-U1FXLeerCb0WhH48MGLd-v+kRpgg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd:fix typoes in comments
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, opensource.kernel@vivo.com,
 Jonathan Kim <jonathan.kim@amd.com>, Jane Jian <Jane.Jian@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, Huang Rui <ray.huang@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Sep 22, 2020 at 9:11 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Change the comment typo: "programm" -> "program".
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 2 +-
>  drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c  | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c  | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c  | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c  | 2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c  | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c  | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c  | 4 ++--
>  8 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 770025a5e500..7c46937c1c0e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -98,7 +98,7 @@ struct amdgpu_bo_list_entry;
>  #define AMDGPU_PTE_MTYPE_NV10(a)       ((uint64_t)(a) << 48)
>  #define AMDGPU_PTE_MTYPE_NV10_MASK     AMDGPU_PTE_MTYPE_NV10(7ULL)
>
> -/* How to programm VM fault handling */
> +/* How to program VM fault handling */
>  #define AMDGPU_VM_FAULT_STOP_NEVER     0
>  #define AMDGPU_VM_FAULT_STOP_FIRST     1
>  #define AMDGPU_VM_FAULT_STOP_ALWAYS    2
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> index 3cafba726587..b0c0c438fc93 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
> @@ -348,7 +348,7 @@ static int uvd_v4_2_start(struct amdgpu_device *adev)
>         /* Set the write pointer delay */
>         WREG32(mmUVD_RBC_RB_WPTR_CNTL, 0);
>
> -       /* programm the 4GB memory segment for rptr and ring buffer */
> +       /* program the 4GB memory segment for rptr and ring buffer */
>         WREG32(mmUVD_LMI_EXT40_ADDR, upper_32_bits(ring->gpu_addr) |
>                                    (0x7 << 16) | (0x1 << 31));
>
> @@ -541,7 +541,7 @@ static void uvd_v4_2_mc_resume(struct amdgpu_device *adev)
>         uint64_t addr;
>         uint32_t size;
>
> -       /* programm the VCPU memory controller bits 0-27 */
> +       /* program the VCPU memory controller bits 0-27 */
>         addr = (adev->uvd.inst->gpu_addr + AMDGPU_UVD_FIRMWARE_OFFSET) >> 3;
>         size = AMDGPU_UVD_FIRMWARE_SIZE(adev) >> 3;
>         WREG32(mmUVD_VCPU_CACHE_OFFSET0, addr);
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> index a566ff926e90..6e57001f6d0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> @@ -253,7 +253,7 @@ static void uvd_v5_0_mc_resume(struct amdgpu_device *adev)
>         uint64_t offset;
>         uint32_t size;
>
> -       /* programm memory controller bits 0-27 */
> +       /* program memory controller bits 0-27 */
>         WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
>                         lower_32_bits(adev->uvd.inst->gpu_addr));
>         WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
> @@ -404,7 +404,7 @@ static int uvd_v5_0_start(struct amdgpu_device *adev)
>         /* set the wb address */
>         WREG32(mmUVD_RBC_RB_RPTR_ADDR, (upper_32_bits(ring->gpu_addr) >> 2));
>
> -       /* programm the RB_BASE for ring buffer */
> +       /* program the RB_BASE for ring buffer */
>         WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                         lower_32_bits(ring->gpu_addr));
>         WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index 0a880bc101b8..d2d90fe5c6f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -583,7 +583,7 @@ static void uvd_v6_0_mc_resume(struct amdgpu_device *adev)
>         uint64_t offset;
>         uint32_t size;
>
> -       /* programm memory controller bits 0-27 */
> +       /* program memory controller bits 0-27 */
>         WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
>                         lower_32_bits(adev->uvd.inst->gpu_addr));
>         WREG32(mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
> @@ -825,7 +825,7 @@ static int uvd_v6_0_start(struct amdgpu_device *adev)
>         /* set the wb address */
>         WREG32(mmUVD_RBC_RB_RPTR_ADDR, (upper_32_bits(ring->gpu_addr) >> 2));
>
> -       /* programm the RB_BASE for ring buffer */
> +       /* program the RB_BASE for ring buffer */
>         WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                         lower_32_bits(ring->gpu_addr));
>         WREG32(mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index e07e3fae99b5..b44c8677ce8d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -1073,7 +1073,7 @@ static int uvd_v7_0_start(struct amdgpu_device *adev)
>                 WREG32_SOC15(UVD, k, mmUVD_RBC_RB_RPTR_ADDR,
>                                 (upper_32_bits(ring->gpu_addr) >> 2));
>
> -               /* programm the RB_BASE for ring buffer */
> +               /* program the RB_BASE for ring buffer */
>                 WREG32_SOC15(UVD, k, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                                 lower_32_bits(ring->gpu_addr));
>                 WREG32_SOC15(UVD, k, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> index 927c330fad21..73699eafb51e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -910,7 +910,7 @@ static int vcn_v1_0_start_spg_mode(struct amdgpu_device *adev)
>         WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_RPTR_ADDR,
>                         (upper_32_bits(ring->gpu_addr) >> 2));
>
> -       /* programm the RB_BASE for ring buffer */
> +       /* program the RB_BASE for ring buffer */
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                         lower_32_bits(ring->gpu_addr));
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> @@ -1068,7 +1068,7 @@ static int vcn_v1_0_start_dpg_mode(struct amdgpu_device *adev)
>         WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_RPTR_ADDR,
>                                                                 (upper_32_bits(ring->gpu_addr) >> 2));
>
> -       /* programm the RB_BASE for ring buffer */
> +       /* program the RB_BASE for ring buffer */
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                                                                 lower_32_bits(ring->gpu_addr));
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> index 23a9eb5b2c8a..e5d29dee0c88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -900,7 +900,7 @@ static int vcn_v2_0_start_dpg_mode(struct amdgpu_device *adev, bool indirect)
>         WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_RPTR_ADDR,
>                 (upper_32_bits(ring->gpu_addr) >> 2));
>
> -       /* programm the RB_BASE for ring buffer */
> +       /* program the RB_BASE for ring buffer */
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                 lower_32_bits(ring->gpu_addr));
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> @@ -1060,7 +1060,7 @@ static int vcn_v2_0_start(struct amdgpu_device *adev)
>         WREG32_SOC15(UVD, 0, mmUVD_RBC_RB_CNTL, tmp);
>
>         fw_shared->multi_queue.decode_queue_mode |= FW_QUEUE_RING_RESET;
> -       /* programm the RB_BASE for ring buffer */
> +       /* program the RB_BASE for ring buffer */
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                 lower_32_bits(ring->gpu_addr));
>         WREG32_SOC15(UVD, 0, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index e99bef6e2354..aa6f66c31709 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -887,7 +887,7 @@ static int vcn_v2_5_start_dpg_mode(struct amdgpu_device *adev, int inst_idx, boo
>         WREG32_SOC15(VCN, inst_idx, mmUVD_RBC_RB_RPTR_ADDR,
>                 (upper_32_bits(ring->gpu_addr) >> 2));
>
> -       /* programm the RB_BASE for ring buffer */
> +       /* program the RB_BASE for ring buffer */
>         WREG32_SOC15(VCN, inst_idx, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                 lower_32_bits(ring->gpu_addr));
>         WREG32_SOC15(VCN, inst_idx, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> @@ -1067,7 +1067,7 @@ static int vcn_v2_5_start(struct amdgpu_device *adev)
>                 WREG32_SOC15(VCN, i, mmUVD_RBC_RB_CNTL, tmp);
>
>                 fw_shared->multi_queue.decode_queue_mode |= FW_QUEUE_RING_RESET;
> -               /* programm the RB_BASE for ring buffer */
> +               /* program the RB_BASE for ring buffer */
>                 WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
>                         lower_32_bits(ring->gpu_addr));
>                 WREG32_SOC15(VCN, i, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
