Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39C22ABCF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 11:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29F16E883;
	Thu, 23 Jul 2020 09:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7F76E883
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 09:32:20 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id e4so4464301oib.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7WoU12tVY1vsfUu6o9NBf6zkbsBevsAfooCiIRXZ9Jo=;
 b=YbomFKF6hiU1wwGTCm4zk2VP5SbN8Or2Sh//xZudtPLnOvQiNAUJU3vbMZIyaTqOya
 EQJMRmTIIakT0fOvkJwfwlIR5Ya8SvlzZWoFfjnVYqaLfmSNFfAA/1fc7uWgdWkQdNmt
 psNOxUnKv4Bv/hK4iYn8nwMbabM04RAiTxV0LCiFgKrKJV82QgDpgIKHpvOFOeDLv7jB
 /VbvI8x7oBtUWJyH+KXUczYX4QDaoc0jrdWDQWEXrHE327eyf78TIJbPYqSjJsMsDIpR
 Zkat00IR4MDZ8ziQUGyWDNltnAIHh5Nr37oyaUhaZ66tawZVbGlrRsNnb5MUGdwp7Cma
 evmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7WoU12tVY1vsfUu6o9NBf6zkbsBevsAfooCiIRXZ9Jo=;
 b=RplIkVBUEyj3gkzepgU7n7oAcYmq7+sTXVRH6zciPEc3cimJN4MqM48aWiMmlvIaw0
 pM3BNxoPnLFke1TlXI5AAudqlDUwq0NG3292Ixji0eyfv0vIej52ulGDffS7TfVqjhrd
 Xv05K6fDRAI9oS2BitBqrZNlMxULHbwnwFO8rhKppTSmQxZ+qL/+GP8URfYTydyuIGAG
 aoeRa3a32Hv75EZP5dvzS/zqTGFYZYCM+uzHp9eW8fMR006gGpuShuaU+YEewFf3T7XM
 D8R+YBuf1E0zlpK6LhtZXlhYCkx2EktWcPMzWOqWXBBgJWMfHGCc7USShUwXSeTtLIZk
 Ud2A==
X-Gm-Message-State: AOAM530NIiC/9OG64TBVER19zR03TF7mUgQVhW0MCJimgh6ftc8PnOAV
 6ZUGO3l8S6kxJjCrj7SRxV8/rlSblkZNa8hW1PU=
X-Google-Smtp-Source: ABdhPJz0qksrDz69AetTsxIgxx5BhlxfPinT+W0IljLh4gKDIP432RYoMygC2nTm1aPfm2RuIl+fsfcWCUpEuhlraCQ=
X-Received: by 2002:aca:5b42:: with SMTP id p63mr3112637oib.39.1595496739242; 
 Thu, 23 Jul 2020 02:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-3-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 23 Jul 2020 11:32:07 +0200
Message-ID: <CAFqH_51sKR-tUHhdJs4N5KaGq-4+oFsAOhZsJqpFk0ikZjJ=mg@mail.gmail.com>
Subject: Re: [v7, PATCH 2/7] mtk-mmsys: add mmsys private data
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yongqiang Niu,

Thank you for your patch.

Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 23
de jul. 2020 a les 4:05:
>
> add mmsys private data
>

I think this change requires a better explanation of what you are
doing. Although I'm really uncomfortable with this change, why you
need to create a new mt2701-mmsys file?

> Feature: drm/mediatek

Remove this.

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/Makefile             |   1 +
>  drivers/soc/mediatek/mmsys/Makefile       |   2 +
>  drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 250 +++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          | 271 +++++-------------------------
>  include/linux/soc/mediatek/mtk-mmsys.h    |  15 ++
>  5 files changed, 314 insertions(+), 225 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
>  create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
>
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 2afa7b9..b37ac2c 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>  obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> new file mode 100644
> index 0000000..33b0dab
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y += mt2701-mmsys.o
> diff --git a/drivers/soc/mediatek/mmsys/mt2701-mmsys.c b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> new file mode 100644
> index 0000000..b8e53b0
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> @@ -0,0 +1,250 @@
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

Can't be reused this function for all devices? You did in the previous
series, why not now?

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

Same question for this function


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
> +               .name = "mt2701-mmsys",
> +       },
> +};
> +
> +builtin_platform_driver(mmsys_drv);
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 36ad66b..605b992 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -10,267 +10,63 @@
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
> +       const char *mmsys_driver;
> +};
> +

What about doing this

+struct mtk_mmsys_reg_data {
+ u32 ovl0_mout_en;
+};

> +struct mtk_mmsys_private_data {
> +       void __iomem *config_regs;
> +       struct mtk_mmsys_conn_funcs *funcs;

And instead of point to the funcs add the registers data here.

            const struct mtk_mmsys_reg_data regs;

>  };
>
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>         .clk_driver = "clk-mt2701-mm",
> +       .mmsys_driver = "mt2701-mmsys",

And here
+          .regs = {
+                   .ovl0_mout_en = DISP_REG_CONFIG_DISP_OVL_MOUT_EN,
+         },

AFAICS these registers are only used here, so you can get them per SoC
and configure properly

>  };
>
>  static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>         .clk_driver = "clk-mt2712-mm",
> +       .mmsys_driver = "mt2701-mmsys",
>  };
>
>  static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
>         .clk_driver = "clk-mt6779-mm",
> +       .mmsys_driver = "mt2701-mmsys",
>  };
>
>  static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
>         .clk_driver = "clk-mt6797-mm",
> +       .mmsys_driver = "mt2701-mmsys",
>  };
>
>  static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>         .clk_driver = "clk-mt8173-mm",
> +       .mmsys_driver = "mt2701-mmsys",
>  };
>
>  static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>         .clk_driver = "clk-mt8183-mm",
>  };
>
> -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> -                                         enum mtk_ddp_comp_id next,
> -                                         unsigned int *addr)
> -{

And you can do here:

+ const struct mtk_mmsys_driver_data *data;
+
+ data = of_device_get_match_data(dev);

And then use data->regs.ovl0_mout_en where you need it.


> -       unsigned int value;
> -
> -       if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> -               value = OVL0_MOUT_EN_COLOR0;
> -       } else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> -               *addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> -               value = OVL_MOUT_EN_RDMA;

+  value = data->regs.ovl0_mout_en

And do the same for all the different registers per SoC

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
> -       void __iomem *config_regs = dev_get_drvdata(dev);
> +       struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
> +       void __iomem *config_regs = private->config_regs;
> +       struct mtk_mmsys_conn_funcs *priv_funcs = private->funcs;
>         unsigned int addr, value, reg;
>
> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> +       value = priv_funcs->mout_en(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(config_regs + addr) | value;
>                 writel_relaxed(reg, config_regs + addr);
>         }
>
> -       mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
> +       priv_funcs->sout_sel(config_regs, cur, next);
>
> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> +       value = priv_funcs->sel_in(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(config_regs + addr) | value;
>                 writel_relaxed(reg, config_regs + addr);
> @@ -282,16 +78,18 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>                               enum mtk_ddp_comp_id cur,
>                               enum mtk_ddp_comp_id next)
>  {
> -       void __iomem *config_regs = dev_get_drvdata(dev);
> +       struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
> +       void __iomem *config_regs = private->config_regs;
> +       struct mtk_mmsys_conn_funcs *priv_funcs = private->funcs;
>         unsigned int addr, value, reg;
>
> -       value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> +       value = priv_funcs->mout_en(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(config_regs + addr) & ~value;
>                 writel_relaxed(reg, config_regs + addr);
>         }
>
> -       value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> +       value = priv_funcs->sel_in(cur, next, &addr);
>         if (value) {
>                 reg = readl_relaxed(config_regs + addr) & ~value;
>                 writel_relaxed(reg, config_regs + addr);
> @@ -299,15 +97,29 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>
> +void mtk_mmsys_register_conn_funcs(struct device *dev,
> +                                  struct mtk_mmsys_conn_funcs *funcs)
> +{
> +       struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
> +
> +       private->funcs = funcs;
> +}
> +
>  static int mtk_mmsys_probe(struct platform_device *pdev)
>  {
>         const struct mtk_mmsys_driver_data *data;
>         struct device *dev = &pdev->dev;
>         struct platform_device *clks;
>         struct platform_device *drm;
> +       struct platform_device *mm;
>         void __iomem *config_regs;
>         struct resource *mem;
>         int ret;
> +       struct mtk_mmsys_private_data *private;
> +
> +       private = devm_kzalloc(dev, sizeof(*private), GFP_KERNEL);
> +       if (!private)
> +               return -ENOMEM;
>
>         mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         config_regs = devm_ioremap_resource(dev, mem);
> @@ -317,8 +129,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>                         ret);
>                 return ret;
>         }
> +       private->config_regs = config_regs;
>
> -       platform_set_drvdata(pdev, config_regs);
> +       platform_set_drvdata(pdev, private);
>
>         data = of_device_get_match_data(&pdev->dev);
>
> @@ -327,6 +140,14 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>         if (IS_ERR(clks))
>                 return PTR_ERR(clks);
>
> +       mm = platform_device_register_data(&pdev->dev,
> +                                          data->mmsys_driver,
> +                                          PLATFORM_DEVID_AUTO,
> +                                          NULL,
> +                                          0);
> +       if (IS_ERR(mm))
> +               return PTR_ERR(mm);
> +
>         drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>                                             PLATFORM_DEVID_AUTO, NULL, 0);
>         if (IS_ERR(drm)) {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 2228bf6..89185c6 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -42,6 +42,21 @@ enum mtk_ddp_comp_id {
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
> +void mtk_mmsys_register_conn_funcs(struct device *dev,
> +                                  struct mtk_mmsys_conn_funcs *funcs);
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>                            enum mtk_ddp_comp_id cur,
>                            enum mtk_ddp_comp_id next);
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
