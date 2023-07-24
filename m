Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636257601B0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB5010E38A;
	Mon, 24 Jul 2023 21:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656D10E389;
 Mon, 24 Jul 2023 21:59:54 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b9f46ec07aso3087362a34.1; 
 Mon, 24 Jul 2023 14:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235993; x=1690840793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKXXQoujPlp56Vu9MiAPxZJv9g2kLPe6/i7I5ujqsT4=;
 b=HpWLr/cii57x0K56jdIMzaoYubGP5yAArPD4GGbZ7rg3c8zkWyPF8Jo1SZgFHVwYVw
 Q10GDz3c4jRYxaYxrzoKwaRBW6ocxi0//3MeEbBlMWoqGDzYc/ZaScvKLCD+h7vYIKuy
 +5RWO5r2eMOWYZDYhHqhtLF6s7eP6Rl+d3ohNAR0yumMY4jBrgKXilWKT8REFw7XZ4dC
 8EwezNLdSPpLTftMmFJyiIj67aimFqCUzWU1DlI6RBjqtbQzXovDUgH9g9E3c7t1+bhN
 ueVsy+UqTF3/k/+7/98C7YJu0qq178s33y2w01scVgj4UC322mxmj9DpdUl6zjZ//sfN
 2n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235993; x=1690840793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKXXQoujPlp56Vu9MiAPxZJv9g2kLPe6/i7I5ujqsT4=;
 b=g0newD6ZACpk0l23JznzNJZ6yI27hqJ93GMH8xvIHjNQ0Vf8h5iuMMRO1LQMZpNOyI
 3U5jFWLRr1PINoOM/+uV2eqA0S9ZUJ3CXWuRvumWBRqP1ThqSCY3O6S74f7NtN0UC9dx
 FoiTe9fp+Q+rr1fQX05zSzCljtMP2u4sPsJOMYN4Bj/ccKzGdfVFxGBAv9H1Cd9eJilo
 K0e6eNmmJzS8sBmQIHkxuGAg5MKoup9NoY4lVMkFlP7DEeMRmuzWrqTlPwHRVmdNd1pP
 iCiWM91h/ELbmYqEmlHdpQz5G4srFh20GX+T8z4LdJIb/rsnhnxEvsJ9GmWuuEmgCiLR
 YzVQ==
X-Gm-Message-State: ABy/qLYLpPXKIWnXowmhEPpMsnNZAXO/Wx1vW7Bv4+LMNnHi0GR8Tn9G
 QS0aUK2Nqe+M0VBaPqmMGM6m7PdrSwoCRE8Y300=
X-Google-Smtp-Source: APBJJlHVP3kmdwAl7RB3BmqgixgStZVMBM7WCfOT8KU4DkhTa9aSkSHPsGqnBbYlT3Ii5MIKmGH0b3f+xJAGF0VYE7U=
X-Received: by 2002:a05:6830:4410:b0:6b7:2ef3:37aa with SMTP id
 q16-20020a056830441000b006b72ef337aamr463718otv.15.1690235993268; Mon, 24 Jul
 2023 14:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230724090624.9699-1-xujianghui@cdjrlc.com>
 <5ce64e06635dbf038d73452098fd0163@208suo.com>
In-Reply-To: <5ce64e06635dbf038d73452098fd0163@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:59:42 -0400
Message-ID: <CADnq5_M-NaGgzFQB+zcCgCMPXROGFhk+Was+m9JYcvQq=k9u1g@mail.gmail.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 24, 2023 at 5:08=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   .../amd/pm/swsmu/inc/smu_v13_0_7_pptable.h    | 21 +++++++------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
> b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
> index eadbe0149cae..eb694f9f556d 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
> @@ -41,8 +41,7 @@
>   #define SMU_13_0_7_PP_OVERDRIVE_VERSION 0x83        // OverDrive 8
> Table Version 0.2
>   #define SMU_13_0_7_PP_POWERSAVINGCLOCK_VERSION 0x01 // Power Saving
> Clock Table Version 1.00
>
> -enum SMU_13_0_7_ODFEATURE_CAP
> -{
> +enum SMU_13_0_7_ODFEATURE_CAP {
>       SMU_13_0_7_ODCAP_GFXCLK_LIMITS =3D 0,
>       SMU_13_0_7_ODCAP_UCLK_LIMITS,
>       SMU_13_0_7_ODCAP_POWER_LIMIT,
> @@ -62,8 +61,7 @@ enum SMU_13_0_7_ODFEATURE_CAP
>       SMU_13_0_7_ODCAP_COUNT,
>   };
>
> -enum SMU_13_0_7_ODFEATURE_ID
> -{
> +enum SMU_13_0_7_ODFEATURE_ID {
>       SMU_13_0_7_ODFEATURE_GFXCLK_LIMITS           =3D 1 <<
> SMU_13_0_7_ODCAP_GFXCLK_LIMITS,           //GFXCLK Limit feature
>       SMU_13_0_7_ODFEATURE_UCLK_LIMITS             =3D 1 <<
> SMU_13_0_7_ODCAP_UCLK_LIMITS,             //UCLK Limit feature
>       SMU_13_0_7_ODFEATURE_POWER_LIMIT             =3D 1 <<
> SMU_13_0_7_ODCAP_POWER_LIMIT,             //Power Limit feature
> @@ -85,8 +83,7 @@ enum SMU_13_0_7_ODFEATURE_ID
>
>   #define SMU_13_0_7_MAX_ODFEATURE 32 //Maximum Number of OD Features
>
> -enum SMU_13_0_7_ODSETTING_ID
> -{
> +enum SMU_13_0_7_ODSETTING_ID {
>       SMU_13_0_7_ODSETTING_GFXCLKFMAX =3D 0,
>       SMU_13_0_7_ODSETTING_GFXCLKFMIN,
>       SMU_13_0_7_ODSETTING_UCLKFMIN,
> @@ -123,8 +120,7 @@ enum SMU_13_0_7_ODSETTING_ID
>   };
>   #define SMU_13_0_7_MAX_ODSETTING 64 //Maximum Number of ODSettings
>
> -enum SMU_13_0_7_PWRMODE_SETTING
> -{
> +enum SMU_13_0_7_PWRMODE_SETTING {
>       SMU_13_0_7_PMSETTING_POWER_LIMIT_QUIET =3D 0,
>       SMU_13_0_7_PMSETTING_POWER_LIMIT_BALANCE,
>       SMU_13_0_7_PMSETTING_POWER_LIMIT_TURBO,
> @@ -144,8 +140,7 @@ enum SMU_13_0_7_PWRMODE_SETTING
>   };
>   #define SMU_13_0_7_MAX_PMSETTING 32 //Maximum Number of PowerMode
> Settings
>
> -struct smu_13_0_7_overdrive_table
> -{
> +struct smu_13_0_7_overdrive_table {
>       uint8_t revision;                             //Revision =3D
> SMU_13_0_7_PP_OVERDRIVE_VERSION
>       uint8_t reserve[3];                           //Zero filled field
> reserved for future use
>       uint32_t feature_count;                       //Total number of
> supported features
> @@ -156,8 +151,7 @@ struct smu_13_0_7_overdrive_table
>       int16_t pm_setting[SMU_13_0_7_MAX_PMSETTING]; //Optimized power
> mode feature settings
>   };
>
> -enum SMU_13_0_7_PPCLOCK_ID
> -{
> +enum SMU_13_0_7_PPCLOCK_ID {
>       SMU_13_0_7_PPCLOCK_GFXCLK =3D 0,
>       SMU_13_0_7_PPCLOCK_SOCCLK,
>       SMU_13_0_7_PPCLOCK_UCLK,
> @@ -175,8 +169,7 @@ enum SMU_13_0_7_PPCLOCK_ID
>   };
>   #define SMU_13_0_7_MAX_PPCLOCK 16 //Maximum Number of PP Clocks
>
> -struct smu_13_0_7_powerplay_table
> -{
> +struct smu_13_0_7_powerplay_table {
>       struct atom_common_table_header header; //For PLUM_BONITO,
> header.format_revision =3D 15, header.content_revision =3D 0
>       uint8_t table_revision;                 //For PLUM_BONITO,
> table_revision =3D 2
>       uint8_t padding;
