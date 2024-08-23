Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B795CD9B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD9410E816;
	Fri, 23 Aug 2024 13:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cjWowjTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA16B10E816;
 Fri, 23 Aug 2024 13:18:07 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7c2595f5c35so196134a12.1; 
 Fri, 23 Aug 2024 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724419087; x=1725023887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FM9Xtx1WVTxxu5XGhVbKBrKZgXpEQzHjuRapKL7d44=;
 b=cjWowjTkHOE7gvmBwYXgZsskh9DBf+0cnKgqAIudtsI5G5XNB/qEgfRh//8fhdWyFs
 UnOPEOh3bTZ7Lr4Yc0uRK2LYBP5g64awxIlRYJMn0ueL9fwA+cBOgkuVF2yYlNZ5py+w
 k+yN0roTdt+xtXmxAivAC5kaLa4cdpV9NP5CUPubS3yM3wu+fhmdh2/1ZLeCN5D4NEuk
 oSUkTh3g9j2ipLmUsLkpWBESv/OgcfzbXwb08OM5xaxPqTu0sPFOcja0+SZfvyxmfS4p
 i4SB5Sh/BYkOWzWYVI7HmDs+mfBzLXsrgBNbRR24xebBSOPz75UawT6/7+8DXQiNmtHM
 B7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724419087; x=1725023887;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FM9Xtx1WVTxxu5XGhVbKBrKZgXpEQzHjuRapKL7d44=;
 b=G9tH6TUrwKVfqemprbrpiuOvfp7g1v6hdLkVy+Fp1OPJ+m8GvdZ3JUOd7ki3EcEC4v
 aHDbrQdSEDkT4qVuaGQ4vNapHHLu9f130q9niOcju4cNPsxt9ZY3QqC/nOQBf3au+tbi
 gPAGjaoCaD80bwxhhek7wRig7nimYFLAgckzuLXr5FV9kb8g5NL5yGEiOPcnYBuze/mG
 bBH2BYtfFohICesPFUM14Vfkgo6ucZC5el8Ip16r+JOjgord/Gdv/p28c5ZOp+G18SAh
 klby4ZvHv5FSeCY1/QqQqGKXEd2G7urs/PqcXZ6znTrCpvxyLu3CYKsVlZiicuYF6NPm
 i/zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD1h8gdkARGaQXAnzT9Gtd/GUugWhXkVOcxt2qRZisdUPEvT2rPvyz0yb5VrBFx2hpPb+ntiousvjT@lists.freedesktop.org,
 AJvYcCWXF5kKZf8H+Fg5bcfYxOPbmsZToWnnqXB0R74mP9J1+2get86xO8ygRQO69s7z3PRHpzkQuKkO@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6gNZoWwWvlWNPppKXXKqCiKS8kHYtev+qA/gCbsav5hXUERXo
 S1mF5SvbLuL+Sq11Ftw0PcFOakGaHKsYf09fAs7O5vuFKYbHOxqL4qfm2r5dTvOp7XBEyAIA6do
 g2yTg3rTP9PEaQ4ZyD3MCVwQnfWU=
X-Google-Smtp-Source: AGHT+IGGPjPiBjhx/igIgyFZnU5cMDgr5uKwT3YNr6Sp+5Qeksl9DoGAOkexFul1FA5+sXrmVo5msKSxq7/5owzoMFw=
X-Received: by 2002:a17:902:f68d:b0:202:401f:ec8d with SMTP id
 d9443c01a7336-2039e6e6159mr12905495ad.11.1724419086888; Fri, 23 Aug 2024
 06:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240823091803.3452513-1-11162571@vivo.com>
In-Reply-To: <20240823091803.3452513-1-11162571@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Aug 2024 09:17:55 -0400
Message-ID: <CADnq5_PhMMT1-Xex5eW2unNkhU1gjuEvd9V7PRYfOb+dKJOwNg@mail.gmail.com>
Subject: Re: [PATCH v2] drivers:smumgr:fix up the misspellings
To: Yang Ruibin <11162571@vivo.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

On Fri, Aug 23, 2024 at 5:30=E2=80=AFAM Yang Ruibin <11162571@vivo.com> wro=
te:
>
> Hightest is a typo.  It should be highest.Please ensure
> the consistency of variable naming.
>
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
> Changes V2:
> - Replaced the word "hightest_pcie_level_enabled" with "hightest_pcie_lev=
el_enabled".
> ---
>  .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c    | 16 ++++++++--------
>  .../amd/pm/powerplay/smumgr/polaris10_smumgr.c   | 16 ++++++++--------
>  .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c   | 16 ++++++++--------
>  3 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 5e43ad2b2..e16efc44d 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -1014,7 +1014,7 @@ static int fiji_populate_all_graphic_levels(struct =
pp_hwmgr *hwmgr)
>         struct SMU73_Discrete_GraphicsLevel *levels =3D
>                         smu_data->smc_state_table.GraphicsLevel;
>         uint32_t i, max_entry;
> -       uint8_t hightest_pcie_level_enabled =3D 0,
> +       uint8_t hightest_pcie_level_enabled =3D 0,

This looks like this one didn't get updated properly.

Alex

>                         lowest_pcie_level_enabled =3D 0,
>                         mid_pcie_level_enabled =3D 0,
>                         count =3D 0;
> @@ -1054,27 +1054,27 @@ static int fiji_populate_all_graphic_levels(struc=
t pp_hwmgr *hwmgr)
>         } else {
>                 while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &=
&
>                                 ((data->dpm_level_enable_mask.pcie_dpm_en=
able_mask &
> -                                               (1 << (hightest_pcie_leve=
l_enabled + 1))) !=3D 0))
> -                       hightest_pcie_level_enabled++;
> +                                               (1 << (highest_pcie_level=
_enabled + 1))) !=3D 0))
> +                       highest_pcie_level_enabled++;
>
>                 while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &=
&
>                                 ((data->dpm_level_enable_mask.pcie_dpm_en=
able_mask &
>                                                 (1 << lowest_pcie_level_e=
nabled)) =3D=3D 0))
>                         lowest_pcie_level_enabled++;
>
> -               while ((count < hightest_pcie_level_enabled) &&
> +               while ((count < highest_pcie_level_enabled) &&
>                                 ((data->dpm_level_enable_mask.pcie_dpm_en=
able_mask &
>                                                 (1 << (lowest_pcie_level_=
enabled + 1 + count))) =3D=3D 0))
>                         count++;
>
>                 mid_pcie_level_enabled =3D (lowest_pcie_level_enabled + 1=
 + count) <
> -                               hightest_pcie_level_enabled ?
> +                               highest_pcie_level_enabled ?
>                                                 (lowest_pcie_level_enable=
d + 1 + count) :
> -                                               hightest_pcie_level_enabl=
ed;
> +                                               highest_pcie_level_enable=
d;
>
> -               /* set pcieDpmLevel to hightest_pcie_level_enabled */
> +               /* set pcieDpmLevel to highest_pcie_level_enabled */
>                 for (i =3D 2; i < dpm_table->sclk_table.count; i++)
> -                       levels[i].pcieDpmLevel =3D hightest_pcie_level_en=
abled;
> +                       levels[i].pcieDpmLevel =3D highest_pcie_level_ena=
bled;
>
>                 /* set pcieDpmLevel to lowest_pcie_level_enabled */
>                 levels[0].pcieDpmLevel =3D lowest_pcie_level_enabled;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b=
/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index ff6b563ec..d785cc646 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -1050,7 +1050,7 @@ static int polaris10_populate_all_graphic_levels(st=
ruct pp_hwmgr *hwmgr)
>         struct SMU74_Discrete_GraphicsLevel *levels =3D
>                         smu_data->smc_state_table.GraphicsLevel;
>         uint32_t i, max_entry;
> -       uint8_t hightest_pcie_level_enabled =3D 0,
> +       uint8_t highest_pcie_level_enabled =3D 0,
>                 lowest_pcie_level_enabled =3D 0,
>                 mid_pcie_level_enabled =3D 0,
>                 count =3D 0;
> @@ -1114,27 +1114,27 @@ static int polaris10_populate_all_graphic_levels(=
struct pp_hwmgr *hwmgr)
>         } else {
>                 while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mas=
k &&
>                                 ((hw_data->dpm_level_enable_mask.pcie_dpm=
_enable_mask &
> -                                               (1 << (hightest_pcie_leve=
l_enabled + 1))) !=3D 0))
> -                       hightest_pcie_level_enabled++;
> +                                               (1 << (highest_pcie_level=
_enabled + 1))) !=3D 0))
> +                       highest_pcie_level_enabled++;
>
>                 while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mas=
k &&
>                                 ((hw_data->dpm_level_enable_mask.pcie_dpm=
_enable_mask &
>                                                 (1 << lowest_pcie_level_e=
nabled)) =3D=3D 0))
>                         lowest_pcie_level_enabled++;
>
> -               while ((count < hightest_pcie_level_enabled) &&
> +               while ((count < highest_pcie_level_enabled) &&
>                                 ((hw_data->dpm_level_enable_mask.pcie_dpm=
_enable_mask &
>                                                 (1 << (lowest_pcie_level_=
enabled + 1 + count))) =3D=3D 0))
>                         count++;
>
>                 mid_pcie_level_enabled =3D (lowest_pcie_level_enabled + 1=
 + count) <
> -                               hightest_pcie_level_enabled ?
> +                               highest_pcie_level_enabled ?
>                                                 (lowest_pcie_level_enable=
d + 1 + count) :
> -                                               hightest_pcie_level_enabl=
ed;
> +                                               highest_pcie_level_enable=
d;
>
> -               /* set pcieDpmLevel to hightest_pcie_level_enabled */
> +               /* set pcieDpmLevel to highest_pcie_level_enabled */
>                 for (i =3D 2; i < dpm_table->sclk_table.count; i++)
> -                       levels[i].pcieDpmLevel =3D hightest_pcie_level_en=
abled;
> +                       levels[i].pcieDpmLevel =3D highest_pcie_level_ena=
bled;
>
>                 /* set pcieDpmLevel to lowest_pcie_level_enabled */
>                 levels[0].pcieDpmLevel =3D lowest_pcie_level_enabled;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/dri=
vers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> index 34c9f59b8..3e73f380a 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
> @@ -878,7 +878,7 @@ static int vegam_populate_all_graphic_levels(struct p=
p_hwmgr *hwmgr)
>         struct SMU75_Discrete_GraphicsLevel *levels =3D
>                         smu_data->smc_state_table.GraphicsLevel;
>         uint32_t i, max_entry;
> -       uint8_t hightest_pcie_level_enabled =3D 0,
> +       uint8_t highest_pcie_level_enabled =3D 0,
>                 lowest_pcie_level_enabled =3D 0,
>                 mid_pcie_level_enabled =3D 0,
>                 count =3D 0;
> @@ -925,27 +925,27 @@ static int vegam_populate_all_graphic_levels(struct=
 pp_hwmgr *hwmgr)
>         } else {
>                 while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mas=
k &&
>                                 ((hw_data->dpm_level_enable_mask.pcie_dpm=
_enable_mask &
> -                                               (1 << (hightest_pcie_leve=
l_enabled + 1))) !=3D 0))
> -                       hightest_pcie_level_enabled++;
> +                                               (1 << (highest_pcie_level=
_enabled + 1))) !=3D 0))
> +                       highest_pcie_level_enabled++;
>
>                 while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mas=
k &&
>                                 ((hw_data->dpm_level_enable_mask.pcie_dpm=
_enable_mask &
>                                                 (1 << lowest_pcie_level_e=
nabled)) =3D=3D 0))
>                         lowest_pcie_level_enabled++;
>
> -               while ((count < hightest_pcie_level_enabled) &&
> +               while ((count < highest_pcie_level_enabled) &&
>                                 ((hw_data->dpm_level_enable_mask.pcie_dpm=
_enable_mask &
>                                                 (1 << (lowest_pcie_level_=
enabled + 1 + count))) =3D=3D 0))
>                         count++;
>
>                 mid_pcie_level_enabled =3D (lowest_pcie_level_enabled + 1=
 + count) <
> -                               hightest_pcie_level_enabled ?
> +                               highest_pcie_level_enabled ?
>                                                 (lowest_pcie_level_enable=
d + 1 + count) :
> -                                               hightest_pcie_level_enabl=
ed;
> +                                               highest_pcie_level_enable=
d;
>
> -               /* set pcieDpmLevel to hightest_pcie_level_enabled */
> +               /* set pcieDpmLevel to highest_pcie_level_enabled */
>                 for (i =3D 2; i < dpm_table->sclk_table.count; i++)
> -                       levels[i].pcieDpmLevel =3D hightest_pcie_level_en=
abled;
> +                       levels[i].pcieDpmLevel =3D highest_pcie_level_ena=
bled;
>
>                 /* set pcieDpmLevel to lowest_pcie_level_enabled */
>                 levels[0].pcieDpmLevel =3D lowest_pcie_level_enabled;
> --
> 2.34.1
>
