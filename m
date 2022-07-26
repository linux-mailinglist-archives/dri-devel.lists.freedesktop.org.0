Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C0B580F2C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 10:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FD210E95D;
	Tue, 26 Jul 2022 08:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7B110E95D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 08:37:29 +0000 (UTC)
X-UUID: e80651ba2cde4989bf7630e6063b8e64-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:7ac7fa29-1ede-4cb9-a7ca-d5f2ff8137a1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:76ff0cee-db04-4499-9fdf-04ef44b9468c,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: e80651ba2cde4989bf7630e6063b8e64-20220726
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1551725302; Tue, 26 Jul 2022 16:37:24 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 16:37:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 16:37:22 +0800
Message-ID: <9140e0b37c71bfa8193d2177a1cc044df4761e15.camel@mediatek.com>
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
Date: Tue, 26 Jul 2022 16:37:21 +0800
In-Reply-To: <ae6da1f0c9a27f97b4e9dd76071d03f21dcfcd3b.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-6-rex-bc.chen@mediatek.com>
 <6232f0fc15bc1057aab68523e5eb63e10b3a2802.camel@mediatek.com>
 <ae6da1f0c9a27f97b4e9dd76071d03f21dcfcd3b.camel@mediatek.com>
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

On Tue, 2022-07-26 at 11:30 +0800, Rex-BC Chen wrote:
> On Mon, 2022-07-25 at 17:23 +0800, CK Hu wrote:
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
> > > +
> > > +/*
> > > + * We need to handle HPD signal in eDP even though eDP is a
> > > always
> > > connected
> > > + * device. Besides connected status, there is another feature
> > > for
> > > HPD signal -
> > > + * HPD pulse: it presents an IRQ from sink devices to source
> > > devices
> > > (Refer to
> > > + * 5.1.4 of DP1.4 spec).
> > > + */
> > > +static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
> > > +{
> > > +	bool hpd_change = false;
> > > +	u32 irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> > > +			 mtk_dp_hwirq_get_clear(mtk_dp);
> > > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > > +
> > > +	if (!irq_status)
> > > +		return IRQ_HANDLED;
> > > +
> > > +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> > > +		train_info->irq_sta.hpd_inerrupt = true;
> > > +	if (irq_status & MTK_DP_HPD_CONNECT ||
> > > +	    irq_status & MTK_DP_HPD_DISCONNECT)
> > > +		hpd_change = true;
> > > +
> > > +	if (!(hpd_change))
> > > +		return IRQ_WAKE_THREAD;
> > > +
> > > +	if (mtk_dp_plug_state(mtk_dp))
> > 
> > mtk_dp_plug_state() is called only here, and prevent function call
> > in
> > isr handler, so squash mtk_dp_plug_state() into this function.
> > 
> 
> Hello CK,
> 
> Thanks for review.
> 
> I would like to keep this because we will use this function for
> mtk_dp_plug_state_avoid_pulse() in dp patch.

Use train_info->cable_plugged_in instead of calling mtk_dp_plug_state()
because I think train_info->cable_plugged_in is synced with
mtk_dp_plug_state().

> 
> > > +		train_info->cable_plugged_in = true;
> > > +	else
> > > +		train_info->cable_plugged_in = false;
> > > +
> > > +	train_info->cable_state_change = true;
> > > +
> > > +	return IRQ_WAKE_THREAD;
> > > +}
> > > +
> > > +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> > > +{
> > > +	struct mtk_dp *mtk_dp = dev;
> > > +	u32 irq_status;
> > > +
> > > +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> > > +
> > > +	if (!irq_status)
> > > +		return IRQ_HANDLED;
> > > +
> > > +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
> > > +		return mtk_dp_hpd_isr_handler(mtk_dp);
> > 
> > Prevent function call in isr handler, squash
> > mtk_dp_hpd_isr_handler()
> > into this function.
> > 
> 
> Is this really necessary? We also modify this function in following
> patches. I think it's not a good idea to expand this.

mtk_dp_hpd_isr_handler() is only called in this function, is it really
necessary to separate this to a independent function? The function call
would increase jump instruction and stack push/pop instruction. I think
we should not do many things in isr handler. I've reviewed the later
patch and the later patch should be modified according to this.

Regards,
CK

> 
> BRs,
> Bo-Chen
> 
> > Regards,
> > CK
> > 
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > 
> > 
> 
> 

