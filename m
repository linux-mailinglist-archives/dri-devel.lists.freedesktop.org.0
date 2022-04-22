Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1C050B644
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 13:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120DA10F513;
	Fri, 22 Apr 2022 11:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14B10F513
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 11:37:33 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 12so8684310oix.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0nCOrfzNKhvYlmx3RgltHl48oEpCFD6SLJ8DgS3uoYM=;
 b=LbeUwZubcq+D8Y58jDtmIVxFyrSD9uX6ZR3ZX5jQ3rF7Qb59Y/mwQjJjbWNhYTQUKL
 ILGh7Z7Eo8/CyxnvOrdZYUmkmw2whRPs44EPchxuExQfFv2rHXvmzsf3/6oy6ju22uMS
 cCn6qpt6Q/HcuEhL3b+2WLLYzZJ4pqcImDXp9VmyPIJNxGzLXmcs32G98RwqwdQeunUo
 qTIOH1iYp5kXJIQaqUM5ukSj8wpkPY4SrOnq2XOLayDvFh951rYujuksapJWvW/cFcuw
 0Ohhsnt621V7bIugtIHsOKxB5MbvD6lIwY2A79gD3qoAaJlBI/Zz7Yx3N27Bpfy/AL51
 2v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0nCOrfzNKhvYlmx3RgltHl48oEpCFD6SLJ8DgS3uoYM=;
 b=gsV8VqiLVnmBn63NKdIKXpYpARS+s42ZPjiPGEBfxu4mkZJ4tXelZS6t+oin+fqBSj
 PXnhe5hVViiZUkmkolU0MdhsLBinQRo8KWdgauV/vaqJiI6KYtVNbxgPwzbgq8MH5cpT
 wTG4rKeBFWh4gWTLy/NIOvirEcN3+JVYMICIQwJbFTYJG14OkvnN3DjJpII9jxFERCHB
 GXIlEJX0ORpPmziWopCYcDWR9xTSKc7NLwxPp+rGq6hwV2ClJlNLpO8KbpaUNNqE2fwB
 l4LmPON2pLOCcVgpwQBAUxLcksdr7nm/nZwc3sKd9BbTfxE9O2ozYnTqHbKLdhlCW5gb
 E6vw==
X-Gm-Message-State: AOAM533k60tAqNUAalzqWP+MlEPClhJN/5A4ltqkwZ8CVkk6Ma0JqzfG
 w7XhmhFAifaUerukE7hdAOg=
X-Google-Smtp-Source: ABdhPJxHqu9ZMth9CGSeX/zg/lNzvL96kt+ob/DI19LW4Zlx67zUGyxxgX9YpQoAqgQlerN3uqVDxg==
X-Received: by 2002:a05:6808:169e:b0:2f9:6119:d67f with SMTP id
 bb30-20020a056808169e00b002f96119d67fmr6308084oib.218.1650627452814; 
 Fri, 22 Apr 2022 04:37:32 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 b4-20020aca1b04000000b00322959f5251sm626427oib.26.2022.04.22.04.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 04:37:32 -0700 (PDT)
Message-ID: <eca7f22a-9a04-dd67-aaad-3cf64a909090@gmail.com>
Date: Fri, 22 Apr 2022 13:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 06/21] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-7-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220416020749.29010-7-nancy.lin@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/04/2022 04:07, Nancy.Lin wrote:
> Add cmdq support for mtk-mmsys config API.
> The mmsys config register settings need to take effect with the other
> HW settings(like OVL_ADAPTOR...) at the same vblanking time.
> 
> If we use CPU to write the mmsys reg, we can't guarantee all the
> settings can be written in the same vblanking time.
> Cmdq is used for this purpose. We prepare all the related HW settings
> in one cmdq packet. The first command in the packet is "wait stream done",
> and then following with all the HW settings. After the cmdq packet is
> flush to GCE HW. The GCE waits for the "stream done event" to coming
> and then starts flushing all the HW settings. This can guarantee all
> the settings flush in the same vblanking.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c       | 50 ++++++++++++++++++--------
>   include/linux/soc/mediatek/mtk-mmsys.h | 15 +++++---
>   2 files changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 7b262cefef85..ea04aa2c3840 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -177,6 +177,7 @@ struct mtk_mmsys {
>   	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
>   	struct reset_controller_dev rcdev;
>   	phys_addr_t io_start;
> +	struct cmdq_client_reg cmdq_base;
>   };
>   
>   static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> @@ -280,46 +281,61 @@ static const struct reset_control_ops mtk_mmsys_reset_ops = {
>   	.reset = mtk_mmsys_reset,
>   };
>   
> -static void mtk_mmsys_write_reg(struct device *dev, u32 offset, u32 mask, u32 val)
> +static void mtk_mmsys_write_reg(struct device *dev, u32 offset, u32 mask, u32 val,
> +				struct cmdq_pkt *cmdq_pkt)
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	u32 tmp;
>   
> -	tmp = readl(mmsys->regs + offset);
> -	tmp = (tmp & ~mask) | val;
> -	writel(tmp, mmsys->regs + offset);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	if (cmdq_pkt && mmsys->cmdq_base.size) {
> +		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> +				    mmsys->cmdq_base.offset + offset, val,
> +				    mask);
If we put here:

    return;
}
#endif

> +	} else {
> +#endif
> +		tmp = readl(mmsys->regs + offset);
> +		tmp = (tmp & ~mask) | val;
> +		writel(tmp, mmsys->regs + offset);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	}
> +#endif

Then we can get rid of this IS_REACHABLE. Other then that patch looks good.

Matthias

>   }
>   
> -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width,
> +				  int height, struct cmdq_pkt *cmdq_pkt)
>   {
>   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
> -			    ~0, height << 16 | width);
> +			    ~0, height << 16 | width, cmdq_pkt);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
>   
> -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height)
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height,
> +			   struct cmdq_pkt *cmdq_pkt)
>   {
>   	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> -			    be_height << 16 | be_width);
> +			    be_height << 16 | be_width, cmdq_pkt);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
>   
>   void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
> -			       u8 mode, u32 biwidth)
> +			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt)
>   {
>   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
> -			    alpha << 16 | alpha);
> +			    alpha << 16 | alpha, cmdq_pkt);
>   	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
> -			    alpha_sel << (19 + idx));
> +			    alpha_sel << (19 + idx), cmdq_pkt);
>   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
> -			    GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
> +			    GENMASK(31, 16) | GENMASK(1, 0),
> +			    biwidth << 16 | mode, cmdq_pkt);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
>   
> -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
> +				     struct cmdq_pkt *cmdq_pkt)
>   {
>   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4, BIT(4),
> -			    channel_swap << 4);
> +			    channel_swap << 4, cmdq_pkt);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
>   
> @@ -377,6 +393,12 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		mmsys->data = match_data->drv_data[0];
>   	}
>   
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> +	if (ret)
> +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> +#endif
> +
>   	platform_set_drvdata(pdev, mmsys);
>   
>   	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index fe620929b0f9..7a73305390ba 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -6,6 +6,10 @@
>   #ifndef __MTK_MMSYS_H
>   #define __MTK_MMSYS_H
>   
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
>   enum mtk_ddp_comp_id;
>   struct device;
>   
> @@ -73,13 +77,16 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   			      enum mtk_ddp_comp_id cur,
>   			      enum mtk_ddp_comp_id next);
>   
> -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width,
> +				  int height, struct cmdq_pkt *cmdq_pkt);
>   
> -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height);
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height,
> +			   struct cmdq_pkt *cmdq_pkt);
>   
>   void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
> -			       u8 mode, u32 biwidth);
> +			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt);
>   
> -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
> +				     struct cmdq_pkt *cmdq_pkt);
>   
>   #endif /* __MTK_MMSYS_H */
