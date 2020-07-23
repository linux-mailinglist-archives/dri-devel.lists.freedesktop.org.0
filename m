Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1EE22B40A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 18:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6F6E124;
	Thu, 23 Jul 2020 16:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7781E6E124
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 16:59:52 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id j9so1541345ilc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 09:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a9J1QalhPnPlUfL8dEkhcJXOcummbHS6rnTdET71bMs=;
 b=BVvodczMKq4WW9Y+R/0YCgyJD5wde7GBPNr0aP+w5YFssfbQmriwl1luBxBiORNYoN
 qgIPnjSUSo19Rlf/6b+XnTWy4NwdVMYgmPnqRtQiaTwRpmXcN8fU3/0V6jHq3gpYHqcd
 KH7wKpsloTYozIVejHWjKbfCyKhYS7qQfsiIpukxpx+lTnAsIm5CNfcCCe7U7i54RFjl
 n9Wk4bWJd+zrRbdK8CB0ExKHvPPMuurvVLYT9T3nZ9onKjvwnd3kCCiwhWLTzx8IMqom
 RqKHPbgMrpLTb2QwZmdGLRarcacDlL3p6Qxo2NuYPO9qhxeugAZ0rSdV0X1EwRDqcXEZ
 Jk+A==
X-Gm-Message-State: AOAM532ftolqs/t53+BR29DYVZ7QpJqIw7LAlpbKAJLRR8B8x6bQM6tX
 +Gpe3HYm+OOI697uUSlJ8A==
X-Google-Smtp-Source: ABdhPJyuR1S22aBp3Or2PleYDBAuKLxt9dS8HqZMwzT1XYskFKMphzrrK4Z7oxsJJzEUbVcdkKz2pw==
X-Received: by 2002:a05:6e02:1253:: with SMTP id
 j19mr5960074ilq.145.1595523591815; 
 Thu, 23 Jul 2020 09:59:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 5sm1721954ion.7.2020.07.23.09.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:59:51 -0700 (PDT)
Received: (nullmailer pid 531537 invoked by uid 1000);
 Thu, 23 Jul 2020 16:59:50 -0000
Date: Thu, 23 Jul 2020 10:59:50 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [v7, PATCH 4/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
Message-ID: <20200723165950.GA529262@bogus>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
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

On Thu, Jul 23, 2020 at 10:03:15AM +0800, Yongqiang Niu wrote:
> Update device tree binding document for rdma_fifo_size
> 
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

s/_/-/

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
