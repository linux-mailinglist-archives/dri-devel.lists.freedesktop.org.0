Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7454F2E5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 10:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E381D10F631;
	Fri, 17 Jun 2022 08:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FACA10F402
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 08:27:50 +0000 (UTC)
X-UUID: d6d61de7ac464b61877864c473901ec9-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:834626fd-55e2-4ff2-9f2d-73c850983bf0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:13cc9ff6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: d6d61de7ac464b61877864c473901ec9-20220617
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2095467319; Fri, 17 Jun 2022 16:27:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 17 Jun 2022 16:27:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 16:27:43 +0800
Message-ID: <127049c096eea15b9dad37ce1b6e4be810c24a93.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
Date: Fri, 17 Jun 2022 16:27:43 +0800
In-Reply-To: <6efcd9fbd86e923d2b124f7a97e8e3b8ddece252.camel@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
 <6efcd9fbd86e923d2b124f7a97e8e3b8ddece252.camel@mediatek.com>
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

On Wed, 2022-06-15 at 11:06 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
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
> > [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
> > +{
> > +	u8 val;
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> > DP_SET_POWER_D0);
> > +	usleep_range(2000, 5000);
> > +
> > +	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
> > +
> > +	mtk_dp->rx_cap[DP_TRAINING_AUX_RD_INTERVAL] &=
> > DP_TRAINING_AUX_RD_MASK;
> > +
> > +	train_info->link_rate = min_t(int, mtk_dp->max_linkrate,
> > +				      mtk_dp->rx_cap[mtk_dp-
> > > max_linkrate]);
> > 
> > +	train_info->lane_count = min_t(int, mtk_dp->max_lanes,
> > +				       drm_dp_max_lane_count(mtk_dp-
> > > rx_cap));
> > 
> > +
> > +	train_info->tps3 = drm_dp_tps3_supported(mtk_dp->rx_cap);
> > +	train_info->tps4 = drm_dp_tps4_supported(mtk_dp->rx_cap);
> > +
> > +	train_info->sink_ssc = !!(mtk_dp->rx_cap[DP_MAX_DOWNSPREAD] &
> > +				  DP_MAX_DOWNSPREAD_0_5);
> 
> I think this is redundant because next statement would set sink_scc
> to
> false.
> 
> Regards,
> CK
> 

Hello Ck,

I will remove "train_info->sink_ssc = false;"

BRs,
Bo-Chen
> > +
> > +	train_info->sink_ssc = false;
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
> > +	return 0;
> > +}
> 
> 

