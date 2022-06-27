Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D755B8C8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EE410F9DE;
	Mon, 27 Jun 2022 08:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7432010F378
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:54:15 +0000 (UTC)
X-UUID: ac0d9349dee64e149fcea46f3f750b57-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:5af8707a-0d31-44bd-930f-502e87a972db, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:50
X-CID-INFO: VERSION:1.1.6, REQID:5af8707a-0d31-44bd-930f-502e87a972db, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:50
X-CID-META: VersionHash:b14ad71, CLOUDID:c8e69aea-f7af-4e69-92ee-0fd74a0c286c,
 C
 OID:57f70d199596,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: ac0d9349dee64e149fcea46f3f750b57-20220627
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 544908856; Mon, 27 Jun 2022 16:54:10 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 27 Jun 2022 16:54:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 16:54:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 16:54:09 +0800
Message-ID: <fa4618ebd369664edd823f3883f5183152b34097.camel@mediatek.com>
Subject: Re: [PATCH v14 03/15] drm/mediatek: dpi: Add kernel document for
 struct mtk_dpi_conf
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Mon, 27 Jun 2022 16:54:09 +0800
In-Reply-To: <20220624030946.14961-4-rex-bc.chen@mediatek.com>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-4-rex-bc.chen@mediatek.com>
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

Hi, Bo-Chen:

On Fri, 2022-06-24 at 11:09 +0800, Bo-Chen Chen wrote:
> This driver will support dp_intf and there are many configs between
> dpi
> and dp_intf. Therefore, we will add many configs in "struct
> mtk_dpi_conf".
> To let this structure more readable, we add this kernel doc.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index e61cd67b978f..f66a121ba0c9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -118,6 +118,15 @@ struct mtk_dpi_yc_limit {
>  	u16 c_bottom;
>  };
>  
> +/**
> + * struct mtk_dpi_conf - Configuration of mediatek dpi.
> + * @cal_factor: Callback function to calculate factor value.
> + * @reg_h_fre_con: Register address of frequency control.
> + * @max_clock_khz: Max clock frequency supported for this SoCs in
> khz units.
> + * @edge_sel_en: Enable of edge selection.
> + * @output_fmts: Array of supported output formats.
> + * @num_output_fmts: Quantity of supported output formats.
> + */
>  struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
>  	u32 reg_h_fre_con;

