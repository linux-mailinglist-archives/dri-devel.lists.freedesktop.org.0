Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C59772B2C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BF210E2DD;
	Mon,  7 Aug 2023 16:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8247D10E2DD;
 Mon,  7 Aug 2023 16:38:43 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1bed90ee8b7so2657233fac.0; 
 Mon, 07 Aug 2023 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426323; x=1692031123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rarcK3MbD7gHOcFshzJfH5zeoDzMas3hks50J5ozAg0=;
 b=OCjP+09Q1alWEsFY+IxdlRu38FWBMjCp3y8nFvqDAdqOpZLZdGQEWBO+RO1RyvVS9E
 ofMvJAvuQUvo7DBHiV1E/sxJRFBP+BeZcD1qfsXN2sKrl4a/yOGwfcK6CUzVg/3P2jIP
 vv5EMq7AimUln0OAoeyQFzE4DKoTlRzCXV1h7ivJU4UUNu7e/GMDVROnYLl3IjqHpTbl
 huLEmqcbM7U9PT5j5WBRn//yBbeSr9i2PFxpGxi2kWlbXJarlt4EbGGo2qrw1xnX6Cgz
 frFbK17PLe/RsCaTMg5PuhmpxWWQ1ssiicxfwZniSSJI3B/6N/b9O7YGLkSOx12o8jeP
 1x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426323; x=1692031123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rarcK3MbD7gHOcFshzJfH5zeoDzMas3hks50J5ozAg0=;
 b=QFaE95x5OEz5fJ97dLFKZdE+vaGQp3cxtTzbS7T4fjOVm3rhvWznbS7JsaTICWyeZS
 4RxszVatEl+EVe4HcxkarWeiCFT3CMdGc2sivs0FsTauImKhDaV8PaHiFAhLzix8aq+e
 jdq92hKAUyoN/0T+FgtSfzcMrB2NOF2wbcWIQ8hZomRAYuNEToUiez8YFZm17D2ZRV++
 pQzXBrpiFhSB6RqLRdfJZvN5sW5WsjYWb/Cn5yDGytXsgzQHcpC4+B0ABAL86Nkx2SvW
 3fan3FNEtlzzomPX6CR8Ld7I6hElY6DXiFnYmJElXtK4+IBNOduABOj8HJFFEq4EKEF8
 5D4g==
X-Gm-Message-State: AOJu0Yycf6QcZDK4/Z70Mp4+FxSJSB3pIZPdHA/D4xfbst4sJ0S1iCaZ
 wTdnBSrFpBWU/VIfUBfcoiDt/aIht8VqvMDQ/9E=
X-Google-Smtp-Source: AGHT+IFqN+3LznOGCB7Ec+vmLC5iyrrexubmYVqGFrrYDW9B7OvQdOGZ5AjY9CQYSSBF5Hfs0wiQPOyXky18W4I+sdk=
X-Received: by 2002:a05:6870:3282:b0:1bf:df47:7b5d with SMTP id
 q2-20020a056870328200b001bfdf477b5dmr4252575oac.24.1691426322778; Mon, 07 Aug
 2023 09:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230801084024.6826-1-sunran001@208suo.com>
In-Reply-To: <20230801084024.6826-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:38:31 -0400
Message-ID: <CADnq5_Pn4U0uV4qLkBauxnWdRQZHtiq135qn+-uDRR34ZHbaPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega10_pptable.h
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

On Tue, Aug 1, 2023 at 4:40=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../amd/pm/powerplay/hwmgr/vega10_pptable.h    | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
> index 9c479bd9a786..8b0590b834cc 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_pptable.h
> @@ -317,16 +317,14 @@ typedef struct _ATOM_Vega10_Thermal_Controller {
>      UCHAR ucFlags;          /* to be defined */
>  } ATOM_Vega10_Thermal_Controller;
>
> -typedef struct _ATOM_Vega10_VCE_State_Record
> -{
> +typedef struct _ATOM_Vega10_VCE_State_Record {
>      UCHAR  ucVCEClockIndex;         /*index into usVCEDependencyTableOff=
set of 'ATOM_Vega10_MM_Dependency_Table' type */
>      UCHAR  ucFlag;                  /* 2 bits indicates memory p-states =
*/
>      UCHAR  ucSCLKIndex;             /* index into ATOM_Vega10_SCLK_Depen=
dency_Table */
>      UCHAR  ucMCLKIndex;             /* index into ATOM_Vega10_MCLK_Depen=
dency_Table */
>  } ATOM_Vega10_VCE_State_Record;
>
> -typedef struct _ATOM_Vega10_VCE_State_Table
> -{
> +typedef struct _ATOM_Vega10_VCE_State_Table {
>      UCHAR ucRevId;
>      UCHAR ucNumEntries;
>      ATOM_Vega10_VCE_State_Record entries[1];
> @@ -361,8 +359,7 @@ typedef struct _ATOM_Vega10_PowerTune_Table {
>         USHORT usTemperatureLimitTedge;
>  } ATOM_Vega10_PowerTune_Table;
>
> -typedef struct _ATOM_Vega10_PowerTune_Table_V2
> -{
> +typedef struct _ATOM_Vega10_PowerTune_Table_V2 {
>         UCHAR  ucRevId;
>         USHORT usSocketPowerLimit;
>         USHORT usBatteryPowerLimit;
> @@ -388,8 +385,7 @@ typedef struct _ATOM_Vega10_PowerTune_Table_V2
>         USHORT usTemperatureLimitTedge;
>  } ATOM_Vega10_PowerTune_Table_V2;
>
> -typedef struct _ATOM_Vega10_PowerTune_Table_V3
> -{
> +typedef struct _ATOM_Vega10_PowerTune_Table_V3 {
>         UCHAR  ucRevId;
>         USHORT usSocketPowerLimit;
>         USHORT usBatteryPowerLimit;
> @@ -428,15 +424,13 @@ typedef struct _ATOM_Vega10_Hard_Limit_Record {
>      USHORT usVddMemLimit;
>  } ATOM_Vega10_Hard_Limit_Record;
>
> -typedef struct _ATOM_Vega10_Hard_Limit_Table
> -{
> +typedef struct _ATOM_Vega10_Hard_Limit_Table {
>      UCHAR ucRevId;
>      UCHAR ucNumEntries;
>      ATOM_Vega10_Hard_Limit_Record entries[1];
>  } ATOM_Vega10_Hard_Limit_Table;
>
> -typedef struct _Vega10_PPTable_Generic_SubTable_Header
> -{
> +typedef struct _Vega10_PPTable_Generic_SubTable_Header {
>      UCHAR  ucRevId;
>  } Vega10_PPTable_Generic_SubTable_Header;
>
> --
> 2.17.1
>
