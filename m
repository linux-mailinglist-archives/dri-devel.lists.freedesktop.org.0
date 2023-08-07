Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8738772A2B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4036C10E202;
	Mon,  7 Aug 2023 16:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF9210E202;
 Mon,  7 Aug 2023 16:09:07 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a7556e4edcso3735829b6e.1; 
 Mon, 07 Aug 2023 09:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691424547; x=1692029347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+061seVVURUG+0Q2GncTyKaXaWDeZV6umiupfZikOQ=;
 b=SG2wcS8jjR8iJuzIs4Tb2WP2pfJ8SfJaQt2GOJ8eX1ryQzivQO9vyPIUctfpMS6ey9
 oOLIKetLoMsJDbwMN0yfwqt/DckaPGIzdRSYKy6dAKE72fFBHdGskbGgGx/uNBTLTaWE
 tvL/pxKNadBLGmWNo7k/V2WnYVMJK60okE2XLLNLaM76q9bAWU9gwn/Pd+YWckOGiQQJ
 GeMv6odNIYvLqxZtRATrDiiRdfz9oMCLshYLIU5j5bIqByHucl/3o+sxFcP1ZfXI0NQE
 CGeUg2vkZ+cNSitV1AcHkUEOx7l6HdYc5Tiq8cOjkzfkScN1jAg7kQ1xmmd0sX47dvOQ
 IYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691424547; x=1692029347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+061seVVURUG+0Q2GncTyKaXaWDeZV6umiupfZikOQ=;
 b=gTdcZR2oN+N32/q5ZzBeHYKJgJY1wU8gfl9ZYLjQxN9x/gL4PGCrgBS+KApyrps0p7
 G6gDeppYBQSLkwSBAenUgEkfbT9F6SHAMzsGKbz5lK7icJRhGv3+VDHQKM3imPjJ04TV
 PNAmUH78BQ7NJUtIQFmrFwqxym573dKr4+dQbLqG+8uWGAsp8wzqUXP0015sp4P7JR/k
 rR2zP/Wmyr+Vzr7r/I8Y6GI9C9SPha1BCj4bNppnHfVca3f9/JDV+p2j2Fm19tJzjuVR
 JLfLxSgihu+EX9mCSNGXr/hT5ySAhjbD7OtEkrjBWSUA9DrcqtDdglMbzT1YLanEECiL
 Yf3g==
X-Gm-Message-State: AOJu0YwDfvuTbNqW6pV2hH0M5qFI5cY4zi4DySiv+txC5/ZhCkgCxoMH
 7NbY3lP4pCTY71MELYCpvdQcVF4ayGtGAkJTSnE=
X-Google-Smtp-Source: AGHT+IHPbqgGA3JEGvcsJanNkB5BVETXsiski5hOzDx8HE6witozChUKnfRzaT6KLylcCvHH1w0TdpZxd3vudEBm3qo=
X-Received: by 2002:a05:6808:b34:b0:3a7:3865:c04a with SMTP id
 t20-20020a0568080b3400b003a73865c04amr5372995oij.19.1691424547044; Mon, 07
 Aug 2023 09:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230804024649.1650556-1-ruanjinjie@huawei.com>
In-Reply-To: <20230804024649.1650556-1-ruanjinjie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:08:56 -0400
Message-ID: <CADnq5_MsPLYowML33=9aJ=1Oovti=4YNBx5eFpgoEpb-59YO9Q@mail.gmail.com>
Subject: Re: [PATCH -next v2] drm/amdgpu: Remove a lot of unnecessary ternary
 operators
To: Ruan Jinjie <ruanjinjie@huawei.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Aug 3, 2023 at 10:47=E2=80=AFPM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:
>
> There are many ternary operators, the true or false judgement
> of which is unnecessary in C language semantics.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
> v2:
> - add the wrong removed true or false judgement hunk code
> - Update the commit message, Ther -> There
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c                 | 2 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c                   | 2 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c                   | 2 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c                 | 2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c                    | 2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c                    | 2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c                  | 2 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c    | 4 +---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c      | 4 ++--
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c  | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c    | 9 +++------
>  .../gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c   | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c   | 7 +++----
>  13 files changed, 18 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_bios.c
> index b582b83c4984..38ccec913f00 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> @@ -460,7 +460,7 @@ bool amdgpu_get_bios(struct amdgpu_device *adev)
>         return false;
>
>  success:
> -       adev->is_atom_fw =3D (adev->asic_type >=3D CHIP_VEGA10) ? true : =
false;
> +       adev->is_atom_fw =3D adev->asic_type >=3D CHIP_VEGA10;
>         return true;
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd=
/amdgpu/jpeg_v3_0.c
> index 79791379fc2b..df4440c21bbf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
> @@ -479,7 +479,7 @@ static int jpeg_v3_0_set_clockgating_state(void *hand=
le,
>                                           enum amd_clockgating_state stat=
e)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       bool enable =3D (state =3D=3D AMD_CG_STATE_GATE) ? true : false;
> +       bool enable =3D state =3D=3D AMD_CG_STATE_GATE;
>
>         if (enable) {
>                 if (!jpeg_v3_0_is_idle(handle))
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd=
/amdgpu/jpeg_v4_0.c
> index a707d407fbd0..3eb3dcd56b57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
> @@ -626,7 +626,7 @@ static int jpeg_v4_0_set_clockgating_state(void *hand=
le,
>                                           enum amd_clockgating_state stat=
e)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       bool enable =3D (state =3D=3D AMD_CG_STATE_GATE) ? true : false;
> +       bool enable =3D state =3D=3D AMD_CG_STATE_GATE;
>
>         if (enable) {
>                 if (!jpeg_v4_0_is_idle(handle))
> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/a=
md/amdgpu/jpeg_v4_0_3.c
> index ce2b22f7e4e4..153731d6ce8b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
> @@ -785,7 +785,7 @@ static int jpeg_v4_0_3_set_clockgating_state(void *ha=
ndle,
>                                           enum amd_clockgating_state stat=
e)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       bool enable =3D (state =3D=3D AMD_CG_STATE_GATE) ? true : false;
> +       bool enable =3D state =3D=3D AMD_CG_STATE_GATE;
>         int i;
>
>         for (i =3D 0; i < adev->jpeg.num_jpeg_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v3_0.c
> index b76ba21b5a89..9b662b105cc1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> @@ -2095,7 +2095,7 @@ static int vcn_v3_0_set_clockgating_state(void *han=
dle,
>                                           enum amd_clockgating_state stat=
e)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       bool enable =3D (state =3D=3D AMD_CG_STATE_GATE) ? true : false;
> +       bool enable =3D state =3D=3D AMD_CG_STATE_GATE;
>         int i;
>
>         for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v4_0.c
> index 6089c7deba8a..7c486745bece 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1918,7 +1918,7 @@ static int vcn_v4_0_wait_for_idle(void *handle)
>  static int vcn_v4_0_set_clockgating_state(void *handle, enum amd_clockga=
ting_state state)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       bool enable =3D (state =3D=3D AMD_CG_STATE_GATE) ? true : false;
> +       bool enable =3D state =3D=3D AMD_CG_STATE_GATE;
>         int i;
>
>         for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/am=
d/amdgpu/vcn_v4_0_3.c
> index 550ac040b4be..e62472e6e7b3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> @@ -1287,7 +1287,7 @@ static int vcn_v4_0_3_set_clockgating_state(void *h=
andle,
>                                           enum amd_clockgating_state stat=
e)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       bool enable =3D (state =3D=3D AMD_CG_STATE_GATE) ? true : false;
> +       bool enable =3D state =3D=3D AMD_CG_STATE_GATE;
>         int i;
>
>         for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c b/driv=
ers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> index fa314493ffc5..e4d65de2d0bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
> @@ -941,9 +941,7 @@ bool dce110_link_encoder_validate_output_with_stream(
>         break;
>         case SIGNAL_TYPE_EDP:
>         case SIGNAL_TYPE_LVDS:
> -               is_valid =3D
> -                       (stream->timing.
> -                               pixel_encoding =3D=3D PIXEL_ENCODING_RGB)=
 ? true : false;
> +               is_valid =3D stream->timing.pixel_encoding =3D=3D PIXEL_E=
NCODING_RGB;
>         break;
>         case SIGNAL_TYPE_VIRTUAL:
>                 is_valid =3D true;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> index 1cb402264497..3d61489209dd 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> @@ -904,7 +904,7 @@ static int smu7_setup_dpm_tables_v1(struct pp_hwmgr *=
hwmgr)
>                                         dep_sclk_table->entries[i].clk;
>
>                         data->dpm_table.sclk_table.dpm_levels[data->dpm_t=
able.sclk_table.count].enabled =3D
> -                                       (i =3D=3D 0) ? true : false;
> +                                       i =3D=3D 0;
>                         data->dpm_table.sclk_table.count++;
>                 }
>         }
> @@ -919,7 +919,7 @@ static int smu7_setup_dpm_tables_v1(struct pp_hwmgr *=
hwmgr)
>                         data->dpm_table.mclk_table.dpm_levels[data->dpm_t=
able.mclk_table.count].value =3D
>                                                         dep_mclk_table->e=
ntries[i].clk;
>                         data->dpm_table.mclk_table.dpm_levels[data->dpm_t=
able.mclk_table.count].enabled =3D
> -                                                       (i =3D=3D 0) ? tr=
ue : false;
> +                                                       i =3D=3D 0;
>                         data->dpm_table.mclk_table.count++;
>                 }
>         }
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> index 21be23ec3c79..d6eeef3c58f7 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> @@ -1103,7 +1103,7 @@ int smu7_enable_smc_cac(struct pp_hwmgr *hwmgr)
>                 PP_ASSERT_WITH_CODE((0 =3D=3D smc_result),
>                                 "Failed to enable CAC in SMC.", result =
=3D -1);
>
> -               data->cac_enabled =3D (0 =3D=3D smc_result) ? true : fals=
e;
> +               data->cac_enabled =3D smc_result =3D=3D 0;
>         }
>         return result;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> index c51dd4c74fe9..52ae6fa2d2a6 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> @@ -1375,8 +1375,7 @@ static int vega10_setup_default_dpm_tables(struct p=
p_hwmgr *hwmgr)
>                                                 dep_mm_table->entries[i].=
eclk) {
>                         dpm_table->dpm_levels[dpm_table->count].value =3D
>                                         dep_mm_table->entries[i].eclk;
> -                       dpm_table->dpm_levels[dpm_table->count].enabled =
=3D
> -                                       (i =3D=3D 0) ? true : false;
> +                       dpm_table->dpm_levels[dpm_table->count].enabled =
=3D i =3D=3D 0;
>                         dpm_table->count++;
>                 }
>         }
> @@ -1391,8 +1390,7 @@ static int vega10_setup_default_dpm_tables(struct p=
p_hwmgr *hwmgr)
>                                                 dep_mm_table->entries[i].=
vclk) {
>                         dpm_table->dpm_levels[dpm_table->count].value =3D
>                                         dep_mm_table->entries[i].vclk;
> -                       dpm_table->dpm_levels[dpm_table->count].enabled =
=3D
> -                                       (i =3D=3D 0) ? true : false;
> +                       dpm_table->dpm_levels[dpm_table->count].enabled =
=3D i =3D=3D 0;
>                         dpm_table->count++;
>                 }
>         }
> @@ -1405,8 +1403,7 @@ static int vega10_setup_default_dpm_tables(struct p=
p_hwmgr *hwmgr)
>                                                 dep_mm_table->entries[i].=
dclk) {
>                         dpm_table->dpm_levels[dpm_table->count].value =3D
>                                         dep_mm_table->entries[i].dclk;
> -                       dpm_table->dpm_levels[dpm_table->count].enabled =
=3D
> -                                       (i =3D=3D 0) ? true : false;
> +                       dpm_table->dpm_levels[dpm_table->count].enabled =
=3D i =3D=3D 0;
>                         dpm_table->count++;
>                 }
>         }
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b=
/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index e7ed2a7adf8f..ff6b563ecbf5 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -1888,7 +1888,7 @@ static int polaris10_populate_avfs_parameters(struc=
t pp_hwmgr *hwmgr)
>                                                 (avfs_params.ucEnableGB_V=
DROOP_TABLE_CKSOFF << BTCGB1_Vdroop_Enable_SHIFT) |
>                                                 (avfs_params.ucEnableGB_F=
USE_TABLE_CKSON << AVFSGB0_Vdroop_Enable_SHIFT) |
>                                                 (avfs_params.ucEnableGB_F=
USE_TABLE_CKSOFF << AVFSGB1_Vdroop_Enable_SHIFT);
> -               data->apply_avfs_cks_off_voltage =3D (avfs_params.ucEnabl=
eApplyAVFS_CKS_OFF_Voltage =3D=3D 1) ? true : false;
> +               data->apply_avfs_cks_off_voltage =3D avfs_params.ucEnable=
ApplyAVFS_CKS_OFF_Voltage =3D=3D 1;
>         }
>         return result;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/dri=
vers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> index 7d024d3facef..34c9f59b889a 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> @@ -295,9 +295,8 @@ static int vegam_process_firmware_header(struct pp_hw=
mgr *hwmgr)
>
>  static bool vegam_is_dpm_running(struct pp_hwmgr *hwmgr)
>  {
> -       return (1 =3D=3D PHM_READ_INDIRECT_FIELD(hwmgr->device,
> -                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON))
> -                       ? true : false;
> +       return 1 =3D=3D PHM_READ_INDIRECT_FIELD(hwmgr->device,
> +                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON);
>  }
>
>  static uint32_t vegam_get_mac_definition(uint32_t value)
> @@ -1660,7 +1659,7 @@ static int vegam_populate_avfs_parameters(struct pp=
_hwmgr *hwmgr)
>                                 (avfs_params.ucEnableGB_FUSE_TABLE_CKSON =
<< AVFSGB0_Vdroop_Enable_SHIFT) |
>                                 (avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF=
 << AVFSGB1_Vdroop_Enable_SHIFT);
>                 data->apply_avfs_cks_off_voltage =3D
> -                               (avfs_params.ucEnableApplyAVFS_CKS_OFF_Vo=
ltage =3D=3D 1) ? true : false;
> +                               avfs_params.ucEnableApplyAVFS_CKS_OFF_Vol=
tage =3D=3D 1;
>         }
>         return result;
>  }
> --
> 2.34.1
>
