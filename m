Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B99482B7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131B910E2A6;
	Mon,  5 Aug 2024 19:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nl04Fh6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C1F10E2A1;
 Mon,  5 Aug 2024 19:56:39 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7bb75419123so759438a12.3; 
 Mon, 05 Aug 2024 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722887798; x=1723492598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNcOQYN/qSiGTFD6/GPizmaarPQsywctbGl3IsVIKsA=;
 b=Nl04Fh6JNN5qnFqpnxpOglpq/8wGRav2JE4eOPJJwh7b4hZ2TcFjpeiqXzJvMCy8sD
 iBK0uBS6a8Tx5lYNvpE4zpQ36Ph40Nn3PyNtxcVZxuIB9QpMxqmWfnK/njoEoAbUfkRn
 vLEdTgS4YXyNv7dzZag+zuiPO9VYDkUCxRjzDTnISr3RqIMAwtFzojbISC89nzDDLsSF
 wlc+kgFq/Ir6n7vcAAu1lecG+KLlSy9nWi8K/SlNquVCKWUGyvlSVIKytlqQ4mAjpQlg
 C/OgbU4yHuLskdD175Z7l9DyBqjVLq8mz6hYvclyO63sCCFOiCe+BRczlyTrTSV/O1cs
 k7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722887798; x=1723492598;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNcOQYN/qSiGTFD6/GPizmaarPQsywctbGl3IsVIKsA=;
 b=mJz28zbDkNmD3GUwBm/tqK8ShOfa4jzThxNPpFb9UuNkD+XX+wjfVwwBdfszW+HiDk
 eAFhtdOigq4VxrjKkcHRTJXU6uJntD2nGrKGO8w/qABTdw2mmY6PwIBmSUxUdwJfc/Cd
 oYZd6Y+3IQznQRuVYMiA/ZjAE00i47nJ45/lYdFxjCkbKZn4FhCoF3JEB/N1vU1uuVSG
 hj4/TCPlb1e03q7wEYSoh9qwVsahv43B0pbf0y371LZ2iHLVX/f7nZiQmEXeQyaGXQFO
 dzULgy3tpu1vRKDlfCGypHb4QpICMNFSAeYsmoQHv1OKffi8UyIIrNoMO78r859X7nlZ
 VyIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXey2jsRJOOfJcWATWRQQxk5STeVlqv2vmEN2R2XKTaOzkM2tiUL1JgXfliydN8Z3P2yvxJVJojrVttmJDuyjzesF+HAgS/q4d6IIYB3k/gsNG61PAsU94kCXl8Rnc0lr4FUv/1KJGiPLy6hTuXvA==
X-Gm-Message-State: AOJu0YxwsTwWCo3CT51Vf8EaemJ/mBFKlrQZdRpu94GKQx+RVhN2LltS
 e0nw/WUzRb43U1b7ZXQ2YodCrugKsjuQmc9WHn3dgsn4uw5vkHltBN1JviEbAoGUw1ro7AXUbkl
 kEUT1trqrrV/EzA4fvrUZhNQkVSLbtg==
X-Google-Smtp-Source: AGHT+IFIDXUzuaYtUVe9G/vyHgglOXHWrm+LPeM+thU3L+PG1J1Qc3F0nt0E/Bj+1GmCud756KHGJwrkq+K3mv6bPqQ=
X-Received: by 2002:a17:90a:ac8:b0:2cb:4c32:a7e4 with SMTP id
 98e67ed59e1d1-2cff943c2fbmr10837771a91.15.1722887798611; Mon, 05 Aug 2024
 12:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240731055451.15467-1-rbrasga@uci.edu>
In-Reply-To: <20240731055451.15467-1-rbrasga@uci.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 15:56:27 -0400
Message-ID: <CADnq5_PxBDtk5m7c6pJX_b1fQw_ry1qGALprAZ6f5xR=9g34kQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/uvd4: fix mask and shift definitions
To: Remington Brasga <rbrasga@uci.edu>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, Jul 31, 2024 at 3:20=E2=80=AFAM Remington Brasga <rbrasga@uci.edu> =
wrote:
>
> A few define's are listed twice with different, incorrect values.
> This fix sets them appropriately.
>
> Signed-off-by: Remington Brasga <rbrasga@uci.edu>
> ---
> The second UVD_LMI_CTRL__RFU_MASK is incorrect, so it was removed. It sho=
uld be
> `0xf800 0000`.
> The first UVD_LMI_CTRL__RFU__SHIFT is incorrect, so it was removed.
> It should bei `0x1a`.
>
> This change aligns the uvd definitions, please refer to:
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_3_1_sh_mask.h
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_2_sh_mask.h
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_5_0_sh_mask.h
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_6_0_sh_mask.h
>
>  drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h b=
/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
> index 8ee3149df5b7..2ef1273e65ab 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
> @@ -340,8 +340,6 @@
>  #define UVD_LMI_CTRL__REQ_MODE_MASK 0x00000200L
>  #define UVD_LMI_CTRL__REQ_MODE__SHIFT 0x00000009
>  #define UVD_LMI_CTRL__RFU_MASK 0xf8000000L
> -#define UVD_LMI_CTRL__RFU_MASK 0xfc000000L
> -#define UVD_LMI_CTRL__RFU__SHIFT 0x0000001a
>  #define UVD_LMI_CTRL__RFU__SHIFT 0x0000001b
>  #define UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK 0x00200000L
>  #define UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN__SHIFT 0x00000015
> --
> 2.34.1
>
