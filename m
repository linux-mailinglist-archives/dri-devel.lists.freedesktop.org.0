Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC6A2DCDD1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3F6E204;
	Thu, 17 Dec 2020 08:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3078925F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 06:04:49 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id d9so26399110iob.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 22:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sz/q5sU2UlSdBZVdyxY21mS5LrjFoGwhXbSOhpWJI38=;
 b=ei2kI36YGkeqG2ERnE2j/LRRuAOQxBfbxmCuG0aHINtF+JzNqxsklLzjp02lv2slLP
 MiMDmlocjK59NwYmyuj46g2hwtt5TKW+5AuIhLl7vB5eMqeZTjOGU4X5siUrm0f8tNpR
 s2PAj4FKM61oNussZcLknwa8IyKoCVHpRqKQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sz/q5sU2UlSdBZVdyxY21mS5LrjFoGwhXbSOhpWJI38=;
 b=K6O1Xv5m0YS32XP7xnbcOOSHo37G5YgVO+V8T1qFlcamIwxet+rOGrOMaSYABWHrxZ
 mo9SErJR87KbRPXp+5UeAUOgmEZarbCcVPeWs/IVvHppAZk/DYT0aF6GmHA/uGBwmNNP
 cbm/3UjGTOfoNEqaxY00LPZIRRxtHrDtOOYNRlSTJ0ClCIh2vAtItUnDaQLoivLdYYti
 cTO0Kld9ysvDYo5S7c7kNhIx0e8KeaWbV037ozXmHinjOVc48Kgn6wo4B5bJ8k33yBT+
 P5T2AFskVEPCl9XRor3OeGkqL7qG65J8+OR/cyXn5c07ZFd9SJ9TM3GinmKJBUP2qbVE
 Jokg==
X-Gm-Message-State: AOAM532L9/AlLSkqFN/WT7Q5zs/a9Aq4bdFKtyI5xoKddcUKXYllEDEM
 be1dhUvHb9IqxCnY/D9j1OUT65/HlrVNM2nwf6A3Bg==
X-Google-Smtp-Source: ABdhPJw61dvNOM1DZsFkUV9yQr5gWJWVPqwgDtC1TQskRbHT3pnmNxYJp2XvJFceQGSlg5sq4Al8lFPdgpuDSrBYj/0=
X-Received: by 2002:a6b:6810:: with SMTP id d16mr45012004ioc.100.1608185088813; 
 Wed, 16 Dec 2020 22:04:48 -0800 (PST)
MIME-Version: 1.0
References: <1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607506379-10998-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607506379-10998-3-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 17 Dec 2020 14:04:22 +0800
Message-ID: <CAJMQK-hHA_8MdU4d5SR1eJOupMJMF2k-D5t7bocaSX0PZBBG_w@mail.gmail.com>
Subject: Re: [PATCH v2, 2/2] soc: mediatek: mmsys: Use function call for
 setting the routing registers
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 9, 2020 at 9:32 AM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> Actually, setting the registers for routing, use multiple 'if-else' for different
> routes, but this code would be more and more complicated while we
> support more and more SoCs. Change that and use a function call per SoC so the
> code will be more portable and clear.
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/Makefile       |   3 +-
>  drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 233 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c    | 241 +++---------------------------
>  include/linux/soc/mediatek/mtk-mmsys.h    |  14 ++
>  4 files changed, 268 insertions(+), 223 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
>
> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> index 5d976d7..ac03025 100644
> --- a/drivers/soc/mediatek/mmsys/Makefile
> +++ b/drivers/soc/mediatek/mmsys/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> \ No newline at end of file
> +obj-$(CONFIG_MTK_MMSYS) += mt2701-mmsys.o
> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> diff --git a/drivers/soc/mediatek/mmsys/mt2701-mmsys.c b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> new file mode 100644
> index 0000000..40576d3
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +
> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> +#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> +#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> +#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> +#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> +
> +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> +#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> +#define DISP_REG_CONFIG_DSI_SEL                        0x050
> +#define DISP_REG_CONFIG_DPI_SEL                        0x064
> +
> +#define OVL0_MOUT_EN_COLOR0                    0x1
> +#define OD_MOUT_EN_RDMA0                       0x1
> +#define OD1_MOUT_EN_RDMA1                      BIT(16)
> +#define UFOE_MOUT_EN_DSI0                      0x1
> +#define COLOR0_SEL_IN_OVL0                     0x1
> +#define OVL1_MOUT_EN_COLOR1                    0x1
> +#define GAMMA_MOUT_EN_RDMA1                    0x1
> +#define RDMA0_SOUT_DPI0                                0x2
> +#define RDMA0_SOUT_DPI1                                0x3
> +#define RDMA0_SOUT_DSI1                                0x1
> +#define RDMA0_SOUT_DSI2                                0x4
> +#define RDMA0_SOUT_DSI3                                0x5
> +#define RDMA1_SOUT_DPI0                                0x2
> +#define RDMA1_SOUT_DPI1                                0x3
> +#define RDMA1_SOUT_DSI1                                0x1
> +#define RDMA1_SOUT_DSI2                                0x4
> +#define RDMA1_SOUT_DSI3                                0x5
> +#define RDMA2_SOUT_DPI0                                0x2
> +#define RDMA2_SOUT_DPI1                                0x3
> +#define RDMA2_SOUT_DSI1                                0x1
> +#define RDMA2_SOUT_DSI2                                0x4
> +#define RDMA2_SOUT_DSI3                                0x5
> +#define DPI0_SEL_IN_RDMA1                      0x1
> +#define DPI0_SEL_IN_RDMA2                      0x3
> +#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> +#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> +#define DSI0_SEL_IN_RDMA1                      0x1
> +#define DSI0_SEL_IN_RDMA2                      0x4
> +#define DSI1_SEL_IN_RDMA1                      0x1
> +#define DSI1_SEL_IN_RDMA2                      0x4
> +#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> +#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> +#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> +#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> +#define COLOR1_SEL_IN_OVL1                     0x1
> +
> +#define OVL_MOUT_EN_RDMA                       0x1
> +#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> +#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> +#define DSI_SEL_IN_BLS                         0x0
> +#define DPI_SEL_IN_BLS                         0x0
> +#define DSI_SEL_IN_RDMA                                0x1
> +
> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> +                                         enum mtk_ddp_comp_id next,
> +                                         unsigned int *addr)
> +{
> +       unsigned int value;
> +
> +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> +               value = OVL0_MOUT_EN_COLOR0;
> +       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> +               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> +               value = OVL_MOUT_EN_RDMA;
> +       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +               value = OD_MOUT_EN_RDMA0;
> +       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> +               value = UFOE_MOUT_EN_DSI0;
> +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> +               value = OVL1_MOUT_EN_COLOR1;
> +       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> +               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> +               value = GAMMA_MOUT_EN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> +               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> +               value = OD1_MOUT_EN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DPI0;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DPI1;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DSI1;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DSI2;
> +       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> +               value = RDMA0_SOUT_DSI3;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DSI1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DSI2;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DSI3;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DPI0;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> +               value = RDMA1_SOUT_DPI1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DPI0;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DPI1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DSI1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DSI2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +               value = RDMA2_SOUT_DSI3;
> +       } else {
> +               value = 0;
> +       }
> +
> +       return value;
> +}
> +
> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> +                                        enum mtk_ddp_comp_id next,
> +                                        unsigned int *addr)
> +{
> +       unsigned int value;
> +
> +       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> +               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> +               value = COLOR0_SEL_IN_OVL0;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI0_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI1_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI0_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +               value = DSI1_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI2_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +               value = DSI3_SEL_IN_RDMA1;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI0_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> +               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> +               value = DPI1_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI0_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> +               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> +               value = DSI1_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI2_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> +               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +               value = DSI3_SEL_IN_RDMA2;
> +       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> +               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> +               value = COLOR1_SEL_IN_OVL1;
> +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> +               *addr = DISP_REG_CONFIG_DSI_SEL;
> +               value = DSI_SEL_IN_BLS;
> +       } else {
> +               value = 0;
> +       }
> +
> +       return value;
> +}
> +
> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> +                                  enum mtk_ddp_comp_id cur,
> +                                  enum mtk_ddp_comp_id next)
> +{
> +       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> +               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> +       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> +               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> +                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> +               writel_relaxed(DSI_SEL_IN_RDMA,
> +                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> +               writel_relaxed(DPI_SEL_IN_BLS,
> +                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> +       }
> +}
> +
> +struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs = {
> +       .mout_en = mtk_mmsys_ddp_mout_en,
> +       .sel_in = mtk_mmsys_ddp_sel_in,
> +       .sout_sel = mtk_mmsys_ddp_sout_sel,
> +};
> diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> index da2de8f..9d6a3e9 100644
> --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> @@ -10,91 +10,34 @@
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>
> -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> -#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> -#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> -#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> -#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> -
> -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> -#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> -#define DISP_REG_CONFIG_DSI_SEL                        0x050
> -#define DISP_REG_CONFIG_DPI_SEL                        0x064
> -
> -#define OVL0_MOUT_EN_COLOR0                    0x1
> -#define OD_MOUT_EN_RDMA0                       0x1
> -#define OD1_MOUT_EN_RDMA1                      BIT(16)
> -#define UFOE_MOUT_EN_DSI0                      0x1
> -#define COLOR0_SEL_IN_OVL0                     0x1
> -#define OVL1_MOUT_EN_COLOR1                    0x1
> -#define GAMMA_MOUT_EN_RDMA1                    0x1
> -#define RDMA0_SOUT_DPI0                                0x2
> -#define RDMA0_SOUT_DPI1                                0x3
> -#define RDMA0_SOUT_DSI1                                0x1
> -#define RDMA0_SOUT_DSI2                                0x4
> -#define RDMA0_SOUT_DSI3                                0x5
> -#define RDMA1_SOUT_DPI0                                0x2
> -#define RDMA1_SOUT_DPI1                                0x3
> -#define RDMA1_SOUT_DSI1                                0x1
> -#define RDMA1_SOUT_DSI2                                0x4
> -#define RDMA1_SOUT_DSI3                                0x5
> -#define RDMA2_SOUT_DPI0                                0x2
> -#define RDMA2_SOUT_DPI1                                0x3
> -#define RDMA2_SOUT_DSI1                                0x1
> -#define RDMA2_SOUT_DSI2                                0x4
> -#define RDMA2_SOUT_DSI3                                0x5
> -#define DPI0_SEL_IN_RDMA1                      0x1
> -#define DPI0_SEL_IN_RDMA2                      0x3
> -#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> -#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> -#define DSI0_SEL_IN_RDMA1                      0x1
> -#define DSI0_SEL_IN_RDMA2                      0x4
> -#define DSI1_SEL_IN_RDMA1                      0x1
> -#define DSI1_SEL_IN_RDMA2                      0x4
> -#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> -#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> -#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> -#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> -#define COLOR1_SEL_IN_OVL1                     0x1
> -
> -#define OVL_MOUT_EN_RDMA                       0x1
> -#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> -#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> -#define DSI_SEL_IN_BLS                         0x0
> -#define DPI_SEL_IN_BLS                         0x0
> -#define DSI_SEL_IN_RDMA                                0x1
> -
>  struct mtk_mmsys_driver_data {
>         const char *clk_driver;
> +       const struct mtk_mmsys_conn_funcs *funcs;
>  };
>
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>         .clk_driver = "clk-mt2701-mm",
> +       .funcs = &mt2701_mmsys_funcs,
>  };
>
>  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>         .clk_driver = "clk-mt2712-mm",
> +       .funcs = &mt2701_mmsys_funcs,
>  };
>
>  static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
>         .clk_driver = "clk-mt6779-mm",
> +       .funcs = &mt2701_mmsys_funcs,
>  };
>
>  static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
>         .clk_driver = "clk-mt6797-mm",
> +       .funcs = &mt2701_mmsys_funcs,
>  };
>
>  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>         .clk_driver = "clk-mt8173-mm",
> +       .funcs = &mt2701_mmsys_funcs,
>  };
>
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
> @@ -106,176 +49,26 @@ struct mtk_mmsys {
>         const struct mtk_mmsys_driver_data *data;
>  };
>
> -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> -                                         enum mtk_ddp_comp_id next,
> -                                         unsigned int *addr)
> -{
> -       unsigned int value;
> -
> -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> -               value = OVL0_MOUT_EN_COLOR0;
> -       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> -               value = OVL_MOUT_EN_RDMA;
> -       } else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> -               value = OD_MOUT_EN_RDMA0;
> -       } else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> -               value = UFOE_MOUT_EN_DSI0;
> -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> -               value = OVL1_MOUT_EN_COLOR1;
> -       } else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> -               *addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> -               value = GAMMA_MOUT_EN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> -               *addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> -               value = OD1_MOUT_EN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DPI0;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DPI1;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DSI1;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DSI2;
> -       } else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -               value = RDMA0_SOUT_DSI3;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DSI1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DSI2;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DSI3;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DPI0;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -               value = RDMA1_SOUT_DPI1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DPI0;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DPI1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DSI1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DSI2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -               value = RDMA2_SOUT_DSI3;
> -       } else {
> -               value = 0;
> -       }
> -
> -       return value;
> -}
> -
> -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> -                                        enum mtk_ddp_comp_id next,
> -                                        unsigned int *addr)
> -{
> -       unsigned int value;
> -
> -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -               *addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> -               value = COLOR0_SEL_IN_OVL0;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI0_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI1_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI0_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -               value = DSI1_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI2_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -               value = DSI3_SEL_IN_RDMA1;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI0_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -               *addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -               value = DPI1_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI0_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -               *addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -               value = DSI1_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI2_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -               *addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -               value = DSI3_SEL_IN_RDMA2;
> -       } else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -               *addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> -               value = COLOR1_SEL_IN_OVL1;
> -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -               *addr = DISP_REG_CONFIG_DSI_SEL;
> -               value = DSI_SEL_IN_BLS;
> -       } else {
> -               value = 0;
> -       }
> -
> -       return value;
> -}
> -
> -static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> -                                  enum mtk_ddp_comp_id cur,
> -                                  enum mtk_ddp_comp_id next)
> -{
> -       if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -               writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> -       } else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> -               writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> -                              config_regs + DISP_REG_CONFIG_OUT_SEL);
> -               writel_relaxed(DSI_SEL_IN_RDMA,
> -                              config_regs + DISP_REG_CONFIG_DSI_SEL);
> -               writel_relaxed(DPI_SEL_IN_BLS,
> -                              config_regs + DISP_REG_CONFIG_DPI_SEL);
> -       }
> -}
> -
>  void mtk_mmsys_ddp_connect(struct device *dev,
>                            enum mtk_ddp_comp_id cur,
>                            enum mtk_ddp_comp_id next)
>  {
>         struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>         unsigned int addr, value, reg;
> +       struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;

Compiling error here: initializing 'struct mtk_mmsys_conn_funcs *'
with an expression of type 'const struct mtk_mmsys_conn_funcs *const'
discards qualifiers
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
        struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;

const struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;

>
> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> +       if (!funcs)
> +               return;
> +
> +       value = funcs->mout_en(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(mmsys->regs + addr) | value;
>                 writel_relaxed(reg, mmsys->regs + addr);
>         }
>
> -       mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
> +       funcs->sout_sel(mmsys->regs, cur, next);
>
> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> +       value = funcs->sel_in(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(mmsys->regs + addr) | value;
>                 writel_relaxed(reg, mmsys->regs + addr);
> @@ -289,14 +82,18 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  {
>         struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>         unsigned int addr, value, reg;
> +       struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;
> +
> +       if (!funcs)
> +               return;
>
> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> +       value = funcs->mout_en(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
>                 writel_relaxed(reg, mmsys->regs + addr);
>         }
>
> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> +       value = funcs->sel_in(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
>                 writel_relaxed(reg, mmsys->regs + addr);
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 2228bf6..17e8b91 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -42,6 +42,20 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_ID_MAX,
>  };
>
> +struct mtk_mmsys_conn_funcs {
> +       u32 (*mout_en)(enum mtk_ddp_comp_id cur,
> +                      enum mtk_ddp_comp_id next,
> +                      unsigned int *addr);
> +       u32 (*sel_in)(enum mtk_ddp_comp_id cur,
> +                     enum mtk_ddp_comp_id next,
> +                     unsigned int *addr);
> +       void (*sout_sel)(void __iomem *config_regs,
> +                        enum mtk_ddp_comp_id cur,
> +                        enum mtk_ddp_comp_id next);
> +};
> +
> +extern struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs;
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>                            enum mtk_ddp_comp_id cur,
>                            enum mtk_ddp_comp_id next);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
