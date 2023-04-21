Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816676EADE4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 17:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD80210EE36;
	Fri, 21 Apr 2023 15:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B7F10EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:17:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B7466516F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452AEC433D2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682090227;
 bh=uGmykEQ+sAUoIFdOX/TTQ1KRjOgr/SSZzJwxckXmszI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IcxyV3b39cNIKWPBuzx424A3OyD19EjqnGKaF0Q1mW0RDMEQzJbj2GHFmUqNrT4UQ
 SSpOr2BydgVm7eQ6X6qglffTWP+2IRgkmq3sf9obij7+MllWwac3PLzTz7liL7IV4G
 mYp7w7zpW22kA3QzfKEFkDMf9+6uICkz+qOi7RItHVllpAZlA13PLr5FFy3hsMrYQw
 OO+EBrv9y4jeRRL/p/tB1AS3/wobG4vVIsUDyut/EW3sdZT/2Ptzzb3I6xM0F+sf8Y
 OeJ1leh82j8r97ZwOIDz2Z6pkkr7TFjrVBUJ/MHWTX2JiB4YFmUNSSKwwPhQaoNs73
 rnRV4XzjdPeMg==
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso8011758e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:17:07 -0700 (PDT)
X-Gm-Message-State: AAQBX9dKSMxwQQAeag3Nj8nU1Mwun1ZvrTZlATXSMm7PmDxSabhz+8e7
 Z1zk1mNhVuVowbpkP0O2C3T0+UGb9brwregDYA==
X-Google-Smtp-Source: AKy350ahkWsBaP7t9IXGI5kl9NyoFnRYHN6184HWY8QF3H5T0Hfl4AGmM1AI5vogctWKfLhyxnzvmuZOFzFcfX/AKfM=
X-Received: by 2002:a05:6512:401a:b0:4eb:4440:e12 with SMTP id
 br26-20020a056512401a00b004eb44400e12mr2888376lfb.15.1682090225254; Fri, 21
 Apr 2023 08:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230321111448.270110-1-angelogioacchino.delregno@collabora.com>
 <fcb6638b-0298-74b7-c375-f563a8115596@collabora.com>
In-Reply-To: <fcb6638b-0298-74b7-c375-f563a8115596@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Apr 2023 23:16:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9MGCNMPzt7os0xJhxFTObL46VJSrA_ovOrRirFTqvBMQ@mail.gmail.com>
Message-ID: <CAAOTY_9MGCNMPzt7os0xJhxFTObL46VJSrA_ovOrRirFTqvBMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Clarify/finish documentation for some
 driver structures
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B44=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:1=
6=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 21/03/23 12:14, AngeloGioacchino Del Regno ha scritto:
> > The documentation for some of the driver structures in mediatek-drm
> > was set to be kerneldoc but some code additions didn't actually update
> > the comments accordingly and this caused triggering some warnings.
> >
> > Add comments for the remaining undocumented entries; while at it, also
> > clarify some acronyms for various display HW blocks and fix some commen=
t
> > blocks to actually get parsed as kerneldoc.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>
> Hello CK,
> I just noticed that this patch is getting stale and forgotten.
>
> Please take a look at it, as this solves kerneldoc warnings during kernel=
 build.

There is conflict when I apply this patch. Please base on
mediatek-drm-next to send patch.

Regards,
Chun-Kuang.

>
> Regards,
> Angelo
>
> > --- >   drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  8 +++++---
> >   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c |  8 +++++---
> >   drivers/gpu/drm/mediatek/mtk_disp_color.c | 11 +++++++----
> >   drivers/gpu/drm/mediatek/mtk_disp_gamma.c |  8 ++++++--
> >   drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 13 +++++++++----
> >   drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 12 +++++++++---
> >   6 files changed, 41 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/=
mediatek/mtk_disp_aal.c
> > index 434e8a9ce8ab..12d1800c1d34 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> > @@ -27,9 +27,11 @@ struct mtk_disp_aal_data {
> >   };
> >
> >   /**
> > - * struct mtk_disp_aal - DISP_AAL driver structure
> > - * @ddp_comp - structure containing type enum and hardware resources
> > - * @crtc - associated crtc to report irq events to
> > + * struct mtk_disp_aal - Display Adaptive Ambient Light driver structu=
re
> > + * @clk:      clock for DISP_AAL controller
> > + * @regs:     MMIO registers base
> > + * @cmdq_reg: CMDQ Client register
> > + * @data:     platform specific data for DISP_AAL
> >    */
> >   struct mtk_disp_aal {
> >       struct clk *clk;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/dr=
m/mediatek/mtk_disp_ccorr.c
> > index 1773379b2439..b173aa058573 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > @@ -35,9 +35,11 @@ struct mtk_disp_ccorr_data {
> >   };
> >
> >   /**
> > - * struct mtk_disp_ccorr - DISP_CCORR driver structure
> > - * @ddp_comp - structure containing type enum and hardware resources
> > - * @crtc - associated crtc to report irq events to
> > + * struct mtk_disp_ccorr - Display Color Correction driver structure
> > + * @clk:      clock for DISP_CCORR block
> > + * @regs:     MMIO registers base
> > + * @cmdq_reg: CMDQ Client register
> > + * @data:     platform specific data for DISP_CCORR
> >    */
> >   struct mtk_disp_ccorr {
> >       struct clk *clk;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/dr=
m/mediatek/mtk_disp_color.c
> > index cac9206079e7..7884f4736b7c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> > @@ -31,10 +31,13 @@ struct mtk_disp_color_data {
> >       unsigned int color_offset;
> >   };
> >
> > -/*
> > - * struct mtk_disp_color - DISP_COLOR driver structure
> > - * @crtc: associated crtc to report irq events to
> > - * @data: platform colour driver data
> > +/**
> > + * struct mtk_disp_color - DISP_COLOR (Display Color) driver structure
> > + * @crtc:     associated crtc to report irq events to
> > + * @clk:      clock for DISP_COLOR block
> > + * @regs:     MMIO registers base
> > + * @cmdq_reg: CMDQ Client register
> > + * @data:     platform specific data for DISP_COLOR
> >    */
> >   struct mtk_disp_color {
> >       struct drm_crtc                         *crtc;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/dr=
m/mediatek/mtk_disp_gamma.c
> > index c844942603f7..7e748613fccb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -31,8 +31,12 @@ struct mtk_disp_gamma_data {
> >       bool lut_diff;
> >   };
> >
> > -/*
> > - * struct mtk_disp_gamma - DISP_GAMMA driver structure
> > +/**
> > + * struct mtk_disp_gamma - Display Gamma driver structure
> > + * @clk:      clock for DISP_GAMMA block
> > + * @regs:     MMIO registers base
> > + * @cmdq_reg: CMDQ Client register
> > + * @data:     platform data for DISP_GAMMA
> >    */
> >   struct mtk_disp_gamma {
> >       struct clk *clk;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/=
mediatek/mtk_disp_ovl.c
> > index 9d8c986700ee..00f2871fd1a4 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -76,10 +76,15 @@ struct mtk_disp_ovl_data {
> >       bool supports_afbc;
> >   };
> >
> > -/*
> > - * struct mtk_disp_ovl - DISP_OVL driver structure
> > - * @crtc: associated crtc to report vblank events to
> > - * @data: platform data
> > +/**
> > + * struct mtk_disp_ovl - Display Overlay driver structure
> > + * @crtc:           associated crtc to report vblank events to
> > + * @clk:            clock for DISP_OVL block
> > + * @regs:           MMIO registers base
> > + * @cmdq_reg:       CMDQ Client register
> > + * @data:           platform data
> > + * @vblank_cb:      vblank callback function
> > + * @vblank_cb_data: pointer to data that will be passed to vblank_cb()
> >    */
> >   struct mtk_disp_ovl {
> >       struct drm_crtc                 *crtc;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm=
/mediatek/mtk_disp_rdma.c
> > index e8e337903b0d..74f4a0bce5cc 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > @@ -59,9 +59,15 @@ struct mtk_disp_rdma_data {
> >       unsigned int fifo_size;
> >   };
> >
> > -/*
> > - * struct mtk_disp_rdma - DISP_RDMA driver structure
> > - * @data: local driver data
> > +/**
> > + * struct mtk_disp_rdma - Display Read DMA driver structure
> > + * @clk:            clock for DISP_RDMA block
> > + * @regs:           MMIO registers base
> > + * @cmdq_reg:       CMDQ Client register
> > + * @data:           platform data
> > + * @vblank_cb:      vblank callback function
> > + * @vblank_cb_data: pointer to data that will be passed to vblank_cb()
> > + * @fifo_size:      size of DISP_RDMA block's FIFO
> >    */
> >   struct mtk_disp_rdma {
> >       struct clk                      *clk;
>
> --
> AngeloGioacchino Del Regno
> Software Engineer
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
>
