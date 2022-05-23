Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C3F5315EE
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 22:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA7410F542;
	Mon, 23 May 2022 20:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AD910F542;
 Mon, 23 May 2022 20:16:56 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so19818682fac.9; 
 Mon, 23 May 2022 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=039/Q2AZDShC4cyR0ddlH/eUG3odzlEnwcuXrDMGe4g=;
 b=ozdSJJMUIKWXk58MINckgl2jY3Z70UCArhlPG8akBVn45Lo1OKbzhd+iiYTQgxgSov
 ttTLYVO422DGVP6TIA4i9bUQBs5/7JdzC3dRQG0sXHQi4PlhyOLmRvjkcdy1OJs3F/A6
 Zj8bx6wJDHfGS6hEHmgv2drWd4mphIk8dTMhCdJ0yi2fh9CCWlyHS1hHK9ZdyqmSpJuy
 vEbpb+MNTAgOj3yHkpuw8kEJMDHrtlMeBs/ve0ejcAbFRFGGUCDeElzbTxViEoz/z/PZ
 uhfBKKWWALl1+PfA4XOANV8E4H54v5kXIPBLeUAmsB3yS11kLTm1r84BSI6jXTy7SDXx
 XGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=039/Q2AZDShC4cyR0ddlH/eUG3odzlEnwcuXrDMGe4g=;
 b=OKQf2K0rpWSX7hgiFKkGYASHQVphVaDCPm5phUe/kmMvWCbt2YmX8vvY7GE9QWzdhJ
 wmMUJ5PhfdEduMVrbzH/ca6d3ni5N8NLy3aMubo018Szdh7NiY3gprjXkDGf60ZJeCFL
 TYzImaawgjlEQUi9MrgdJEGjny0xwiCWQf3BqkSm3mfBGi95Kv7U0BD++SPJi1jrcVcU
 8mhxGgzMj+Krv8J/+84+/wCMW06acZYwlWXG8vax8cVFj5rx7BQGSmlb5tQ5i7DPt3Fg
 9vOQdYlddJNaLA/wS+BgVJIQhLQtggPXjGSbqUeMdB2Du7650Ap+Mxf1f56PDAp1wmDJ
 K9ww==
X-Gm-Message-State: AOAM531mbLypaA2yDYoiPscHJ4e+JtsUp3Mbww0oUNEwoma+wcPbMW+8
 m7NH/qZQ1gzRsX+vYYB2vEoR1E5UU/UBlrJhzuJbzROz
X-Google-Smtp-Source: ABdhPJxfyiY9/f8uwqjjKiNK+axja1wE9SKzm/To6uvgNb57tvVlaqYEVifVWkoHs8ZnkdFpD7+KqQu3lp9PzJiBG0M=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr460362oap.253.1653337015741; Mon, 23 May
 2022 13:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220521111145.81697-64-Julia.Lawall@inria.fr>
In-Reply-To: <20220521111145.81697-64-Julia.Lawall@inria.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 May 2022 16:16:44 -0400
Message-ID: <CADnq5_POfEC8QgmbhR0UXZfHfYehUkLN8yMTjZ-vjARbpw+hZw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx: fix typos in comments
To: Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, May 21, 2022 at 7:12 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Spelling mistakes (triple letters) in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c |    2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c  |    4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 02754ee86c81..c5f46d264b23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -5111,7 +5111,7 @@ static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
>         mutex_unlock(&adev->srbm_mutex);
>
>         /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -          acccess. These should be enabled by FW for target VMIDs. */
> +          access. These should be enabled by FW for target VMIDs. */
>         for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>                 WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
>                 WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> index fb9302910742..7f0b18b0d4c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -3714,7 +3714,7 @@ static void gfx_v8_0_init_compute_vmid(struct amdgpu_device *adev)
>         mutex_unlock(&adev->srbm_mutex);
>
>         /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -          acccess. These should be enabled by FW for target VMIDs. */
> +          access. These should be enabled by FW for target VMIDs. */
>         for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>                 WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
>                 WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
> @@ -5815,7 +5815,7 @@ static void gfx_v8_0_update_coarse_grain_clock_gating(struct amdgpu_device *adev
>                 /* wait for RLC_SERDES_CU_MASTER & RLC_SERDES_NONCU_MASTER idle */
>                 gfx_v8_0_wait_for_rlc_serdes(adev);
>
> -               /* write cmd to Set CGCG Overrride */
> +               /* write cmd to Set CGCG Override */
>                 gfx_v8_0_send_serdes_cmd(adev, BPM_REG_CGCG_OVERRIDE, SET_BPM_SERDES_CMD);
>
>                 /* wait for RLC_SERDES_CU_MASTER & RLC_SERDES_NONCU_MASTER idle */
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index f12ae6e2359a..5349ca4d19e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2535,7 +2535,7 @@ static void gfx_v9_0_init_compute_vmid(struct amdgpu_device *adev)
>         mutex_unlock(&adev->srbm_mutex);
>
>         /* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -          acccess. These should be enabled by FW for target VMIDs. */
> +          access. These should be enabled by FW for target VMIDs. */
>         for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>                 WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_BASE, 2 * i, 0);
>                 WREG32_SOC15_OFFSET(GC, 0, mmGDS_VMID0_SIZE, 2 * i, 0);
>
