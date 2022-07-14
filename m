Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A835746A9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A90A35EA;
	Thu, 14 Jul 2022 08:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A447CA35D4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:24:37 +0000 (UTC)
X-UUID: fb79233c50374ef9906d04a084b2510a-20220714
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:be979295-5b6b-48f0-bea5-673219d4f0ee, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:54
X-CID-INFO: VERSION:1.1.8, REQID:be979295-5b6b-48f0-bea5-673219d4f0ee, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_HamU,ACT
 ION:release,TS:54
X-CID-META: VersionHash:0f94e32, CLOUDID:8e02f832-b9e4-42b8-b28a-6364427c76bb,
 C
 OID:d8d06ba71f39,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: fb79233c50374ef9906d04a084b2510a-20220714
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1261772095; Thu, 14 Jul 2022 16:24:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 14 Jul 2022 16:24:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 16:24:29 +0800
Message-ID: <b04f4a68e012157db43f8f7b0887d611f790a9c5.camel@mediatek.com>
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
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
Date: Thu, 14 Jul 2022 16:24:24 +0800
In-Reply-To: <8fad0421bb7a61ae5e2ecabfc93790f1e2f30b63.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
 <8fad0421bb7a61ae5e2ecabfc93790f1e2f30b63.camel@mediatek.com>
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

On Wed, 2022-07-13 at 16:10 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
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
> > ---
> 
> [snip]
> 
> > +
> > +struct mtk_dp_timings {
> > +	struct videomode vm;
> > +};
> > +
> > +struct mtk_dp_irq_sta {
> > +	bool hpd_inerrupt;
> > +};
> > +
> > +struct mtk_dp_train_info {
> > +	bool tps3;
> > +	bool tps4;
> > +	bool sink_ssc;
> > +	bool cable_plugged_in;
> > +	bool cable_state_change;
> > +	bool cr_done;
> > +	bool eq_done;
> > +	/* link_rate is in multiple of 0.27Gbps */
> > +	int link_rate;
> > +	int lane_count;
> > +	struct mtk_dp_irq_sta irq_sta;
> 
> There is only one member in struct mtk_dp_irq_sta, so drop struct
> mtk_dp_irq_sta and use bool hpd_inerrupt directly here.
> 

Hello CK,

ok, I will drop this.

> > +};
> > +
> > +struct mtk_dp_info {
> > +	u32 depth;
> > +	enum dp_pixelformat format;
> > +	struct mtk_dp_timings timings;
> 
> There is only one member in struct mtk_dp_timings, so drop struct
> mtk_dp_timings and use struct videomode vm directly here.
> 

This structure will add more variable in following patch.
whole struct is like,
struct mtk_dp_timings {
	struct videomode vm;
	u8 frame_rate;
	u32 pix_rate_khz;
};

I want to keep this.

BRs,
Bo-Chen


> Regards,
> CK
> 
> > +};
> > +
> 
> 

