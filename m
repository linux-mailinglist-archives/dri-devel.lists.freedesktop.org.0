Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08C76015B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47D10E36D;
	Mon, 24 Jul 2023 21:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006610E36D;
 Mon, 24 Jul 2023 21:41:29 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a43cbb4343so2577188b6e.1; 
 Mon, 24 Jul 2023 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690234888; x=1690839688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sV2E65JaJ+s2Te44qQqNGa/qcFLI/Mc9cc9UlCLk1yo=;
 b=GPueKY01EuAz5CMCO8DVmG7WZNEehAvdLh3dPoiaOC/5mxUocQPPqsLbjmnwj51vZM
 XTL5/+qsDQ6iIX2BfIbktDLUjYGzMIIm3YXDIssjjMi57RiPbyQhbECcSJf/Ly5fXRoj
 TcduYsi+raYIO5ML3EHpw18e2XErIPQdsq6usxjQcO3qfGCYXlF5+fvERuB7LyWzUPN/
 HaL5rIb0HMpqVtUOn5R7WeU4y3z+TabHogMfV7tFbiZLxtLtRDzbWzsJAjvhSwtR3HW3
 /EyICUStP8/7c3+iZUN4dyZMHDgDJxNV+VzJKYsGfbzCDndI0RwXtFeyBMD5GdNGbXNF
 eAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690234888; x=1690839688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sV2E65JaJ+s2Te44qQqNGa/qcFLI/Mc9cc9UlCLk1yo=;
 b=aH4iWy/uW681fO7a2AcrL5boccPQquaynA8FxxDHFEmQkBuTLhN1vncqdYPBZzaAjt
 Lvt9oSSzG4AYce1reUkCKMTvpIR73okxKKIJMBBMI314lF1WdJdkuf9Zfq7/PUfc/Ygi
 U/pEKbcFs0I+lYUrB6ySIz5nKbxelglM7+va0tAl4Y8bVgCKsB/p1C5EYcCKlNT6ISjY
 aeI56bviSl5ccwpLi6iCpR8Uj1MFfV2Mn6v1y0ChQD2DhrlMfxmY+3t/AqUFcUPgfHbI
 1l4yoQW4YM+otQn8AH226KF14fun5m7b/HyuBShNpbIPPZv3yMh7YOA3CbR/qI5d6q0+
 JyHQ==
X-Gm-Message-State: ABy/qLbPcJ2GDOsCPxWVgzzJovhs7Lu9FnpaT3AkqQb6wXCsRcmC89ZS
 0uZaZNtNAugMp17wqmzZ9xzggA6iEjoDoTh54XM=
X-Google-Smtp-Source: APBJJlGRK3JQkS6TAmrMGjYqZYkyOwEqDWLq903A43VQpZ6r+BMC+w/yDYw1dk8djnSIsynnaK1MgbuLQTKxNiQ3j4o=
X-Received: by 2002:aca:1e0d:0:b0:3a3:fa64:bb8d with SMTP id
 m13-20020aca1e0d000000b003a3fa64bb8dmr7967436oic.10.1690234888364; Mon, 24
 Jul 2023 14:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230724033939.8147-1-xujianghui@cdjrlc.com>
 <f558b5bf6037d0e0eadcaee9448ad4c6@208suo.com>
In-Reply-To: <f558b5bf6037d0e0eadcaee9448ad4c6@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:41:17 -0400
Message-ID: <CADnq5_ONmrbaSwjzcoQ17qW8F8ShH3xgz58vv=uciVu8aePZ7g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: that open brace { should be on the previous
 line
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

Applied.  thanks!

Alex

On Sun, Jul 23, 2023 at 11:40=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/rv770_smc.c | 36 ++++++++++--------------------
>   1 file changed, 12 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/rv770_smc.c
> b/drivers/gpu/drm/radeon/rv770_smc.c
> index 45575c0d0a1d..09fa7f5e7c41 100644
> --- a/drivers/gpu/drm/radeon/rv770_smc.c
> +++ b/drivers/gpu/drm/radeon/rv770_smc.c
> @@ -34,8 +34,7 @@
>   #define FIRST_SMC_INT_VECT_REG 0xFFD8
>   #define FIRST_INT_VECT_S19     0xFFC0
>
> -static const u8 rv770_smc_int_vectors[] =3D
> -{
> +static const u8 rv770_smc_int_vectors[] =3D {
>         0x08, 0x10, 0x08, 0x10,
>         0x08, 0x10, 0x08, 0x10,
>         0x08, 0x10, 0x08, 0x10,
> @@ -54,8 +53,7 @@ static const u8 rv770_smc_int_vectors[] =3D
>         0x03, 0x51, 0x03, 0x51
>   };
>
> -static const u8 rv730_smc_int_vectors[] =3D
> -{
> +static const u8 rv730_smc_int_vectors[] =3D {
>         0x08, 0x15, 0x08, 0x15,
>         0x08, 0x15, 0x08, 0x15,
>         0x08, 0x15, 0x08, 0x15,
> @@ -74,8 +72,7 @@ static const u8 rv730_smc_int_vectors[] =3D
>         0x03, 0x56, 0x03, 0x56
>   };
>
> -static const u8 rv710_smc_int_vectors[] =3D
> -{
> +static const u8 rv710_smc_int_vectors[] =3D {
>         0x08, 0x04, 0x08, 0x04,
>         0x08, 0x04, 0x08, 0x04,
>         0x08, 0x04, 0x08, 0x04,
> @@ -94,8 +91,7 @@ static const u8 rv710_smc_int_vectors[] =3D
>         0x03, 0x51, 0x03, 0x51
>   };
>
> -static const u8 rv740_smc_int_vectors[] =3D
> -{
> +static const u8 rv740_smc_int_vectors[] =3D {
>         0x08, 0x10, 0x08, 0x10,
>         0x08, 0x10, 0x08, 0x10,
>         0x08, 0x10, 0x08, 0x10,
> @@ -114,8 +110,7 @@ static const u8 rv740_smc_int_vectors[] =3D
>         0x03, 0x51, 0x03, 0x51
>   };
>
> -static const u8 cedar_smc_int_vectors[] =3D
> -{
> +static const u8 cedar_smc_int_vectors[] =3D {
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
> @@ -134,8 +129,7 @@ static const u8 cedar_smc_int_vectors[] =3D
>         0x04, 0xF6, 0x04, 0xF6
>   };
>
> -static const u8 redwood_smc_int_vectors[] =3D
> -{
> +static const u8 redwood_smc_int_vectors[] =3D {
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
> @@ -154,8 +148,7 @@ static const u8 redwood_smc_int_vectors[] =3D
>         0x04, 0xF6, 0x04, 0xF6
>   };
>
> -static const u8 juniper_smc_int_vectors[] =3D
> -{
> +static const u8 juniper_smc_int_vectors[] =3D {
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
> @@ -174,8 +167,7 @@ static const u8 juniper_smc_int_vectors[] =3D
>         0x04, 0xF6, 0x04, 0xF6
>   };
>
> -static const u8 cypress_smc_int_vectors[] =3D
> -{
> +static const u8 cypress_smc_int_vectors[] =3D {
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
>         0x0B, 0x05, 0x0B, 0x05,
> @@ -194,8 +186,7 @@ static const u8 cypress_smc_int_vectors[] =3D
>         0x04, 0xF6, 0x04, 0xF6
>   };
>
> -static const u8 barts_smc_int_vectors[] =3D
> -{
> +static const u8 barts_smc_int_vectors[] =3D {
>         0x0C, 0x14, 0x0C, 0x14,
>         0x0C, 0x14, 0x0C, 0x14,
>         0x0C, 0x14, 0x0C, 0x14,
> @@ -214,8 +205,7 @@ static const u8 barts_smc_int_vectors[] =3D
>         0x05, 0x0A, 0x05, 0x0A
>   };
>
> -static const u8 turks_smc_int_vectors[] =3D
> -{
> +static const u8 turks_smc_int_vectors[] =3D {
>         0x0C, 0x14, 0x0C, 0x14,
>         0x0C, 0x14, 0x0C, 0x14,
>         0x0C, 0x14, 0x0C, 0x14,
> @@ -234,8 +224,7 @@ static const u8 turks_smc_int_vectors[] =3D
>         0x05, 0x0A, 0x05, 0x0A
>   };
>
> -static const u8 caicos_smc_int_vectors[] =3D
> -{
> +static const u8 caicos_smc_int_vectors[] =3D {
>         0x0C, 0x14, 0x0C, 0x14,
>         0x0C, 0x14, 0x0C, 0x14,
>         0x0C, 0x14, 0x0C, 0x14,
> @@ -254,8 +243,7 @@ static const u8 caicos_smc_int_vectors[] =3D
>         0x05, 0x0A, 0x05, 0x0A
>   };
>
> -static const u8 cayman_smc_int_vectors[] =3D
> -{
> +static const u8 cayman_smc_int_vectors[] =3D {
>         0x12, 0x05, 0x12, 0x05,
>         0x12, 0x05, 0x12, 0x05,
>         0x12, 0x05, 0x12, 0x05,
