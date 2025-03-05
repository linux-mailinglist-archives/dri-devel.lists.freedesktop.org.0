Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D744EA50A36
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 19:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48368896E9;
	Wed,  5 Mar 2025 18:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ihCUd34L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CB6896E9;
 Wed,  5 Mar 2025 18:48:33 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ff5f2c5924so85799a91.2; 
 Wed, 05 Mar 2025 10:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741200513; x=1741805313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLW0d7wXv47ixRls1JtfTqesQTLc2Su7rB4a8OZt/Z4=;
 b=ihCUd34L5P70F42Pyn4aDB/AbP/AFJfNDBm4qcmQAqeQ3knEiwAtD7hpLiAe/tiQiY
 BYGsuAshLSnR65nWKoy3UL//Ndl2KoB+4TNvJlrUPPeQF+o0G4oXt7Z5y3rA+6kJb2cc
 rozrlTe+p6ymLXeMW4WGoUK9H5E/28NtTe5v/HSC9T78goyncjTJazTdm/7qR/nnAQlN
 tAaGqr+vOugQdpZUWsWyGwvY3OQZMkwveYGzGasTjuD+0B0YII62oW2dllxn4HbGqevg
 nB9o5Yq/eF+c5ddlmCcnfwLRycCOqJcF7lw3/KmgNZfyGjbfm7B09f8jHPZdE/txQKzc
 pahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741200513; x=1741805313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLW0d7wXv47ixRls1JtfTqesQTLc2Su7rB4a8OZt/Z4=;
 b=W7LyoONKz7bitknrqcnRgTlrkNZERGmG44/X7ShBMPqlvbYoxwY3gmQPqEmbPhKt3s
 Kt4GIangxzj6L7n50IIUHq+2ujp2KpZc7GF6sXCnCe+cIvNrPLzWdbrDgDHoFZwS18Zi
 xfj4B1A9Wgke/jakjFkpw3L/2t7GaPX3xg6e1T4U46+Q1aqv3bbubnDnKl71EYeNg9Ku
 UCxM8KmzG/+NQfrLKpeZPBLAilmJMBk4M97BT/MW/eOyc/lmnAxLX6n9HoxKS5fYog+Z
 brVV6rgffYWtS59ed9mtAAe0BZkyUKXM1pvqc1gCgS1ZkrMOKsh6Lojwagj2xO8kknZA
 2sXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8yxMUDqSo6d7tBjWVeCJ9GDWzrWdz9v2PRBjDFpG1UsAp1PGWJEjKlZvnIiyJeAPPBYeKfCTDzRTj@lists.freedesktop.org,
 AJvYcCVcd5ijmvLT2AHpuf7p9TRD0w8BpQs+Uay5bWNgM6PsWfI9Y9ILT1P+AN3uiBK9xDcqLrl8uDRj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyudy3PCDf73iQLRZwDMa3wk/+dRq6GgIEiFCIqPxoE//irTPGf
 Q8YYzZVQnGMCQLn+xF/jfizQTAxVASa3dazm2ZuMxK3VMSjd+cHobSjtkbuG4KFHO+zgm4FpZmf
 i+8bDI9ECn64JoBza+wHwac3K3uk=
X-Gm-Gg: ASbGncvLGOL01Y3qVcPhMq8VnnS09ZooqQvokQI9DHvFx2gxvaklge/KNmNdJweqOpq
 lyFD2nCYIPCmNYjO5sFV8FoRQ3i8GG6yajnlt7eGITmmCdf+kl1Y7oyqfbgavWsoFjQFQSnPFPk
 h9y4VE3Dqnwv/mWLJ5d6SUSqwwwQ==
X-Google-Smtp-Source: AGHT+IHNy0Uh0i/4Vrewjh6yuoSTfhZDAoTT3pE5NxHvmoBeQzOjLRKXO8Aq7wY5/pRC2taKbqHofwdvOoPmBHTX1JE=
X-Received: by 2002:a17:90b:568b:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-2ff4be6c73amr2014043a91.7.1741200512864; Wed, 05 Mar 2025
 10:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20250305104057.3416-1-hanchunchao@inspur.com>
In-Reply-To: <20250305104057.3416-1-hanchunchao@inspur.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Mar 2025 13:48:21 -0500
X-Gm-Features: AQ5f1Jroiidha8Du4iLEC0d4NUHuwmGgvoqBM2eAEDIOIX64Uk9J5X65ktxjK1w
Message-ID: <CADnq5_MveLhZFX0qjp5=RsK1FV5n1jM13giX3BA4Lz3vXvsVKA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix inconsistent indenting warning
To: Charles Han <hanchunchao@inspur.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, Jesse.zhang@amd.com, Hawking.Zhang@amd.com, 
 mario.limonciello@amd.com, tim.huang@amd.com, Likun.Gao@amd.com, 
 kevinyang.wang@amd.com, dan.carpenter@linaro.org, 
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

Applied.  Thanks!

Alex

On Wed, Mar 5, 2025 at 5:41=E2=80=AFAM Charles Han <hanchunchao@inspur.com>=
 wrote:
>
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:582 amdgpu_sdma_reset_engine() w=
arn: inconsistent indenting
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sdma.c
> index 42a7b86e41c3..1037a2f9e3b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> @@ -579,5 +579,5 @@ int amdgpu_sdma_reset_engine(struct amdgpu_device *ad=
ev, uint32_t instance_id, b
>         if (suspend_user_queues)
>                 amdgpu_amdkfd_resume(adev, false);
>
> -       return ret;
> +       return ret;
>  }
> --
> 2.43.0
>
