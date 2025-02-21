Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A936A3F7DD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 15:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3A410EA80;
	Fri, 21 Feb 2025 14:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b9RtikKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9828710EA80;
 Fri, 21 Feb 2025 14:59:11 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fc8482c62dso531507a91.3; 
 Fri, 21 Feb 2025 06:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740149951; x=1740754751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGuEcGyCvXU1PZ8BK+/owth/b57IvpYwbhJHbR1V5MM=;
 b=b9RtikKLtNnVaIR2EXygAKbJVoCMLgQbjFq74xFgElcCMwFVP/yYEMFRTXppUWTmbK
 xX4DjShOjmNd+JEoR+WbafOzlXCQPOoQlqc4itn29SR7ojD7q+edVwGdRMUtbKlpcnD/
 icL/W4g+Fy2MrLba3TvJ1XO2Kr51pTOLo5fmImPkDe8lXDgrWVwDRvcmV+RKSSowYObm
 hjUl9g7oPHwFzuiRXb6BicszCUukW3JXxpQuL9AzVAQIZy6hVHCcX3/hpfiwkc3snFrb
 3MKm6A+dsXWWPhetXexe5w/CbD5kAblvj+Gc6iWRIM8rpF6C7/xwDgrYQ8dtBXdEiqSG
 CqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740149951; x=1740754751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGuEcGyCvXU1PZ8BK+/owth/b57IvpYwbhJHbR1V5MM=;
 b=xAWjVQn8g9SI0BPyJIYg77nSYXkxR3fuane0NODIV5DYSM25K5sF5B2u3LJ1ab7ymU
 GYYd1Gv3UAU2fRVqHsU0VpfhRDlyLdHi7iyavQPB8VbXZHT3eAeXkMfYAsfkFYqxUiL2
 cxb3G+mG+gC2lpvmC98THVbAxCc6rvCOgbc9L1asXuErc8CDNjBgFILNPeo++g11EKyP
 v+3s3MOyUXStutSr0hndxzpnYC6aS1M6ecvTtvDJv7h1Xm06On6dKwUBg1Xu4TI/i9ET
 qjLxwW23a6othAdlsS09uMO4RgmonaEjWcaDmVSbY+f4FTlnfIavMiIRn5mTTDXqTleE
 9ggQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOx0PDUz+jr8RTyoY+Yx3/Twef5Zk8nGJKkodg3cS2LFFQdSqezPbevzNH4ItPu6bWxBj6hJCk@lists.freedesktop.org,
 AJvYcCVef+dAJ24xzLVsLrIZDjaAzkvwZ0yk99CpAKr9GWdLGDViDzFvfBhBlHMSXaeyDr2KycyswlR9dA2D@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAzWoI/Lt8we3eI94ApWzxMeFt7o7pDZay4m8PRz6MSNr6f0VI
 w82V81MJMIl2D4NuQOYpXxHUqLygHJ/ZS66c/r/Cgkef4Rn8aoEBbjhjPublyMUYUJ+6ymXADrz
 Wb6zzUOYEdlZC0be+amRDAYl1Y1wZpQ==
X-Gm-Gg: ASbGnct4WDbZy1mGiNi+/0nNvZ1iLulXJxYD+2XZnybqizU9t/R5WtRUHGrCoBgXYlH
 pfcLh+YjVyoH32Jy3HpB5+7NHEmIDUKrTz5PYv0JaTq49Eak8wCEILK1rvDbsgA+OgaMbGaSlf8
 6wx1wk+cU=
X-Google-Smtp-Source: AGHT+IEllMkZI2e2wCc2Ox1K7sQtQj2/KK+wR8W2901yorQqSGwxmp2E+h3TQJAdmzusA0aUyoy57pRZTVLxCkJYH5w=
X-Received: by 2002:a17:90b:4c04:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2fce76a2781mr2322720a91.1.1740149951042; Fri, 21 Feb 2025
 06:59:11 -0800 (PST)
MIME-Version: 1.0
References: <20250220162750.343139-1-andrealmeid@igalia.com>
 <20250220162750.343139-2-andrealmeid@igalia.com>
In-Reply-To: <20250220162750.343139-2-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Feb 2025 09:58:59 -0500
X-Gm-Features: AWEUYZkDQigRBbUEBbX-bkqBNmeQ0_LINBwN_MO09AozMdl7LIZ_Ar3wfltdwSY
Message-ID: <CADnq5_P_+QCeAnxZzf_N6+EgzLM9iUs-XxDaoNYkEzJAO26UGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/amdgpu: Log the creation of a coredump file
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, siqueira@igalia.com
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

Applied, thanks!

Alex

On Thu, Feb 20, 2025 at 11:28=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@ig=
alia.com> wrote:
>
> After a GPU reset happens, the driver creates a coredump file. However,
> the user might not be aware of it. Log the file creation the user can
> find more information about the device and add the file to bug reports.
> This is similar to what the xe driver does.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 824f9da5b6ce..7b50741dc097 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -364,5 +364,9 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool=
 skip_vram_check,
>
>         dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
>                       amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +
> +       drm_info(dev, "AMDGPU device coredump file has been created\n");
> +       drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredum=
p/data\n",
> +                dev->primary->index);
>  }
>  #endif
> --
> 2.48.1
>
