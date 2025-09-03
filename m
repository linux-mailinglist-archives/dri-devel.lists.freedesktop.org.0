Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3DEB423E6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8922310E8A7;
	Wed,  3 Sep 2025 14:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Za+jXVME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B60310E04E;
 Wed,  3 Sep 2025 14:41:15 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-52a2bc2c968so186784137.2; 
 Wed, 03 Sep 2025 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756910474; x=1757515274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyiEoT+mfYk4CeGhzX31QR1RtE0qWzCxT6Ooec2Q79Q=;
 b=Za+jXVMEkS+eg3d9iz2JGmWtXfHndJ4Y7zTW7coypkjG124PeGx6orMCSU15+XEi3T
 soLGCZbNWyq/Eh3yWT3WVYf6+HjMi88rq+ZQxQDG8vjypJVmqBbSDjnlK/XVkCTtTzqU
 gYys+LAHhQLmlFXVTjze5U1Nx9he7+Ga2cTQY9xarrm6SgKoBnjUVVI8jchc6YqjmsCM
 3bXuiMBjFCyM5bd9v94BHCvV62SwKyj8Tw+x9ana/zy41/m+nCJ97XrFEG/PlD0hza2d
 ARexqNN+Rd17IAmz5kR/duoh91K0Mk7DL1p7djYraCeNLfZwiKcLgOC4osNodjRjpF22
 6Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756910474; x=1757515274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyiEoT+mfYk4CeGhzX31QR1RtE0qWzCxT6Ooec2Q79Q=;
 b=bSHHFclp6iQEbV33HakEp/zOS+2Ub9xNqMX0vECmjE2zCUJofxuquWcVVvL80Il0pd
 2asvF5FKFAw6KGjlLzvBsLgcEALZ6e2q9pojzYLvWnWObOjvdW7Xsmwzl8fxqGe8hhwN
 xv1dRuMk7W1ElkxxcR/0HngPA4MXpkos77C34ICbXiUL7briv2F5VAXqu/OuiA9jn6DG
 BuoIY1M/Y2nRcZ5GE9APNu1q7QK7Dvcbk82l0rV+vcdtMcvSlnsnspoPcXS0ZFoYeZSX
 VuDAct5Wtbz+2SnmFwcNGC34YAggYiMGBZFSjsld9CG4o9GKUKzGbbRqHn6tsaXiMf/c
 wmlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCQnjRxDCgkn+DS2aa+YPQvcrzToeWnOLhCdMQWuX/dCfWNJtzHTM7eb3iDwp7nBPYG6hUQT8TK207@lists.freedesktop.org,
 AJvYcCWPcNWhX9Q3BUIQgLC6zE/oytxENR7j34cCMDEp46dv7sDOfNS9VLzKpcaGvlVZKnNTxE/BoCmv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1BNuN+cYgkuQ3TB+4bZd383ok7fgERn7e4MG9AH7kZKYIwG3h
 hIgbqCW/8JDDalePs8XWRLiQp1Vv9JM25g4QOJ19LMt7kYP5VUnciSZxyeHzia9Xaogr61ZVgZ4
 K/q+7bIff2hBeI68Fh9uQHkMpqdwWthE=
X-Gm-Gg: ASbGnctyloabfaYDDmKFofWRptxoK2ft0hu7vi9dTOpWukklhr66xc1jQYn6PJoh3Xr
 P9xQ9JqC2XjGkh/Y24/5X8vg83ImRmmFFhPhq4O53XB/AODI+dM145bArcHGk5+qcG/AlXY7PCj
 dK5Fm933GACoH7ciaurojDkpTHseun0QOzkccBr7eqgxMEnfa+LkUagz48KfsOzzeIAQKq8ehnS
 +JPLeLZoM+2IGtxcg==
X-Google-Smtp-Source: AGHT+IEyh3Y9AxDCa/xdhhqWf1YCQxLzXKwd3gIYOmCkWoy3vTgqsxiRKeS/SpQwqq1y1LWALKzKaX246XyCeC9BWrI=
X-Received: by 2002:a05:6102:4b8c:b0:525:53c5:e42c with SMTP id
 ada2fe7eead31-52a333c0215mr2108906137.3.1756910474393; Wed, 03 Sep 2025
 07:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250903122110.389182-1-rongqianfeng@vivo.com>
In-Reply-To: <20250903122110.389182-1-rongqianfeng@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Sep 2025 10:41:01 -0400
X-Gm-Features: Ac12FXzy5Ri8tZm5mbQlpKXXZ-zKYmYlUUy60tQ2sW2evL2L32EL0ptBMza3kj4
Message-ID: <CADnq5_MtZryr=DEuC7o2bKfEsyRi35=Tnw6ZaaoG84bvKRx5Ag@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/ci_dpm: Use int type to store negative error
 codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Wed, Sep 3, 2025 at 8:59=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.com=
> wrote:
>
> Change the 'ret' variable in ci_populate_all_graphic_levels()
> and ci_populate_all_memory_levels() from u32 to int, as it needs to store
> either negative error codes or zero returned by other functions.
>
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but can be confusing.  Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-conversi=
on
> flag is enabled.
>
> No effect on runtime.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_=
dpm.c
> index 7c3a960f486a..1f9f4424055a 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -3238,7 +3238,8 @@ static int ci_populate_all_graphic_levels(struct ra=
deon_device *rdev)
>         u32 level_array_size =3D sizeof(SMU7_Discrete_GraphicsLevel) *
>                 SMU7_MAX_LEVELS_GRAPHICS;
>         SMU7_Discrete_GraphicsLevel *levels =3D pi->smc_state_table.Graph=
icsLevel;
> -       u32 i, ret;
> +       int ret;
> +       u32 i;
>
>         memset(levels, 0, level_array_size);
>
> @@ -3285,7 +3286,8 @@ static int ci_populate_all_memory_levels(struct rad=
eon_device *rdev)
>         u32 level_array_size =3D sizeof(SMU7_Discrete_MemoryLevel) *
>                 SMU7_MAX_LEVELS_MEMORY;
>         SMU7_Discrete_MemoryLevel *levels =3D pi->smc_state_table.MemoryL=
evel;
> -       u32 i, ret;
> +       int ret;
> +       u32 i;
>
>         memset(levels, 0, level_array_size);
>
> --
> 2.34.1
>
