Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B1BB43E14
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD1810EA50;
	Thu,  4 Sep 2025 14:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cPN79l0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE60710EA4D;
 Thu,  4 Sep 2025 14:07:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-24602f6d8b6so1960605ad.1; 
 Thu, 04 Sep 2025 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756994851; x=1757599651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXF7lUGlzoUNaaSeGTJ59Qfx95myet4lfZdU71qhW/c=;
 b=cPN79l0b3ymKhArFl6siwwd1MBa7ImX7X3jBm5kyLTMQ4+o3bLX/9y10+F2YEFBkdh
 niUgddbmZLceUIGyYLMz0Fchr2rt2L6DNnpK+S0IRrBawz37dWnUhjbDie+/RC+po0pK
 EcLLlnMDL62se+Ssw6WjCtBXnysqItF0lZMOq7JrhYrdpbZQdj/H9jCraQ2RM4ZzGYzN
 No9mpMLnVvCsNsso4tGSe0e8ctegAaCeL5O0xWiYej+Mn4vk4DFynUTFTBpaJzxBSPwk
 +AHaSMYTjI+tCRhuqytyxjSuDg+8YHFnjhGGjTj2xgfgDH/8Rw7xe/X85aAPedpzNpDU
 Dlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756994851; x=1757599651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JXF7lUGlzoUNaaSeGTJ59Qfx95myet4lfZdU71qhW/c=;
 b=Emt1YA8r9f07yNpG/OivWPMi6Ucu8afEZNCRkJL6Y3MdXbKo30kLy128fT2oomb/1q
 2tKQEynDmsMWh/zgu4E0CtmM/gryGBw5oaBzudKU5cmSIw0OYLJmZFH7cBBMzOjLmbNy
 SxzmwCM0MbOSnv04bjr0a9OHWFrTPGoCbV8RKEwPfQtwAmufxixH0qSyBAi8XXlh1U7H
 3i+OUgHfwWoYcJqtWJGQzH3orxDCq2hVh4jRWKBLyeumM3HelrKBQdL9nWk11Ml00hMV
 G0+xGp+9dxzNn2gyW0zrljZYUICwWpIMpRkFNPcE32jQxbyd0FyBmDIS/BL6g4rDo3Z5
 3K/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6oKsnFaHMZcqjGm2Q7fj/SvifBg/Y+FLIUEWyWywBIrk/1koSDH2m24Gcnr2ehMTFV13A0KqdFHvv@lists.freedesktop.org,
 AJvYcCXgQU6L2I//6TpPhxTqgS44ZeYfftPk+CNb62bGvukfX2/6tkUWvX86tyYZKlQgG/74r3janv3x@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwffOqMXjX1oeZJDsoTPzlGzgLZtBIp7GAADmM/IfMA/3EKOU8N
 SO2qEFhcYtnuUrcYXffiv7lxBmsazjqv7zfrwzySvRjPr2Pupwf1vPB3F5r2lb6mycKqlWlIAq0
 8rn7H5bImwr8oHf/JaFJb3wzZhApS7lo=
X-Gm-Gg: ASbGnctE/8Q1vDO4DCKMhsJ4Jz+TQAEUX2uBimIQt1Mz83z4rstlr8bwQ5KH73wIuSt
 xhDB0u4gZuZlH7a73MiWfwOcpYtYvnyN+m4pJHqAFdKO1+jp4Yp2oxDq/PUNMBuGmi7t0BLhOnV
 sGyRL+1dkoG6eXUm42xPuB40xC7H5Mpea+jXBSmJxX4wlSFOPCtkxlRrXiF9h0kdzKsrjmdFYx3
 D3OPjweV3bMF2Zpnw==
X-Google-Smtp-Source: AGHT+IH3MY/OTockoauDSyOp/l19fy2ykBd3RlTZfyNT0ABfjsmLAysxtPRcG50Q0m4OIHq4m+LRitinGGXWpfoiUgE=
X-Received: by 2002:a17:903:22d1:b0:248:8a31:bf6f with SMTP id
 d9443c01a7336-2491eadb922mr166015585ad.4.1756994851019; Thu, 04 Sep 2025
 07:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250904123646.464028-1-rongqianfeng@vivo.com>
In-Reply-To: <20250904123646.464028-1-rongqianfeng@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Sep 2025 10:07:19 -0400
X-Gm-Features: Ac12FXykgD4aIBzDItZHcqzk1vdrpEvCwQuABoCP0-tmsZGt2PPBgJYPMj3ZoqA
Message-ID: <CADnq5_N=hQH9OGp2GfdPeOq7V2B_UX0VCDQ-XcTDroy-WHRmyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <Philip.Yang@amd.com>, 
 Alex Sierra <alex.sierra@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Sep 4, 2025 at 8:54=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.com=
> wrote:
>
> Use negative error code -EINVAL instead of positive EINVAL in the default
> case of svm_ioctl() to conform to Linux kernel error code conventions.
>
> Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/a=
mdkfd/kfd_svm.c
> index 521c14c7a789..68ba239b2e5d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -4261,7 +4261,7 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm=
_op op, uint64_t start,
>                 r =3D svm_range_get_attr(p, mm, start, size, nattrs, attr=
s);
>                 break;
>         default:
> -               r =3D EINVAL;
> +               r =3D -EINVAL;
>                 break;
>         }
>
> --
> 2.34.1
>
