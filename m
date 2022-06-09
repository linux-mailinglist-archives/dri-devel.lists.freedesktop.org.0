Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD7544549
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 10:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C20310E00A;
	Thu,  9 Jun 2022 08:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02F110E21D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 08:03:36 +0000 (UTC)
X-UUID: 150e7171e9e144a9bd74da6109522973-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f00b110d-b7e7-44d7-aa51-b685a148e3b7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b7eec47e-c8dc-403a-96e8-6237210dceee,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 150e7171e9e144a9bd74da6109522973-20220609
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1523568253; Thu, 09 Jun 2022 16:03:32 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Jun 2022 16:03:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 9 Jun 2022 16:03:31 +0800
Message-ID: <49162f7d313478f13472eb0f3b07ffa2a47cbeba.camel@mediatek.com>
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
Date: Thu, 9 Jun 2022 16:03:30 +0800
In-Reply-To: <651e6b993562d53c893d0325d33fa137e98ab596.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
 <651e6b993562d53c893d0325d33fa137e98ab596.camel@mediatek.com>
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

On Wed, 2022-06-08 at 16:30 +0800, CK Hu wrote:
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
> > +static bool mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> > +{
> > +	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
> > +	u8 val;
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +
> > +	if (!mtk_dp_plug_state(mtk_dp))
> > +		return false;
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > +	/* Wait for power on */
> > +	usleep_range(2000, 5000);
> > +
> > +	drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> > +
> > +	memcpy(mtk_dp->rx_cap, buf, min(sizeof(mtk_dp->rx_cap),
> > sizeof(buf)));
> 
> sizeof(mtk_dp->rx_cap) is identical to sizeof(buf), so
> 
> drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
> 
> 

Hello CK,

I will drop buf[].

> > +	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &=
> > DP_TRAINING_AUX_RD_MASK;
> > +
> > +	train_info->link_rate =
> > +		min_t(int, mtk_dp->max_linkrate, buf[mtk_dp-
> > > max_linkrate]);
> > 
> > +	train_info->lane_count =
> > +		min_t(int, mtk_dp->max_lanes,
> > drm_dp_max_lane_count(buf));
> > +
> > +	train_info->tps3 = drm_dp_tps3_supported(buf);
> > +	train_info->tps4 = drm_dp_tps4_supported(buf);
> > +
> > +	train_info->sink_ssc =
> > +		!!(buf[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
> > +
> > +	train_info->sink_ssc = false;
> 
> What does these two statement do?
> 

ssc = Spread spectrum clock.
it's for both edp and dp.

BRs,
Bo-Chen

> Regards,
> CK
> 
> > +
> > +	drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
> > +	if (val & DP_MST_CAP) {
> > +		/* Clear DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0 */
> > +		drm_dp_dpcd_readb(&mtk_dp->aux,
> > +				  DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
> > &val);
> > +		if (val)
> > +			drm_dp_dpcd_writeb(&mtk_dp->aux,
> > +					   DP_DEVICE_SERVICE_IRQ_VECTOR
> > _ESI0,
> > +					   val);
> > +	}
> > +
> > +	return true;
> > +}
> > +
> 
> 

