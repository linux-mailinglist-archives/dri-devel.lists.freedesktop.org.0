Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED71AA4E45
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6C310E7A7;
	Wed, 30 Apr 2025 14:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H0bBQuyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935110E310;
 Wed, 30 Apr 2025 14:17:11 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2ff73032ac0so816925a91.3; 
 Wed, 30 Apr 2025 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746022631; x=1746627431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WSlVXVVMvz31qCvWMPBMvG74WqaN+y9IYmd4m+IHQyY=;
 b=H0bBQuyNjtyVA++vtdWbHrzUUXcW6zlgihZFrZmGM6WnkCBkjq5CeuvNomHJ3xR6CH
 KHynU9zlZWewPraqWp/qibtIPrC3N7XK1y9vqR2FgxGSniRfaAoKS6FN/vEZfrP2HjyA
 EpiCq+bkg38ghoTIKolJnhhj+jSbyYcmM6PGrryq9TyadGMwH2m5fvbsfhMHxANdRQVV
 Wt9Znt1nBABOEplvUEz95L5mzSmkFJh5UQtcK6e6zL47F5bJVXeGBrkXbNUM3T1U/Le3
 RM4OEfS7UY1ZpSXYTnMcSh7E+bnXLpMGizF3tjI8kxwj+PVDNRceH1EMuMUiuKti3KQg
 aUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746022631; x=1746627431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WSlVXVVMvz31qCvWMPBMvG74WqaN+y9IYmd4m+IHQyY=;
 b=VsvZJrYvWcTy3jIrBtzidtUDyt7TyMe09DUZM0ZbAPDiO7y6kOlX/f8W7l2O/B4FVO
 jm7llY2UdvKV0MqyesbJZz4+dZp6tg0bs4d479umcKtRNAJ2CV3b4GN6zmDvcPT3J956
 7SlyLm3rVE2/igAui70eYm18kZb4IAgY1TqJfjQPyXgAAks75ETMjgL8NP2xszoXuPLx
 dK439pegtz4Y02Ooztrd9Ome5Vns5626dTXm2OXwIrOp/Tqzd2CapRolVXy9flW5rwQR
 tz4/z5zUCgD5148xkipNTd7L59gnm9A5cRJ71/A0pSOe6pZMzPj+pIHRrthISgTaOUAQ
 +1yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUBBqqg4N68g45qFa8Y+ortO0erjxJx5CF1AkJXPf0B8AohFfy86s8KVpY/8xKJum+mND7oy9X@lists.freedesktop.org,
 AJvYcCWBPBVwZRFRjZhz7aYrFn+UpO2u8eBAYNNkAcUUsTl4ureR394l1I9kd/7VildG5VB1WAY7vMlLTXhs@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4tXNdzqij7aCT/2yPbFZlaY/QZviegDhZN96nZuvEqwkn2fDj
 Bj1UH3ApPw33j5J8OTcGkJRsXfVSRg9xgJolg6POvIxuAovS3BToA9u0NuriUTZwdls9kikAN2p
 2WlraN4pZMaWNNJ1a6XttHBZLqhM=
X-Gm-Gg: ASbGncuXzZ5z3aazz2SN75v0m9yzvE1MJK8nkt0s9ndl8JQEiXOQdHRySfHoc+0z7cZ
 nzSw0ng4muGyqDPkr0oX96sPNzPwI01qKkvh5tfQyDE8NCuzDS25RqRfZjJGEMtvCYrOlIY+zAp
 xCdIZVEFCvFlQUF4gn1Ryi2EZmvs+VQ7kW
X-Google-Smtp-Source: AGHT+IEsfJs4pvbYzJLHEbrtPsBpdHlb9L4LbI8uQIA2ApHhlUqkt00XJv91Tvsb80npmYzja/ty8yI1I+/ccdOAIK0=
X-Received: by 2002:a17:90b:4b8c:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-30a34a77995mr1572249a91.4.1746022630946; Wed, 30 Apr 2025
 07:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <aBHY1IPONYHyybrf@stanley.mountain>
In-Reply-To: <aBHY1IPONYHyybrf@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 10:16:59 -0400
X-Gm-Features: ATxdqUFaSbipfJtE5jKOtwie3btM5g0OcKmN5NYnJ-guEp-HRyAs3L7vBIggiks
Message-ID: <CADnq5_OTeCQ3v5xQP1KOT=Oa7vRxDpjiNLn69Gg8TZaikNLpaQ@mail.gmail.com>
Subject: Re: [PATCH next] drm/amdgpu/userq: Call unreserve on error in
 amdgpu_userq_fence_read_wptr()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
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

On Wed, Apr 30, 2025 at 4:08=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> This error path should call amdgpu_bo_unreserve() before returning.
>
> Fixes: d8675102ba32 ("drm/amdgpu: add vm root BO lock before accessing th=
e vm")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_userq_fence.c
> index be068e8e37d1..57169a8224be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -373,6 +373,7 @@ static int amdgpu_userq_fence_read_wptr(struct amdgpu=
_usermode_queue *queue,
>
>         mapping =3D amdgpu_vm_bo_lookup_mapping(queue->vm, addr >> PAGE_S=
HIFT);
>         if (!mapping) {
> +               amdgpu_bo_unreserve(queue->vm->root.bo);
>                 DRM_ERROR("Failed to lookup amdgpu_bo_va_mapping\n");
>                 return -EINVAL;
>         }
> --
> 2.47.2
>
