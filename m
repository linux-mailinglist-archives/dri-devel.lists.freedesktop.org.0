Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDF760175
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F010E36F;
	Mon, 24 Jul 2023 21:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289F710E36F;
 Mon, 24 Jul 2023 21:44:26 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bb31245130so892853a34.1; 
 Mon, 24 Jul 2023 14:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235065; x=1690839865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZlHxsY9OcrrDCal1ZNdgpHuchbxam/ZBDhN8uMZFULc=;
 b=M7sUc1gW3sLWS8GMvsV462wSss4hddFsBEUqscVpoXFdr62KZQPr9lm9mjTxQo8Fps
 5z077odF859+vejqTUQIBca0alsNUECh+TWMC9EQmNEriKqWq3Q3dytAQ91j5pnq+qt5
 GbuGNFAIQgiHNX6dnZMWEAVy2QZcJR3slvYGc6qQG51EKRpjQZ63sLSrLghgB4qw3LTz
 /8mbN8aqFB5EZ+rpDLyiSlYpj4R40MJ3X7x+gXFQlVM1cHJ2BW1dQzawl2DKSXAIz3nV
 aKTM6bn0GCSNbFCY/bEH+gHYcd5xwYaCNeEnh1GpjGWCs5dpi83Kt9wVyGToUufy0LC1
 O62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235065; x=1690839865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZlHxsY9OcrrDCal1ZNdgpHuchbxam/ZBDhN8uMZFULc=;
 b=AREPaULf3aN5XXOaYb8JvSW4cH9AlcqDlQXBmqE2eWNzFSDazWyQPoKyXBEydgjn9s
 U5SFsv8IfFza1LjdLyblRYY1mHBDIF4Rbb6FGRXUE7TvrlpSq3aIMlELsr9ecTNVxo8h
 mmNqblfG5byovv/BT5LysuREdxZdBOi7avQw6uDdmHdwATK3jf6aQzosuORQiHPTcG8q
 Ll5mwCVQe6e0cdAE454pJBqTwRIdFvIHjGz+DBZ1+8YG1mXK8UkkpCJIUARZBUsoKYPf
 vuhbAsdMQR3sGEXXonbe83lFJPKbZyaxE+ygOrxFQcg0wZYEL5R35DyxaS7vtGTjjZ9n
 FhVg==
X-Gm-Message-State: ABy/qLYT7goD8SqDaSFizzuyNNoAWeuO4H09OryCZ319k6SBgWVtP+4d
 4iP6FYQ9ohBZkWAF0EuYjn4UyLfh20ifegtEa5I=
X-Google-Smtp-Source: APBJJlEg7/5AKifoi+TnBm8aAaktrudaF0wR/ft0Cx9kmj1mrHGtFnMgPXRkyDfas0B3XBO4l/9RX1au+STS/+RL0TA=
X-Received: by 2002:a05:6870:d112:b0:1b0:3ffc:97e9 with SMTP id
 e18-20020a056870d11200b001b03ffc97e9mr12694143oac.0.1690235065373; Mon, 24
 Jul 2023 14:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230724034415.8257-1-xujianghui@cdjrlc.com>
 <304e90636af5cb6843ae603cd973680f@208suo.com>
In-Reply-To: <304e90636af5cb6843ae603cd973680f@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:44:14 -0400
Message-ID: <CADnq5_M4uLoVGn02NC7bCFwbMieOsr7MOzSoTXgXnruDNzCy4g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Move assignment outside if condition
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

On Sun, Jul 23, 2023 at 11:45=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> Fixes the following checkpatch errors:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/radeon_legacy_tv.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_tv.c
> b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
> index 12e180b119ac..7883e9ec0bae 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_tv.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_tv.c
> @@ -724,12 +724,14 @@ void radeon_legacy_tv_mode_set(struct drm_encoder
> *encoder,
>         }
>
>         for (i =3D 0; i < MAX_H_CODE_TIMING_LEN; i++) {
> -               if ((tv_dac->tv.h_code_timing[i] =3D hor_timing[i]) =3D=
=3D 0)
> +               tv_dac->tv.h_code_timing[i] =3D hor_timing[i];
> +               if (tv_dac->tv.h_code_timing[i] =3D=3D 0)
>                         break;
>         }
>
>         for (i =3D 0; i < MAX_V_CODE_TIMING_LEN; i++) {
> -               if ((tv_dac->tv.v_code_timing[i] =3D vert_timing[i]) =3D=
=3D 0)
> +               tv_dac->tv.v_code_timing[i] =3D vert_timing[i];
> +               if (tv_dac->tv.v_code_timing[i] =3D=3D 0)
>                         break;
>         }
