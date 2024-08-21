Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F495A5E3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BD510E6C7;
	Wed, 21 Aug 2024 20:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tgdv55Me";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1500810E6C0;
 Wed, 21 Aug 2024 20:29:50 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-201d99ecbb4so101445ad.2; 
 Wed, 21 Aug 2024 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724272189; x=1724876989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMGohLZNT4tHT1s57E5AexVYMwxNXCTuB+5zOwYpqCg=;
 b=Tgdv55MeU/6gJGIJbWLHTzWRZcxml68FIIR9jwRpaTa4cURmY++UvnWONUQBsH0WQd
 fsE72Z/iGn00rN5PuIltKWUvMNiDorSIZB3WfxALzjx0DZBbiKLCQCnJCrrrvNcVSTuX
 ML7R5B6xNYf9K3hOD4zpTpeg3BlD/RRIh8mVdTYl2s61MGcQfD5R5OOPJHPnmFSwj+S/
 310TduBKOECeVcI/9wYI2osZhvwmfbypfOGXTYH3XZawhkbxQ2LaK8F5t7X9acOxOIzi
 dGA+9W9wFzG6x9FBHS8FKdcPKdLSg6TH7x7e8g/2tCkzcymlfsjlcV9hXRTG+DbYEyDV
 YjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724272189; x=1724876989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMGohLZNT4tHT1s57E5AexVYMwxNXCTuB+5zOwYpqCg=;
 b=u2B5QZZR9m7MJYueNw5FUyukPfEzMpLEw2BMOh6YEfmgVJSyCF90YLRdQ9emDkTHSM
 zRo+TjXd8z7SmAJqj512bwWrNR4DO44y7oBjLow7mg2A4BHtc8sbPCKoHmOtCfsIrTeF
 vlbsL2XL6aQq4oCA2nG1fXCtk3UNEZbAJNzezU82AHVMhdo5JAf2mbEDzX1tfLpalol8
 QZ2F2JPv++r1M5906d9yUT6LQ10Ye/O5hBnAMGZebPa5pS2QgOssZD9ZTyiIuXjwhaQS
 c//oC7qroPZtP2wfyadegZeECRJhIxXwGMfm5fSKQtK7xi1L6/fFW4+UANbPiVdrZSqQ
 k/cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPJJM36IZD1pzXwEyRvgekmmR6TOBluNHdHz2ZmcU6UUXELGat0r8oyv40uyb9gAVs/xKQHUxl@lists.freedesktop.org,
 AJvYcCXRXDPqkOTjM2ZMlXRr0k14t3IPEuG4p8MrMndj7N8J8pMBYsyipQFGVkZhvbtYI6y9oqpjMKIcR6wn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygwTy9MVJJc/Pm6sQWepAAcPmxnwRbFH2JlMKQoGltJ4thyQ6y
 luF3UsWjJ8ojtLnfmWSOnK+B1FwvWUyIp2M5OIIrI81jlpR7tVab8+TyJbXl4yh9c4YXltj2/ZP
 PZEb8IBHb7D6/VZr1K7wPqwBqbjQ=
X-Google-Smtp-Source: AGHT+IEGtRum4QK+JxKr9jk5NtZWt1CaZw4I976Kw9lJP8I79xKG8phiOLq5jxX3q5+12eU8Oir2efYnr8pC3NwDzvQ=
X-Received: by 2002:a17:902:d4c8:b0:202:3e06:818d with SMTP id
 d9443c01a7336-2036819c4ecmr21669775ad.10.1724272189272; Wed, 21 Aug 2024
 13:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240821064040.2292969-1-ruanjinjie@huawei.com>
 <20240821064040.2292969-2-ruanjinjie@huawei.com>
In-Reply-To: <20240821064040.2292969-2-ruanjinjie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2024 16:29:37 -0400
Message-ID: <CADnq5_Of6Up9PinPKrJP9m2LgUUNaFgaJ214DR=09AgSCdeiWg@mail.gmail.com>
Subject: Re: [PATCH -next 1/5] drm/amd/display: Make
 core_dcn4_g6_temp_read_blackout_table static
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: chaitanya.dhere@amd.com, jun.lei@amd.com, harry.wentland@amd.com, 
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, alex.hung@amd.com, aurabindo.pillai@amd.com, 
 colin.i.king@gmail.com, dillon.varone@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied 1-4.

Alex

On Wed, Aug 21, 2024 at 2:33=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> The sparse tool complains as follows:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_co=
re_dcn4_calcs.c:6853:56: warning:
>         symbol 'core_dcn4_g6_temp_read_blackout_table' was not declared. =
Should it be static?
>
> This symbol is not used outside of dml2_core_dcn4_calcs.c, so marks it st=
atic.
>
> And not want to change it, so mark it const.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_cor=
e/dml2_core_dcn4_calcs.c
> index c3c4d8d9525c..0c24f15d5067 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> @@ -6850,7 +6850,8 @@ struct dml2_core_internal_g6_temp_read_blackouts_ta=
ble {
>         } entries[DML_MAX_CLK_TABLE_SIZE];
>  };
>
> -struct dml2_core_internal_g6_temp_read_blackouts_table core_dcn4_g6_temp=
_read_blackout_table =3D {
> +static const struct dml2_core_internal_g6_temp_read_blackouts_table
> +       core_dcn4_g6_temp_read_blackout_table =3D {
>         .entries =3D {
>                 {
>                         .uclk_khz =3D 96000,
> --
> 2.34.1
>
