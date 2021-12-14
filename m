Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D08474BC6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 20:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719E010E14F;
	Tue, 14 Dec 2021 19:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4820210E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 19:21:40 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso22065446otr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 11:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+9ddLBfWJHBgIj2To9g0eYLCnZlV0ghMCRj6XN0Hhr4=;
 b=TXoItWJ8SU0sYPDRHaNsIazyyvHun9hPwfj4nQiNyS/NMQJNsyu4TUPLXthk0anmFh
 slFgPTfiVyuCFc6LUSecduvVRmw5JSSBzTYafTwaO90KLFiMfiHjsY5MsrOl/S3eHu2l
 1GQOkCl3hg+BnhL9/sqZOtpvk/yEofcI0kTfbAh7bkEx96ogpE7Tvry3RWFaO6vcdzos
 IZeA7qMjKZ4ICMRIRmLyJ4repAXg+nXHsOi4EahQxbh+IOc02r6dPE26QaE/KuXjjzhh
 o9C3v29FjU6MzVt4immmx5F+WiH89jInkOGvLMntnw251r841+MGtuHhKZFzf3vlCdyg
 m89Q==
X-Gm-Message-State: AOAM531lnQc5A8WGsjXLxEUwZ038r86LePsmCOV/INGJWwMZVSRrKdbC
 s3D78hDXSBoDWEdAcMQIIQ==
X-Google-Smtp-Source: ABdhPJxnxm3aHuNvY7i5AgZRlyQlqsxgfscPXHYBrIw+RM/u/poU0w24f4VXglnn8Fd/IAduxgBgmA==
X-Received: by 2002:a9d:6394:: with SMTP id w20mr5832966otk.248.1639509699433; 
 Tue, 14 Dec 2021 11:21:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v2sm133687oto.3.2021.12.14.11.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 11:21:38 -0800 (PST)
Received: (nullmailer pid 3758448 invoked by uid 1000);
 Tue, 14 Dec 2021 19:21:37 -0000
Date: Tue, 14 Dec 2021 13:21:37 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Message-ID: <YbjuwQYYO2begeDY@robh.at.kernel.org>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <20211208104026.421-2-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592202E727C32991DB852AA186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592202E727C32991DB852AA186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 02:44:06PM +0000, Biju Das wrote:
> Hi All,
> 
> Gentle ping.

2 days later is not a gentle ping. If you want to check status, go look 
at PW[1]. If it is in there, it's in my queue (only about 100 patches 
ATM).

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/
> 
> Cheers,
> Biju
> 
> > Subject: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
> > support
> > 
> > The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> > add a compatible string for it.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Moved optional clock-names and reset-names to SoC-specific conditional
> > schemas.
> >  * minimum number of reset for the generic GPU is set to 1.
> >  * Documented number of clocks, resets, interrupts and interrupt-names in
> > RZ/G2L
> >    SoC-specific conditional schemas.
> > v1->v2:
> >  * Updated minItems for resets as 2
> >  * Documented optional property reset-names
> >  * Documented reset-names as required property for RZ/G2L SoC.
> > ---
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++++++++-
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 6f98dd55fb4c..63a08f3f321d 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -19,6 +19,7 @@ properties:
> >            - amlogic,meson-g12a-mali
> >            - mediatek,mt8183-mali
> >            - realtek,rtd1619-mali
> > +          - renesas,r9a07g044-mali
> >            - rockchip,px30-mali
> >            - rockchip,rk3568-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is
> > fully discoverable @@ -27,19 +28,26 @@ properties:
> >      maxItems: 1
> > 
> >    interrupts:
> > +    minItems: 3
> >      items:
> >        - description: Job interrupt
> >        - description: MMU interrupt
> >        - description: GPU interrupt
> > +      - description: Event interrupt
> > 
> >    interrupt-names:
> > +    minItems: 3
> >      items:
> >        - const: job
> >        - const: mmu
> >        - const: gpu
> > +      - const: event
> > 
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names: true
> > 
> >    mali-supply: true
> > 
> > @@ -52,7 +60,10 @@ properties:
> >      maxItems: 3
> > 
> >    resets:
> > -    maxItems: 2
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  reset-names: true
> > 
> >    "#cooling-cells":
> >      const: 2
> > @@ -94,6 +105,36 @@ allOf:
> >      then:
> >        required:
> >          - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a07g044-mali
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 4
> > +        interrupt-names:
> > +          minItems: 4
> > +        clocks:
> > +          minItems: 3
> > +        clock-names:
> > +          items:
> > +            - const: gpu
> > +            - const: bus
> > +            - const: bus_ace
> > +        resets:
> > +          minItems: 3
> > +        reset-names:
> > +          items:
> > +            - const: rst
> > +            - const: axi_rst
> > +            - const: ace_rst
> > +      required:
> > +        - clock-names
> > +        - power-domains
> > +        - resets
> > +        - reset-names
> >    - if:
> >        properties:
> >          compatible:
> > --
> > 2.17.1
> 
> 
