Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACB5FC16A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 09:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC6410E0F7;
	Wed, 12 Oct 2022 07:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C73D10E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 07:48:57 +0000 (UTC)
X-UUID: 4d2f8148bc564940abd72fa1edf18b24-20221012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qCNxzOKYmtTnoInV5j5hFtdhCGIPCn3WQ0Hs3Sj6Pog=; 
 b=I3OTq+rcx8A2HDQxU0o2cq7Hii9ef5RRMQiZgq4tqT1hmMxM9w5276pin9vm6o//pkiGE5FPQYEAcJ8PvL1QZhqrFGEcULEeV5C+TPiNNVv7ANLsw7UDsRkIjFV4BIuYknvpwrJsdk0HcUM4DA8W6Wo8hGgzJRp5tUXAlqUcMzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:0d9c4191-9031-4106-a270-44578677957a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:51
X-CID-INFO: VERSION:1.1.11, REQID:0d9c4191-9031-4106-a270-44578677957a, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:51
X-CID-META: VersionHash:39a5ff1, CLOUDID:3d22ade1-2948-402a-a6e4-b5d31fe11eb7,
 B
 ulkID:221012154843A0RB8NXV,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824|102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:
 nil,COL:0
X-UUID: 4d2f8148bc564940abd72fa1edf18b24-20221012
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1915592987; Wed, 12 Oct 2022 15:48:42 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 12 Oct 2022 15:48:41 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 12 Oct 2022 15:48:40 +0800
Message-ID: <9fe3a2381746b46bde171f01635d30da2cb93d64.camel@mediatek.com>
Subject: Re: [PATCH] drm: mediatek: Modify dpi power on/off sequence.
From: xinlei.lee <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
Date: Wed, 12 Oct 2022 15:48:46 +0800
In-Reply-To: <1662386033-4463-1-git-send-email-xinlei.lee@mediatek.com>
References: <1662386033-4463-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-09-05 at 21:53 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Modify dpi power on/off sequence so that the first gpio operation
> will take effect.
> 
> Fixes: 6bd4763fd532 ("drm/mediatek: set dpi pin mode to gpio low to
> avoid leakage
> current")
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> ---
> Base on the branch of Linux-next/master.
> Because dpi power_on/off is protected by dpi->refcount, the first
> time
> it cannot be powered on and off successfully, it will cause leakage.
> ---
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..2ce1a39ce3bf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -462,9 +462,6 @@ static void mtk_dpi_power_off(struct mtk_dpi
> *dpi)
>  	if (--dpi->refcount != 0)
>  		return;
>  
> -	if (dpi->pinctrl && dpi->pins_gpio)
> -		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> -
>  	mtk_dpi_disable(dpi);
>  	clk_disable_unprepare(dpi->pixel_clk);
>  	clk_disable_unprepare(dpi->engine_clk);
> @@ -489,9 +486,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  		goto err_pixel;
>  	}
>  
> -	if (dpi->pinctrl && dpi->pins_dpi)
> -		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> -
>  	return 0;
>  
>  err_pixel:
> @@ -721,6 +715,9 @@ static void mtk_dpi_bridge_disable(struct
> drm_bridge *bridge)
>  {
>  	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>  
> +	if (dpi->pinctrl && dpi->pins_gpio)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> +
>  	mtk_dpi_power_off(dpi);
>  }
>  
> @@ -728,6 +725,9 @@ static void mtk_dpi_bridge_enable(struct
> drm_bridge *bridge)
>  {
>  	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>  
> +	if (dpi->pinctrl && dpi->pins_dpi)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> +
>  	mtk_dpi_power_on(dpi);
>  	mtk_dpi_set_display_mode(dpi, &dpi->mode);
>  	mtk_dpi_enable(dpi);

Hi CK,

Gentle ping for this patch, if there is anything I need to modify,
please kindly let me know.

Best Regards!
xinlei

