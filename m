Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C95496903
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 02:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D384110E796;
	Sat, 22 Jan 2022 01:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C1010E796
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 01:01:42 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso13917515otf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 17:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8fdCWrFnYkvsx5bAjGhnOrbY0iI/VvlRTaU4X50Qjvg=;
 b=7bzy+AgQTdG5nMLwnmLnnSby6II4PyUBCDG/arRwxVVRJNzBfUq2wsECbLbaRQCetu
 x3iwm9bmw7+xVA7sg6FOdH6S4CobXnoWH2i9GdCTPrNrt++jo4E2WEAwMNPs1AW0lwjN
 mi6p2Tn0ECIdzH86hskMeNn8/Ec27foXuJLzDGjrZPzb3INvPV1IpTr4voRCQmibUU6/
 z+vcRrHOaf9QhQ6Cs7OhGGi3u9MmqdiBmiqNNuHM2UhWm99DrBd0H+NOKd73wL1W3krF
 KGWQCbGqIE2r46CzD39wuvk7A4jH32sTHkPtwTf/c73oOCDFHapBuoF4JszYENvnHU51
 mVHw==
X-Gm-Message-State: AOAM532sQzbLp9rp0baNTAcBVcHybsJMl+b/nTHS1diw1T7MtcPwBvGT
 Ksf1fhiN5mkem2dlG+DwmQ==
X-Google-Smtp-Source: ABdhPJxlc6CJfKG6jVxmsxxQhJRn8lNO5gIlSlOlDWB1Na4g2LCrztdFhL+GsnEBL6a00HN1Go3e8Q==
X-Received: by 2002:a9d:7114:: with SMTP id n20mr4670444otj.84.1642813301981; 
 Fri, 21 Jan 2022 17:01:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f6sm1457338oos.7.2022.01.21.17.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 17:01:41 -0800 (PST)
Received: (nullmailer pid 1963660 invoked by uid 1000);
 Sat, 22 Jan 2022 01:01:40 -0000
Date: Fri, 21 Jan 2022 19:01:40 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC 17/28] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Message-ID: <YetXdDHGnHDV2LSM@robh.at.kernel.org>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-18-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112174612.10773-18-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 12, 2022 at 05:46:01PM +0000, Biju Das wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l RZ/G2L.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index 13efea574584..fc050b1088f3 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -40,6 +40,7 @@ properties:
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
>  
>    reg:
>      maxItems: 1
> @@ -824,6 +825,59 @@ allOf:
>          - reset-names
>          - renesas,vsps
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044l
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: LCDC Main clock
> +            - description: LCDC Register Access Clock
> +            - description: LCDC Video Clock
> +
> +        clock-names:
> +          items:
> +            - const: du.0
> +            - const: pclk
> +            - const: vclk
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DSI 0
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +        renesas,vsps:
> +          minItems: 1

The minimum number of items is 1 by default if not otherwise specified.

maxItems: 1 ???

> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.17.1
> 
> 
