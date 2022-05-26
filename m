Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B665350B4
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 16:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5712010E352;
	Thu, 26 May 2022 14:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0C610E311;
 Thu, 26 May 2022 14:35:28 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id y66so2350719oia.1;
 Thu, 26 May 2022 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SseFHQrYqsoiZU4lHBY7v6WlEb6Zc74S0Pekb8gbhbk=;
 b=bA/+pu+73q/F1nqqZVrKTLlDEEGliwvaphD4kjN5IussQDR1RT+LafcTtpE32pizwW
 5dPwTS970mqKljzjNAte0/NdbOea5wT+coJEFgNIKfm8TqisDBtN8JHRATwOARgUQkdb
 JiN0iQiOFrO9nw4RKVhlge/bVe9kX1M/dBkYPgC+cJYlITx5HA3WRtJx4SImqF4g0oJG
 zbiy1e/k6lQYiVqizI594lNj67E1NOcArlw0klXIhCVoEB5zvZJS4pMal3ZoQ0E9F38b
 L8FLeQcgpFxSkizkgKJmpQEUNIcYS5Mi0OCO+xg4pzrSZbGXYVPVbOPzdortLssFKDAi
 cBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SseFHQrYqsoiZU4lHBY7v6WlEb6Zc74S0Pekb8gbhbk=;
 b=GPG5ncK8ZpDivy4NXHNx0XYotizpklNQqgxbp3l7+UtIbq6R6cUpfvf0FL1DuvEjMD
 w6igK3DDlN0V22ErhyS/07DUeI0QeQ/iD8j+l3Iat0Cp6W2sOxn2WZ2C4s4LtzVMgtpB
 xkO1+rpMfKH2X8LjvORrtHjKENUT0fncamtcPJjrDCRFdpyxWJgh8WLF7VDgLA9tkkNX
 WoyPwYqs8kwytvzxvpkPfnEXUysPXZ+blSUxWEUwJNI/wRNetlnPgKzFUV8T2Rt8rwJf
 GfuYDh8Y1/CIQOD2iqVIrO5ygUIyzEbcwdtdzFc3Yzxg/QMPAvR/fGRKtzPscVjDrjMJ
 Vp7Q==
X-Gm-Message-State: AOAM531A0dC8kReSgvgj2o4ID74eY05u239tgSwncuHWmVLHbzcB6r0j
 TAoMMqCDMldww5Z6+ifWbBwGp+xZqmkBIrdZSw6ZddWt
X-Google-Smtp-Source: ABdhPJzNZv+k/h0FR9Rb+y50dnXu1h+Z3Etv2f+nFqPNGtYeA35QZOEZVBaTAvm2VYa/WFQuUf4Vq48I49j3QoNdaY4=
X-Received: by 2002:a05:6808:15a7:b0:32b:aeac:84d0 with SMTP id
 t39-20020a05680815a700b0032baeac84d0mr1340522oiw.253.1653575727150; Thu, 26
 May 2022 07:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_9934C5D4CD39D3C35606F674AE61310F2007@qq.com>
In-Reply-To: <tencent_9934C5D4CD39D3C35606F674AE61310F2007@qq.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 May 2022 10:35:15 -0400
Message-ID: <CADnq5_Nf=qoLDci2q1MJsLrf=cSVXs8+gX_ZZgx6Ovbi3j-eJw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Fix spelling typo in comments
To: 1064094935@qq.com
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 pengfuyuan <pengfuyuan@kylinos.cn>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, k2ci <kernel-bot@kylinos.cn>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 26, 2022 at 5:29 AM <1064094935@qq.com> wrote:
>
> From: pengfuyuan <pengfuyuan@kylinos.cn>
>
> Fix spelling typo in comments.
>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                       | 2 +-
>  drivers/gpu/drm/amd/amdgpu/mes_api_def.h                  | 2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 2 +-
>  drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c               | 4 ++--
>  drivers/gpu/drm/amd/display/modules/vmid/vmid.c           | 2 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 7606e3b6361e..35c303c865be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -271,7 +271,7 @@ extern int amdgpu_vcnfw_log;
>  #define CIK_CURSOR_WIDTH 128
>  #define CIK_CURSOR_HEIGHT 128
>
> -/* smasrt shift bias level limits */
> +/* smart shift bias level limits */
>  #define AMDGPU_SMARTSHIFT_MAX_BIAS (100)
>  #define AMDGPU_SMARTSHIFT_MIN_BIAS (-100)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_api_def.h b/drivers/gpu/drm/amd/amdgpu/mes_api_def.h
> index 3f4fca5fd1da..c31abf554878 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_api_def.h
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_api_def.h
> @@ -33,7 +33,7 @@
>   */
>  enum { API_FRAME_SIZE_IN_DWORDS = 64 };
>
> -/* To avoid command in scheduler context to be overwritten whenenver mutilple
> +/* To avoid command in scheduler context to be overwritten whenever multiple
>   * interrupts come in, this creates another queue.
>   */
>  enum { API_NUMBER_OF_COMMAND_MAX = 32 };
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 62139ff35476..8855a75dc75e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6705,7 +6705,7 @@ static void dm_disable_vblank(struct drm_crtc *crtc)
>         dm_set_vblank(crtc, false);
>  }
>
> -/* Implemented only the options currently availible for the driver */
> +/* Implemented only the options currently available for the driver */
>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>         .reset = dm_crtc_reset_state,
>         .destroy = amdgpu_dm_crtc_destroy,
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index 4385d19bc489..733f99a6e8e6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -619,7 +619,7 @@ static int get_max_dsc_slices(union dsc_enc_slice_caps slice_caps)
>  }
>
>
> -// Increment sice number in available sice numbers stops if possible, or just increment if not
> +// Increment slice number in available slice numbers stops if possible, or just increment if not
>  static int inc_num_slices(union dsc_enc_slice_caps slice_caps, int num_slices)
>  {
>         // Get next bigger num slices available in common caps
> @@ -650,7 +650,7 @@ static int inc_num_slices(union dsc_enc_slice_caps slice_caps, int num_slices)
>  }
>
>
> -// Decrement sice number in available sice numbers stops if possible, or just decrement if not. Stop at zero.
> +// Decrement slice number in available slice numbers stops if possible, or just decrement if not. Stop at zero.
>  static int dec_num_slices(union dsc_enc_slice_caps slice_caps, int num_slices)
>  {
>         // Get next bigger num slices available in common caps
> diff --git a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
> index 61ee4be35d27..2c40212d86da 100644
> --- a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
> +++ b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
> @@ -66,7 +66,7 @@ static void evict_vmids(struct core_vmid *core_vmid)
>         }
>  }
>
> -// Return value of -1 indicates vmid table unitialized or ptb dne in the table
> +// Return value of -1 indicates vmid table uninitialized or ptb dne in the table
>  static int get_existing_vmid_for_ptb(struct core_vmid *core_vmid, uint64_t ptb)
>  {
>         int i;
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
> index 45f5d29bc705..15b313baa0ee 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
> @@ -120,7 +120,7 @@
>  #define PPSMC_MSG_ReadSerialNumTop32            0x40
>  #define PPSMC_MSG_ReadSerialNumBottom32                 0x41
>
> -/* paramater for MSG_LightSBR
> +/* parameter for MSG_LightSBR
>   * 1 -- Enable light secondary bus reset, only do nbio respond without further handling,
>   *      leave driver to handle the real reset
>   * 0 -- Disable LightSBR, default behavior, SMU will pass the reset to PSP
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
