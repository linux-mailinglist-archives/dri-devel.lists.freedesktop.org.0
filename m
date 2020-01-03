Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64112FEB8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 23:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D14C6E351;
	Fri,  3 Jan 2020 22:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12B26E351
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 22:26:49 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id v15so37882632iln.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 14:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nH8EiEpsw3qEqxTu/vy8rZgCVIsth2Q4jMx+TyJClBo=;
 b=MWGnbr+VjFv89vpt+K5ANG2xtIGXZ3K+HqnmgTpBdZ6OJnBn+cANHB73VxPkra/PQn
 RdQUZFYu+3jCyunSkXnmKFFP9BOYo/tbTOBVLitX5Z61GOZx3hyvMjs/1r2EcuJT2RXP
 X1EL8KjV+Ok+qQmn3Na4gZ98MGmM/QXFDXn6fgDimxk2cUbnqJKBoyJn2twvHtGQMmJ5
 iJb605inqy0+fx+oGtr8xMOjR7hSQMiX5uFjm2YLGB+d6npkRjW0p+qmhXr8tERt4vnK
 cKo3udKusXqXuBeuaecklWeqqVdKcW3tZZKhWJwZsa4m+mVZGqM8VgF/MhKIj07236Da
 E1Zg==
X-Gm-Message-State: APjAAAVWAg9jkEjw64FcGl+ZLfj+2r2EzR1aKMt2oADJxf11GS/IxeSE
 6U7nBnQ0KzPhp3pwlziVjVOjobo=
X-Google-Smtp-Source: APXvYqxBfAAk5uAmiwUNjbckpuM/KXaRt5y89pyW2xNiKPgbbjdPUtpqseD1K2dL6DAaydm/AdN/VQ==
X-Received: by 2002:a92:4016:: with SMTP id n22mr75427638ila.13.1578090407818; 
 Fri, 03 Jan 2020 14:26:47 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id o12sm15093651ioh.42.2020.01.03.14.26.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 14:26:46 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219a5
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Fri, 03 Jan 2020 15:26:45 -0700
Date: Fri, 3 Jan 2020 15:26:45 -0700
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [RESEND PATCH v6 01/17] dt-bindings: mediatek: add
 rdma_fifo_size description for mt8183 display
Message-ID: <20200103222645.GA24430@bogus>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
 <1578021148-32413-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578021148-32413-2-git-send-email-yongqiang.niu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, Jan 03, 2020 at 11:12:12AM +0800, Yongqiang Niu wrote:
> Update device tree binding documention for rdma_fifo_size

Typo. And write complete sentences.

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 681502e..34bef44 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -70,6 +70,10 @@ Required properties (DMA function blocks):
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
>  
> +Required properties (DMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this
> +  property to the corresponding rdma

s/_/-/

Valid values? Max value?

> +
>  Examples:
>  
>  mmsys: clock-controller@14000000 {
> @@ -211,3 +215,12 @@ od@14023000 {
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

A new property doesn't really warrant a whole new example.

> \ No newline at end of file

^^^

> -- 
> 1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
