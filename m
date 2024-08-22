Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1995BC0D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 18:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0AE10EB71;
	Thu, 22 Aug 2024 16:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dc/2Wzxk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B70010EB70;
 Thu, 22 Aug 2024 16:35:24 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-201e2fe323aso581985ad.2; 
 Thu, 22 Aug 2024 09:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724344524; x=1724949324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiD4ntFACWV2hnSlKy5BrlAt61hKhmJmLjHhc03SnZA=;
 b=Dc/2WzxkAHP8cGQvSU2IEW9bleNeKTS+iOken52oOXhRLqkbwkqMCrqNEmmQuf9M65
 mrU8WgAsbbAHRZRouKFUdDIV8Zyxls1f4DAcM7XHy9jpIwodb0y/1sAw982W87d0VADF
 IV9IIBsuDQnjPloJr8zUoASr/2YfVPpAhlE4hhwmMzLDymbltHiDUSkGRje7Z617z/6B
 F7iQNBs7glTKXdspVqqhNSYqmv/igIgpOMMXbODExas3ojzMIjUvuwrSYgGI0H3lmHFX
 PlwSo/acze8cs0/yru4cq3/sUZIX1ZUKqhyB3oLV0C9LXDagSL4Ob9g84gk3TxRIB2ne
 hz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724344524; x=1724949324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiD4ntFACWV2hnSlKy5BrlAt61hKhmJmLjHhc03SnZA=;
 b=Eo1X3l82fndZRmvzyhkIRIBMG7Rx+XWQXwLx9lpqRNE3IKaEGK3vQ4wpvE4PX21i4e
 JlJxtqSorY0WAD2pimWL5ejG03OIFlKowky0X3o/pytvFGYQjdnxEW07US0COD1jh8Z4
 SnSV574wq46LkRj/NPRQSH4fpmN4KqGq+1UrmhsIfeK0CfH9ukJeLjiqe5gxb1x8/krK
 24bUx8IAXwIRG63qa9Y9BwwpAedV35rMv/RdnaBWivzImzQCWavXoo8hMhW8y86TtId6
 FU/QrlZQ7VefeeprrWbToCKRGWZDLbc7UsYMwDes2EEVlfdMYs2+BMi/EHY2mTZ7H//1
 7AIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsEN9lGlNL93xBU80yxIZVQFPLLZ1KwuM5q7gWiP+uEJ3awPm7XQ0vV6GHYBSbwATks8FIcEAnQKTU@lists.freedesktop.org,
 AJvYcCXc8oFzmzSi8eS00Qieq+L2Gzac+OWj77/S5Ykxr7j2HRjK3jafUmABzKcXhsDQZcmOM1bDMaNG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE+AkY5TkzJIuVcOpt5DySUtQICxzbGINpvsBtARZa1pkejNfj
 QP1UBozal2EtYeWrYQ1o1FWTS7TRainU73adcfRkuZRHMwI1LUqMRB9zswfm364qhTjv8KCzd7e
 eg+whqSJyWWaD+gbLlJyB6Nbnglk=
X-Google-Smtp-Source: AGHT+IFxLKfq7mdRccptIMwf0Pvk4M1DcaSR/NtNNBaWcSQgMUoZ2GChOMAcntoy+JSmjsICxfI4gxfzq2kwtq/6Xko=
X-Received: by 2002:a17:902:c947:b0:1fc:5cc8:bb1b with SMTP id
 d9443c01a7336-2036808e83dmr39151925ad.7.1724344523239; Thu, 22 Aug 2024
 09:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240822073011.1352849-1-11162571@vivo.com>
In-Reply-To: <20240822073011.1352849-1-11162571@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2024 12:35:11 -0400
Message-ID: <CADnq5_PopUBCLimGUtNJqbwMb4XpdBeHrMZT0vJfQitmQ=uoZw@mail.gmail.com>
Subject: Re: [PATCH v1] drivers:smumgr:Variable names should be consistent
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

On Thu, Aug 22, 2024 at 3:49=E2=80=AFAM Yang Ruibin <11162571@vivo.com> wro=
te:
>
> The variable highest_pcie_level_enabled is named
> hightest_pcie_level_enabled in other modules.

hightest is a typo.  It should be highest.  Please fix up the
misspellings instead.

Alex

> Please ensure the consistency of variable naming
> and use min macros instead of the triadic operator.
>
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
>  .../drm/amd/pm/powerplay/smumgr/tonga_smumgr.c  | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c b/dri=
vers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> index 6fe6e6abb..60b1387f6 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> @@ -700,7 +700,7 @@ static int tonga_populate_all_graphic_levels(struct p=
p_hwmgr *hwmgr)
>         SMU72_Discrete_GraphicsLevel *levels =3D smu_data->smc_state_tabl=
e.GraphicsLevel;
>
>         uint32_t i, max_entry;
> -       uint8_t highest_pcie_level_enabled =3D 0;
> +       uint8_t hightest_pcie_level_enabled =3D 0;
>         uint8_t lowest_pcie_level_enabled =3D 0, mid_pcie_level_enabled =
=3D 0;
>         uint8_t count =3D 0;
>         int result =3D 0;
> @@ -747,8 +747,8 @@ static int tonga_populate_all_graphic_levels(struct p=
p_hwmgr *hwmgr)
>
>                 while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &=
&
>                                 ((data->dpm_level_enable_mask.pcie_dpm_en=
able_mask &
> -                                       (1<<(highest_pcie_level_enabled+1=
))) !=3D 0)) {
> -                       highest_pcie_level_enabled++;
> +                                       (1<<(hightest_pcie_level_enabled+=
1))) !=3D 0)) {
> +                       hightest_pcie_level_enabled++;
>                 }
>
>                 while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &=
&
> @@ -757,18 +757,19 @@ static int tonga_populate_all_graphic_levels(struct=
 pp_hwmgr *hwmgr)
>                         lowest_pcie_level_enabled++;
>                 }
>
> -               while ((count < highest_pcie_level_enabled) &&
> +               while ((count < hightest_pcie_level_enabled) &&
>                                 ((data->dpm_level_enable_mask.pcie_dpm_en=
able_mask &
>                                         (1<<(lowest_pcie_level_enabled+1+=
count))) =3D=3D 0)) {
>                         count++;
>                 }
> -               mid_pcie_level_enabled =3D (lowest_pcie_level_enabled+1+c=
ount) < highest_pcie_level_enabled ?
> -                       (lowest_pcie_level_enabled+1+count) : highest_pci=
e_level_enabled;
>
> +               mid_pcie_level_enabled =3D min(lowest_pcie_level_enabled+=
1+count,
> +                                       hightest_pcie_level_enabled);
>
> -               /* set pcieDpmLevel to highest_pcie_level_enabled*/
> +               /* set pcieDpmLevel to hightest_pcie_level_enabled*/
>                 for (i =3D 2; i < dpm_table->sclk_table.count; i++)
> -                       smu_data->smc_state_table.GraphicsLevel[i].pcieDp=
mLevel =3D highest_pcie_level_enabled;
> +                       smu_data->smc_state_table.GraphicsLevel[i].pcieDp=
mLevel =3D
> +                                       hightest_pcie_level_enabled;
>
>                 /* set pcieDpmLevel to lowest_pcie_level_enabled*/
>                 smu_data->smc_state_table.GraphicsLevel[0].pcieDpmLevel =
=3D lowest_pcie_level_enabled;
> --
> 2.34.1
>
