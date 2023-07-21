Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4227675CCCE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 17:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40AF10E6B5;
	Fri, 21 Jul 2023 15:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB15F10E6B4;
 Fri, 21 Jul 2023 15:57:07 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b9cf1997c4so1758538a34.3; 
 Fri, 21 Jul 2023 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689955027; x=1690559827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHI6PjFKXZji62G1V5r/6jFnxf0AM65yBjnIXIDqpKU=;
 b=H6HIj/BzFhZLIecTq3jMzTjcsZlGyVbIFMUJnF1DSQiLxUOdyuR2I40UXNxWwl2iHr
 p6cVzQFzxWcsNe5sDWdeBK2V18/0is9STb5yzp8Fj4dv9TUjZ5r+SeX1JRzS942AKjn/
 XikMvkj9P/sQn9T1IGXwFtsfv6/AbBRwUzrzZpNXbkf0TciS1SatYgPwhIrRM1DkbY6x
 na1nTEp1gRqgLofPdiAShZHU05TmOCb40+whRx61sqjvDp5LUPGQuYTXvMknKXXdh9hq
 fjC04lndsE+eNBliwNlsalUztiwY75kd6mFC9oaqYmc2pchPkcpDuMrOv4sXqRLr4UdM
 pPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689955027; x=1690559827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHI6PjFKXZji62G1V5r/6jFnxf0AM65yBjnIXIDqpKU=;
 b=LGuKK70Ru0od8Sp+N9VIZs61jOBU9n6s+FqRR/+O4PNepbmS1TeROq/Se53hOrsrqs
 0LyHYzjYPKr+q/BOwc7r3XumsnECIkfLozQ7c2icX4Yj12OlpsItVC5zarcRueM5FygR
 lx+GGZp7d8E/9/1bLsAlGA+Abl4RYZwla0xyeYacSaKArtW3QCGWTdPGUP/bSZlNXbRv
 7x+IOcLnBq3Ho7MS+azVu5V0p/9zo788kUq+KRk3plaRVfORALTGWFcm86FaIvg9n0bm
 uT/+ing/xUC1MIRUIjKz+1QCQIPGy/2GEXRec9Qmm1jOMqXNvSx0Oo8C3I0m44ImNA6+
 oERA==
X-Gm-Message-State: ABy/qLbG1oxCmXJyLFkU5b2LO4J2/HuzB0FosRjT7k+oQU20JHNDFZnV
 msZKY9JskrTsUZqRPTtGFR/lR0kcr5hnQNV+w8U=
X-Google-Smtp-Source: APBJJlFBXAUjgYxVHyPQuxtWRK9jWFVgGsL5FPIAYnI5F6w2bjfsgOZ08UdghiEbOvgIMoUwonQ+9s+mFvz7iFbDTZ8=
X-Received: by 2002:a05:6870:c210:b0:1b7:2ad3:454d with SMTP id
 z16-20020a056870c21000b001b72ad3454dmr2633102oae.24.1689955026811; Fri, 21
 Jul 2023 08:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230721032537.4727-1-xujianghui@cdjrlc.com>
 <9bb658b64109e1e60afdf82906ae3e03@208suo.com>
In-Reply-To: <9bb658b64109e1e60afdf82906ae3e03@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jul 2023 11:56:55 -0400
Message-ID: <CADnq5_PBVuh=fOnh-wooP9QWV_NOdkc5wew_VckrKp8_E5oBTg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: open brace '{' following struct go on the
 same line
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This applied properly.  Applied.  Thanks!

Alex

On Thu, Jul 20, 2023 at 11:27=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   .../gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h  | 21 +++++++------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
> b/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
> index 1dc7a065a6d4..251ed011b3b0 100644
> --- a/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
> +++ b/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
> @@ -41,8 +41,7 @@
>   #define SMU_13_0_0_PP_OVERDRIVE_VERSION 0x83        // OverDrive 8
> Table Version 0.2
>   #define SMU_13_0_0_PP_POWERSAVINGCLOCK_VERSION 0x01 // Power Saving
> Clock Table Version 1.00
>
> -enum SMU_13_0_0_ODFEATURE_CAP
> -{
> +enum SMU_13_0_0_ODFEATURE_CAP {
>       SMU_13_0_0_ODCAP_GFXCLK_LIMITS =3D 0,
>       SMU_13_0_0_ODCAP_UCLK_LIMITS,
>       SMU_13_0_0_ODCAP_POWER_LIMIT,
> @@ -62,8 +61,7 @@ enum SMU_13_0_0_ODFEATURE_CAP
>       SMU_13_0_0_ODCAP_COUNT,
>   };
>
> -enum SMU_13_0_0_ODFEATURE_ID
> -{
> +enum SMU_13_0_0_ODFEATURE_ID {
>       SMU_13_0_0_ODFEATURE_GFXCLK_LIMITS           =3D 1 <<
> SMU_13_0_0_ODCAP_GFXCLK_LIMITS,           //GFXCLK Limit feature
>       SMU_13_0_0_ODFEATURE_UCLK_LIMITS             =3D 1 <<
> SMU_13_0_0_ODCAP_UCLK_LIMITS,             //UCLK Limit feature
>       SMU_13_0_0_ODFEATURE_POWER_LIMIT             =3D 1 <<
> SMU_13_0_0_ODCAP_POWER_LIMIT,             //Power Limit feature
> @@ -85,8 +83,7 @@ enum SMU_13_0_0_ODFEATURE_ID
>
>   #define SMU_13_0_0_MAX_ODFEATURE 32 //Maximum Number of OD Features
>
> -enum SMU_13_0_0_ODSETTING_ID
> -{
> +enum SMU_13_0_0_ODSETTING_ID {
>       SMU_13_0_0_ODSETTING_GFXCLKFMAX =3D 0,
>       SMU_13_0_0_ODSETTING_GFXCLKFMIN,
>       SMU_13_0_0_ODSETTING_UCLKFMIN,
> @@ -123,8 +120,7 @@ enum SMU_13_0_0_ODSETTING_ID
>   };
>   #define SMU_13_0_0_MAX_ODSETTING 64 //Maximum Number of ODSettings
>
> -enum SMU_13_0_0_PWRMODE_SETTING
> -{
> +enum SMU_13_0_0_PWRMODE_SETTING {
>       SMU_13_0_0_PMSETTING_POWER_LIMIT_QUIET =3D 0,
>       SMU_13_0_0_PMSETTING_POWER_LIMIT_BALANCE,
>       SMU_13_0_0_PMSETTING_POWER_LIMIT_TURBO,
> @@ -144,8 +140,7 @@ enum SMU_13_0_0_PWRMODE_SETTING
>   };
>   #define SMU_13_0_0_MAX_PMSETTING 32 //Maximum Number of PowerMode
> Settings
>
> -struct smu_13_0_0_overdrive_table
> -{
> +struct smu_13_0_0_overdrive_table {
>       uint8_t revision;                             //Revision =3D
> SMU_13_0_0_PP_OVERDRIVE_VERSION
>       uint8_t reserve[3];                           //Zero filled field
> reserved for future use
>       uint32_t feature_count;                       //Total number of
> supported features
> @@ -156,8 +151,7 @@ struct smu_13_0_0_overdrive_table
>       int16_t pm_setting[SMU_13_0_0_MAX_PMSETTING]; //Optimized power
> mode feature settings
>   };
>
> -enum SMU_13_0_0_PPCLOCK_ID
> -{
> +enum SMU_13_0_0_PPCLOCK_ID {
>       SMU_13_0_0_PPCLOCK_GFXCLK =3D 0,
>       SMU_13_0_0_PPCLOCK_SOCCLK,
>       SMU_13_0_0_PPCLOCK_UCLK,
> @@ -175,8 +169,7 @@ enum SMU_13_0_0_PPCLOCK_ID
>   };
>   #define SMU_13_0_0_MAX_PPCLOCK 16 //Maximum Number of PP Clocks
>
> -struct smu_13_0_0_powerplay_table
> -{
> +struct smu_13_0_0_powerplay_table {
>       struct atom_common_table_header header; //For SMU13,
> header.format_revision =3D 15, header.content_revision =3D 0
>       uint8_t table_revision;                 //For SMU13, table_revision
> =3D 2
>       uint8_t padding;
