Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555FAC96DE
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 23:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C9710E259;
	Fri, 30 May 2025 21:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gsB4/MUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFBA10E23B;
 Fri, 30 May 2025 21:07:13 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3108652400cso321967a91.1; 
 Fri, 30 May 2025 14:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748639233; x=1749244033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGXcmpHLGZ0cBPSg7JF2gv115I3EWj0stA1DKNfhXFw=;
 b=gsB4/MUFuGYjgz5fSQyUZtBg+zrgKcWTXU0o+IT4AR2bL6TZ+1tMJvpp6yXRW8RFTt
 Th080EfcH7eB/URLt4J+8x5mZEmXmUbqhDZ+OOwQpwFwsRYR8TjmBic2mwgkQW0txA+y
 GOvp4DJSJkTtrD7Fet4jfCI6iWXB9OYqPmWaf2qqh/rOnPaiJrrs0o5UglpLqzQXmR+h
 tOyhVBovNSB6HqCaqP8E/MsnAwoAxTYh19Qj1MMe6LIOeT2btTQ1cVTuZtCNU9CF8lse
 OMGMSmMYdK0KDcLvQvRRayod34w6zoxYv8Iu26uXyWyZKg08XcJXnhsY/10Dqn9pVk1I
 OSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748639233; x=1749244033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGXcmpHLGZ0cBPSg7JF2gv115I3EWj0stA1DKNfhXFw=;
 b=gOYzVgMqbRzADcnGYbRL6iEeqCLYV+H5VuZw83k4Z/tNEOQKLRRL8y5B0ljbL3OL9u
 zd/vW6DCweqZjR+PAYiZk2l8w3QNjznbOeTcYfiu3+kbNpWzlghF6NMXXE1ELfX1eXWA
 gTU+icgRHZKMdAKPA7CEQSeFospThleIvUEym4Z8w/X9G8svB48b2tITb6hyQc4DNJMo
 Hc+4ct6WXmu8EyvIWa7+Kk9A7rAiemJSIRBl6qszUd34MNGbe2iXUhMWGqiL1aq/Lg9+
 TDDaq0fbZiI/oArGHVfuxQ5Wz5FWNSetrbwwTSHNCu1j9x27pUT+P0pSwa4gwnDhbmRy
 Ok2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhy2yTRODf291/h5inSNX1QXXa8T/k04hsRisxvpTZUXJ5get1u+6N4Pa313/kjmcpXIXHFsvFdyCh@lists.freedesktop.org,
 AJvYcCXq/wjaX/mqBC9HdDWramfd2CiC0Ge9tWlRNvqVud6NirYSCHZZxpKOn3hcQjKarsmOh24gn1ri@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbZQRGNmE1H3oK99D5DVBaCAtY/Kpfbx6Vj+uV8F6mXcCviZ3N
 2H/VhMwC3py/qARh29Bb+/HHkfLg738oezk5h9jFC5ERpDakINM2AV8fU9w9XKwLmteuTmO9U+3
 f0Mxbq25yyh9GyMdtj9fLxlJ252b2HzQ=
X-Gm-Gg: ASbGnctxZ/wp/TBtsPiRY/iiSE5PTV6kiCjcRH4U51yVh88k8o+q2abYEUdhAI2laX6
 2KOb9MGLEyT7EPa8VGY7hZveZm0BZ255H5vLvRg4Li0sfdtp+sgvMxAfUUi+DEBOa1XKmWwiTix
 dV50WxQFE7U5DpYNMdjQqK3YMmslb3bxlPBA==
X-Google-Smtp-Source: AGHT+IE39OkzWVKlWbuP41xFMtRiiUJFZAOfPL6ymnoyEmqEM70KUGsyUkK03lu86u+zMtXgYYeovXInIZXHdm9l9j0=
X-Received: by 2002:a17:90b:1c03:b0:311:b0ec:135e with SMTP id
 98e67ed59e1d1-3124d37bf74mr2147906a91.2.1748639232681; Fri, 30 May 2025
 14:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <aDCc5kawU4cWj-Cx@stanley.mountain>
In-Reply-To: <aDCc5kawU4cWj-Cx@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 May 2025 17:07:00 -0400
X-Gm-Features: AX0GCFvPbUz9CBiEt7WQUPqZBhsAhDRNISBs7Xy5NYAVX-7I-ATyV23irUkz_3U
Message-ID: <CADnq5_PGo3=S4A9Vy-8Sonx+NEYp47_OD9NK_LFO9q+Dbtwo0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix integer overflow issues in
 amdgpu_userq_fence.c
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

On Fri, May 23, 2025 at 12:25=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> This patch only affects 32bit systems.  There are several integer
> overflows bugs here but only the "sizeof(u32) * num_syncobj"
> multiplication is a problem at runtime.  (The last lines of this patch).
>
> These variables are u32 variables that come from the user.  The issue
> is the multiplications can overflow leading to us allocating a smaller
> buffer than intended.  For the first couple integer overflows, the
> syncobj_handles =3D memdup_user() allocation is immediately followed by
> a kmalloc_array():
>
>         syncobj =3D kmalloc_array(num_syncobj_handles, sizeof(*syncobj), =
GFP_KERNEL);
>
> In that situation the kmalloc_array() works as a bounds check and we
> haven't accessed the syncobj_handlesp[] array yet so the integer overflow
> is harmless.
>
> But the "num_syncobj" multiplication doesn't have that and the integer
> overflow could lead to an out of bounds access.
>
> Fixes: a292fdecd728 ("drm/amdgpu: Implement userqueue signal/wait IOCTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_userq_fence.c
> index 029cb24c28b3..bd79f105d77f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -430,7 +430,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev,=
 void *data,
>
>         num_syncobj_handles =3D args->num_syncobj_handles;
>         syncobj_handles =3D memdup_user(u64_to_user_ptr(args->syncobj_han=
dles),
> -                                     sizeof(u32) * num_syncobj_handles);
> +                                     size_mul(sizeof(u32), num_syncobj_h=
andles));
>         if (IS_ERR(syncobj_handles))
>                 return PTR_ERR(syncobj_handles);
>
> @@ -612,13 +612,13 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev,=
 void *data,
>
>         num_read_bo_handles =3D wait_info->num_bo_read_handles;
>         bo_handles_read =3D memdup_user(u64_to_user_ptr(wait_info->bo_rea=
d_handles),
> -                                     sizeof(u32) * num_read_bo_handles);
> +                                     size_mul(sizeof(u32), num_read_bo_h=
andles));
>         if (IS_ERR(bo_handles_read))
>                 return PTR_ERR(bo_handles_read);
>
>         num_write_bo_handles =3D wait_info->num_bo_write_handles;
>         bo_handles_write =3D memdup_user(u64_to_user_ptr(wait_info->bo_wr=
ite_handles),
> -                                      sizeof(u32) * num_write_bo_handles=
);
> +                                      size_mul(sizeof(u32), num_write_bo=
_handles));
>         if (IS_ERR(bo_handles_write)) {
>                 r =3D PTR_ERR(bo_handles_write);
>                 goto free_bo_handles_read;
> @@ -626,7 +626,7 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, v=
oid *data,
>
>         num_syncobj =3D wait_info->num_syncobj_handles;
>         syncobj_handles =3D memdup_user(u64_to_user_ptr(wait_info->syncob=
j_handles),
> -                                     sizeof(u32) * num_syncobj);
> +                                     size_mul(sizeof(u32), num_syncobj))=
;
>         if (IS_ERR(syncobj_handles)) {
>                 r =3D PTR_ERR(syncobj_handles);
>                 goto free_bo_handles_write;
> --
> 2.47.2
>
