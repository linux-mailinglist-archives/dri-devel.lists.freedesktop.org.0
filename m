Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675FC711850
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A40210E761;
	Thu, 25 May 2023 20:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AD010E760;
 Thu, 25 May 2023 20:42:22 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-557c9d7011aso130047eaf.1; 
 Thu, 25 May 2023 13:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685047341; x=1687639341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zVYcgjfes3J6HZEQtVdQbHlu24tneGcQpq06nRhrvlw=;
 b=PSyP6IvpP8iGD8Tj+Tfz/Bm9wDNlPGgoMn+qDn/5dJgLWzYjTEtz2bsuJTLE0F+vV/
 asWjzVh87EH3fm+DKWt9HY7TCXX8tz+ka615/7caIfTzb/+1hE+2mbvj+P7Mlt7N3/KH
 Rw2SLDn+MIy1CbWtK+NyVlEuxezzlAgZr3w7nGZTQ3WjxStTix4aVbMMcytId7CPOblr
 fTMl2UJiRh6jRIw9/BM7uKUU4ufMfx+TXz3dqsNdBQpk5nLbnkHJJxT9y5Z70c+0nmjM
 Y8aVyyNragyAAcOSEu0SUTkdFJaLgOSETEVwam60wyhb5yxy4hQz2PZnmiiF3hPa2WNI
 Rzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685047341; x=1687639341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zVYcgjfes3J6HZEQtVdQbHlu24tneGcQpq06nRhrvlw=;
 b=ZdtkvkNjnHLDWvt2r28g0uIMUJrH8c+CpArpnx10h4cg9ja/QiCSDqYZWAHgzPCTSs
 umb2KUyOnk5tvs5K3CczquB3aQ0u55jwuOcLTiR4+Enj4xzAHgdu4q3TGVHJE47E/OEZ
 YJ4Ii511nw3mgAH6avGwwUYwRiAKr0GCX6hjVJCySzawa1iyTX2i/jnPrpo9xzCfcymT
 pZXDVCaAOgegtMfxDecjcYc8+VMnl5j7dMNhtN6MrJELyPfthUc7kw0CLakjgEpoTjvs
 NKc8maGHBSabzinhPu8X9kKVkw/R7JrZYX/cE57O3gJhEAAjDeTZ15YOLIq6+afgWyrq
 LRAg==
X-Gm-Message-State: AC+VfDwRMqvuUMv4MNLkfOv5YE5WVnNhHM6aydpzUBXdfJ81Cog3FwfX
 dg0BLsBOtR397RHxM06ionoy4Jx+Kp9qF3k+B4U=
X-Google-Smtp-Source: ACHHUZ4YPET8OizIKc5koGJ9RzLrN2jN14bPaH5Iiua0eEhpZi+Z6cy0ZV3Yt5kZm+d3Z0y9u8p+McJ38Y5NHtBpWhU=
X-Received: by 2002:a4a:9bcd:0:b0:546:dd51:f74f with SMTP id
 b13-20020a4a9bcd000000b00546dd51f74fmr1965310ook.4.1685047340843; Thu, 25 May
 2023 13:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230525203531.3233040-1-trix@redhat.com>
In-Reply-To: <20230525203531.3233040-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 May 2023 16:42:09 -0400
Message-ID: <CADnq5_MNr3RsXi65AdYxkZc8EUYpJBNm-oLhenzcLzRKmN+gLg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: move gfx9_cs_data definition
To: Tom Rix <trix@redhat.com>
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
Cc: amd-gfx@lists.freedesktop.org, jesse.zhang@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, le.ma@amd.com,
 mario.limonciello@amd.com, alexander.deucher@amd.com, Likun.Gao@amd.com,
 Jiadong.Zhu@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 4:35=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> In file included from drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:32:
> drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h:939:36: error:
>   =E2=80=98gfx9_cs_data=E2=80=99 defined but not used [-Werror=3Dunused-c=
onst-variable=3D]
>   939 | static const struct cs_section_def gfx9_cs_data[] =3D {
>       |                                    ^~~~~~~~~~~~
>
> gfx9_cs_data is only used in gfx_v9_0.c, so move its definition there.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Already fixed with:
https://patchwork.freedesktop.org/patch/539234/
which will show up in my tree momentarily.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h | 4 ----
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c        | 5 +++++
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h b/drivers/gpu/d=
rm/amd/amdgpu/clearstate_gfx9.h
> index 567a904804bc..6de4778789ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
> @@ -936,7 +936,3 @@ static const struct cs_extent_def gfx9_SECT_CONTEXT_d=
efs[] =3D
>      {gfx9_SECT_CONTEXT_def_8, 0x0000a2f5, 155 },
>      { 0, 0, 0 }
>  };
> -static const struct cs_section_def gfx9_cs_data[] =3D {
> -    { gfx9_SECT_CONTEXT_defs, SECT_CONTEXT },
> -    { 0, SECT_NONE }
> -};
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_0.c
> index 8bf95a6b0767..c97a68a39d93 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -56,6 +56,11 @@
>  #include "asic_reg/pwr/pwr_10_0_sh_mask.h"
>  #include "asic_reg/gc/gc_9_0_default.h"
>
> +static const struct cs_section_def gfx9_cs_data[] =3D {
> +    { gfx9_SECT_CONTEXT_defs, SECT_CONTEXT },
> +    { 0, SECT_NONE }
> +};
> +
>  #define GFX9_NUM_GFX_RINGS     1
>  #define GFX9_NUM_SW_GFX_RINGS  2
>  #define GFX9_MEC_HPD_SIZE 4096
> --
> 2.27.0
>
