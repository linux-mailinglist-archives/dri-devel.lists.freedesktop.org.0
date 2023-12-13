Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20181149C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F210E066;
	Wed, 13 Dec 2023 14:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390F010E066
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:28:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EBDF1B81DDE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95DFC433CD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702477702;
 bh=1NelY49Rtb1AVpWalye31/ZWTy2DmcMw3Hv962u4tjU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jVMXgV4O1Jnj7tqS3hc0Hc2BnKyAgqnmbw6/lGQhJGExmDAD+zEunB92SCY1DeCCY
 Z65rmDPfkNIDyEu6ZPGRIrWlqW5IJbWGhTlopnviYQWFCicXfCWXNvKybZl1OD/BDx
 qGBDTtem21LII4qE2Lc5oDO0v+GJNcAi5mDTGAzF/QlVIoVPnES8lY9QE5nnw7+zRk
 99ZSOqc/xhgHMATD8jmbK9c6bhFa1RtNBw0V0QDoYUe58CVw9Hp8tmKQ6Zgp8T6KVK
 9/lIjuhYEh95joLfQAeaxteq2n2NXPqMw+SUQL1MM5AGvlftkhYsG/iJR/O70yJl7c
 oaLrp3VUTpM8A==
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2cb20c82a79so74647371fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 06:28:22 -0800 (PST)
X-Gm-Message-State: AOJu0Yxo+CGS/8lVq11ibnJpKmthAa55UJeurP0s1g/K0zdhyFTZbI0q
 tsN17LSgVL9gPbxzTRxMjR/XzY3r9zylbi7TnA==
X-Google-Smtp-Source: AGHT+IGZUggKzakRIu1cLjf+W2GQkNH9IR87nGDEKuYmEbAd4t3lIaZqsoyFSGRtYGI96Eay29zUVggLBHEcOmhNZDk=
X-Received: by 2002:a2e:a805:0:b0:2cc:1e83:65ee with SMTP id
 l5-20020a2ea805000000b002cc1e8365eemr4557579ljq.56.1702477701036; Wed, 13 Dec
 2023 06:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20231024130048.14749-1-shawn.sung@mediatek.com>
 <20231024130048.14749-15-shawn.sung@mediatek.com>
In-Reply-To: <20231024130048.14749-15-shawn.sung@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 Dec 2023 22:28:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6bbE394ViQfyXg7zNv+uFygj70eF9dG+QDoSgELOFYg@mail.gmail.com>
Message-ID: <CAAOTY_-6bbE394ViQfyXg7zNv+uFygj70eF9dG+QDoSgELOFYg@mail.gmail.com>
Subject: Re: [PATCH v11 14/23] drm/mediatek: Power on/off devices with
 function pointers
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsiao-chien:

Hsiao Chien Sung <shawn.sung@mediatek.com> =E6=96=BC 2023=E5=B9=B410=E6=9C=
=8824=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:01=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Different from OVL, OVL adaptor is a pseudo device so we didn't
> define it in the device tree, consequently, pm_runtime_resume_and_get()
> called by .atomic_enable() powers on no device. For this reason, we
> implement a function to power on the RDMAs in OVL adaptor, and the
> system will make sure the IOMMUs are powered on as well because of the
> device link (iommus) in the RDMA nodes in DTS.
>
> This patch separates power and clock management process, it would be
> easier to maintain and add extensions.

There is conflict while apply this patch into latest kernel. Please
rebase this series onto latest kernel and send next version patches.

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  4 +
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 75 +++++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 10 +--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   | 20 +++++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 16 ++++
>  6 files changed, 107 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index bf06ccb65652..8465beeab435 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -109,6 +109,8 @@ void mtk_ovl_adaptor_connect(struct device *dev, stru=
ct device *mmsys_dev,
>                              unsigned int next);
>  void mtk_ovl_adaptor_disconnect(struct device *dev, struct device *mmsys=
_dev,
>                                 unsigned int next);
> +int mtk_ovl_adaptor_power_on(struct device *dev);
> +void mtk_ovl_adaptor_power_off(struct device *dev);
>  int mtk_ovl_adaptor_clk_enable(struct device *dev);
>  void mtk_ovl_adaptor_clk_disable(struct device *dev);
>  void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
> @@ -150,6 +152,8 @@ void mtk_rdma_disable_vblank(struct device *dev);
>  const u32 *mtk_rdma_get_formats(struct device *dev);
>  size_t mtk_rdma_get_num_formats(struct device *dev);
>
> +int mtk_mdp_rdma_power_on(struct device *dev);
> +void mtk_mdp_rdma_power_off(struct device *dev);
>  int mtk_mdp_rdma_clk_enable(struct device *dev);
>  void mtk_mdp_rdma_clk_disable(struct device *dev);
>  void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gp=
u/drm/mediatek/mtk_disp_ovl_adaptor.c
> index 81067f49ea69..048d56ee344d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -79,6 +79,8 @@ static const struct mtk_ddp_comp_funcs merge =3D {
>  };
>
>  static const struct mtk_ddp_comp_funcs rdma =3D {
> +       .power_on =3D mtk_mdp_rdma_power_on,
> +       .power_off =3D mtk_mdp_rdma_power_off,
>         .clk_enable =3D mtk_mdp_rdma_clk_enable,
>         .clk_disable =3D mtk_mdp_rdma_clk_disable,
>  };
> @@ -200,21 +202,72 @@ void mtk_ovl_adaptor_stop(struct device *dev)
>         mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0])=
;
>  }
>
> -int mtk_ovl_adaptor_clk_enable(struct device *dev)
> +/**
> + * power_off - Power off the devices in OVL adaptor
> + * @dev: Device to be powered off
> + * @num: Number of the devices to be powered off
> + *
> + * Calls the .power_off() ovl_adaptor component callback if it is presen=
t.
> + */
> +static inline void power_off(struct device *dev, int num)
>  {
>         struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> -       struct device *comp;
> -       int ret;
>         int i;
>
> -       for (i =3D 0; i < OVL_ADAPTOR_MERGE0; i++) {
> -               comp =3D ovl_adaptor->ovl_adaptor_comp[i];
> -               ret =3D pm_runtime_get_sync(comp);
> +       if (num > OVL_ADAPTOR_ID_MAX)
> +               num =3D OVL_ADAPTOR_ID_MAX;
> +
> +       for (i =3D num - 1; i >=3D 0; i--) {
> +               if (!ovl_adaptor->ovl_adaptor_comp[i] ||
> +                   !comp_matches[i].funcs->power_off)
> +                       continue;
> +
> +               comp_matches[i].funcs->power_off(ovl_adaptor->ovl_adaptor=
_comp[i]);
> +       }
> +}
> +
> +/**
> + * mtk_ovl_adaptor_power_on - Power on the devices in OVL adaptor
> + * @dev: Device to be powered on
> + *
> + * Different from OVL, OVL adaptor is a pseudo device so
> + * we didn't define it in the device tree, pm_runtime_resume_and_get()
> + * called by .atomic_enable() power on no device in OVL adaptor,
> + * we have to implement a function to do the job instead.
> + *
> + * Return: Zero for success or negative number for failure.
> + */
> +int mtk_ovl_adaptor_power_on(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       int i, ret;
> +
> +       for (i =3D 0; i < OVL_ADAPTOR_ID_MAX; i++) {
> +               if (!ovl_adaptor->ovl_adaptor_comp[i] ||
> +                   !comp_matches[i].funcs->power_on)
> +                       continue;
> +
> +               ret =3D comp_matches[i].funcs->power_on(ovl_adaptor->ovl_=
adaptor_comp[i]);
>                 if (ret < 0) {
>                         dev_err(dev, "Failed to enable power domain %d, e=
rr %d\n", i, ret);
> -                       goto error;
> +                       power_off(dev, i);
> +                       return ret;
>                 }
>         }
> +       return 0;
> +}
> +
> +void mtk_ovl_adaptor_power_off(struct device *dev)
> +{
> +       power_off(dev, OVL_ADAPTOR_ID_MAX);
> +}
> +
> +int mtk_ovl_adaptor_clk_enable(struct device *dev)
> +{
> +       struct mtk_disp_ovl_adaptor *ovl_adaptor =3D dev_get_drvdata(dev)=
;
> +       struct device *comp;
> +       int ret;
> +       int i;
>
>         for (i =3D 0; i < OVL_ADAPTOR_ID_MAX; i++) {
>                 comp =3D ovl_adaptor->ovl_adaptor_comp[i];
> @@ -225,16 +278,10 @@ int mtk_ovl_adaptor_clk_enable(struct device *dev)
>                         dev_err(dev, "Failed to enable clock %d, err %d\n=
", i, ret);
>                         while (--i >=3D 0)
>                                 comp_matches[i].funcs->clk_disable(comp);
> -                       i =3D OVL_ADAPTOR_MERGE0;
> -                       goto error;
> +                       return ret;
>                 }
>         }
>         return 0;
> -error:
> -       while (--i >=3D 0)
> -               pm_runtime_put(ovl_adaptor->ovl_adaptor_comp[i]);
> -
> -       return ret;
>  }
>
>  void mtk_ovl_adaptor_clk_disable(struct device *dev)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index a0b2ba3cbcdb..bc4cc75cca18 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -774,7 +774,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crt=
c *crtc,
>                 return;
>         }
>
> -       ret =3D pm_runtime_resume_and_get(comp->dev);
> +       ret =3D mtk_ddp_comp_power_on(comp);
>         if (ret < 0) {
>                 DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: =
%d\n", ret);
>                 return;
> @@ -782,7 +782,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crt=
c *crtc,
>
>         ret =3D mtk_crtc_ddp_hw_init(mtk_crtc, state);
>         if (ret) {
> -               pm_runtime_put(comp->dev);
> +               mtk_ddp_comp_power_off(comp);
>                 return;
>         }
>
> @@ -795,7 +795,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_cr=
tc *crtc,
>  {
>         struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
>         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[0];
> -       int i, ret;
> +       int i;
>
>         DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
>         if (!mtk_crtc->enabled)
> @@ -825,9 +825,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_cr=
tc *crtc,
>
>         drm_crtc_vblank_off(crtc);
>         mtk_crtc_ddp_hw_fini(mtk_crtc);
> -       ret =3D pm_runtime_put(comp->dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(comp->dev, "Failed to disable power domain:=
 %d\n", ret);
> +       mtk_ddp_comp_power_off(comp);
>
>         mtk_crtc->enabled =3D false;
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 10402e07a4a7..9940909c7435 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -396,6 +396,8 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe =3D {
>  };
>
>  static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor =3D {
> +       .power_on =3D mtk_ovl_adaptor_power_on,
> +       .power_off =3D mtk_ovl_adaptor_power_off,
>         .clk_enable =3D mtk_ovl_adaptor_clk_enable,
>         .clk_disable =3D mtk_ovl_adaptor_clk_disable,
>         .config =3D mtk_ovl_adaptor_config,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 1c1d670cfe41..2597dd7ac0d2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -7,6 +7,7 @@
>  #define MTK_DRM_DDP_COMP_H
>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>  #include <linux/soc/mediatek/mtk-mutex.h>
> @@ -46,6 +47,8 @@ enum mtk_ddp_comp_type {
>  struct mtk_ddp_comp;
>  struct cmdq_pkt;
>  struct mtk_ddp_comp_funcs {
> +       int (*power_on)(struct device *dev);
> +       void (*power_off)(struct device *dev);
>         int (*clk_enable)(struct device *dev);
>         void (*clk_disable)(struct device *dev);
>         void (*config)(struct device *dev, unsigned int w,
> @@ -91,6 +94,23 @@ struct mtk_ddp_comp {
>         int encoder_index;
>  };
>
> +static inline int mtk_ddp_comp_power_on(struct mtk_ddp_comp *comp)
> +{
> +       if (comp->funcs && comp->funcs->power_on)
> +               return comp->funcs->power_on(comp->dev);
> +       else
> +               return pm_runtime_resume_and_get(comp->dev);
> +       return 0;
> +}
> +
> +static inline void mtk_ddp_comp_power_off(struct mtk_ddp_comp *comp)
> +{
> +       if (comp->funcs && comp->funcs->power_off)
> +               comp->funcs->power_off(comp->dev);
> +       else
> +               pm_runtime_put(comp->dev);
> +}
> +
>  static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
>  {
>         if (comp->funcs && comp->funcs->clk_enable)
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/me=
diatek/mtk_mdp_rdma.c
> index 5746f06220c1..769ae7564da2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -243,6 +243,22 @@ size_t mtk_mdp_rdma_get_num_formats(struct device *d=
ev)
>         return ARRAY_SIZE(formats);
>  }
>
> +int mtk_mdp_rdma_power_on(struct device *dev)
> +{
> +       int ret =3D pm_runtime_resume_and_get(dev);
> +
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to power on: %d\n", ret);
> +               return ret;
> +       }
> +       return 0;
> +}
> +
> +void mtk_mdp_rdma_power_off(struct device *dev)
> +{
> +       pm_runtime_put(dev);
> +}
> +
>  int mtk_mdp_rdma_clk_enable(struct device *dev)
>  {
>         struct mtk_mdp_rdma *rdma =3D dev_get_drvdata(dev);
> --
> 2.18.0
>
