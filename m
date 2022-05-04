Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F45198AB
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A31310E69A;
	Wed,  4 May 2022 07:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36C210E682
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 07:49:38 +0000 (UTC)
X-UUID: 9cf55fe384c54654b1a7e26840ee85ab-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:316b3e78-fd0b-4c87-8b0e-b40997c00c39, OB:10,
 L
 OB:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:53
X-CID-INFO: VERSION:1.1.4, REQID:316b3e78-fd0b-4c87-8b0e-b40997c00c39, OB:10,
 LOB
 :0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:53
X-CID-META: VersionHash:faefae9, CLOUDID:7289a82f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:bbac95824a32,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 9cf55fe384c54654b1a7e26840ee85ab-20220504
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1163909422; Wed, 04 May 2022 15:49:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 15:49:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 15:49:30 +0800
Message-ID: <41eb4b05c703d0377b7139ad0868cebea8f6fc47.camel@mediatek.com>
Subject: Re: [PATCH -next] drm: mediatek: mtk_dsi: Remove unnecessary print
 function dev_err()
From: CK Hu <ck.hu@mediatek.com>
To: Yang Li <yang.lee@linux.alibaba.com>, <matthias.bgg@gmail.com>
Date: Wed, 4 May 2022 15:49:30 +0800
In-Reply-To: <20220224012318.84935-1-yang.lee@linux.alibaba.com>
References: <20220224012318.84935-1-yang.lee@linux.alibaba.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yang:

On Thu, 2022-02-24 at 09:23 +0800, Yang Li wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
> 
> Eliminate the follow coccicheck warning:
> ./drivers/gpu/drm/mediatek/mtk_dsi.c:1092:2-9: line 1092 is redundant
> because platform_get_irq() already prints an error

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bced4c7d668e..704252ee1198 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1089,7 +1089,6 @@ static int mtk_dsi_probe(struct platform_device
> *pdev)
>  
>  	irq_num = platform_get_irq(pdev, 0);
>  	if (irq_num < 0) {
> -		dev_err(&pdev->dev, "failed to get dsi irq_num: %d\n",
> irq_num);
>  		ret = irq_num;
>  		goto err_unregister_host;
>  	}

