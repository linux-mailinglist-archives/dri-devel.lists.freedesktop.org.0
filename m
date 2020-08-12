Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D9242DB8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 18:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A156E0FA;
	Wed, 12 Aug 2020 16:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4E6E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 16:55:08 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s189so3605577iod.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OnKPv+qr/0SKiO3J0pJxrPNLJqM+U78LQKFRagi2BS8=;
 b=o+qUTBYywJmbFtif1hCR0TEp57k60MTm6TAMn57tSybmXL50AQ0My2BRUlbS5KJpPe
 QUjpPsLqF9PBfO5EYlmSI03uxlDDMFiOPLOvORXsIGWffZH4qZE+lM+3++xlwf/C9G/s
 hQlSTetB//l8oSv1fg/eEGbVbVrxzgR2ZNE6TnNtwaPkJYxq/M4dcYioHmboBxyWyIKJ
 eUZYYE/dvB0fmysO94m+11JcCP8YW53rnVGC01dbh+R/33y+L6VjdyZcQ8o+HOhfThb4
 ariIydYEKj9w4d0ol1ugoUPyr6hFKnsfcFKcMxqBoJTiBU71llxlFOyyXnBMqiVmG5x/
 CfNw==
X-Gm-Message-State: AOAM532c9ReNhNqsqFj9cpWpEERzy0OTpn3DXnbk+kmGc+GqM1CU8wpQ
 JAQBxxtGBrvFTsPkKNww+Q==
X-Google-Smtp-Source: ABdhPJwYwyFOnVugtnOVfg8AgmEVYg3C6rf+Hwcjg8rs7FalCUYOI3v0RNnferAdv8WDFYik34UcAQ==
X-Received: by 2002:a6b:7e41:: with SMTP id k1mr718192ioq.130.1597251308230;
 Wed, 12 Aug 2020 09:55:08 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id a9sm1236374iol.9.2020.08.12.09.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 09:55:07 -0700 (PDT)
Received: (nullmailer pid 2363799 invoked by uid 1000);
 Wed, 12 Aug 2020 16:55:04 -0000
Date: Wed, 12 Aug 2020 10:55:04 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [RESEND v7, PATCH 1/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
Message-ID: <20200812165504.GA2361465@bogus>
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
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
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 08, 2020 at 10:53:45AM +0800, Yongqiang Niu wrote:
> rdma fifo size may be different even in same SOC, add this
> property to the corresponding rdma
> 
> Change-Id: I67635ec7f3f59cf4cbc7737285e5e28ff0ab71c9
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709..e6bbe32 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -66,6 +66,11 @@ Required properties (DMA function blocks):
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
>  
> +Optional properties (RDMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this

mediatek,rdma-fifo-size

What's the range/set of valid values?

> +  property to the corresponding rdma
> +  the value is the Max value which defined in hardware data sheet.
> +
>  Examples:
>  
>  mmsys: clock-controller@14000000 {
> @@ -207,3 +212,12 @@ od@14023000 {
>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  	clocks = <&mmsys CLK_MM_DISP_OD>;
>  };
> +
> +rdma1: rdma@1400c000 {

Does a new property really need a whole new example?

> +	compatible = "mediatek,mt8183-disp-rdma";
> +	reg = <0 0x1400c000 0 0x1000>;
> +	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +	mediatek,rdma_fifo_size = <2048>;
> +};
> -- 
> 1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
