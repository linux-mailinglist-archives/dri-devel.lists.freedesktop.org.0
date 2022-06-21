Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D186A55322C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B061122BB;
	Tue, 21 Jun 2022 12:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858251122BB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:36:45 +0000 (UTC)
X-UUID: 3d23542066bb47bd896da04832323de9-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:2b65926c-2a54-459f-84f5-4a15c4badc6e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:2b65926c-2a54-459f-84f5-4a15c4badc6e, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:3a9f1338-5e4b-44d7-80b2-bb618cb09d29,
 C
 OID:52f5ece34a56,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3d23542066bb47bd896da04832323de9-20220621
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1555816553; Tue, 21 Jun 2022 20:36:39 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 21 Jun 2022 20:36:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 20:36:37 +0800
Message-ID: <b609f8db2a2ae9f5c9e3b6bc60498115bb054990.camel@mediatek.com>
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
Date: Tue, 21 Jun 2022 20:36:37 +0800
In-Reply-To: <597d190f72427d5d1da7a4ca46b219e2edb69693.camel@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
 <597d190f72427d5d1da7a4ca46b219e2edb69693.camel@mediatek.com>
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

On Mon, 2022-06-20 at 11:54 +0800, CK Hu wrote:
> Hi, Rex:
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
> > +static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
> > +				      struct drm_bridge_state
> > *bridge_state,
> > +				      struct drm_crtc_state
> > *crtc_state,
> > +				      struct drm_connector_state
> > *conn_state)
> > +{
> > +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > +	struct drm_crtc *crtc = conn_state->crtc;
> > +	unsigned int input_bus_format;
> > +
> > +	input_bus_format = bridge_state->input_bus_cfg.format;
> > +
> > +	dev_dbg(mtk_dp->dev, "input format 0x%04x, output format
> > 0x%04x\n",
> > +		bridge_state->input_bus_cfg.format,
> > +		 bridge_state->output_bus_cfg.format);
> > +
> > +	mtk_dp->input_fmt = input_bus_format;
> > +	if (mtk_dp->input_fmt == MEDIA_BUS_FMT_YUYV8_1X16)
> 
> input_fmt is used only in this function, so let it be local variable.
> 
> Regards,
> CK
> 

ok, I will do this.

BRs,
Bo-Chen

> > +		mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
> > +	else
> > +		mtk_dp->info.format = DP_PIXELFORMAT_RGB;
> > +
> > +	if (!crtc) {
> > +		drm_err(mtk_dp->drm_dev,
> > +			"Can't enable bridge as connector state doesn't
> > have a crtc\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state-
> > > adjusted_mode);
> > 
> > +	if (mtk_dp_parse_capabilities(mtk_dp)) {
> > +		drm_err(mtk_dp->drm_dev,
> > +			"Can't enable bridge as nothing is plugged
> > in\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> 

