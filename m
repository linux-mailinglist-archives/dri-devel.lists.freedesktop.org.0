Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D05B52AA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 04:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE16910E56F;
	Mon, 12 Sep 2022 02:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D8410E56F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 02:26:37 +0000 (UTC)
X-UUID: 0d87c550f52c4bd6a864009fbd496192-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kUjZF8zoBPBlzPI8fg689aeZ8/UV7t+gu/v4TkhZGuw=; 
 b=pHgmFeHN7EgeyesKlxNx3+9BFyRLsA5I3tuKTG+/UPV9DHgocpYEEvsiSxwFK7mZnhXaT9f8cJyW2nqOX5p/Im6W/+sdQzCCqycIENKjCHVB5ALzd9XvKDFCBS0SwO9OUhgn9c36UsUZfQ77mlfZO9kZUxtCWM5yH6la2vOEJ9U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:993ce5f5-6f49-4efb-bcee-def1c9f7f9b9, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:430c08f6-6e85-48d9-afd8-0504bbfe04cb,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0d87c550f52c4bd6a864009fbd496192-20220912
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 970829359; Mon, 12 Sep 2022 10:26:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 10:26:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 10:26:31 +0800
Message-ID: <ecdb209437e78b3273374ef963fd2c5c64ba88fd.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to
 set gamma
From: CK Hu <ck.hu@mediatek.com>
To: Jason-JH.Lin <jason-jh.lin@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Mon, 12 Sep 2022 10:26:31 +0800
In-Reply-To: <20220912013006.27541-9-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <20220912013006.27541-9-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jason:

On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> Since the bootlaoder may set the RELAY_MODE to gamma be for the
> kerenl,
> we have to clear the RELAY_MODE bit to make sure that the gamma is
> enabled correctly.
> 
> Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma module")

Fixes: 69a4237ab1d1 ("drm/mediatek: Separate gamma module")

and move this patch to the first patch of this series so this patch
could be picked to early stable branch.

Regards,
CK

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index d706f76fd30e..15fe2a4f98de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -18,6 +18,7 @@
>  #define DISP_GAMMA_EN				0x0000
>  #define GAMMA_EN					BIT(0)
>  #define DISP_GAMMA_CFG				0x0020
> +#define RELAY_MODE					BIT(0)
>  #define GAMMA_LUT_EN					BIT(1)
>  #define GAMMA_DITHERING					BIT(2)
>  #define DISP_GAMMA_SIZE				0x0030
> @@ -99,6 +100,7 @@ void mtk_gamma_set_common(struct device *dev, void
> __iomem *regs, struct drm_crt
>  
>  	if (state->gamma_lut) {
>  		reg = readl(regs + DISP_GAMMA_CFG);
> +		reg = reg & ~RELAY_MODE;
>  		reg = reg | GAMMA_LUT_EN;
>  		writel(reg, regs + DISP_GAMMA_CFG);
>  		lut_base = regs + DISP_GAMMA_LUT;

