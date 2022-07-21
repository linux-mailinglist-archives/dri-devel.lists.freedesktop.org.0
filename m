Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9C57C454
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 08:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFB514A568;
	Thu, 21 Jul 2022 06:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A13614A4A7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 06:25:05 +0000 (UTC)
X-UUID: 64c903246cb442c893a84dd769470d44-20220721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:5a2d29b9-39e5-4d9b-98c5-a515a2694e5e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:5a2d29b9-39e5-4d9b-98c5-a515a2694e5e, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:ad318f33-b9e4-42b8-b28a-6364427c76bb,
 C
 OID:53af66dc2fa1,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 64c903246cb442c893a84dd769470d44-20220721
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1300368485; Thu, 21 Jul 2022 14:25:00 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 21 Jul 2022 14:24:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 21 Jul 2022 14:24:58 +0800
Message-ID: <4e543dc3a183af3966aa6f2f28b0afb9d95cbac2.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
Date: Thu, 21 Jul 2022 14:24:58 +0800
In-Reply-To: <7b1a555ab62aec8c3f5717b8827c81a2076bf569.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
 <05e7ace27af21d141c1ecd79fb45f6e5e9d32582.camel@mediatek.com>
 <7b1a555ab62aec8c3f5717b8827c81a2076bf569.camel@mediatek.com>
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

Hi, Rex:

On Thu, 2022-07-21 at 10:38 +0800, Rex-BC Chen wrote:
> On Fri, 2022-07-15 at 16:51 +0800, CK Hu wrote:
> > Hi, Bo-Chen:
> > 
> > On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This patch adds a embedded displayport driver for the MediaTek
> > > mt8195
> > > SoC.
> > > 
> > > It supports the MT8195, the embedded DisplayPort units. It offers
> > > DisplayPort 1.4 with up to 4 lanes.
> > > 
> > > The driver creates a child device for the phy. The child device
> > > will
> > > never exist without the parent being active. As they are sharing
> > > a
> > > register range, the parent passes a regmap pointer to the child
> > > so
> > > that
> > > both can work with the same register range. The phy driver sets
> > > device
> > > data that is read by the parent to get the phy device that can be
> > > used
> > > to control the phy properties.
> > > 
> > > This driver is based on an initial version by
> > > Jitao shi <jitao.shi@mediatek.com>
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > 
> > [snip]
> > 
> > > +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> > > +{
> > > +	ssize_t ret;
> > > +	u8 sink_count;
> > > +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> > > +	u32 sink_count_reg = DP_SINK_COUNT_ESI;
> > > +	u32 link_status_reg = DP_LANE0_1_STATUS;
> > > +
> > > +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg,
> > > &sink_count);
> > 
> > According to your last reply, if drm_dp_dpcd_readb() fail, we could
> > skip below statement. So this just for error checking? If so, the
> > next
> > drm_dp_dpcd_read() would also do the error checking, so the
> > checking
> > here is redundant.
> > 
> > Regards,
> > CK
> > 
> 
> Hello CK,
> 
> sorry, I don't get your point.
> We use "drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg, &sink_count)"
> to get sink count and use "drm_dp_dpcd_read(&mtk_dp->aux,
> link_status_reg, link_status, sizeof(link_status));" to get link
> status.
> 
> If we don't get any sink count, we don't need to check the link
> status.
> Therefore, we just return if we are failed to get sink count.

I assume that when error happen, both read sink_count and read
link_status would fail, so you could directly read link_status. Do you
think that when error happen, only read sink_count would fail and read
link_status would success? It it is the later case, we should keep the
checking of sink_count.

Regards,
CK

> 
> BRs,
> Bo-Chen
> 
> > > +	if (ret < 1) {
> > > +		drm_err(mtk_dp->drm_dev, "Read sink count failed\n");
> > > +		return;
> > > +	}
> > > +
> > > +	drm_dbg(mtk_dp->drm_dev,
> > > +		"read sink count from dpcd: %d\n", sink_count);
> > > +
> > > +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> > > link_status,
> > > +			       sizeof(link_status));
> > > +	if (!ret) {
> > > +		drm_err(mtk_dp->drm_dev, "Read link status failed\n");
> > > +		return;
> > > +	}
> > > +
> > > +	if (!drm_dp_channel_eq_ok(link_status, mtk_dp-
> > > > train_info.lane_count)) {
> > > 
> > > +		drm_err(mtk_dp->drm_dev, "Channel EQ failed\n");
> > > +		return;
> > > +	}
> > > +
> > > +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> > > +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> > > DP_DEVICE_SERVICE_IRQ_VECTOR,
> > > +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> > > +}
> > > +
> > 
> > 
> 
> 

