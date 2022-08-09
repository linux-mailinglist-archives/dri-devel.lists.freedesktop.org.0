Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592858D519
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 10:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F291125CC;
	Tue,  9 Aug 2022 08:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0D6112A6B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 08:01:48 +0000 (UTC)
X-UUID: a81a8667ce8d4c8c8d6095012a684188-20220809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UnISrPZbEARL17mL/MeN88mOyzX08bBl1eKun0Gx6wc=; 
 b=JZy3ocpiccQ0nuEbZuIFKJG50qzjcbi9BVVcJ0y72eSQRWOv7ppbcHXusRMQeoL+bONY1EXCOslw3wOz0GeMmM4ziC3fQFCdM2BikTydafZ813E0FH5sf2IggkUSW4GY0zqBalzuPv+aR6qDZbryhLI+47NnI/obQrVupH42WHo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9, REQID:a4c6b259-979c-48da-ac6f-60f6ba1bab1a,
 OB:-327
 68,LOB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-32768,FILE:0,BULK:-32768
 ,RULE:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9, CLOUDID:c89e4eae-9535-44a6-aa9b-7f62b79b6ff6,
 C
 OID:nil,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bul
 k:nil,QS:nil,BEC:nil,COL:0
X-UUID: a81a8667ce8d4c8c8d6095012a684188-20220809
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1257392279; Tue, 09 Aug 2022 16:01:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 16:01:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 16:01:35 +0800
Message-ID: <76efe86bb6ffa2447fd68ea9f77d86712bf44662.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
Date: Tue, 9 Aug 2022 16:01:33 +0800
In-Reply-To: <575181dc6cdd1fcf391e840c0fcd5722b954a457.camel@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
 <20220805101459.3386-4-rex-bc.chen@mediatek.com>
 <575181dc6cdd1fcf391e840c0fcd5722b954a457.camel@mediatek.com>
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

On Mon, 2022-08-08 at 16:04 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
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
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> 
> [snip]
> 
> > +
> > +static enum drm_mode_status
> > +mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
> > +			 const struct drm_display_info *info,
> > +			 const struct drm_display_mode *mode)
> > +{
> > +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > +	u32 rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
> > +	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16
> > : 24;
> > +
> > +	if (rx_linkrate * mtk_dp->train_info.lane_count < mode->clock *
> > bpp / 8)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (mode->clock > 600000)
> 
> If the clock has pass the linkrate and land_count limitation, the
> clock
> would be OK because the linkrate and lane_count is trained. Why need
> to
> check 600000?
> 
> Regards,
> CK
> 

Hello CK,

The condition above is enough to cover this.
I will drop this check.

BRs,
Bo-Chen

> > +		return MODE_CLOCK_HIGH;
> > +
> > +	return MODE_OK;
> > +}
> > +
> 
> 

