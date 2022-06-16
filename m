Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F154DF74
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 12:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D6D112CAE;
	Thu, 16 Jun 2022 10:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B5A112CAE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 10:49:14 +0000 (UTC)
X-UUID: 01466ab16e38484b9dc94e16ca5bd337-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:3d75f028-80d6-40a2-9770-74c0522d4ef7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:f4417cf6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 01466ab16e38484b9dc94e16ca5bd337-20220616
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 107020473; Thu, 16 Jun 2022 18:49:08 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 18:49:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 18:49:07 +0800
Message-ID: <b8a421b7f467ed8b9e08a778957e99544485fd4e.camel@mediatek.com>
Subject: Re: [PATCH v11 11/12] drm/mediatek: dpi: Only enable dpi after the
 bridge is enabled
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Thu, 16 Jun 2022 18:49:07 +0800
In-Reply-To: <9adfb4b98e505c10469395bf3038010024ab86fd.camel@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-12-rex-bc.chen@mediatek.com>
 <9adfb4b98e505c10469395bf3038010024ab86fd.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-14 at 14:24 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > Enabling the dpi too early causes glitches on screen.
> > 
> > Move the call to mtk_dpi_enable() at the end of the bridge_enable
> > callback to ensure everything is setup properly before enabling
> > dpi.
> 
> This seems a bug fix, so add Fixes tag on this patch.
> 
> Regards,
> CK
> 

ok, I will do this using this patch:
f89c696e7f635487481eee0d196ab49730ce8664

> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 08c8f21b4421..9668bd5dd14a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -480,7 +480,6 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >  	if (dpi->pinctrl && dpi->pins_dpi)
> >  		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> >  
> > -	mtk_dpi_enable(dpi);
> >  	return 0;
> >  
> >  err_pixel:
> > @@ -726,6 +725,7 @@ static void mtk_dpi_bridge_enable(struct
> > drm_bridge *bridge)
> >  
> >  	mtk_dpi_power_on(dpi);
> >  	mtk_dpi_set_display_mode(dpi, &dpi->mode);
> > +	mtk_dpi_enable(dpi);
> >  }
> >  
> >  static enum drm_mode_status
> 
> 

