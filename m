Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE7B1A508
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8465610E581;
	Mon,  4 Aug 2025 14:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MMvhJaKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD3A10E562;
 Mon,  4 Aug 2025 14:34:05 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b2700de85d0so408458a12.2; 
 Mon, 04 Aug 2025 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754318045; x=1754922845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThPz4EG6ZmgX+GG9SQyYVrMb+M6NgBy3ZDuWSe5fSmc=;
 b=MMvhJaKyB6pEGXDKn5iggoRVsUiV7L1sWcvrwI3OGd1ssXDh81UFVYCtc0IQBZ6fka
 OauJgaTAbUmodZ6i4WzvLaEGDTWlBixHYIiYfdsP+frtOig2QJj+bOB5fVWxnJLtQXvO
 MN67aOkTZOgCTsbaeKiuTm7Ty7cmFPg9tYn03sK3ZVutvoAcT9x18vKVCLlJ4vODec/2
 cLGuAYM6cjvDEqER8HRGMgnKvHTekU8xy7n8tFmI7o+h7Nds/E3o0KXYNc7jB4hHpYZV
 6cD4/YtwUb8Jn/y+22nvtNI4ZP7Kk+md5vx1uHpcPotWz966r0r4joOCX6VmP/HxaUmD
 9r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754318045; x=1754922845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThPz4EG6ZmgX+GG9SQyYVrMb+M6NgBy3ZDuWSe5fSmc=;
 b=bRjDm3M4z2fZ7OOyNTxT/M/b1YT78i5G0p2g5uEyXvqJEBHltBOmgY15+mqweU3rP0
 HsPJR49NBFx3bWUvCiy/icejhfEEUFYtFAwLtqL/ekyeHY77gGkVe3SocTVsNEtZXeey
 MdStXmrBtb9AoMVHytXvnz3NBJby0yHhfJJcIGWm1VxFbv3Z46SFmexA1/w1xNOEWovT
 6LE8m+suU+Te05yFYAgy3cZl7AG2Kfz3FzE+GohwISBz5pPyeruqWmx66EHHhqr1f7lI
 GLPo5iHHYxmFlrhn9j9oyK9GwetsUWeumg0ZObEHFyNQwjFJRVV8ZDKNV0yTF5wsi36w
 L28w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo6/ZoVbFPFsYLFPuChpC9eJse92WT6WwLxEGHdlF1BmPFbC5g50BM4ODaT8vm+FcWy/QevFAI@lists.freedesktop.org,
 AJvYcCWtKKLgC7HJ38C94D39SgZziVgteLTo8RfS1FkxhcGcne0H0DnsP8Bt2sVQmcyrZQYpj5Jmy1JdGons@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhS0lW91MpAXAupx4ihngNAmkQM8oGiHDfon3mrmH3UU5LedFq
 inc4Jp9Pgv5XM2UmY+51xPpEOBP2IFlgIY7Ub2dYFBB/IFkF5AD0urReog9xNYawSnTlQcrxo8P
 XvS3chRQceDariV0n5To+AArt77XdplI=
X-Gm-Gg: ASbGncvMBbK6nN785Ow9ZiXEKqw6S13oW7O99NmfBJI2pEL7A2NSky+VhR8nfl9AMpF
 NMTTll4lPOMAhUc37O7cgw1B9jL1hOZwuCenT8eUlod7JbICLly36Kb6pBOlLXXxubbkp1xcGFd
 Pi5bvzhF3OECc0LQe2rVsNzwapkc2GOhC2GZiGPL+0JdGXfGtg/Kw8ZeOpjJqmeYD7LdG/xCnwF
 vUuLa5T
X-Google-Smtp-Source: AGHT+IH2SjTWTgUng0xb8MVNI07treE0Rf1uZrlyLZS28ps1VWH5GeUrd451Qm6fRobbn3ai1A5EuPF9RQCs85dAYm4=
X-Received: by 2002:a17:90b:1804:b0:31f:55a7:6504 with SMTP id
 98e67ed59e1d1-321162c71c9mr6274051a91.5.1754318045294; Mon, 04 Aug 2025
 07:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-amdgfxv9-v1-1-0b9670ab5509@ethancedwards.com>
In-Reply-To: <20250801-amdgfxv9-v1-1-0b9670ab5509@ethancedwards.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Aug 2025 10:33:52 -0400
X-Gm-Features: Ac12FXzEWmuF5wDSj54XY1blu563_2bdAIUexGomIzDirrtij04qOUL9B36nQoM
Message-ID: <CADnq5_Nzia7kvqBYxVwnRASFHyWWDPPrA-qBsLH4OxP_S49L5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx9: remove redundant repeated null checks
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Sat, Aug 2, 2025 at 4:33=E2=80=AFAM Ethan Carter Edwards
<ethan@ethancedwards.com> wrote:
>
> The repeated checks on grbm_soft_reset are unnecessary. Remove them.
>

Same comment as the gfx10 patch.  These are necessary.

Alex

> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_0.c
> index 6a9cf3587cc6f0a0d00ab1c109fd599dd8aa2579..a6ff9a137a83a93cde0b0c9c9=
e51db66374bcbee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -4175,19 +4175,17 @@ static int gfx_v9_0_soft_reset(struct amdgpu_ip_b=
lock *ip_block)
>                 /* Disable MEC parsing/prefetching */
>                 gfx_v9_0_cp_compute_enable(adev, false);
>
> -               if (grbm_soft_reset) {
> -                       tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> -                       tmp |=3D grbm_soft_reset;
> -                       dev_info(adev->dev, "GRBM_SOFT_RESET=3D0x%08X\n",=
 tmp);
> -                       WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> -                       tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> -
> -                       udelay(50);
> -
> -                       tmp &=3D ~grbm_soft_reset;
> -                       WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> -                       tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> -               }
> +               tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> +               tmp |=3D grbm_soft_reset;
> +               dev_info(adev->dev, "GRBM_SOFT_RESET=3D0x%08X\n", tmp);
> +               WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> +               tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
> +
> +               udelay(50);
> +
> +               tmp &=3D ~grbm_soft_reset;
> +               WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
> +               tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
>
>                 /* Wait a little for things to settle down */
>                 udelay(50);
>
> ---
> base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
> change-id: 20250801-amdgfxv9-30357749717e
>
> Best regards,
> --
> Ethan Carter Edwards <ethan@ethancedwards.com>
>
