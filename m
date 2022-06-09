Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0915444BA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26F10E4D0;
	Thu,  9 Jun 2022 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FAA10E918
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:24:40 +0000 (UTC)
X-UUID: ca9b03a3d11d4a2c9f714498a8aebbea-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:64c21d66-609b-40f5-8f40-e3069bad7da0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:5cdc38e5-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: ca9b03a3d11d4a2c9f714498a8aebbea-20220609
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1223699442; Thu, 09 Jun 2022 15:24:33 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Jun 2022 15:24:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 9 Jun 2022 15:24:33 +0800
Message-ID: <dba8cf8aac439fdecd9eba7009845d76ebca6666.camel@mediatek.com>
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
Date: Thu, 9 Jun 2022 15:24:33 +0800
In-Reply-To: <49f4f8732eb1df31b0c8a82761e1c4dad9aef106.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
 <f791f46c6307a18818574cb7fb8653bcc84aa9ad.camel@mediatek.com>
 <75c00caca74b8366ca2c4594a8229b6de95c5f47.camel@mediatek.com>
 <49f4f8732eb1df31b0c8a82761e1c4dad9aef106.camel@mediatek.com>
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

On Thu, 2022-06-09 at 10:30 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Wed, 2022-06-08 at 18:26 +0800, Rex-BC Chen wrote:
> > On Tue, 2022-06-07 at 15:47 +0800, CK Hu wrote:
> > > Hi, Rex:
> > > 
> > > On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > 
> > > > This patch adds a DisplayPort driver for the Mediatek mt8195
> > > > SoC.
> > > > 
> > > > It supports the mt8195, the embedded DisplayPort units. It
> > > > offers
> > > > DisplayPort 1.4 with up to 4 lanes.
> > > > 
> > > > The driver creates a child device for the phy. The child device
> > > > will
> > > > never exist without the parent being active. As they are
> > > > sharing
> > > > a
> > > > register range, the parent passes a regmap pointer to the child
> > > > so
> > > > that
> > > > both can work with the same register range. The phy driver sets
> > > > device
> > > > data that is read by the parent to get the phy device that can
> > > > be
> > > > used
> > > > to control the phy properties.
> > > > 
> > > > This driver is based on an initial version by
> > > > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > > > 
> > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +
> > > > +static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> > > > +{
> > > > +	ssize_t ret;
> > > > +	u8 sink_count;
> > > > +	bool locked;
> > > > +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> > > > +	u32 sink_count_reg = DP_SINK_COUNT_ESI;
> > > > +	u32 link_status_reg = DP_LANE0_1_STATUS;
> > > > +
> > > > +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg,
> > > > &sink_count);
> > > > +	if (ret < 0) {
> > > > +		drm_err(mtk_dp->drm_dev, "Read sink count
> > > > failed:
> > > > %ld\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> > > > link_status,
> > > > +			       sizeof(link_status));
> > > > +	if (!ret) {
> > > > +		drm_err(mtk_dp->drm_dev, "Read link status
> > > > failed:
> > > > %ld\n",
> > > > +			ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	locked = drm_dp_channel_eq_ok(link_status,
> > > > +				      mtk_dp-
> > > > >train_info.lane_count);
> > > > +	if (!locked && mtk_dp->train_state >
> > > > MTK_DP_TRAIN_STATE_TRAINING_PRE)
> > > 
> > > Before enter this function, mtk_dp->train_state is set to
> > > MTK_DP_TRAIN_STATE_STARTUP, so this never happen, drop this.
> > > 
> > 
> > The interrupt from sink device could come any time. Why it's
> > impossible?
> 
> I still ask this question: "For eDP, when does disconnect happened?"
> If
> it indeed happen, I still do not like to change state here. When
> disconnect, the training flow would result in fail finally and need
> not
> to change state here, but the training flow would block for a while
> when disconnect. You could add some check point to check train_info-
> > cable_plugged_in to quickly break out the training flow.
> 
> Regards,
> CK
> 

Hello CK,

This function is to handle "sink interrupt" and we need to read the
status from sink device via aux channel.
edp spec is just add some extension rule from dp spec, this is define
in dp spec.

The basic spec is still "dp", and these are all define in dp spec.
Therefore, I think we should keep this.

BRs,
Bo-Chen

> > 
> > > > +		mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_TRAINING_PRE;
> > > > +
> > > > +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> > > > +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> > > > DP_DEVICE_SERVICE_IRQ_VECTOR,
> > > > +				   DP_REMOTE_CONTROL_COMMAND_PE
> > > > NDING);
> > > > +
> > > > +	if (DP_GET_SINK_COUNT(sink_count) &&
> > > > +	    (link_status[2] &
> > > > DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> > > > +		mtk_dp->train_info.check_cap_count = 0;
> > > > +		mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_CHECKEDID;
> > > 
> > > Why change state from MTK_DP_TRAIN_STATE_STARTUP to
> > > MTK_DP_TRAIN_STATE_CHECKEDID? In mtk_dp_train_handler(),
> > > mtk_dp_parse_capabilities() is true then change to
> > > MTK_DP_TRAIN_STATE_CHECKEDID. Give a reason why these two are
> > > different.
> > > 
> > > Regards,
> > > CK
> > > 
> > 
> > I will drop this and drop state of MTK_DP_TRAIN_STATE_CHECKEDID.
> > MTK_DP_TRAIN_STATE_CHECKEDID is only used for audio.
> > We can check enable status in another place.
> > 
> > BRs,
> > Bo-Chen
> > 
> > > > +		msleep(20);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > 
> > > 
> > 
> > 
> 
> 

