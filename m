Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A10621AFE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A530910E4D3;
	Tue,  8 Nov 2022 17:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B0D10E4D3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:46:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w14so22138236wru.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 09:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCAW19E5l681mF+R72oFht/CQ2wMh6AzLr3NL86vzHU=;
 b=KTzmBk0JE13err2vSnXrAVtcQ2rrmE9bBZw+gTbDrZaw1ZzmWcNDqIUhdizIQPUY0+
 01GwSZa+t7UD/xjc4ZcdcUKdd+6rE57pOaEEe7IwMe0sDKjs7LuKZNHgfEBjHQD479bp
 CWxHXfzO4cGP8hQtsTxMSk0npAaqN3ZJdUoY7heJBXk2/OgquAvBHVPX+TLCcx6mOtzc
 KVmLyXcOCRGJF0v7c08dE1A5tH5g35g+qXdKSYVrBJNgHB0Vu8eOEx4hqXSrb+SYzPFf
 8UuAKeRynC02FfwxxhK9D27/GX9FI45AJp6rCyD7j1Sfocv6icDNwsdFi87SDJ4bpccR
 /Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eCAW19E5l681mF+R72oFht/CQ2wMh6AzLr3NL86vzHU=;
 b=jBJMPeiixxRH/xOtqQ/BEu2wVCDQsPFLX2ZWN+e81nrHm41BOXZqnHoCGnwcqWr7KP
 UYGVBGVpsWnuh2kC0SBijvCVyHIQBRObhO9jFoY/uYvc/UfHGxTS9m83LstFJU8BVfdV
 BLpccbaqHQ+2CP8ICwQrM+HUjwesiNlIZ7sUP/boES2mAxpVV4AHcf/SrRqvZ0AtjG90
 758GzstcrRG34UzA/Ml43jrevnJ6dva+Na5bL7sxVICgN5xDni6GbF25MFdZvVKqJQpO
 Ki682p2a6Lk3O8BIrhYscjCbfDUFcRP9vrd+IXFb/EKq9yCYdRxyQGnqPhS6Jbr6rslc
 XH4Q==
X-Gm-Message-State: ACrzQf0FMBo1t6/FzvrWqEtcJzy47DMyGPFpSAP3DZYrxZ/bLETIMf3Q
 W0irYHQPMGOkgS9pcc7z/h4=
X-Google-Smtp-Source: AMsMyM7wysQrxo4qkni3Qar3s+rAjvxOzJif1WlMKCVrxnJjxUAX/BfYxsSJWY/0BdqiVCNkMtPmBA==
X-Received: by 2002:a5d:5942:0:b0:225:7425:4e39 with SMTP id
 e2-20020a5d5942000000b0022574254e39mr35607783wri.566.1667929614298; 
 Tue, 08 Nov 2022 09:46:54 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a7bc381000000b003c6b874a0dfsm13993940wmj.14.2022.11.08.09.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 09:46:53 -0800 (PST)
Message-ID: <32ae4104-673b-1b34-5efb-dc1317e80530@gmail.com>
Date: Tue, 8 Nov 2022 18:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-7-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v28 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
In-Reply-To: <20221107072243.15748-7-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/11/2022 08:22, Nancy.Lin wrote:
> Add four mmsys config APIs. The config APIs are used for config
> mmsys reg. Some mmsys regs need to be set according to the
> HW engine binding to the mmsys simultaneously.
> 
> 1. mtk_mmsys_merge_async_config: config merge async width/height.
>     async is used for cross-clock domain synchronization.
> 2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
> 3. mtk_mmsys_mixer_in_config and mtk_mmsys_mixer_in_config:
>     config mixer related settings.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Not something we need to fix in this series, but it would make sense instead of 
adding all the EXPORTS to pass the functions as callbacks in the 
platform_device_register_data. But I realize you don't pass the VDOSYS number to 
the DRM driver to distinguish between the different MMSYS devices that created 
the platform device. I hadn't had a deep look on the DRM implementation but I 
suppose it will be challenge...

Regards,
Matthias

> ---
>   drivers/soc/mediatek/mt8195-mmsys.h    |  6 +++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 35 ++++++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h |  9 +++++++
>   3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index fd7b455bd675..454944a9409c 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -75,6 +75,12 @@
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
>   
> +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD				0xe30
> +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD				0xe70
> +#define MT8195_VDO1_HDR_TOP_CFG					0xd00
> +#define MT8195_VDO1_MIXER_IN1_ALPHA				0xd30
> +#define MT8195_VDO1_MIXER_IN1_PAD				0xd40
> +
>   #define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
>   #define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			1
>   
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 73c8bd27e6ae..6040a3cff6f8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -137,6 +137,41 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
> +			      ~0, height << 16 | width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
> +
> +void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> +			      be_height << 16 | be_width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_config);
> +
> +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
> +			       u8 mode, u32 biwidth)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +
> +	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
> +			      alpha << 16 | alpha);
> +	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
> +			      alpha_sel << (19 + idx));
> +	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
> +			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
> +
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
> +			      BIT(4), channel_swap << 4);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
> +
>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>   {
>   	if (val)
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 127f1b888ace..a4708859c188 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -75,4 +75,13 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   
>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
>   
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
> +
> +void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height);
> +
> +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
> +			       u8 mode, u32 biwidth);
> +
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
> +
>   #endif /* __MTK_MMSYS_H */
