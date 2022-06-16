Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4FF54DB28
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BCD10E0F2;
	Thu, 16 Jun 2022 07:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6898810E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:00:40 +0000 (UTC)
X-UUID: 767d3273bba347daa58495b1f88ea684-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:a356ef53-d17d-465a-8c45-06445cb099d1, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:a356ef53-d17d-465a-8c45-06445cb099d1, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:7219b648-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:b96a0f64d808,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 767d3273bba347daa58495b1f88ea684-20220616
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 59940981; Thu, 16 Jun 2022 15:00:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 15:00:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 15:00:12 +0800
Message-ID: <f6d8ad7cade15c2b0388d64f31bef47d73b7bec7.camel@mediatek.com>
Subject: Re: [PATCH v11 1/1] phy: phy-mtk-dp: Add driver for DP phy
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
 <chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Date: Thu, 16 Jun 2022 15:00:12 +0800
In-Reply-To: <8a87d094-1c9e-d899-6671-ebf8c80ffbe6@collabora.com>
References: <20220613072648.11081-1-rex-bc.chen@mediatek.com>
 <20220613072648.11081-2-rex-bc.chen@mediatek.com>
 <8a87d094-1c9e-d899-6671-ebf8c80ffbe6@collabora.com>
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-06-13 at 12:39 +0200, AngeloGioacchino Del Regno wrote:
> Il 13/06/22 09:26, Bo-Chen Chen ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This is a new driver that supports the integrated DisplayPort phy
> > for
> > mediatek SoCs, especially the mt8195. The phy is integrated into
> > the
> > DisplayPort controller and will be created by the mtk-dp driver.
> > This
> > driver expects a struct regmap to be able to work on the same
> > registers
> > as the DisplayPort controller. It sets the device data to be the
> > struct
> > phy so that the DisplayPort controller can easily work with it.
> > 
> > The driver does not have any devicetree bindings because the
> > datasheet
> > does not list the controller and the phy as distinct units.
> > 
> > The interaction with the controller can be covered by the configure
> > callback of the phy framework and its displayport parameters.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Modify reviewers' comments.]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> 
> There's no power_on()/power_off() callbacks and looks a bit weird,
> but it's
> also right... the only thing that's missing, IMO, is a comment in the
> actual
> file explaining that power for this PHY is always on when the DP
> block is on
> and that no PHY specific power sequence has to be carried on (being
> managed
> elsewhere and strongly tied to the specific DP IP).
> 
> Besides that,
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hello Angelo,

there is no power-on/off setting register for dp-phy because of the
hardware design.

Therefore, we power-on/off using enable/disable power domain.
You can see the function mtk_dp_suspend/mtk_dp_resume in mtk-dp.c
"pm_runtime_get_sync/pm_runtime_put_sync".

When the power domain is disable, the phy is also diabled.

BRs,
Bo-Chen

