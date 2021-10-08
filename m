Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11C94268AD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 13:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDB16F46A;
	Fri,  8 Oct 2021 11:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9667E6F46A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 11:27:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k7so28636426wrd.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tLi89EnDPjR+G+5RZAaz/qdjvJ+j6uhtWnhwzVW71cE=;
 b=PIgIYvyiO7MafYMnWpo0WxprZr99rhBFPMNQhs5AwDzC/wCtL50WyZfh6AEc+c2izj
 KiU+/Yubs9ACeyRpTzAMT11XsHVu/KvttB5RIzycwJCslNgUri5qWLir7euF+CmtrQQz
 ioU9yChMm+sAq/xSkb7Su0cIFBLHEmdJl9tGp7xtoq6lHlN7k8Em4ibapqXwmtt5M7g5
 V4Tm6q276qEMZHaZKofTss89/+ytxexejyHWlc+psoaBUiTzh30/ahft8QqnIcHzSsJ0
 vSvQa1sGGDUh6Zi8gmSREgJy/QO5hnxQbVeXQAAiNhatQKXI37wYxa12wER1C7W5dCh0
 034A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tLi89EnDPjR+G+5RZAaz/qdjvJ+j6uhtWnhwzVW71cE=;
 b=kR0QyDTu0TioPG5pd3XRpgrORV9USMBfxCbWDN69IIjAyxi+GSfmR3MMJEkPnp0ij6
 VBLBxp2Y2zaumY8j70//KsHIPj/9efflga0NkSwJ7ikSmZAZ72QB59rUcNFL5dAoWmMp
 K2yqFc1kt3KfhMLbDxCCkgtnG9N76FuFqKvlLa1NKqP6B+Y+cgkUaCYxUszaPy6FGJcD
 iqlLImNzakAiawYUZdGuAQ1uhjtD4L01XQURNe8gTHTbjfqll/nIIMN+bwmSw32mqiuw
 l+n7jI7fzuvM5tSd9i3Qe6ojBoi8/tn3Uf+plf2lmg2TB3hTLsrqdiCnJuembiarsn76
 EiSQ==
X-Gm-Message-State: AOAM5334Sg1R+hlmrF4i3JobrGOsVMBcPEJbd5KmRhP/xFRc+cRIJrih
 QJNX+RvZE0q2LIcaECYt5Z8=
X-Google-Smtp-Source: ABdhPJwrkjde/Z6e4X54arkfrAdFRWNfEIUqRoReDcJ36V+ZMZwqv/l72Kt5Mb9TWy2qNeQR5oHLEQ==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr3151969wrr.332.1633692428046; 
 Fri, 08 Oct 2021 04:27:08 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id t15sm2222520wru.6.2021.10.08.04.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:27:06 -0700 (PDT)
Message-ID: <1ec3cefb-12cd-86e8-fff2-1ab0d10034b6@gmail.com>
Date: Fri, 8 Oct 2021 13:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v10, 4/5] soc: mediatek: add mtk mutex support for MT8192
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-5-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210930155222.5861-5-yongqiang.niu@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30/09/2021 17:52, Yongqiang Niu wrote:
> Add mtk mutex support for MT8192 SoC.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Applied to v5.15-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 35 ++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2e4bcc300576..2ca55bb5a8be 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -39,6 +39,18 @@
>   #define MT8167_MUTEX_MOD_DISP_DITHER		15
>   #define MT8167_MUTEX_MOD_DISP_UFOE		16
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
>   #define MT8183_MUTEX_MOD_DISP_RDMA0		0
>   #define MT8183_MUTEX_MOD_DISP_RDMA1		1
>   #define MT8183_MUTEX_MOD_DISP_OVL0		9
> @@ -214,6 +226,20 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
>   };
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
>   static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>   	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> @@ -275,6 +301,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>   	.no_clk = true,
>   };
>   
> +static const struct mtk_mutex_data mt8192_mutex_driver_data = {
> +	.mutex_mod = mt8192_mutex_mod,
> +	.mutex_sof = mt8183_mutex_sof,
> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +};
> +
>   struct mtk_mutex *mtk_mutex_get(struct device *dev)
>   {
>   	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> @@ -507,6 +540,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>   	  .data = &mt8173_mutex_driver_data},
>   	{ .compatible = "mediatek,mt8183-disp-mutex",
>   	  .data = &mt8183_mutex_driver_data},
> +	{ .compatible = "mediatek,mt8192-disp-mutex",
> +	  .data = &mt8192_mutex_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> 
