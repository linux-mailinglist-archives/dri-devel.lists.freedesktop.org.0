Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA6C3314F6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 18:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8929C6E40D;
	Mon,  8 Mar 2021 17:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899016E40D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 17:36:18 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id o11so10852332iob.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 09:36:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JBA6up/vPaAHWMxjZYEnP/CnL1gFfsdNRmBXWfPosnI=;
 b=OGHX6LV4NXm2wgUA12QZrLT3BHKOpIwH5ySOb2VkIvypY52lxasLpWM9pY+OCcKBeP
 6o4zFlGq4ShzijthIbXpE7JCG43c27AOTiJFAnOqYAI9yRUb6Pm878AM/n5fy7Cd5hfr
 GqWfP0R10fXjmQLoYtyyBF2mqJ9/PY3kIEPO1U7pOYN3Ek6wluU1XouxrUvhK/OdRS75
 AgFO/u4jM6czGRTNZ+bNGd9gwbakoPliXU3Qi9+bl6t+zHsIZNEw9IwH7Tvvt1/MPhqS
 Jn6JRHGDDenA6++e5TiUG5dEDNCo2+dTRsfOtMDKqt0yB5zRmG3MhxEArW86agCymB4f
 wQWw==
X-Gm-Message-State: AOAM5305gROh9z8GaA/CBtqlX/9UgH8aSmlgyTHmiD9MEoijCHpxSxek
 HZtGfnryJEeGUaTBRvtDfw==
X-Google-Smtp-Source: ABdhPJyJaGJBruRnAkdq1spRqZqtn2RV1GOv+7vhvyAfJFtvmSgGafdf13MYdJGctj/hpQjFitOtMg==
X-Received: by 2002:a6b:5c0d:: with SMTP id z13mr19258278ioh.6.1615224977961; 
 Mon, 08 Mar 2021 09:36:17 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y18sm6506926ili.16.2021.03.08.09.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:36:17 -0800 (PST)
Received: (nullmailer pid 2674975 invoked by uid 1000);
 Mon, 08 Mar 2021 17:36:15 -0000
Date: Mon, 8 Mar 2021 10:36:15 -0700
From: Rob Herring <robh@kernel.org>
To: Parshuram Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Message-ID: <20210308173615.GA2668115@robh.at.kernel.org>
References: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
 <1614597746-4563-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614597746-4563-1-git-send-email-pthombar@cadence.com>
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, airlied@linux.ie,
 robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com, nikhil.nd@ti.com,
 mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 12:22:26PM +0100, Parshuram Thombare wrote:
> Add binding changes for HDCP in the MHDP8546 DPI/DP bridge binding.
> This binding is not used in any upstreamed DTS yet, so changing
> index of property 'j721e-intg' should not affect anything.

TI folks might disagree, but weren't Cc'ed.

> 
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  .../display/bridge/cdns,mhdp8546.yaml         | 29 ++++++++++++-------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index 63427878715e..5fdadadaac16 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -17,21 +17,24 @@ properties:
>        - ti,j721e-mhdp8546
>  
>    reg:
> -    minItems: 1
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - description:
>            Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
>            The AUX and PMA registers are not part of this range, they are instead
>            included in the associated PHY.
> +      - description:
> +          Register block of mhdptx sapb registers.
>        - description:
>            Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>  
>    reg-names:
> -    minItems: 1
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: mhdptx
> +      - const: mhdptx-sapb
>        - const: j721e-intg
>  
>    clocks:
> @@ -53,6 +56,11 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  hdcp-config:
> +    maxItems: 1
> +    description:
> +      HDCP version supported. Bit [0]:HDCP2.2 [1]:HDCP1.4.

2.2 is not backwards compatible with 1.4? What's the setting if not 
present? Maybe just a 'disable 2.2 boolean' if that's the non-common 
case.

In any case, it needs a type and constraints on the values.


> +
>    interrupts:
>      maxItems: 1
>  
> @@ -98,15 +106,15 @@ allOf:
>      then:
>        properties:
>          reg:
> -          minItems: 2
> +          minItems: 3
>          reg-names:
> -          minItems: 2
> +          minItems: 3
>      else:
>        properties:
>          reg:
> -          maxItems: 1
> +          maxItems: 2
>          reg-names:
> -          maxItems: 1
> +          maxItems: 2
>  
>  required:
>    - compatible
> @@ -129,8 +137,9 @@ examples:
>  
>          mhdp: dp-bridge@f0fb000000 {
>              compatible = "cdns,mhdp8546";
> -            reg = <0xf0 0xfb000000 0x0 0x1000000>;
> -            reg-names = "mhdptx";
> +            reg = <0xf0 0xfb000000 0x0 0x1000000>,
> +                  <0x0 0x4f48000 0x0 0x74>;
> +            reg-names = "mhdptx", "mhdptx-sapb";
>              clocks = <&mhdp_clock>;
>              phys = <&dp_phy>;
>              phy-names = "dpphy";
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
