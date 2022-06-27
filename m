Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64F55B924
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 12:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30CD10FD4E;
	Mon, 27 Jun 2022 10:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E8410FCDA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 10:30:48 +0000 (UTC)
X-UUID: 0bafa932750b4551b7c5197945cce3bf-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:dcfe5252-9fd0-41bd-b998-846f539e1025, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:87442a2, CLOUDID:16d2252e-1756-4fa3-be7f-474a6e4be921,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 0bafa932750b4551b7c5197945cce3bf-20220627
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1823173727; Mon, 27 Jun 2022 18:30:41 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 27 Jun 2022 18:30:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 27 Jun 2022 18:30:39 +0800
Message-ID: <5f94612c26c79604fe62550808c481c0031456e5.camel@mediatek.com>
Subject: Re: [PATCH v12 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
Date: Mon, 27 Jun 2022 18:30:39 +0800
In-Reply-To: <269ba882-1975-7148-524a-2bb8eb8667b7@collabora.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
 <20220627080341.5087-6-rex-bc.chen@mediatek.com>
 <269ba882-1975-7148-524a-2bb8eb8667b7@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "granquet@baylibre.com" <granquet@baylibre.com>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "msp@baylibre.com" <msp@baylibre.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-06-27 at 18:07 +0800, AngeloGioacchino Del Regno wrote:
> Il 27/06/22 10:03, Bo-Chen Chen ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195 SoC.
> > 
> > It supports the MT8195, the embedded DisplayPort units. It offers
> > DisplayPort 1.4 with up to 4 lanes.
> > 
> > The driver creates a child device for the phy. The child device
> > will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> > 
> > This driver is based on an initial version by
> > Jitao shi <jitao.shi@mediatek.com>
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/Kconfig       |   10 +
> >   drivers/gpu/drm/mediatek/Makefile      |    1 +
> >   drivers/gpu/drm/mediatek/mtk_dp.c      | 2198
> > ++++++++++++++++++++++++
> >   drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  543 ++++++
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c |    3 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.h |    3 +
> >   6 files changed, 2758 insertions(+)
> >   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> >   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > 
> 
> 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > new file mode 100644
> > index 000000000000..9e9b516409e2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -0,0 +1,2198 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019-2022 MediaTek Inc.
> > + * Copyright (c) 2022 BayLibre
> > + */
> > +
> > +#include <drm/display/drm_dp.h>
> > +#include <drm/display/drm_dp_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <linux/arm-smccc.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/errno.h>
> > +#include <linux/kernel.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <sound/hdmi-codec.h>
> > +#include <video/videomode.h>
> > +
> > +#include "mtk_dp_reg.h"
> > +
> > +#define MTK_DP_SIP_CONTROL_AARCH32 0x82000523
> 
> Why have you forced this SIP call to AArch32 SMC convention?
> Is there any particular reason why this should always be AA32 and
> *never* AA64?
> 
> In any case, you've got MediaTek SIP macros in
> include/soc/mediatek/mtk_sip_svc.h
> so, please, include that header and either redefine this as
> 
> MTK_SIP_CMD(0x523) or add a new macro in there to force
> ARM_SMCCC_SMC_32
> convention with a very explanatory comment saying why some calls need
> to
> be forced to use the AArch32 SMC convention.
> 

Hello Angelo,

Thanks for your review.
ok, I will do this in next version.

> > +
> > +#define MTK_VDOSYS1_MAX_FRAMERATE 60
> > +#define MTK_DP_4P1T 4
> > +#define MTK_DP_HDE 2
> > +#define MTK_DP_PIX_PER_ADDR 2
> > +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
> > +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> > +#define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
> > +#define MTK_DP_TRAIN_RETRY_LIMIT 8
> > +#define MTK_DP_TRAIN_MAX_ITERATIONS 5
> > +#define MTK_DP_DP_VERSION_11 0x11
> 
> MTK_DP_HW_VERSION_11 0x11 ?
> 
> ...but anyway, this definition is unused, so please either use it or
> drop it.
> 

it's fro audio patch, and I will move this there.

> > +
> > +enum mtk_dp_train_state {
> > +	MTK_DP_TRAIN_STATE_TRAINING,
> > +	MTK_DP_TRAIN_STATE_NORMAL,
> > +};
> > +
> > +struct mtk_dp_timings {
> > +	struct videomode vm;
> > +	u8 frame_rate;
> > +};
> > +
> > +struct mtk_dp_irq_sta {
> > +	bool hpd_disconnect;
> > +	bool hpd_inerrupt;
> > +};
> > +
> > +struct mtk_dp_train_info {
> > +	bool tps3;
> > +	bool tps4;
> > +	bool sink_ssc;
> > +	bool cable_plugged_in;
> > +	bool cable_state_change;
> > +	bool cr_done;
> > +	bool eq_done;
> > +	/* link_rate is in multiple of 0.27Gbps */
> > +	int link_rate;
> > +	int lane_count;
> > +	struct mtk_dp_irq_sta irq_sta;
> > +};
> > +
> > +struct mtk_dp_info {
> > +	u32 depth;
> > +	enum dp_pixelformat format;
> > +	struct mtk_dp_timings timings;
> > +};
> > +
> > +struct dp_cal_data {
> > +	unsigned int glb_bias_trim;
> > +	unsigned int clktx_impse;
> > +
> > +	unsigned int ln_tx_impsel_pmos[4];
> > +	unsigned int ln_tx_impsel_nmos[4];
> > +};
> > +
> > +struct mtk_dp {
> > +	struct device *dev;
> > +	struct platform_device *phy_dev;
> > +	struct phy *phy;
> > +	struct dp_cal_data cal_data;
> > +	u8 max_lanes;
> > +	u8 max_linkrate;
> > +
> > +	struct drm_device *drm_dev;
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +	struct drm_dp_aux aux;
> > +
> > +	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
> > +
> > +	struct mtk_dp_info info;
> > +
> > +	struct mtk_dp_train_info train_info;
> > +	enum mtk_dp_train_state train_state;
> > +
> > +	struct regmap *regs;
> > +
> > +	bool enabled;
> > +
> > +	struct drm_connector *conn;
> > +};
> > +
> > +static struct regmap_config mtk_dp_regmap_config = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.max_register = SEC_OFFSET + 0x90,
> > +	.name = "mtk-dp-registers",
> > +};
> > +
> > +static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
> > +{
> > +	return container_of(b, struct mtk_dp, bridge);
> > +}
> > +
> > +static u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
> > +{
> > +	u32 read_val;
> > +	int ret;
> > +
> > +	ret = regmap_read(mtk_dp->regs, offset, &read_val);
> > +	if (ret) {
> > +		dev_err(mtk_dp->dev, "Failed to read register 0x%x:
> > %d\n",
> > +			offset, ret);
> > +		return 0;
> > +	}
> > +
> > +	return read_val;
> > +}
> > +
> > +static void mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32
> > val)
> > +{
> 
> This should be int... you should propagate the error to the caller,
> and also
> eventually take action in case you get an error.
> 
> > +	if (regmap_write(mtk_dp->regs, offset, val))
> > +		dev_err(mtk_dp->dev,
> > +			"Failed to write register 0x%x with value
> > 0x%x\n",
> > +			offset, val);
> > +}
> > +
> > +static void mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
> > +			       u32 val, u32 mask)
> > +{
> 
> Same here.
> 

I don't think we need to control this.
From most drivers, I see there are many example which are not control
the error of write register function.

If there is any error, the root cause is power domain is not enabled.
In this case, we can not go to these register setting. Besides, we also
can saves hundreds of driver lines to handle the write register error.

> > +	if (regmap_update_bits(mtk_dp->regs, offset, mask, val))
> > +		dev_err(mtk_dp->dev,
> > +			"Failed to update register 0x%x with value
> > 0x%x, mask 0x%x\n",
> > +			offset, val, mask);
> > +}
> > +
> > +static void mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32
> > offset, u8 *buf,
> > +				    size_t length)
> > +{
> > +	int i;
> > +	int num_regs = (length + 1) / 2;
> > +
> 
> ... and here.
> 
> > +	/* 2 bytes per register */
> > +	for (i = 0; i < num_regs; i++) {
> > +		u32 val = buf[i * 2] |
> > +			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 :
> > 0);
> > +
> > +		mtk_dp_write(mtk_dp, offset + i * 4, val);
> 
> P.S.: Does it make sense to keep writing if you get an error?
>        I'd say that doing this may lead to unexpected hardware
> status.
> 

If one register failed to write, it should be for *all* registers and
not only for *one* register.

> > +	}
> > +}
> > +
> > +static unsigned long mtk_dp_sip_atf_call(struct mtk_dp *mtk_dp,
> > +					 unsigned int cmd, unsigned int
> > para)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32, cmd, para, 0, 0, 0,
> > 0, 0,
> > +		      &res);
> > +
> > +	dev_dbg(mtk_dp->dev, "sip cmd 0x%x, p1 0x%x, ret 0x%lx-0x%lx",
> > +		cmd, para, res.a0, res.a1);
> > +
> > +	return res.a1;
> 
> We have SIP_SVC_E_(xxxxx) error codes defined in mtk_sip_svc.h...
> this makes me
> think that res.a1 is not an unsigned long for real: please confirm.
> 

ok, I will confirm that.

> > +}
> > +
> 
> ..snip..
> 
> > +
> > +static void mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
> > +				    enum dp_pixelformat color_format)
> > +{
> > +	u32 val;
> > +
> > +	mtk_dp->info.format = color_format;
> > +
> > +	/* update MISC0 */
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> > +			   color_format << DP_TEST_COLOR_FORMAT_SHIFT,
> > +			   DP_TEST_COLOR_FORMAT_MASK);
> > +
> > +	switch (color_format) {
> > +	case DP_PIXELFORMAT_YUV422:
> > +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
> > +		break;
> > +	case DP_PIXELFORMAT_YUV420:
> > +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
> > +		break;
> > +	case DP_PIXELFORMAT_RGB:
> > +	case DP_PIXELFORMAT_YUV444:
> > +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
> > +		break;
> > +	case DP_PIXELFORMAT_Y_ONLY:
> > +	case DP_PIXELFORMAT_RAW:
> > +	case DP_PIXELFORMAT_RESERVED:
> > +	default:
> > +		drm_warn(mtk_dp->drm_dev, "Unsupported color format:
> > %d\n",
> > +			 color_format);
> > +		return;
> 
> return -EINVAL here?
> 

ok, I will take care the error handle.

> > +	}
> > +
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
> > +			   val, PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
> 
> ... and return 0 here.
> 
> > +}
> > +
> > +static void mtk_dp_set_color_depth(struct mtk_dp *mtk_dp)
> > +{
> > +	u32 val;
> > +	/* Only support 8 bits currently */
> > +	u32 color_depth = DP_MSA_MISC_8_BPC;
> > +
> > +	mtk_dp->info.depth = color_depth;
> > +
> > +	/* Update MISC0 */
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> > +			   color_depth, DP_TEST_BIT_DEPTH_MASK);
> > +
> > +	switch (color_depth) {
> > +	case DP_MSA_MISC_6_BPC:
> > +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT;
> > +		break;
> > +	case DP_MSA_MISC_8_BPC:
> > +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT;
> > +		break;
> > +	case DP_MSA_MISC_10_BPC:
> > +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT;
> > +		break;
> > +	case DP_MSA_MISC_12_BPC:
> > +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT;
> > +		break;
> > +	case DP_MSA_MISC_16_BPC:
> > +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT;
> > +		break;
> 
> ditto
> 
> > +	default:
> > +		drm_warn(mtk_dp->drm_dev, "Unsupported color depth
> > %d\n",
> > +			 color_depth);
> > +		return;
> > +	}
> > +
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
> > +			   VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK);
> > +}
> > +
> 
> ..snip..
> 
> > +
> > +static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
> > +				u32 link_rate, int lane_count)
> > +{
> > +	int ret;
> > +	union phy_configure_opts phy_opts = {
> > +		.dp = {
> > +			.link_rate = link_rate_to_mb_per_s(mtk_dp,
> > link_rate),
> > +			.set_rate = 1,
> > +			.lanes = lane_count,
> > +			.set_lanes = 1,
> > +			.ssc = mtk_dp->train_info.sink_ssc,
> > +		}
> > +	};
> > +
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > DP_PWR_STATE_BANDGAP,
> > +			   DP_PWR_STATE_MASK);
> > +
> > +	ret = phy_configure(mtk_dp->phy, &phy_opts);
> > +
> 
> This new blank line is unnecessary, please remove.
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	mtk_dp_set_cal_data(mtk_dp);
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > DP_PWR_STATE_MASK);
> > +
> > +	return 0;
> > +}
> > +
> 
> ..snip..
> 
> > +
> > +static void mtk_dp_calculate_pixrate(struct mtk_dp *mtk_dp)
> > +{
> > +	u8 target_frame_rate = 60;
> 
> Don't assign any value here: this will make sure to avoid double
> assignments later.
> 
> > +	u32 target_pixel_clk;
> > +	struct drm_display_mode mode;
> > +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
> > +
> > +	drm_display_mode_from_videomode(&timings->vm, &mode);
> > +
> > +	if (mtk_dp->info.timings.frame_rate > 0) {
> > +		target_frame_rate = mtk_dp->info.timings.frame_rate;
> > +		target_pixel_clk = mode.htotal * mode.vtotal *
> > +				   target_frame_rate;
> > +	} else {
> > +		target_pixel_clk = mode.htotal * mode.vtotal *
> > +				   target_frame_rate;
> > +	}
> 
> This should be
> 
> 	if (mtk_dp->info.timings.frame_rate > 0)
> 		target_frame_rate = mtk_dp->info.timings.frame_rate;
> 	else
> 		target_frame_rate = 60;
> 
> 	target_pixel_clk = mode.htotal * mode.vtotal *
> target_frame_rate;
> 

ok.

> > +}
> > +
> > +static void mtk_dp_set_tx_out(struct mtk_dp *mtk_dp)
> > +{
> > +	mtk_dp_msa_bypass_disable(mtk_dp);
> > +	mtk_dp_calculate_pixrate(mtk_dp);
> > +	mtk_dp_pg_disable(mtk_dp);
> > +	mtk_dp_setup_tu(mtk_dp);
> > +}
> > +
> > +static ssize_t mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> > +{
> > +	ssize_t ret;
> > +	u8 sink_count;
> > +	bool locked;
> > +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> > +	u32 sink_count_reg = DP_SINK_COUNT_ESI;
> > +	u32 link_status_reg = DP_LANE0_1_STATUS;
> > +
> > +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg,
> > &sink_count);
> > +	if (ret < 0) {
> 
> This function can never return anything > 1, so this should probably
> be:
> 
> 	if (ret < 1) {
> 		drm_err ....
> 		return ret == 0 ? -EIO : ret;
> 	}
> 

ok, I will check this.

BRs,
Bo-Chen

> > +		drm_err(mtk_dp->drm_dev, "Read sink count failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> > link_status,
> > +			       sizeof(link_status));
> > +	if (!ret) {
> > +		drm_err(mtk_dp->drm_dev, "Read link status failed\n");
> > +		return ret;
> > +	}
> > +
> > +	locked = drm_dp_channel_eq_ok(link_status,
> > +				      mtk_dp->train_info.lane_count);
> > +	if (!locked && mtk_dp->train_state >
> > MTK_DP_TRAIN_STATE_TRAINING)
> > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
> > +
> > +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> > +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> > DP_DEVICE_SERVICE_IRQ_VECTOR,
> > +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> > +
> > +	if (DP_GET_SINK_COUNT(sink_count) &&
> > +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
> > +		msleep(20);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> 
> ..snip..
> 
> > +
> > +static int mtk_dp_train_flow(struct mtk_dp *mtk_dp, u8
> > target_link_rate,
> > +			     u8 target_lane_count)
> > +{
> > +	u8 lane_adjust[2] = {};
> > +	bool pass_tps1 = false;
> > +	bool pass_tps2_3 = false;
> > +	int train_retries;
> > +	int status_control;
> > +	int iteration_count;
> > +	int ret;
> > +	u8 prev_lane_adjust;
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LINK_BW_SET,
> > target_link_rate);
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
> > +			   target_lane_count |
> > DP_LANE_COUNT_ENHANCED_FRAME_EN);
> > +
> > +	if (mtk_dp->train_info.sink_ssc)
> > +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DOWNSPREAD_CTRL,
> > +				   DP_SPREAD_AMP_0_5);
> > +
> > +	train_retries = 0;
> > +	status_control = 0;
> > +	iteration_count = 1;
> > +	prev_lane_adjust = 0xFF;
> > +
> > +	mtk_dp_set_lanes(mtk_dp, target_lane_count / 2);
> > +	ret = mtk_dp_phy_configure(mtk_dp, target_link_rate,
> > target_lane_count);
> > +	if (ret)
> > +		return -EINVAL;
> 
> Why are you overriding the error value here?
> 
> > +
> > +	dev_dbg(mtk_dp->dev,
> > +		"Link train target_link_rate = 0x%x, target_lane_count
> > = 0x%x\n",
> > +		target_link_rate, target_lane_count);
> > +
> 
> Cheers,
> Angelo

