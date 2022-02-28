Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95B4C6A2D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05A510E4AE;
	Mon, 28 Feb 2022 11:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1A10E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 11:20:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j22so14809978wrb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MoqXCrJg3FY5CyNEkzIu5eC58ZaGl5n8bC8jmpeJlj8=;
 b=FyuT0k2QO86ah+RmKSzI/isSjeqpW7xGr6zxcpCq4SwIfK7eCtR13OFIrxNSYJmFeN
 KF+F7+psJIIACctoZBx3EbzuyZ5SpjXoQfxfqaj+GzelviMYW/cEWnf6Bow0k2Wmf6O6
 ZCQFm7B9IK5d7g/ql3tFsXwKOvRSLeNn+Gk88b6hEvBAEJhgBwXY64Z62BSgLrTraZ07
 lPQMLSqHEgyY+6TpAiPOTu+N+OjJHFxYzUzICzDrWj50eGNKtYX9PxJVDyH4wPxXwEPE
 Ez3Xfq9J+bNt61ZtEGIQB6BxOOOmFjmrays/Z8FR1W93/JJRBlTwNjUZbAaYKySu1LeL
 nT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MoqXCrJg3FY5CyNEkzIu5eC58ZaGl5n8bC8jmpeJlj8=;
 b=eutk6VmhppT52Xss3cPOfH9LSlflecEsE2LCzZcC6HwoDFb7Q8i7BOPpg38u7cAqsv
 /SNBogT6oH60klsi/+B/IWm+UDAr1/r6io7Xck3T9SkOX8Qb61MpvGVzZ548fxNoBIMK
 7oA4R0uM+RFKeGi77DR5p3BwZLWtI1oVW1Xv/17H5sz/ThS6WcTWhiPedrJE+e60xcKo
 MNYFgtv7zCtm4VTfExdZVgUaYwG3f/hCSn/OaNe5XJ/L9YHUi9R09AXXNexasNWUvy69
 yfEiP3GuLIM0jiTUTKeAVvkryKs0hGyO7bXDT80o7CQsF9BSJ9PUhJDdrwK7Oan3esiY
 KKhw==
X-Gm-Message-State: AOAM533G4sNsZSM4ktuQ+U5VTR9YpJOrc6wyHUjUuPHhdiNS8LewHnFZ
 WZoRfgDq2ZXnrPnCIMgFsiw=
X-Google-Smtp-Source: ABdhPJwwcBG0C/g7mhI1zvwUfnOe166OBNWb0eW8Wle7rirDLnuIAWgQqROaieMMuczXW69zCFzWJA==
X-Received: by 2002:adf:e54e:0:b0:1ea:9746:16d5 with SMTP id
 z14-20020adfe54e000000b001ea974616d5mr15367520wrm.186.1646047236276; 
 Mon, 28 Feb 2022 03:20:36 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm15933873wmq.17.2022.02.28.03.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 03:20:35 -0800 (PST)
Message-ID: <9d1f87ea-7db5-f22d-7f4b-8f8eb2b9985d@gmail.com>
Date: Mon, 28 Feb 2022 12:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4,4/5] soc: mediatek: add MTK mutex support for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-5-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220222052803.3570-5-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/02/2022 06:28, Rex-BC Chen wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add MTK mutex support for MT8186 SoC.
> We need MTK mutex to control timing of display modules and there
> are two display pipelines for MT8186 including internal and external
> display.
> 
> MTK mutex for internal display:
> - Timing source: DSI
> - Control modules: OVL0/RDMA0/COLOR0/CCORR/AAL0/GAMMA/POSTMASK0/DITHER
> 
> MTK mutex for external display:
> - Timing source : DPI
> - Control modules: OVL_2L0/RDMA1
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

applied thanks

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 45 ++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2ca55bb5a8be..aaf8fc1abb43 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -26,6 +26,23 @@
>   
>   #define INT_MUTEX				BIT(1)
>   
> +#define MT8186_MUTEX_MOD_DISP_OVL0		0
> +#define MT8186_MUTEX_MOD_DISP_OVL0_2L		1
> +#define MT8186_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8186_MUTEX_MOD_DISP_COLOR0		4
> +#define MT8186_MUTEX_MOD_DISP_CCORR0		5
> +#define MT8186_MUTEX_MOD_DISP_AAL0		7
> +#define MT8186_MUTEX_MOD_DISP_GAMMA0		8
> +#define MT8186_MUTEX_MOD_DISP_POSTMASK0		9
> +#define MT8186_MUTEX_MOD_DISP_DITHER0		10
> +#define MT8186_MUTEX_MOD_DISP_RDMA1		17
> +
> +#define MT8186_MUTEX_SOF_SINGLE_MODE		0
> +#define MT8186_MUTEX_SOF_DSI0			1
> +#define MT8186_MUTEX_SOF_DPI0			2
> +#define MT8186_MUTEX_EOF_DSI0			(MT8186_MUTEX_SOF_DSI0 << 6)
> +#define MT8186_MUTEX_EOF_DPI0			(MT8186_MUTEX_SOF_DPI0 << 6)
> +
>   #define MT8167_MUTEX_MOD_DISP_PWM		1
>   #define MT8167_MUTEX_MOD_DISP_OVL0		6
>   #define MT8167_MUTEX_MOD_DISP_OVL1		7
> @@ -226,6 +243,19 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>   };
>   
> +static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> +	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
> +	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
> +	[DDP_COMPONENT_COLOR0] = MT8186_MUTEX_MOD_DISP_COLOR0,
> +	[DDP_COMPONENT_DITHER] = MT8186_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_GAMMA] = MT8186_MUTEX_MOD_DISP_GAMMA0,
> +	[DDP_COMPONENT_OVL0] = MT8186_MUTEX_MOD_DISP_OVL0,
> +	[DDP_COMPONENT_OVL_2L0] = MT8186_MUTEX_MOD_DISP_OVL0_2L,
> +	[DDP_COMPONENT_POSTMASK0] = MT8186_MUTEX_MOD_DISP_POSTMASK0,
> +	[DDP_COMPONENT_RDMA0] = MT8186_MUTEX_MOD_DISP_RDMA0,
> +	[DDP_COMPONENT_RDMA1] = MT8186_MUTEX_MOD_DISP_RDMA1,
> +};
> +
>   static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
>   	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
> @@ -264,6 +294,12 @@ static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
>   };
>   
> +static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> +	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[MUTEX_SOF_DSI0] = MT8186_MUTEX_SOF_DSI0 | MT8186_MUTEX_EOF_DSI0,
> +	[MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 | MT8186_MUTEX_EOF_DPI0,
> +};
> +
>   static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>   	.mutex_mod = mt2701_mutex_mod,
>   	.mutex_sof = mt2712_mutex_sof,
> @@ -301,6 +337,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>   	.no_clk = true,
>   };
>   
> +static const struct mtk_mutex_data mt8186_mutex_driver_data = {
> +	.mutex_mod = mt8186_mutex_mod,
> +	.mutex_sof = mt8186_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +};
> +
>   static const struct mtk_mutex_data mt8192_mutex_driver_data = {
>   	.mutex_mod = mt8192_mutex_mod,
>   	.mutex_sof = mt8183_mutex_sof,
> @@ -540,6 +583,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>   	  .data = &mt8173_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8183-disp-mutex",
>   	  .data = &mt8183_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8186-disp-mutex",
> +	  .data = &mt8186_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8192-disp-mutex",
>   	  .data = &mt8192_mutex_driver_data},
>   	{},
