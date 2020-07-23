Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5B22B2C4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501016E155;
	Thu, 23 Jul 2020 15:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4C6E155
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:41:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 88so5622629wrh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AcBqtfKEF6k5xr/VSNWblkqKGVnRPP3ztKfalGbMQTA=;
 b=SkYe2AdfwGFlttVB8ifdFjjVZf8HGW9GVwFpei2V5+07UZ2DNP+x0zYdNcOp8FUCsF
 gNXqpKEzsxBa+Qu3MJcUipZBHqhct/OgxsNrCmknYegj38zb4BF2SLJq3N6WGMTWmraB
 B68nHR+yUFADlOABBYYUgvoAkPtscNgsZOPSOjA4kSDdAHEAMlH5xjOW4Li3I3Ulpxw8
 NpDGKc4G1rDb3mUtFK0bLrfZt7zexmcZSZBdtVbhxJgFeyBs7EUV/734GMksnuNBjAF6
 gSyn+dIOifPnVGrHxRnFVBYWGXbrkoW77cJycp0pqhWeA+sedQIrQ1DJF+nHSyDhmOw/
 Yrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AcBqtfKEF6k5xr/VSNWblkqKGVnRPP3ztKfalGbMQTA=;
 b=UChBBewmOXkEAPULcClfvHLMLt3xGrSh9Y83i6oc9KSBgArCqMvyi8+exJacveLnEL
 /7w3xnEbAZCCqHLEVFRa1RUcj64vsQCiWoleFPhjedN8+8LxKR0BQeSDwgtiWG0NxFSX
 6JDI5xyA9GhNK8JiYEYXDMuTWSCrM5tKLjNXIHffvJBLIwe+PyoE+ywjTdQX+iBLk5Mw
 6dVj9BBqxoKu2U00FEDNvz0o3doeE0mudYdSQVFhq9XpFC3K8qRpC1X89M71W+1+toQA
 SNLrzMO1eMaT4tbzIzeWsZuh2yRqu5fhfGc0XHkOUAdig5W/9HJwmcC9O3jxNc1QFpCY
 gxjw==
X-Gm-Message-State: AOAM530dL6E7FlFo6oH5w+HjgIXRMfXngzzVzMC4XJludz4xERFbNlaW
 b4GBcaJwJDsVdLLVSmaGWDw=
X-Google-Smtp-Source: ABdhPJxo8GvOapToh6OIkdSOCYVuIFV3tlBpD96mQIzsqG+h/NUdrRmgV0G9vYZUqr5+YsUfvS6bxA==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr4915144wro.217.1595518898886; 
 Thu, 23 Jul 2020 08:41:38 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id o7sm4169352wrv.50.2020.07.23.08.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 08:41:38 -0700 (PDT)
Subject: Re: [v7, PATCH 4/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b3f97fc8-d95e-8245-1178-9a70353d379c@gmail.com>
Date: Thu, 23 Jul 2020 17:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
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
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/07/2020 04:03, Yongqiang Niu wrote:
> Update device tree binding document for rdma_fifo_size
> 

Please explain better what you are doing in the patch.
Also DT binding patches should normally go as the first of a series, as this 
helps Rob to review them.

Regards,
Matthias

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,disp.txt | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709..e6bbe32 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -66,6 +66,11 @@ Required properties (DMA function blocks):
>     argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>     for details.
>   
> +Optional properties (RDMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this
> +  property to the corresponding rdma
> +  the value is the Max value which defined in hardware data sheet.
> +
>   Examples:
>   
>   mmsys: clock-controller@14000000 {
> @@ -207,3 +212,12 @@ od@14023000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_OD>;
>   };
> +
> +rdma1: rdma@1400c000 {
> +	compatible = "mediatek,mt8183-disp-rdma";
> +	reg = <0 0x1400c000 0 0x1000>;
> +	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +	mediatek,rdma_fifo_size = <2048>;
> +};
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
