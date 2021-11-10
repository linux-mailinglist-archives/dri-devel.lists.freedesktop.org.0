Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300144CDFA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 00:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2946E872;
	Wed, 10 Nov 2021 23:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DC86E872
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 23:44:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB62661215
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 23:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636587877;
 bh=tNuTlrHWGE+Z0hSbDhzc5cC2P1bkOz1bdceXuc6tczY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DtmVzRXRi35OFVa+cDa59SuRmOgtFH4WTY9ggDf05OH/g0cJVLyrCtPlDELDuyjs4
 HPcIrFQW3kLicJJKo93X+6YNql2x+bXU2bd3DPp8vyV2VPqaVdUESjGp5CiAcfRGtg
 uQtsnW3f36AZq8xvuzt1rTEvxPqUnIEgnc8kv2WJZR42ya634MO4K6yx3r5phb7l07
 I21XC59ipPcpn+9sHUgJIX04SO3pp1xp7imU7u0/bGEJM8E92cRS2iARuiQd7qGimM
 e4eedgmBYY76pP/gId1+JzSCfGPzFkji6LyDfM6y5GctzOxZRkS7jEXGk65HkSrGEj
 DVM/o6D6b0ZsQ==
Received: by mail-ed1-f48.google.com with SMTP id b15so16835191edd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 15:44:37 -0800 (PST)
X-Gm-Message-State: AOAM533zdD1OVdDPImCetPtnbrfKGmLT3kD8jtGIqpKb7U0amEHVS7wi
 cQGZ+gmt3LWUZQceWHMOAz5EfXC5fLcYl5oiAw==
X-Google-Smtp-Source: ABdhPJxPM+iJrWweTxqkGYiKTC6CPQq+dea1dJwUYBTxgig+CXWzriyYaEuROEnaX87n0vMt/CBJIg772yACqw4SaE4=
X-Received: by 2002:a50:e608:: with SMTP id y8mr3901852edm.39.1636587876158;
 Wed, 10 Nov 2021 15:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-20-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-20-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 11 Nov 2021 07:44:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8OBL=btK8yHnn-_LDQS-_mCHDhFnZyPBrcNw2TnR_iog@mail.gmail.com>
Message-ID: <CAAOTY_8OBL=btK8yHnn-_LDQS-_mCHDhFnZyPBrcNw2TnR_iog@mail.gmail.com>
Subject: Re: [PATCH v7 19/20] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 301 ++++++++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   9 +-
>  4 files changed, 249 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index ea285795776f..25580106a2c4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -846,21 +846,28 @@ static int mtk_drm_crtc_init_comp_planes(struct drm=
_device *drm_dev,
>  }
>
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> -                       const enum mtk_ddp_comp_id *path, unsigned int pa=
th_len)
> +                       const enum mtk_ddp_comp_id *path, unsigned int pa=
th_len,
> +                       int priv_data_index)
>  {
>         struct mtk_drm_private *priv =3D drm_dev->dev_private;
>         struct device *dev =3D drm_dev->dev;
>         struct mtk_drm_crtc *mtk_crtc;
>         unsigned int num_comp_planes =3D 0;
> -       int pipe =3D priv->num_pipes;
>         int ret;
>         int i;
>         bool has_ctm =3D false;
>         uint gamma_lut_size =3D 0;
> +       struct drm_crtc *tmp;
> +       int crtc_i =3D 0;
>
>         if (!path)
>                 return 0;
>
> +       priv =3D priv->all_drm_private[priv_data_index];
> +
> +       drm_for_each_crtc(tmp, drm_dev)
> +               crtc_i++;
> +
>         for (i =3D 0; i < path_len; i++) {
>                 enum mtk_ddp_comp_id comp_id =3D path[i];
>                 struct device_node *node;
> @@ -872,7 +879,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 if (!node) {
>                         dev_info(dev,
>                                  "Not creating crtc %d because component =
%d is disabled or missing\n",
> -                                pipe, comp_id);
> +                                crtc_i, comp_id);
>                         return 0;
>                 }
>
> @@ -925,29 +932,28 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>
>         for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
>                 ret =3D mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, =
i,
> -                                                   pipe);
> +                                                   crtc_i);
>                 if (ret)
>                         return ret;
>         }
>
> -       ret =3D mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> +       ret =3D mtk_drm_crtc_init(drm_dev, mtk_crtc, crtc_i);
>         if (ret < 0)
>                 return ret;
>
>         if (gamma_lut_size)
>                 drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_s=
ize);
>         drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut=
_size);
> -       priv->num_pipes++;
>         mutex_init(&mtk_crtc->hw_lock);
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       i =3D (priv->data->mmsys_dev_num > 1) ? 0 : drm_crtc_index(&mtk_c=
rtc->base);

I think even though mmsys_dev_num > 1, each mmsys could have more than one =
crtc.

>         mtk_crtc->cmdq_client.client.dev =3D mtk_crtc->mmsys_dev;
>         mtk_crtc->cmdq_client.client.tx_block =3D false;
>         mtk_crtc->cmdq_client.client.knows_txdone =3D true;
>         mtk_crtc->cmdq_client.client.rx_callback =3D ddp_cmdq_cb;
>         mtk_crtc->cmdq_client.chan =3D
> -                       mbox_request_channel(&mtk_crtc->cmdq_client.clien=
t,
> -                                            drm_crtc_index(&mtk_crtc->ba=
se));
> +                       mbox_request_channel(&mtk_crtc->cmdq_client.clien=
t, i);
>         if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
>                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox client=
, writing register by CPU now\n",
>                         drm_crtc_index(&mtk_crtc->base));
> @@ -957,7 +963,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>         if (mtk_crtc->cmdq_client.chan) {
>                 ret =3D of_property_read_u32_index(priv->mutex_node,
>                                                  "mediatek,gce-events",
> -                                                drm_crtc_index(&mtk_crtc=
->base),
> +                                                i,
>                                                  &mtk_crtc->cmdq_event);
>                 if (ret) {
>                         dev_dbg(dev, "mtk_crtc %d failed to get mediatek,=
gce-events property\n",
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.h
> index cb9a36c48d4f..a57eb12d7c05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
> @@ -17,7 +17,8 @@
>  void mtk_drm_crtc_commit(struct drm_crtc *crtc);
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                         const enum mtk_ddp_comp_id *path,
> -                       unsigned int path_len);
> +                       unsigned int path_len,
> +                       int priv_data_index);
>  int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *pl=
ane,
>                              struct mtk_plane_state *state);
>  void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *=
plane,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 274a5bb10851..eedf10ed30c8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -196,6 +196,8 @@ static const struct mtk_mmsys_driver_data mt2701_mmsy=
s_driver_data =3D {
>         .ext_path =3D mt2701_mtk_ddp_ext,
>         .ext_len =3D ARRAY_SIZE(mt2701_mtk_ddp_ext),
>         .shadow_register =3D true,
> +       .mmsys_id =3D 0,

global variable is initialized to zero, so remove this.

> +       .mmsys_dev_num =3D 1,
>  };
>

[snip]

> +
> +static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int=
 comp_id)
> +{
> +       const struct mtk_mmsys_driver_data *drv_data =3D private->data;
> +       int i;
> +
> +       if (drv_data->mmsys_dev_num =3D=3D 1)
> +               return true;
> +
> +       if (drv_data->main_path)
> +               for (i =3D 0; i < drv_data->main_len; i++)
> +                       if (drv_data->main_path[i] =3D=3D comp_id)
> +                               return true;
> +
> +       if (drv_data->ext_path)
> +               for (i =3D 0; i < drv_data->ext_len; i++)
> +                       if (drv_data->ext_path[i] =3D=3D comp_id)
> +                               return true;
> +
> +       if (drv_data->third_path)
> +               for (i =3D 0; i < drv_data->third_len; i++)
> +                       if (drv_data->third_path[i] =3D=3D comp_id)
> +                               return true;
> +
> +       return false;
> +}
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>         struct mtk_drm_private *private =3D drm->dev_private;
> +       struct mtk_drm_private *priv_n;
>         struct platform_device *pdev;
> -       struct device_node *np;
> +       struct device_node *np =3D NULL;
>         struct device *dma_dev;
> -       int ret;
> -
> -       if (!iommu_present(&platform_bus_type))
> -               return -EPROBE_DEFER;
> -
> -       pdev =3D of_find_device_by_node(private->mutex_node);
> -       if (!pdev) {
> -               dev_err(drm->dev, "Waiting for disp-mutex device %pOF\n",
> -                       private->mutex_node);
> -               of_node_put(private->mutex_node);
> -               return -EPROBE_DEFER;
> -       }
> -       private->mutex_dev =3D &pdev->dev;
> +       int ret, i, j;
>
>         ret =3D drmm_mode_config_init(drm);
>         if (ret)
> @@ -283,33 +384,57 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         drm->mode_config.funcs =3D &mtk_drm_mode_config_funcs;
>         drm->mode_config.helper_private =3D &mtk_drm_mode_config_helpers;
>
> -       ret =3D component_bind_all(drm->dev, drm);
> -       if (ret)
> -               goto put_mutex_dev;
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> +               drm->dev_private =3D private->all_drm_private[i];
> +               ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
> +               if (ret)
> +                       goto put_mutex_dev;
> +       }
>
>         /*
>          * We currently support two fixed data streams, each optional,
>          * and each statically assigned to a crtc:
>          * OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0 ...
>          */
> -       ret =3D mtk_drm_crtc_create(drm, private->data->main_path,
> -                                 private->data->main_len);
> -       if (ret < 0)
> -               goto err_component_unbind;
> -       /* ... and OVL1 -> COLOR1 -> GAMMA -> RDMA1 -> DPI0. */
> -       ret =3D mtk_drm_crtc_create(drm, private->data->ext_path,
> -                                 private->data->ext_len);
> -       if (ret < 0)
> -               goto err_component_unbind;
> -
> -       ret =3D mtk_drm_crtc_create(drm, private->data->third_path,
> -                                 private->data->third_len);
> -       if (ret < 0)
> -               goto err_component_unbind;
> +       for (i =3D 0; i < MAX_CRTC; i++) {

I think the i-for-loop is redundant.

> +               for (j =3D 0; j < private->data->mmsys_dev_num; j++) {
> +                       priv_n =3D private->all_drm_private[j];
> +
> +                       if (i =3D=3D 0 && priv_n->data->main_len) {
> +                               ret =3D mtk_drm_crtc_create(drm, priv_n->=
data->main_path,
> +                                                         priv_n->data->m=
ain_len, j);
> +                               if (ret)
> +                                       goto err_component_unbind;
> +
> +                               if (!np)
> +                                       np =3D priv_n->comp_node[priv_n->=
data->main_path[0]];
> +
> +                               continue;
> +                       } else if (i =3D=3D 1 && priv_n->data->ext_len) {
> +                               ret =3D mtk_drm_crtc_create(drm, priv_n->=
data->ext_path,
> +                                                         priv_n->data->e=
xt_len, j);
> +                               if (ret)
> +                                       goto err_component_unbind;
> +
> +                               if (!np)
> +                                       np =3D priv_n->comp_node[priv_n->=
data->ext_path[0]];
> +
> +                               continue;
> +                       } else if (i =3D=3D 2 && priv_n->data->third_len)=
 {
> +                               ret =3D mtk_drm_crtc_create(drm, priv_n->=
data->third_path,
> +                                                         priv_n->data->t=
hird_len, j);
> +                               if (ret)
> +                                       goto err_component_unbind;
> +
> +                               if (!np)
> +                                       np =3D priv_n->comp_node[priv_n->=
data->third_path[0]];

Here assume that all mmsys use the same iommu (maybe in some SoC each
mmsys use different iommu), so add comment for this.

> +
> +                               continue;
> +                       }
> +               }
> +       }
>
>         /* Use OVL device for all DMA memory allocations */
> -       np =3D private->comp_node[private->data->main_path[0]] ?:
> -            private->comp_node[private->data->ext_path[0]];
>         pdev =3D of_find_device_by_node(np);
>         if (!pdev) {
>                 ret =3D -ENODEV;
> @@ -318,7 +443,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         }
>
>         dma_dev =3D &pdev->dev;
> -       private->dma_dev =3D dma_dev;
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> +               private->all_drm_private[i]->dma_dev =3D dma_dev;
>
>         /*
>          * Configure the DMA segment size to make sure we get contiguous =
IOVA
> @@ -340,9 +466,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         return 0;
>
>  err_component_unbind:
> -       component_unbind_all(drm->dev, drm);
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> +               component_unbind_all(private->all_drm_private[i]->dev, dr=
m);
>  put_mutex_dev:
> -       put_device(private->mutex_dev);
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> +               put_device(private->all_drm_private[i]->mutex_dev);
> +
>         return ret;
>  }
>
> @@ -395,15 +524,36 @@ static int compare_of(struct device *dev, void *dat=
a)
>  static int mtk_drm_bind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> +       struct platform_device *pdev;
>         struct drm_device *drm;
> -       int ret;
> +       int ret, i;
> +
> +       if (!iommu_present(&platform_bus_type))
> +               return -EPROBE_DEFER;
> +
> +       pdev =3D of_find_device_by_node(private->mutex_node);
> +       if (!pdev) {
> +               dev_err(dev, "Waiting for disp-mutex device %pOF\n",
> +                       private->mutex_node);
> +               of_node_put(private->mutex_node);
> +               return -EPROBE_DEFER;
> +       }
> +
> +       private->mutex_dev =3D &pdev->dev;
> +       private->mtk_drm_bound =3D true;
> +       private->dev =3D dev;
> +
> +       if (!mtk_drm_get_all_drm_priv(dev))
> +               return 0;
>
>         drm =3D drm_dev_alloc(&mtk_drm_driver, dev);
>         if (IS_ERR(drm))
>                 return PTR_ERR(drm);
>
> -       drm->dev_private =3D private;
> -       private->drm =3D drm;
> +       private->drm_master =3D true;
> +               drm->dev_private =3D private;

indent.

> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> +               private->all_drm_private[i]->drm =3D drm;
>
>         ret =3D mtk_drm_kms_init(drm);
>         if (ret < 0)
> @@ -428,10 +578,14 @@ static void mtk_drm_unbind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
>
> -       drm_dev_unregister(private->drm);
> -       mtk_drm_kms_deinit(private->drm);
> -       drm_dev_put(private->drm);
> -       private->num_pipes =3D 0;
> +       /* for multi mmsys dev, unregister drm dev in mmsys master */
> +       if (private->data->mmsys_id =3D=3D 0) {

The master mmsys register drm device, why mmsys 0 unregister drm device?

> +               drm_dev_unregister(private->drm);
> +               mtk_drm_kms_deinit(private->drm);
> +               drm_dev_put(private->drm);
> +       }
> +       private->mtk_drm_bound =3D false;
> +       private->drm_master =3D false;
>         private->drm =3D NULL;
>  }
>
> @@ -546,54 +700,40 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
s[] =3D {
>         { }
>  };
>
> -static const struct of_device_id mtk_drm_of_ids[] =3D {
> -       { .compatible =3D "mediatek,mt2701-mmsys",
> -         .data =3D &mt2701_mmsys_driver_data},
> -       { .compatible =3D "mediatek,mt7623-mmsys",
> -         .data =3D &mt7623_mmsys_driver_data},
> -       { .compatible =3D "mediatek,mt2712-mmsys",
> -         .data =3D &mt2712_mmsys_driver_data},
> -       { .compatible =3D "mediatek,mt8167-mmsys",
> -         .data =3D &mt8167_mmsys_driver_data},
> -       { .compatible =3D "mediatek,mt8173-mmsys",
> -         .data =3D &mt8173_mmsys_driver_data},
> -       { .compatible =3D "mediatek,mt8183-mmsys",
> -         .data =3D &mt8183_mmsys_driver_data},
> -       { .compatible =3D "mediatek,mt8192-mmsys",
> -         .data =3D &mt8192_mmsys_driver_data},
> -       {.compatible =3D "mediatek,mt8195-vdosys0",
> -         .data =3D &mt8195_vdosys0_driver_data},
> -       { }
> -};
> -MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> -
>  static int mtk_drm_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct device_node *phandle =3D dev->parent->of_node;
>         const struct of_device_id *of_id;
> +       const struct mtk_mmsys_driver_data *drv_data;
>         struct mtk_drm_private *private;
>         struct device_node *node;
>         struct component_match *match =3D NULL;
>         int ret;
>         int i;
>
> +       of_id =3D of_match_node(mtk_drm_of_ids, phandle);
> +       if (!of_id)
> +               return -ENODEV;
> +
> +       drv_data =3D of_id->data;
>         private =3D devm_kzalloc(dev, sizeof(*private), GFP_KERNEL);
>         if (!private)
>                 return -ENOMEM;
>
> +       private->all_drm_private =3D devm_kmalloc_array(dev, drv_data->mm=
sys_dev_num,
> +                                                     sizeof(*private->al=
l_drm_private),
> +                                                     GFP_KERNEL);
> +       if (!private->all_drm_private)
> +               return -ENOMEM;
> +
> +       private->data =3D drv_data;
>         private->mmsys_dev =3D dev->parent;
>         if (!private->mmsys_dev) {
>                 dev_err(dev, "Failed to get MMSYS device\n");
>                 return -ENODEV;
>         }
>
> -       of_id =3D of_match_node(mtk_drm_of_ids, phandle);
> -       if (!of_id)
> -               return -ENODEV;
> -
> -       private->data =3D of_id->data;
> -
>         /* Iterate over sibling DISP function blocks */
>         for_each_child_of_node(phandle->parent, node) {
>                 const struct of_device_id *of_id;
> @@ -613,7 +753,13 @@ static int mtk_drm_probe(struct platform_device *pde=
v)
>                 comp_type =3D (enum mtk_ddp_comp_type)of_id->data;
>
>                 if (comp_type =3D=3D MTK_DISP_MUTEX) {
> -                       private->mutex_node =3D of_node_get(node);
> +                       int id;
> +
> +                       id =3D of_alias_get_id(node, "mutex");
> +                       if (id < 0 || id =3D=3D drv_data->mmsys_id) {
> +                               private->mutex_node =3D of_node_get(node)=
;
> +                               dev_dbg(dev, "get mutex for mmsys %d", dr=
v_data->mmsys_id);
> +                       }
>                         continue;
>                 }
>
> @@ -624,6 +770,9 @@ static int mtk_drm_probe(struct platform_device *pdev=
)
>                         continue;
>                 }
>
> +               if (!mtk_drm_find_mmsys_comp(private, comp_id))
> +                       continue;

Without this, this patch still work. So remove this. If you still want
this modification, separate this to another patch.

Regards,
Chun-Kuang.

> +
>                 private->comp_node[comp_id] =3D of_node_get(node);
>
>                 /*
