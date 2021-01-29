Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA383086F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2906E558;
	Fri, 29 Jan 2021 08:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B5B66E558
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 08:21:50 +0000 (UTC)
X-UUID: 7c0016b7855c4e9f92a32cf201cd6bdd-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CLobLn6bICgFMKKKwjHAF6jHqoEhPtYplivFdZU9Cuo=; 
 b=tUz0C18Qqo50VIU3GouO3nXqmzL1YNxF6nXELK2PH4mPlCN+KEfE2n1tNafUERoKy/W3RJcsCJt+VVDJ1eaFwfUb3NOGzRgjgBKDMUppBLWZ4Tye6oBGTcJc+VRvVzhNJ2iXErSBFpVIeWy0neiHoKreIPWamlGAjF67Iff2Nkg=;
X-UUID: 7c0016b7855c4e9f92a32cf201cd6bdd-20210129
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 128826079; Fri, 29 Jan 2021 16:21:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 16:21:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:21:40 +0800
Message-ID: <1611908500.31184.6.camel@mtksdaap41>
Subject: Re: [PATCH v4 4/8] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 16:21:40 +0800
In-Reply-To: <20210129073436.2429834-5-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-5-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B9506A6240F53003C89395367A3003479BD04D05EB24A63E0EEDC54AE4EC96B2000:8
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
> enable OVL_LAYER_SMI_ID_EN for multi-layer usecase, without this patch,
> ovl will hang up when more than 1 layer enabled.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index da7e38a28759b..961f87f8d4d15 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -24,6 +24,7 @@
>  #define DISP_REG_OVL_RST			0x0014
>  #define DISP_REG_OVL_ROI_SIZE			0x0020
>  #define DISP_REG_OVL_DATAPATH_CON		0x0024
> +#define OVL_LAYER_SMI_ID_EN				BIT(0)
>  #define OVL_BGCLR_SEL_IN				BIT(2)
>  #define DISP_REG_OVL_ROI_BGCLR			0x0028
>  #define DISP_REG_OVL_SRC_CON			0x002c
> @@ -62,6 +63,7 @@ struct mtk_disp_ovl_data {
>  	unsigned int gmc_bits;
>  	unsigned int layer_nr;
>  	bool fmt_rgb565_is_0;
> +	bool smi_id_en;
>  };
>  
>  /**
> @@ -134,6 +136,13 @@ void mtk_ovl_start(struct device *dev)
>  {
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
> +	if (ovl->data->smi_id_en) {
> +		unsigned int reg;
> +
> +		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +		reg = reg | OVL_LAYER_SMI_ID_EN;
> +		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +	}
>  	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
>  }
>  
> @@ -142,6 +151,14 @@ void mtk_ovl_stop(struct device *dev)
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
>  	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
> +	if (ovl->data->smi_id_en) {
> +		unsigned int reg;
> +
> +		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +		reg = reg & ~OVL_LAYER_SMI_ID_EN;
> +		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
> +	}
> +
>  }
>  
>  void mtk_ovl_config(struct device *dev, unsigned int w,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
