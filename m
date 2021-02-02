Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627D230B747
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 06:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887E36E8BB;
	Tue,  2 Feb 2021 05:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 380B86E82A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 05:45:04 +0000 (UTC)
X-UUID: 616ef20b39544bfda3a062f56e4f4edc-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vWZcC6YYw0lqvkHoZHkoY+ftCFJwcPe9Rtlupgtwkho=; 
 b=qR6n7zYCrjsTKIGiSMZ/aQsBrPeN74rGsNBiHhxquNcMhzxbXhilPHqbM3i9pd+G/1HHcmS1sGrhMXTFYKgo2uI3GaQcr2YbJ/cpa23X88kL8YXkHbtM0tFscMhCxIgZmF9xTQfoxwO38sC1Do196c9Z3BWUC7EZswVCD5aHTUg=;
X-UUID: 616ef20b39544bfda3a062f56e4f4edc-20210202
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1819939490; Tue, 02 Feb 2021 13:45:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 13:44:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 13:44:57 +0800
Message-ID: <1612244696.5495.3.camel@mtksdaap41>
Subject: Re: [PATCH v5 5/8] drm/mediatek: Fix ccorr size config
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Feb 2021 13:44:56 +0800
In-Reply-To: <20210201103727.376721-6-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
 <20210201103727.376721-6-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A2F3823DA73417D98C8401BF44D7E2D7A02393686702781434F89992CD26FE732000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

On Mon, 2021-02-01 at 18:37 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Fix setting to follow hardware datasheet. The original error setting
> affects mt8192 display.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 6ee2431e6b843..6c86673a835c3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -65,7 +65,7 @@ void mtk_ccorr_config(struct device *dev, unsigned int w,
>  {
>  	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
>  
> -	mtk_ddp_write(cmdq_pkt, h << 16 | w, &ccorr->cmdq_reg, ccorr->regs,
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &ccorr->cmdq_reg, ccorr->regs,
>  		      DISP_CCORR_SIZE);
>  	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg, ccorr->regs,
>  		      DISP_CCORR_CFG);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
