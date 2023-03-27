Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C46CA912
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 17:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F354D10E129;
	Mon, 27 Mar 2023 15:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85410E129
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:32:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0B7661333
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3203C433AC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679931147;
 bh=f/2piHpw3ZnrfqbQuVx2e9zDHBO/3jdQSMgOHr7fUgI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Uf7haOZlNKZwY496KgXr8ZjlaSRrfAV++oWbg76seCtszHHlgU1C1ncye4Qk/V2kz
 StEQf1XMyZwTOZ/cnqDbnLJBTooVJ2t2QnaFNeYpIsrT8Oiwgs2t8LijpOjuPl5FCz
 wi+uXl2N9FXMOxxNp3Saizfkp0Vw0EvdBmv0NR2ZkTTbbi/QTnYwhoHpPOzn6AhfK5
 aM1iGYvK++y4XO7Pzxh/jUsKut53pMYajBadWckTRzZG34diyNKmek1Y1cQrIjT2Hw
 /CFI1AoZLOOeRzn6oxii8F19hLdy7PuKHIEmuZWBxKQypuPz5l2TncjN8Eu5njsu1j
 UTJZdnD20aNtw==
Received: by mail-lf1-f51.google.com with SMTP id g17so11996212lfv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 08:32:27 -0700 (PDT)
X-Gm-Message-State: AAQBX9fzoALAU7LT1BRx2+mTfbnKx6EnO7Zo7hBhHeF178R5FNq6ErJh
 T3q4TRpLdqFBlybvGzJTGqGoxvaJzdM+G5Qm5Q==
X-Google-Smtp-Source: AKy350bW5rYVHuil7fmrbkaSQdUyszcMFvxLxlLqTRSqGk5pqC/YLdf2j3t3MtlGs7578J55uH+BYxLmKoEt/9tHeRM=
X-Received: by 2002:a19:7419:0:b0:4d8:62e5:4f66 with SMTP id
 v25-20020a197419000000b004d862e54f66mr3484970lfe.7.1679931145672; Mon, 27 Mar
 2023 08:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
In-Reply-To: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 27 Mar 2023 23:32:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY__w650cboh38Ptgeq8_smev36-xqzjhFmx9kaBAVMGg_Q@mail.gmail.com>
Message-ID: <CAAOTY__w650cboh38Ptgeq8_smev36-xqzjhFmx9kaBAVMGg_Q@mail.gmail.com>
Subject: Re: [v3,
 PATCH] drm/mediatek: add dma buffer control for drm plane disable
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=
=8820=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:05=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Fixes: 41016fe1028e4 (drm: Rename plane->state variables in atomic update=
 and disable)

[1] has introduction how to add Fixes tag, one information is:

please use the =E2=80=98Fixes:=E2=80=99 tag with the first 12 characters of=
 the SHA-1
ID, and the one line summary. Do not split the tag across multiple
lines, tags are exempt from the =E2=80=9Cwrap at 75 columns=E2=80=9D rule i=
n order to
simplify parsing scripts.

And move this tag to the line before your sign-off tag.

[1] https://www.kernel.org/doc/html/v6.2/process/submitting-patches.html


> dma buffer release before overlay disable, that will cause
> m4u translation fault warning.
>
> add dma buffer control flow in mediatek driver:
> get dma buffer when drm plane disable
> put dma buffer when overlay really disable
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 25 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 17 ++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  1 +
>  3 files changed, 43 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 5071f1263216..9cf1c1778868 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/mailbox_controller.h>
>  #include <linux/pm_runtime.h>
> @@ -282,6 +283,23 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(stru=
ct drm_crtc *crtc,
>         return NULL;
>  }
>
> +static void mtk_drm_dma_buf_put(struct mtk_drm_crtc *mtk_crtc)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +               struct drm_plane *plane =3D &mtk_crtc->planes[i];
> +               struct mtk_plane_state *plane_state;
> +
> +               plane_state =3D to_mtk_plane_state(plane->state);
> +
> +               if (plane_state && plane_state->pending.dma_buf) {
> +                       dma_buf_put(plane_state->pending.dma_buf);
> +                       plane_state->pending.dma_buf =3D NULL;
> +               }
> +       }
> +}
> +
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
> @@ -322,6 +340,8 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void =
*mssg)
>                 mtk_crtc->pending_async_planes =3D false;
>         }
>
> +       mtk_drm_dma_buf_put(mtk_crtc);
> +
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
>         wake_up(&mtk_crtc->cb_blocking_queue);
>  }
> @@ -614,9 +634,14 @@ static void mtk_crtc_ddp_irq(void *data)
>         else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank=
_cnt =3D=3D 0)
>                 DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
>                           drm_crtc_index(&mtk_crtc->base));
> +
> +       if (!mtk_crtc->cmdq_client.chan)
> +               mtk_drm_dma_buf_put(mtk_crtc);
>  #else
>         if (!priv->data->shadow_register)
>                 mtk_crtc_ddp_config(crtc, NULL);
> +
> +       mtk_drm_dma_buf_put(mtk_crtc);
>  #endif
>         mtk_drm_finish_page_flip(mtk_crtc);
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index d54fbf34b000..c169ca49129c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <linux/align.h>
> +#include <linux/dma-buf.h>
>
>  #include "mtk_drm_crtc.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -280,6 +281,22 @@ static void mtk_plane_atomic_disable(struct drm_plan=
e *plane,
>         struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
>                                                                          =
  plane);
>         struct mtk_plane_state *mtk_plane_state =3D to_mtk_plane_state(ne=
w_state);
> +       struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> +                                                                        =
  plane);
> +
> +       if (old_state && old_state->fb) {
> +               struct drm_gem_object *gem =3D old_state->fb->obj[0];
> +
> +               if (mtk_plane_state->pending.dma_buf) {

When this happen, the pending.dma_buf is still accessed by OVL, right?
So you free this buffer and m4u translation fault occur.

Regards,
Chun-Kuang.

> +                       dma_buf_put(mtk_plane_state->pending.dma_buf);
> +                       mtk_plane_state->pending.dma_buf =3D NULL;
> +               }
> +
> +               if (gem && gem->dma_buf) {
> +                       get_dma_buf(gem->dma_buf);
> +                       mtk_plane_state->pending.dma_buf =3D gem->dma_buf=
;
> +               }
> +       }
>         mtk_plane_state->pending.enable =3D false;
>         wmb(); /* Make sure the above parameter is set before update */
>         mtk_plane_state->pending.dirty =3D true;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.h
> index 8f39011cdbfc..b724e56b7283 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -33,6 +33,7 @@ struct mtk_plane_pending_state {
>         bool                            async_dirty;
>         bool                            async_config;
>         enum drm_color_encoding         color_encoding;
> +       struct dma_buf                  *dma_buf;
>  };
>
>  struct mtk_plane_state {
> --
> 2.25.1
>
