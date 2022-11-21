Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D43632C18
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 19:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CC010E32E;
	Mon, 21 Nov 2022 18:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB88B10E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 18:26:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso13419652wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XYY1WGUlFu3LHEknIjWYzHC9m3GxRypTmJeMZynpmoc=;
 b=BMpPUpy1dbUannUvVn81D+zgHMQqJrxbhFO0RaRdh0Sr2YdIiA8qWiPQId/7e86XyE
 UKKUu8FAasA4QhntkdxzK6hhIhw2Kyqdm1ZJxNmD6FLO3b+MiBmFfhiPmmRSr+f6PU2f
 U96ThI8i28vUX0MA1CYwx1GN1Rx7gHILRlCGpDLmSZYh4q1avVqgRxj7HITGxyOb99LI
 aw0mYNug5f9Z8SKZ27Q7XEdzI+xIiJlm9oOprr7CHODuhS5UdqbgS0as/Qrjda6m/Fxc
 Lo83yKRtFrFkCXhVWnr0wxarEA1dXcPtxNAgS0WmPCitqVYJjqv+DJ1dVG00vmQ6oJUW
 RDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XYY1WGUlFu3LHEknIjWYzHC9m3GxRypTmJeMZynpmoc=;
 b=xMsEl0XV2ZCPlR3I8qlZOJHGFoN+U09XVXd+0cMywcEw4OY9zm6kCj6tl8lWqklHTN
 TRERJeHySp7sKC2xyene3SnNPjPAX/LIENWOF9sbUmLJYroKxSHf3cLYjn8VxHp7yqNE
 T4UQQZr0nLY9jsFyuC/QohdW7Hx04jGg8XVKkBVVBTTNzMdPEmo1hQvT8BcOWoTLtJHu
 +BvqYm5niVCAD+ILsZyv+CZr7/pQuP9NXGAa3u5bKkoJHAK+B1jb3yOnvN14VheVouCP
 pdeQtilKaUP4P+f7Ro9YyVLstafJLYfpZIpPqMXUw01cpZYDMjAVuixnVNDTlaYXPdgA
 CUbA==
X-Gm-Message-State: ANoB5pk/ZAVlUTuUdTqPqWQCi+46ULVDtrlQtbGFir1LShfthzY1HPqi
 qCtJtKkbwh5PKjQadaarBtA=
X-Google-Smtp-Source: AA0mqf6yCGhkec2FBMPTt/xEGxj7cTO8UY/s4IB/NjHb8m/jA+PTdyj33+oFLraPa4pI+obZxpLhXA==
X-Received: by 2002:a05:600c:4f93:b0:3cf:a616:ccc0 with SMTP id
 n19-20020a05600c4f9300b003cfa616ccc0mr17700691wmq.73.1669055188375; 
 Mon, 21 Nov 2022 10:26:28 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 j39-20020a05600c1c2700b003cf57329221sm20867065wms.14.2022.11.21.10.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 10:26:26 -0800 (PST)
Message-ID: <d7afdf50-0e8c-4954-d3f8-1d8890e70a24@gmail.com>
Date: Mon, 21 Nov 2022 19:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v13,2/3] drm: mediatek: Set dpi format in mmsys
Content-Language: en-US
To: xinlei.lee@mediatek.com, rex-bc.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nfraprado@collabora.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
References: <1666577099-3859-1-git-send-email-xinlei.lee@mediatek.com>
 <1666577099-3859-3-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1666577099-3859-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/10/2022 04:04, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

I realized that I took this patch by error. I'll drop it from my tree now.

Regards,
Matthias

> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..ad87ecddf58d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,6 +15,7 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/types.h>
>   
>   #include <video/videomode.h>
> @@ -30,6 +31,7 @@
>   #include "mtk_disp_drv.h"
>   #include "mtk_dpi_regs.h"
>   #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>   
>   enum mtk_dpi_out_bit_num {
>   	MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -67,6 +69,7 @@ struct mtk_dpi {
>   	struct drm_connector *connector;
>   	void __iomem *regs;
>   	struct device *dev;
> +	struct device *mmsys_dev;
>   	struct clk *engine_clk;
>   	struct clk *pixel_clk;
>   	struct clk *tvd_clk;
> @@ -135,6 +138,7 @@ struct mtk_dpi_yc_limit {
>    * @yuv422_en_bit: Enable bit of yuv422.
>    * @csc_enable_bit: Enable bit of CSC.
>    * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
>    */
>   struct mtk_dpi_conf {
>   	unsigned int (*cal_factor)(int clock);
> @@ -153,6 +157,7 @@ struct mtk_dpi_conf {
>   	u32 yuv422_en_bit;
>   	u32 csc_enable_bit;
>   	u32 pixels_per_iter;
> +	bool edge_cfg_in_mmsys;
>   };
>   
>   static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
> @@ -449,8 +454,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
>   		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
>   			     dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE ?
>   			     EDGE_SEL : 0, EDGE_SEL);
> +		if (dpi->conf->edge_cfg_in_mmsys)
> +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_DDR_CON);
>   	} else {
>   		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE, 0);
> +		if (dpi->conf->edge_cfg_in_mmsys)
> +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_SDR_CON);
>   	}
>   }
>   
> @@ -778,8 +787,10 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   {
>   	struct mtk_dpi *dpi = dev_get_drvdata(dev);
>   	struct drm_device *drm_dev = data;
> +	struct mtk_drm_private *priv = drm_dev->dev_private;
>   	int ret;
>   
> +	dpi->mmsys_dev = priv->mmsys_dev;
>   	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
>   				      DRM_MODE_ENCODER_TMDS);
>   	if (ret) {
