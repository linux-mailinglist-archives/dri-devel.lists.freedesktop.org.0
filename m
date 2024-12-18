Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE499F68EB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4527110EBB9;
	Wed, 18 Dec 2024 14:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tms+Lhx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D64E10EBB9;
 Wed, 18 Dec 2024 14:47:59 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2ee8ecb721dso1096773a91.3; 
 Wed, 18 Dec 2024 06:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734533278; x=1735138078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vOfnVaPkrWafVbUpqL+HmE1DU2SWTTSltwmz9VD16Q=;
 b=Tms+Lhx3M8tw2DKgORkc1EVW79OlTubuCQ6I0IyPp1mNwj++5v/sqa/RECp4hExX/2
 UQPhnzP6H+Pq8V+cBIHrRNjGxdDkeQRhavKxP2CkgkQ8tEz5Wk8/8qSsjQ319fXFq0Bk
 4gADOqy93sJFYUgI1WicXnzHw2OsyM/m5IzIIetFRFq7QHgJVx8y1Jv0oV7UKyHH2AaE
 ZIT2eB53Nky4IoKkiqCT9Sa0rSOeB/OJ9USGex25s04YaEZtBRgpGogHCjRWSnz76Zq6
 vi8PvBe8XeOJ2zRZDTAxthdT6/7qiTw1rT0la+XJywR1dI9utVjOD3IUKJN/CXwC9B3d
 141Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533278; x=1735138078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vOfnVaPkrWafVbUpqL+HmE1DU2SWTTSltwmz9VD16Q=;
 b=CaD04ykP9bGAsp4Uvp73+6Syb8qBZmjhbIzpcCHSrm2rnW6ID5FIJVCnu5lgmGvcev
 LRvigprwQOuau6W4IDY8xcMyRYxJiDrkNpzwqCV1F3Mx9MlPDmCv8LnR6NUNzuXfnt7N
 O7tSqHQoK+WoyvjeWueJ1kboIeFgZvd66qPWyiqCUQCaiT1/rFJO1KRAx0n7GSvHFKeC
 ++NeEkOFhJIdsAvQsFQnxZ8qMz0mqiCGJKzKgWs9+7Rh61yK0i3GvGoBJWxKuxf1jPvH
 aS5ECHukuv8RbvhsSM1+J9RXy0C5aLcGOarZDHC60nH7SRucIg5XAYHKnRIXAP//VxqR
 i4jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6iUIVikv7gBn63wvPUuPzVkikEtqvUM1xYmr/gRnckJCKsS5Xt+iDfkexQIHbmzFZkwOgcYzM@lists.freedesktop.org,
 AJvYcCWYQyhZvfyfxM9rtT5p9XXrxO3UwFhQQzvERuVEbhnmTN4VDXSz2h9KPjmp5dWMZSkguB91ObJq/vER@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbVABufF29Whjcu/z/X8zyh/hWN+sLtwTVNOMG0cGH0MS7I9ue
 M5QGzDSjckQRkYEQ/8To0e6NK/iPXoBlxU1RrIBDgDDKVqsDhsVNY1vjr355YLkYrLxQWBAAyxR
 MfrMuGIkEKinrEza1yMDv8S3iTWw=
X-Gm-Gg: ASbGnctRF8pzFGmI01JqB1vdB5ovsUh60AywV2uUWWiW78MRCis0K1cuZDhntGcwag7
 e74grEMw+4DoofH/cRANNrMqmn9I0es6vfyzkFA==
X-Google-Smtp-Source: AGHT+IGqs69JMyhLgTfABkHUjIAhI9t2c//hUCr+R17bYCrJ5yiT4wdnOe27SzcTjmYGssfprd1lrOT02OuDNE6ZXSo=
X-Received: by 2002:a17:90b:5245:b0:2ee:b665:12c2 with SMTP id
 98e67ed59e1d1-2f2e91be5b8mr1690090a91.2.1734533278544; Wed, 18 Dec 2024
 06:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <2a061534-7780-40a7-b058-98d1fc16915b@amd.com>
In-Reply-To: <2a061534-7780-40a7-b058-98d1fc16915b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Dec 2024 09:47:47 -0500
Message-ID: <CADnq5_OuDekGg7FspcsC1Lh-ZYEt5Vq8T046tqcJ1wRBeuL4ww@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/admgpu: replace kmalloc() and memcpy() with
 kmemdup()
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Mirsad Todorovac <mtodorovac69@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Zhigang Luo <Zhigang.Luo@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>, Jack Xiao <Jack.Xiao@amd.com>, 
 Vignesh Chander <Vignesh.Chander@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>
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

On Wed, Dec 18, 2024 at 3:03=E2=80=AFAM Lazar, Lijo <lijo.lazar@amd.com> wr=
ote:
>
>
>
> On 12/18/2024 4:28 AM, Mirsad Todorovac wrote:
> > The static analyser tool gave the following advice:
> >
> > ./drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1266:7-14: WARNING opportuni=
ty for kmemdup
> >
> >  =E2=86=92 1266         tmp =3D kmalloc(used_size, GFP_KERNEL);
> >    1267         if (!tmp)
> >    1268                 return -ENOMEM;
> >    1269
> >  =E2=86=92 1270         memcpy(tmp, &host_telemetry->body.error_count, =
used_size);
> >
> > Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics=
.
> > Original code works without fault, so this is not a bug fix but propose=
d improvement.
> >
> > Link: https://lwn.net/Articles/198928/
> > Fixes: 84a2947ecc85c ("drm/amdgpu: Implement virt req_ras_err_count")
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Zhigang Luo <Zhigang.Luo@amd.com>
> > Cc: Victor Skvortsov <victor.skvortsov@amd.com>
> > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > Cc: Lijo Lazar <lijo.lazar@amd.com>
> > Cc: Yunxiang Li <Yunxiang.Li@amd.com>
> > Cc: Jack Xiao <Jack.Xiao@amd.com>
> > Cc: Vignesh Chander <Vignesh.Chander@amd.com>
> > Cc: Danijel Slivka <danijel.slivka@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks,
> Lijo
>
> > ---
> >  v1:
> >       initial version.
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_virt.c
> > index c704e9803e11..0af469ec6fcc 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> > @@ -1263,12 +1263,10 @@ static int amdgpu_virt_cache_host_error_counts(=
struct amdgpu_device *adev,
> >       if (used_size > (AMD_SRIOV_RAS_TELEMETRY_SIZE_KB << 10))
> >               return 0;
> >
> > -     tmp =3D kmalloc(used_size, GFP_KERNEL);
> > +     tmp =3D kmemdup(&host_telemetry->body.error_count, used_size, GFP=
_KERNEL);
> >       if (!tmp)
> >               return -ENOMEM;
> >
> > -     memcpy(tmp, &host_telemetry->body.error_count, used_size);
> > -
> >       if (checksum !=3D amd_sriov_msg_checksum(tmp, used_size, 0, 0))
> >               goto out;
> >
>
