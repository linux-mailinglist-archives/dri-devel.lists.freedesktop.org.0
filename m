Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923922D6EBE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 04:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5430D6EC39;
	Fri, 11 Dec 2020 03:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A786EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 03:40:36 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id x203so1834882ooa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 19:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rSxM3l6xp3sRDoOhEED+EOawS1LpcndGMhb9GwxCfww=;
 b=AQx0eWYvU6xoavJlyv6xoQgTWAtCAsjsorL7pDdYDiW2IemTX3kKgf9WkH9sSP7ddI
 +RgLXaPUAEozFaiLoicwDMwDkhopjDm3EkvT3fHCykfK4dGaEAszBGeQSO0nkcrgW2wF
 BgUFsoN90BZ/8ORtYS9Y+8vrPIeVnEjA3EzrwMRShqFBLz2rEonVFCNAXewJES8TpBVE
 WYHcfT/78YFzQ8A0Sn/ekSNeSdjj5eXRUvC38bPhqdvSdbrpbe8v9Zi5omT9aB2AgwHW
 l+tAN5JjuniP0jHjmRd0D+Zb0+cNuwlL8A9ZzkayrnTlIEQDszeN+MCS+lNeKbC1rhDK
 LAuQ==
X-Gm-Message-State: AOAM531C6qMlXUjHsoRoN68vFbg7ZfljowWszlgxWuhDARUvUe3mbmfq
 6Iomr58ZU1/nmhMf8NcQ2A==
X-Google-Smtp-Source: ABdhPJxFbPujw6YvZQNyAnC85BoyAfgK6ZSF1q6fK4C/+dHNlgwjupZdEhRXi5NgTGB3gwOUcW492Q==
X-Received: by 2002:a4a:b144:: with SMTP id e4mr8501118ooo.3.1607658035847;
 Thu, 10 Dec 2020 19:40:35 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z38sm1118026ooi.34.2020.12.10.19.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:40:35 -0800 (PST)
Received: (nullmailer pid 3594506 invoked by uid 1000);
 Fri, 11 Dec 2020 03:40:34 -0000
Date: Thu, 10 Dec 2020 21:40:34 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
Message-ID: <20201211034034.GA3593696@robh.at.kernel.org>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
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

On Thu, Dec 10, 2020 at 05:07:37PM +0800, Yongqiang Niu wrote:
> rdma fifo size may be different even in same SOC, add this
> property to the corresponding rdma
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,disp.txt          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 1212207..64c64ee 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -66,6 +66,13 @@ Required properties (DMA function blocks):
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
>  
> +Optional properties (RDMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this

mediatek,rdma-fifo-size

> +  property to the corresponding rdma
> +  the value is the Max value which defined in hardware data sheet.
> +  rdma_fifo_size of rdma0 in mt8183 is 5120
> +  rdma_fifo_size of rdma1 in mt8183 is 2048
> +
>  Examples:
>  
>  mmsys: clock-controller@14000000 {
> @@ -207,3 +214,12 @@ od@14023000 {
>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  	clocks = <&mmsys CLK_MM_DISP_OD>;
>  };
> +
> +rdma1: rdma@1400c000 {
> +	compatible = "mediatek,mt8183-disp-rdma";
> +	reg = <0 0x1400c000 0 0x1000>;
> +	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +	mediatek,rdma_fifo_size = <2048>;
> +};
> -- 
> 1.8.1.1.dirty
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
