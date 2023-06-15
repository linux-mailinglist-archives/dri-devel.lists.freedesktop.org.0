Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D83731F08
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 19:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A573310E067;
	Thu, 15 Jun 2023 17:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4203A10E52E;
 Thu, 15 Jun 2023 17:30:29 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1a68c02553aso4754396fac.0; 
 Thu, 15 Jun 2023 10:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686850227; x=1689442227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DBFAQ+OspbXgxiU1uwcjpJ+KgjxBMeHaD8ugzzQiLeU=;
 b=DYHm+gT66KuV9e2kX1K7tNs1xU9tgGlItzNUZ1iRBBQrwfCAkcDV9cnKKHaAGB7M9F
 sZmsZhyTndnwepjYMLa2x+v0MEVo5U0Sfr+NPf+wLdWHanjR4HaLDjGs+e5jwh82zGJb
 XoPrahc5N5C7FPPy/fqyg/VgQgCHoMMlZFUH/SgUoYapNzCrmFkRy/PUvqRFgGLUEf5v
 e6EJggAmMKnti3SDZTfyA6vlK6/RfPZRbvbveMXA9fnM0l27BjwSMLJoBy8GrfYk5DM5
 k62BhikLVPBOtMOo7uHGqfzTaDvb7zErRS0o8+AdxXLjcTHQMXSE9vqv4Jh2tAm8oVOL
 gmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686850227; x=1689442227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DBFAQ+OspbXgxiU1uwcjpJ+KgjxBMeHaD8ugzzQiLeU=;
 b=ErN778igodbdc4SxfxsVXApqTjTeJse8ZMsFIxg0krLbqtMy2GcsDiP8KiU7jihZwc
 uZCAG9r4IbmKTwbiw9upNo8ZnAAUpprrRIGJkwxHlqjMplpVKCGBZrHtljvKhWezVTI8
 9VEqr5CmMMeV1qflP9xBupmJIs6DxkYJvo7haYejlFw/E1mHtoYDxpeCteyMmDVKmONf
 1Y4UfM3mDfh53Slt7TMYx7E3vxlVHtqiLDaN+tFOg4PMcK2XuszmbOfUezJw2oKpvrQC
 TZxDtOg2tz3lxkgkssYnpAMMMDN49iCR4qgTzc56GqjFvdgAHXImvIDa3Y0mQ+1N2AY1
 sHAQ==
X-Gm-Message-State: AC+VfDz9TCCXgArmKhqaHgT4j1WDrmQ3XDx9HeYSTsYOQbRPGwvfw2oR
 zeFg/SfN044JmFZdO7TmR+tFdDNyotfEkrM4FaWXUC6v
X-Google-Smtp-Source: ACHHUZ43pEX4UxqrYbGcs9QMb5obU3lfpTRVrSjmZvwNSem2mYI53z+kAnG4gGLHZnRBTB+m7jNmjoyPuJiodrPSifg=
X-Received: by 2002:a05:6870:4515:b0:180:b716:9825 with SMTP id
 e21-20020a056870451500b00180b7169825mr14924552oao.57.1686850227681; Thu, 15
 Jun 2023 10:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230615-amdgpu-wunused-const-variable-wo-debugfs-v1-0-06efd224aebb@kernel.org>
 <20230615-amdgpu-wunused-const-variable-wo-debugfs-v1-2-06efd224aebb@kernel.org>
In-Reply-To: <20230615-amdgpu-wunused-const-variable-wo-debugfs-v1-2-06efd224aebb@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jun 2023 13:30:16 -0400
Message-ID: <CADnq5_OWLXzuZvro4g7bDngcO4xjesNr1H=pwDypLKNY-_7PPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Move clocks closer to its only usage in
 amdgpu_parse_cg_state()
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Xinhui.Pan@amd.com, patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Thu, Jun 15, 2023 at 1:06=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit a25a9dae2067 ("drm/amd/amdgpu: enable W=3D1 for amdgpu"),
> there is an instance of -Wunused-const-variable when CONFIG_DEBUG_FS is
> disabled:
>
>   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:38:34: error: unused varia=
ble 'clocks' [-Werror,-Wunused-const-variable]
>      38 | static const struct cg_flag_name clocks[] =3D {
>         |                                  ^
>   1 error generated.
>
> clocks is only used when CONFIG_DEBUG_FS is set, so move the definition
> into the CONFIG_DEBUG_FS block right above its only usage to clear up
> the warning.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 76 +++++++++++++++++++-------------=
------
>  1 file changed, 38 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index a57952b93e73..386ccf11e657 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -35,44 +35,6 @@
>  #include <linux/pm_runtime.h>
>  #include <asm/processor.h>
>
> -static const struct cg_flag_name clocks[] =3D {
> -       {AMD_CG_SUPPORT_GFX_FGCG, "Graphics Fine Grain Clock Gating"},
> -       {AMD_CG_SUPPORT_GFX_MGCG, "Graphics Medium Grain Clock Gating"},
> -       {AMD_CG_SUPPORT_GFX_MGLS, "Graphics Medium Grain memory Light Sle=
ep"},
> -       {AMD_CG_SUPPORT_GFX_CGCG, "Graphics Coarse Grain Clock Gating"},
> -       {AMD_CG_SUPPORT_GFX_CGLS, "Graphics Coarse Grain memory Light Sle=
ep"},
> -       {AMD_CG_SUPPORT_GFX_CGTS, "Graphics Coarse Grain Tree Shader Cloc=
k Gating"},
> -       {AMD_CG_SUPPORT_GFX_CGTS_LS, "Graphics Coarse Grain Tree Shader L=
ight Sleep"},
> -       {AMD_CG_SUPPORT_GFX_CP_LS, "Graphics Command Processor Light Slee=
p"},
> -       {AMD_CG_SUPPORT_GFX_RLC_LS, "Graphics Run List Controller Light S=
leep"},
> -       {AMD_CG_SUPPORT_GFX_3D_CGCG, "Graphics 3D Coarse Grain Clock Gati=
ng"},
> -       {AMD_CG_SUPPORT_GFX_3D_CGLS, "Graphics 3D Coarse Grain memory Lig=
ht Sleep"},
> -       {AMD_CG_SUPPORT_MC_LS, "Memory Controller Light Sleep"},
> -       {AMD_CG_SUPPORT_MC_MGCG, "Memory Controller Medium Grain Clock Ga=
ting"},
> -       {AMD_CG_SUPPORT_SDMA_LS, "System Direct Memory Access Light Sleep=
"},
> -       {AMD_CG_SUPPORT_SDMA_MGCG, "System Direct Memory Access Medium Gr=
ain Clock Gating"},
> -       {AMD_CG_SUPPORT_BIF_MGCG, "Bus Interface Medium Grain Clock Gatin=
g"},
> -       {AMD_CG_SUPPORT_BIF_LS, "Bus Interface Light Sleep"},
> -       {AMD_CG_SUPPORT_UVD_MGCG, "Unified Video Decoder Medium Grain Clo=
ck Gating"},
> -       {AMD_CG_SUPPORT_VCE_MGCG, "Video Compression Engine Medium Grain =
Clock Gating"},
> -       {AMD_CG_SUPPORT_HDP_LS, "Host Data Path Light Sleep"},
> -       {AMD_CG_SUPPORT_HDP_MGCG, "Host Data Path Medium Grain Clock Gati=
ng"},
> -       {AMD_CG_SUPPORT_DRM_MGCG, "Digital Right Management Medium Grain =
Clock Gating"},
> -       {AMD_CG_SUPPORT_DRM_LS, "Digital Right Management Light Sleep"},
> -       {AMD_CG_SUPPORT_ROM_MGCG, "Rom Medium Grain Clock Gating"},
> -       {AMD_CG_SUPPORT_DF_MGCG, "Data Fabric Medium Grain Clock Gating"}=
,
> -       {AMD_CG_SUPPORT_VCN_MGCG, "VCN Medium Grain Clock Gating"},
> -       {AMD_CG_SUPPORT_HDP_DS, "Host Data Path Deep Sleep"},
> -       {AMD_CG_SUPPORT_HDP_SD, "Host Data Path Shutdown"},
> -       {AMD_CG_SUPPORT_IH_CG, "Interrupt Handler Clock Gating"},
> -       {AMD_CG_SUPPORT_JPEG_MGCG, "JPEG Medium Grain Clock Gating"},
> -       {AMD_CG_SUPPORT_REPEATER_FGCG, "Repeater Fine Grain Clock Gating"=
},
> -       {AMD_CG_SUPPORT_GFX_PERF_CLK, "Perfmon Clock Gating"},
> -       {AMD_CG_SUPPORT_ATHUB_MGCG, "Address Translation Hub Medium Grain=
 Clock Gating"},
> -       {AMD_CG_SUPPORT_ATHUB_LS, "Address Translation Hub Light Sleep"},
> -       {0, NULL},
> -};
> -
>  static const struct hwmon_temp_label {
>         enum PP_HWMON_TEMP channel;
>         const char *label;
> @@ -3684,6 +3646,44 @@ static int amdgpu_debugfs_pm_info_pp(struct seq_fi=
le *m, struct amdgpu_device *a
>         return 0;
>  }
>
> +static const struct cg_flag_name clocks[] =3D {
> +       {AMD_CG_SUPPORT_GFX_FGCG, "Graphics Fine Grain Clock Gating"},
> +       {AMD_CG_SUPPORT_GFX_MGCG, "Graphics Medium Grain Clock Gating"},
> +       {AMD_CG_SUPPORT_GFX_MGLS, "Graphics Medium Grain memory Light Sle=
ep"},
> +       {AMD_CG_SUPPORT_GFX_CGCG, "Graphics Coarse Grain Clock Gating"},
> +       {AMD_CG_SUPPORT_GFX_CGLS, "Graphics Coarse Grain memory Light Sle=
ep"},
> +       {AMD_CG_SUPPORT_GFX_CGTS, "Graphics Coarse Grain Tree Shader Cloc=
k Gating"},
> +       {AMD_CG_SUPPORT_GFX_CGTS_LS, "Graphics Coarse Grain Tree Shader L=
ight Sleep"},
> +       {AMD_CG_SUPPORT_GFX_CP_LS, "Graphics Command Processor Light Slee=
p"},
> +       {AMD_CG_SUPPORT_GFX_RLC_LS, "Graphics Run List Controller Light S=
leep"},
> +       {AMD_CG_SUPPORT_GFX_3D_CGCG, "Graphics 3D Coarse Grain Clock Gati=
ng"},
> +       {AMD_CG_SUPPORT_GFX_3D_CGLS, "Graphics 3D Coarse Grain memory Lig=
ht Sleep"},
> +       {AMD_CG_SUPPORT_MC_LS, "Memory Controller Light Sleep"},
> +       {AMD_CG_SUPPORT_MC_MGCG, "Memory Controller Medium Grain Clock Ga=
ting"},
> +       {AMD_CG_SUPPORT_SDMA_LS, "System Direct Memory Access Light Sleep=
"},
> +       {AMD_CG_SUPPORT_SDMA_MGCG, "System Direct Memory Access Medium Gr=
ain Clock Gating"},
> +       {AMD_CG_SUPPORT_BIF_MGCG, "Bus Interface Medium Grain Clock Gatin=
g"},
> +       {AMD_CG_SUPPORT_BIF_LS, "Bus Interface Light Sleep"},
> +       {AMD_CG_SUPPORT_UVD_MGCG, "Unified Video Decoder Medium Grain Clo=
ck Gating"},
> +       {AMD_CG_SUPPORT_VCE_MGCG, "Video Compression Engine Medium Grain =
Clock Gating"},
> +       {AMD_CG_SUPPORT_HDP_LS, "Host Data Path Light Sleep"},
> +       {AMD_CG_SUPPORT_HDP_MGCG, "Host Data Path Medium Grain Clock Gati=
ng"},
> +       {AMD_CG_SUPPORT_DRM_MGCG, "Digital Right Management Medium Grain =
Clock Gating"},
> +       {AMD_CG_SUPPORT_DRM_LS, "Digital Right Management Light Sleep"},
> +       {AMD_CG_SUPPORT_ROM_MGCG, "Rom Medium Grain Clock Gating"},
> +       {AMD_CG_SUPPORT_DF_MGCG, "Data Fabric Medium Grain Clock Gating"}=
,
> +       {AMD_CG_SUPPORT_VCN_MGCG, "VCN Medium Grain Clock Gating"},
> +       {AMD_CG_SUPPORT_HDP_DS, "Host Data Path Deep Sleep"},
> +       {AMD_CG_SUPPORT_HDP_SD, "Host Data Path Shutdown"},
> +       {AMD_CG_SUPPORT_IH_CG, "Interrupt Handler Clock Gating"},
> +       {AMD_CG_SUPPORT_JPEG_MGCG, "JPEG Medium Grain Clock Gating"},
> +       {AMD_CG_SUPPORT_REPEATER_FGCG, "Repeater Fine Grain Clock Gating"=
},
> +       {AMD_CG_SUPPORT_GFX_PERF_CLK, "Perfmon Clock Gating"},
> +       {AMD_CG_SUPPORT_ATHUB_MGCG, "Address Translation Hub Medium Grain=
 Clock Gating"},
> +       {AMD_CG_SUPPORT_ATHUB_LS, "Address Translation Hub Light Sleep"},
> +       {0, NULL},
> +};
> +
>  static void amdgpu_parse_cg_state(struct seq_file *m, u64 flags)
>  {
>         int i;
>
> --
> 2.41.0
>
