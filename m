Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC27574797
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF14889B27;
	Thu, 14 Jul 2022 08:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785DAA392A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:52:40 +0000 (UTC)
X-UUID: 340751b7aa9543e89745301b34b2863d-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:8d278bf5-35ae-451a-a9a0-cc1cff9d1f6b, OB:10,
 L
 OB:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:51
X-CID-INFO: VERSION:1.1.8, REQID:8d278bf5-35ae-451a-a9a0-cc1cff9d1f6b, OB:10,
 LOB
 :10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:51
X-CID-META: VersionHash:0f94e32, CLOUDID:60164964-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:e043d49c5493,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 340751b7aa9543e89745301b34b2863d-20220714
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1643507264; Thu, 14 Jul 2022 16:52:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Jul 2022 16:52:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 16:52:30 +0800
Message-ID: <a8cf1b4465bb0599d0688ace020d896c1ce54b24.camel@mediatek.com>
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
Date: Thu, 14 Jul 2022 16:52:29 +0800
In-Reply-To: <9eceb5412bfed5f408153fe05bc2f8a4e3570b77.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
 <9eceb5412bfed5f408153fe05bc2f8a4e3570b77.camel@mediatek.com>
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

On Wed, 2022-07-13 at 17:31 +0800, CK Hu wrote:
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
> > +static void mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32
> > offset, u8 *buf,
> > +				    size_t length)
> 
> The offset would always be MTK_DP_AUX_P0_3708, so drop offset and use
> MTK_DP_AUX_P0_3708 directly.
> 

Hello CK,

I don't think it's a good idea. this function is a fucntion of writing
registers. I want to keep the offset variable.

> > +{
> > +	int i;
> > +	int num_regs = (length + 1) / 2;
> > +
> > +	/* 2 bytes per register */
> > +	for (i = 0; i < num_regs; i++) {
> > +		u32 val = buf[i * 2] |
> > +			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 :
> > 0);
> > +
> > +		if (mtk_dp_write(mtk_dp, offset + i * 4, val))
> > +			return;
> > +	}
> 
> for (i = 0; i < length; i += 2) {
> 	val = buf[i] | (i + 1 < length ? buf[i + 1] << 8 : 0);
> 	if (mtk_dp_write(mtk_dp, MTK_DP_AUX_P0_3708 + i * 2, val))
> 		return;
> }
> 

ok.

BRs,
Bo-Chen

> Regards,
> CK
> 
> > +}
> > +
> 
> 

