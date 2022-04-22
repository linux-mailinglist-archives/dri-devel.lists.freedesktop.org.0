Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C73E50B74F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A61910F7AE;
	Fri, 22 Apr 2022 12:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7234610F776
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:29:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m14so10849565wrb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W+ioSkaharFsWATl5ToKiVm/fex4rn+pvucUyRDJEo0=;
 b=E8+9t68D/GFMv6HXdr09GBuznHgBTDEJ+Qd0KcHUkCVIRLD/DBxNLYFuiR89aeH/bg
 YdkxUm/dn4Q3o3yXa6bq4gCucE/+2lPLJKJq+5mJm5yEemr7uOAdbKlY97VoWwAfwuDS
 RPeEyoGU+J2+MVJAQnqamzRaQmMP3SYo0ajN16gu62lO1LriXvyBqXmZkdrijW5S04S3
 hPsqhcyiZGFFz4wdpjVvnuJR0yhOmrFpFzDQOhNjxraY9y1srYqlKZVbxt86lxDEjoyb
 IYpe1H5EKoGRxH4r4Bffb9t1aRFWIljzHs3sToz4H/Qkw5BGUqPyaBlNejdMKa27xb9N
 2ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W+ioSkaharFsWATl5ToKiVm/fex4rn+pvucUyRDJEo0=;
 b=3UGjfk1ZWcYWwRQE6A5XZ1ykExdu5z3PC8hG1z2jbil5E6Cf55weNHhl728PFu6/fx
 K2N/zJy9nA8RWqo6bC5H1kUpnVKj1EQBUGO6kNGFvU+8FuR5Y0JHQs3Dd8PwHEsv0cec
 AgXhy8/KfJuArKLEtgAAwJY37Y04sWmx3DEv6zvX4ZoZIvOgF1rOO35cjr8YZe/8CQRG
 o2D1u5HpLOh5pDYuewa+h2ptGpUaP/l8RA27h+f+67aPUKMoT+rkiFU8MFom9uh4nqHU
 ioojzLAehNYdkMKW/te1nG4sHvFeKfOvHYCQEME27nXNehvlLx85xYATHQLOXYECY6NB
 hH6w==
X-Gm-Message-State: AOAM533B44i2awcXHkH0cFGhTwSrHS9EHWClMBPsYXV0I8LLy7AfXdXc
 YyYLpb81uz6C9Ftum5I4LUM=
X-Google-Smtp-Source: ABdhPJw+Lm/gNHDzclW2yhCZRGa/QUBfgCinnieYq1G3go2IbmGkpYzOmruc36DYxc5ujH59hMTeQw==
X-Received: by 2002:a5d:64e4:0:b0:20a:91e4:c0f9 with SMTP id
 g4-20020a5d64e4000000b0020a91e4c0f9mr3403976wri.55.1650630591821; 
 Fri, 22 Apr 2022 05:29:51 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 az30-20020a05600c601e00b0038ebd950caesm1594444wmb.30.2022.04.22.05.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:29:51 -0700 (PDT)
Message-ID: <960a5d23-3c33-1b01-1e3e-99d632120f88@gmail.com>
Date: Fri, 22 Apr 2022 14:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v20 2/8] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-3-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419094143.9561-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/2022 11:41, jason-jh.lin wrote:
> Add mtk-mutex support for mt8195 vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Fei Shao <fshao@chromium.org>

Applied thanks!

Matthias

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 87 ++++++++++++++++++++++++++++++--
>   1 file changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index aaf8fc1abb43..729ee88035ed 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,6 +17,9 @@
>   #define MT8183_MUTEX0_MOD0			0x30
>   #define MT8183_MUTEX0_SOF0			0x2c
>   
> +#define MT8195_DISP_MUTEX0_MOD0			0x30
> +#define MT8195_DISP_MUTEX0_SOF			0x2c
> +
>   #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>   #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>   #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
> @@ -96,6 +99,20 @@
>   #define MT8173_MUTEX_MOD_DISP_PWM1		24
>   #define MT8173_MUTEX_MOD_DISP_OD		25
>   
> +#define MT8195_MUTEX_MOD_DISP_OVL0		0
> +#define MT8195_MUTEX_MOD_DISP_WDMA0		1
> +#define MT8195_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8195_MUTEX_MOD_DISP_COLOR0		3
> +#define MT8195_MUTEX_MOD_DISP_CCORR0		4
> +#define MT8195_MUTEX_MOD_DISP_AAL0		5
> +#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
> +#define MT8195_MUTEX_MOD_DISP_DITHER0		7
> +#define MT8195_MUTEX_MOD_DISP_DSI0		8
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
> +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
> +#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
> +#define MT8195_MUTEX_MOD_DISP_PWM0		27
> +
>   #define MT2712_MUTEX_MOD_DISP_PWM2		10
>   #define MT2712_MUTEX_MOD_DISP_OVL0		11
>   #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -132,9 +149,21 @@
>   #define MT8167_MUTEX_SOF_DPI1			3
>   #define MT8183_MUTEX_SOF_DSI0			1
>   #define MT8183_MUTEX_SOF_DPI0			2
> +#define MT8195_MUTEX_SOF_DSI0			1
> +#define MT8195_MUTEX_SOF_DSI1			2
> +#define MT8195_MUTEX_SOF_DP_INTF0		3
> +#define MT8195_MUTEX_SOF_DP_INTF1		4
> +#define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
> +#define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
>   
>   #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
>   #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
> +#define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
> +#define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
> +#define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
> +#define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_INTF1 << 7)
> +#define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_SOF_DPI0 << 7)
> +#define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
>   
>   struct mtk_mutex {
>   	int id;
> @@ -149,6 +178,9 @@ enum mtk_mutex_sof_id {
>   	MUTEX_SOF_DPI1,
>   	MUTEX_SOF_DSI2,
>   	MUTEX_SOF_DSI3,
> +	MUTEX_SOF_DP_INTF0,
> +	MUTEX_SOF_DP_INTF1,
> +	DDP_MUTEX_SOF_MAX,
>   };
>   
>   struct mtk_mutex_data {
> @@ -270,7 +302,23 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
>   };
>   
> -static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
> +	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_COLOR0] = MT8195_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
> +	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
> +	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
> +	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
> +	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
> +};
> +
> +static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>   	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>   	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>   	[MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
> @@ -280,7 +328,7 @@ static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   	[MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
>   };
>   
> -static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>   	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>   	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>   	[MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
> @@ -288,7 +336,7 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   };
>   
>   /* Add EOF setting so overlay hardware can receive frame done irq */
> -static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>   	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>   	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
>   	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
> @@ -300,6 +348,26 @@ static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   	[MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 | MT8186_MUTEX_EOF_DPI0,
>   };
>   
> +/*
> + * To support refresh mode(video mode), DISP_REG_MUTEX_SOF should
> + * select the EOF source and configure the EOF plus timing from the
> + * module that provides the timing signal.
> + * So that MUTEX can not only send a STREAM_DONE event to GCE
> + * but also detect the error at end of frame(EAEOF) when EOF signal
> + * arrives.
> + */
> +static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI0,
> +	[MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 | MT8195_MUTEX_EOF_DSI1,
> +	[MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 | MT8195_MUTEX_EOF_DPI0,
> +	[MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 | MT8195_MUTEX_EOF_DPI1,
> +	[MUTEX_SOF_DP_INTF0] =
> +		MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
> +	[MUTEX_SOF_DP_INTF1] =
> +		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
> +};
> +
>   static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>   	.mutex_mod = mt2701_mutex_mod,
>   	.mutex_sof = mt2712_mutex_sof,
> @@ -351,6 +419,13 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
>   	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>   };
>   
> +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
> +	.mutex_mod = mt8195_mutex_mod,
> +	.mutex_sof = mt8195_mutex_sof,
> +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
> +};
> +
>   struct mtk_mutex *mtk_mutex_get(struct device *dev)
>   {
>   	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -423,6 +498,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>   	case DDP_COMPONENT_DPI1:
>   		sof_id = MUTEX_SOF_DPI1;
>   		break;
> +	case DDP_COMPONENT_DP_INTF0:
> +		sof_id = MUTEX_SOF_DP_INTF0;
> +		break;
>   	default:
>   		if (mtx->data->mutex_mod[id] < 32) {
>   			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> @@ -462,6 +540,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>   	case DDP_COMPONENT_DSI3:
>   	case DDP_COMPONENT_DPI0:
>   	case DDP_COMPONENT_DPI1:
> +	case DDP_COMPONENT_DP_INTF0:
>   		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
>   			       mtx->regs +
>   			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
> @@ -587,6 +666,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>   	  .data = &mt8186_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = &mt8192_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8195-disp-mutex",
> +	  .data = &mt8195_mutex_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
