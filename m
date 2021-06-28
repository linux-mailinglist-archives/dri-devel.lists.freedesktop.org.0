Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2B3B5ACF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06A6E2DC;
	Mon, 28 Jun 2021 09:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C9C6E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:04:02 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h15so31211567lfv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+2EzrTnhfOowmWhxm0kFHTRjLO9TCl8XXTjXsRKqQ2c=;
 b=zIJqs7Co2eNiFonKRmUhGl779hcPPInezCVycefhrwtwbgb1N451lT2INEF1w0lbnP
 NHUnBfkxgnWNECm58Zcusrpsubc4rnSid6PnR35RCycjZcigJDQMtm9dd+Q1H69B/s/p
 VEEYinlNBAIv8AK8C8ilf/J8GjLrdXsjXZgy2YIdzHKTwAjc0j0IdUIcW54K/XWs4R8e
 SR+ts7cwxpTzYlyLQAsgTjxRVwA6ezVzb6/xoNUDu3Av/3Tp8LKGS81KZ70+YQeO97Ot
 vwMkpWl/h+d1OVg4OeX3+CGimUoZKLdeC05B+gETnoeqaQSa/Wk/lKnTDIuC/7TwsEt1
 FGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+2EzrTnhfOowmWhxm0kFHTRjLO9TCl8XXTjXsRKqQ2c=;
 b=jowOdZZ2RMpOeKpSWFIZlVtV30T6yndJrBECDxnbpBWgBxmG3UUNI7n8E0bJPWYOlh
 gtpgx/vPnvgaCmibGdjmLqR0f0hR+mwGtqE4/MB5pmbiW8faCpVlVWiy9/5woWDOmIpg
 Bo72rtF974ZpPZMehEEo69gIKHkIoKxxoUGgmwAAokg5drEYog3nHswkyy63ZB+rnKv3
 N0qG6ZN88lgAomuHt7aE3tm4TA8WtnxHhrw5L3NSwSrvbmCLlmTj5n6kGeK8nFAvHhb3
 mxIo6mLr3mHAuXzW1uk5VIf0y1fAwF0p547KXVWaAJ8BPM3RvWtBaHKbV96xeooHPMfT
 1uuw==
X-Gm-Message-State: AOAM533jvrNYOxugGp5D0MAk/0d3ghQXXTDAmGtpgtWnDRmxnjpOIq+z
 JKw0/wSy143eLUehQyFIIDIdkg==
X-Google-Smtp-Source: ABdhPJwJfZjn/0uvABnDakh1J3d7cG4mjD0RI2wPB8U7fPt3E4kbk1xZjnjHYhTJ8+t/yIHTzXu11Q==
X-Received: by 2002:a05:6512:76:: with SMTP id
 i22mr18642952lfo.420.1624871040878; 
 Mon, 28 Jun 2021 02:04:00 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
 by smtp.gmail.com with ESMTPSA id
 b15sm1260527lfe.49.2021.06.28.02.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 02:04:00 -0700 (PDT)
Date: Mon, 28 Jun 2021 11:03:59 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix 'unevaluatedProperties' errors in DT
 graph users
Message-ID: <YNmQf3nfSzScL97H@oden.dyn.berto.se>
References: <20210623164344.2571043-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210623164344.2571043-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, "Paul J. Murphy" <paul.j.murphy@intel.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-renesas-soc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for your work.

On 2021-06-23 10:43:44 -0600, Rob Herring wrote:
> In testing out under development json-schema 2020-12 support, there's a
> few issues with 'unevaluatedProperties' and the graph schema. If
> 'graph.yaml#/properties/port' is used, then neither the port nor the
> endpoint(s) can have additional properties. 'graph.yaml#/$defs/port-base'
> needs to be used instead.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml    | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/imx258.yaml        | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/renesas,vin.yaml       | 3 ++-

For renesas,vin

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  6 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
> index 735d0233a7d6..674891ee2f8e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
> @@ -29,7 +29,8 @@ properties:
>  
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description:
>            Primary MIPI port for MIPI input
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> index 515317eff41a..cde0f7383b2a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> @@ -49,7 +49,7 @@ properties:
>  
>    # See ../video-interfaces.txt for more details
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
>      additionalProperties: false
>  
>      properties:
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> index 9149f5685688..246dc5fec716 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> @@ -45,7 +45,7 @@ properties:
>  
>    port:
>      description: MIPI CSI-2 transmitter port
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
>      additionalProperties: false
>  
>      properties:
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> index 0699c7e4fdeb..b962863e4f65 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> @@ -45,7 +45,7 @@ properties:
>  
>    port:
>      description: MIPI CSI-2 transmitter port
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
>      additionalProperties: false
>  
>      properties:
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> index 27cc5b7ff613..f5055b9db693 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> @@ -37,7 +37,7 @@ properties:
>  
>    port:
>      additionalProperties: false
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
>  
>      properties:
>        endpoint:
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index dd1a5ce5896c..4945a2f0eca6 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -118,7 +118,8 @@ properties:
>  
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description:
>            Input port node, single endpoint describing a parallel input source.
>  
> -- 
> 2.27.0
> 

-- 
Regards,
Niklas Söderlund
