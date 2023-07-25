Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13717760A13
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 08:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C21F10E38B;
	Tue, 25 Jul 2023 06:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD86510E041;
 Tue, 25 Jul 2023 06:10:53 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d0e55215aebso2298367276.1; 
 Mon, 24 Jul 2023 23:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690265453; x=1690870253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzkoP5ey5pwsmJYijvvASskshJJCDU0jpldwL8ZyYdg=;
 b=GEMKLiHtQgtDJKxZk5w0hSoOM47tSnBY9XZwYB/d/bEWqdp4TaZSFueFYg/mopDe+y
 DitLxU23gDApqirvhBooAlkzF5O5OcKyz1wIjkegLErE/EVBQB+ejzUiydpp8IkLFUFL
 oYbVAJvyR7HgbJPWuj1FTMmd6pY2yFYiPfTMxMT+hSK58cuGUqE3GtGaXQV1ZbMaFPzk
 /LmFDEMC5iBhQKsJlWvpjqlqy3Jd1HPTE3QCF6QEXQd9a4N91hIx8iXggcFaBohaR+W9
 fKPFnEEQ7bBk1joT3X3T6r77DKFOeyd7NT7+ay6Y5j1sdDB40giJGFq0oY5ng/WcfTex
 bRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690265453; x=1690870253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzkoP5ey5pwsmJYijvvASskshJJCDU0jpldwL8ZyYdg=;
 b=RR7jG+ddKqZRc8+GFN8rMzS3y2FYJ9lEytCSH2TJhwWI1j2jlbcyhv1rHRrZ0MKXES
 619vLFxwYWZckvGEEid8M9SfVPluM4teE8NRVvV62iDImkiklVIwLXUr0Gs4Y811/tOA
 //KrdxXVCznp1CXkA+xtmSUFU8TvXmrkdEeIRP9bqeBzF5/8Q+6BGMdx0W1vpIOHIE8m
 7AytzXWAbUSyHxJwV9PJa40PXvNFxCWJpMv+2y19PJq8maj9KP+W636Wye8UGn/HeCBN
 ItOvnTBJIZhT4mzzSNly+pcmVxlWwCycgUoRZNmdokNkABrTAVK3A5Wxt2X4ZfGfOI30
 QUjA==
X-Gm-Message-State: ABy/qLZd7Am4xLo7oF+xS6mguWYfub/crQHjjNFx7j4EpgELC5ZT3mSm
 XvjEUNGSX4zC9PsAKH6VUmd8kjRP+v4vhKo3GRg=
X-Google-Smtp-Source: APBJJlHJn4TebQJtcBhAzd2myzHMTCwwqXO0napcIqfLd8/prsI5p9oZDoN2o6PXE3cdxVIV/WruodNgy9oH0T3QtG4=
X-Received: by 2002:a25:d1c4:0:b0:cea:b62d:620f with SMTP id
 i187-20020a25d1c4000000b00ceab62d620fmr9752952ybg.45.1690265452901; Mon, 24
 Jul 2023 23:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_0FA6AE16A21AAA2E9481C6FE598BA70CC405@qq.com>
 <f25017a660f8a3a4e49258a1d96003dc@208suo.com>
 <6f8d6649-5b53-4a44-8b9e-0ffd00af3fb6@app.fastmail.com>
In-Reply-To: <6f8d6649-5b53-4a44-8b9e-0ffd00af3fb6@app.fastmail.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 25 Jul 2023 08:10:39 +0200
Message-ID: <CADo9pHiAtQvy4iZrseqM+VnK0VM2meU79UQ7QhQUEoa9RNg=iw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo:Fix Nineteen occurrences of
 the gk104.c error: ERROR: space prohibited before that ':' (ctx:WxW) ERROR:
 trailing statements should be on next line ERROR: space prohibited before
 that ':' (ctx:WxW) ERROR: trailing statements should be on next line ERROR:
 space prohibited before that ':' (ctx:WxW) ERROR: trailing statements should
 be on next line ERROR: trailing statements should be on next line ERROR:
 space prohibited before that ':' (ctx:WxW) ERROR: trailing statements should
 be on next line ERROR: space prohibited before that ':' (ctx:WxW) ERROR:
 trailing statements should be on next line ERROR: space prohibited before
 that ':' (ctx:WxW) ERROR: trailing statements should be on next line ERROR:
 space prohibited before that ':' (ctx:WxW) ERROR: trailing statements should
 be on next line ERROR: space prohibited before that ':' (ctx:WxE) ERROR:
 space prohibited before that ':' (ctx:WxE) ERROR: trailing statements should
 be on next line ERROR: trail
To: Mark Dymek <mark@dymek.me>, Luna Jernberg <droidbittin@gmail.com>
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
Cc: kherbst@redhat.com, huzhi001@208suo.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You can unsubscribe here: https://lists.freedesktop.org/mailman/listinfo/no=
uveau

Den m=C3=A5n 24 juli 2023 kl 19:16 skrev Mark Dymek <mark@dymek.me>:
>
> not sure how i got signed up for this and i don=E2=80=99t see a way to un=
subscribe. this is flooding my email with things i don=E2=80=99t care about=
.
>
> On Fri, Jul 14, 2023, at 1:14 AM, huzhi001@208suo.com wrote:
>
> Signed-off-by: ZhiHu <huzhi001@208suo.com>
> ---
>   .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  | 40 ++++++++++++++-----
>   1 file changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> index d8a4d773a58c..b99e0a7c96bb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> @@ -137,15 +137,29 @@ gk104_ectx_bind(struct nvkm_engn *engn, struct
> nvkm_cctx *cctx, struct nvkm_chan
>       u64 addr =3D 0ULL;
>
>       switch (engn->engine->subdev.type) {
> -    case NVKM_ENGINE_SW    : return;
> -    case NVKM_ENGINE_GR    : ptr0 =3D 0x0210; break;
> -    case NVKM_ENGINE_SEC   : ptr0 =3D 0x0220; break;
> -    case NVKM_ENGINE_MSPDEC: ptr0 =3D 0x0250; break;
> -    case NVKM_ENGINE_MSPPP : ptr0 =3D 0x0260; break;
> -    case NVKM_ENGINE_MSVLD : ptr0 =3D 0x0270; break;
> -    case NVKM_ENGINE_VIC   : ptr0 =3D 0x0280; break;
> -    case NVKM_ENGINE_MSENC : ptr0 =3D 0x0290; break;
> -    case NVKM_ENGINE_NVDEC :
> +    case NVKM_ENGINE_SW:
> +        return;
> +    case NVKM_ENGINE_GR:
> +        ptr0 =3D 0x0210;
> +        break;
> +    case NVKM_ENGINE_SEC:
> +        ptr0 =3D 0x0220;
> +        break;
> +    case NVKM_ENGINE_MSPDEC:
> +        ptr0 =3D 0x0250;
> +        break;
> +    case NVKM_ENGINE_MSPPP:
> +        ptr0 =3D 0x0260;
> +        break;
> +    case NVKM_ENGINE_MSVLD:
> +        ptr0 =3D 0x0270;
> +        break;
> +    case NVKM_ENGINE_VIC:
> +        ptr0 =3D 0x0280; break;
> +    case NVKM_ENGINE_MSENC:
> +        ptr0 =3D 0x0290;
> +        break;
> +    case NVKM_ENGINE_NVDEC:
>           ptr1 =3D 0x0270;
>           ptr0 =3D 0x0210;
>           break;
> @@ -435,8 +449,12 @@ gk104_runl_commit(struct nvkm_runl *runl, struct
> nvkm_memory *memory, u32 start,
>       int target;
>
>       switch (nvkm_memory_target(memory)) {
> -    case NVKM_MEM_TARGET_VRAM: target =3D 0; break;
> -    case NVKM_MEM_TARGET_NCOH: target =3D 3; break;
> +    case NVKM_MEM_TARGET_VRAM:
> +        target =3D 0;
> +        break;
> +    case NVKM_MEM_TARGET_NCOH:
> +        target =3D 3;
> +        break;
>       default:
>           WARN_ON(1);
>           return;
>
