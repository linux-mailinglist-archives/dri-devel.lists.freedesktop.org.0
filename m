Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FE27E91E1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 19:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147A310E090;
	Sun, 12 Nov 2023 18:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE9F10E029;
 Sun, 12 Nov 2023 18:00:49 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6ce2988d62eso2267810a34.1; 
 Sun, 12 Nov 2023 10:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699812048; x=1700416848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfKjTNPjLOgd1jDpWmUB18irX4zVfrahQ01NcwWX1j8=;
 b=REp7nkNYS/WNX2RbPkoukj0TeXWzVDwJ3TI4WiEsS15BAvfpK7tJtrpkKwRc/y2T4F
 cvb7g30/7DW9joWVTvqZdPvqBBJ2nxOeCsqpvu9tim537MTf4N+WnKvi3yt8fh5h2TJm
 PtwfoG+nqQ5kwrYuHK8oNRqY75vNj6px4yUITaG/X7RfymGjMyEaqCY2Z4FpiHZYDM34
 GqnaruHcSIc6Ai9/Om0lcx3TROFwezj4RqOlb4BPv0a2++sKd4T0GYMSxsDyDeQTYSkr
 bqOndmy6USH4xUZ7w4oJePeVXT3wuy6/x1KF3aSXDB/GxTyVsAayf79nsCZ+8baReOv7
 BSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699812048; x=1700416848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfKjTNPjLOgd1jDpWmUB18irX4zVfrahQ01NcwWX1j8=;
 b=BXBgXKRuBLFBH0h24a+ZRG6OHCr/mI/NOs5VWUfzb2dBGKgTOoFTr7JH+qZLumu7ZZ
 WspNYSWimgbXtNOl/t7As8JOMYN9Rfz6CnPQloarRrmWO2ar2JM9EeJBmzZyQMEXsTtv
 owGlYiR7N95miIhda4y2KHJSTME0M+LtNIiM4aHJd9aZDDPxT9p1ypzSsE13JlOPuTab
 0c9CcziMjaESumoS+7GMCCDw0PcrUalPTUGaqsXw0vpT2iBKuoPcNqmDbsEop52bjbPK
 vsdIWj421g+X9Pn4eEJqmolyo9UKivJmkYDOaNeJY0YQw1c0zedk6yLbtTsx/vrxz4fy
 9d3w==
X-Gm-Message-State: AOJu0YypgTnMtSpp4BjGFRkJqzi9tpwmZ6DD+fAXCj2LiB6teEnlbSgh
 XQofqu4rqypj15EyNuWQOELTRPXl71j/pIb0NCSimu6a
X-Google-Smtp-Source: AGHT+IH9fCeY0p+889Hq5E/FeznaMxKk7hWotHF2e82tGctkmrbNfl7InHIcS1n/Xm3M6i7unsWVB+A73D9Q09eat1c=
X-Received: by 2002:a05:6870:cd0e:b0:1e9:dae7:f58a with SMTP id
 qk14-20020a056870cd0e00b001e9dae7f58amr6491610oab.22.1699812048373; Sun, 12
 Nov 2023 10:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20231112132736.175494-1-sashal@kernel.org>
 <20231112132736.175494-9-sashal@kernel.org>
In-Reply-To: <20231112132736.175494-9-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 12 Nov 2023 13:00:37 -0500
Message-ID: <CADnq5_OyK=rDH38Q8Kiyq9BhWuihgd8wX7XKAffxwkO4w+ksog@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 09/11] drm/amd: Fix UBSAN
 array-index-out-of-bounds for Powerplay headers
To: Sasha Levin <sashal@kernel.org>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 12, 2023 at 8:27=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Alex Deucher <alexander.deucher@amd.com>
>
> [ Upstream commit 49afe91370b86566857a3c2c39612cf098110885 ]
>
> For pptable structs that use flexible array sizes, use flexible arrays.
>
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039926
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I don't think any of these UBSAN flexible array changes are stable material=
.

Alex

> ---
>  .../drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h |  4 ++--
>  .../amd/pm/powerplay/hwmgr/vega10_pptable.h   | 24 +++++++++----------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
> index 7a31cfa5e7fb4..df7cab1a571b3 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h
> @@ -367,7 +367,7 @@ typedef struct _ATOM_Tonga_VCE_State_Record {
>  typedef struct _ATOM_Tonga_VCE_State_Table {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;
> -       ATOM_Tonga_VCE_State_Record entries[1];
> +       ATOM_Tonga_VCE_State_Record entries[];
>  } ATOM_Tonga_VCE_State_Table;
>
>  typedef struct _ATOM_Tonga_PowerTune_Table {
> @@ -481,7 +481,7 @@ typedef struct _ATOM_Tonga_Hard_Limit_Record {
>  typedef struct _ATOM_Tonga_Hard_Limit_Table {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;
> -       ATOM_Tonga_Hard_Limit_Record entries[1];
> +       ATOM_Tonga_Hard_Limit_Record entries[];
>  } ATOM_Tonga_Hard_Limit_Table;
>
>  typedef struct _ATOM_Tonga_GPIO_Table {
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
> index 8b0590b834cca..de2926df5ed74 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
> @@ -129,7 +129,7 @@ typedef struct _ATOM_Vega10_State {
>  typedef struct _ATOM_Vega10_State_Array {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;                                         /* Nu=
mber of entries. */
> -       ATOM_Vega10_State states[1];                             /* Dynam=
ically allocate entries. */
> +       ATOM_Vega10_State states[];                             /* Dynami=
cally allocate entries. */
>  } ATOM_Vega10_State_Array;
>
>  typedef struct _ATOM_Vega10_CLK_Dependency_Record {
> @@ -169,37 +169,37 @@ typedef struct _ATOM_Vega10_GFXCLK_Dependency_Table=
 {
>  typedef struct _ATOM_Vega10_MCLK_Dependency_Table {
>      UCHAR ucRevId;
>      UCHAR ucNumEntries;                                         /* Numbe=
r of entries. */
> -    ATOM_Vega10_MCLK_Dependency_Record entries[1];            /* Dynamic=
ally allocate entries. */
> +    ATOM_Vega10_MCLK_Dependency_Record entries[];            /* Dynamica=
lly allocate entries. */
>  } ATOM_Vega10_MCLK_Dependency_Table;
>
>  typedef struct _ATOM_Vega10_SOCCLK_Dependency_Table {
>      UCHAR ucRevId;
>      UCHAR ucNumEntries;                                         /* Numbe=
r of entries. */
> -    ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynamica=
lly allocate entries. */
> +    ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynamical=
ly allocate entries. */
>  } ATOM_Vega10_SOCCLK_Dependency_Table;
>
>  typedef struct _ATOM_Vega10_DCEFCLK_Dependency_Table {
>      UCHAR ucRevId;
>      UCHAR ucNumEntries;                                         /* Numbe=
r of entries. */
> -    ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynamica=
lly allocate entries. */
> +    ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynamical=
ly allocate entries. */
>  } ATOM_Vega10_DCEFCLK_Dependency_Table;
>
>  typedef struct _ATOM_Vega10_PIXCLK_Dependency_Table {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;                                         /* Nu=
mber of entries. */
> -       ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynam=
ically allocate entries. */
> +       ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynami=
cally allocate entries. */
>  } ATOM_Vega10_PIXCLK_Dependency_Table;
>
>  typedef struct _ATOM_Vega10_DISPCLK_Dependency_Table {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;                                         /* Nu=
mber of entries.*/
> -       ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynam=
ically allocate entries. */
> +       ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynami=
cally allocate entries. */
>  } ATOM_Vega10_DISPCLK_Dependency_Table;
>
>  typedef struct _ATOM_Vega10_PHYCLK_Dependency_Table {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;                                         /* Nu=
mber of entries. */
> -       ATOM_Vega10_CLK_Dependency_Record entries[1];            /* Dynam=
ically allocate entries. */
> +       ATOM_Vega10_CLK_Dependency_Record entries[];            /* Dynami=
cally allocate entries. */
>  } ATOM_Vega10_PHYCLK_Dependency_Table;
>
>  typedef struct _ATOM_Vega10_MM_Dependency_Record {
> @@ -213,7 +213,7 @@ typedef struct _ATOM_Vega10_MM_Dependency_Record {
>  typedef struct _ATOM_Vega10_MM_Dependency_Table {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;                                         /* Nu=
mber of entries */
> -       ATOM_Vega10_MM_Dependency_Record entries[1];             /* Dynam=
ically allocate entries */
> +       ATOM_Vega10_MM_Dependency_Record entries[];             /* Dynami=
cally allocate entries */
>  } ATOM_Vega10_MM_Dependency_Table;
>
>  typedef struct _ATOM_Vega10_PCIE_Record {
> @@ -225,7 +225,7 @@ typedef struct _ATOM_Vega10_PCIE_Record {
>  typedef struct _ATOM_Vega10_PCIE_Table {
>         UCHAR  ucRevId;
>         UCHAR  ucNumEntries;                                        /* Nu=
mber of entries */
> -       ATOM_Vega10_PCIE_Record entries[1];                      /* Dynam=
ically allocate entries. */
> +       ATOM_Vega10_PCIE_Record entries[];                      /* Dynami=
cally allocate entries. */
>  } ATOM_Vega10_PCIE_Table;
>
>  typedef struct _ATOM_Vega10_Voltage_Lookup_Record {
> @@ -235,7 +235,7 @@ typedef struct _ATOM_Vega10_Voltage_Lookup_Record {
>  typedef struct _ATOM_Vega10_Voltage_Lookup_Table {
>         UCHAR ucRevId;
>         UCHAR ucNumEntries;                                          /* N=
umber of entries */
> -       ATOM_Vega10_Voltage_Lookup_Record entries[1];             /* Dyna=
mically allocate entries */
> +       ATOM_Vega10_Voltage_Lookup_Record entries[];             /* Dynam=
ically allocate entries */
>  } ATOM_Vega10_Voltage_Lookup_Table;
>
>  typedef struct _ATOM_Vega10_Fan_Table {
> @@ -327,7 +327,7 @@ typedef struct _ATOM_Vega10_VCE_State_Record {
>  typedef struct _ATOM_Vega10_VCE_State_Table {
>      UCHAR ucRevId;
>      UCHAR ucNumEntries;
> -    ATOM_Vega10_VCE_State_Record entries[1];
> +    ATOM_Vega10_VCE_State_Record entries[];
>  } ATOM_Vega10_VCE_State_Table;
>
>  typedef struct _ATOM_Vega10_PowerTune_Table {
> @@ -427,7 +427,7 @@ typedef struct _ATOM_Vega10_Hard_Limit_Record {
>  typedef struct _ATOM_Vega10_Hard_Limit_Table {
>      UCHAR ucRevId;
>      UCHAR ucNumEntries;
> -    ATOM_Vega10_Hard_Limit_Record entries[1];
> +    ATOM_Vega10_Hard_Limit_Record entries[];
>  } ATOM_Vega10_Hard_Limit_Table;
>
>  typedef struct _Vega10_PPTable_Generic_SubTable_Header {
> --
> 2.42.0
>
