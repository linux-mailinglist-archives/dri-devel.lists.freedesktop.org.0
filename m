Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D25772A64
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0E610E2A0;
	Mon,  7 Aug 2023 16:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0C10E297;
 Mon,  7 Aug 2023 16:19:26 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b9cf1997c4so3905043a34.3; 
 Mon, 07 Aug 2023 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425166; x=1692029966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ueDJCiGb0+VI2kQKDZzwR188POLai26iF4UpeUbxBio=;
 b=cEN+n13HcILMDBD4BVySkhuM05g/mdSJjr5pgPn1UxGT7ofe7f8VJ+GSEB5Q9zRvHK
 PgZnDX6FKIZdfFhfe/9WZWb6hnsuIQg1yShCVdIhICq57+jKDxzd+TmFqcaWJVTQpWmx
 Lo/CnO1UrNaGmy3EZsrsyTVedNdGyCz8bEg9YzodMdLluNRn7r7HO7hd0csRsRedHjR6
 LLy2SHBSZt4VxN5I5E44l/h7nXguFuzyK4G6ntJc3w/X3Lsep1DuEdPJlORqlNQLqKx5
 INKus0QaQQLJyw/+zQLyB5Nz+guwfSNI5jOvZEFf+Rd4wXN/wk9V8bOW9Eu7cSCyO/eV
 FqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425166; x=1692029966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ueDJCiGb0+VI2kQKDZzwR188POLai26iF4UpeUbxBio=;
 b=CuDSFKz4uXyJw+Lc5tv1p/vAX7yWtuEd7j0XCjzCgDmybOezMntsMdo427Mgr9g0Ew
 bZFsHYYY+eh04U98G+O41xP6+3SvgmT/ESKCG1GGNl9lgUnpOV/nViOM2evb2sqmm3Q4
 wyP9ZZUIcY97pQevm/qyoYrK8TWnZmiJZxTbgl4xeN8tkdDP9Iqei83PTKFA6bide07f
 FT7amxDPCm3Umm+yRLhVznUbLlzmGgndJuHIDiqWn9On167g2+dW74ogmwyccG9rWj6E
 wCOmG+Z24HXUk0+M1d4V1Xw4u7fRqAYyThnl30zzFD9kjEWuqmH5Vk2ktqx229zsR3D7
 yH/g==
X-Gm-Message-State: AOJu0YyKMmJCuFSwMoU6azqwB2kapAdzckZGN2bX3zEw70wLN9OjUiUp
 OTYFZALo1BSFUxqIsRyLvadWBtCCSNqjKcDJ+J0nNLoh
X-Google-Smtp-Source: AGHT+IG0zZ/NC5YCFbFprxdGk2LwxzUELIioHWKhlvdgppPMZqBOFHEIFzBi+JAjU3rM+4HpE3EYPBJSEVvIi3n9+R0=
X-Received: by 2002:a05:6870:c20d:b0:1be:d522:fdf with SMTP id
 z13-20020a056870c20d00b001bed5220fdfmr10569352oae.12.1691425165703; Mon, 07
 Aug 2023 09:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230801012608.4003-1-sunran001@208suo.com>
In-Reply-To: <20230801012608.4003-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:19:14 -0400
Message-ID: <CADnq5_OzhDL6tfu2HH2SDEQOnPukvoM0fPm3NN9ORSqOxrq1Wg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_7_ppt.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 joe@perches.com, dri-devel@lists.freedesktop.org, apw@canonical.com,
 alexander.deucher@amd.com, bpf@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 9:26=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: spaces required around that '=3D' (ctx:VxW)
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> index b1f0937ccade..26ba51ec0567 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> @@ -386,8 +386,7 @@ static int smu_v13_0_7_check_fw_status(struct smu_con=
text *smu)
>  }
>
>  #ifndef atom_smc_dpm_info_table_13_0_7
> -struct atom_smc_dpm_info_table_13_0_7
> -{
> +struct atom_smc_dpm_info_table_13_0_7 {
>         struct atom_common_table_header table_header;
>         BoardTable_t BoardTable;
>  };
> @@ -494,7 +493,7 @@ static int smu_v13_0_7_tables_init(struct smu_context=
 *smu)
>                        PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
>         SMU_TABLE_INIT(tables, SMU_TABLE_ACTIVITY_MONITOR_COEFF,
>                        sizeof(DpmActivityMonitorCoeffIntExternal_t), PAGE=
_SIZE,
> -                      AMDGPU_GEM_DOMAIN_VRAM);
> +                      AMDGPU_GEM_DOMAIN_VRAM);
>         SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGI=
ON_SIZE_COMBOPPTABLE,
>                         PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
>
> @@ -728,7 +727,7 @@ static int smu_v13_0_7_get_smu_metrics_data(struct sm=
u_context *smu,
>                                             MetricsMember_t member,
>                                             uint32_t *value)
>  {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         SmuMetrics_t *metrics =3D
>                 &(((SmuMetricsExternal_t *)(smu_table->metrics_table))->S=
muMetrics);
>         int ret =3D 0;
> @@ -1635,8 +1634,7 @@ static int smu_v13_0_7_force_clk_levels(struct smu_=
context *smu,
>         return ret;
>  }
>
> -static const struct smu_temperature_range smu13_thermal_policy[] =3D
> -{
> +static const struct smu_temperature_range smu13_thermal_policy[] =3D {
>         {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 9=
9000},
>         { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000,=
 120000},
>  };
> --
> 2.17.1
>
