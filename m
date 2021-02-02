Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B730BA93
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 10:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6916E918;
	Tue,  2 Feb 2021 09:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id E31BB6E918
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 09:11:20 +0000 (UTC)
X-UUID: 775f677d5dd345f9a099aabff81950b6-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wRjR23K75RHA6M/pTcEC8v+EkXEFCsftGJj/hWO0sw0=; 
 b=c3qf5KzoUI+f+Qv2Amr9tJS46m5OKSfal4qmCwiQXBuqDCNjKURAhSEauZTn2fMV1bOBO0nzE8SOi1dukh50g7vLG+esO9HZvdJqQkiOZHojKHPE50pK5SjLQQ/+MW1svwUSnEWROCsNGGHhihxXLU8d9Qu/C6guRyDw972kfXc=;
X-UUID: 775f677d5dd345f9a099aabff81950b6-20210202
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 991221200; Tue, 02 Feb 2021 17:11:15 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 17:11:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 17:11:08 +0800
Message-ID: <1612257068.30872.1.camel@mtksdaap41>
Subject: Re: [PATCH v6 6/8] drm/mediatek: add matrix_bits private data for
 ccorr
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Feb 2021 17:11:08 +0800
In-Reply-To: <20210202081237.774442-7-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-7-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1E5761D9C1C19A1F7E42032CD881AABB413824A99811F9EA1FCE8AA218FF0E592000:8
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

On Tue, 2021-02-02 at 16:12 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add matrix_bits and coeffs_precision to ccorr private data:
> - matrix bits of mt8183 is 10
> - matrix bits of mt8192 is 11
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 27 ++++++++++++++---------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> index 6c86673a835c3..141cb36b9c07b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> @@ -30,7 +30,7 @@
>  #define DISP_CCORR_COEF_4			0x0090
>  
>  struct mtk_disp_ccorr_data {
> -	u32 reserved;
> +	u32 matrix_bits;
>  };
>  
>  /**
> @@ -85,21 +85,22 @@ void mtk_ccorr_stop(struct device *dev)
>  	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
>  }
>  
> -/* Converts a DRM S31.32 value to the HW S1.10 format. */
> -static u16 mtk_ctm_s31_32_to_s1_10(u64 in)
> +/* Converts a DRM S31.32 value to the HW S1.n format. */
> +static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
>  {
>  	u16 r;
>  
>  	/* Sign bit. */
> -	r = in & BIT_ULL(63) ? BIT(11) : 0;
> +	r = in & BIT_ULL(63) ? BIT(n + 1) : 0;
>  
>  	if ((in & GENMASK_ULL(62, 33)) > 0) {
> -		/* identity value 0x100000000 -> 0x400, */
> +		/* identity value 0x100000000 -> 0x400(mt8183), */
> +		/* identity value 0x100000000 -> 0x800(mt8192), */
>  		/* if bigger this, set it to max 0x7ff. */
> -		r |= GENMASK(10, 0);
> +		r |= GENMASK(n, 0);
>  	} else {
> -		/* take the 11 most important bits. */
> -		r |= (in >> 22) & GENMASK(10, 0);
> +		/* take the n+1 most important bits. */
> +		r |= (in >> (32 - n)) & GENMASK(n, 0);
>  	}
>  
>  	return r;
> @@ -114,6 +115,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	uint16_t coeffs[9] = { 0 };
>  	int i;
>  	struct cmdq_pkt *cmdq_pkt = NULL;
> +	u32 matrix_bits = ccorr->data->matrix_bits;
>  
>  	if (!blob)
>  		return;
> @@ -122,7 +124,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
>  	input = ctm->matrix;
>  
>  	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
> -		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
> +		coeffs[i] = mtk_ctm_s31_32_to_s1_n(input[i], matrix_bits);
>  
>  	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
>  		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
> @@ -199,8 +201,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
> +	.matrix_bits = 10,
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
