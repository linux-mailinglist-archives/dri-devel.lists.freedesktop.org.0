Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870E36E029F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 01:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C12D10E7C4;
	Wed, 12 Apr 2023 23:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717FB10E7C4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 23:37:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B70A363A21
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 23:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E7AC433A1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 23:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681342637;
 bh=XPnc1KFFUf0qWKm0IhzaEsHbORokq/vVCY1WdIYlrSA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZyiXaI+FsNZ9hn9zAE5mjGYlZH6uP+MR1VLJmB+fqLWtbQIrU8DrGt9T2ZNfergGP
 DC9iNOCE/7jWjpESfbM7oTQ7XpWoXb3QbEF/hTvsuqnvsH0mISeYqsxB8pMrLzV53l
 ZGM7q2uGv41Ie9X3zFGvWC+BZw5AkJ7AyBrFCATuU6qdolCvuhcVNS6Vz2xpsa5i6n
 y/mYtZRiL3misO6f1L+O9ax2bE5CeLQXqvAbtBryWIuTBS4vYcpuU3pMGo0PR93P59
 fI3MJ6esadCpslYseYh5WUAB9j/vJ13ACn5GLBtaKHYcXJDGOviiVIbHcmAJFAwOh6
 DgxAcIp+Zf8OA==
Received: by mail-lj1-f178.google.com with SMTP id j11so1187612ljq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 16:37:17 -0700 (PDT)
X-Gm-Message-State: AAQBX9fjt6ynQcetqMymK+B/mzhXPB9A6ntJFa54KaS/uIfM8ANoGojH
 75EjuP3zrzK/fBGJQ2cTADtetyUzOBa4YKSJhg==
X-Google-Smtp-Source: AKy350bBrdnIU3ky/e0Yu6oF9aXHAUd6d09dwmO3Kd0JhS8E1krtqtgIZ/HwHr2JngB1yrUihD3gm6BiNWvsorOauBA=
X-Received: by 2002:a2e:9586:0:b0:2a7:7622:fb01 with SMTP id
 w6-20020a2e9586000000b002a77622fb01mr111974ljh.10.1681342635586; Wed, 12 Apr
 2023 16:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
 <20230330032614.18837-2-nancy.lin@mediatek.com>
 <ZDU3IiewmLW1pDyn@phenom.ffwll.local>
In-Reply-To: <ZDU3IiewmLW1pDyn@phenom.ffwll.local>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 13 Apr 2023 07:37:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Yy2B5SkD+WpZPr5PVa=joW4vFxgfU+FcLGYJHPxN+OQ@mail.gmail.com>
Message-ID: <CAAOTY_-Yy2B5SkD+WpZPr5PVa=joW4vFxgfU+FcLGYJHPxN+OQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/mediatek: Add mdp_rdma get format function
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com, 
 shawn.sung@mediatek.com
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

Hi, Daniel:

Daniel Vetter <daniel@ffwll.ch> =E6=96=BC 2023=E5=B9=B44=E6=9C=8811=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Mar 30, 2023 at 11:26:13AM +0800, Nancy.Lin wrote:
> > Add mdp_rdma get_format and get_num_formats function.
> >
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>
> The mtk get_formats stuff seems like a lot of midlayering for not much
> reasons? Is that really needed?

In general, mediatek crtc directly control dma device such as OVL
(multiple plane), RDMA (single plane) and supported format information
store in these sub driver. MT8195 hardware use 4 RDMA to work like
OVL. To simplify the crtc control of dma device, we use a midlayer
OVL_Adaptor to control the 4 RDMA, so crtc just control one
OVL_Adaptor. crtc should query supported format from OVL_Adaptor, but
the supported format store in RDMA driver. That's why we have two
layer get_formats.

Regards,
Chun-Kuang.

>
> Just a drive-by questions I had while merging the pr.
> -Daniel
>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  3 +++
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 24 ++++++++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/=
mediatek/mtk_disp_drv.h
> > index 0d28b2e2069c..17b169530beb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -152,4 +152,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct =
cmdq_pkt *cmdq_pkt);
> >  void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> >  void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *=
cfg,
> >                        struct cmdq_pkt *cmdq_pkt);
> > +const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
> > +size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/=
mediatek/mtk_mdp_rdma.c
> > index eecfa98ff52e..e06db6e56b5f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> > @@ -62,6 +62,20 @@
> >  #define RDMA_CSC_FULL709_TO_RGB                      5
> >  #define RDMA_CSC_BT601_TO_RGB                        6
> >
> > +static const u32 formats[] =3D {
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_UYVY,
> > +     DRM_FORMAT_YUYV,
> > +};
> > +
> >  enum rdma_format {
> >       RDMA_INPUT_FORMAT_RGB565 =3D 0,
> >       RDMA_INPUT_FORMAT_RGB888 =3D 1,
> > @@ -219,6 +233,16 @@ void mtk_mdp_rdma_config(struct device *dev, struc=
t mtk_mdp_rdma_cfg *cfg,
> >                          MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
> >  }
> >
> > +const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
> > +{
> > +     return formats;
> > +}
> > +
> > +size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
> > +{
> > +     return ARRAY_SIZE(formats);
> > +}
> > +
> >  int mtk_mdp_rdma_clk_enable(struct device *dev)
> >  {
> >       struct mtk_mdp_rdma *rdma =3D dev_get_drvdata(dev);
> > --
> > 2.18.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
