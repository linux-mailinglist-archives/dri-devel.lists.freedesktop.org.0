Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58663B2ACBF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F7510E47F;
	Mon, 18 Aug 2025 15:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j3zQbPfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0410E1E8;
 Mon, 18 Aug 2025 15:29:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2445813f6d1so6841965ad.2; 
 Mon, 18 Aug 2025 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755530977; x=1756135777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzCbuq+Gbh0OgQBARAQDKXgtinude1MKLs0f7Ap5Gnc=;
 b=j3zQbPfOGCo4kuAX1qk/UW3hiQSAadUdfYlDGCzoUDIOUuRiKqzR0GaHXegR3Q2p0Z
 POu/1AWOp5ioFBDTzoHcNsnd6zMNHsKN0xf3in8tQVk6V96P6VRTGnbIEK+kGDyroSGt
 bpafzjkhKPvbFfBei7O1CIJPD/5wDotGPEhSAH10bPaTdv11QmjRfE8lOtmpJLfzTVLh
 f7vlsg1hJg6d99TAq+ObCqsjCyV3WrGSRTMstw4KMK1iEOq4L60Ydb3Exl9lYLBID5G5
 70It0HF3MZRuYoBKC6nFyGRGN85N6UyD3m2GgZ3GQBNU8zu14XYzVkqfHFAllEJmynWF
 1KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755530977; x=1756135777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzCbuq+Gbh0OgQBARAQDKXgtinude1MKLs0f7Ap5Gnc=;
 b=smoSn58VbmUboECM0Es8LUn3I/dbfxXb6OjWZKQzjejxOgUdJdnpjSomr+sUYpH9bk
 U8ESdJJZrMcg/g1y+m3krXDE2+AE0VmGhNuNG6fhKWbxf14jlY39A6yOhCBD8nJKQxaN
 ZAcOMd/3sFSJI6uKktbLfjmNXkuBeMjxd5WeDTz0ikXZxuBTuCHQ8vLCD15IxhcukiN5
 bYssfKnk6oVn5rDnO5Y8c1l+zjaC0Ypc7qW76oRS5l/bj0tBY1Jx/E5JsbT4cOA50oy+
 GDgPFTLYsugvscNyah7T6LTQaoIk0JVIWPlKvK4vQvd9WuUxA2ftgoteQ6VQAs+F4NRm
 mdMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfRUc+0uLSWhhkpVseu0Q/ezQOckOzUU/RcMq4WGxVU2Fudrrql4YLL7mDxCxEMMdAkbH2itfF@lists.freedesktop.org,
 AJvYcCXlq7pI+oqPfoyHtZzzOm80cIwmjqsoki2hsRQ4EhOGI3NM3VBSNSdK7MPkNEBxQvrJVrY/sOUuPxZ8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGp0LQyRJsXFXrpMMG3LballBaFV32HTXQ0Utp+hBaRZ7BAXtU
 fm1rZLMqNDqWatvavXjoP4hCXyxssY1Im4O8/Pvyz/F7IpAi/D9HqRStz6r9Zi0PDZAP9QTOhQ+
 cuDcHlg8H8or9k0ec/Pq7Lz7E2NldMS4=
X-Gm-Gg: ASbGnct99Rc72GIoapRBZHHWZ+cgYLjd3iikTdESXPRUNk13XkSaMpPqSWvpg8P/dTA
 mgQhfwKY5v1H6ewBYaRT2CjLPgXs/a/nM/QCxFrISvQmK8TsMbwBZ32MfgB8vsiFmwNzrZj9bAT
 PMsK7he0WktLiMh5/FNIMeqf/fVUqfi0w+WWAy/LdFuYMLD0QCnBFmjY9QTFeCAqklMrXppsBin
 Y4Oeso=
X-Google-Smtp-Source: AGHT+IFQtuz+CyAMPVEijdts/DpltVK9bMgNuHrnfzEDbJ+REcuaOIIo4N6FA6Q0HHjOTejO5nv+CckyUkZgCWChz8k=
X-Received: by 2002:a17:902:d488:b0:234:f1b5:6e9b with SMTP id
 d9443c01a7336-2446d6d4c76mr89751465ad.1.1755530977058; Mon, 18 Aug 2025
 08:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250816143752.397973-1-rongqianfeng@vivo.com>
 <20250816143752.397973-3-rongqianfeng@vivo.com>
In-Reply-To: <20250816143752.397973-3-rongqianfeng@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Aug 2025 11:29:24 -0400
X-Gm-Features: Ac12FXweR1HbddeALxYgvHcLz-QIOO5fQfMo7oiCGzMfyooW5pNwpZFpeEJq-r4
Message-ID: <CADnq5_Ph-PuhMcr7BE4Jik_y-m0bx_tSe3Hw8xBTRMeehDD-zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/radeon: Use vmalloc_array and vcalloc to simplify
 code
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Sat, Aug 16, 2025 at 10:54=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:
>
> Use vcalloc() and vmalloc_array() to simplify the functions
> radeon_gart_init().
>
> vmalloc_array() is also optimized better, resulting in less instructions
> being used.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/radeon/radeon_gart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeo=
n/radeon_gart.c
> index 4bb242437ff6..acd89a20f272 100644
> --- a/drivers/gpu/drm/radeon/radeon_gart.c
> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> @@ -346,14 +346,14 @@ int radeon_gart_init(struct radeon_device *rdev)
>         DRM_INFO("GART: num cpu pages %u, num gpu pages %u\n",
>                  rdev->gart.num_cpu_pages, rdev->gart.num_gpu_pages);
>         /* Allocate pages table */
> -       rdev->gart.pages =3D vzalloc(array_size(sizeof(void *),
> -                                  rdev->gart.num_cpu_pages));
> +       rdev->gart.pages =3D vcalloc(rdev->gart.num_cpu_pages,
> +                                  sizeof(void *));
>         if (rdev->gart.pages =3D=3D NULL) {
>                 radeon_gart_fini(rdev);
>                 return -ENOMEM;
>         }
> -       rdev->gart.pages_entry =3D vmalloc(array_size(sizeof(uint64_t),
> -                                                   rdev->gart.num_gpu_pa=
ges));
> +       rdev->gart.pages_entry =3D vmalloc_array(rdev->gart.num_gpu_pages=
,
> +                                              sizeof(uint64_t));
>         if (rdev->gart.pages_entry =3D=3D NULL) {
>                 radeon_gart_fini(rdev);
>                 return -ENOMEM;
> --
> 2.34.1
>
