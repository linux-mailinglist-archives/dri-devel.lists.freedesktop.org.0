Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C743B689
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 18:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E457C6E45E;
	Tue, 26 Oct 2021 16:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7256E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 16:08:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23B8860EB9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635264535;
 bh=Uom6JTuB1T9mF85Ubvl+BCQkr9Ye2Y4J6tm8ytyOLfA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CiOX3kW69cAqJYpNhbpWuBGp2t19WMOIyxeRDv/bLchYQnhuENewjyHjHNXKEpwFU
 92E/5UieuZKwzWv+25+ZuprC5k6VR7MasLGBLuk2gFIENJWQh73ZKzwFcc9UkaWB4S
 eyGux1lVmPM85ZYOF98jNvrt7icZRCzCVuuAfKTX1LgBDqYRRtVnvWeJtkxdBaW7HI
 2pYIJxhdw8QJ+yaSXmxLWVddNnvtszytBRNOV52V68ux9n21zTm7dMySZ3VyQiZv0R
 xDfwCWFSD7kqrkKKjq8gGfGQfaisJ2tYby1GBNmsVg36ZfI6oG8pkK3F0HCCkpyLGw
 11LVZxaSJljuA==
Received: by mail-ed1-f49.google.com with SMTP id r4so15199136edi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 09:08:55 -0700 (PDT)
X-Gm-Message-State: AOAM532Sq2CvIv7xMZNUROH8mwqC3HoVe0VN+NtxcM1CrnXWS/UPbdAh
 XhVuTCsChb6B3+JqdbkkNiSemCz7jHkPbVYwsQ==
X-Google-Smtp-Source: ABdhPJxOLToyPwhwzdlyGfUkcXJEwBavFs7qu4ccygIjvdd9wX2OyaXuBNvIS2wi5FVb1Nw39Qe2iv8sH9p7qV//kMw=
X-Received: by 2002:a17:906:c7c1:: with SMTP id
 dc1mr32196944ejb.6.1635264327509; 
 Tue, 26 Oct 2021 09:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-5-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 27 Oct 2021 00:05:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9UfPVTz2hAdykfKJqKA4GYg2ORnWfg_MJVSnrZ40UDBA@mail.gmail.com>
Message-ID: <CAAOTY_9UfPVTz2hAdykfKJqKA4GYg2ORnWfg_MJVSnrZ40UDBA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/mediatek: Add cmdq_handle in mtk_crtc
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=88=
26=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:29=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> One mtk_crtc need just one cmdq_handle, so add one cmdq_handle
> in mtk_crtc to prevent frequently allocation and free of
> cmdq_handle.
>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 64 +++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index dad1f85ee315..31f05efc1bc0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -53,6 +53,7 @@ struct mtk_drm_crtc {
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         struct cmdq_client              cmdq_client;
> +       struct cmdq_pkt                 cmdq_handle;
>         u32                             cmdq_event;
>         u32                             cmdq_vblank_cnt;
>  #endif
> @@ -107,12 +108,59 @@ static void mtk_drm_finish_page_flip(struct mtk_drm=
_crtc *mtk_crtc)
>         }
>  }
>
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cm=
dq_pkt *pkt,
> +                                  size_t size)
> +{
> +       struct device *dev;
> +       dma_addr_t dma_addr;
> +
> +       pkt->va_base =3D kzalloc(size, GFP_KERNEL);
> +       if (!pkt->va_base) {
> +               kfree(pkt);
> +               return -ENOMEM;
> +       }
> +       pkt->buf_size =3D size;
> +       pkt->cl =3D (void *)client;
> +
> +       dev =3D client->chan->mbox->dev;
> +       dma_addr =3D dma_map_single(dev, pkt->va_base, pkt->buf_size,
> +                                 DMA_TO_DEVICE);
> +       if (dma_mapping_error(dev, dma_addr)) {
> +               dev_err(dev, "dma map failed, size=3D%u\n", (u32)(u64)siz=
e);
> +               kfree(pkt->va_base);
> +               kfree(pkt);
> +               return -ENOMEM;
> +       }
> +
> +       pkt->pa_base =3D dma_addr;
> +
> +       return 0;
> +}
> +
> +static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> +{
> +       struct cmdq_client *client =3D (struct cmdq_client *)pkt->cl;
> +
> +       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_=
size,
> +                        DMA_TO_DEVICE);
> +       kfree(pkt->va_base);
> +       kfree(pkt);
> +}
> +#endif
> +
>  static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
>  {
>         struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
>
>         mtk_mutex_put(mtk_crtc->mutex);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
>
> +       if (mtk_crtc->cmdq_client.chan)

This is not related to this patch, so move to an independent patch.

Regards,
Chun-Kuang.

> +               mbox_free_channel(mtk_crtc->cmdq_client.chan);
> +                                 mtk_crtc->cmdq_client.chan =3D NULL;
> +#endif
>         drm_crtc_cleanup(crtc);
>  }
>
> @@ -227,12 +275,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(str=
uct drm_crtc *crtc,
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
> -       struct cmdq_cb_data *data =3D mssg;
>         struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmdq_clie=
nt, client);
>         struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, struct mt=
k_drm_crtc, cmdq_client);
>
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
> -       cmdq_pkt_destroy(data->pkt);
>  }
>  #endif
>
> @@ -438,7 +484,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm=
_crtc *mtk_crtc,
>                                        bool needs_vblank)
>  {
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       struct cmdq_pkt *cmdq_handle;
> +       struct cmdq_pkt *cmdq_handle =3D &mtk_crtc->cmdq_handle;
>  #endif
>         struct drm_crtc *crtc =3D &mtk_crtc->base;
>         struct mtk_drm_private *priv =3D crtc->dev->dev_private;
> @@ -478,7 +524,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm=
_crtc *mtk_crtc,
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         if (mtk_crtc->cmdq_client.chan) {
>                 mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
> -               cmdq_handle =3D cmdq_pkt_create(&mtk_crtc->cmdq_client, P=
AGE_SIZE);
> +               cmdq_handle->cmd_buf_size =3D 0;
>                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>                 mtk_crtc_ddp_config(crtc, cmdq_handle);
> @@ -877,6 +923,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                                 drm_crtc_index(&mtk_crtc->base));
>                         mbox_free_channel(mtk_crtc->cmdq_client.chan);
>                         mtk_crtc->cmdq_client.chan =3D NULL;
> +               } else {
> +                       ret =3D mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_c=
lient,
> +                                                     &mtk_crtc->cmdq_han=
dle,
> +                                                     PAGE_SIZE);
> +                       if (ret) {
> +                               dev_dbg(dev, "mtk_crtc %d failed to creat=
e cmdq packet\n",
> +                                       drm_crtc_index(&mtk_crtc->base));
> +                               mbox_free_channel(mtk_crtc->cmdq_client.c=
han);
> +                               mtk_crtc->cmdq_client.chan =3D NULL;
> +                       }
>                 }
>         }
>  #endif
> --
> 2.18.0
>
