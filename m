Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF053FF81
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 14:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5959310ED83;
	Tue,  7 Jun 2022 12:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F303510ED83
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 12:55:32 +0000 (UTC)
X-UUID: bb5e143a916949d992b27f2fdc9c1465-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:3eaa7c96-6260-46d2-b3f5-7101e12b16b0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:275c7e7e-c8dc-403a-96e8-6237210dceee,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: bb5e143a916949d992b27f2fdc9c1465-20220607
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 931050928; Tue, 07 Jun 2022 20:55:27 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 20:55:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 20:55:26 +0800
Message-ID: <6d7a38e4fe4cd1811c826888531144511407a06a.camel@mediatek.com>
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
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>
Date: Tue, 7 Jun 2022 20:55:25 +0800
In-Reply-To: <ff858934b622e6716dd48bf02d4d57f19358b805.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
 <ff858934b622e6716dd48bf02d4d57f19358b805.camel@mediatek.com>
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

On Tue, 2022-06-07 at 16:12 +0800, CK Hu wrote:
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
> > +static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
> > +{
> > +	int ret = 0;
> > +	u8 lane_count;
> > +	u8 link_rate;
> > +	u8 train_limit;
> > +	u8 max_link_rate;
> > +	u8 plug_wait;
> > +
> > +	for (plug_wait = 7; !mtk_dp_plug_state(mtk_dp) && plug_wait >
> > 0;
> > +	     --plug_wait)
> > +		/* Avoid short pulses on the HPD isr */
> > +		usleep_range(1000, 5000);
> > +	if (plug_wait == 0) {
> > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
> 
> After return, mtk_dp->train_state would be set to
> MTK_DP_TRAIN_STATE_DPIDLE, so drop this.
> 

ok, I will do this.

> > +		return -ENODEV;
> > +	}
> > +
> > +	link_rate = mtk_dp->rx_cap[1];
> > +	lane_count = mtk_dp->rx_cap[2] & 0x1F;
> > +
> > +	mtk_dp->train_info.link_rate = min(mtk_dp->max_linkrate,
> > link_rate);
> > +	mtk_dp->train_info.lane_count = min(mtk_dp->max_lanes,
> > lane_count);
> > +	link_rate = mtk_dp->train_info.link_rate;
> > +	lane_count = mtk_dp->train_info.lane_count;
> > +
> > +	switch (link_rate) {
> > +	case MTK_DP_LINKRATE_RBR:
> > +	case MTK_DP_LINKRATE_HBR:
> > +	case MTK_DP_LINKRATE_HBR2:
> > +	case MTK_DP_LINKRATE_HBR25:
> > +	case MTK_DP_LINKRATE_HBR3:
> > +		break;
> > +	default:
> > +		mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR3;
> > +		break;
> > +	};
> > +
> > +	max_link_rate = link_rate;
> > +	for (train_limit = 6; train_limit > 0; train_limit--) {
> > +		mtk_dp->train_info.cr_done = false;
> > +		mtk_dp->train_info.eq_done = false;
> > +
> > +		mtk_dp_train_change_mode(mtk_dp);
> > +		ret = mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (!mtk_dp->train_info.cr_done) {
> > +			switch (link_rate) {
> > +			case MTK_DP_LINKRATE_RBR:
> > +				lane_count = lane_count / 2;
> > +				link_rate = max_link_rate;
> > +				if (lane_count == 0) {
> > +					mtk_dp->train_state =
> > +						MTK_DP_TRAIN_STATE_DPID
> > LE;
> 
> After return, mtk_dp->train_state would be set to
> MTK_DP_TRAIN_STATE_DPIDLE, so drop this.
> 
> Regards,
> CK
> 

ok.

> > +					return -EIO;
> > +				}
> > +				break;
> > +			case MTK_DP_LINKRATE_HBR:
> > +				link_rate = MTK_DP_LINKRATE_RBR;
> > +				break;
> > +			case MTK_DP_LINKRATE_HBR2:
> > +				link_rate = MTK_DP_LINKRATE_HBR;
> > +				break;
> > +			case MTK_DP_LINKRATE_HBR3:
> > +				link_rate = MTK_DP_LINKRATE_HBR2;
> > +				break;
> > +			default:
> > +				return -EINVAL;
> > +			};
> > +		} else if (!mtk_dp->train_info.eq_done) {
> > +			if (lane_count == 0)
> > +				return -EIO;
> > +
> > +			lane_count /= 2;
> > +		} else {
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (train_limit == 0)
> > +		return -ETIMEDOUT;
> > +
> > +	return 0;
> > +}
> > +
> 
> 

