Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52830871C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B97E6EAA2;
	Fri, 29 Jan 2021 08:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2A986EAA2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 08:42:59 +0000 (UTC)
X-UUID: fc38f4baa7624c2d80587c5736dbe2f3-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/3q0mlOu7gJgzrpK4SZhxTaGZhiKC2GOEb6iu7kvGeI=; 
 b=niCTxVpwcBk5LmbVz8HTpPina/b7P6pyf3Vc0XqxqyChdGDfwtFFLBFVEPrZNtXaSNCSa5yXfNiDChngpFWoGsWITcBw+OdUc8Otlvy3b1WmqEFsMCeh+udaJFD2LfrPwUUmOWrJp5FkX2vJNgT/Qo4jBSBpjCzfdA6ZyUJ7CwI=;
X-UUID: fc38f4baa7624c2d80587c5736dbe2f3-20210129
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1702934999; Fri, 29 Jan 2021 16:42:54 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 16:42:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:42:51 +0800
Message-ID: <1611909770.31184.12.camel@mtksdaap41>
Subject: Re: [PATCH v4 7/8] soc: mediatek: add mtk mutex support for MT8192
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 16:42:50 +0800
In-Reply-To: <20210129073436.2429834-8-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-8-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B39B3CC9B666C24300CC1958077EE6675F149E906B4AEB7FCECA4F46F3A9BF782000:8
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
> Add mtk mutex support for MT8192 SoC.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 718a41beb6afb..dfd9806d5a001 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -39,6 +39,18 @@
>  #define MT8167_MUTEX_MOD_DISP_DITHER		15
>  #define MT8167_MUTEX_MOD_DISP_UFOE		16
>  
> +#define MT8192_MUTEX_MOD_DISP_OVL0		0
> +#define MT8192_MUTEX_MOD_DISP_OVL0_2L		1
> +#define MT8192_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8192_MUTEX_MOD_DISP_COLOR0		4
> +#define MT8192_MUTEX_MOD_DISP_CCORR0		5
> +#define MT8192_MUTEX_MOD_DISP_AAL0		6
> +#define MT8192_MUTEX_MOD_DISP_GAMMA0		7
> +#define MT8192_MUTEX_MOD_DISP_POSTMASK0		8
> +#define MT8192_MUTEX_MOD_DISP_DITHER0		9
> +#define MT8192_MUTEX_MOD_DISP_OVL2_2L		16
> +#define MT8192_MUTEX_MOD_DISP_RDMA4		17
> +
>  #define MT8183_MUTEX_MOD_DISP_RDMA0		0
>  #define MT8183_MUTEX_MOD_DISP_RDMA1		1
>  #define MT8183_MUTEX_MOD_DISP_OVL0		9
> @@ -214,6 +226,20 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>  };
>  
> +static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
> +	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8192_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_OVL_2L2] = MT8192_MUTEX_MOD_DISP_OVL2_2L,
> +	[DDP_COMPONENT_RDMA0] = MT8192_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -275,6 +301,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>  	.no_clk = true,
>  };
>  
> +static const struct mtk_mutex_data mt8192_mutex_driver_data = {
> +	.mutex_mod = mt8192_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -507,6 +540,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  	  .data = &mt8173_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8183-disp-mutex",
>  	  .data = &mt8183_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-mutex",
> +	  .data = &mt8192_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
