Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0795B5429FA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DA110E172;
	Wed,  8 Jun 2022 08:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEE410E172
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:54:33 +0000 (UTC)
X-UUID: a91c2c94b53c43b3b9259e49568e1924-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:83c76c89-2203-48dd-a54d-10888b7cdcb6, OB:0,
 LO
 B:30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:83c76c89-2203-48dd-a54d-10888b7cdcb6, OB:0,
 LOB:
 30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:101116e5-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:7b6d797d215a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: a91c2c94b53c43b3b9259e49568e1924-20220608
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 220310496; Wed, 08 Jun 2022 16:54:28 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 8 Jun 2022 16:54:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 16:54:27 +0800
Message-ID: <cff4c093407fc60b4ae88f6bd847faba9c62fb3b.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun
 =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= <Chunfeng.Yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Helge
 Deller <deller@gmx.de>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>
Date: Wed, 8 Jun 2022 16:54:27 +0800
In-Reply-To: <8bd5136b1404e16ba5085c3151b31ec9a1715e54.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
 <8bd5136b1404e16ba5085c3151b31ec9a1715e54.camel@mediatek.com>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-06-08 at 16:45 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports the mt8195, the embedded DisplayPort units. It offers
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
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> 
> [snip]
> 
> > +
> > +static bool mtk_dp_set_swing_pre_emphasis(struct mtk_dp *mtk_dp,
> > int
> > lane_num,
> > +					  int swing_val, int
> > preemphasis)
> 
> The return value is never processed, so let this function to be void.
> 
> Regards,
> CK
> 

Hello CK,

ok, I will drop this.
Actually, I change "mtk_dp_write", "mtk_dp_update_bits" and
"mtk_dp_bulk_16bit_write" to return void. I don't think we need to
handle the issue that we failed to set registers. If we failed to set
register, it's because hw is not enable.

Therefore, I drop this and we can reduce many lines of codes.

BRs,
Bo-Chen
> > +{
> > +	int ret;
> > +
> > +	u32 lane_shift = lane_num * DP_TX1_VOLT_SWING_SHIFT;
> > +
> > +	if (lane_num < 0 || lane_num > 3)
> 
> lane_num < 0 would not happen. lane_num > 3 only if device tree max
> lane is wrong. So I would like to checkout max lane when parsing
> device
> tree instead of checking here.
> > +		return false;
> > +
> > +	dev_dbg(mtk_dp->dev,
> > +		"link training swing_val= 0x%x, preemphasis = 0x%x\n",
> > +		swing_val, preemphasis);
> > +
> > +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
> > +				 swing_val << (DP_TX0_VOLT_SWING_SHIFT
> > + lane_shift),
> > +				 DP_TX0_VOLT_SWING_MASK << lane_shift);
> > +	if (ret)
> > +		return ret;
> > +	ret = mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_SWING_EMP,
> > +				 preemphasis << (DP_TX0_PRE_EMPH_SHIFT
> > + lane_shift),
> > +				 DP_TX0_PRE_EMPH_MASK << lane_shift);
> > +
> > +	return !ret;
> > +}
> > +
> 
> 

