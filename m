Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68B0996AAA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB7410E6E9;
	Wed,  9 Oct 2024 12:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MJTgbQug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A401F10E6EB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728478207;
 bh=24yZEurHgvL5dCffqLlxJeDjHSVZ6k/Z2e/PE6NOzyc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MJTgbQugr4ONe2Q+8KGwg9qLvx/qUV+dAxaxQhFh2aMM6zeHYJ3Vier50E4fgbQOm
 7ZLAfIp6W6dpLqiGeVzuY21QpAR0zY4O766hBrA9X/6hr3LKu8Yr4UqVeSLlHNnfi4
 fnjlHRchnBfrtl+QtMTyxLVDM7P0p2I2mvklc/O4DNHNO6NqA+xd3EuCxqZPkfJ0DO
 dRbFh2cu7hNLL1/LTmm7AIvVE1EOjT6jqK9FfE5P1ZTFfjEseqdpwzduKavJWEQthl
 ita9Vp8N2SPsf4sU3j/Y9nUlMM9HuebIGZc23mdQ6Gr4BxQaDbU+C1Owg9CqbEPcZc
 Yy9csClYypoJQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 47A2117E35ED;
 Wed,  9 Oct 2024 14:50:06 +0200 (CEST)
Message-ID: <c9b4aae9-6019-4119-a231-a5814389dcb8@collabora.com>
Date: Wed, 9 Oct 2024 14:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] media: platform: mediatek: add seninf controller
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org,
 shun-yi.wang@mediatek.com
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 09/10/24 13:15, Shu-hsiang Yang ha scritto:
> Introduces support for the sensor interface in the MediaTek SoC,
> with the focus on CSI and stream control. The key functionalities
> include parameter control, metering and maintaining status information,
> interrupt handling, and debugging. These features ensure effective
> management and debugging of the camera sensor interface hardware.
> 
> Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> ---
>   .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
>   .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  911 ++++++
>   .../mtk_cam-seninf-csi0-cphy.h                |   69 +
>   .../mtk_cam-seninf-csi0-dphy.h                |  139 +
>   .../mtk_cam-seninf-hw_phy_2_0.c               | 2879 +++++++++++++++++
>   .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  257 ++
>   .../mtk_cam-seninf-seninf1-csi2.h             |  415 +++
>   .../mtk_cam-seninf-seninf1-mux.h              |  147 +
>   .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   47 +
>   .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   49 +
>   .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   99 +
>   11 files changed, 5017 insertions(+)
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile

The PHY driver should go to the PHY directory as a PHY driver - or at least
part of this mtk_csi_phy_2_0 driver should go there.

I see that this is tightly integrated with the rest of the code in seninf,
but there seems to be many functions that are just handling a "real" PHY.

>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
>   create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
> 
> diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
> new file mode 100644
> index 000000000000..e00b8d3904a9
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2022 MediaTek Inc.
> +
> +mtk-cam-isp-objs += \
> +	mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.o
> diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
> new file mode 100644
> index 000000000000..ec3c621d742a
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
> @@ -0,0 +1,911 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + */
> +
> +#ifndef __SENINF_CAM_MUX_H__
> +#define __SENINF_CAM_MUX_H__
> +
> +#define SENINF_CAM_MUX_CTRL_0 0x0000
> +#define RG_SENINF_CAM_MUX0_SRC_SEL_SHIFT 0
> +#define RG_SENINF_CAM_MUX0_SRC_SEL_MASK (0xf << 0)

For all definitions: drop _SHIFT and use the GENMASK(x,y) macro.

#define RG_SENINF_CAM_MUX0_SRC_SEL GENMASK(7, 0)
#define RG_SENINF_CAM_MUX1_SRC_SEL GENMASK(11, 8)

etc.

> +#define RG_SENINF_CAM_MUX1_SRC_SEL_SHIFT 8
> +#define RG_SENINF_CAM_MUX1_SRC_SEL_MASK (0xf << 8)
> +#define RG_SENINF_CAM_MUX2_SRC_SEL_SHIFT 16
> +#define RG_SENINF_CAM_MUX2_SRC_SEL_MASK (0xf << 16)
> +#define RG_SENINF_CAM_MUX3_SRC_SEL_SHIFT 24
> +#define RG_SENINF_CAM_MUX3_SRC_SEL_MASK (0xf << 24)

..snip..

> diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
> new file mode 100644
> index 000000000000..f24d8a056d0e
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
> @@ -0,0 +1,2879 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2022 MediaTek Inc.
> +
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +
> +#include "../mtk_cam-seninf.h"
> +#include "../mtk_cam-seninf-hw.h"
> +#include "../mtk_cam-seninf-regs.h"
> +#include "mtk_cam-seninf-top-ctrl.h"
> +#include "mtk_cam-seninf-seninf1-mux.h"
> +#include "mtk_cam-seninf-seninf1.h"
> +#include "mtk_cam-seninf-seninf1-csi2.h"
> +#include "mtk_cam-seninf-tg1.h"
> +#include "mtk_cam-seninf-cammux.h"
> +#include "mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h"
> +#include "mtk_cam-seninf-csi0-cphy.h"
> +#include "mtk_cam-seninf-csi0-dphy.h"
> +#include "../kd_imgsensor_define_v4l2.h"
> +
> +/* seninf cfg default, dts may override */

dts may override: for which reason? Why should DT override that? For which usecase?

> +static struct mtk_cam_seninf_cfg _seninf_cfg = {
> +	.mux_num = 8,
> +	.seninf_num = 4,
> +	.cam_mux_num = 11,
> +	.pref_mux_num = 11,
> +};
> +
> +struct mtk_cam_seninf_cfg *g_seninf_cfg = &_seninf_cfg;

That's unused. Drop.

> +
> +static inline void mtk_cam_seninf_set_di_ch_ctrl(void __iomem *pseninf,
> +						 unsigned int stream_id,
> +						 struct seninf_vc *vc)
> +{
> +	if (stream_id > 7)

No magic numbers, please.

#define SOMETHING 7

> +		return;
> +
> +	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),

Is it me, or is SENINF_BITS() not defined?!

> +		    RG_CSI2_DT_SEL, vc->dt);
> +	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
> +		    RG_CSI2_VC_SEL, vc->vc);
> +	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
> +		    RG_CSI2_DT_INTERLEAVE_MODE, 1);
> +	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
> +		    RG_CSI2_VC_INTERLEAVE_EN, 1);
> +

..snip..

> +}
> +
> +int mtk_cam_seninf_init_iomem(struct seninf_ctx *ctx, void __iomem *if_base,
> +			      void __iomem *ana_base)
> +{
> +	u32 i;
> +
> +	ctx->reg_ana_csi_rx[CSI_PORT_0] =

Please don't use "a = b = c" assignments. In this case, that impacts on human
readability.

> +	ctx->reg_ana_csi_rx[CSI_PORT_0A] = ana_base + 0;
> +	ctx->reg_ana_csi_rx[CSI_PORT_0B] = ana_base + 0x1000;

Again, no magic numbers please.

#define SOMETHING 0x1000

> +
> +	ctx->reg_ana_csi_rx[CSI_PORT_1] =
> +	ctx->reg_ana_csi_rx[CSI_PORT_1A] = ana_base + 0x4000;
> +	ctx->reg_ana_csi_rx[CSI_PORT_1B] = ana_base + 0x5000;

..snip..

> +	return 0;
> +}
> +
> +int mtk_cam_seninf_init_port(struct seninf_ctx *ctx, int port)
> +{
> +	u32 port_num;
> +
> +	if (port >= CSI_PORT_0A)
> +		port_num = (port - CSI_PORT_0) >> 1;

I think that you really want to use bitfield.h macros to simplify this.

> +	else
> +		port_num = port;
> +
> +	ctx->port = port;
> +	ctx->port_num = port_num;
> +	ctx->port_a = CSI_PORT_0A + (port_num << 1);
> +	ctx->port_b = ctx->port_a + 1;
> +	ctx->is_4d1c = (port == port_num);
> +
> +	switch (port) {
> +	case CSI_PORT_0:
> +		ctx->seninf_idx = SENINF_1;

Is the CSI port to SENINF mapping supposed to be static and unchangeable?

If yes, then you want to add that into an array indexed by CSI_PORT_xx,
so that you end up doing

ctx->seninf_idx = seninf_csi[port];

> +		break;
> +	case CSI_PORT_0A:
> +		ctx->seninf_idx = SENINF_1;
> +		break;
> +	case CSI_PORT_0B:
> +		ctx->seninf_idx = SENINF_2;
> +		break;
> +	case CSI_PORT_1:
> +		ctx->seninf_idx = SENINF_3;
> +		break;
> +	case CSI_PORT_1A:
> +		ctx->seninf_idx = SENINF_3;
> +		break;
> +	case CSI_PORT_1B:
> +		ctx->seninf_idx = SENINF_4;
> +		break;
> +	case CSI_PORT_2:
> +		ctx->seninf_idx = SENINF_5;
> +		break;
> +	case CSI_PORT_2A:
> +		ctx->seninf_idx = SENINF_5;
> +		break;
> +	case CSI_PORT_2B:
> +		ctx->seninf_idx = SENINF_6;
> +		break;
> +	case CSI_PORT_3:
> +		ctx->seninf_idx = SENINF_7;
> +		break;
> +	case CSI_PORT_3A:
> +		ctx->seninf_idx = SENINF_7;
> +		break;
> +	case CSI_PORT_3B:
> +		ctx->seninf_idx = SENINF_8;
> +		break;
> +	default:
> +		dev_dbg(ctx->dev, "invalid port %d\n", port);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_is_cammux_used(struct seninf_ctx *ctx, int cam_mux)
> +{
> +	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
> +	u32 temp = SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_EN);

Please, just use readl() or regmap_read() (preferrably the latter, and preferrably
also define regmap reg fields).

> +
> +	if (cam_mux >= _seninf_cfg.cam_mux_num) {
> +		dev_dbg(ctx->dev,
> +			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
> +			__func__, cam_mux, _seninf_cfg.cam_mux_num);

That shouldn't ever happen, should it. In that case, it's dev_err(), or even a
WARN(), if necessary.

> +
> +		return 0;
> +	}
> +
> +	return !!(temp & (1 << cam_mux));
> +}
> +
> +int mtk_cam_seninf_cammux(struct seninf_ctx *ctx, int cam_mux)
> +{
> +	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
> +	u32 temp;
> +
> +	if (cam_mux >= _seninf_cfg.cam_mux_num) {

This check is duplicated across many functions... you want to do something such
that it either never happens or it gets commonized.

> +		dev_dbg(ctx->dev,
> +			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
> +			__func__, cam_mux, _seninf_cfg.cam_mux_num);
> +
> +		return 0;

You return 0, so there's no problem if this is the wrong cam_mux?!?!?

> +	}
> +
> +	temp = SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_EN);
> +	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_EN,
> +			 temp | (1 << cam_mux));

BIT(cam_mux)

> +
> +	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_IRQ_STATUS,
> +			 3 << (cam_mux * 2)); /* clr irq */
> +
> +	dev_dbg(ctx->dev, "cam_mux %d EN 0x%x IRQ_EN 0x%x IRQ_STATUS 0x%x\n",
> +		cam_mux, SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_EN),
> +		SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_IRQ_EN),
> +		SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_IRQ_STATUS));
> +
> +	return 0;
> +}
> +


> +
> +int mtk_cam_seninf_set_vc(struct seninf_ctx *ctx, u32 seninf_idx,
> +			  struct seninf_vcinfo *vcinfo)
> +{
> +	void __iomem *seninf_csi2 = ctx->reg_if_csi2[seninf_idx];
> +	int i;
> +	struct seninf_vc *vc;
> +
> +	if (!vcinfo || !vcinfo->cnt)
> +		return 0;

Does !vcinfo mean that Virtual Channel should not be set?
Please add a comment explaining that.

> +
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S0_DI_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S1_DI_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S2_DI_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S3_DI_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S4_DI_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S5_DI_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S6_DI_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S7_DI_CTRL, 0);
> +
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH0_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH1_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH2_CTRL, 0);
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH3_CTRL, 0);
> +
> +	for (i = 0; i < vcinfo->cnt; i++) {
> +		vc = &vcinfo->vc[i];
> +
> +		/* General Long Packet Data Types: 0x10-0x17 */
> +		if (vc->dt >= 0x10 && vc->dt <= 0x17) {
> +			SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT,
> +				    RG_CSI2_GENERIC_LONG_PACKET_EN, 1);
> +		}
> +
> +		mtk_cam_seninf_set_di_ch_ctrl(seninf_csi2, i, vc);
> +	}
> +
> +	dev_dbg(ctx->dev, "DI_CTRL 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S0_DI_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S1_DI_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S2_DI_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S3_DI_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S4_DI_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S5_DI_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S6_DI_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S7_DI_CTRL));
> +
> +	dev_dbg(ctx->dev, "CH_CTRL 0x%x 0x%x 0x%x 0x%x\n",
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH0_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH1_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH2_CTRL),
> +		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH3_CTRL));
> +
> +	return 0;
> +}
> +
..snip..

> +
> +static int csirx_phyA_power_on(struct seninf_ctx *ctx, u32 port_idx, int en)

Please, lower case on all functions. csirx_phy_a_power_on().

Also, you want to split this function in two: one should be csirx_phy_a_power_off()
and one for power_on().

static void csirx_phy_a_power_off(struct seninf_ctx *ctx, u32 port_idx)
{

> +{
> +	void __iomem *base = ctx->reg_ana_csi_rx[port_idx];
> +
> +	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L0_T0AB_EQ_OS_CAL_EN, 0);
> +	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L1_T1AB_EQ_OS_CAL_EN, 0);
> +	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L2_T1BC_EQ_OS_CAL_EN, 0);
> +	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0BC_EQ_OS_CAL_EN, 0);
> +	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0CA_EQ_OS_CAL_EN, 0);
> +	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T1CA_EQ_OS_CAL_EN, 0);
> +	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_LPF_EN, 0);
> +	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_CORE_EN, 0);
> +	usleep_range(200, 300);
> +

}

static int csirx_phy_a_power_on(struct seninf_ctx *ctx, u32 port_idx) <-- NO int en
{
	void *iomem base = .....

	/* Power it off first to ... reset, I believe? */
	csirx_phy_a_power_off();

	power on sequence here

	return 0;
}


> +	if (en) {
> +		SENINF_BITS(base, CDPHY_RX_ANA_0,
> +			    RG_CSI0_BG_CORE_EN, 1);
> +		usleep_range(30, 40);
> +		SENINF_BITS(base, CDPHY_RX_ANA_0,
> +			    RG_CSI0_BG_LPF_EN, 1);
> +		udelay(1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_8,
> +			    RG_CSI0_L0_T0AB_EQ_OS_CAL_EN, 1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_8,
> +			    RG_CSI0_L1_T1AB_EQ_OS_CAL_EN, 1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_8,
> +			    RG_CSI0_L2_T1BC_EQ_OS_CAL_EN, 1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_8,
> +			    RG_CSI0_XX_T0BC_EQ_OS_CAL_EN, 1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_8,
> +			    RG_CSI0_XX_T0CA_EQ_OS_CAL_EN, 1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_8,
> +			    RG_CSI0_XX_T1CA_EQ_OS_CAL_EN, 1);
> +		udelay(1);
> +	}
> +
> +	return 0;
> +}
> +
> +static int apply_efuse_data(struct seninf_ctx *ctx)
> +{
	void __iomem *base;
	u32 m_csi_efuse = ctx->m_csi_efuse;
	u32 port;
	int ret;

> +	int ret = 0;
> +	void __iomem *base;
> +	u32 port;
> +	u32 m_csi_efuse = ctx->m_csi_efuse;
> +
> +	if (m_csi_efuse == 0) {
> +		dev_dbg(ctx->dev, "No efuse data. Returned.\n");
> +		return -1;
> +	}

..snip..

> +
> +	return ret;

return 0;

> +}
> +
> +static int csirx_phyA_init(struct seninf_ctx *ctx)
> +{
> +	u32 i, port;
> +	void __iomem *base;
> +
> +	port = ctx->port;
> +	for (i = 0; i <= ctx->is_4d1c; i++) {

Move the setup in a different function, then call it with

something(port);
if (is_4d1c)
	something(port_b);

> +		port = i ? ctx->port_b : ctx->port;
> +		base = ctx->reg_ana_csi_rx[port];
> +		SENINF_BITS(base, CDPHY_RX_ANA_1,
> +			    RG_CSI0_BG_LPRX_VTL_SEL, 0x4);
> +		SENINF_BITS(base, CDPHY_RX_ANA_1,
> +			    RG_CSI0_BG_LPRX_VTH_SEL, 0x4);
> +		SENINF_BITS(base, CDPHY_RX_ANA_2,
> +			    RG_CSI0_BG_ALP_RX_VTL_SEL, 0x4);
> +		SENINF_BITS(base, CDPHY_RX_ANA_2,
> +			    RG_CSI0_BG_ALP_RX_VTH_SEL, 0x4);
> +		SENINF_BITS(base, CDPHY_RX_ANA_1,
> +			    RG_CSI0_BG_VREF_SEL, 0x8);
> +		SENINF_BITS(base, CDPHY_RX_ANA_1,
> +			    RG_CSI0_CDPHY_EQ_DES_VREF_SEL, 0x2);
> +		SENINF_BITS(base, CDPHY_RX_ANA_5,
> +			    RG_CSI0_CDPHY_EQ_BW, 0x3);
> +		SENINF_BITS(base, CDPHY_RX_ANA_5,
> +			    RG_CSI0_CDPHY_EQ_IS, 0x1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_5,
> +			    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_5,
> +			    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_5,
> +			    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
> +		SENINF_BITS(base, CDPHY_RX_ANA_5,
> +			    RG_CSI0_CDPHY_EQ_SR0, 0x0);
> +		SENINF_BITS(base, CDPHY_RX_ANA_5,
> +			    RG_CSI0_CDPHY_EQ_SR1, 0x0);
> +		SENINF_BITS(base, CDPHY_RX_ANA_9,
> +			    RG_CSI0_RESERVE, 0x3003);
> +		SENINF_BITS(base, CDPHY_RX_ANA_SETTING_0,
> +			    CSR_CSI_RST_MODE, 0x2);
> +
> +		SENINF_BITS(base, CDPHY_RX_ANA_2,
> +			    RG_CSI0_L0P_T0A_HSRT_CODE, 0x10);
> +		SENINF_BITS(base, CDPHY_RX_ANA_2,
> +			    RG_CSI0_L0N_T0B_HSRT_CODE, 0x10);
> +		SENINF_BITS(base, CDPHY_RX_ANA_3,
> +			    RG_CSI0_L1P_T0C_HSRT_CODE, 0x10);
> +		SENINF_BITS(base, CDPHY_RX_ANA_3,
> +			    RG_CSI0_L1N_T1A_HSRT_CODE, 0x10);
> +		SENINF_BITS(base, CDPHY_RX_ANA_4,
> +			    RG_CSI0_L2P_T1B_HSRT_CODE, 0x10);
> +		SENINF_BITS(base, CDPHY_RX_ANA_4,
> +			    RG_CSI0_L2N_T1C_HSRT_CODE, 0x10);
> +		SENINF_BITS(base, CDPHY_RX_ANA_0,
> +			    RG_CSI0_CPHY_T0_CDR_FIRST_EDGE_EN, 0x0);
> +		SENINF_BITS(base, CDPHY_RX_ANA_0,
> +			    RG_CSI0_CPHY_T1_CDR_FIRST_EDGE_EN, 0x0);
> +		SENINF_BITS(base, CDPHY_RX_ANA_2,
> +			    RG_CSI0_CPHY_T0_CDR_SELF_CAL_EN, 0x0);
> +		SENINF_BITS(base, CDPHY_RX_ANA_2,
> +			    RG_CSI0_CPHY_T1_CDR_SELF_CAL_EN, 0x0);
> +
> +		SENINF_BITS(base, CDPHY_RX_ANA_6,
> +			    RG_CSI0_CPHY_T0_CDR_CK_DELAY, 0x0);
> +		SENINF_BITS(base, CDPHY_RX_ANA_7,
> +			    RG_CSI0_CPHY_T1_CDR_CK_DELAY, 0x0);
> +		SENINF_BITS(base, CDPHY_RX_ANA_6,
> +			    RG_CSI0_CPHY_T0_CDR_AB_WIDTH, 0x9);
> +		SENINF_BITS(base, CDPHY_RX_ANA_6,
> +			    RG_CSI0_CPHY_T0_CDR_BC_WIDTH, 0x9);
> +		SENINF_BITS(base, CDPHY_RX_ANA_6,
> +			    RG_CSI0_CPHY_T0_CDR_CA_WIDTH, 0x9);
> +		SENINF_BITS(base, CDPHY_RX_ANA_7,
> +			    RG_CSI0_CPHY_T1_CDR_AB_WIDTH, 0x9);
> +		SENINF_BITS(base, CDPHY_RX_ANA_7,
> +			    RG_CSI0_CPHY_T1_CDR_BC_WIDTH, 0x9);
> +		SENINF_BITS(base, CDPHY_RX_ANA_7,
> +			    RG_CSI0_CPHY_T1_CDR_CA_WIDTH, 0x9);
> +
> +		dev_dbg(ctx->dev, "port:%d CDPHY_RX_ANA_0(0x%x)\n",
> +			port, SENINF_READ_REG(base, CDPHY_RX_ANA_0));
> +	}
> +
> +	apply_efuse_data(ctx);
> +
> +	return 0;
> +}
> +
> +static int csirx_dphy_init(struct seninf_ctx *ctx)
> +{
> +	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
> +	int settle_delay_dt, settle_delay_ck, hs_trail, hs_trail_en;
> +	int bit_per_pixel;

u8 bits_per_pixel;

> +	u64 data_rate;
> +
> +	settle_delay_dt = ctx->is_cphy ? ctx->core->cphy_settle_delay_dt :
> +					 ctx->core->dphy_settle_delay_dt;

Please set settle_delay_ck and hs_trail here.

> +
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER,
> +		    settle_delay_dt);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER,
> +		    settle_delay_dt);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER,
> +		    settle_delay_dt);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER,
> +		    settle_delay_dt);
> +
> +	settle_delay_ck = ctx->core->settle_delay_ck;
> +
> +	SENINF_BITS(base, DPHY_RX_CLOCK_LANE0_HS_PARAMETER,
> +		    RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER,
> +		    settle_delay_ck);
> +	SENINF_BITS(base, DPHY_RX_CLOCK_LANE1_HS_PARAMETER,
> +		    RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER,
> +		    settle_delay_ck);
> +
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_PARAMETER, 2);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_PARAMETER, 2);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_PARAMETER, 2);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
> +		    RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_PARAMETER, 2);
> +
> +	hs_trail = ctx->hs_trail_parameter;
> +
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
> +		    RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER, hs_trail);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
> +		    RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER, hs_trail);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
> +		    RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER, hs_trail);
> +	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
> +		    RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER, hs_trail);
> +
> +	if (!ctx->is_cphy) {
> +		bit_per_pixel = 10;

		data_rate = ctx->customized_pixel_rate ?
			    ctx->customized_pixel_rate : ctx->mipi_pixel_rate;
		data_rate *= bits_per_pixel;

> +		if (ctx->customized_pixel_rate != 0)
> +			data_rate = ctx->customized_pixel_rate * bit_per_pixel;
> +		else
> +			data_rate = ctx->mipi_pixel_rate * bit_per_pixel;
> +
> +		do_div(data_rate, ctx->num_data_lanes);
> +		hs_trail_en = data_rate < 1400000000;
> +		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
> +			    RG_DPHY_RX_LD0_HS_TRAIL_EN, hs_trail_en);
> +		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
> +			    RG_DPHY_RX_LD1_HS_TRAIL_EN, hs_trail_en);
> +		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
> +			    RG_DPHY_RX_LD2_HS_TRAIL_EN, hs_trail_en);
> +		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
> +			    RG_DPHY_RX_LD3_HS_TRAIL_EN, hs_trail_en);
> +	}
> +
> +	return 0;
> +}
> +
> +static int csirx_cphy_init(struct seninf_ctx *ctx)
> +{
> +	void __iomem *base = ctx->reg_ana_cphy_top[ctx->port];
> +
> +	SENINF_BITS(base, CPHY_RX_DETECT_CTRL_POST,
> +		    RG_CPHY_RX_DATA_VALID_POST_EN, 1);
> +
> +	return 0;
> +}
> +
> +static int csirx_phy_init(struct seninf_ctx *ctx)
> +{
> +	csirx_phyA_init(ctx);
> +
> +	csirx_dphy_init(ctx);
> +	csirx_cphy_init(ctx);
> +
> +	return 0;
> +}
> +
> +static int csirx_seninf_csi2_setting(struct seninf_ctx *ctx)
> +{
> +	void __iomem *seninf_csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
> +	int csi_en;
> +
> +	SENINF_BITS(seninf_csi2, SENINF_CSI2_DBG_CTRL,
> +		    RG_CSI2_DBG_PACKET_CNT_EN, 1);
> +
> +	/* lane/trio count */
> +	SENINF_BITS(seninf_csi2, SENINF_CSI2_RESYNC_MERGE_CTRL,
> +		    RG_CSI2_RESYNC_CYCLE_CNT_OPT, 1);
> +
> +	csi_en = (1 << ctx->num_data_lanes) - 1;

csi_en = BIT(ctx->num_data_lanes) - 1;

or

csi_en = GENMASK(ctx->num_data_lanes - 1, 0);

> +
> +	if (!ctx->is_cphy) {
> +		SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT, RG_CSI2_CPHY_SEL, 0);
> +		SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, csi_en);
> +		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
> +			    RG_CSI2_HEADER_MODE, 0);
> +		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
> +			    RG_CSI2_HEADER_LEN, 0);
> +	} else {
> +		u8 map_hdr_len[] = {0, 1, 2, 4, 5};

u8 map_hdr_len[] = { 0, 1, 2, 4, 5 };

> +
> +		SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, csi_en);
> +		SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT,
> +			    RG_CSI2_CPHY_SEL, 1);
> +		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
> +			    RG_CSI2_HEADER_MODE, 2);
> +		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
> +			    RG_CSI2_HEADER_LEN,
> +			    map_hdr_len[ctx->num_data_lanes]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int csirx_seninf_setting(struct seninf_ctx *ctx)
> +{
> +	void __iomem *seninf = ctx->reg_if_ctrl[ctx->seninf_idx];
> +
> +	/* enable/disable seninf csi2 */
> +	SENINF_BITS(seninf, SENINF_CSI2_CTRL, RG_SENINF_CSI2_EN, 1);
> +
> +	/* enable/disable seninf, enable after csi2, testmdl is done */
> +	SENINF_BITS(seninf, SENINF_CTRL, SENINF_EN, 1);
> +
> +	return 0;
> +}
> +
> +static int csirx_seninf_top_setting(struct seninf_ctx *ctx)
> +{

..snip..

> +
> +	/* port operation mode */
> +	switch (ctx->port) {
> +	case CSI_PORT_0:
> +	case CSI_PORT_0A:
> +	case CSI_PORT_0B:
		reg = TOP_PHY_CTRL_CSI0;
		field_cphy = PHY_SENINF_MUX0_CPHY_EN;
		field_dphy = PHY_SENINF_MUX0_DPHY_EN;
		break;
	case CSI_PORT_1:
	case CSI_PORT_1A:
	case CSI_PORT_1B:
		reg = TOP_PHY_CTRL_CSI1;
		field_cphy = PHY_SENINF_MUX1_CPHY_EN;
		field_dphy = PHY_SENINF_MUX1_DPHY_EN;
		break;
	.... etc
	}

	regmap_write_bits(regmap, reg, field_cphy, ctx->is_cphy);
	regmap_write_bits(regmap, reg, field_dphy, !ctx->is_cphy);


> +		if (!ctx->is_cphy) {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
> +				    PHY_SENINF_MUX0_CPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
> +				    PHY_SENINF_MUX0_DPHY_EN, 1);
> +		} else {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
> +				    PHY_SENINF_MUX0_DPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
> +				    PHY_SENINF_MUX0_CPHY_EN, 1);
> +		}
> +		break;
> +	case CSI_PORT_1:
> +	case CSI_PORT_1A:
> +	case CSI_PORT_1B:
> +		if (!ctx->is_cphy) {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
> +				    PHY_SENINF_MUX1_CPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
> +				    PHY_SENINF_MUX1_DPHY_EN, 1);
> +		} else {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
> +				    PHY_SENINF_MUX1_DPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
> +				    PHY_SENINF_MUX1_CPHY_EN, 1);
> +		}
> +		break;
> +	case CSI_PORT_2:
> +	case CSI_PORT_2A:
> +	case CSI_PORT_2B:
> +		if (!ctx->is_cphy) {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
> +				    PHY_SENINF_MUX2_CPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
> +				    PHY_SENINF_MUX2_DPHY_EN, 1);
> +		} else {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
> +				    PHY_SENINF_MUX2_DPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
> +				    PHY_SENINF_MUX2_CPHY_EN, 1);
> +		}
> +		break;
> +	case CSI_PORT_3:
> +	case CSI_PORT_3A:
> +	case CSI_PORT_3B:
> +		if (!ctx->is_cphy) {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
> +				    PHY_SENINF_MUX3_CPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
> +				    PHY_SENINF_MUX3_DPHY_EN, 1);
> +		} else {
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
> +				    PHY_SENINF_MUX3_DPHY_EN, 0);
> +			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
> +				    PHY_SENINF_MUX3_CPHY_EN, 1);
> +		}
> +		break;
> +	default:
> +		break;

So if this is called with a CSI_PORT that is out of range, we're not
erroring out?!?!

> +	}
> +
> +	return 0;
> +}
> +
> +static int csirx_phyA_setting(struct seninf_ctx *ctx)
> +{
> +	void __iomem *base, *baseA, *baseB;
> +
> +	base = ctx->reg_ana_csi_rx[ctx->port];
> +	baseA = ctx->reg_ana_csi_rx[ctx->port_a];
> +	baseB = ctx->reg_ana_csi_rx[ctx->port_b];
> +
> +	if (!ctx->is_cphy) { /* dphy */

For this huge register write sequence, you want to split it in at least
two functions to improve human readability and reduce indentation.

> +		if (ctx->is_4d1c) {
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_CPHY_EN, 0);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_CPHY_EN, 0);
> +			/* clear clk sel first */
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
> +
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKSEL, 1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKSEL, 1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKSEL, 1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKSEL, 1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKSEL, 1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKSEL, 1);
> +
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKMODE_EN, 1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
> +
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_BW, 0x3);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_IS, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR0, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
> +
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_BW, 0x3);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_IS, 0x1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR0, 0x1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
> +		} else {
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_CPHY_EN, 0);
> +			/* clear clk sel first */
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
> +
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKSEL, 0);
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKSEL, 0);
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKSEL, 0);
> +
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L1_CKMODE_EN, 1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
> +
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_BW, 0x3);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_IS, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR0, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
> +		}
> +	} else { /* cphy */
> +		if (ctx->is_4d1c) {
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
> +				    RG_CSI0_CPHY_EN, 1);
> +			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
> +				    RG_CSI0_CPHY_EN, 1);
> +
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_BW, 0x3);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_IS, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR0, 0x3);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
> +
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_BW, 0x3);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_IS, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR0, 0x3);
> +			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
> +		} else {
> +			SENINF_BITS(base, CDPHY_RX_ANA_0,
> +				    RG_CSI0_CPHY_EN, 1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_BW, 0x3);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_IS, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR0, 0x3);
> +			SENINF_BITS(base, CDPHY_RX_ANA_5,
> +				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
> +		}
> +	}
> +
> +	/* phyA power on */
> +	if (ctx->is_4d1c) {
> +		csirx_phyA_power_on(ctx, ctx->port_a, 1);
> +		csirx_phyA_power_on(ctx, ctx->port_b, 1);
> +	} else {
> +		csirx_phyA_power_on(ctx, ctx->port, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static int csirx_dphy_setting(struct seninf_ctx *ctx)
> +{
> +	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
> +
> +	if (ctx->is_4d1c) {
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD3_SEL, 4);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD2_SEL, 0);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD1_SEL, 3);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD0_SEL, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC0_SEL, 2);
> +
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD0_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD1_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD2_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD3_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC0_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC1_EN, 0);
> +	} else {
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD3_SEL, 5);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD2_SEL, 3);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD1_SEL, 2);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD0_SEL, 0);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC1_SEL, 4);
> +		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC0_SEL, 1);
> +
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD0_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD1_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD2_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD3_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC0_EN, 1);
> +		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC1_EN, 1);
> +	}
> +
> +	SENINF_BITS(base, DPHY_RX_LANE_SELECT, DPHY_RX_CK_DATA_MUX_EN, 1);
> +
> +	return 0;
> +}
> +
> +static int csirx_cphy_setting(struct seninf_ctx *ctx)
> +{
> +	void __iomem *base = ctx->reg_ana_cphy_top[ctx->port];

u32 reg_lprx[] = { CPHY_RX_TR0_LPRX_EN, CPHY_RX_TR1_LPRX_EN, ...TR2, ...TR3 };



> +
> +	switch (ctx->port) {
> +	case CSI_PORT_0:
> +	case CSI_PORT_1:
> +	case CSI_PORT_2:
> +	case CSI_PORT_3:
> +	case CSI_PORT_0A:
> +	case CSI_PORT_1A:
> +	case CSI_PORT_2A:
> +	case CSI_PORT_3A:

for (i = 0; i < ctx->num_data_lanes; i++)
	regmap_write_bits(regmap, CPHY_RX_CTRL, reg_lprx[i], 1);

for (; i < ARRAY_SIZE(reg_lprx); i++)
	regmap_write_bits(regmap, CPHY_RX_CTRL, reg_lprx[i], 0);

> +		if (ctx->num_data_lanes == 3) {
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR1_LPRX_EN, 1);
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR3_LPRX_EN, 0);
> +		} else if (ctx->num_data_lanes == 2) {
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR1_LPRX_EN, 1);
> +		} else {
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
> +		}
> +		break;
> +	case CSI_PORT_0B:
> +	case CSI_PORT_1B:
> +	case CSI_PORT_2B:
> +	case CSI_PORT_3B:

for (i = 0; i < ctx->num_data_lanes; i++) {
	regmap_write_bits(regmap, CPHY_RX_CTRL, reg_lprx[i], 0);
	regmap_write_bits(regmap, CPHY_RX_CTRL, reg_lprx[i+2], 1);
}

> +		if (ctx->num_data_lanes == 2) {
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR3_LPRX_EN, 1);
> +		} else {
> +			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int csirx_phy_setting(struct seninf_ctx *ctx)
> +{
> +	csirx_phyA_setting(ctx);
> +

Please,

	if (ctx->is_cphy)
		x()
	else
		y()

> +	if (!ctx->is_cphy)
> +		csirx_dphy_setting(ctx);
> +	else
> +		csirx_cphy_setting(ctx);
> +
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_set_csi_mipi(struct seninf_ctx *ctx)
> +{
> +	csirx_phy_init(ctx);
> +
> +	/* seninf csi2 */
> +	csirx_seninf_csi2_setting(ctx);
> +
> +	/* seninf */
> +	csirx_seninf_setting(ctx);
> +
> +	/* seninf top */
> +	csirx_seninf_top_setting(ctx);
> +
> +	/* phy */
> +	csirx_phy_setting(ctx);
> +
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_poweroff(struct seninf_ctx *ctx)
> +{
> +	void __iomem *seninf_csi2;
> +
> +	seninf_csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
> +
> +	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, 0x0);
> +
> +	if (ctx->is_4d1c) {
> +		csirx_phyA_power_on(ctx, ctx->port_a, 0);
> +		csirx_phyA_power_on(ctx, ctx->port_b, 0);
> +	} else {
> +		csirx_phyA_power_on(ctx, ctx->port, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_reset(struct seninf_ctx *ctx, u32 seninf_idx)
> +{
> +	int i;
> +	void __iomem *seninf_mux;
> +	void __iomem *seninf = ctx->reg_if_ctrl[seninf_idx];
> +
> +	SENINF_BITS(seninf, SENINF_CSI2_CTRL, SENINF_CSI2_SW_RST, 1);

What about adding a reset controller that includes SENINF_CSI(x)_SW_RST?
Also, why are you resetting only CSI2 and not the others?

> +	udelay(1);
> +	SENINF_BITS(seninf, SENINF_CSI2_CTRL, SENINF_CSI2_SW_RST, 0);
> +
> +	dev_dbg(ctx->dev, "reset seninf %d\n", seninf_idx);
> +
> +	for (i = SENINF_MUX1; i < _seninf_cfg.mux_num; i++)
> +		if (mtk_cam_seninf_get_top_mux_ctrl(ctx, i) == seninf_idx &&
> +		    mtk_cam_seninf_is_mux_used(ctx, i)) {
> +			seninf_mux = ctx->reg_if_mux[i];
> +			SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0,
> +				    SENINF_MUX_SW_RST, 1);
> +			udelay(1);
> +			SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0,
> +				    SENINF_MUX_SW_RST, 0);
> +			dev_dbg(ctx->dev, "reset mux %d\n", i);
> +		}
> +
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_set_idle(struct seninf_ctx *ctx)
> +{
> +	int i;
> +	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
> +	struct seninf_vc *vc;
> +
> +	for (i = 0; i < vcinfo->cnt; i++) {
> +		vc = &vcinfo->vc[i];
> +		if (vc->enable) {
> +			mtk_cam_seninf_disable_mux(ctx, vc->mux);
> +			mtk_cam_seninf_disable_cammux(ctx, vc->cam);
> +			ctx->pad2cam[vc->out_pad] = 0xff;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_get_mux_meter(struct seninf_ctx *ctx, u32 mux,
> +				 struct mtk_cam_seninf_mux_meter *meter)
> +{
> +	void __iomem *seninf_mux;
> +	s64 hv, hb, vv, vb, w, h;
> +	u64 mipi_pixel_rate, vb_in_us, hb_in_us, line_time_in_us;
> +	u32 res;
> +
> +	seninf_mux = ctx->reg_if_mux[mux];
> +
> +	SENINF_BITS(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_CTRL,
> +		    RG_SENINF_MUX_FRAME_SIZE_MON_EN, 1);
> +
> +	hv = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_H_VALID);
> +	hb = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_H_BLANK);
> +	vv = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_V_VALID);
> +	vb = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_V_BLANK);
> +	res = SENINF_READ_REG(seninf_mux, SENINF_MUX_SIZE);
> +
> +	w = res & 0xffff;

Another case of bitfield.h macros open-coded, or missed opportunity to just
use regmap to simplify this.

> +	h = res >> 16;

And same here, of course.

> +
> +	if (ctx->fps_n && ctx->fps_d) {
> +		mipi_pixel_rate = w * ctx->fps_n * (vv + vb);
> +		do_div(mipi_pixel_rate, ctx->fps_d);

Use div_s64() for safe 64-bits division.

> +		do_div(mipi_pixel_rate, hv);
> +
> +		vb_in_us = vb * ctx->fps_d * 1000000;
> +		do_div(vb_in_us, vv + vb);
> +		do_div(vb_in_us, ctx->fps_n);
> +
> +		hb_in_us = hb * ctx->fps_d * 1000000;
> +		do_div(hb_in_us, vv + vb);
> +		do_div(hb_in_us, ctx->fps_n);
> +
> +		line_time_in_us = (hv + hb) * ctx->fps_d * 1000000;
> +		do_div(line_time_in_us, vv + vb);
> +		do_div(line_time_in_us, ctx->fps_n);
> +
> +		meter->mipi_pixel_rate = mipi_pixel_rate;
> +		meter->vb_in_us = vb_in_us;
> +		meter->hb_in_us = hb_in_us;
> +		meter->line_time_in_us = line_time_in_us;
> +	} else {
> +		meter->mipi_pixel_rate = -1;
> +		meter->vb_in_us = -1;
> +		meter->hb_in_us = -1;
> +		meter->line_time_in_us = -1;
> +	}
> +
> +	meter->width = w;
> +	meter->height = h;
> +
> +	meter->h_valid = hv;
> +	meter->h_blank = hb;
> +	meter->v_valid = vv;
> +	meter->v_blank = vb;
> +
> +	return 0;
> +}
> +
> +ssize_t mtk_cam_seninf_show_status(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	int i, len;
> +	struct seninf_core *core;

struct seninf_core *core = dev_get_drvdata(dev);

> +	struct seninf_ctx *ctx;
> +	struct seninf_vc *vc;
> +	struct media_link *link;
> +	struct media_pad *pad;
> +	struct mtk_cam_seninf_mux_meter meter;
> +	void __iomem *csi2, *pmux;
> +	void __iomem *rx, *pcammux;

int i, len = 0;

> +
> +	core = dev_get_drvdata(dev);
> +	len = 0;
> +
> +	mutex_lock(&core->mutex);
> +
> +	list_for_each_entry(ctx, &core->list, list) {
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"\n[%s] port %d intf %d test %d cphy %d lanes %d\n",
> +				ctx->subdev.name, ctx->port, ctx->seninf_idx,
> +				ctx->is_test_model, ctx->is_cphy,
> +				ctx->num_data_lanes);
> +
> +		pad = &ctx->pads[PAD_SINK];
> +		list_for_each_entry(link, &pad->entity->links, list) {
> +			if (link->sink == pad) {
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"source %s flags 0x%lx\n",
> +						link->source->entity->name,
> +						link->flags);
> +			}
> +		}
> +
> +		if (!ctx->streaming)
> +			continue;
> +
> +		csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
> +		rx = ctx->reg_ana_dphy_top[ctx->port];
> +
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"csi2 irq_stat 0x%08x\n",
> +				SENINF_READ_REG(csi2, SENINF_CSI2_IRQ_STATUS));
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"csi2 line_frame_num 0x%08x\n",
> +				SENINF_READ_REG(csi2, SENINF_CSI2_LINE_FRAME_NUM));
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"csi2 packet_status 0x%08x\n",
> +				SENINF_READ_REG(csi2, SENINF_CSI2_PACKET_STATUS));
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"csi2 packet_cnt_status 0x%08x\n",
> +				SENINF_READ_REG(csi2, SENINF_CSI2_PACKET_CNT_STATUS));
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"rx-ana settle ck 0x%02x dt 0x%02x\n",
> +				SENINF_READ_BITS(rx, DPHY_RX_CLOCK_LANE0_HS_PARAMETER,
> +						 RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER),
> +				SENINF_READ_BITS(rx,
> +						 DPHY_RX_DATA_LANE0_HS_PARAMETER,
> +						 RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER));
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"rx-ana trail en %u param 0x%02x\n",
> +				SENINF_READ_BITS(rx, DPHY_RX_DATA_LANE0_HS_PARAMETER,
> +						 RG_DPHY_RX_LD0_HS_TRAIL_EN),
> +				SENINF_READ_BITS(rx, DPHY_RX_DATA_LANE0_HS_PARAMETER,
> +						 RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER));
> +
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"data_not_enough_cnt : <%d>",
> +				ctx->data_not_enough_cnt);
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"err_lane_resync_cnt : <%d>",
> +				ctx->err_lane_resync_cnt);
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"crc_err_cnt : <%d>", ctx->crc_err_flag);
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"ecc_err_double_cnt : <%d>",
> +				ctx->ecc_err_double_cnt);
> +		len += snprintf(buf + len, PAGE_SIZE - len,
> +				"ecc_err_corrected_cnt : <%d>\n",
> +				ctx->ecc_err_corrected_cnt);
> +
> +		for (i = 0; i < ctx->vcinfo.cnt; i++) {
> +			vc = &ctx->vcinfo.vc[i];
> +			pmux = ctx->reg_if_mux[vc->mux];
> +			pcammux = ctx->reg_if_cam_mux;
> +
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"[%d] vc 0x%x dt 0x%x mux %d cam %d\n",
> +					i, vc->vc, vc->dt, vc->mux, vc->cam);
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"\tmux[%d] en %d src %d irq_stat 0x%x\n",
> +					vc->mux,
> +					mtk_cam_seninf_is_mux_used(ctx, vc->mux),
> +					mtk_cam_seninf_get_top_mux_ctrl(ctx, vc->mux),
> +					SENINF_READ_REG(pmux, SENINF_MUX_IRQ_STATUS));
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"\t\tfifo_overrun_cnt : <%d>\n",
> +					ctx->fifo_overrun_cnt);
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"\tcam[%d] en %d src %d exp 0x%x res 0x%x irq_stat 0x%x\n",
> +					vc->cam,
> +					mtk_cam_seninf_is_cammux_used(ctx, vc->cam),
> +					mtk_cam_seninf_get_cammux_ctrl(ctx, vc->cam),
> +					mtk_cam_seninf_get_cammux_exp(ctx, vc->cam),
> +					mtk_cam_seninf_get_cammux_res(ctx, vc->cam),
> +					SENINF_READ_REG(pcammux,
> +							SENINF_CAM_MUX_IRQ_STATUS));
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"\t\tsize_err_cnt : <%d>\n",
> +					ctx->size_err_cnt);
> +
> +			if (vc->feature == VC_RAW_DATA ||
> +			    vc->feature == VC_STAGGER_NE ||
> +			    vc->feature == VC_STAGGER_ME ||
> +			    vc->feature == VC_STAGGER_SE) {
> +				mtk_cam_seninf_get_mux_meter(ctx, vc->mux,
> +							     &meter);
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\t--- mux meter ---\n");
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\twidth %d height %d\n",
> +						meter.width, meter.height);
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\th_valid %d, h_blank %d\n",
> +						meter.h_valid, meter.h_blank);
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\tv_valid %d, v_blank %d\n",
> +						meter.v_valid, meter.v_blank);
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\tmipi_pixel_rate %lld\n",
> +						meter.mipi_pixel_rate);
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\tv_blank %lld us\n",
> +						meter.vb_in_us);
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\th_blank %lld us\n",
> +						meter.hb_in_us);
> +				len += snprintf(buf + len, PAGE_SIZE - len,
> +						"\tline_time %lld us\n",
> +						meter.line_time_in_us);
> +			}
> +		}
> +	}
> +
> +	mutex_unlock(&core->mutex);
> +
> +	return len;
> +}
> +
> +#define SENINF_DRV_DEBUG_MAX_DELAY 400
> +
> +static inline void
> +mtk_cam_seninf_clear_matched_cam_mux_irq(struct seninf_ctx *ctx,
> +					 u32 cam_mux_idx,

Why is this a u32 param?....

> +					 u32 vc_idx,
> +					 s32 enabled)
> +{
> +	u8 used_cammux;

...if this is a u8 local variable?

(cam_mux_idx should be u8 instead - same for vc_idx)

> +
> +	if (cam_mux_idx >= SENINF_CAM_MUX_NUM) {
> +		dev_info(ctx->dev, "unsupport cam_mux(%u)", cam_mux_idx);
> +		return;
> +	}
> +	if (vc_idx >= SENINF_VC_MAXCNT) {
> +		dev_info(ctx->dev, "unsupport vc_idx(%u)", vc_idx);
> +		return;
> +	}
> +
> +	used_cammux = ctx->vcinfo.vc[vc_idx].cam;
> +	if (used_cammux == cam_mux_idx &&
> +	    enabled & (1 << cam_mux_idx)) {
> +		dev_dbg(ctx->dev,
> +			"before clear cam mux%u recSize = 0x%x, irq = 0x%x",
> +			cam_mux_idx,
> +			SENINF_READ_REG(ctx->reg_if_cam_mux,
> +					SENINF_CAM_MUX0_CHK_RES + (0x10 * cam_mux_idx)),
> +			SENINF_READ_REG(ctx->reg_if_cam_mux,
> +					SENINF_CAM_MUX_IRQ_STATUS));
> +
> +		SENINF_WRITE_REG(ctx->reg_if_cam_mux,
> +				 SENINF_CAM_MUX_IRQ_STATUS,
> +				 3 << (cam_mux_idx * 2));
> +	}
> +}
> +
> +static inline void mtk_cam_seninf_check_matched_cam_mux(struct seninf_ctx *ctx,
> +							u32 cam_mux_idx,
> +							u32 vc_idx,
> +							s32 enabled,
> +							s32 irq_status)
> +{
> +	u8 used_cammux;
> +
> +	if (cam_mux_idx >= SENINF_CAM_MUX_NUM) {
> +		dev_info(ctx->dev, "unsupport cam_mux(%u)", cam_mux_idx);
> +		return;
> +	}
> +	if (vc_idx >= SENINF_VC_MAXCNT) {
> +		dev_info(ctx->dev, "unsupport vc_idx(%u)", vc_idx);
> +		return;
> +	}
> +
> +	used_cammux = ctx->vcinfo.vc[vc_idx].cam;
> +
> +	if (used_cammux == cam_mux_idx && enabled & (1 << cam_mux_idx)) {
> +		int rec_size = SENINF_READ_REG(ctx->reg_if_cam_mux,
> +			SENINF_CAM_MUX0_CHK_RES + (0x10 * cam_mux_idx));
> +		int exp_size = SENINF_READ_REG(ctx->reg_if_cam_mux,
> +			SENINF_CAM_MUX0_CHK_CTL_1 + (0x10 * cam_mux_idx));
> +		if (rec_size != exp_size) {
> +			dev_dbg(ctx->dev,
> +				"cam mux%u size mismatch, (rec, exp) = (0x%x, 0x%x)",
> +				cam_mux_idx, rec_size, exp_size);
> +		}
> +		if ((irq_status &
> +		     (3 << (cam_mux_idx * 2))) != 0) {
> +			dev_dbg(ctx->dev,
> +				"cam mux%u size mismatch!, irq = 0x%x",
> +				cam_mux_idx, irq_status);
> +		}
> +	}
> +}
> +
..snip..

> +
> +#define SBUF 256
> +int mtk_cam_seninf_irq_handler(int irq, void *data)
> +{
> +	struct seninf_core *core = (struct seninf_core *)data;
> +	unsigned long flags; /* for mipi err detection */
> +	struct seninf_ctx *ctx;
> +	struct seninf_vc *vc;
> +	void __iomem *csi2, *pmux, *seninf_cam_mux;
> +	int i;
> +	unsigned int csi_irq_ro;
> +	unsigned int mux_irq_ro;
> +	unsigned int cam_irq_exp_ro;
> +	unsigned int cam_irq_res_ro;
> +	char seninf_log[SBUF];
> +	unsigned int wcnt = 0;
> +
> +	spin_lock_irqsave(&core->spinlock_irq, flags);
> +
> +	/* debug for set_reg case: REG_KEY_CSI_IRQ_EN */
> +	if (core->csi_irq_en_flag) {
> +		list_for_each_entry(ctx, &core->list, list) {
> +			csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
> +			csi_irq_ro =
> +				SENINF_READ_REG(csi2, SENINF_CSI2_IRQ_STATUS);
> +
> +			if (csi_irq_ro) {
> +				SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_STATUS,
> +						 0xFFFFFFFF);
> +			}
> +
> +			if (csi_irq_ro & (0x1 << RO_CSI2_ECC_ERR_CORRECTED_IRQ_SHIFT))
> +				ctx->ecc_err_corrected_cnt++;
> +			if (csi_irq_ro & (0x1 << RO_CSI2_ECC_ERR_DOUBLE_IRQ_SHIFT))
> +				ctx->ecc_err_double_cnt++;
> +			if (csi_irq_ro & (0x1 << RO_CSI2_CRC_ERR_IRQ_SHIFT))
> +				ctx->crc_err_cnt++;
> +			if (csi_irq_ro & (0x1 << RO_CSI2_ERR_LANE_RESYNC_IRQ_SHIFT))
> +				ctx->err_lane_resync_cnt++;
> +			if (csi_irq_ro & (0x1 << RO_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ_SHIFT))
> +				ctx->data_not_enough_cnt++;
> +
> +			for (i = 0; i < ctx->vcinfo.cnt; i++) {
> +				vc = &ctx->vcinfo.vc[i];
> +				pmux = ctx->reg_if_mux[vc->mux];
> +				seninf_cam_mux = ctx->reg_if_cam_mux;
> +
> +				mux_irq_ro = SENINF_READ_REG(pmux,
> +							     SENINF_MUX_IRQ_STATUS);
> +
> +				cam_irq_exp_ro = SENINF_READ_REG(seninf_cam_mux,
> +								 SENINF_CAM_MUX0_CHK_CTL_1 +
> +								 (0x10 * (vc->cam)));
> +
> +				cam_irq_res_ro = SENINF_READ_REG(seninf_cam_mux,
> +								 SENINF_CAM_MUX0_CHK_RES +
> +								 (0x10 * (vc->cam)));
> +
> +				if (mux_irq_ro)
> +					SENINF_WRITE_REG(pmux,
> +							 SENINF_MUX_IRQ_STATUS,
> +							 0xFFFFFFFF);
> +
> +				if (cam_irq_res_ro != cam_irq_exp_ro)
> +					SENINF_WRITE_REG(seninf_cam_mux,
> +							 SENINF_CAM_MUX0_CHK_RES +
> +							 (0x10 * (vc->cam)),
> +							 0xFFFFFFFF);
> +
> +				if (mux_irq_ro & (0x1 << 0))
> +					ctx->fifo_overrun_cnt++;
> +
> +				if (cam_irq_res_ro != cam_irq_exp_ro)
> +					ctx->size_err_cnt++;
> +			}
> +
> +			/* dump status counter: debug for electrical signal */
> +			if (ctx->data_not_enough_cnt >= core->detection_cnt ||
> +			    ctx->err_lane_resync_cnt >= core->detection_cnt ||
> +			    ctx->crc_err_cnt >= core->detection_cnt ||
> +			    ctx->ecc_err_double_cnt >= core->detection_cnt ||
> +			    ctx->ecc_err_corrected_cnt >= core->detection_cnt ||
> +			    ctx->fifo_overrun_cnt >= core->detection_cnt ||
> +			    ctx->size_err_cnt >= core->detection_cnt) {
> +				/* disable all interrupts */
> +				SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_EN, 0x80000000);
> +
> +				if (ctx->data_not_enough_cnt >= core->detection_cnt)
> +					ctx->data_not_enough_flag = 1;
> +				if (ctx->err_lane_resync_cnt >= core->detection_cnt)
> +					ctx->err_lane_resync_flag = 1;
> +				if (ctx->crc_err_cnt >= core->detection_cnt)
> +					ctx->crc_err_flag = 1;
> +				if (ctx->ecc_err_double_cnt >= core->detection_cnt)
> +					ctx->ecc_err_double_flag = 1;
> +				if (ctx->ecc_err_corrected_cnt >= core->detection_cnt)
> +					ctx->ecc_err_corrected_flag = 1;
> +				if (ctx->fifo_overrun_cnt >= core->detection_cnt)
> +					ctx->fifo_overrun_flag = 1;
> +				if (ctx->size_err_cnt >= core->detection_cnt)
> +					ctx->size_err_flag = 1;
> +
> +				wcnt = snprintf(seninf_log, SBUF, "info: %s", __func__);

You're not even printing seninf_log, so either print it (no, please don't)
or just drop it.

> +				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
> +					"   data_not_enough_count: %d",
> +					ctx->data_not_enough_cnt);
> +				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
> +					"   err_lane_resync_count: %d",
> +					ctx->err_lane_resync_cnt);
> +				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
> +					"   crc_err_count: %d",
> +					ctx->crc_err_cnt);
> +				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
> +					"   ecc_err_double_count: %d",
> +					ctx->ecc_err_double_cnt);
> +				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
> +					"   ecc_err_corrected_count: %d",
> +					ctx->ecc_err_corrected_cnt);
> +				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
> +					"   fifo_overrun_count: %d",
> +					ctx->fifo_overrun_cnt);
> +				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
> +					"   size_err_count: %d",
> +					ctx->size_err_cnt);
> +			}
> +		}
> +	}
> +
> +	spin_unlock_irqrestore(&core->spinlock_irq, flags);
> +
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_set_sw_cfg_busy(struct seninf_ctx *ctx, bool enable,
> +				   int index)
> +{
> +	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;

mask = index ? RG_SENINF_CAM_MUX_DYN_SWITCH_BSY1 :
	       RG_SENINF_CAM_MUX_DYN_SWITCH_BSY0

> +
> +	if (index == 0)
> +		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_CTRL,
> +			    RG_SENINF_CAM_MUX_DYN_SWITCH_BSY0, enable);
> +	else
> +		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_CTRL,
> +			    RG_SENINF_CAM_MUX_DYN_SWITCH_BSY1, enable);
> +	return 0;
> +}
> +
> +int mtk_cam_seninf_set_cam_mux_dyn_en(struct seninf_ctx *ctx, bool enable,
> +				      int cam_mux, int index)
> +{
> +	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
> +	u32 tmp = 0;
> +
> +	if (index == 0) {
> +		tmp = SENINF_READ_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
> +				       RG_SENINF_CAM_MUX_DYN_SWITCH_EN0);

regmap_set_bits() will definitely help here.

> +		if (enable)
> +			tmp = tmp | (1 << cam_mux);
> +		else
> +			tmp = tmp & ~(1 << cam_mux);
> +
> +		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
> +			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN0, tmp);
> +	} else {
> +		tmp = SENINF_READ_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
> +				       RG_SENINF_CAM_MUX_DYN_SWITCH_EN1);
> +		if (enable)
> +			tmp = tmp | (1 << cam_mux);
> +		else
> +			tmp = tmp & ~(1 << cam_mux);
> +
> +		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
> +			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN1, tmp);
> +	}
> +
> +	return 0;
> +}
> +

There is surely more to say on this driver, and it's far from being near to
upstream quality.
Please start with addressing these comments on the entire series, then we can go
on with further reviews.

Regards,
Angelo
