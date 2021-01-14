Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95192F5D85
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A44E6E190;
	Thu, 14 Jan 2021 09:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03D76897D4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 02:10:26 +0000 (UTC)
X-UUID: df674fde194541ecae0c9f7ea8dc16ed-20210114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NuaaCNSxyNSThWbdoMr70KINtL4T/OZl54vOvTQmmwg=; 
 b=BXScZta3ncBRPC9X66QojVlwS4EJsagj+w02cNU/vpYwQMuzQ9WiU1gyOPDo63Wl9dbmm2pcNPvV2cjuVMT1oE3IRgzqDf1XxAtA3Nkk5ZASTp7rgKI7x60TXACl8e9ZMevNsGFeyucFYOHUaBau1Nahy7mosSUc78DpDebOhUk=;
X-UUID: df674fde194541ecae0c9f7ea8dc16ed-20210114
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1618630623; Thu, 14 Jan 2021 10:10:22 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Jan 2021 10:10:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jan 2021 10:10:18 +0800
Message-ID: <1610590218.30053.2.camel@mhfsdcap03>
Subject: Re: [PATCH -next] phy: mediatek: Mark mtk_mipi_tx_driver with
 static keyword
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Zou Wei <zou_wei@huawei.com>
Date: Thu, 14 Jan 2021 10:10:18 +0800
In-Reply-To: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
References: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FCE73643E55E92ED26370A94CFD667C3147589CB9C210729EA13CD4E6D5BFDB62000:8
X-MTK: N
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:32 +0000
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-01-12 at 09:38 +0800, Zou Wei wrote:
> Fix the following sparse warning:
> 
> drivers/phy/mediatek/phy-mtk-mipi-dsi.c:237:24: warning: symbol 'mtk_mipi_tx_driver' was not declared. Should it be static?
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> index 18c4812..eeb357b 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -234,7 +234,7 @@ static const struct of_device_id mtk_mipi_tx_match[] = {
>  	{ },
>  };
>  
> -struct platform_driver mtk_mipi_tx_driver = {
> +static struct platform_driver mtk_mipi_tx_driver = {
>  	.probe = mtk_mipi_tx_probe,
>  	.remove = mtk_mipi_tx_remove,
>  	.driver = {

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
