Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3533D2FC9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16AF6EE30;
	Thu, 22 Jul 2021 22:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8606EE30
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:20:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99DAC60EBD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626992430;
 bh=UBbRW2dJdthNRV7ahn+zuo6vi/63CEXtWz9EMVemDGc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aeQCl8506WTehxEgSoqz2X579VZCIjQPDPuIi8+C6YZUAquNaVThYmdnOEvTk+EBE
 ovvcOZeHKdrWrqY48qn1jcrG2CE+lwPEO6W47Owj10NZAJaVOqt06Kzh0IoAvAoOll
 fgMcM681st3dfzTAFaRfFfM2SLgK32ESHrE938jm3xIptc7cR/R9vsNv3Gwv9CX3zX
 ax4uKbUtF1AeHz2EwYpJVvI3FlLNMD0SNAiyvbI03BVeXBM0m0cauCL0tupia6rZsv
 BSuzu0dZDR6zzWw+6snuTKV5bXXfw8iRvh6wKfqel09pj89euMBYxpybwuFfxIZOw7
 pAYPpGDUCNv1A==
Received: by mail-ej1-f50.google.com with SMTP id o5so933782ejy.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 15:20:30 -0700 (PDT)
X-Gm-Message-State: AOAM531H4XJAd3S2YxOk0tanIb7L8tVXic9mQ8vObLCNwbsMUqOIBARk
 pvmIGFbO5BUCxHEXLkja3Wfz9+zj88a1fVd+mQ==
X-Google-Smtp-Source: ABdhPJwXWEw3S7jLgBAbvYSuo9ZwWc4hAPLcprn5CYHYEKMQ+XqOBxwDM/cEWRHTHPKaZNZdv/8X/1DchdPffow9340=
X-Received: by 2002:a17:906:27da:: with SMTP id
 k26mr1895403ejc.267.1626992429164; 
 Thu, 22 Jul 2021 15:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210722014743.8377-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210722014743.8377-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 23 Jul 2021 06:20:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9qY2OruAQwtAp4L+dDmeyh0iVm_-Ongk9CfsRjZi-CwQ@mail.gmail.com>
Message-ID: <CAAOTY_9qY2OruAQwtAp4L+dDmeyh0iVm_-Ongk9CfsRjZi-CwQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: Fix cursor plane didn't update
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, seanpaul@chromium.org,
 David-YH.Chiu@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=882=
2=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=889:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The cursor plane should use the current plane state in atomic_async_updat=
e
> because it would not be the new plane state in the global atomic state
> since _swap_state happened when those hook are run.
>
> Fix cursor plane issue by below modification:
> 1. Remove plane_helper_funcs->atomic_update(plane, state) in
>    mtk_drm_crtc_async_update.
> 2. Add mtk_drm_update_new_state in to mtk_plane_atomic_async_update to
>    update the cursor plane by current plane state hook and update
>    others plane by the new_state.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state po=
inter")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>   Change in v4:
>   - Fix compile warning:
>     ../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:578:39: warning: unused
>     variable =E2=80=98plane_helper_funcs=E2=80=99 [-Wunused-variable
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  3 --
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++----------
>  2 files changed, 34 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 40df2c823187..515315505e3b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -532,13 +532,10 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crt=
c, struct drm_plane *plane,
>                                struct drm_atomic_state *state)
>  {
>         struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> -       const struct drm_plane_helper_funcs *plane_helper_funcs =3D
> -                       plane->helper_private;
>
>         if (!mtk_crtc->enabled)
>                 return;
>
> -       plane_helper_funcs->atomic_update(plane, state);
>         mtk_drm_crtc_update_config(mtk_crtc, false);
>  }
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index b5582dcf564c..e6dcb34d3052 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -110,6 +110,35 @@ static int mtk_plane_atomic_async_check(struct drm_p=
lane *plane,
>                                                    true, true);
>  }
>
> +static void mtk_plane_update_new_state(struct drm_plane_state *new_state=
,
> +                                      struct mtk_plane_state *mtk_plane_=
state)
> +{
> +       struct drm_framebuffer *fb =3D new_state->fb;
> +       struct drm_gem_object *gem;
> +       struct mtk_drm_gem_obj *mtk_gem;
> +       unsigned int pitch, format;
> +       dma_addr_t addr;
> +
> +       gem =3D fb->obj[0];
> +       mtk_gem =3D to_mtk_gem_obj(gem);
> +       addr =3D mtk_gem->dma_addr;
> +       pitch =3D fb->pitches[0];
> +       format =3D fb->format->format;
> +
> +       addr +=3D (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +       addr +=3D (new_state->src.y1 >> 16) * pitch;
> +
> +       mtk_plane_state->pending.enable =3D true;
> +       mtk_plane_state->pending.pitch =3D pitch;
> +       mtk_plane_state->pending.format =3D format;
> +       mtk_plane_state->pending.addr =3D addr;
> +       mtk_plane_state->pending.x =3D new_state->dst.x1;
> +       mtk_plane_state->pending.y =3D new_state->dst.y1;
> +       mtk_plane_state->pending.width =3D drm_rect_width(&new_state->dst=
);
> +       mtk_plane_state->pending.height =3D drm_rect_height(&new_state->d=
st);
> +       mtk_plane_state->pending.rotation =3D new_state->rotation;
> +}
> +
>  static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>                                           struct drm_atomic_state *state)
>  {
> @@ -126,8 +155,10 @@ static void mtk_plane_atomic_async_update(struct drm=
_plane *plane,
>         plane->state->src_h =3D new_state->src_h;
>         plane->state->src_w =3D new_state->src_w;
>         swap(plane->state->fb, new_state->fb);
> -       new_plane_state->pending.async_dirty =3D true;
>
> +       mtk_plane_update_new_state(new_state, new_plane_state);
> +       wmb(); /* Make sure the above parameters are set before update */
> +       new_plane_state->pending.async_dirty =3D true;
>         mtk_drm_crtc_async_update(new_state->crtc, plane, state);
>  }
>
> @@ -189,14 +220,8 @@ static void mtk_plane_atomic_update(struct drm_plane=
 *plane,
>         struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
>                                                                          =
  plane);
>         struct mtk_plane_state *mtk_plane_state =3D to_mtk_plane_state(ne=
w_state);
> -       struct drm_crtc *crtc =3D new_state->crtc;
> -       struct drm_framebuffer *fb =3D new_state->fb;
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
> @@ -204,24 +229,7 @@ static void mtk_plane_atomic_update(struct drm_plane=
 *plane,
>                 return;
>         }
>
> -       gem =3D fb->obj[0];
> -       mtk_gem =3D to_mtk_gem_obj(gem);
> -       addr =3D mtk_gem->dma_addr;
> -       pitch =3D fb->pitches[0];
> -       format =3D fb->format->format;
> -
> -       addr +=3D (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -       addr +=3D (new_state->src.y1 >> 16) * pitch;
> -
> -       mtk_plane_state->pending.enable =3D true;
> -       mtk_plane_state->pending.pitch =3D pitch;
> -       mtk_plane_state->pending.format =3D format;
> -       mtk_plane_state->pending.addr =3D addr;
> -       mtk_plane_state->pending.x =3D new_state->dst.x1;
> -       mtk_plane_state->pending.y =3D new_state->dst.y1;
> -       mtk_plane_state->pending.width =3D drm_rect_width(&new_state->dst=
);
> -       mtk_plane_state->pending.height =3D drm_rect_height(&new_state->d=
st);
> -       mtk_plane_state->pending.rotation =3D new_state->rotation;
> +       mtk_plane_update_new_state(new_state, mtk_plane_state);
>         wmb(); /* Make sure the above parameters are set before update */
>         mtk_plane_state->pending.dirty =3D true;
>  }
> --
> 2.18.0
>
