Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4A22C705
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 15:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E0B6E971;
	Fri, 24 Jul 2020 13:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A8E6E971
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 13:49:28 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id c7so2981308uap.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cSrp1L0eUQyzHpgZnMO7fi3+svViuZdK8HvAiaNtnzM=;
 b=F78bU+N1HV7Wf9RlToBEZUQmyTEQaGIODTRiaDKs4yyB4G0U6YuJVaYuj/IlLQ3oZM
 O1NCJCME2Xb1tyaz1/5GjQxVDXctNV1lXegkvewW8GUF6DGajF+dzrAy6d93FepB9vAW
 RDXsxkvTuWmVchB9VfqVQaKuv6wbtFVFJ9FPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cSrp1L0eUQyzHpgZnMO7fi3+svViuZdK8HvAiaNtnzM=;
 b=k6jJmMCbqLtmiMJ2faE810D2TzMpNm/mVqtTun0KrWQpl9bh/0LTeY/IxUAWFtxhPy
 Qpfg5KxSmbwDTthME7wEu6hF7xD3UamplnL2dAnR4kgPvBFXxZT8rst7yjfHbVh6AGgB
 SDH6YZF0VdKGJaAgnWbjho7WqW9h6cCuRvloKzoWa4AjIz0u1fz4Sqdk3e0IpZn6gOfU
 n3QLe1goUF99w0LAJRCenXAW9eok7n4BX2rwZvSHdFvSnTTNmUvLnQAhk8DwaCZgtoVI
 8k39cL/H+V3epZfQDdt82RGmegCCst5UZN03Px43GkE/YuwsozFfaZQwLCAb8Yh3Vy4p
 UWDg==
X-Gm-Message-State: AOAM533CIXmdjzItsPUECSecPN67UEl1rNan3vVZybawQjTiYt1UDYbB
 /jPGQI5VmZRKJ9VLsgweAp9JwskmDWKZN8pEERF9KA==
X-Google-Smtp-Source: ABdhPJz94abl2f4Bnx416rASWBY0nE0lUyqccXyLfxR6VRy06jZ8yfaI8YvKbdr25RJZ98fCM0mF202mtckT20J9JZs=
X-Received: by 2002:a9f:2338:: with SMTP id 53mr8106439uae.129.1595598567715; 
 Fri, 24 Jul 2020 06:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-4-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 24 Jul 2020 21:49:16 +0800
Message-ID: <CANMq1KDnk4QgO0=LdXY3zftRgOa_90qXPJHOrKsG2RgJeVVh5g@mail.gmail.com>
Subject: Re: [v7, PATCH 3/7] mtk-mmsys: add mt8183 mmsys support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 10:05 AM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> add mt8183 mmsys support
>
> Feature: drm/mediatek
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/Makefile       |   1 +
>  drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 161 ++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          |   1 +
>  3 files changed, 163 insertions(+)
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
> index 0000000..9d5f276
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
> @@ -0,0 +1,161 @@
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
> +       u32 val = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_mout_en); i++) {
> +               path = &mmsys_mout_en[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       val = path->val;

return path->val?

> +                       break;
> +               }
> +       }
> +
> +       return val;

Then this becomes just return 0;

> +}
> +
> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> +                                        enum mtk_ddp_comp_id next,
> +                                        unsigned int *addr)
> +{
> +       u32 i;
> +       u32 val = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sel_in); i++) {
> +               path = &mmsys_sel_in[i];
> +               if (cur == path->cur && next == path->next) {
> +                       *addr = path->addr;
> +                       val = path->val;
> +                       break;
> +               }
> +       }
> +
> +       return val;

ditto

> +}
> +
> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> +                                  enum mtk_ddp_comp_id cur,
> +                                  enum mtk_ddp_comp_id next)
> +{
> +       u32 i;
> +       u32 val = 0;
> +       u32 addr = 0;
> +       struct mmsys_path_sel *path;
> +
> +       for (i = 0; i < ARRAY_SIZE(mmsys_sout_sel); i++) {
> +               path = &mmsys_sout_sel[i];
> +               if (cur == path->cur && next == path->next) {
> +                       addr = path->addr;
> +                       val = path->val;
> +                       break;

writel_relaxed(path->val, config_regs + path->addr);
return;

> +               }
> +       }
> +
> +       if (val)
> +               writel_relaxed(val, config_regs + addr);
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
> --
> 1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
