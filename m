Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECC058D509
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 09:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE65CA5AF;
	Tue,  9 Aug 2022 07:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A00CA56C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 07:57:36 +0000 (UTC)
X-UUID: 1b1511c3ee49429ab64c95a65540d1c4-20220809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YEqeMCYw5b9KhVve378Sy7vFdIoCHC0mooehECOFz+c=; 
 b=A24y999r4HwEf8W4bvAilQLzK9Bz+hEcI7xPs75wo4/q4LWsWDw6b+koMSjGH8mn5NzZWXJoA63mn7Cq2A5JyU6pQHKXCFLYa4GXan3KMogxUu3/uEeCi6Skg6byN8EvbGMjHq/aLZ7r+sRbjfJwUHeiKwlfh456GNY2UNcECRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9, REQID:e8128ceb-de8f-47d7-a83f-56fd90e1e226, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:45
X-CID-INFO: VERSION:1.1.9, REQID:e8128ceb-de8f-47d7-a83f-56fd90e1e226, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ha
 m,ACTION:release,TS:45
X-CID-META: VersionHash:3d8acc9, CLOUDID:551f289c-da39-4e3b-a854-56c7d2111b46,
 C
 OID:72bf0a90d54e,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 1b1511c3ee49429ab64c95a65540d1c4-20220809
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 652269249; Tue, 09 Aug 2022 15:57:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 15:57:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 15:57:18 +0800
Message-ID: <6f067d36efffab65490348704bb892252cc400ef.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
Date: Tue, 9 Aug 2022 15:57:18 +0800
In-Reply-To: <d9eb673132f643e39caeb422309bf4315f0c136e.camel@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
 <20220805101459.3386-4-rex-bc.chen@mediatek.com>
 <d9eb673132f643e39caeb422309bf4315f0c136e.camel@mediatek.com>
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
 "granquet@baylibre.com" <granquet@baylibre.com>,
 Jitao Shi =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?=
 <jitao.shi@mediatek.com>,
 LiangXu Xu =?UTF-8?Q?=28=E5=BE=90=E4=BA=AE=29?= <LiangXu.Xu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "msp@baylibre.com" <msp@baylibre.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-08-08 at 13:46 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195
> > SoC.
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
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> 
> [snip]
> 
> > +
> > +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> > +{
> > +	struct mtk_dp *mtk_dp = dev;
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +	u32 irq_status;
> > +
> > +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> > +
> > +	if (!(irq_status & RGS_IRQ_STATUS_TRANSMITTER))
> > +		return IRQ_HANDLED;
> 
> If one of MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
> MTK_DP_HPD_DISCONNECT exist, does it imply RGS_IRQ_STATUS_TRANSMITTER
> exist? If so, I think this checking is redundant because we could
> directly check MTK_DP_HPD_INTERRUPT, MTK_DP_HPD_CONNECT,
> MTK_DP_HPD_DISCONNECT.
> 

Hello CK,

After checking with Jitao, we can remove this check and use
mtk_dp_swirq_get_clear|mtk_dp_hwirq_get_clear directly.

> > +
> > +	irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> > +		     mtk_dp_hwirq_get_clear(mtk_dp);
> > +
> > +	if (!irq_status)
> > +		return IRQ_HANDLED;
> > +
> > +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> > +		train_info->hpd_inerrupt = true;
> 
> train_info->hpd_inerrupt is useless, so drop it.
> 
> > +
> > +	if (!(irq_status & MTK_DP_HPD_CONNECT ||
> > +	      irq_status & MTK_DP_HPD_DISCONNECT))
> > +		return IRQ_WAKE_THREAD;
> 
> this could be changed to
> 
> if (irq_status == MTK_DP_HPD_INTERRUPT)
> 	return IRQ_WAKE_THREAD;
> 
> But I find one problem. If irq_status == MTK_DP_HPD_INTERRUPT |
> MTK_DP_HPD_CONNECT, the thread would not be waked up. Is this what
> you
> want?
> 
> Regards,
> CK
> 

It is possible we will encounter (irq_status & MTK_DP_HPD_CONNECT) &&
(irq_status & MTK_DP_HPD_INTERRUPT)

So I will modify like this:

if (!(irq_status & MTK_DP_HPD_CONNECT ||
      irq_status & MTK_DP_HPD_DISCONNECT))
	return IRQ_WAKE_THREAD;

xxxxxx

if (irq_status & MTK_DP_HPD_INTERRUPT &&
    irq_status & MTK_DP_HPD_CONNECT)
	return IRQ_WAKE_THREAD;

return IRQ_HANDLED;

BRs,
Bo-Chen
> > +
> > +	if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> > +	       HPD_DB_DP_TRANS_P0_MASK))
> > +		train_info->cable_plugged_in = true;
> > +	else
> > +		train_info->cable_plugged_in = false;
> > +
> > +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> > +			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> > +			   DP_PWR_STATE_MASK);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> 
> 

