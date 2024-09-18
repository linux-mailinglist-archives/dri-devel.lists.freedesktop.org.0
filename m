Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D1697BFDC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 19:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1DE10E610;
	Wed, 18 Sep 2024 17:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OCRKJVON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB7810E60D;
 Wed, 18 Sep 2024 17:52:02 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7c3d8105646so382238a12.2; 
 Wed, 18 Sep 2024 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726681922; x=1727286722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENDlvV+k2ihN7FXIWJUs/9L1QeoJY5NtPnVMTnrhmms=;
 b=OCRKJVONGkemE5Flth3D1Q9MmgE80E6RtH0xndg14P9wHPI3ssL40itVKvbLekHg+A
 ARGVJny86bzWaMoyDZTp6qW9cjsnfFw037Lm5KELdRSLH9OgsHkrgjn+pnOTsT9rpdSF
 XAaY4tdqpkI58XASNJcsJiZQgVRbF4C67jgPQyMvff6SQ9Jw+BhWRdqRcZCRpGPSdC8W
 14dv2uGjEjYdeld2Ojpihwq+s6hnhweVWp5A33uVLC/AeUY+7UL4bFputsQ0v3+4L4G/
 9LCZKuOBA8RSkMzsTOtqZuw0FE+xj8AR5RDvEtHc88hIx0IRur7knD8eORtf7lrX/3UD
 ReZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726681922; x=1727286722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENDlvV+k2ihN7FXIWJUs/9L1QeoJY5NtPnVMTnrhmms=;
 b=Vrl6krH5YPQfKNy8kN1InC+B4eSzYd31YGCqRDpJnflX+yWIuy0di8ce3Mtazf8ozm
 Lhyht/8L73WelwpgRBtZpdeacs3AYbdIC2u2DwIjIaglQEu4bNFjkrBwFoSOAYluigMD
 Lslbs4Rmk0X79FB3UBJc5uK/pnHXXARMLtBCkZdDsdOArJSHZc05Bxso0q9t+cbO9c/t
 fMARu2KUgykuwbNxmP9vl2efL3V4n0rvMyleXdT0iC6Ee/cCc3Wcfq37VeEL0Tx1bmm1
 n6HH+8ICOvioizDpwE+qB0mEQllOe7ITxgWQ38VJLKxPIw4aPsHOJT080rMkWCixd4Zg
 d4SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/jqplYm9wGhE9cTJ+BM7UD/VWPQ1imah24OXxiBXiZgjCcVnZSiUN8egv8EB89V/9BAqIwMcH00Tt@lists.freedesktop.org,
 AJvYcCXVui/+WDGxClafmBcC/C1+/oULtZU59ez3BsbHws4HC/yocdtfqIkB7K+mN1AlgfjuDU7MhMFcLYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcMyz4rHqy3pCvRUCp1wE78lf8SNriPkeKNY9epcq92cVZN9eN
 axkk9CPGU0wc6l9pNjkUgYZVYc28AF3IXYfZ3wHC3i0lV97hZqTnxQKZ9BB/Bd5bYXFP6G7GOlW
 DgTdeB2iCO45vuvFmTuIZqaDLpFbe/hTWYEcO3Q==
X-Google-Smtp-Source: AGHT+IGl24GCLZbvMHh7TRhbzUZeL22U2do6IjT0xh3HcCz7pBaY6uhEYjhMYxPhuWZ2i/EP9WFfZrfcnG8qFj36Fe0=
X-Received: by 2002:a17:90b:78e:b0:2db:60b:366a with SMTP id
 98e67ed59e1d1-2dba007f424mr10737301a91.9.1726681921950; Wed, 18 Sep 2024
 10:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-1-25fea3f3d64d@quicinc.com>
In-Reply-To: <20240918-a663-gpu-support-v1-1-25fea3f3d64d@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 18 Sep 2024 18:51:50 +0100
Message-ID: <CACu1E7FGMX8KTbhS1HAEumD9Dx7K334bnJecg14-mSQBaZ4V5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/a6xx: Add support for A663
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
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

On Tue, Sep 17, 2024 at 9:39=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>
> Add support for Adreno 663 found on sa8775p based platforms.
>
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  8 +++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c     | 33 +++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
>  4 files changed, 64 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index 0312b6ee0356..8d8d0d7630f0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -972,6 +972,25 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                         .prim_fifo_threshold =3D 0x00300200,
>                 },
>                 .address_space_size =3D SZ_16G,
> +       }, {
> +               .chip_ids =3D ADRENO_CHIP_IDS(0x06060300),
> +               .family =3D ADRENO_6XX_GEN4,
> +               .fw =3D {
> +                       [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> +                       [ADRENO_FW_GMU] =3D "a663_gmu.bin",
> +               },
> +               .gmem =3D SZ_1M + SZ_512K,
> +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +                       ADRENO_QUIRK_HAS_HW_APRIV,
> +               .init =3D a6xx_gpu_init,
> +               .a6xx =3D &(const struct a6xx_info) {
> +                       .hwcg =3D a690_hwcg,
> +                       .protect =3D &a660_protect,
> +                       .gmu_cgc_mode =3D 0x00020200,
> +                       .prim_fifo_threshold =3D 0x00300200,
> +               },
> +               .address_space_size =3D SZ_16G,
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x06030500),
>                 .family =3D ADRENO_6XX_GEN4,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 06cab2c6fd66..e317780caeae 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -541,6 +541,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> +       if (adreno_is_a663(gpu)) {
> +               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.ubwc_swizzle =3D 0x4;

It's already been mentioned in the Mesa MR, but since this is the
first GPU with level2_swizzling_dis set, the relevant vulkan CTS tests
need to be tested with
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578
rebased on your Mesa enablement patch.

> +               gpu->ubwc_config.macrotile_mode =3D 1;
> +       }
> +
>         if (adreno_is_7c3(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 14;
>                 gpu->ubwc_config.amsbc =3D 1;
> @@ -1062,7 +1068,7 @@ static int hw_init(struct msm_gpu *gpu)
>         if (adreno_is_a690(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
>         /* Set dualQ + disable afull for A660 GPU */
> -       else if (adreno_is_a660(adreno_gpu))
> +       else if (adreno_is_a660(adreno_gpu) || adreno_is_a663(adreno_gpu)=
)
>                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>         else if (adreno_is_a7xx(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/=
adreno/a6xx_hfi.c
> index cdb3f6e74d3e..f1196d66055c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -478,6 +478,37 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_=
bw_table *msg)
>         msg->cnoc_cmds_data[1][0] =3D  0x60000001;
>  }
>
> +static void a663_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +       /*
> +        * Send a single "off" entry just to get things running
> +        * TODO: bus scaling
> +        */
> +       msg->bw_level_num =3D 1;
> +
> +       msg->ddr_cmds_num =3D 3;
> +       msg->ddr_wait_bitmask =3D 0x07;
> +
> +       msg->ddr_cmds_addrs[0] =3D 0x50004;
> +       msg->ddr_cmds_addrs[1] =3D 0x50000;
> +       msg->ddr_cmds_addrs[2] =3D 0x500b4;
> +
> +       msg->ddr_cmds_data[0][0] =3D  0x40000000;
> +       msg->ddr_cmds_data[0][1] =3D  0x40000000;
> +       msg->ddr_cmds_data[0][2] =3D  0x40000000;
> +
> +       /*
> +        * These are the CX (CNOC) votes - these are used by the GMU but =
the
> +        * votes are known and fixed for the target
> +        */
> +       msg->cnoc_cmds_num =3D 1;
> +       msg->cnoc_wait_bitmask =3D 0x01;
> +
> +       msg->cnoc_cmds_addrs[0] =3D 0x50058;
> +       msg->cnoc_cmds_data[0][0] =3D  0x40000000;
> +       msg->cnoc_cmds_data[1][0] =3D  0x60000001;
> +}
> +
>  static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>         /*
> @@ -646,6 +677,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gm=
u)
>                 adreno_7c3_build_bw_table(&msg);
>         else if (adreno_is_a660(adreno_gpu))
>                 a660_build_bw_table(&msg);
> +       else if (adreno_is_a663(adreno_gpu))
> +               a663_build_bw_table(&msg);
>         else if (adreno_is_a690(adreno_gpu))
>                 a690_build_bw_table(&msg);
>         else if (adreno_is_a730(adreno_gpu))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 58d7e7915c57..10f8f25d8826 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -455,6 +455,11 @@ static inline int adreno_is_a680(const struct adreno=
_gpu *gpu)
>         return adreno_is_revn(gpu, 680);
>  }
>
> +static inline int adreno_is_a663(const struct adreno_gpu *gpu)
> +{
> +       return gpu->info->chip_ids[0] =3D=3D 0x06060300;
> +}
> +
>  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  {
>         return gpu->info->chip_ids[0] =3D=3D 0x06090000;
>
> --
> 2.45.2
>
