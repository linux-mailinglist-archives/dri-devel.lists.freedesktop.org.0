Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94423E67D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 06:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B80A6E955;
	Fri,  7 Aug 2020 04:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693B76E954;
 Fri,  7 Aug 2020 04:03:50 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c2so278332edx.8;
 Thu, 06 Aug 2020 21:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5E0hCsN8SvECNtTionmgbt1PQwpM17sQHcWDInIwOAY=;
 b=FirJEAq/k+E7Rl/MrL/Lw0I67RrEjfpde5BF/pYzolvP6bol74Rda4aQzubPXL7WxT
 IBBf1+IFs/5y8gfHZlB4q2tnXSRQmxw6IAlkzEzFsXODADLXdHKGAYQqaYWjMqg1RpE0
 6f2mn5hu000+EoCH1vWsfTuaWrBxN8BJnO3Xmh3He6IPsXL2qRfNskCFd9CD7cT9D3jZ
 oIg6kBwImAdOQ/4+dYIAGwdBi0iM0gno5kJNrlX0XqSwKHvWITjLFk/NcIksP+XDo4oB
 RPqn7Bl0WluKpTL0Ow0yOozUbaGRXJN61dGaXrQ1wavjxEti9KvdKsm5bxnfbQ5iH8jz
 TCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5E0hCsN8SvECNtTionmgbt1PQwpM17sQHcWDInIwOAY=;
 b=tf06W2oeLTBOPoX3fJisoRoXh4Qjp+PXdUbnMcwwO83eMzLXrUKskz15WLVoVvEvss
 M/ENGBrNc9VpBKMj6GDJ1/JifRgTbSsM8w2032kDw248eIbESW4WoXLutXMB5eKukQNy
 YNXLqr16/avqqsT10NW4goxmwQGGiwGRfF+u5Y982644qLqkZXW5e8ZjXFdOwUfAp0P3
 H74GrSCavMCI5+S3Y7Xrq/wSrCwanVtbxy1k1FWdnOVT8uVd8hd1loaUV3pCKxUsaM7p
 497pp1tPCJsish6+IxjyqqQqMAIIUbamYachCqhZL+GqI5TnT/4ng+2tN05iJFMchtsR
 J9kA==
X-Gm-Message-State: AOAM532i3F52Wo1Wnz8fua9hhPDLWSMMzZbn8J7W8se1l3/aN0UfYKkJ
 kA2CNfBdGTU0XoB7nB9ir2009tRH35neSRY5TnyIog==
X-Google-Smtp-Source: ABdhPJwzHl1w8KooxYOIa34P2crPTEx1iBWlXCHmUaTFv01QRi50kOhXgFIGmec0XpztGxObRU5GyZAQ93JpbpRWgpM=
X-Received: by 2002:a50:fd0b:: with SMTP id i11mr298241eds.298.1596773028915; 
 Thu, 06 Aug 2020 21:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
In-Reply-To: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Aug 2020 14:03:37 +1000
Message-ID: <CAPM=9txAFXQoRcD-uw3nNUKDg+QrOgdafC6J401Da5ax=1US2w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: missing cases of rename
 ttm_mem_reg to ttm_resource.
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Aug 2020 at 11:13, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
>
> These are missed cases that I just identified with allyesconfig build.
>

Is this against drm-tip? it's a merge problem, that I thought I'd
already addressed, but tip seems to have lost it.

Dave.

> Fixes: 2966141ad2dd ("drm/ttm: rename ttm_mem_reg to ttm_resource.")
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.h     | 14 +++++++-------
>  drivers/gpu/drm/nouveau/nouveau_bo0039.c |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_bo5039.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo74c1.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo85b5.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo9039.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo90b5.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_boa0b5.c |  2 +-
>  8 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
> index 52489ce7d029c..aecb7481df0da 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> @@ -139,28 +139,28 @@ nouveau_bo_new_pin_map(struct nouveau_cli *cli, u64 size, int align, u32 flags,
>
>  int nv04_bo_move_init(struct nouveau_channel *, u32);
>  int nv04_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
> -                     struct ttm_mem_reg *, struct ttm_mem_reg *);
> +                     struct ttm_resource *, struct ttm_resource *);
>
>  int nv50_bo_move_init(struct nouveau_channel *, u32);
>  int nv50_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
> -                     struct ttm_mem_reg *, struct ttm_mem_reg *);
> +                     struct ttm_resource *, struct ttm_resource *);
>
>  int nv84_bo_move_exec(struct nouveau_channel *, struct ttm_buffer_object *,
> -                     struct ttm_mem_reg *, struct ttm_mem_reg *);
> +                     struct ttm_resource *, struct ttm_resource *);
>
>  int nva3_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
> -                     struct ttm_mem_reg *, struct ttm_mem_reg *);
> +                     struct ttm_resource *, struct ttm_resource *);
>
>  int nvc0_bo_move_init(struct nouveau_channel *, u32);
>  int nvc0_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
> -                     struct ttm_mem_reg *, struct ttm_mem_reg *);
> +                     struct ttm_resource *, struct ttm_resource *);
>
>  int nvc0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
> -                     struct ttm_mem_reg *, struct ttm_mem_reg *);
> +                     struct ttm_resource *, struct ttm_resource *);
>
>  int nve0_bo_move_init(struct nouveau_channel *, u32);
>  int nve0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
> -                     struct ttm_mem_reg *, struct ttm_mem_reg *);
> +                     struct ttm_resource *, struct ttm_resource *);
>
>  #define NVBO_WR32_(b,o,dr,f) nouveau_bo_wr32((b), (o)/4 + (dr), (f))
>  #define NVBO_RD32_(b,o,dr)   nouveau_bo_rd32((b), (o)/4 + (dr))
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> index bf7ae2cecaf68..7390132129fe7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> @@ -36,7 +36,7 @@
>
>  static inline uint32_t
>  nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
> -                     struct nouveau_channel *chan, struct ttm_mem_reg *reg)
> +                     struct nouveau_channel *chan, struct ttm_resource *reg)
>  {
>         if (reg->mem_type == TTM_PL_TT)
>                 return NvDmaTT;
> @@ -45,7 +45,7 @@ nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
>
>  int
>  nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
> -                 struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
> +                 struct ttm_resource *old_reg, struct ttm_resource *new_reg)
>  {
>         struct nvif_push *push = chan->chan.push;
>         u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> index f9b9b85abe444..4c75c7b3804ca 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> @@ -37,7 +37,7 @@
>
>  int
>  nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
> -                 struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
> +                 struct ttm_resource *old_reg, struct ttm_resource *new_reg)
>  {
>         struct nouveau_mem *mem = nouveau_mem(old_reg);
>         struct nvif_push *push = chan->chan.push;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> index 1b5fd78ddcba9..ed6c09d678407 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> @@ -34,7 +34,7 @@
>
>  int
>  nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
> -                 struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
> +                 struct ttm_resource *old_reg, struct ttm_resource *new_reg)
>  {
>         struct nouveau_mem *mem = nouveau_mem(old_reg);
>         struct nvif_push *push = chan->chan.push;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> index f0df172b029e0..dec29b2d8bb22 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> @@ -38,7 +38,7 @@
>
>  int
>  nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
> -                 struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
> +                 struct ttm_resource *old_reg, struct ttm_resource *new_reg)
>  {
>         struct nouveau_mem *mem = nouveau_mem(old_reg);
>         struct nvif_push *push = chan->chan.push;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> index 52fefb37064c8..776b04976cdfa 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> @@ -36,7 +36,7 @@
>
>  int
>  nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
> -                 struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
> +                 struct ttm_resource *old_reg, struct ttm_resource *new_reg)
>  {
>         struct nvif_push *push = chan->chan.push;
>         struct nouveau_mem *mem = nouveau_mem(old_reg);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> index 34b79d561c7f4..8499f58213e3c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> @@ -31,7 +31,7 @@
>
>  int
>  nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
> -                 struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
> +                 struct ttm_resource *old_reg, struct ttm_resource *new_reg)
>  {
>         struct nouveau_mem *mem = nouveau_mem(old_reg);
>         struct nvif_push *push = chan->chan.push;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> index 394e29012e504..575212472e7a8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> @@ -36,7 +36,7 @@
>
>  int
>  nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
> -                 struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
> +                 struct ttm_resource *old_reg, struct ttm_resource *new_reg)
>  {
>         struct nouveau_mem *mem = nouveau_mem(old_reg);
>         struct nvif_push *push = chan->chan.push;
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
