Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4EAC96F5
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 23:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2707E10E88F;
	Fri, 30 May 2025 21:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a4xjJ2Nm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7573A10E88F;
 Fri, 30 May 2025 21:17:28 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2322d8316f6so3321375ad.3; 
 Fri, 30 May 2025 14:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748639848; x=1749244648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaflX9LJXzWlm3lpCgATG+sa4+dMghEczWFwcXZldgU=;
 b=a4xjJ2NmPL773dFt8cGXnGjSHdQ3pzfr99XPBxoC5eR//U/G4DQV0qsjyZabvkTC93
 CHDMLLiQM8BDJebzNOt+G6C2TI2fUQMT0PsrbYNtjTZAEdyBx9iEri53cPmRG7KDwZUM
 HU153PE95Ejq6EpyFAYkAByD6ltjnFBreEHPbGErpPWn8cH6OxlnZeQyOT2YDZh4nIes
 HlifwKHbd8hxXf/mauMmX+oGb8RTQEvoJlHAl4slMWjKmoy7tCLi5SjzwdAl5dn+ZHBB
 gXT0614+CQxNGPxBkNRlZu//PMP7KPSufK7ISLPO9ozGtDaE0Cp4Jc6cIamq6Hnl1Yt6
 Oz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748639848; x=1749244648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaflX9LJXzWlm3lpCgATG+sa4+dMghEczWFwcXZldgU=;
 b=bNC2YE84HHJkLjy1Qdw3cRO33Wf7+oRcdF829o54ZxC4/iX0jDUIvDQU9Y9bzn+rDw
 bYLjmox4VYFBchFSqaePgPVeK5fJtjUGYtYKKkHpH0Yw9Ylb3LxCRRZxYc30ZVAhl3Gz
 hNoGahud1/WY4+mZ0dSjAnZngGDTFmYJGbTI74GgN2Vy3YiJpVM12P22EsKOoXcrGbtf
 kwF+tC2ombOA7A3t2i5SAhZEm4qsjCDkMDxIU52IiMilyyArfpB0Z7cyrw8VuWa+QLtk
 j9R33B4Aq6U9FXsIr67NCUGinbagiEFFaTlSXbadPJR5slHUff2ssYRbJJXQNttOMHOI
 RcMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPfQCDeM65CUi9y2pewUU+dDxH1Zka+AKnnKxZ0ek4XqQCUqK+crrQIvZm3YN8Emh3NhYV52o17cUk@lists.freedesktop.org,
 AJvYcCXZjnSyvH6+/biiFqL9iOGZwmXUM5KvqUk+44Zwd4zMPoiTJ1+iklJuMELJ4cKn4cgS+LLyx/jK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE0moL1l7VSHgHUin0t3gKwgb59GlgrglI5wvVlBfk713P9Pqr
 fu8Ap0xcTitKHrXWqCRm1/XdwJe5f9BS2wFHxWnMRMP7LkYn70CAl5i1psaJHg+ViAzZ6YCpK1C
 G2HS3Vn2+YQJmtBhDtEqwy3NMOvimzec=
X-Gm-Gg: ASbGncukTvk1l5vvdPCSz+94/Q1N/pJvcl87q++oO6Oa+HmggcxBDnoNzPxwTXjPzlf
 dDAB3Omp8dEfndtNftZp825HGYNMbtTZaQzaTk1AXkhkBLCbtYePXiUxl76gN/Sxee7Y8mRfqlX
 lnmv8lO2BIszfWKQ61Z/zTLul9v54kk8QUUg==
X-Google-Smtp-Source: AGHT+IECt7Rhv1kBz/qhY52yGtnM/bwE3kNoe3ZrT2BLx0pNDo8VmJvvCSgdO27lsl/S1qo5VpuNwDSQ6ibXFmHiPW8=
X-Received: by 2002:a17:90b:1a8f:b0:312:1dc9:9f5c with SMTP id
 98e67ed59e1d1-3124db0a69dmr2048172a91.4.1748639847971; Fri, 30 May 2025
 14:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250524055546.1001268-1-sdl@nppct.ru>
In-Reply-To: <20250524055546.1001268-1-sdl@nppct.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 May 2025 17:17:16 -0400
X-Gm-Features: AX0GCFtMHSWMn3a0e0OChFwtmZR4ehBBbTKc_CIkgLIbeEVdaBFk4XUBXRAPGEY
Message-ID: <CADnq5_MyV_C-XJCQEiXKLQhhEGErq7SnvhqFE1AauQPJvt5aYw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix NULL dereference in gfx_v9_0_kcq() and
 kiq_init_queue()
To: Alexey Nepomnyashih <sdl@nppct.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jiadong Zhu <Jiadong.Zhu@amd.com>, 
 Yang Wang <kevinyang.wang@amd.com>, Prike Liang <Prike.Liang@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
 stable@vger.kernel.org
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

On Sat, May 24, 2025 at 2:14=E2=80=AFAM Alexey Nepomnyashih <sdl@nppct.ru> =
wrote:
>
> A potential NULL pointer dereference may occur when accessing
> tmp_mqd->cp_hqd_pq_control without verifying that tmp_mqd is non-NULL.
> This may happen if mqd_backup[mqd_idx] is unexpectedly NULL.
>
> Although a NULL check for mqd_backup[mqd_idx] existed previously, it was
> moved to a position after the dereference in a recent commit, which
> renders it ineffective.

I don't think it's possible for mqd_backup to be NULL at this point.
We would have failed earlier in init if the mqd backup allocation
failed.

Alex

>
> Add an explicit NULL check for tmp_mqd before dereferencing its members.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Cc: stable@vger.kernel.org # v5.13+
> Fixes: a330b52a9e59 ("drm/amdgpu: Init the cp MQD if it's not be initiali=
zed before")
> Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_0.c
> index d7db4cb907ae..134cab16a00d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -3817,10 +3817,9 @@ static int gfx_v9_0_kiq_init_queue(struct amdgpu_r=
ing *ring)
>          * check mqd->cp_hqd_pq_control since this value should not be 0
>          */
>         tmp_mqd =3D (struct v9_mqd *)adev->gfx.kiq[0].mqd_backup;
> -       if (amdgpu_in_reset(adev) && tmp_mqd->cp_hqd_pq_control){
> +       if (amdgpu_in_reset(adev) && tmp_mqd && tmp_mqd->cp_hqd_pq_contro=
l) {
>                 /* for GPU_RESET case , reset MQD to a clean status */
> -               if (adev->gfx.kiq[0].mqd_backup)
> -                       memcpy(mqd, adev->gfx.kiq[0].mqd_backup, sizeof(s=
truct v9_mqd_allocation));
> +               memcpy(mqd, adev->gfx.kiq[0].mqd_backup, sizeof(struct v9=
_mqd_allocation));
>
>                 /* reset ring buffer */
>                 ring->wptr =3D 0;
> @@ -3863,7 +3862,7 @@ static int gfx_v9_0_kcq_init_queue(struct amdgpu_ri=
ng *ring, bool restore)
>          */
>         tmp_mqd =3D (struct v9_mqd *)adev->gfx.mec.mqd_backup[mqd_idx];
>
> -       if (!restore && (!tmp_mqd->cp_hqd_pq_control ||
> +       if (!restore && tmp_mqd && (!tmp_mqd->cp_hqd_pq_control ||
>             (!amdgpu_in_reset(adev) && !adev->in_suspend))) {
>                 memset((void *)mqd, 0, sizeof(struct v9_mqd_allocation));
>                 ((struct v9_mqd_allocation *)mqd)->dynamic_cu_mask =3D 0x=
FFFFFFFF;
> @@ -3874,8 +3873,7 @@ static int gfx_v9_0_kcq_init_queue(struct amdgpu_ri=
ng *ring, bool restore)
>                 soc15_grbm_select(adev, 0, 0, 0, 0, 0);
>                 mutex_unlock(&adev->srbm_mutex);
>
> -               if (adev->gfx.mec.mqd_backup[mqd_idx])
> -                       memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, si=
zeof(struct v9_mqd_allocation));
> +               memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, sizeof(str=
uct v9_mqd_allocation));
>         } else {
>                 /* restore MQD to a clean status */
>                 if (adev->gfx.mec.mqd_backup[mqd_idx])
> --
> 2.43.0
>
