Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5AB67BA2D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F3810E813;
	Wed, 25 Jan 2023 19:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0E10E813
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 19:05:44 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-15f97c478a8so22498675fac.13
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qhr1Snnnfv3Lio+Z/H9CduUQNrxN5G15yH6OHJ4yvHM=;
 b=hvFfxrtuUGJNNeVrvlpXYg/nnhLtnPx5TmypeE18J/sRCwSjvmJoVmT5uj7QPLXod7
 UlJWAJpfSNpVyb7elnjtsK95xKtkS4QAL045dwh4oxtp40fLusO5E26aD7vOAhY3gk+u
 f94/6DmE7OSJYQU876uSIGjdaZY/YSHu2GjK+a5ps5VQOOniF/gfY7lKoUecv2Ojgm72
 YAUzaASg42DlYNcovvDuXexZu3WqoIolDtLMg4uJhv6T+AGFuIkIb9THRaG68gQFV6Ij
 ez2qkS95f2x5M1pLguTywyuWK6jJKWm8zVGDoTqTLflf9foIpoCCbR+mftT7oObXYRO2
 tcxg==
X-Gm-Message-State: AFqh2koKI7m9aTXAXZbNwMWPViFOX0Bv+flnU8M7/+qEAM7PJ6Uu12Ha
 Cxk1aavnZgu2scJi3GfAPg==
X-Google-Smtp-Source: AMrXdXsWj1xQcwnmtT18eTlSoYpv3JQC0KDpfuKbQAUsGlJZ7i1zq7QLTwf2BT+qCsfMea1enMhlpQ==
X-Received: by 2002:a05:6870:494b:b0:143:e045:7082 with SMTP id
 fl11-20020a056870494b00b00143e0457082mr16657899oab.58.1674673543521; 
 Wed, 25 Jan 2023 11:05:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b0014fd25bd3b5sm2305427oab.0.2023.01.25.11.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 11:05:42 -0800 (PST)
Received: (nullmailer pid 2693269 invoked by uid 1000);
 Wed, 25 Jan 2023 19:05:42 -0000
Date: Wed, 25 Jan 2023 13:05:42 -0600
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH v7 2/6] dt-bindings: display: ti,am65x-dss: Add support
 for am625 dss
Message-ID: <20230125190542.GA2690295-robh@kernel.org>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
 <20230125113529.13952-3-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125113529.13952-3-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 05:05:25PM +0530, Aradhya Bhatia wrote:
> The DSS controller on TI's AM625 SoC is an update from that on TI's
> AM65X SoC. The former has an additional OLDI TX on its first video port
> (VP0) that helps output cloned video or WUXGA (1920x1200@60fps)
> resolution video output over a dual-link mode to reduce the required
> OLDI clock output.
> 
> Add the new controller's compatible and a port property for the 2nd OLDI
> TX (OLDI TX 1).
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 5c7d2cbc4aac..55ec91f11577 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -19,7 +19,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: ti,am65x-dss
> +    enum:
> +      - ti,am625-dss
> +      - ti,am65x-dss
>  
>    reg:
>      description:
> @@ -80,13 +82,18 @@ properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          The DSS OLDI output port node form video port 1
> +          The DSS OLDI output port node form video port 1 (OLDI TX 0).

s/form/from/

>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
>            The DSS DPI output port node from video port 2
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          The DSS OLDI output port node form video port 1 (OLDI TX 1).

s/form/from/


> +
>    ti,am65x-oldi-io-ctrl:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description:
> @@ -102,6 +109,18 @@ properties:
>        Input memory (from main memory to dispc) bandwidth limit in
>        bytes per second
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am65x-dss
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@2: false
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.39.0
> 
