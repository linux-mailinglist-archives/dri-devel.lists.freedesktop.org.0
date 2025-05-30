Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C8AC96E1
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 23:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B9110E87E;
	Fri, 30 May 2025 21:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V59ZWs/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3084910E87E;
 Fri, 30 May 2025 21:08:25 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3032a9c7cfeso355105a91.1; 
 Fri, 30 May 2025 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748639305; x=1749244105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WKfaYUeeSipDjRpov6+8N15fF44IEtNQ/PbtBP3EPg=;
 b=V59ZWs/kH5//jU91LNFx2sNjtrSQUW6KTJEWrkDSc2UEh6fwpNFj/RN11Avg5LQ7Ty
 FtUVpBfQ+nVB03In51l/urNmIrtwVcBorbGbc383vyoL6ovdG2GyRaoxKQ3+veHiR9G8
 YMtQ3IcZnOkYovg2OV4+Km/MH/jopIbsfIcVqYbd7isN2XvluUXnW8h+YeepwyYO9VMa
 xoS+yJKdETYDdvmj9Cs+uDDxy6O6cjb/j6KOgKFjOd3382Cr3a8wDNRiOPaDn2bcWq98
 7Fsvz16GXU6jj8W+EL3hLjnqetIhj0+YXFGQGDSeFARiXsrT/6eII4gLnmNxkH/x8c0i
 36tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748639305; x=1749244105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WKfaYUeeSipDjRpov6+8N15fF44IEtNQ/PbtBP3EPg=;
 b=fYgxATv3vsXoDxhpDXpvBUJdT+NGrbOFoFfJmDYIXUJFo+CwRtrJ+OFYlbz6JiTGP3
 fkOsXOewQiEUDm8WxQCkSLopuTJ6RkF+A4kEeqhsOOD3HdFh5SQ0Hjw//XhPhqUzdORe
 6V+SEusc31yFvL/Bj1OBaYzDHFfacC88dCerXVGuWo9Y4Majj93JW8hPnzVUtrNyHpTJ
 3p8h7zkWzLGD5F6n13oq0i5b9cRVcZUwYrcwIxG3cbPBYR+6LzOacvYm8dEdMlq2RmTC
 7V61hCseJE1C6d9Zs9YjTeFy5ZM9xxX2c5uZcf82G93zN6whhHBrUC73abtRicATdtFY
 iFsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1EdDtytIKV/NKuuVh6OulZLddcX/bZQap4CAammoXrE+dvl8wBAxZgifvHMc5FKLbLCN3j9P2yOPy@lists.freedesktop.org,
 AJvYcCWfASnI7R11HuF5/SiWcVsw2QstJtE/aEGO/56Ep5t2ZJCAcYelcJgf4lekC4fIsar4C469kaXr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW8rVjriQlDjvOEddS/bNbQho/A3gtp9V/2x+6oWIAMbvjTkUj
 KwTqspMHpwiAC89NGsC79m4p7CeYiKadY/oH74FhJM3FkA3kPRzHT48zv+0T5tyYw7JZdkgEeCt
 2NVnRCGs3UUzpqC83qn9XAMPEMq9+tcg=
X-Gm-Gg: ASbGncvQj9ZWfrEhRHp3XzB+zl/v2VHTsMDMw5aLKQmPRvh9m0w4HBPbegWDDq4/h1s
 HpsyJ5p2xPMn2XeiqxhVLyHguLLOc9kTR5rwNg+DDWo5HCHmvcbAYmtJEoJe4HUchi0e1dEstPg
 5AT9OvsrltAq1jSVMa9MLIXCeOxB17W7MNEA==
X-Google-Smtp-Source: AGHT+IEd6ePFnH8jXu+zGYS0WwKidnWX/oXQAGbZe7bunf5O6PgLb5EzP177jY0M5xxWnFOpoOvR3gDAl4FCNfHoYxM=
X-Received: by 2002:a17:90b:2e49:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3124187cce3mr2585034a91.5.1748639304766; Fri, 30 May 2025
 14:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <aDCd0MrLste5b2HM@stanley.mountain>
In-Reply-To: <aDCd0MrLste5b2HM@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 May 2025 17:08:12 -0400
X-Gm-Features: AX0GCFtLRGbmxa4eYjEiDzCxUKyyXrJFlvihvmV8icLQAOvmTAv721vfYj9F8yI
Message-ID: <CADnq5_PxyGj115MbVTW6yMqPYhJ6PmJVX4rpqU6k2ZqyvMVy=A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix integer overflow in
 amdgpu_gem_add_input_fence()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arvind Yadav <arvind.yadav@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shashank Sharma <shashank.sharma@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, 
 Frank Min <Frank.Min@amd.com>, Kent Russell <kent.russell@amd.com>,
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

Applied.  Thanks!

Alex

On Fri, May 23, 2025 at 12:34=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> The "num_syncobj_handles" is a u32 value that comes from the user via the
> ioctl.  On 32bit systems the "sizeof(uint32_t) * num_syncobj_handles"
> multiplication can have an integer overflow.  Use size_mul() to fix that.
>
> Fixes: 38c67ec9aa4b ("drm/amdgpu: Add input fence to sync bo map/unmap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 2c68118fe9fd..0ecc88df7208 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -58,7 +58,7 @@ amdgpu_gem_add_input_fence(struct drm_file *filp,
>                 return 0;
>
>         syncobj_handles =3D memdup_user(u64_to_user_ptr(syncobj_handles_a=
rray),
> -                                     sizeof(uint32_t) * num_syncobj_hand=
les);
> +                                     size_mul(sizeof(uint32_t), num_sync=
obj_handles));
>         if (IS_ERR(syncobj_handles))
>                 return PTR_ERR(syncobj_handles);
>
> --
> 2.47.2
>
