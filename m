Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72C5AA90D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C67710E797;
	Fri,  2 Sep 2022 07:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD4410E797
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 07:45:03 +0000 (UTC)
X-UUID: b04c02c312664a58aad7877548812c95-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NyJm/OfsyIJ5uXNbYeIMyaLdtHaPXQQYpfcJJr8LKks=; 
 b=CqVqtw5g0paicSvSV4ijFkk4fI5/4lIsCvwagB4D5EwxaWCjLGnnL0g0Nlqz5SDNd3QJETfy1XOcGkD3EVUSHbeH6uq4wEfcvOd0oWDNyPjSrEpGDB8ItIcHk0cko4QbXIhm2zkmz7yiCmFN+r9ojRmnfcE4rNxDDRcsCkSI/DU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6c682a40-443c-41ad-8659-a9f47e1cfbe4, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:45
X-CID-INFO: VERSION:1.1.10, REQID:6c682a40-443c-41ad-8659-a9f47e1cfbe4, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_H
 am,ACTION:release,TS:45
X-CID-META: VersionHash:84eae18, CLOUDID:ce4b6ed0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:1bfeb7dab495,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b04c02c312664a58aad7877548812c95-20220902
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1450570812; Fri, 02 Sep 2022 15:44:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 15:44:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 15:44:57 +0800
Message-ID: <55eec0effd6cd08edbb130ec7f74ad993a75907d.camel@mediatek.com>
Subject: Re: [PATCH v17 07/10] drm/mediatek: dp: Determine device of
 next_bridge
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Fri, 2 Sep 2022 15:44:57 +0800
In-Reply-To: <20220901044149.16782-8-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <20220901044149.16782-8-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> It's not necessary to have a next_bridge for DP device, so we add
> this
> patch to judge this.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 136e13150281..e37c9185e4ec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1886,7 +1886,10 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  				     "failed to request dp irq
> resource\n");
>  
>  	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 
> 1, 0);
> -	if (IS_ERR(mtk_dp->next_bridge))
> +	if (IS_ERR(mtk_dp->next_bridge) &&
> +	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
> +		mtk_dp->next_bridge = NULL;
> +	else if (IS_ERR(mtk_dp->next_bridge))
>  		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
>  				     "Failed to get bridge\n");
>  

