Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C40308306
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 02:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037786E237;
	Fri, 29 Jan 2021 01:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id A40D96E237
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:12:14 +0000 (UTC)
X-UUID: 31e978336b934c32993cd79d89b40cbf-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jRgri1olxfB7XGX5U4de0POAbLQIhc8HLcK6Dh0pynE=; 
 b=UGB4xBlbP0zTNuGfxBjJulnwTZ/0tBqVr0ZMwsso+dbW5xs/MWSxMeFqcR1nM8QHQbszGhdPl+SpDcPs106Pl4xrgh2b2cBbJbQbMPmbhh/rQcXsLFkFVac/fy4U+rQweEfJaWoJwbdqKixXLBT9cCWMqkOyXSKJBIh2pQsfwxE=;
X-UUID: 31e978336b934c32993cd79d89b40cbf-20210129
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 609630813; Fri, 29 Jan 2021 09:12:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 09:11:56 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 09:11:56 +0800
Message-ID: <1611882716.5226.0.camel@mtksdaap41>
Subject: Re: [PATCH v12 7/8] soc: mediatek: add mtk mutex support for MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 09:11:56 +0800
In-Reply-To: <20210128112314.1304160-8-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-8-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8C09D00ED0E8B0A7F8D62831686DC8DB03401B6946659AA0087AF73F8551023F2000:8
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

On Thu, 2021-01-28 at 19:23 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add mtk mutex support for MT8183 SoC.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index f531b119da7a9..718a41beb6afb 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -14,6 +14,8 @@
>  
>  #define MT2701_MUTEX0_MOD0			0x2c
>  #define MT2701_MUTEX0_SOF0			0x30
> +#define MT8183_MUTEX0_MOD0			0x30
> +#define MT8183_MUTEX0_SOF0			0x2c
>  
>  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> @@ -37,6 +39,18 @@
>  #define MT8167_MUTEX_MOD_DISP_DITHER		15
>  #define MT8167_MUTEX_MOD_DISP_UFOE		16
>  
> +#define MT8183_MUTEX_MOD_DISP_RDMA0		0
> +#define MT8183_MUTEX_MOD_DISP_RDMA1		1
> +#define MT8183_MUTEX_MOD_DISP_OVL0		9
> +#define MT8183_MUTEX_MOD_DISP_OVL0_2L		10
> +#define MT8183_MUTEX_MOD_DISP_OVL1_2L		11
> +#define MT8183_MUTEX_MOD_DISP_WDMA0		12
> +#define MT8183_MUTEX_MOD_DISP_COLOR0		13
> +#define MT8183_MUTEX_MOD_DISP_CCORR0		14
> +#define MT8183_MUTEX_MOD_DISP_AAL0		15
> +#define MT8183_MUTEX_MOD_DISP_GAMMA0		16
> +#define MT8183_MUTEX_MOD_DISP_DITHER0		17
> +
>  #define MT8173_MUTEX_MOD_DISP_OVL0		11
>  #define MT8173_MUTEX_MOD_DISP_OVL1		12
>  #define MT8173_MUTEX_MOD_DISP_RDMA0		13
> @@ -87,6 +101,11 @@
>  #define MT2712_MUTEX_SOF_DSI3			6
>  #define MT8167_MUTEX_SOF_DPI0			2
>  #define MT8167_MUTEX_SOF_DPI1			3
> +#define MT8183_MUTEX_SOF_DSI0			1
> +#define MT8183_MUTEX_SOF_DPI0			2
> +
> +#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
> +#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
>  
>  struct mtk_mutex {
>  	int id;
> @@ -181,6 +200,20 @@ static const unsigned int mt8173_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>  	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
>  };
>  
> +static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_OVL_2L1] = MT8183_MUTEX_MOD_DISP_OVL1_2L,
> +	[DDP_COMPONENT_RDMA0] = MT8183_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MT8183_MUTEX_MOD_DISP_RDMA1,
> +	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
> +};
> +
>  static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>  	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -198,6 +231,13 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>  	[MUTEX_SOF_DPI1] = MT8167_MUTEX_SOF_DPI1,
>  };
>  
> +/* Add EOF setting so overlay hardware can receive frame done irq */
> +static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
> +	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> +};
> +
>  static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
>  	.mutex_sof = mt2712_mutex_sof,
> @@ -227,6 +267,14 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
>  	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
>  };
>  
> +static const struct mtk_mutex_data mt8183_mutex_driver_data = {
> +	.mutex_mod = mt8183_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.no_clk = true,
> +};
> +
>  struct mtk_mutex *mtk_mutex_get(struct device *dev)
>  {
>  	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -457,6 +505,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>  	  .data = &mt8167_mutex_driver_data},
>  	{ .compatible = "mediatek,mt8173-disp-mutex",
>  	  .data = &mt8173_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = &mt8183_mutex_driver_data},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
