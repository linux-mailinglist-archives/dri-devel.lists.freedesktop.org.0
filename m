Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C920F772B78
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2F010E027;
	Mon,  7 Aug 2023 16:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4D410E2F3;
 Mon,  7 Aug 2023 16:49:56 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a6f3ef3155so3729823b6e.1; 
 Mon, 07 Aug 2023 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426996; x=1692031796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgQa+1FKvDWzR4zoWEz8VexbuxihC5GZckb0Q0xRORc=;
 b=FQTZy50gW5hiLnD/qVVaqF2n4OXGk9PzU4wck0u5FbLinIBT//IhILVvwwU3x9Rtm8
 +lZXsAW2YkdkgV9Eexq3fUXpgofjnAkhuSbOVy80lx+5f8pszAh1xrUONZD6fRNpAhkw
 tg2bGo0vdY0sr4sqUMdlcduc+IBdahhv+QzitcQbsf6Bynaw6PhS3KmIJW11tT7SJDZh
 itWgPTtTILvwpUbcpW5S2f1V9S6MXwMftJYXay9qge47tFbJh35OPuk1uQadtSnKw15M
 KH8KSK7YoQopcH3HxcWRgt5SqTw1l7IPsmEH3yyKI1yZIL7LgFqzUZvcWF0sxxuqRV8Q
 Wy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426996; x=1692031796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgQa+1FKvDWzR4zoWEz8VexbuxihC5GZckb0Q0xRORc=;
 b=YbAPdbcNlM2I7CdXohbSQOmLfk7h5PkQJB3OFSrby/SEQ6ykCPDwe7I41sdCTBAZWh
 lVNhgyylOf2doXOiRnkWDKQ+rdbK3tG10vBa5MFyVaI6s8rQCBViTI73QscQ+JppdJzz
 LJ9ooX1ngtg79gJEEXigGcwgTT+/kuTYHZoz9ZQ8qGITirdp21fKxhDk8DeVIVFjCA1I
 5A9JGr+7IXLGk0Ibi72k0aN7tRAgxx0Ni8Y/HiGnkmBb2IJRoe+k5ccEDNy2Av6INjzC
 eOaJZhpbEEEnSIds0bM4cgb7mLo5NSs9zOGuc8XRsudgome+9osXOCLFNgV1RwHCanfj
 BgIw==
X-Gm-Message-State: AOJu0YyJt7WJm2RtWwAM5EvJzHvjDRH3SqPw3jLNbMNv7AK1rndx3Atf
 ugOi0GYFX6+hLqk6zG4bphH4VI6JlpLvWrELKzc=
X-Google-Smtp-Source: AGHT+IF/s1MEl434BzAsfKCcOnEZp4qpAJMatQaOEWnbl10rllg9YsKo7f4muZb+TbaWgnJGpjbma+BjChf8iv/FsII=
X-Received: by 2002:a54:4e0d:0:b0:3a7:9837:7148 with SMTP id
 a13-20020a544e0d000000b003a798377148mr3848673oiy.58.1691426995953; Mon, 07
 Aug 2023 09:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230801094443.7942-1-sunran001@208suo.com>
In-Reply-To: <20230801094443.7942-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:49:45 -0400
Message-ID: <CADnq5_MbmP9sEkWHndxaG+pp6bJkeO7h1qvya3wZWmktDpFYpQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega20_pptable.h
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

On Tue, Aug 1, 2023 at 5:44=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: space prohibited before open square bracket '['
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../amd/pm/powerplay/hwmgr/vega20_pptable.h   | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h
> index 2222e29405c6..b468dddbefff 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h
> @@ -73,14 +73,13 @@ enum ATOM_VEGA20_ODSETTING_ID {
>  };
>  typedef enum ATOM_VEGA20_ODSETTING_ID ATOM_VEGA20_ODSETTING_ID;
>
> -typedef struct _ATOM_VEGA20_OVERDRIVE8_RECORD
> -{
> +typedef struct _ATOM_VEGA20_OVERDRIVE8_RECORD {
>    UCHAR ucODTableRevision;
>    ULONG ODFeatureCount;
> -  UCHAR ODFeatureCapabilities [ATOM_VEGA20_ODFEATURE_MAX_COUNT];   //OD =
feature support flags
> +  UCHAR ODFeatureCapabilities[ATOM_VEGA20_ODFEATURE_MAX_COUNT];   //OD f=
eature support flags
>    ULONG ODSettingCount;
> -  ULONG ODSettingsMax [ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Upp=
er Limit for each OD Setting
> -  ULONG ODSettingsMin [ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Low=
er Limit for each OD Setting
> +  ULONG ODSettingsMax[ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Uppe=
r Limit for each OD Setting
> +  ULONG ODSettingsMin[ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Lowe=
r Limit for each OD Setting
>  } ATOM_VEGA20_OVERDRIVE8_RECORD;
>
>  enum ATOM_VEGA20_PPCLOCK_ID {
> @@ -99,16 +98,14 @@ enum ATOM_VEGA20_PPCLOCK_ID {
>  };
>  typedef enum ATOM_VEGA20_PPCLOCK_ID ATOM_VEGA20_PPCLOCK_ID;
>
> -typedef struct _ATOM_VEGA20_POWER_SAVING_CLOCK_RECORD
> -{
> +typedef struct _ATOM_VEGA20_POWER_SAVING_CLOCK_RECORD {
>    UCHAR ucTableRevision;
>    ULONG PowerSavingClockCount;                                 // Count =
of PowerSavingClock Mode
> -  ULONG PowerSavingClockMax  [ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // Po=
werSavingClock Mode Clock Maximum array In MHz
> -  ULONG PowerSavingClockMin  [ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // Po=
werSavingClock Mode Clock Minimum array In MHz
> +  ULONG PowerSavingClockMax[ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // Powe=
rSavingClock Mode Clock Maximum array In MHz
> +  ULONG PowerSavingClockMin[ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // Powe=
rSavingClock Mode Clock Minimum array In MHz
>  } ATOM_VEGA20_POWER_SAVING_CLOCK_RECORD;
>
> -typedef struct _ATOM_VEGA20_POWERPLAYTABLE
> -{
> +typedef struct _ATOM_VEGA20_POWERPLAYTABLE {
>        struct atom_common_table_header sHeader;
>        UCHAR  ucTableRevision;
>        USHORT usTableSize;
> --
> 2.17.1
>
