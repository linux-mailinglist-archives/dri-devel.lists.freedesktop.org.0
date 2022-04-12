Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF84FE9DC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 23:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A1710E66D;
	Tue, 12 Apr 2022 21:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B79010E66D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 21:09:01 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso99534fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 14:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cJkmHfdBxf221GLO6Rp2mXWctk7aSf4CdfI04IRAEBI=;
 b=gn8DYY9lAjQOTiKUlVEI4M5jOklc7ln/5wdCJylwqsBzLGFmxg/aaFNe5/9CvU7T7W
 u8g4Txw37zGPDwA/u7oF9XaqbqJk416DSqD71jevGpU8yqm9LkbDYaPAnFKHn3S7KKNj
 Qs9KbmIpNoqpDwK8hwxwAy1fMYobGZf5baaeNSKz4furUuSX2SSjWaPMJEuIx/LhMKwd
 QD8Nh6DRXwLPXbV1BBfjzYBq8d4sW12O585tjzPqyuMxn3vp1blK1FxEo64zrCTiZbL8
 2B8UvRb3wzsvFkHND9DHVJJflFleapOX4Un79oC0D1TrdcGfVw23Lf5mUGv5kYXcAPs0
 fAaw==
X-Gm-Message-State: AOAM530CqLsALbkKwmS8xxmNrxcosd951iwfoBy2QuVJ+V64GybJ3alm
 J5olA36P3b7jYbNGRP0mOw==
X-Google-Smtp-Source: ABdhPJxzHVBv05OKxWV0sTv8Hm3nF460ieQSkUefeU8+7dcceq2HdX1Y1OEyRNmYiktpO+V5nGy4WA==
X-Received: by 2002:a05:6870:4290:b0:e2:b4c9:ea5a with SMTP id
 y16-20020a056870429000b000e2b4c9ea5amr2900806oah.173.1649797740517; 
 Tue, 12 Apr 2022 14:09:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d1-20020a056830138100b005cf2f29d89csm13533691otq.77.2022.04.12.14.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 14:09:00 -0700 (PDT)
Received: (nullmailer pid 946357 invoked by uid 1000);
 Tue, 12 Apr 2022 21:08:59 -0000
Date: Tue, 12 Apr 2022 16:08:59 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 02/14] dt-bindings: display: Add D1 display engine
 compatibles
Message-ID: <YlXqa5YH7ckHCf1m@robh.at.kernel.org>
References: <20220412042807.47519-1-samuel@sholland.org>
 <20220412042807.47519-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412042807.47519-3-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 11:27:54PM -0500, Samuel Holland wrote:
> Allwinner D1 contains a display engine 2.0. It features two mixers, a
> TCON TOP (with DSI and HDMI), one TCON LCD, and one TCON TV.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> (no changes since v1)
> 
>  .../allwinner,sun4i-a10-display-engine.yaml   |  1 +
>  .../display/allwinner,sun4i-a10-tcon.yaml     |  2 ++
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  2 ++
>  .../display/allwinner,sun8i-r40-tcon-top.yaml | 34 +++++++++++++++++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
> index d4412aea7b73..c388ae5da1e4 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
> @@ -62,6 +62,7 @@ properties:
>        - allwinner,sun8i-r40-display-engine
>        - allwinner,sun8i-v3s-display-engine
>        - allwinner,sun9i-a80-display-engine
> +      - allwinner,sun20i-d1-display-engine
>        - allwinner,sun50i-a64-display-engine
>        - allwinner,sun50i-h6-display-engine
>  
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index 3a7d5d731712..4a92a4c7dcd7 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -33,6 +33,8 @@ properties:
>        - const: allwinner,sun8i-v3s-tcon
>        - const: allwinner,sun9i-a80-tcon-lcd
>        - const: allwinner,sun9i-a80-tcon-tv
> +      - const: allwinner,sun20i-d1-tcon-lcd
> +      - const: allwinner,sun20i-d1-tcon-tv
>  
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index 4f91eec26de9..cb243bc58ef7 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -19,6 +19,8 @@ properties:
>        - allwinner,sun8i-r40-de2-mixer-0
>        - allwinner,sun8i-r40-de2-mixer-1
>        - allwinner,sun8i-v3s-de2-mixer
> +      - allwinner,sun20i-d1-de2-mixer-0
> +      - allwinner,sun20i-d1-de2-mixer-1
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> index 784b267635fb..cc32e2faed91 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> @@ -41,6 +41,7 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun8i-r40-tcon-top
> +      - allwinner,sun20i-d1-tcon-top
>        - allwinner,sun50i-h6-tcon-top
>  
>    reg:
> @@ -154,6 +155,39 @@ allOf:
>              - port@2
>              - port@3
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun20i-d1-tcon-top
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4

You shouldn't need minItems and maxItems here and the next 2 cases.

> +          items:
> +            - description: The TCON TOP interface clock
> +            - description: The TCON TOP TV0 clock
> +            - description: The TCON TOP TVE0 clock
> +            - description: The TCON TOP MIPI DSI clock
> +
> +        clock-names:
> +          minItems: 4
> +          maxItems: 4
> +          items:
> +            - const: bus
> +            - const: tcon-tv0
> +            - const: tve0
> +            - const: dsi
> +
> +        clock-output-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - description: TCON TV0 output clock name
> +            - description: DSI output clock name
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.35.1
> 
> 
