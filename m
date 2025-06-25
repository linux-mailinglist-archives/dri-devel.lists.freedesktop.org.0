Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0315AE88FB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7C910E11D;
	Wed, 25 Jun 2025 15:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eg+33Fey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36EB10E050;
 Wed, 25 Jun 2025 15:59:53 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-313336f8438so1027284a91.0; 
 Wed, 25 Jun 2025 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750867193; x=1751471993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+v2S/Kr4IAe9nDhUjRoLqot9qoZr4r/hGrWQ5tIcEsU=;
 b=Eg+33Fey8jaqI743kSi2G30M9bd+FRBxkkFokYktEr+hkHV4xekZnj04m50hELIeO+
 1yQW61j0pvNAjn9OdCb9dhl4p8ikFjbfLB58kuW5BJqZUqmxFYCdeaD4aDT5XfzdPIwH
 W/p5AHwImwOj61jwwRtxFTw4GC2AZskRrxL8RyQiNOydxlYHS77BW/3rKZnmRiK7ND21
 XVsxMTjH0wgazLCEq3rF7MpTlVTwdO9CnyXfu28AbEZhb8lQaOJ4xFXQPPXsunYvRM50
 FOkCxbt44aPd4NhVAILDvbpVMz1C5mNj+6S4JIysjlR9t6tfYXd1MHr1kjOQAVqaF1Rr
 G/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750867193; x=1751471993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+v2S/Kr4IAe9nDhUjRoLqot9qoZr4r/hGrWQ5tIcEsU=;
 b=EzUTFiZUTl0/3V2hOHEqAq/C9ASaypkp2bGfDT6zszomVbHM7H7vf+xChYGDaGXO9k
 U4HIIIgGo/MqytP+ri8IStnqgsGSqMGUJmZSQjUuWQRNuVNiOhxPT06wWbMoYsIx5boM
 M/tuy6TG7iVx3+fPPrMRtNMt3srxePyvIcu+gSg5oFdHc/A0XoV16UviKz+lN8F4h6xm
 YpjgnLGcWk9+qE9cZfUIszW/4zIyQV0lNy39ZmK2hEWd8WJ4bXfJEoKNzGUfJowtvBJm
 eOQsBUOvVV/Q3bPJhtwJddY4wdH6YYVOyYqCucD8t2BrbssisWcI2nvBNePxMFRwTv2G
 WGSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKcs27OMSZ1JMRYctTukplP3duhQ4kBHUzFG7FitZFtNVbrx5BE9285hB5aXj1Xz59180zTHSz30WJ@lists.freedesktop.org,
 AJvYcCWYopEXqUkMVviYEZw2IFRCzGMh0BDNF3XvrAgmi9ZMphH0ja5DF8W/ks/WkFH8fuGw2DPuOxNn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3p3fbO1bWD4kvW+hVTVP236w4lL/XToIqHuhiddKwdoiYMVyK
 deGkS7uK8MU9iMDG5C9XIDvCUyfMpreNYJR7rLfiwozMZRyFFT6b4lG4kC9N6dB0yn90aohtzw3
 Bw3GbxQTJ9sTbOMIABdbrcGxkK6A4tt8=
X-Gm-Gg: ASbGncsCPsumoy+h6FuEnK8qoDKjTblJA9CDn27JiynZXpUp3/g/GTjlOUMo9t4sTGo
 HXuwBzBusFR4uzeVlwvRz08GDnKOkNw+EKlzWHnVEQBAgZ6IWnZ8ixJP/Iig1s3oUgHnJj5cg2t
 vNkKLHWyz3wZFG/fTCqyxkTfy2vrSNt1GxXwxActsnxxB6
X-Google-Smtp-Source: AGHT+IFuT6Y2MPqukrRAc3faj2hOL8dGkyYsm1wkR1IX3QKkXPPSkzl7kk1IEFDhWlgxsK9U2auW/7vp0nqRH71ZfPU=
X-Received: by 2002:a17:90b:5484:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-315f2614bedmr1762758a91.1.1750867193468; Wed, 25 Jun 2025
 08:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <5827884c-f269-4e38-8202-2a3fce280ae3@sabinyo.mountain>
In-Reply-To: <5827884c-f269-4e38-8202-2a3fce280ae3@sabinyo.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 11:59:42 -0400
X-Gm-Features: AX0GCFsNtKODTPbjTsMx_0S5wUfauBMFZ6j-k85_DmOyWLCatMSUe3VcamgaBGk
Message-ID: <CADnq5_P1i=GXfmbK4n44UWCLvoyQiwW4UPJFz+Mx4BHqmUbzrg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: indent an if statement
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Min <Frank.Min@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mario Limonciello <mario.limonciello@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Samuel Zhang <guoqing.zhang@amd.com>, 
 Asad Kamal <asad.kamal@amd.com>, Ying Li <yingli12@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, 
 Pratap Nirujogi <pratap.nirujogi@amd.com>, amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Wed, Jun 25, 2025 at 11:38=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> The "return true;" line wasn't indented.  Also checkpatch likes when
> we align the && conditions.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ucode.c
> index d777c049747e..a0b50a8ac9c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -1400,8 +1400,8 @@ bool amdgpu_is_kicker_fw(struct amdgpu_device *adev=
)
>
>         for (i =3D 0; i < ARRAY_SIZE(kicker_device_list); i++) {
>                 if (adev->pdev->device =3D=3D kicker_device_list[i].devic=
e &&
> -                       adev->pdev->revision =3D=3D kicker_device_list[i]=
.revision)
> -               return true;
> +                   adev->pdev->revision =3D=3D kicker_device_list[i].rev=
ision)
> +                       return true;
>         }
>
>         return false;
> --
> 2.47.2
>
