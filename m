Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D12476018C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B7310E37A;
	Mon, 24 Jul 2023 21:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C5910E37A;
 Mon, 24 Jul 2023 21:52:18 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b9d68a7abaso3822352a34.3; 
 Mon, 24 Jul 2023 14:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235537; x=1690840337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZCLkvKumUHQk3r9AhtcRAYNusNQAwfIfwo76NwqwxM=;
 b=NJNrPR/+4w6Db4s9Be7NZWjp/7j0bjgT7rQXSNmYmdzNn4jSbrYE2el9AKekxRp0kc
 NI2LDXWXmfaG35F1XQXlzoXMZjh+YdUJmKIBmKKatLYYh/QRahssfyt8pfx9Qk4297Ba
 2hOtMcuyB31sz8AZjCQ3yQU3yYJfF7wOIbe+ZyvHLiey8syH3ruGJBW3sCRekn6s4h97
 B8y6Oop/h3Wzitd5jlSr0QOzP+aMploxiP0/u7lkjIG6aGAlWCoFjPlRkjudds2Iziay
 qgAbK9doQXoJ2C0j5EVnyStr6OKMXLQx591Yy0/1sn54gPWcjHprIkvR0Fy4NpKxZLaa
 RK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235537; x=1690840337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZCLkvKumUHQk3r9AhtcRAYNusNQAwfIfwo76NwqwxM=;
 b=mGcYYSf5v+ZCeDz7HsHUXosBEE+oSuU9aIoAIOV4oSqCLxfe9h5xU70UV4S2QM8BA8
 YI1qlzDMXIPGlCgCvvcVs975psM4iRVEts2nFLi28XtywsWgk5yaFFp1G2rgnuHmqbcE
 syNqasrA0TBOZVFszK9Sz62mgOKm6NO4gzNnCGdnT04tf+wJ4kdzzdj1q2YDa+t2JkkV
 sym+pfjDsPIpg/BJ5cMEO4E5mY+OlAxPjdkafEDySSBKDK/jWW50wZIvZOdQWoXcYeAA
 77RwZVOo3NLoVUq7svxsFr76t3nQbCd67kcmfYuXUKEek826AWsY8GrkgRCHMWrWZrbT
 WDLg==
X-Gm-Message-State: ABy/qLZcjNRZyDva56TYssGPini/ta7iDprHbcQzCaukOdfgDSI+reC6
 daNBGSDLqqx0+X7oNMdB9cYUuBM/2UXkACz7e1I=
X-Google-Smtp-Source: APBJJlExIYKSDixzSsODi4CidihdVt45LGPc8je8XTJjgDd8A4P+3kDHdnCQNc8Nk8vMMkzw76CIuftJuOAcEsiXtiE=
X-Received: by 2002:a9d:66d3:0:b0:6b9:bf1e:c141 with SMTP id
 t19-20020a9d66d3000000b006b9bf1ec141mr9203742otm.23.1690235537654; Mon, 24
 Jul 2023 14:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230724083344.9285-1-xujianghui@cdjrlc.com>
 <8e6eda082855e1b928253669fbb49316@208suo.com>
In-Reply-To: <8e6eda082855e1b928253669fbb49316@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:52:06 -0400
Message-ID: <CADnq5_PsrhawfqtB3HKjT7cH4=tJ8AnAEMrTAQwn8Y7wWBOzoA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in
 smu11_driver_if_sienna_cichlid.h
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

This doesn't apply cleanly.

Alex

On Mon, Jul 24, 2023 at 4:34=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing whitespace
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> index c5e26d619bf0..8ec588248aac 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> @@ -30,7 +30,7 @@
>
>   #define ENABLE_DEBUG_FEATURES
>
> -// Firmware features
> +// Firmware features
>   // Feature Control Defines
>   #define FEATURE_CCLK_DPM_BIT                 0
>   #define FEATURE_FAN_CONTROLLER_BIT           1
> @@ -92,7 +92,7 @@
>   #define FEATURE_ZSTATES_ECO_BIT             57
>   #define FEATURE_CC6_BIT                     58
>   #define FEATURE_DS_UMCCLK_BIT               59
> -#define FEATURE_DS_HSPCLK_BIT               60
> +#define FEATURE_DS_HSPCLK_BIT               60
>   #define NUM_FEATURES                        61
>
>   typedef struct {
