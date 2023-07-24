Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE076017E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A491910E375;
	Mon, 24 Jul 2023 21:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D08610E374;
 Mon, 24 Jul 2023 21:47:58 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-565f8e359b8so3301897eaf.2; 
 Mon, 24 Jul 2023 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235277; x=1690840077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QesV14Y8s5g0OhMUI7pqw1Hsk4wA0SJiQn93s5bli88=;
 b=J5BI7qxCLonnLK3T5LEIolm0ybGbfJ0qjHpQrhg8yyFg1rPqjkh46UpTSQo32eROiz
 BFHY7LsFZ3jjyAqjdtUTlOJFtizVoYR8A8ip0mQDWZBkVRc3gzdODXNjyhz/AlF1EP92
 C+1uEYRqOZu51w8rRRDiMKPpjHuVhGRgTtsGOxL6AAe3M0k08e4A+S11/WYRf3T3td6+
 k7qDJoj0Ld2MPZrjxBJVmLMlXh6YUf/spMvchzsVZMiRRbGxhczZGoI2lq9PH6UDta35
 rQ0BO9cK/jH5t2IZmKdBqJdvLIvyxdQOn3lr3R/qf+8QW8RDMtiz+9Cm9bAd5W4KxmNK
 lM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235277; x=1690840077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QesV14Y8s5g0OhMUI7pqw1Hsk4wA0SJiQn93s5bli88=;
 b=ZdZsuCFCBrQ9jjGdKH/0OSZwsEOdfTBxmqp1Lx+OJd5FmAR9fqqaZMRIApnvhydOt7
 yMkJ1TzSqJxF4O/rf7oMCDZP1OLMr795VM1SSOY+ZlN1DXqEkbxfZO5LKEtNy4wGHfYa
 MkVda2a0llm/NskxELb2vDX2Ku7COaYzjjQS/uHvFa9p2aor4eTQA4RgHD11yd4ri9sA
 mbnMZSIgRyPWhbLhDiPiLmt0jyhl+ZhN4vKnHYl7zzEAib1tm4uDEageDndX8iRT0Vzs
 Ryt00ds8fux4ezfK9jjesllGTpFlt1hjymj5MZXTXEiKiZGFE7kO9mqg1bNZpGWPB2zk
 sQbA==
X-Gm-Message-State: ABy/qLZxompbbsFOuHSEug7cJRgSk1Rd4bGJW0oeVKT9b965Y9oqsSOM
 YAHWLiGhUO3/70f1W1iah6NiS5PbbyFq6Gwsz10=
X-Google-Smtp-Source: APBJJlEqUYkWRqNTDj4h0jAqZsTYGFXxqivzpmqtVNCUNgCE0iDpXNGPMdFJbyX9kq1Ds8nJdbMceIC+AWvVFDaQbck=
X-Received: by 2002:a4a:91d1:0:b0:566:ffa7:fd00 with SMTP id
 e17-20020a4a91d1000000b00566ffa7fd00mr9220728ooh.6.1690235276920; Mon, 24 Jul
 2023 14:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230724071955.8822-1-xujianghui@cdjrlc.com>
 <3175b4fe4a9d8e4c29a39e9099c109ed@208suo.com>
In-Reply-To: <3175b4fe4a9d8e4c29a39e9099c109ed@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:47:45 -0400
Message-ID: <CADnq5_OcQUUmOzkRfb48Cf6mjRL6N80C6-2EU6HjGORnfoZ=dw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in navi10_ppt.c
To: sunran001@208suo.com
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 24, 2023 at 3:21=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following function definitions go on the next line
> ERROR: space required before the open parenthesis '('
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: spaces required around that '=3D' (ctx:VxW)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 25 ++++++++++---------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 95f6d821bacb..e655071516b7 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -136,7 +136,7 @@ static struct cmn2asic_msg_mapping
> navi10_message_map[SMU_MSG_MAX_COUNT] =3D {
>         MSG_MAP(PowerDownJpeg,                  PPSMC_MSG_PowerDownJpeg, =
               0),
>         MSG_MAP(BacoAudioD3PME,                 PPSMC_MSG_BacoAudioD3PME,=
               0),
>         MSG_MAP(ArmD3,                          PPSMC_MSG_ArmD3,         =
               0),
> -       MSG_MAP(DAL_DISABLE_DUMMY_PSTATE_CHANGE,PPSMC_MSG_DALDisableDummy=
PstateChange,  0),
> +       MSG_MAP(DAL_DISABLE_DUMMY_PSTATE_CHANGE,
> PPSMC_MSG_DALDisableDummyPstateChange,  0),
>
>         MSG_MAP(DAL_ENABLE_DUMMY_PSTATE_CHANGE, PPSMC_MSG_DALEnableDummyP=
stateChange,   0),
>         MSG_MAP(GetVoltageByDpm,                PPSMC_MSG_GetVoltageByDpm=
,              0),
>
>         MSG_MAP(GetVoltageByDpmOverdrive,       PPSMC_MSG_GetVoltageByDpm=
Overdrive,     0),
> @@ -556,7 +556,7 @@ static int navi10_get_legacy_smu_metrics_data(struct
> smu_context *smu,
>                                               MetricsMember_t member,
>                                               uint32_t *value)
>   {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         SmuMetrics_legacy_t *metrics =3D
>                 (SmuMetrics_legacy_t *)smu_table->metrics_table;
>         int ret =3D 0;
> @@ -642,7 +642,7 @@ static int navi10_get_smu_metrics_data(struct
> smu_context *smu,
>                                        MetricsMember_t member,
>                                        uint32_t *value)
>   {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         SmuMetrics_t *metrics =3D
>                 (SmuMetrics_t *)smu_table->metrics_table;
>         int ret =3D 0;
> @@ -731,7 +731,7 @@ static int navi12_get_legacy_smu_metrics_data(struct
> smu_context *smu,
>                                               MetricsMember_t member,
>                                               uint32_t *value)
>   {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         SmuMetrics_NV12_legacy_t *metrics =3D
>                 (SmuMetrics_NV12_legacy_t *)smu_table->metrics_table;
>         int ret =3D 0;
> @@ -817,7 +817,7 @@ static int navi12_get_smu_metrics_data(struct
> smu_context *smu,
>                                        MetricsMember_t member,
>                                        uint32_t *value)
>   {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         SmuMetrics_NV12_t *metrics =3D
>                 (SmuMetrics_NV12_t *)smu_table->metrics_table;
>         int ret =3D 0;
> @@ -1686,7 +1686,7 @@ static int navi10_force_clk_levels(struct
> smu_context *smu,
>                         return 0;
>                 break;
>         case SMU_DCEFCLK:
> -               dev_info(smu->adev->dev,"Setting DCEFCLK min/max dpm leve=
l is not
> supported!\n");
> +               dev_info(smu->adev->dev, "Setting DCEFCLK min/max dpm lev=
el is not
> supported!\n");
>                 break;
>
>         default:
> @@ -2182,7 +2182,7 @@ static int navi10_read_sensor(struct smu_context
> *smu,
>         struct smu_table_context *table_context =3D &smu->smu_table;
>         PPTable_t *pptable =3D table_context->driver_pptable;
>
> -       if(!data || !size)
> +       if (!data || !size)
>                 return -EINVAL;
>
>         switch (sensor) {
> @@ -2317,15 +2317,15 @@ static int
> navi10_display_disable_memory_clock_switch(struct smu_context *smu,
>         uint32_t min_memory_clock =3D smu->hard_min_uclk_req_from_dal;
>         uint32_t max_memory_clock =3D max_sustainable_clocks->uclock;
>
> -       if(smu->disable_uclk_switch =3D=3D disable_memory_clock_switch)
> +       if (smu->disable_uclk_switch =3D=3D disable_memory_clock_switch)
>                 return 0;
>
> -       if(disable_memory_clock_switch)
> +       if (disable_memory_clock_switch)
>                 ret =3D smu_v11_0_set_hard_freq_limited_range(smu, SMU_UC=
LK,
> max_memory_clock, 0);
>         else
>                 ret =3D smu_v11_0_set_hard_freq_limited_range(smu, SMU_UC=
LK,
> min_memory_clock, 0);
>
> -       if(!ret)
> +       if (!ret)
>                 smu->disable_uclk_switch =3D disable_memory_clock_switch;
>
>         return ret;
> @@ -2559,7 +2559,8 @@ static int navi10_set_default_od_settings(struct
> smu_context *smu)
>         return 0;
>   }
>
> -static int navi10_od_edit_dpm_table(struct smu_context *smu, enum
> PP_OD_DPM_TABLE_COMMAND type, long input[], uint32_t size) {
> +static int navi10_od_edit_dpm_table(struct smu_context *smu, enum
> PP_OD_DPM_TABLE_COMMAND type, long input[], uint32_t size)
> +{
>         int i;
>         int ret =3D 0;
>         struct smu_table_context *table_context =3D &smu->smu_table;
> @@ -3368,7 +3369,7 @@ static ssize_t navi1x_get_gpu_metrics(struct
> smu_context *smu,
>                       ((adev->ip_versions[MP1_HWIP][0] =3D=3D IP_VERSION(=
11, 0, 0)) &&
> smu_version > 0x002A3B00))
>                         ret =3D navi10_get_gpu_metrics(smu, table);
>                 else
> -                       ret =3Dnavi10_get_legacy_gpu_metrics(smu, table);
> +                       ret =3D navi10_get_legacy_gpu_metrics(smu, table)=
;
>                 break;
>         }
