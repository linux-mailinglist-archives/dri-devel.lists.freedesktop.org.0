Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350AA308719
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D7D6EA97;
	Fri, 29 Jan 2021 08:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C4106EA97
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 08:40:50 +0000 (UTC)
X-UUID: 060e5fa33d21459dbf534108548b2a12-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8LYed4Zwn/R7cvhFdVGZBG69vf/8TYNuvrg1e6/NGJE=; 
 b=H0w+TWDOLlnmcXQSWA/mRNVYrDNSlHttXLmT1oql1kljcW1+p+nn1GE355XvEyhaqdOZ4KxhGQ4znCpQQkD/wRVXWTI5G12T8exLLyY8Uge8h35Tuuy/KO8TL8jvkgKze9l+L3UpyMQ+y0U7XXvxg087y4a5p5jzwOLYQULxfiE=;
X-UUID: 060e5fa33d21459dbf534108548b2a12-20210129
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 336206262; Fri, 29 Jan 2021 16:40:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 16:40:42 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:40:42 +0800
Message-ID: <1611909641.31184.11.camel@mtksdaap41>
Subject: Re: [PATCH v4 6/8] drm/mediatek: add matrix bits private data for
 ccorr
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 16:40:41 +0800
In-Reply-To: <20210129073436.2429834-7-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 07838E2DF8FE698C3E994C67D0C67BE09B3C9FAC28E56910A68D922798B518752000:8
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

On Fri, 2021-01-29 at 15:34 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> matrix bits of mt8183 is 12
> matrix bits of mt8192 is 13
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 0c68090eb1e92..1c7163a12f3b1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -31,8 +31,10 @@
>  #define DISP_CCORR_COEF_3			0x008C
>  #define DISP_CCORR_COEF_4			0x0090
>  
> +#define CCORR_MATRIX_BITS			12
> +
>  struct mtk_disp_ccorr_data {
> -	u32 reserved;
> +	u32 matrix_bits;
>  };
>  
>  /**
> @@ -116,6 +118,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	uint16_t coeffs[9] = { 0 };
>  	int i;
>  	struct cmdq_pkt *cmdq_pkt = NULL;
> +	u32 matrix_bits;
>  
>  	if (!blob)
>  		return;
> @@ -123,8 +126,16 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	ctm = (struct drm_color_ctm *)blob->data;
>  	input = ctm->matrix;
>  
> -	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> +	if (ccorr->data)
> +		matrix_bits = ccorr->data->matrix_bits;
> +	else
> +		matrix_bits = CCORR_MATRIX_BITS;
> +
> +	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
>  		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> +		if (matrix_bits > CCORR_MATRIX_BITS)
> +			coeffs[i] <<= (matrix_bits - CCORR_MATRIX_BITS);

I think format of MT8192 ccorr coeffs is s1.11, after
mtk_ctm_s31_32_to_s1_10(), you lose one bit precision. So modify
mtk_ctm_s31_32_to_s1_10() to get maximum precision.

Regards,
CK

> +	}
>  
>  	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
>  		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> @@ -205,8 +216,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> +	.matrix_bits = CCORR_MATRIX_BITS,
> +};
> +
>  static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
> -	{ .compatible = "mediatek,mt8183-disp-ccorr"},
> +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> +	  .data = &mt8183_ccorr_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
