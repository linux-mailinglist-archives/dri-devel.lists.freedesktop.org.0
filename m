Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B7241BB8A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 02:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DE96E12D;
	Wed, 29 Sep 2021 00:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2066E12D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 00:03:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D420A613D2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 00:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632873839;
 bh=qWhkqBZVgSHtDEpze9jE34E6bXc8uxiFOFpsTvVxrNI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k0K0CPn5TQqmXoHrlOZht9f7YSdCAzbqJon9pYC0hkScqjpcnB5Sr+sQt+FaXLVwp
 +BRMxGwY07Pg+UzU8rV+PCLixZaaKpeTGwtGg3oWqsWNqKspRSw94sRF1Yu98AzxPO
 7Eaa/D7duW2AHiu0nMjlNjjJ2joHM07idlgsnpb1Mm/HoBeB4ldmN1RJjzjsgnTUWR
 m/579hp+LWqn6pL8iUdMbyy0l2m3fm1p8LGjf9mbiUyyjLlut3frCd8sbiLIkHP/qP
 6Ty8JBCVZp6uA7Heayx5Sb26wz82TKaU8P5kyD2ZYutUXfiGakxn1ghxQt6cibRqEa
 15+0d2nosgoHg==
Received: by mail-ed1-f54.google.com with SMTP id x7so1649125edd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 17:03:58 -0700 (PDT)
X-Gm-Message-State: AOAM530L0bH3L9Hmr/fPhhOYM2vQHbGr63zmAucvCskUJYslKrtglRXX
 dcxV0Hp+5yBegsH2suHAKVlshTci4wFswXj0qQ==
X-Google-Smtp-Source: ABdhPJySt9j9jFtSgXZi19FMjZshtB+6gVSjl1NRmTeFYFa9inwBTCEcsUiSfWPjtpHSEgKpAUR4G4cyAkhyrEf/6q0=
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr11395549edx.224.1632873837106; 
 Tue, 28 Sep 2021 17:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-16-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-16-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 08:03:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9hKtkOBxw4-Gn87Zyiy8Ten6d2N+q5jx_r6hykSgOzmg@mail.gmail.com>
Message-ID: <CAAOTY_9hKtkOBxw4-Gn87Zyiy8Ten6d2N+q5jx_r6hykSgOzmg@mail.gmail.com>
Subject: Re: [PATCH v5 15/16] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The first bind drm driver
> will allocate the drm device, and the last bind drm driver registers
> the drm device to drm core. Each crtc path is created with the
> corresponding drm driver data.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  25 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 360 +++++++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   8 +-
>  4 files changed, 320 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 474efb844249..68cb15c38c3f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -737,21 +737,28 @@ static int mtk_drm_crtc_init_comp_planes(struct drm=
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
> @@ -760,7 +767,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 if (!node) {
>                         dev_info(dev,
>                                  "Not creating crtc %d because component =
%d is disabled or missing\n",
> -                                pipe, comp_id);
> +                                crtc_i, comp_id);
>                         return 0;
>                 }
>         }
> @@ -816,25 +823,25 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
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
> +
>         mtk_crtc->cmdq_client =3D
> -                       cmdq_mbox_create(mtk_crtc->mmsys_dev,
> -                                        drm_crtc_index(&mtk_crtc->base))=
;
> +                       cmdq_mbox_create(mtk_crtc->mmsys_dev, i);
>         if (IS_ERR(mtk_crtc->cmdq_client)) {
>                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox client=
, writing register by CPU now\n",
>                         drm_crtc_index(&mtk_crtc->base));
> @@ -844,7 +851,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>         if (mtk_crtc->cmdq_client) {
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
> index ae8df7ecc872..782c791b368e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -166,6 +166,8 @@ static const struct mtk_mmsys_driver_data mt2701_mmsy=
s_driver_data =3D {
>         .ext_path =3D mt2701_mtk_ddp_ext,
>         .ext_len =3D ARRAY_SIZE(mt2701_mtk_ddp_ext),
>         .shadow_register =3D true,
> +       .mmsys_id =3D 0,
> +       .mmsys_dev_num =3D 1,
>  };
>
>  static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data =3D {
> @@ -174,6 +176,8 @@ static const struct mtk_mmsys_driver_data mt7623_mmsy=
s_driver_data =3D {
>         .ext_path =3D mt7623_mtk_ddp_ext,
>         .ext_len =3D ARRAY_SIZE(mt7623_mtk_ddp_ext),
>         .shadow_register =3D true,
> +       .mmsys_id =3D 0,
> +       .mmsys_dev_num =3D 1,
>  };
>
>  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data =3D {
> @@ -183,6 +187,8 @@ static const struct mtk_mmsys_driver_data mt2712_mmsy=
s_driver_data =3D {
>         .ext_len =3D ARRAY_SIZE(mt2712_mtk_ddp_ext),
>         .third_path =3D mt2712_mtk_ddp_third,
>         .third_len =3D ARRAY_SIZE(mt2712_mtk_ddp_third),
> +       .mmsys_id =3D 0,
> +       .mmsys_dev_num =3D 1,
>  };
>
>  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data =3D {
> @@ -190,6 +196,8 @@ static const struct mtk_mmsys_driver_data mt8173_mmsy=
s_driver_data =3D {
>         .main_len =3D ARRAY_SIZE(mt8173_mtk_ddp_main),
>         .ext_path =3D mt8173_mtk_ddp_ext,
>         .ext_len =3D ARRAY_SIZE(mt8173_mtk_ddp_ext),
> +       .mmsys_id =3D 0,
> +       .mmsys_dev_num =3D 1,
>  };
>
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data =3D {
> @@ -197,32 +205,219 @@ static const struct mtk_mmsys_driver_data mt8183_m=
msys_driver_data =3D {
>         .main_len =3D ARRAY_SIZE(mt8183_mtk_ddp_main),
>         .ext_path =3D mt8183_mtk_ddp_ext,
>         .ext_len =3D ARRAY_SIZE(mt8183_mtk_ddp_ext),
> +       .mmsys_id =3D 0,
> +       .mmsys_dev_num =3D 1,
>  };
>
>  static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data =3D=
 {
>         .main_path =3D mt8195_mtk_ddp_main,
>         .main_len =3D ARRAY_SIZE(mt8195_mtk_ddp_main),
> +       .mmsys_id =3D 0,
> +       .mmsys_dev_num =3D 2,
>  };
>
> +static const struct of_device_id mtk_drm_of_ids[] =3D {
> +       { .compatible =3D "mediatek,mt2701-mmsys",
> +         .data =3D &mt2701_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt7623-mmsys",
> +         .data =3D &mt7623_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt2712-mmsys",
> +         .data =3D &mt2712_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt8173-mmsys",
> +         .data =3D &mt8173_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt8183-mmsys",
> +         .data =3D &mt8183_mmsys_driver_data},
> +       { .compatible =3D "mediatek,mt8195-vdosys0",
> +         .data =3D &mt8195_vdosys0_driver_data},
> +       { .compatible =3D "mediatek,mt8195-vdosys1",
> +         .data =3D &mt8195_vdosys1_driver_data},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> +
> +static int mtk_drm_match(struct device *dev, void *data)
> +{
> +       if (!strncmp(dev_name(dev), "mediatek-drm", sizeof("mediatek-drm"=
) - 1))

Why not

if (!strcmp(dev_name(dev), "mediatek-drm")

> +               return true;
> +       return false;
> +}
> +
> +static int mtk_drm_get_drm_priv(struct device *dev,
> +                               struct mtk_drm_private **all_drm_priv,
> +                               int num)
> +{
> +       struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> +       struct device_node *phandle =3D dev->parent->of_node;
> +       const struct of_device_id *of_id;
> +       struct device_node *node;
> +       int cnt =3D 0;
> +       struct device *drm_dev;
> +
> +       for_each_child_of_node(phandle->parent, node) {
> +               struct platform_device *pdev;
> +
> +               of_id =3D of_match_node(mtk_drm_of_ids, node);
> +               if (!of_id)
> +                       continue;
> +
> +               pdev =3D of_find_device_by_node(node);
> +               if (!pdev)
> +                       continue;
> +
> +               drm_dev =3D device_find_child(&pdev->dev, NULL, mtk_drm_m=
atch);
> +               if (!drm_dev || !dev_get_drvdata(drm_dev))
> +                       continue;
> +
> +               all_drm_priv[cnt++] =3D dev_get_drvdata(drm_dev);
> +               if (cnt =3D=3D num)
> +                       break;
> +       }
> +
> +       return 0;
> +}
> +
> +static bool mtk_drm_check_last_drm_bind(struct device *dev)
> +{
> +       struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> +       struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +       int cnt =3D 0;
> +       int i;
> +
> +       mtk_drm_get_drm_priv(dev, all_drm_priv, drm_priv->data->mmsys_dev=
_num);

You call this in three place, why not call this once?

> +
> +       for (i =3D 0; i < MAX_CRTC; i++)
> +               if (all_drm_priv[i] && all_drm_priv[i]->mtk_drm_bound)
> +                       cnt++;
> +
> +       return (drm_priv->data->mmsys_dev_num =3D=3D cnt);
> +}
> +
> +static bool mtk_drm_find_drm_dev(struct device *dev, struct drm_device *=
*drm)
> +{
> +       struct device_node *phandle =3D dev->parent->of_node;
> +       struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> +       struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +       int i;
> +
> +       if (!drm_priv->data->mmsys_dev_num)
> +               return false;
> +
> +       mtk_drm_get_drm_priv(dev, all_drm_priv, drm_priv->data->mmsys_dev=
_num);
> +
> +       for (i =3D 0; i < MAX_CRTC; i++) {
> +               if (all_drm_priv[i] && all_drm_priv[i]->mtk_drm_bound) {
> +                       *drm =3D all_drm_priv[i]->drm;
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
> +static int mtk_drm_setup_all_drm_private(struct device *dev)
> +{
> +       struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> +       struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +       int mmsys_dev_num =3D drm_priv->data->mmsys_dev_num;
> +       int i;
> +       int j;

int i, j;

> +
> +       mtk_drm_get_drm_priv(dev, all_drm_priv, mmsys_dev_num);
> +
> +       for (i =3D 0; i < mmsys_dev_num; i++)
> +               for (j =3D 0; j < mmsys_dev_num; j++)
> +                       all_drm_priv[j]->all_drm_private[i] =3D all_drm_p=
riv[i];
> +
> +       return 0;
> +}
> +
> +static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int=
 comp_id)
> +{
> +       const struct mtk_mmsys_driver_data *drv_data =3D private->data;
> +       int ret =3D false;
> +       int i;
> +
> +       if (drv_data->mmsys_dev_num =3D=3D 1)
> +               return true;
> +
> +       if (drv_data->main_path) {
> +               for (i =3D 0; i < drv_data->main_len; i++)
> +                       if (drv_data->main_path[i] =3D=3D comp_id)
> +                               ret |=3D true;

return true;

> +
> +               if (i =3D=3D drv_data->main_len)
> +                       ret |=3D false;

This is not necessary.

> +       }
> +
> +       if (drv_data->ext_path) {
> +               for (i =3D 0; i < drv_data->ext_len; i++)
> +                       if (drv_data->ext_path[i] =3D=3D comp_id)
> +                               ret |=3D true;

return true;

> +
> +               if (i =3D=3D drv_data->ext_len)
> +                       ret |=3D false;

This is not necessary.

> +       }
> +
> +       if (drv_data->third_path) {
> +               for (i =3D 0; i < drv_data->third_len; i++)
> +                       if (drv_data->third_path[i] =3D=3D comp_id)
> +                               ret |=3D true;

return true;

> +
> +               if (i =3D=3D drv_data->third_len)
> +                       ret |=3D false;

This is not necessary.

> +       }
> +
> +       return ret;
> +}
> +
> +static int mtk_drm_check_mutex_dev(struct mtk_drm_private *private)
> +{
> +       struct platform_device *pdev;
> +       struct mtk_drm_private *priv_i;
> +       int ret;
> +       int i;
> +
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> +               priv_i =3D private->all_drm_private[i];
> +
> +               pdev =3D of_find_device_by_node(priv_i->mutex_node);
> +               if (!pdev) {
> +                       dev_err(priv_i->dev, "Waiting for disp-mutex devi=
ce %pOF\n",
> +                               priv_i->mutex_node);
> +                       ret =3D -EPROBE_DEFER;

For SoC which has only one mmsys, I think waiting mutex is necessary.
So move this to another patch and do this for a single mmsys.

Regards,
Chun-Kuang.

> +                       goto err_put_mutex;
> +               }
> +               priv_i->mutex_dev =3D &pdev->dev;
> +       }
> +
> +       return 0;
> +
> +err_put_mutex:
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> +               priv_i =3D private->all_drm_private[i];
> +               of_node_put(priv_i->mutex_node);
> +       }
> +
> +       return ret;
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
>         int ret;
> +       int i;
> +       int j;
>
>         if (!iommu_present(&platform_bus_type))
>                 return -EPROBE_DEFER;
>
> -       pdev =3D of_find_device_by_node(private->mutex_node);
> -       if (!pdev) {
> -               dev_err(drm->dev, "Waiting for disp-mutex device %pOF\n",
> -                       private->mutex_node);
> -               of_node_put(private->mutex_node);
> -               return -EPROBE_DEFER;
> -       }
> -       private->mutex_dev =3D &pdev->dev;
> +       ret =3D mtk_drm_check_mutex_dev(private);
> +       if (ret)
> +               return ret;
>
>         ret =3D drmm_mode_config_init(drm);
>         if (ret)
> @@ -241,33 +436,57 @@ static int mtk_drm_kms_init(struct drm_device *drm)
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
> @@ -276,7 +495,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
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
> @@ -304,9 +524,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
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
> @@ -371,12 +594,21 @@ static int mtk_drm_bind(struct device *dev)
>         struct drm_device *drm;
>         int ret;
>
> -       drm =3D drm_dev_alloc(&mtk_drm_driver, dev);
> -       if (IS_ERR(drm))
> -               return PTR_ERR(drm);
> +       if (!mtk_drm_find_drm_dev(dev, &drm)) {
> +               drm =3D drm_dev_alloc(&mtk_drm_driver, dev);
> +               if (IS_ERR(drm))
> +                       return PTR_ERR(drm);
> +               drm->dev_private =3D private;
> +       }
>
> -       drm->dev_private =3D private;
> +       private->dev =3D dev;
>         private->drm =3D drm;
> +       private->mtk_drm_bound =3D true;
> +
> +       if (!mtk_drm_check_last_drm_bind(dev))
> +               return 0;
> +
> +       mtk_drm_setup_all_drm_private(dev);
>
>         ret =3D mtk_drm_kms_init(drm);
>         if (ret < 0)
> @@ -401,10 +633,13 @@ static void mtk_drm_unbind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
>
> -       drm_dev_unregister(private->drm);
> -       mtk_drm_kms_deinit(private->drm);
> -       drm_dev_put(private->drm);
> -       private->num_pipes =3D 0;
> +       /* for multi mmsys dev, unregister drm dev in mmsys master */
> +       if (private->data->mmsys_id =3D=3D 0) {
> +               drm_dev_unregister(private->drm);
> +               mtk_drm_kms_deinit(private->drm);
> +               drm_dev_put(private->drm);
> +       }
> +       private->mtk_drm_bound =3D false;
>         private->drm =3D NULL;
>  }
>
> @@ -487,50 +722,40 @@ static const struct of_device_id mtk_ddp_comp_dt_id=
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
> -       { .compatible =3D "mediatek,mt8173-mmsys",
> -         .data =3D &mt8173_mmsys_driver_data},
> -       { .compatible =3D "mediatek,mt8183-mmsys",
> -         .data =3D &mt8183_mmsys_driver_data},
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
> @@ -550,7 +775,13 @@ static int mtk_drm_probe(struct platform_device *pde=
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
> @@ -561,6 +792,9 @@ static int mtk_drm_probe(struct platform_device *pdev=
)
>                         continue;
>                 }
>
> +               if (!mtk_drm_find_mmsys_comp(private, comp_id))
> +                       continue;
> +
>                 private->comp_node[comp_id] =3D of_node_get(node);
>
>                 /*
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.h
> index 1ad9f7edfcc7..b87ba900c8e2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -29,14 +29,15 @@ struct mtk_mmsys_driver_data {
>         unsigned int third_len;
>
>         bool shadow_register;
> +       unsigned int mmsys_id;
> +       unsigned int mmsys_dev_num;
>  };
>
>  struct mtk_drm_private {
>         struct drm_device *drm;
>         struct device *dma_dev;
> -
> -       unsigned int num_pipes;
> -
> +       bool mtk_drm_bound;
> +       struct device *dev;
>         struct device_node *mutex_node;
>         struct device *mutex_dev;
>         struct device *mmsys_dev;
> @@ -44,6 +45,7 @@ struct mtk_drm_private {
>         struct mtk_ddp_comp ddp_comp[DDP_COMPONENT_ID_MAX];
>         const struct mtk_mmsys_driver_data *data;
>         struct drm_atomic_state *suspend_state;
> +       struct mtk_drm_private **all_drm_private;
>  };
>
>  extern struct platform_driver mtk_disp_aal_driver;
> --
> 2.18.0
>
