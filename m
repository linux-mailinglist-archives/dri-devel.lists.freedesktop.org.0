Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35FF772B31
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7318810E2E3;
	Mon,  7 Aug 2023 16:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FA810E2E6;
 Mon,  7 Aug 2023 16:39:30 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1bfafe8a425so2270585fac.3; 
 Mon, 07 Aug 2023 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426369; x=1692031169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9yUnR7nsNv1o01EBdb9R3AQ7xuPUTH6LIX5UBFQZMY=;
 b=oPDur4jPpCx7f7YzSeCLQreLcbz3FpnWjb31PqKtTs/7xpN56hWgNhgNaxyVPYENKp
 s8mmGGiw0V/Jz17uI3cw/YudyAWmKvPxD569K+iLUJMCAXQpOiN0mAKABp5FPpPVfkVF
 NTgI+ZSvpczr4O88ygMMktyh1MdaNPmJCRqZdBPlg4q6A9qMTBkuWqN6GCDEgN+SnQH8
 tcMmUUi2pqAgYQtFL4jDd+oW68zzb8spLZ8v5Nq4YmJU37L+1omU4KtflQwRD49CC0fW
 XEz2Bpvf4k31FltocClFuBhOIPHWSY4hAk79QDE0fTEwlR9N59afFAWlv4UDz2gGysfr
 dkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426369; x=1692031169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9yUnR7nsNv1o01EBdb9R3AQ7xuPUTH6LIX5UBFQZMY=;
 b=S18CYwEUN9y3IvK6oT1M8n2+piyXg0rlMWyzAHttr9TE3vOikpcPKKRzLJEHcbDD8c
 yYta71S3uKipxxByWqFe/QhjSM7T7a0xFf3LvTn6r4noaGK3x5UlZxq8f89ZDhdiizS+
 FoQnNv5pDgKNBwE3TKSwNHJlCvoSBnam8LFdyJUFl85Y0LCvcAUzz550ywesUzwGjAcS
 jwdlBIRpJz1Xv0fyQP853Js/pg9FYgE6N3MHwitsUFDSJa0ENJ/cqT30HPPylPaZM2t+
 J6Q32gHfnZu4DN1EcSjmhdBc9LD2mONfKQxdKBM+Iymd5XtKHmSEmGA1K0B/k4HMHq0M
 ovCQ==
X-Gm-Message-State: AOJu0YwSvIvEAnx8pIg6GvmTclSzGlKKOlgxtUhZVIOhrR139Lp8YgY9
 U2PjvI6At2jHbWj2WUgjM4hmxNgOkd6IC9tzAO4=
X-Google-Smtp-Source: AGHT+IE2GPyyJrHzsARaHdO1xvxFVTB/cNtv7O0obdNL10a/BLlwOtmxjQnADH7tMInZQ4OAGW90SEy9TdTjEnoUplg=
X-Received: by 2002:a05:6870:ac12:b0:1bf:7c28:9483 with SMTP id
 kw18-20020a056870ac1200b001bf7c289483mr11514890oab.38.1691426369387; Mon, 07
 Aug 2023 09:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230801090022.6923-1-sunran001@208suo.com>
In-Reply-To: <20230801090022.6923-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:39:18 -0400
Message-ID: <CADnq5_Oe8gktj8EMc3dRkbd=LojOiCh8W1MoEghOJnRA+eRW8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Clean up errors in smu7_hwmgr.c
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
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:00=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: spaces required around that '=3D' (ctx:VxV)
> ERROR: spaces required around that '<' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> index 1cb402264497..425859682fab 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> @@ -83,15 +83,15 @@
>  #define PCIE_BUS_CLK                10000
>  #define TCLK                        (PCIE_BUS_CLK / 10)
>
> -static struct profile_mode_setting smu7_profiling[7] =3D
> -                                       {{0, 0, 0, 0, 0, 0, 0, 0},
> +static struct profile_mode_setting smu7_profiling[7] =3D {
> +                                        {0, 0, 0, 0, 0, 0, 0, 0},
>                                          {1, 0, 100, 30, 1, 0, 100, 10},
>                                          {1, 10, 0, 30, 0, 0, 0, 0},
>                                          {0, 0, 0, 0, 1, 10, 16, 31},
>                                          {1, 0, 11, 50, 1, 0, 100, 10},
>                                          {1, 0, 5, 30, 0, 0, 0, 0},
>                                          {0, 0, 0, 0, 0, 0, 0, 0},
> -                                       };
> +};
>
>  #define PPSMC_MSG_SetVBITimeout_VEGAM    ((uint16_t) 0x310)
>
> @@ -950,7 +950,7 @@ static int smu7_odn_initial_default_setting(struct pp=
_hwmgr *hwmgr)
>         odn_table->odn_core_clock_dpm_levels.num_of_pl =3D
>                                                 data->golden_dpm_table.sc=
lk_table.count;
>         entries =3D odn_table->odn_core_clock_dpm_levels.entries;
> -       for (i=3D0; i<data->golden_dpm_table.sclk_table.count; i++) {
> +       for (i =3D 0; i < data->golden_dpm_table.sclk_table.count; i++) {
>                 entries[i].clock =3D data->golden_dpm_table.sclk_table.dp=
m_levels[i].value;
>                 entries[i].enabled =3D true;
>                 entries[i].vddc =3D dep_sclk_table->entries[i].vddc;
> @@ -962,7 +962,7 @@ static int smu7_odn_initial_default_setting(struct pp=
_hwmgr *hwmgr)
>         odn_table->odn_memory_clock_dpm_levels.num_of_pl =3D
>                                                 data->golden_dpm_table.mc=
lk_table.count;
>         entries =3D odn_table->odn_memory_clock_dpm_levels.entries;
> -       for (i=3D0; i<data->golden_dpm_table.mclk_table.count; i++) {
> +       for (i =3D 0; i < data->golden_dpm_table.mclk_table.count; i++) {
>                 entries[i].clock =3D data->golden_dpm_table.mclk_table.dp=
m_levels[i].value;
>                 entries[i].enabled =3D true;
>                 entries[i].vddc =3D dep_mclk_table->entries[i].vddc;
> @@ -1813,13 +1813,13 @@ static void smu7_init_dpm_defaults(struct pp_hwmg=
r *hwmgr)
>         data->static_screen_threshold =3D SMU7_STATICSCREENTHRESHOLD_DFLT=
;
>         data->static_screen_threshold_unit =3D SMU7_STATICSCREENTHRESHOLD=
UNIT_DFLT;
>         data->voting_rights_clients[0] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT0=
;
> -       data->voting_rights_clients[1]=3D SMU7_VOTINGRIGHTSCLIENTS_DFLT1;
> +       data->voting_rights_clients[1] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT1=
;
>         data->voting_rights_clients[2] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT2=
;
> -       data->voting_rights_clients[3]=3D SMU7_VOTINGRIGHTSCLIENTS_DFLT3;
> -       data->voting_rights_clients[4]=3D SMU7_VOTINGRIGHTSCLIENTS_DFLT4;
> -       data->voting_rights_clients[5]=3D SMU7_VOTINGRIGHTSCLIENTS_DFLT5;
> -       data->voting_rights_clients[6]=3D SMU7_VOTINGRIGHTSCLIENTS_DFLT6;
> -       data->voting_rights_clients[7]=3D SMU7_VOTINGRIGHTSCLIENTS_DFLT7;
> +       data->voting_rights_clients[3] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT3=
;
> +       data->voting_rights_clients[4] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT4=
;
> +       data->voting_rights_clients[5] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT5=
;
> +       data->voting_rights_clients[6] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT6=
;
> +       data->voting_rights_clients[7] =3D SMU7_VOTINGRIGHTSCLIENTS_DFLT7=
;
>
>         data->mclk_dpm_key_disabled =3D hwmgr->feature_mask & PP_MCLK_DPM=
_MASK ? false : true;
>         data->sclk_dpm_key_disabled =3D hwmgr->feature_mask & PP_SCLK_DPM=
_MASK ? false : true;
> @@ -2002,7 +2002,7 @@ static int smu7_calculate_ro_range(struct pp_hwmgr =
*hwmgr)
>         } else if (ASICID_IS_P21(adev->pdev->device, adev->pdev->revision=
) ||
>                    ASICID_IS_P31(adev->pdev->device, adev->pdev->revision=
)) {
>                 min =3D 900;
> -               max=3D 2100;
> +               max =3D 2100;
>         } else if (hwmgr->chip_id =3D=3D CHIP_POLARIS10) {
>                 if (adev->pdev->subsystem_vendor =3D=3D 0x106B) {
>                         min =3D 1000;
> @@ -4018,7 +4018,7 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmgr,=
 int idx,
>                 offset =3D data->soft_regs_start + smum_get_offsetof(hwmg=
r,
>                                                                 SMU_SoftR=
egisters,
>                                                                 (idx =3D=
=3D AMDGPU_PP_SENSOR_GPU_LOAD) ?
> -                                                               AverageGr=
aphicsActivity:
> +                                                               AverageGr=
aphicsActivity :
>                                                                 AverageMe=
moryActivity);
>
>                 activity_percent =3D cgs_read_ind_register(hwmgr->device,=
 CGS_IND_REG__SMC, offset);
> --
> 2.17.1
>
