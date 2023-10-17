Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE747CC4B2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 15:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F3610E2FA;
	Tue, 17 Oct 2023 13:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDF710E2FA;
 Tue, 17 Oct 2023 13:22:16 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-57ddde51033so3434166eaf.1; 
 Tue, 17 Oct 2023 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697548936; x=1698153736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iu05MGWPD0utxhshrOX9Vp8nu3FivASq6+WhFfzoo4Y=;
 b=jjPN/ODNjssG/ue/uFWEODBbjnDnoe+Z/LS2W4fbjPpO6dTEQ/PTYc4qsrhY5CgoWd
 ZNl023w2+wvBs7pBaaw/ARHKRG7iCt2APTGhjU3wOjNbKFcgSHmerp37p0elcNeTdkWv
 q5gwSU8wLPYnJrhm8rdJ6TrqkJB8SWPQ7oh55eKduIRvUc9XixaF/m5oDm8x4V2YHBkb
 SQ9GnOI6hNstM7dRbDGtrTZZb+UWfBexfuU5OMhuo12FbuRkyrXUfZKbQkioTfw+BXHI
 lpUeG4oPwQJDvJIL+y1oae7vk/Fdt9boOAJMXpjg4i92fOzh8RMrgasNrCzo/Y1iL+/1
 xmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548936; x=1698153736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iu05MGWPD0utxhshrOX9Vp8nu3FivASq6+WhFfzoo4Y=;
 b=L4CAziqDcQWfInnGN3zTAfzAA5eLokpov46GtSsbh8iVbFnTHpXdwEbrX84yXARyVx
 yPB/J/sTeA2sYeF+Ussms+MTWM38m4/ttVg+iJmqnLBVM5iSO6Q841tHU/juq+nTKVcG
 o5KIsW91jNv88qA1N8Gn3+aMbVSAsClKoOlOC1Mhh2hrNKodFJbpJ4E5CGQQaeu+2rSN
 oAb+CoQWZsZFMyM6jTy8hY3W3z6SPswE9MrFeFxzWvLAus8O9HWl1UuCkyuE5AHGjyF4
 afLjSqxacWGqa27S1lSge0iYDgTYPYzvNgE6Z+8Z13kZ5Hn1nan0CmyylWn5ZzVooBmh
 M+XQ==
X-Gm-Message-State: AOJu0Yxje8tjMxbZJSHIIwfBdgJ/Xr1CUuYyKW+zzOSQEv8kbfz4pBT9
 mAronxVm6GDuE291uztRyiqzMQCqQRjawsn/yzybPS2u
X-Google-Smtp-Source: AGHT+IGWvDBEWgZr9kN5nYsb8FZqXEv/8H6URPEYn+xbBf62G50QbAAVdtKT75sp1ilhtVSO4hzMVOZoW6R6QTn2OEI=
X-Received: by 2002:a05:6870:b487:b0:1e9:7912:3bd9 with SMTP id
 y7-20020a056870b48700b001e979123bd9mr1074656oap.9.1697548936093; Tue, 17 Oct
 2023 06:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231017035656.8211-1-luben.tuikov@amd.com>
In-Reply-To: <20231017035656.8211-1-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Oct 2023 09:22:05 -0400
Message-ID: <CADnq5_NyhWLmSbtmeaHv7RRXhEc+C4XTPZ-U57zrpw3N3nObCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Unset context priority is now invalid
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 12:52=E2=80=AFAM Luben Tuikov <luben.tuikov@amd.com=
> wrote:
>
> A context priority value of AMD_CTX_PRIORITY_UNSET is now invalid--instea=
d of
> carrying it around and passing it to the Direct Rendering Manager--and it
> becomes AMD_CTX_PRIORITY_NORMAL in amdgpu_ctx_ioctl(), the gateway to con=
text
> creation.
>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ctx.c
> index 0dc9c655c4fbdb..092962b93064fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -47,7 +47,6 @@ const unsigned int amdgpu_ctx_num_entities[AMDGPU_HW_IP=
_NUM] =3D {
>  bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
>  {
>         switch (ctx_prio) {
> -       case AMDGPU_CTX_PRIORITY_UNSET:
>         case AMDGPU_CTX_PRIORITY_VERY_LOW:
>         case AMDGPU_CTX_PRIORITY_LOW:
>         case AMDGPU_CTX_PRIORITY_NORMAL:
> @@ -55,6 +54,7 @@ bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
>         case AMDGPU_CTX_PRIORITY_VERY_HIGH:
>                 return true;
>         default:
> +       case AMDGPU_CTX_PRIORITY_UNSET:
>                 return false;

I  don't recall if any userspace uses this, but this would break
userspace if it does.

Alex

>         }
>  }
>
> base-commit: dc9b2e683bcba017588b9aaad80f442ad004a48f
> --
> 2.42.0
>
