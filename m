Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00893CD1D9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 12:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662BF6E0FB;
	Mon, 19 Jul 2021 10:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2565C6E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 10:28:00 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id t143so20162311oie.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v2dUDnfhrWV1GcdFhFWODw8LtsoVKTvHQwSdjp2I7IE=;
 b=Me6X5lcw9AeyzCra5gqYX3bWrJoAw/trfs/eSG+FCVUui6VoQdFL+6r+wGCi3gohBE
 PUZpAfZuQ0C83pBLQosfS7erxoKvt+uq/nHlIlPvg1nDAsa35npI+UuLqGEOLuVr4Lsz
 LiF8KRDBeghye9L4rTF7Fq/nLBtuCgALbeWPQH6a1/52kkCS9t1jXmaQR8gLLJGS4ma8
 zLD1KEjYWmNRCaSnBZNqa2RVNG0psHIcIX427CgPzfCP0Gd/J9nugOo69bBng/6RXejp
 uWWuKsww5YB3Ps+op63rA0xTKofWMwk+WVcE0iuobYMs3k1+QbZiC8GIxemmHKuCbeiz
 u5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2dUDnfhrWV1GcdFhFWODw8LtsoVKTvHQwSdjp2I7IE=;
 b=J0C9komNdO+8gpQA/dPT2sU5eu7rALx5eeqTr9LCa7EfMegBAs2fKxsvvVMlSaMeFD
 2cZqD3QOJxw9XAy5jeJsqpFNCttkoCmU8TuNh5HLZOzf3IVfE/D++n3eXjIRu1gHtDap
 +2bDoANmSWiScmWsWYxdZi052yCRj7k4bMs39cZLoKay4prwwMrcMM/vc4AqcRzOhDIo
 kV3bWG41fhlQ8bJYWb42Bwt0m4C/g5IC+kx2gMWhMva9OVjDR85tb3otqHXJ/qlkKRUN
 AACTHnoOh06kL016r6DPDvT+Fe1fZfNFGzzvAGRKCxgDfoPt+3iDscc47ILM4J1ZrX2k
 QBMg==
X-Gm-Message-State: AOAM5312s49xAYWdRoGIwlS1TCyc37LJVJXfaNUEQLSus0xH0yCpV8cR
 c/C6Tzyhwba2JUiOqrpHPBX+UXZrzgIWPAimEJ4=
X-Google-Smtp-Source: ABdhPJzDVmukU2cfX815a2lb5DnoBTMmh+nwXAPmFnqqzkWYorjPe/Np7EQDK4m5XQgMGcQiCEphGA7VAs6IuAeHHoM=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr16617749oif.47.1626690479452; 
 Mon, 19 Jul 2021 03:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210719082238.26210-1-jason-jh.lin@mediatek.com>
 <20210719082238.26210-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210719082238.26210-2-jason-jh.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 19 Jul 2021 12:27:47 +0200
Message-ID: <CAFqH_5224qCXnLGKsO+iF8bG8fLa9Q9VYMpSmcnnh9yc3FevYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Fix cursor plane didn't update
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 singo.chang@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David-YH.Chiu@mediatek.com,
 nancy.lin@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason-jh,

Thank you for your patch. Please prefix this patch with 'drm/mediatek'
so it is clear what the changes are.

Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dl., 19
de jul. 2021 a les 10:24:
>
> The cursor plane should use the current plane state in atomic_async_update
> because it would not be the new plane state in the global atomic state
> since _swap_state happened when those hook are run.
>
> Fix cursor plane issue by below modification:
> 1. Remove plane_helper_funcs->atomic_update(plane, state) in
>    mtk_drm_crtc_async_update.
> 2. Add mtk_drm_update_new_state in to mtk_plane_atomic_async_update to
>    update the cursor plane by current plan hook and update the normal
>    plane by the new_state.
>
> Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")
>

Drop this new line

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

The patch below fixes the cursor issue on my two boards, one based on
mt8173 and the other on mt8183, so

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++----------
>  2 files changed, 34 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 474efb844249..063c75bab3a8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -538,7 +538,6 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
>         if (!mtk_crtc->enabled)
>                 return;
>
> -       plane_helper_funcs->atomic_update(plane, state);
>         mtk_drm_crtc_update_config(mtk_crtc, false);
>  }
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index b5582dcf564c..e6dcb34d3052 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -110,6 +110,35 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>                                                    true, true);
>  }
>
> +static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
> +                                      struct mtk_plane_state *mtk_plane_state)
> +{
> +       struct drm_framebuffer *fb = new_state->fb;
> +       struct drm_gem_object *gem;
> +       struct mtk_drm_gem_obj *mtk_gem;
> +       unsigned int pitch, format;
> +       dma_addr_t addr;
> +
> +       gem = fb->obj[0];
> +       mtk_gem = to_mtk_gem_obj(gem);
> +       addr = mtk_gem->dma_addr;
> +       pitch = fb->pitches[0];
> +       format = fb->format->format;
> +
> +       addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +       addr += (new_state->src.y1 >> 16) * pitch;
> +
> +       mtk_plane_state->pending.enable = true;
> +       mtk_plane_state->pending.pitch = pitch;
> +       mtk_plane_state->pending.format = format;
> +       mtk_plane_state->pending.addr = addr;
> +       mtk_plane_state->pending.x = new_state->dst.x1;
> +       mtk_plane_state->pending.y = new_state->dst.y1;
> +       mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
> +       mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
> +       mtk_plane_state->pending.rotation = new_state->rotation;
> +}
> +
>  static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>                                           struct drm_atomic_state *state)
>  {
> @@ -126,8 +155,10 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>         plane->state->src_h = new_state->src_h;
>         plane->state->src_w = new_state->src_w;
>         swap(plane->state->fb, new_state->fb);
> -       new_plane_state->pending.async_dirty = true;
>
> +       mtk_plane_update_new_state(new_state, new_plane_state);
> +       wmb(); /* Make sure the above parameters are set before update */
> +       new_plane_state->pending.async_dirty = true;
>         mtk_drm_crtc_async_update(new_state->crtc, plane, state);
>  }
>
> @@ -189,14 +220,8 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>         struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>                                                                            plane);
>         struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
> -       struct drm_crtc *crtc = new_state->crtc;
> -       struct drm_framebuffer *fb = new_state->fb;
> -       struct drm_gem_object *gem;
> -       struct mtk_drm_gem_obj *mtk_gem;
> -       unsigned int pitch, format;
> -       dma_addr_t addr;
>
> -       if (!crtc || WARN_ON(!fb))
> +       if (!new_state->crtc || WARN_ON(!new_state->fb))
>                 return;
>
>         if (!new_state->visible) {
> @@ -204,24 +229,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>                 return;
>         }
>
> -       gem = fb->obj[0];
> -       mtk_gem = to_mtk_gem_obj(gem);
> -       addr = mtk_gem->dma_addr;
> -       pitch = fb->pitches[0];
> -       format = fb->format->format;
> -
> -       addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -       addr += (new_state->src.y1 >> 16) * pitch;
> -
> -       mtk_plane_state->pending.enable = true;
> -       mtk_plane_state->pending.pitch = pitch;
> -       mtk_plane_state->pending.format = format;
> -       mtk_plane_state->pending.addr = addr;
> -       mtk_plane_state->pending.x = new_state->dst.x1;
> -       mtk_plane_state->pending.y = new_state->dst.y1;
> -       mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
> -       mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
> -       mtk_plane_state->pending.rotation = new_state->rotation;
> +       mtk_plane_update_new_state(new_state, mtk_plane_state);
>         wmb(); /* Make sure the above parameters are set before update */
>         mtk_plane_state->pending.dirty = true;
>  }
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
