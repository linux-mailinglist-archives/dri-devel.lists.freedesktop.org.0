Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF252221D
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E4210F32E;
	Tue, 10 May 2022 17:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764A210F295
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:15:31 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so19073671fac.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U4enf849MalZJ94BbtP5EjviZoqMa/mYSymuWO+hQes=;
 b=QvEoHTWbZKXxf49IrRyI+iYse/BLLnYFJIdad0lCMjfXTmG+efMqexq00l9TUA4G7D
 q83s1t4L31mFj5VEVkuVd9fM9rBv7+OecquphrREPiexjdXvf10gI3S1xV1fillx6rhc
 wagKs4X+WoiK9YDLyG+A/f8jMhgOkDe1hA9VHCThiq437VlKbWQ8y/l+z4d+bPtdjH7d
 CO+8lVFWHsajgGIv7CPlFIZ8fD4mwPMx9TDHhq27P2ZJWk7Y7UO+gY2bSj4TvD2NjPf8
 Y+F5yfMW6gHxeL+0ZKcGpJHqhj9MakLN+M5KQI6w6KOfYXZW24ONogVzqH1ooGgBb9V4
 P3QQ==
X-Gm-Message-State: AOAM53227XcDG4LyYQ5SGWLkRvyV6xvr9L5wtnx7TikECwIb0m3Dobtr
 KzmxWWYaLoRTjt0bZCH1IA==
X-Google-Smtp-Source: ABdhPJwPVMnLqdMiqMekoFO1BpTerz9mA5hoHbPcCejjGrX5ztBsVFiV9PTz4T6oBBl8FMJlcsz0+A==
X-Received: by 2002:a05:6871:889:b0:ed:daa1:d08 with SMTP id
 r9-20020a056871088900b000eddaa10d08mr641546oaq.256.1652202930679; 
 Tue, 10 May 2022 10:15:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m33-20020a056870562100b000edf80be4ecsm5667586oao.58.2022.05.10.10.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 10:15:30 -0700 (PDT)
Received: (nullmailer pid 2222946 invoked by uid 1000);
 Tue, 10 May 2022 17:15:29 -0000
Date: Tue, 10 May 2022 12:15:29 -0500
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/3] dt-bindings: display: rockchip: make reg-names
 mandatory for VOP2
Message-ID: <YnqdsbYk+XzkVLe9@robh.at.kernel.org>
References: <20220510070914.2346011-1-s.hauer@pengutronix.de>
 <20220510070914.2346011-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510070914.2346011-2-s.hauer@pengutronix.de>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 09:09:12AM +0200, Sascha Hauer wrote:
> The VOP2 driver relies on reg-names properties, but these are not
> documented. Add the missing documentation, make reg-names mandatory
> and increase minItems to 2 as always both register spaces are needed.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/display/rockchip/rockchip-vop2.yaml          | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 655d9b327f7d3..7238cdec9eb8a 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -22,7 +22,7 @@ properties:
>        - rockchip,rk3568-vop
>  
>    reg:
> -    minItems: 1
> +    minItems: 2

You ran the dt checks, right? This should give you a warning. The 
correct thing is drop minItems if there's always 2 entries.

>      items:
>        - description:
>            Must contain one entry corresponding to the base address and length
> @@ -31,6 +31,11 @@ properties:
>            Can optionally contain a second entry corresponding to
>            the CRTC gamma LUT address.
>  
> +  reg-names:
> +    items:
> +      - const: vop
> +      - const: gamma-lut
> +
>    interrupts:
>      maxItems: 1
>      description:
> @@ -86,6 +91,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - reg-names
>    - interrupts
>    - clocks
>    - clock-names
> -- 
> 2.30.2
> 
> 
