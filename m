Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57864C5925
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 04:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FA510E333;
	Sun, 27 Feb 2022 03:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4DB10E333
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 03:33:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE550611E2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 03:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF53C340F2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 03:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645932836;
 bh=sINlhUUL3qCCKmllNYIAS6L68awhHaZWumjFZmCkwbA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xch1FdbxJomskcGYC0j6vWmaDDUZOoXVKnF0kkvPmVKl/HSsVj5IJVwQSsxNYen12
 zuPpmG9Irkh8aFI0Oo3rVSJIzs5xrkZtZIDJtoYONSovlJrjgERqaK0ZdpsQxRBGwn
 g5ZAIFAb2AAOGwG3l4ltj0tmYCJ+uYQAYNKSGFl4mH9ssHzfv8YuqeL4Yj9IFMMCJk
 TEHwR7xEDAX2YGY+qY2lTfoRFUkb47EOJ/X0NkUAuYpLvi37Pe9hlezfEQ5hxqfRAL
 vLgYb9Lb1/Thp2xDCPh+T01Xd5VujOpGJDmW0EEvVAo5ZJ+Ob8t41Fb6s54eQw0jHQ
 z6ZW/M2QrzZmw==
Received: by mail-ed1-f45.google.com with SMTP id z22so12765772edd.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 19:33:56 -0800 (PST)
X-Gm-Message-State: AOAM533paq7TP06SRbRRGJby0UIg4czbtscNlOAFbkLvbrQj6DwbTvy1
 kOsnCevQBWkvmimDowkJV0mb4TUQKB9edyDlpw==
X-Google-Smtp-Source: ABdhPJzAW6ryJztkKzpfOTbync3l10BoeisdAaTfjrRVJU3ASVjUgrEdyRhZQiMi8L3zCpy9UZ4Vsf9dVHrFb92NAyo=
X-Received: by 2002:aa7:d415:0:b0:410:a0fa:dc40 with SMTP id
 z21-20020aa7d415000000b00410a0fadc40mr13507630edq.46.1645932834417; Sat, 26
 Feb 2022 19:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
 <20211202064039.20797-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20211202064039.20797-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 27 Feb 2022 11:33:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY__rnVMRB=OhkTm4Ojh31yAcYwCQTBGozpGsnC_oC_jqvQ@mail.gmail.com>
Message-ID: <CAAOTY__rnVMRB=OhkTm4Ojh31yAcYwCQTBGozpGsnC_oC_jqvQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: add devlink to cmdq dev
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jason:

Build error:

../drivers/gpu/drm/mediatek/mtk_drm_crtc.c: In function =E2=80=98mtk_drm_cr=
tc_create=E2=80=99:
../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:902:26: error: =E2=80=98struct
mtk_drm_private=E2=80=99 has no member named =E2=80=98dev=E2=80=99
  mtk_crtc->drm_dev =3D priv->dev;
                          ^
../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:974:30: error: =E2=80=98struct
mtk_drm_private=E2=80=99 has no member named =E2=80=98dev=E2=80=99
   link =3D device_link_add(priv->dev, mtk_crtc->cmdq_client.chan->mbox->de=
v,
                              ^
In file included from ../include/linux/device.h:15:0,
                 from ../include/linux/dma-mapping.h:7,
                 from ../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:7:
../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:977:16: error: =E2=80=98struct
mtk_drm_private=E2=80=99 has no member named =E2=80=98dev=E2=80=99
    dev_err(priv->dev, "Unable to link dev=3D%s\n",
                ^
Regards,
Chun-Kuang.

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
2=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:41=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add devlink to cmdq to make sure the order of suspend and resume
> is correct.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 43 ++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 0b4012335e7a..612d1d69c16c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -60,6 +60,7 @@ struct mtk_drm_crtc {
>  #endif
>
>         struct device                   *mmsys_dev;
> +       struct device                   *drm_dev;
>         struct mtk_mutex                *mutex;
>         unsigned int                    ddp_comp_nr;
>         struct mtk_ddp_comp             **ddp_comp;
> @@ -159,6 +160,7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crt=
c)
>         mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
>
>         if (mtk_crtc->cmdq_client.chan) {
> +               device_link_remove(mtk_crtc->drm_dev, mtk_crtc->cmdq_clie=
nt.chan->mbox->dev);
>                 mbox_free_channel(mtk_crtc->cmdq_client.chan);
>                 mtk_crtc->cmdq_client.chan =3D NULL;
>         }
> @@ -902,6 +904,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 return -ENOMEM;
>
>         mtk_crtc->mmsys_dev =3D priv->mmsys_dev;
> +       mtk_crtc->drm_dev =3D priv->dev;
>         mtk_crtc->ddp_comp_nr =3D path_len;
>         mtk_crtc->ddp_comp =3D devm_kmalloc_array(dev, mtk_crtc->ddp_comp=
_nr,
>                                                 sizeof(*mtk_crtc->ddp_com=
p),
> @@ -969,6 +972,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>         }
>
>         if (mtk_crtc->cmdq_client.chan) {
> +               struct device_link *link;
> +
> +               /* add devlink to cmdq dev to make sure suspend/resume or=
der is correct */
> +               link =3D device_link_add(priv->dev, mtk_crtc->cmdq_client=
.chan->mbox->dev,
> +                                      DL_FLAG_PM_RUNTIME | DL_FLAG_STATE=
LESS);
> +               if (!link) {
> +                       dev_err(priv->dev, "Unable to link dev=3D%s\n",
> +                               dev_name(mtk_crtc->cmdq_client.chan->mbox=
->dev));
> +                       ret =3D -ENODEV;
> +                       goto cmdq_err;
> +               }
> +
>                 ret =3D of_property_read_u32_index(priv->mutex_node,
>                                                  "mediatek,gce-events",
>                                                  i,
> @@ -976,22 +991,26 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 if (ret) {
>                         dev_dbg(dev, "mtk_crtc %d failed to get mediatek,=
gce-events property\n",
>                                 drm_crtc_index(&mtk_crtc->base));
> -                       mbox_free_channel(mtk_crtc->cmdq_client.chan);
> -                       mtk_crtc->cmdq_client.chan =3D NULL;
> -               } else {
> -                       ret =3D mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_c=
lient,
> -                                                     &mtk_crtc->cmdq_han=
dle,
> -                                                     PAGE_SIZE);
> -                       if (ret) {
> -                               dev_dbg(dev, "mtk_crtc %d failed to creat=
e cmdq packet\n",
> -                                       drm_crtc_index(&mtk_crtc->base));
> -                               mbox_free_channel(mtk_crtc->cmdq_client.c=
han);
> -                               mtk_crtc->cmdq_client.chan =3D NULL;
> -                       }
> +                       goto cmdq_err;
> +               }
> +
> +               ret =3D mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_client,
> +                                             &mtk_crtc->cmdq_handle,
> +                                             PAGE_SIZE);
> +               if (ret) {
> +                       dev_dbg(dev, "mtk_crtc %d failed to create cmdq p=
acket\n",
> +                               drm_crtc_index(&mtk_crtc->base));
> +                       goto cmdq_err;
>                 }
>
>                 /* for sending blocking cmd in crtc disable */
>                 init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
> +
> +cmdq_err:
> +               if (ret) {
> +                       mbox_free_channel(mtk_crtc->cmdq_client.chan);
> +                       mtk_crtc->cmdq_client.chan =3D NULL;
> +               }
>         }
>  #endif
>         return 0;
> --
> 2.18.0
>
