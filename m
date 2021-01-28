Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD01306CFC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 06:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266DD6E8D5;
	Thu, 28 Jan 2021 05:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED14C6E8D5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 05:35:06 +0000 (UTC)
X-UUID: a3577d1d7c8f48b4af7fe2e225f717d2-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XxO6FR8xvA123ZiF/PL7oeET5mcxrQ+uDd5Kof3HnYk=; 
 b=Ie1P9uZwXh8+lYMLj0x7CUUyWRunYZy+TESyg342tpr2RhB/dwlAomiEuKz81hr9qyXJKN+866q9ZjDkJSgFWK8YX1p2MFPPKbAhTxSdr1Er5ZTJGtVSlbYk8ioPt0ConaJ5MaO0G36Oa+32ABtdpYRFuzvpigauxZzpzyoCcYQ=;
X-UUID: a3577d1d7c8f48b4af7fe2e225f717d2-20210128
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1382939228; Thu, 28 Jan 2021 13:35:03 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 13:34:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 13:34:53 +0800
Message-ID: <1611812093.28312.1.camel@mtksdaap41>
Subject: Re: [PATCH v10 6/9] drm/mediatek: add has_dither private data for
 gamma
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 13:34:53 +0800
In-Reply-To: <20210127045422.2418917-7-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 47C7AAB9C7C5D61CCA99EDA13880D171FB27A2778886A43D53DF0D0E9A7BDD962000:8
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Not all SoC has dither function in gamma module.
> Add private data to control this function setting.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index b5a499d7e472c..c98fe284265d0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -25,7 +25,7 @@
>  #define LUT_10BIT_MASK				0x03ff
>  
>  struct mtk_disp_gamma_data {
> -	u32 reserved;
> +	bool has_dither;
>  };
>  
>  /**
> @@ -91,7 +91,8 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
>  
>  	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
>  		      DISP_GAMMA_SIZE);
> -	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
> +	if (gamma->data && gamma->data->has_dither)
> +		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
>  }
>  
>  void mtk_gamma_start(struct device *dev)
> @@ -171,8 +172,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
> +	.has_dither = true,
> +};
> +
>  static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
> -	{ .compatible = "mediatek,mt8173-disp-gamma"},
> +	{ .compatible = "mediatek,mt8173-disp-gamma",
> +	  .data = &mt8173_gamma_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
