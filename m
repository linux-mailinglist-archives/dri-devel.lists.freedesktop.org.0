Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2695BDDC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 20:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA76110EBBE;
	Thu, 22 Aug 2024 18:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mjuc4X+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E68110EBBE;
 Thu, 22 Aug 2024 18:01:20 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7c2595f5c35so112467a12.1; 
 Thu, 22 Aug 2024 11:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724349679; x=1724954479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IGkb+yvoWKgY6f1pKvffTMPxwTT5DeP9+ZQzFPPBbU=;
 b=mjuc4X+du+nTmHw5TvpPeLH3e7+yHem0z/P5hFL3D2a/im/JB+kHb7uGKy8EV8PDOa
 ZMq3JITJivdXD4cbqzaUfOOmbbqesjDe+57YLrQLDk2ZP+y6Pcdn6XVAnksvQel09IMc
 aGfJQGg/554fxclfnQMGUi+iV1C62TaACV1SKoUY1lGCrMJRaZllt5TFPdwEhxoBp7hm
 xYKyPLveNGMZi4CkbqmB1H5czsMj9yNlX6perH+m8zxX6yIBSHxNlMZUdnvWyygGEMql
 +LtSyllgq3z2QSjn9u82MxgMnb4b914gf1q8QViYQ7I/fovWaQYFFaq895X2NvMCnS14
 4s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724349679; x=1724954479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IGkb+yvoWKgY6f1pKvffTMPxwTT5DeP9+ZQzFPPBbU=;
 b=FUTaZaR1m2FQOMeQDP2ONH0t7SY+p/LdrIDiKhKYzK9rfv6miNS+hmvkScgrmKA1Ky
 lP/9t+lmWPouMpZ1DddnIHX3yapO5Faxu5Jh2BAIn6a1ZMzJ8JtDhJ4AAoJS9jQCxaCl
 GHGNI0a2C82qgPT3zJ4fVWPezqdws1BwtEnq9seqUo4OnB/kRVmx/SwGFqXh4WSCQx0v
 wzdQVFzNEmTd0EUF7RdPvLkjMAVYTT0msFfT407HL4eOHupz4ywG6o8xG+9OsJ75QY8X
 rfKwC62sFvPjGQqOVm0e1mVU0Rxc8seq9hfFzB9PzsS+r8yNSjCPsl6XB+AzT87WqfCT
 mtEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJyNEkEv/rpQHlToXIGeldSGmdxGfgPHPN6AEACbO4seIJN0yVRsUbXI7mNwfqk91/eAmxUSIWpwz0@lists.freedesktop.org,
 AJvYcCWECQXJNVi9zfSMq5uBcUt/TJHaGvW7d9Gg2qVbc78RgN/jrdyBzZGy4BnQ5wCQZnhacwbSnNzf@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywiap0dsM+IRo2q80sCGHrakwtAQao4QIqtpVZ0PMdaAH5nvABd
 JJBrvD9xm2SzR413jVk6ESKQed3yv2sVkW37SE676D9Qxq+JYYBZHwqFxraCRNZABU9tQantyXB
 u9p9U/M0DWBKSfAIiX+1JhWXjTC0=
X-Google-Smtp-Source: AGHT+IEovfL7TTOHMHNjGi8FsQAT5DlUHXGCRkJP5OX/etAXNtr9pPnu3WMIst/rhzDkrMbsVVDrJ036rcwViaA+mt8=
X-Received: by 2002:a05:6a00:2342:b0:70d:148e:4bad with SMTP id
 d2e1a72fcca58-714234680ebmr4544467b3a.2.1724349679359; Thu, 22 Aug 2024
 11:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240822015819.3356282-1-ruanjinjie@huawei.com>
In-Reply-To: <20240822015819.3356282-1-ruanjinjie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2024 14:01:07 -0400
Message-ID: <CADnq5_Pm9GHaFWLUniQ608CNMPMSBpNdh2JW9-AcKyEM18KE9Q@mail.gmail.com>
Subject: Re: [PATCH -next v2 RESEND] drm/amd/display: Remove unused
 dcn35_fpga_funcs
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, nicholas.kazlauskas@amd.com, 
 Charlene.Liu@amd.com, chiahsuan.chung@amd.com, hamza.mahfooz@amd.com, 
 sungjoon.kim@amd.com, syed.hassan@amd.com, roman.li@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Aug 22, 2024 at 5:20=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> dcn35_fpga_funcs is not used anywhere, remove it.

This will lead to warnings about unused functions.  The fpga specific
functions should be removed as well.  I'd suggest compile testing your
changes first to catch these types of warnings.

Alex


>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Remove it instead of making it static.
> ---
>  .../gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c=
 b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> index e2d906327e2e..15977c2d256d 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> @@ -1068,13 +1068,6 @@ static struct clk_mgr_funcs dcn35_funcs =3D {
>         .is_ips_supported =3D dcn35_is_ips_supported,
>  };
>
> -struct clk_mgr_funcs dcn35_fpga_funcs =3D {
> -       .get_dp_ref_clk_frequency =3D dce12_get_dp_ref_freq_khz,
> -       .update_clocks =3D dcn35_update_clocks_fpga,
> -       .init_clocks =3D dcn35_init_clocks_fpga,
> -       .get_dtb_ref_clk_frequency =3D dcn31_get_dtb_ref_freq_khz,
> -};
> -
>  void dcn35_clk_mgr_construct(
>                 struct dc_context *ctx,
>                 struct clk_mgr_dcn35 *clk_mgr,
> --
> 2.34.1
>
