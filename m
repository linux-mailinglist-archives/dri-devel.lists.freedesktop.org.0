Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78693772C9B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BE510E349;
	Mon,  7 Aug 2023 17:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540E010E348;
 Mon,  7 Aug 2023 17:19:18 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1bed90ee8b7so2687170fac.0; 
 Mon, 07 Aug 2023 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428757; x=1692033557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxEiyQxJR+MJn6mnDsJhhgZUCEoHOzUbkjiBn5UslYs=;
 b=CJFPzwNdpeWZ00IiOd46LHzzZB8tpxBsf7PXlc/iWTquMWvh99W6YkZJKzWz8pYp4y
 8+sd9+MYFbLL/5rv2SaeEeIUltjQ1DtiHoiyzjYNQ9qitCHfm2zpHqS87kNUdhXqFC5y
 YuIm9df9AutYhMFPD9fsuxr6SLBJyPj5xRKxzn5ZFV/eqyFT+l/z9nd+f4kWVKaAH00e
 0oTqPkLaiIPVaVDQIRZz+Fu+Jl7n1QEukHK29gavjXstwfImdeN9zKyA9SWhVv4WQtgU
 m35TQvTSHLGniBaWVLf071fYNICYHeWNQ2cZAGAv9rLcFBFbEItVTIBwlfeAtlm6dZ+m
 O4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428757; x=1692033557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxEiyQxJR+MJn6mnDsJhhgZUCEoHOzUbkjiBn5UslYs=;
 b=aQutWjef3w0qwjq0KJcA7zixhgqwyqnnDqO6V3jorjiBmy0cLftROJ+xGY4976mDh9
 O0PlJHOgcNLKxbTae5m3QCDVIoE5DWg4s8UjVl4KWVNQv2hoT4FZA9WTTIU6XfhjkjTy
 +Qva/lDwzlqUsGwwd6ZRIlpSNVqPZ2NEMGLyqHq3ee7Y5+Pmj+bgea2QP5Z0/KqMl/lX
 nfnbqtmNH4GLHB1pyaG+gAqHQ7IbMS6gQEVsrpjLxx/gEndg/puyVpwzBM+oyyTgBF7s
 JrBLlit2suIRDydIv7YB085nWVOK7c2dHJtv/4QxKJlfd1pB61Wi7OPg+64jKN8wNaEO
 PCfQ==
X-Gm-Message-State: AOJu0YzeWs12VRiLjjGxYL1Woh+JM5rJhNmiJGKQkUoyEZM1V7BjqoAM
 VPqTo9e6dGzfl14hJZ6kc8fC+bfc6k/wbS4+zs4=
X-Google-Smtp-Source: AGHT+IE3xOaBqhnOeAxi1epTXhzLf4kTnq1R2FU9Q8JoPuQt/opYkvKf7wmsBzImz5m6YitBN8F7A1a9PCUQ1DBl3kE=
X-Received: by 2002:a05:6871:151:b0:1ad:2b76:c3 with SMTP id
 z17-20020a056871015100b001ad2b7600c3mr9537798oab.39.1691428757637; Mon, 07
 Aug 2023 10:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230802064822.12093-1-sunran001@208suo.com>
In-Reply-To: <20230802064822.12093-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:19:06 -0400
Message-ID: <CADnq5_N_bSFmRtA-FuSCOUZo=+KijbPZ9w-OD37D=SPF9XZJSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in mmhub_v9_4.c
To: Ran Sun <sunran001@208suo.com>
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

On Wed, Aug 2, 2023 at 2:48=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: code indent should use tabs where possible
> ERROR: space required before the open parenthesis '('
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/am=
d/amdgpu/mmhub_v9_4.c
> index e790f890aec6..5718e4d40e66 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
> @@ -108,7 +108,7 @@ static void mmhub_v9_4_setup_vm_pt_regs(struct amdgpu=
_device *adev, uint32_t vmi
>  }
>
>  static void mmhub_v9_4_init_system_aperture_regs(struct amdgpu_device *a=
dev,
> -                                                int hubid)
> +                                               int hubid)
>  {
>         uint64_t value;
>         uint32_t tmp;
> @@ -1568,7 +1568,7 @@ static int mmhub_v9_4_get_ras_error_count(struct am=
dgpu_device *adev,
>         uint32_t sec_cnt, ded_cnt;
>
>         for (i =3D 0; i < ARRAY_SIZE(mmhub_v9_4_ras_fields); i++) {
> -               if(mmhub_v9_4_ras_fields[i].reg_offset !=3D reg->reg_offs=
et)
> +               if (mmhub_v9_4_ras_fields[i].reg_offset !=3D reg->reg_off=
set)
>                         continue;
>
>                 sec_cnt =3D (value &
> --
> 2.17.1
>
