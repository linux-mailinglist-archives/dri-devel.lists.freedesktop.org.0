Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F574ABA9E0
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1754E10E169;
	Sat, 17 May 2025 11:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key) header.d=goosey.org header.i=@goosey.org header.b="DN+xt3Pf";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="HirwGCjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Sat, 17 May 2025 03:59:08 UTC
Received: from e240-10.smtp-out.eu-north-1.amazonses.com
 (e240-10.smtp-out.eu-north-1.amazonses.com [23.251.240.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B2A10E107;
 Sat, 17 May 2025 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747454032;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
 b=DN+xt3Pf0esUS4LLsJVyhWwK3AUOotJYRPKSCXUWD4rEq2fAHohcjQWAvDluE1sE
 JEpxBuWTqFQEDUy5nENq4BZhKg0qamEkrF5+OWOV+i5c8vBsJ8xCqNS2CluCYQu1ggy
 Zj7eQkcQh4Q4S4KhJIJP/baXJUPqj4bvWZYZy0dMNpMOMLc2qkfVrlTdhOEvNnqCsNW
 VJl8TXu34RKakVRd/4WWwelLdIUu3LGS5RCkiYMprliHEqpMxCybbMuIjucsGz91kug
 2kkUxWakJD6tng3E7NVCLoTm84oatwVaNbAFJT5qe7eK1TPhUwnQE7jxhjAUIzj7mYS
 U+ok18XQYw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747454032;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
 b=HirwGCjtyzrEEd7o6JCCLS4dGCLcd6osBBaeLSJQ7M5xRX/SNPSzNzlkyyyQr0Lg
 W05JdBIEkFyOieYpDNNedDprdtayVqO2LWTXsOvB42nM2+dx0C1I54o0GUmRgu/WgPI
 scUTaDTDNfSlqeNqx7iviinwo0eYOBya/vcD9TMY=
X-Forwarded-Encrypted: i=1;
 AJvYcCVSS2tev2DlClAgkbFq4/dbU1bdhqg/tQDZNli2bwThwgfLVHLt2EcDqYR8AK19jJjOtBr7Mw4S/SSA@lists.freedesktop.org,
 AJvYcCXYYBoBKCVIeW6/vJWXWHckEgxaIrxguGcydqSSR23otIO1PV1wvkIzIhKCNQl7lkhsx9VIccoQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7Ity+QvcvmpsEIilkkuLpl4tIcMtIcF1iSxg6nU6V+dLx1ef8
 hcYCq1D/D3Kzb6IZWx42QhheB8kvfNIGgmRONccR9aarOVsq5B3ZrXTbO2mWweBEbDMUI+noEBc
 E1LDRCaxEvxqih/5mAgp07A6zvKymw8s=
X-Google-Smtp-Source: AGHT+IHf19z2sbUg7xrM4qsuKOPs/2f9qWqFkx5Ys30i8cc/aKp+R4ErTYpyM5kQDtvy+RMgphYTqVKTkUuG9PdPAhM=
X-Received: by 2002:a17:902:d484:b0:231:e413:986c with SMTP id
 d9443c01a7336-231e4139adamr56049165ad.11.1747454030242; Fri, 16 May 2025
 20:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Sat, 17 May 2025 03:53:52 +0000
X-Gmail-Original-Message-ID: <CADvZ6Er=6M4Q9WKyQXSxfQ=KDgZ7rabKER=MUVoirxavukwQjQ@mail.gmail.com>
X-Gm-Features: AX0GCFtcuNqyH6AItJPisixd0IN5CrGy5hhjrQS6OJ-E5B0yBtGKj1UY3yegyfw
Message-ID: <01100196dc607b57-e0e7ce8e-910c-4a90-9dfa-71d5a568c6e4-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH 2/2] fixing typo in function name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.17-23.251.240.10
X-Mailman-Approved-At: Sat, 17 May 2025 11:43:17 +0000
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

Jihed Chaibi <jihed.chaibi.dev@gmail.com>, 17 May 2025 Cmt, 06:09
tarihinde =C5=9Funu yazd=C4=B1:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>

i didnt see this and yes *grph_object_ctrl_defs.h* is exactly what i'm
talking about, please ignore my previous email.

Regards

Ozgur

> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>  drivers/gpu/drm/radeon/atombios.h | 2 +-
>  drivers/gpu/drm/radeon/kv_dpm.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/a=
tombios.h
> index 2db407892..b961096a4 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -5072,7 +5072,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
>  #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE              =
  0x01
>  #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                             =
  0x02
>  #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                       =
  0x08
> -#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                             =
  0x10
> +#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                             =
  0x10
>
>  /***********************************************************************=
***********************************************
>    ATOM_INTEGRATED_SYSTEM_INFO_V1_7 Description
> diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_=
dpm.c
> index 55dbf450b..4aa050385 100644
> --- a/drivers/gpu/drm/radeon/kv_dpm.c
> +++ b/drivers/gpu/drm/radeon/kv_dpm.c
> @@ -2329,7 +2329,7 @@ static int kv_parse_sys_info_table(struct radeon_de=
vice *rdev)
>                                 le32_to_cpu(igp_info->info_8.ulNbpStateNC=
lkFreq[i]);
>                 }
>                 if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
> -                   SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
> +                   SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
>                         pi->caps_enable_dfs_bypass =3D true;
>
>                 sumo_construct_sclk_voltage_mapping_table(rdev,
> --
> 2.39.5
>
>
>
