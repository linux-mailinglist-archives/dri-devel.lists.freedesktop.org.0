Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A643B630
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4181089C29;
	Tue, 26 Oct 2021 15:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E6F89C29
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:55:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F17BC610A1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635263758;
 bh=NGSch2WtYB3nDlQ/+9YEqgDLoXEDKMRu/wdD8415fBY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FlSVQ3SIbW3N4ycPWKYZpfq+rek/flxAZQMYHr1rdAJOBv1DzeA1/NNChbJzxDVof
 Uw9TqXZ0fXUSE/zavPFugXDKwLDtNUppuBzeirSG2K1x/3sAHqpfmu4ZDXVr3NkNpf
 6KWRuU8EomZ5rP20n/YPR2guyPiTIimNOWiqXOdOUBArftWfhXy3RfkolegECZhXG5
 uVCi81HAtY1IGbfoy7g2nEwBBzi8OcSl/cxoiyrHDTRm5c2Br87G++zpAJafnfBFiF
 H86aM2OmnsAyUv7QFKwekfiIGBZGjaiguim/dTS1Gtu3/Wih0TeafcAXK47HKKwnA6
 khxj4cdMi3k0w==
Received: by mail-ed1-f52.google.com with SMTP id r4so15076258edi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 08:55:57 -0700 (PDT)
X-Gm-Message-State: AOAM530YTzoqOLVbzlIqLPNhU9bbJabqGeF2LYzhhm5hq9pGjYg+WDy7
 /eOk2YycEZshOvtu4A8VOXK49XAPus1Tw2BUzA==
X-Google-Smtp-Source: ABdhPJzgqVCWXT+M41aSMPpOJ3v17st31iPfPukH3+SRVrfDKy8AVSdPsaimk9diarnRpFFsF7bEkw5S9zvp3XNpVJA=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr22764187edu.357.1635263560041; 
 Tue, 26 Oct 2021 08:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 26 Oct 2021 23:52:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-=JhEzK0UT3qVScLWh75LTr9K3VFJhJ6Zs_nuM0kmBXw@mail.gmail.com>
Message-ID: <CAAOTY_-=JhEzK0UT3qVScLWh75LTr9K3VFJhJ6Zs_nuM0kmBXw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/mediatek: Remove the pointer of struct
 cmdq_client
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
> In mailbox rx_callback, it pass struct mbox_client to callback
> function, but it could not map back to mtk_drm_crtc instance
> because struct cmdq_client use a pointer to struct mbox_client:
>
> struct cmdq_client {
>         struct mbox_client client;
>         struct mbox_chan *chan;
> };
>
> struct mtk_drm_crtc {
>         /* client instance data */
>         struct cmdq_client *cmdq_client;
> };
>
> so remove the pointer of struct cmdq_client and let mtk_drm_crtc
> instance define cmdq_client as:
>
> struct mtk_drm_crtc {
>         /* client instance data */
>         struct cmdq_client cmdq_client;
> };
>
> and in rx_callback function, use struct mbox_client to get
> struct mtk_drm_crtc.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 37 +++++++++++++------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 369d3e68c0b6..e23e3224ac67 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -52,7 +52,7 @@ struct mtk_drm_crtc {
>         bool                            pending_async_planes;
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       struct cmdq_client              *cmdq_client;
> +       struct cmdq_client              cmdq_client;
>         u32                             cmdq_event;
>  #endif
>
> @@ -472,19 +472,19 @@ static void mtk_drm_crtc_update_config(struct mtk_d=
rm_crtc *mtk_crtc,
>                 mtk_mutex_release(mtk_crtc->mutex);
>         }
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       if (mtk_crtc->cmdq_client) {
> -               mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
> -               cmdq_handle =3D cmdq_pkt_create(mtk_crtc->cmdq_client, PA=
GE_SIZE);
> +       if (mtk_crtc->cmdq_client.chan) {
> +               mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
> +               cmdq_handle =3D cmdq_pkt_create(&mtk_crtc->cmdq_client, P=
AGE_SIZE);
>                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>                 mtk_crtc_ddp_config(crtc, cmdq_handle);
>                 cmdq_pkt_finalize(cmdq_handle);
> -               dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->m=
box->dev,
> +               dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mb=
ox->dev,
>                                            cmdq_handle->pa_base,
>                                            cmdq_handle->cmd_buf_size,
>                                            DMA_TO_DEVICE);
> -               mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handl=
e);
> -               mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
> +               mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle=
);
> +               mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
>  #endif
>         mtk_crtc->config_updating =3D false;
> @@ -498,7 +498,7 @@ static void mtk_crtc_ddp_irq(void *data)
>         struct mtk_drm_private *priv =3D crtc->dev->dev_private;
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
> +       if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
>  #else
>         if (!priv->data->shadow_register)
>  #endif
> @@ -838,17 +838,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>         mutex_init(&mtk_crtc->hw_lock);
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       mtk_crtc->cmdq_client =3D
> -                       cmdq_mbox_create(mtk_crtc->mmsys_dev,
> -                                        drm_crtc_index(&mtk_crtc->base))=
;
> -       if (IS_ERR(mtk_crtc->cmdq_client)) {
> +       mtk_crtc->cmdq_client.client.dev =3D mtk_crtc->mmsys_dev;
> +       mtk_crtc->cmdq_client.client.tx_block =3D false;
> +       mtk_crtc->cmdq_client.client.knows_txdone =3D true;
> +       mtk_crtc->cmdq_client.client.rx_callback =3D ddp_cmdq_cb;
> +       mtk_crtc->cmdq_client.chan =3D
> +                       mbox_request_channel(&mtk_crtc->cmdq_client.clien=
t,
> +                                            drm_crtc_index(&mtk_crtc->ba=
se));
> +       if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
>                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox client=
, writing register by CPU now\n",
>                         drm_crtc_index(&mtk_crtc->base));
> -               mtk_crtc->cmdq_client =3D NULL;
> +               mtk_crtc->cmdq_client.chan =3D NULL;
>         }
>
> -       if (mtk_crtc->cmdq_client) {
> -               mtk_crtc->cmdq_client->client.rx_callback =3D ddp_cmdq_cb=
;
> +       if (mtk_crtc->cmdq_client.chan) {
>                 ret =3D of_property_read_u32_index(priv->mutex_node,
>                                                  "mediatek,gce-events",
>                                                  drm_crtc_index(&mtk_crtc=
->base),
> @@ -856,8 +859,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 if (ret) {
>                         dev_dbg(dev, "mtk_crtc %d failed to get mediatek,=
gce-events property\n",
>                                 drm_crtc_index(&mtk_crtc->base));
> -                       cmdq_mbox_destroy(mtk_crtc->cmdq_client);
> -                       mtk_crtc->cmdq_client =3D NULL;
> +                       mbox_free_channel(mtk_crtc->cmdq_client.chan);
> +                       mtk_crtc->cmdq_client.chan =3D NULL;
>                 }
>         }
>  #endif
> --
> 2.18.0
>
