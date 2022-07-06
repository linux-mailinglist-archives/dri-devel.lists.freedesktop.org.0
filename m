Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2493A568B12
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0413A10E43C;
	Wed,  6 Jul 2022 14:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222F310E3DE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:20:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f2so16926985wrr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FSq8WqfHcF8s8rYhY1PS7CBcA+fw5f2mGHNNEiY73pY=;
 b=XhWdtJ8rpY9y7CQyOSXtpCPpTCnYrUYSXQ0jeWL1/I3o8K1eoLiXBrx5ZpHJD6TRJP
 TESsbkDpysXiE6s6LleuwAV9UoOqJAzWL1xZX/8Co9EWLPIzpz0rG6Hw9/bUtZJ92cOG
 5G85XMElRJaMaR6cIVRGMWIJ19YDutxp3OVzZV6lO4YaXq3tiDkrn5+eiqIpu235YGHV
 OiUi6ZLVf/44ItPzGuyaA3vMcwTTVUQxi/texvIWRs0mfJ7rAeBaOvzYEgtxShXBeCMg
 rkWob8AKrLB7n02jNd8hgBJQ9Cb9d0zRIDyJQBmqZ4IS9G8P/UEoLDKZGPbR9ldBmNc5
 6F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FSq8WqfHcF8s8rYhY1PS7CBcA+fw5f2mGHNNEiY73pY=;
 b=jaTJ8iJxoM8V6A6niW30+DGeTCMCjaj/1cQgU5EizuaLvWpX57gC1SyYBoT3TptATx
 VF1vq2JjFQnt/3GQXAHX4utyYqK3mi51ZkUgoLL1ifckLyz8Bf6aXq2foXjTJ2Fk5ntH
 Y5jyTrPxXaPJqu3Sd2ikIDjdj96yxE3EAyxApe7REH6TML6yvoSqbyMx11A4MM+Oohor
 TaWXdOdm7sSnCbPvc7WRm3VgoDtVbmK0Oj9ZZHt0gAjd5E/CL3CRnWzayhoS81a+j053
 qGeo1eNUGMljg2hzD//wr+7yfiyKveKpH28MIS0+3SQI5W1w/0IM/wrVHHaoulsXgNYS
 DmCw==
X-Gm-Message-State: AJIora9VglxXKyEWrr5rzA4dGWqkkVJHXvHRzQxyG0B8M/uey5ihN6XJ
 zqBT4Bq/Fl19dUTu4+7vssI=
X-Google-Smtp-Source: AGRyM1sZXnl/+u5Hd68LiJOgcVcmcBljAIltD5f9WGcN6SPMvlCo3uIgoQrwv5vNdv+1a30cduT9OA==
X-Received: by 2002:adf:d1eb:0:b0:21b:dbb5:fe05 with SMTP id
 g11-20020adfd1eb000000b0021bdbb5fe05mr38073330wrd.651.1657117208600; 
 Wed, 06 Jul 2022 07:20:08 -0700 (PDT)
Received: from [192.168.0.14] ([37.223.147.254])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b003a02f957245sm22279041wmq.26.2022.07.06.07.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 07:20:07 -0700 (PDT)
Message-ID: <65d390ab-7f80-8bd4-66f5-442c46da4f00@gmail.com>
Date: Wed, 6 Jul 2022 16:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] soc: mediatek: Add mmsys func to adapt to dpi output
 for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, yongqiang.niu@mediatek.com,
 enric.balletbo@collabora.com
References: <1656645344-12062-1-git-send-email-xinlei.lee@mediatek.com>
 <1656645344-12062-2-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1656645344-12062-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01/07/2022 05:15, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
>   drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h | 2 ++
>   3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..0b450b00b829 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,7 @@
>   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>   #define __SOC_MEDIATEK_MT8186_MMSYS_H
>   
> +#define MT8186_MMSYS_DUMMY0			0X400

I don't have access to the datasheet, but I really wonder if it's really called 
dummy0. If so, you would need to explain in more detail in the commit message.

Regards,
Matthias

>   #define MT8186_MMSYS_OVL_CON			0xF04
>   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>   #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 2b0b805c65dd..de3f11cb931f 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,
> +			       struct cmdq_pkt *cmdq_pkt)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DUMMY0, mask,
> +			      val, cmdq_pkt);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_confing);
> +
>   void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height,
>   				  struct cmdq_pkt *cmdq_pkt)
>   {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 343e093f0fc3..40c538c0664b 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -90,4 +90,6 @@ void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16
>   void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
>   				     struct cmdq_pkt *cmdq_pkt);
>   
> +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,
> +			       struct cmdq_pkt *cmdq_pkt);
>   #endif /* __MTK_MMSYS_H */
