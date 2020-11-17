Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C171D2B5B50
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA736E157;
	Tue, 17 Nov 2020 08:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A717C6E128
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 07:34:19 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id x18so3793179ilq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 23:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6HDQ36IQmVwckUFR1jBquv3GATc8YP+i067nuhtqXMU=;
 b=FkJC1QkzBGq1xiw3ZYZUvrgU3D/qhzlZFl95blKrpdFb0mMjRtHTGcsKULzeSqxcLD
 TcJtuOPAQKUv0SRgMRAb2Z390dosWlnmIoZX2RRjoNzGmW3ofFHJCaJ9FOP1FI+nBpb+
 9dJ7L2uxkDZN8uJKmzLsnnFBlw4TCwwcwwkmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6HDQ36IQmVwckUFR1jBquv3GATc8YP+i067nuhtqXMU=;
 b=ACQZW0gTKuDoQimbI2rQy13L9GS5NQT87B+drUM7cjukanK/SfhGhxhi1bMA5/O0su
 VQepHq2Rg0FkM+1D4evoR+Z6osYw8HZ9C8NXPydlz1bkGA9yr16LmawybwqCB1gYh1Tn
 WnC/f/ueSwHAKw3de9IosPfrGZAAWEobfTT+KkCQwXRDQR+HLJjmc5OfG5642LjxHnzn
 s4GwWbuJMwYyfVLcNDk+WqvYtKd9h3HnjaBVc+7lD238xFMqjtNvsj8qYkXDvJ8u+srS
 S+R3AI9AAVDA+jyN4ST6dVSiYBt+sxIraFC9X+78KBGBzJjA413PffgkZY+qay8NofWG
 MZTg==
X-Gm-Message-State: AOAM531uet5LLaG9jDzrIQs9fXyUDX7WaueiEK7MLCAWfJQUWX1vM6ag
 /h1UGmOXp01D0YU34tJupU5ayjCf3td8Q4NoqSPbmw==
X-Google-Smtp-Source: ABdhPJyhldjhwb1mLZC438M7LVHuxra/t1HCNICdkNriJ7L2AIbB4FEpFKlINz1Bn9qS+8p5dsClFMJU1CAg1+wejAE=
X-Received: by 2002:a92:dd87:: with SMTP id g7mr12363454iln.102.1605598458861; 
 Mon, 16 Nov 2020 23:34:18 -0800 (PST)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-5-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 17 Nov 2020 15:33:53 +0800
Message-ID: <CAJMQK-hAhu00a4X3SWZVFJLodDqAdTMZi4TmZPFJN=O6VM=DCQ@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 4/7] mtk-mmsys: add mt8183 mmsys support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Tue, 17 Nov 2020 08:51:59 +0000
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

On Sat, Aug 8, 2020 at 2:53 AM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> add mt8183 mmsys support
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/Makefile       |   1 +
>  drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 154 ++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          |   1 +
>  3 files changed, 156 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c
>
> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> index 33b0dab..62cfedf 100644
> --- a/drivers/soc/mediatek/mmsys/Makefile
> +++ b/drivers/soc/mediatek/mmsys/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += mt2701-mmsys.o
> +obj-y += mt8183-mmsys.o
> diff --git a/drivers/soc/mediatek/mmsys/mt8183-mmsys.c b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
> new file mode 100644
> index 0000000..e5170b5
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +
> +#define DISP_OVL0_MOUT_EN              0xf00
> +#define DISP_OVL0_2L_MOUT_EN           0xf04
> +#define DISP_OVL1_2L_MOUT_EN           0xf08
> +#define DISP_DITHER0_MOUT_EN           0xf0c
> +#define DISP_PATH0_SEL_IN              0xf24
> +#define DISP_DSI0_SEL_IN               0xf2c
> +#define DISP_DPI0_SEL_IN               0xf30
> +#define DISP_RDMA0_SOUT_SEL_IN         0xf50
> +#define DISP_RDMA1_SOUT_SEL_IN         0xf54
> +
> +#define OVL0_MOUT_EN_OVL0_2L                   BIT(4)
> +#define OVL0_2L_MOUT_EN_DISP_PATH0             BIT(0)
> +#define OVL1_2L_MOUT_EN_RDMA1                  BIT(4)
> +#define DITHER0_MOUT_IN_DSI0                   BIT(0)
> +#define DISP_PATH0_SEL_IN_OVL0_2L              0x1
> +#define DSI0_SEL_IN_RDMA0                      0x1
> +#define DSI0_SEL_IN_RDMA1                      0x3
> +#define DPI0_SEL_IN_RDMA0                      0x1
> +#define DPI0_SEL_IN_RDMA1                      0x2
> +#define RDMA0_SOUT_COLOR0                      0x1
> +#define RDMA1_SOUT_DSI0                                0x1
> +
> +struct mmsys_path_sel {
> +       enum mtk_ddp_comp_id cur;
> +       enum mtk_ddp_comp_id next;
> +       u32 addr;
> +       u32 val;
> +};
> +
> +static struct mmsys_path_sel mmsys_mout_en[] = {
> +       {
> +               DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> +               DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_OVL0_2L,
> +       },
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               DISP_OVL0_2L_MOUT_EN, OVL0_2L_MOUT_EN_DISP_PATH0,
> +       },
> +       {
> +               DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
> +               DISP_OVL1_2L_MOUT_EN, OVL1_2L_MOUT_EN_RDMA1,
> +       },
> +       {
> +               DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +               DISP_DITHER0_MOUT_EN, DITHER0_MOUT_IN_DSI0,
> +       },
> +};
> +
> +static struct mmsys_path_sel mmsys_sel_in[] = {
> +       {
> +               DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
> +               DISP_PATH0_SEL_IN, DISP_PATH0_SEL_IN_OVL0_2L,
> +       },
> +       {
> +               DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +               DISP_DPI0_SEL_IN, DPI0_SEL_IN_RDMA1,
> +       },
> +};
> +
> +static struct mmsys_path_sel mmsys_sout_sel[] = {
> +       {
> +               DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +               DISP_RDMA0_SOUT_SEL_IN, RDMA0_SOUT_COLOR0,
> +       },
> +};
> +
> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> +                                         enum mtk_ddp_comp_id next,
> +                                         unsigned int *addr)
> +{
> +       u32 i;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_mout_en); i++) {
> +               path = &mmsys_mout_en[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       return path->val;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> +                                        enum mtk_ddp_comp_id next,
> +                                        unsigned int *addr)
> +{
> +       u32 i;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sel_in); i++) {
> +               path = &mmsys_sel_in[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       return path->val;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> +                                  enum mtk_ddp_comp_id cur,
> +                                  enum mtk_ddp_comp_id next)
> +{
> +       u32 i;
> +       u32 val = 0;

This variable is unused.

> +       u32 addr = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sout_sel); i++) {
> +               path = &mmsys_sout_sel[i];
> +               if (cur == path->cur && next == path->next) {
> +                       addr = path->addr;
> +                       writel_relaxed(path->val, config_regs + addr);
> +                       return;
> +               }
> +       }
> +}
> +
> +static struct mtk_mmsys_conn_funcs mmsys_funcs = {
> +       .mout_en = mtk_mmsys_ddp_mout_en,
> +       .sel_in = mtk_mmsys_ddp_sel_in,
> +       .sout_sel = mtk_mmsys_ddp_sout_sel,
> +};
> +
> +static int mmsys_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +
> +       mtk_mmsys_register_conn_funcs(dev->parent, &mmsys_funcs);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver mmsys_drv = {
> +       .probe = mmsys_probe,
> +       .driver = {
> +               .name = "mt8183-mmsys",
> +       },
> +};
> +
> +builtin_platform_driver(mmsys_drv);
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 605b992..6a451ac 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -47,6 +47,7 @@ struct mtk_mmsys_private_data {
>
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>         .clk_driver = "clk-mt8183-mm",
> +       .mmsys_driver = "mt8183-mmsys",
>  };
>
>  void mtk_mmsys_ddp_connect(struct device *dev,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
