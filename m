Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D052A57FC4A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 11:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C74F91259;
	Mon, 25 Jul 2022 09:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F6A91241
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 09:23:45 +0000 (UTC)
X-UUID: e9265cc9b81b4750872471c207d5af8a-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:4f02b255-ab0e-4785-9b46-370765e27bea, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:4f02b255-ab0e-4785-9b46-370765e27bea, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:4565ded3-912a-458b-a623-74f605a77e93,
 C
 OID:c5dbe28c4f5a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: e9265cc9b81b4750872471c207d5af8a-20220725
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1147469930; Mon, 25 Jul 2022 17:23:38 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 25 Jul 2022 17:23:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 17:23:36 +0800
Message-ID: <6232f0fc15bc1057aab68523e5eb63e10b3a2802.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Mon, 25 Jul 2022 17:23:36 +0800
In-Reply-To: <20220712111223.13080-6-rex-bc.chen@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
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

On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
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
> +/*
> + * We need to handle HPD signal in eDP even though eDP is a always
> connected
> + * device. Besides connected status, there is another feature for
> HPD signal -
> + * HPD pulse: it presents an IRQ from sink devices to source devices
> (Refer to
> + * 5.1.4 of DP1.4 spec).
> + */
> +static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
> +{
> +	bool hpd_change = false;
> +	u32 irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> +			 mtk_dp_hwirq_get_clear(mtk_dp);
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;
> +
> +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> +		train_info->irq_sta.hpd_inerrupt = true;
> +	if (irq_status & MTK_DP_HPD_CONNECT ||
> +	    irq_status & MTK_DP_HPD_DISCONNECT)
> +		hpd_change = true;
> +
> +	if (!(hpd_change))
> +		return IRQ_WAKE_THREAD;
> +
> +	if (mtk_dp_plug_state(mtk_dp))

mtk_dp_plug_state() is called only here, and prevent function call in
isr handler, so squash mtk_dp_plug_state() into this function.

> +		train_info->cable_plugged_in = true;
> +	else
> +		train_info->cable_plugged_in = false;
> +
> +	train_info->cable_state_change = true;
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	u32 irq_status;
> +
> +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;
> +
> +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
> +		return mtk_dp_hpd_isr_handler(mtk_dp);

Prevent function call in isr handler, squash mtk_dp_hpd_isr_handler()
into this function.

Regards,
CK

> +
> +	return IRQ_HANDLED;
> +}
> +

