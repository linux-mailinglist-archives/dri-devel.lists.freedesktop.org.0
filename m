Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FCC93B54F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 18:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A503610E753;
	Wed, 24 Jul 2024 16:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NhzVBy3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255BB10E753;
 Wed, 24 Jul 2024 16:53:50 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7035d5eec5aso3455932a34.1; 
 Wed, 24 Jul 2024 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721840029; x=1722444829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvLHGP7NtgU2zYg3eBNSuq3Vab7Pm5T+4+N9Ml7WexE=;
 b=NhzVBy3v0hD0ibfDQuVbo7h+TleY/gHfm28me5OoinfcVap1kARLew/o1EwWfzqg3n
 Cv6Z/4StyspoQa5b7/O9cJ3O5fuKQqrTKxnj6rIX5kRTVxqO/Yo42OZ9TH7o8r6Vb8J+
 lQa14vaK+XRkWRUNqksATQMmBD+0jQpp+Vrl8XZ9UZOdqY7/HTsRuXvykQ8u1rmm9wJd
 mQXiJ/To/WsQ9WPHmMXdxLofPesuwdl6tk8Or4DiQx6XQMd2+aO45WD8v6wrqaoLN6Bp
 +X4cpl3bRxvbZHDnMDGpiDOWb9Gf34ewrRq2/B5130n0QYDa5yRe80Ip0q7cxp9ogPal
 RCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721840029; x=1722444829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvLHGP7NtgU2zYg3eBNSuq3Vab7Pm5T+4+N9Ml7WexE=;
 b=rX5a806Xo7FxkJPKhcV6h46VN1EDFh5fW8aVlwna+dS4ce5VfDgNXMjTGM184vWgJd
 hC69EnLP5ROgpUGKkQf11Qx7W6nQcDw1ABOXiRYbN0ZqV++/JrM1PLl/d7ccvaWOQLun
 dAChOpnu8a3tmMMeKclYPM0TWHz+xedKxG2qljv1CUEYoinl7NQ4YUPkEhiNOClny7Io
 8LRw5b/UQtcVMjkMtGV1S6Wg+8lsbUGZ7zSeaP4mtTwOLIdJ4ngfm5DherT9PghVuYYc
 b5xWu5MYzAm/I0yNnA+sA9bS0DS2hRBm8LcFaGedpmebfYn1smZ9WSViIKhaY03+2ZWx
 ecQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLVrAbcisGtSFxSp5UFl7qmTluW97iVQmZCNmbTbEePGW93WE2BsYDYYyy4lmxtizifEgE0r//5W85YDIXNX5IW4u5BlSYHRCCJm6SgWNNL5lMC0HkrxycQLgI5QfN2SOsNBAiN2lSn0RHqxF6JQ==
X-Gm-Message-State: AOJu0YzQMeeSnoJl3YKP/W1wRMA6rFkg0KHrEhtUeUfAm0Cjz5nf/8rb
 nnfRiYsjTBGG4oNKW7rYqOMEo6hnuIMtYOF+1M32Y5rg7qPJXKBZbdrH7+STNL5ICCzB2hS43XH
 1YAnyiA7vHkVrxHdt3ezcxLRrfWP1tg==
X-Google-Smtp-Source: AGHT+IEbq31zJ8FEqU0AqZdlXaLrABGr5CixketK3hxxAzSb5AIrpBGwPrOVrdCmrACNXxmgFZzx7TDERf/Ody34MtQ=
X-Received: by 2002:a05:6871:811:b0:25e:8509:160e with SMTP id
 586e51a60fabf-264a0c091e5mr163881fac.3.1721840029071; Wed, 24 Jul 2024
 09:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240724-amdgpu-dml2-fix-float-enum-warning-again-v1-1-740e7946f77a@kernel.org>
In-Reply-To: <20240724-amdgpu-dml2-fix-float-enum-warning-again-v1-1-740e7946f77a@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jul 2024 12:53:37 -0400
Message-ID: <CADnq5_ModC1+noYkpBm1bQMT6heE1vLTi+6CdPKPo2DkbagOgg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Reapply 2fde4fdddc1f
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Jerry Zuo <jerry.zuo@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev
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

On Wed, Jul 24, 2024 at 11:50=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Commit 2563391e57b5 ("drm/amd/display: DML2.1 resynchronization") blew
> away the compiler warning fix from commit 2fde4fdddc1f
> ("drm/amd/display: Avoid -Wenum-float-conversion in
> add_margin_and_round_to_dfs_grainularity()"), causing the warning to
> reappear.
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_=
dpmm_dcn4.c:183:58: error: arithmetic between enumeration type 'enum dentis=
t_divider_range' and floating-point type 'double' [-Werror,-Wenum-float-con=
version]
>     183 |         divider =3D (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACT=
OR * (vco_freq_khz / clock_khz));
>         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
>
> Apply the fix again to resolve the warning.
>
> Fixes: 2563391e57b5 ("drm/amd/display: DML2.1 resynchronization")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  .../gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c    =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2=
_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2=
_dpmm_dcn4.c
> index 0021bbaa4b91..f19f6ebaae13 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_d=
cn4.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_d=
cn4.c
> @@ -180,7 +180,7 @@ static bool add_margin_and_round_to_dfs_grainularity(=
double clock_khz, double ma
>
>         clock_khz *=3D 1.0 + margin;
>
> -       divider =3D (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_=
freq_khz / clock_khz));
> +       divider =3D (unsigned int)((int)DFS_DIVIDER_RANGE_SCALE_FACTOR * =
(vco_freq_khz / clock_khz));
>
>         /* we want to floor here to get higher clock than required rather=
 than lower */
>         if (divider < DFS_DIVIDER_RANGE_2_START) {
>
> ---
> base-commit: bd4bea5ab2bda37ddb092a978218c4d9b46927e6
> change-id: 20240724-amdgpu-dml2-fix-float-enum-warning-again-647a33789138
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
