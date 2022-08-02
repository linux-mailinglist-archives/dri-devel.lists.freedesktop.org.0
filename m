Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049A58768D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 07:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373B011BCCB;
	Tue,  2 Aug 2022 05:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7D211BCA3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 05:09:15 +0000 (UTC)
X-UUID: d90cb81c6ffa4484bf87f5f097666c6c-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:c987c419-5aa8-4d9a-92c3-3f78d742cd0b, OB:10,
 L
 OB:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:c987c419-5aa8-4d9a-92c3-3f78d742cd0b, OB:10,
 LOB
 :10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:6cfa08d0-a6cf-4fb6-be1b-c60094821ca2,
 C
 OID:4b69b0cc6ffe,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: d90cb81c6ffa4484bf87f5f097666c6c-20220802
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 831541770; Tue, 02 Aug 2022 13:09:10 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 13:09:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Aug 2022 13:09:08 +0800
Message-ID: <202347b5f781ba1a9abe7297c9906793ad547d0d.camel@mediatek.com>
Subject: Re: [PATCH v15 05/11] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Tue, 2 Aug 2022 13:09:08 +0800
In-Reply-To: <20220727045035.32225-6-rex-bc.chen@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-6-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Wed, 2022-07-27 at 12:50 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +
> +	if (mtk_dp->train_info.hpd_inerrupt) {

When the thread is running, mtk_dp->train_info.hpd_inerrupt would be
true. So this checking is redundant.

> +		dev_dbg(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");
> +		mtk_dp->train_info.hpd_inerrupt = false;
> +		mtk_dp_hpd_sink_event(mtk_dp);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +	u32 irq_status;
> +
> +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;
> +
> +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER) {

Combine this if-checking with previous if-checking, it would be:

if (!(irq_status & RGS_IRQ_STATUS_TRANSMITTER))
	return IRQ_HANDLED;

> +		irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> +			     mtk_dp_hwirq_get_clear(mtk_dp);
> +
> +		if (!irq_status)
> +			return IRQ_HANDLED;
> +
> +		if (irq_status & MTK_DP_HPD_INTERRUPT)

Does this interrupt MTK_DP_HPD_INTERRUPT have any relation with
MTK_DP_HPD_CONNECT and MTK_DP_HPD_CONNECT? From the naming, I guess
that when MTK_DP_HPD_CONNECT happen, MTK_DP_HPD_INTERRUPT would also
happen. Either for MTK_DP_HPD_DISCONNECT. When would
MTK_DP_HPD_INTERRUPT happen but MTK_DP_HPD_CONNECT or
MTK_DP_HPD_DISCONNECT does not happen.

Regards,
CK

> +			train_info->hpd_inerrupt = true;
> +
> +		if (!(irq_status & MTK_DP_HPD_CONNECT ||
> +		      irq_status & MTK_DP_HPD_DISCONNECT))
> +			return IRQ_WAKE_THREAD;
> +
> +		if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> +		       HPD_DB_DP_TRANS_P0_MASK))
> +			train_info->cable_plugged_in = true;
> +		else
> +			train_info->cable_plugged_in = false;
> +
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +				   DP_PWR_STATE_MASK);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +

