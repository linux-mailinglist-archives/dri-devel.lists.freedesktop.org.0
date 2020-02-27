Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE331724DB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 18:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5536EB78;
	Thu, 27 Feb 2020 17:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCFE6EB78
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 17:19:07 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id q84so4077834oic.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 09:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EEa7ye+4SNg6W5sroyNYrJMOxOtx09zWUa0ioGPqjd8=;
 b=oxUpxUHN+2HJa1lZbbVlkI1LmRs2KHZa/UC3WOM5lBH6opycp9dlDJQmt8GTgvstMf
 9U/SAznz980DRiQFvyOI9EYKD3p71D+tb0yfHTUJMXiwoa5a/ruxcI2hnmzC8vneCSgD
 1BWy6qhqzi4+51LJ7kWq6khAXUlXA+R9Jf3d3eNFyqjxQEw40Ctanqp43l1OWUPrW57g
 c440i94FsXJDV1sYo3CuednT8bkmgAj2ewEyp0TOpIV7Ekw7VcUA667F5u7waKZXZcUF
 KBXsdt3f2QAisHS44LhQ2qKRLEj9tMT3VFO/IXumdikpXlt9gig7F2CzchqBZ1Ufvam5
 Ex+Q==
X-Gm-Message-State: APjAAAVWDWeaIhFC2LjHSVV2+VB+vRkwCwpDqpzvHgrBZEJ0oKhFiaHe
 rCePRTU+Z2c9xT46azbrlg==
X-Google-Smtp-Source: APXvYqyivrbnGPADBq2gCXjpZ0Ulx7DPwJxfGsdNrYwEE5j4rbjAGXZ2yhl3jW4hSxNtdbA1D1ycUA==
X-Received: by 2002:aca:3857:: with SMTP id f84mr58985oia.150.1582823946480;
 Thu, 27 Feb 2020 09:19:06 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k201sm2165169oih.43.2020.02.27.09.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 09:19:06 -0800 (PST)
Received: (nullmailer pid 18856 invoked by uid 1000);
 Thu, 27 Feb 2020 17:19:04 -0000
Date: Thu, 27 Feb 2020 11:19:04 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 3/5] dt-bindings: display: mediatek: dpi sample data
 in dual edge support
Message-ID: <20200227171904.GA17829@bogus>
References: <20200226053238.31646-1-jitao.shi@mediatek.com>
 <20200226053238.31646-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226053238.31646-4-jitao.shi@mediatek.com>
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
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 01:32:36PM +0800, Jitao Shi wrote:
> Add property "pclk-sample" to config the dpi sample on falling (0),
> rising (1), both falling and rising (2).
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt       | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index a7b1b8bfb65e..4299aa1adf45 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -20,6 +20,7 @@ Required properties:
>  Optional properties:
>  - pinctrl-names: Contain "gpiomode" and "dpimode".
>    pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> +- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
>  Example:
>  
> @@ -37,6 +38,7 @@ dpi0: dpi@1401d000 {
>  
>  	port {
>  		dpi0_out: endpoint {
> +			pclk-sample = 0;

Not valid dts syntax: <0>

>  			remote-endpoint = <&hdmi0_in>;
>  		};
>  	};
> -- 
> 2.21.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
