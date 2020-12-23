Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62852E1B1C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2F96E8EB;
	Wed, 23 Dec 2020 10:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DACD6E249
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 00:41:51 +0000 (UTC)
X-UUID: 031c7a9ebe8349d8ab2d6c79c0700e39-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=9jJ4svNFHKxDjHPutm0Su8CS33+Bj17pwgYB/byVHIU=; 
 b=XfwfZTooTgP+hkhKVwKDN7QWmnuq8D8XFKSJ8eJT4ZpPyFT8DLV3BXZkry/ZqGg47LnMHqaAMxWZ+W22jYMuvTXGx0p1mniYvyZ51hK3TFiLETGfb4DBLYl/YMMmMETTHKBjMOTqDPwEN9F4WI5htjk0VqdwB5CO5fc4ikVNrJ4=;
X-UUID: 031c7a9ebe8349d8ab2d6c79c0700e39-20201223
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 31318354; Wed, 23 Dec 2020 08:41:48 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 08:41:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 08:41:41 +0800
Message-ID: <1608684105.18252.2.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 2/2] soc: mediatek: mmsys: Use function call for
 setting the routing registers
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 23 Dec 2020 08:41:45 +0800
In-Reply-To: <CAJMQK-hHA_8MdU4d5SR1eJOupMJMF2k-D5t7bocaSX0PZBBG_w@mail.gmail.com>
References: <1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607506379-10998-3-git-send-email-yongqiang.niu@mediatek.com>
 <CAJMQK-hHA_8MdU4d5SR1eJOupMJMF2k-D5t7bocaSX0PZBBG_w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-12-17 at 14:04 +0800, Hsin-Yi Wang wrote:
> On Wed, Dec 9, 2020 at 9:32 AM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
> >
> > Actually, setting the registers for routing, use multiple 'if-else' for different
> > routes, but this code would be more and more complicated while we
> > support more and more SoCs. Change that and use a function call per SoC so the
> > code will be more portable and clear.
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mmsys/Makefile       |   3 +-
> >  drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 233 +++++++++++++++++++++++++++++
> >  drivers/soc/mediatek/mmsys/mtk-mmsys.c    | 241 +++---------------------------
> >  include/linux/soc/mediatek/mtk-mmsys.h    |  14 ++
> >  4 files changed, 268 insertions(+), 223 deletions(-)
> >  create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> >
> > diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> > index 5d976d7..ac03025 100644
> > --- a/drivers/soc/mediatek/mmsys/Makefile
> > +++ b/drivers/soc/mediatek/mmsys/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > \ No newline at end of file
> > +obj-$(CONFIG_MTK_MMSYS) += mt2701-mmsys.o
> > +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > diff --git a/drivers/soc/mediatek/mmsys/mt2701-mmsys.c b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> > new file mode 100644
> > index 0000000..40576d3
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> > @@ -0,0 +1,233 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> > +
> > +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> > +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> > +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> > +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> > +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> > +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> > +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> > +#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> > +#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> > +#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> > +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> > +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> > +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> > +#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> > +
> > +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> > +#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> > +#define DISP_REG_CONFIG_DSI_SEL                        0x050
> > +#define DISP_REG_CONFIG_DPI_SEL                        0x064
> > +
> > +#define OVL0_MOUT_EN_COLOR0                    0x1
> > +#define OD_MOUT_EN_RDMA0                       0x1
> > +#define OD1_MOUT_EN_RDMA1                      BIT(16)
> > +#define UFOE_MOUT_EN_DSI0                      0x1
> > +#define COLOR0_SEL_IN_OVL0                     0x1
> > +#define OVL1_MOUT_EN_COLOR1                    0x1
> > +#define GAMMA_MOUT_EN_RDMA1                    0x1
> > +#define RDMA0_SOUT_DPI0                                0x2
> > +#define RDMA0_SOUT_DPI1                                0x3
> > +#define RDMA0_SOUT_DSI1                                0x1
> > +#define RDMA0_SOUT_DSI2                                0x4
> > +#define RDMA0_SOUT_DSI3                                0x5
> > +#define RDMA1_SOUT_DPI0                                0x2
> > +#define RDMA1_SOUT_DPI1                                0x3
> > +#define RDMA1_SOUT_DSI1                                0x1
> > +#define RDMA1_SOUT_DSI2                                0x4
> > +#define RDMA1_SOUT_DSI3                                0x5
> > +#define RDMA2_SOUT_DPI0                                0x2
> > +#define RDMA2_SOUT_DPI1                                0x3
> > +#define RDMA2_SOUT_DSI1                                0x1
> > +#define RDMA2_SOUT_DSI2                                0x4
> > +#define RDMA2_SOUT_DSI3                                0x5
> > +#define DPI0_SEL_IN_RDMA1                      0x1
> > +#define DPI0_SEL_IN_RDMA2                      0x3
> > +#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> > +#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> > +#define DSI0_SEL_IN_RDMA1                      0x1
> > +#define DSI0_SEL_IN_RDMA2                      0x4
> > +#define DSI1_SEL_IN_RDMA1                      0x1
> > +#define DSI1_SEL_IN_RDMA2                      0x4
> > +#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> > +#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> > +#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> > +#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> > +#define COLOR1_SEL_IN_OVL1                     0x1
> > +
> > +#define OVL_MOUT_EN_RDMA                       0x1
> > +#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> > +#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> > +#define DSI_SEL_IN_BLS                         0x0
> > +#define DPI_SEL_IN_BLS                         0x0
> > +#define DSI_SEL_IN_RDMA                                0x1
> > +
> > +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > +                                         enum mtk_ddp_comp_id next,
> > +                                         unsigned int *addr)
> > +{
> > +       unsigned int value;
> > +
> > +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > +               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> > +               value = OVL0_MOUT_EN_COLOR0;
> > +       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> > +               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> > +               value = OVL_MOUT_EN_RDMA;
> > +       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> > +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +               value = OD_MOUT_EN_RDMA0;
> > +       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> > +               value = UFOE_MOUT_EN_DSI0;
> > +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > +               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> > +               value = OVL1_MOUT_EN_COLOR1;
> > +       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> > +               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> > +               value = GAMMA_MOUT_EN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> > +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > +               value = OD1_MOUT_EN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DPI0;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DPI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DSI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DSI2;
> > +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > +               value = RDMA0_SOUT_DSI3;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DSI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DSI2;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DSI3;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DPI0;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > +               value = RDMA1_SOUT_DPI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DPI0;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DPI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DSI1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DSI2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > +               value = RDMA2_SOUT_DSI3;
> > +       } else {
> > +               value = 0;
> > +       }
> > +
> > +       return value;
> > +}
> > +
> > +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > +                                        enum mtk_ddp_comp_id next,
> > +                                        unsigned int *addr)
> > +{
> > +       unsigned int value;
> > +
> > +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > +               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> > +               value = COLOR0_SEL_IN_OVL0;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI0_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI1_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI0_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +               value = DSI1_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI2_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +               value = DSI3_SEL_IN_RDMA1;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI0_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > +               value = DPI1_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI0_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > +               value = DSI1_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI2_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > +               value = DSI3_SEL_IN_RDMA2;
> > +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > +               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> > +               value = COLOR1_SEL_IN_OVL1;
> > +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > +               *addr = DISP_REG_CONFIG_DSI_SEL;
> > +               value = DSI_SEL_IN_BLS;
> > +       } else {
> > +               value = 0;
> > +       }
> > +
> > +       return value;
> > +}
> > +
> > +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> > +                                  enum mtk_ddp_comp_id cur,
> > +                                  enum mtk_ddp_comp_id next)
> > +{
> > +       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > +               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> > +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > +               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> > +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > +               writel_relaxed(DSI_SEL_IN_RDMA,
> > +                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> > +               writel_relaxed(DPI_SEL_IN_BLS,
> > +                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> > +       }
> > +}
> > +
> > +struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs = {
> > +       .mout_en = mtk_mmsys_ddp_mout_en,
> > +       .sel_in = mtk_mmsys_ddp_sel_in,
> > +       .sout_sel = mtk_mmsys_ddp_sout_sel,
> > +};
> > diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > index da2de8f..9d6a3e9 100644
> > --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> > @@ -10,91 +10,34 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/soc/mediatek/mtk-mmsys.h>
> >
> > -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> > -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> > -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> > -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> > -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> > -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> > -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> > -#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> > -#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> > -#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> > -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> > -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> > -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> > -#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> > -
> > -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> > -#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> > -#define DISP_REG_CONFIG_DSI_SEL                        0x050
> > -#define DISP_REG_CONFIG_DPI_SEL                        0x064
> > -
> > -#define OVL0_MOUT_EN_COLOR0                    0x1
> > -#define OD_MOUT_EN_RDMA0                       0x1
> > -#define OD1_MOUT_EN_RDMA1                      BIT(16)
> > -#define UFOE_MOUT_EN_DSI0                      0x1
> > -#define COLOR0_SEL_IN_OVL0                     0x1
> > -#define OVL1_MOUT_EN_COLOR1                    0x1
> > -#define GAMMA_MOUT_EN_RDMA1                    0x1
> > -#define RDMA0_SOUT_DPI0                                0x2
> > -#define RDMA0_SOUT_DPI1                                0x3
> > -#define RDMA0_SOUT_DSI1                                0x1
> > -#define RDMA0_SOUT_DSI2                                0x4
> > -#define RDMA0_SOUT_DSI3                                0x5
> > -#define RDMA1_SOUT_DPI0                                0x2
> > -#define RDMA1_SOUT_DPI1                                0x3
> > -#define RDMA1_SOUT_DSI1                                0x1
> > -#define RDMA1_SOUT_DSI2                                0x4
> > -#define RDMA1_SOUT_DSI3                                0x5
> > -#define RDMA2_SOUT_DPI0                                0x2
> > -#define RDMA2_SOUT_DPI1                                0x3
> > -#define RDMA2_SOUT_DSI1                                0x1
> > -#define RDMA2_SOUT_DSI2                                0x4
> > -#define RDMA2_SOUT_DSI3                                0x5
> > -#define DPI0_SEL_IN_RDMA1                      0x1
> > -#define DPI0_SEL_IN_RDMA2                      0x3
> > -#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> > -#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> > -#define DSI0_SEL_IN_RDMA1                      0x1
> > -#define DSI0_SEL_IN_RDMA2                      0x4
> > -#define DSI1_SEL_IN_RDMA1                      0x1
> > -#define DSI1_SEL_IN_RDMA2                      0x4
> > -#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> > -#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> > -#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> > -#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> > -#define COLOR1_SEL_IN_OVL1                     0x1
> > -
> > -#define OVL_MOUT_EN_RDMA                       0x1
> > -#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> > -#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> > -#define DSI_SEL_IN_BLS                         0x0
> > -#define DPI_SEL_IN_BLS                         0x0
> > -#define DSI_SEL_IN_RDMA                                0x1
> > -
> >  struct mtk_mmsys_driver_data {
> >         const char *clk_driver;
> > +       const struct mtk_mmsys_conn_funcs *funcs;
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> >         .clk_driver = "clk-mt2701-mm",
> > +       .funcs = &mt2701_mmsys_funcs,
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
> >         .clk_driver = "clk-mt2712-mm",
> > +       .funcs = &mt2701_mmsys_funcs,
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
> >         .clk_driver = "clk-mt6779-mm",
> > +       .funcs = &mt2701_mmsys_funcs,
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
> >         .clk_driver = "clk-mt6797-mm",
> > +       .funcs = &mt2701_mmsys_funcs,
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> >         .clk_driver = "clk-mt8173-mm",
> > +       .funcs = &mt2701_mmsys_funcs,
> >  };
> >
> >  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> > @@ -106,176 +49,26 @@ struct mtk_mmsys {
> >         const struct mtk_mmsys_driver_data *data;
> >  };
> >
> > -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > -                                         enum mtk_ddp_comp_id next,
> > -                                         unsigned int *addr)
> > -{
> > -       unsigned int value;
> > -
> > -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> > -               value = OVL0_MOUT_EN_COLOR0;
> > -       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> > -               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> > -               value = OVL_MOUT_EN_RDMA;
> > -       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> > -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > -               value = OD_MOUT_EN_RDMA0;
> > -       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> > -               value = UFOE_MOUT_EN_DSI0;
> > -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> > -               value = OVL1_MOUT_EN_COLOR1;
> > -       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> > -               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> > -               value = GAMMA_MOUT_EN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> > -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> > -               value = OD1_MOUT_EN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DPI0;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DPI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DSI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DSI2;
> > -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> > -               value = RDMA0_SOUT_DSI3;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DSI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DSI2;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DSI3;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DPI0;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> > -               value = RDMA1_SOUT_DPI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DPI0;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DPI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DSI1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DSI2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> > -               value = RDMA2_SOUT_DSI3;
> > -       } else {
> > -               value = 0;
> > -       }
> > -
> > -       return value;
> > -}
> > -
> > -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> > -                                        enum mtk_ddp_comp_id next,
> > -                                        unsigned int *addr)
> > -{
> > -       unsigned int value;
> > -
> > -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> > -               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> > -               value = COLOR0_SEL_IN_OVL0;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI0_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI1_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI0_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > -               value = DSI1_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI2_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > -               value = DSI3_SEL_IN_RDMA1;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI0_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> > -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> > -               value = DPI1_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI0_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> > -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> > -               value = DSI1_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI2_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> > -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> > -               value = DSI3_SEL_IN_RDMA2;
> > -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> > -               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> > -               value = COLOR1_SEL_IN_OVL1;
> > -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > -               *addr = DISP_REG_CONFIG_DSI_SEL;
> > -               value = DSI_SEL_IN_BLS;
> > -       } else {
> > -               value = 0;
> > -       }
> > -
> > -       return value;
> > -}
> > -
> > -static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> > -                                  enum mtk_ddp_comp_id cur,
> > -                                  enum mtk_ddp_comp_id next)
> > -{
> > -       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> > -               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> > -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> > -               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> > -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> > -               writel_relaxed(DSI_SEL_IN_RDMA,
> > -                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> > -               writel_relaxed(DPI_SEL_IN_BLS,
> > -                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> > -       }
> > -}
> > -
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >                            enum mtk_ddp_comp_id cur,
> >                            enum mtk_ddp_comp_id next)
> >  {
> >         struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >         unsigned int addr, value, reg;
> > +       struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;
> 
> Compiling error here: initializing 'struct mtk_mmsys_conn_funcs *'
> with an expression of type 'const struct mtk_mmsys_conn_funcs *const'
> discards qualifiers
> [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>         struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;
> 
> const struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;
> 
tks,  this will be fixed in next version.

> >
> > -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > +       if (!funcs)
> > +               return;
> > +
> > +       value = funcs->mout_en(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(mmsys->regs + addr) | value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> >         }
> >
> > -       mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
> > +       funcs->sout_sel(mmsys->regs, cur, next);
> >
> > -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > +       value = funcs->sel_in(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(mmsys->regs + addr) | value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> > @@ -289,14 +82,18 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
> >  {
> >         struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >         unsigned int addr, value, reg;
> > +       struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;
> > +
> > +       if (!funcs)
> > +               return;
> >
> > -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> > +       value = funcs->mout_en(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> >         }
> >
> > -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> > +       value = funcs->sel_in(cur, next, &addr);
> >         if (value) {
> >                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
> >                 writel_relaxed(reg, mmsys->regs + addr);
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> > index 2228bf6..17e8b91 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -42,6 +42,20 @@ enum mtk_ddp_comp_id {
> >         DDP_COMPONENT_ID_MAX,
> >  };
> >
> > +struct mtk_mmsys_conn_funcs {
> > +       u32 (*mout_en)(enum mtk_ddp_comp_id cur,
> > +                      enum mtk_ddp_comp_id next,
> > +                      unsigned int *addr);
> > +       u32 (*sel_in)(enum mtk_ddp_comp_id cur,
> > +                     enum mtk_ddp_comp_id next,
> > +                     unsigned int *addr);
> > +       void (*sout_sel)(void __iomem *config_regs,
> > +                        enum mtk_ddp_comp_id cur,
> > +                        enum mtk_ddp_comp_id next);
> > +};
> > +
> > +extern struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs;
> > +
> >  void mtk_mmsys_ddp_connect(struct device *dev,
> >                            enum mtk_ddp_comp_id cur,
> >                            enum mtk_ddp_comp_id next);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
