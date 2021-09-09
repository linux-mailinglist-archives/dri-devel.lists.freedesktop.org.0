Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57EE4052D1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404B86E844;
	Thu,  9 Sep 2021 12:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F45F6E844
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 12:49:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u9so2398402wrg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wAM0T8G6RoTaL+Y8vrPSrkyhlkeAcZjgrvEsT1FGoxg=;
 b=i8ceddWDabmpRFFGiXT16HYRk48TxOP9V0HyQOxzyeHIdCZYMvHYushGqUUpB3sHuG
 LgyCcf8dT+mdWOOKJxPBickavu4WLE58wAwJB7uErs97Q6czvoH8V5AovtG53DV7oagQ
 DyDQYlktZ6dv0BqgfD/46J2JDTjdJmcc3EhEadDymmA1IEsQQt/GFNJpfRGOPKnLbdmO
 vd6IoWWqtoGv26TZrvB6jJcih0N1ge8t+MO5n5lWS3RWoQFwVwk0Jf3ETe7uiqWeHEAr
 lVb4Nht6i9A9r40Zx9HmeqoBKt2m1seuPmQ5VGbIYrhzPFaITFaLkveJZmY24nQp9TLt
 WF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wAM0T8G6RoTaL+Y8vrPSrkyhlkeAcZjgrvEsT1FGoxg=;
 b=egwPhcVNca3bquDJ4yY8avW8M+JqI5TltitCrSWaNLGThWIaxLZQtrSwattxOQvhpO
 XQmjGW4sZ8sztkocoYw39l+JLGPZDc1KdRmByoZ3zq++0tmx4jmorL2Ct+y2DjNbU9MY
 XC2lY6axT1LS074YOrvvCnHLtXrORxT7OJkD/n9gTLcYVtHNHbFeGG1KcrunsXjeCP+2
 fu/8khswh/rdvUH691x+RD1huDZnovYNj7OEZDHMSPZN9zlzCDVu+tV96cDdGZRQQ8Qz
 pIjp+5rLDs+ZJkOBvRUoSO6UJJT4AKRr536NtQSQ28HID+2GzhkM+C3RylShtCP3sxL1
 St7Q==
X-Gm-Message-State: AOAM531hbxCdmv042lar+ctiwihpHvehP2cPaiEvDHnsSKTrQ0OFJ3kc
 ey/vSAqUpHUJd/x1UGPkT/lexw==
X-Google-Smtp-Source: ABdhPJxvYA+22G8slEPRSrP6PK4fbT2uKkOX51g0+SCQHqtSYI2Gzhg8yJJq9IrAz4PM7wAyOzxg/w==
X-Received: by 2002:a5d:4285:: with SMTP id k5mr3460204wrq.131.1631191795089; 
 Thu, 09 Sep 2021 05:49:55 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id j20sm1688269wrb.5.2021.09.09.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:49:54 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:49:53 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/6] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Message-ID: <20210909124953.635bvnizczabk2ii@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-2-msp@baylibre.com>
 <YTZ2jf0xynvvZM2s@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTZ2jf0xynvvZM2s@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Sep 06, 2021 at 10:14:05PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:24PM +0200, Markus Schneider-Pargmann wrote:
> > DP_INTF is similar to the actual dpi. They differ in some points
> > regarding registers and what needs to be set but the function blocks
> > itself are similar in design.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> I fail to see why they share the same dt-schema as the main content in
> the schema is the clocks and they differ.
> 
> A new mediatek,dpintf schema seems more appropriate.

Good idea, I will do that. Thank you.

Best,
Markus

> 
> I recall I though so when reading the RFC variant but failed to comment on it.
> 
> 	Sam
> 
> > ---
> >  .../display/mediatek/mediatek,dpi.yaml        | 43 ++++++++++++++++---
> >  1 file changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index dd2896a40ff0..1a158b719ce6 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: mediatek DPI Controller Device Tree Bindings
> > +title: mediatek DPI/DP_INTF Controller Device Tree Bindings
> >  
> >  maintainers:
> >    - CK Hu <ck.hu@mediatek.com>
> > @@ -13,7 +13,8 @@ maintainers:
> >  description: |
> >    The Mediatek DPI function block is a sink of the display subsystem and
> >    provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> > -  output bus.
> > +  output bus. The Mediatek DP_INTF is a similar function block that is
> > +  connected to the (embedded) display port function block.
> >  
> >  properties:
> >    compatible:
> > @@ -23,6 +24,7 @@ properties:
> >        - mediatek,mt8173-dpi
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dpintf
> >  
> >    reg:
> >      maxItems: 1
> > @@ -37,10 +39,11 @@ properties:
> >        - description: DPI PLL
> >  
> >    clock-names:
> > -    items:
> > -      - const: pixel
> > -      - const: engine
> > -      - const: pll
> > +    description:
> > +      For dpi clocks pixel, engine and pll are required. For dpintf pixel,
> > +      hf_fmm and hf_fdp are required.
> > +    minItems: 3
> > +    maxItems: 3
> >  
> >    pinctrl-0: true
> >    pinctrl-1: true
> > @@ -64,6 +67,34 @@ required:
> >    - clock-names
> >    - port
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-dpintf
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 3
> > +        clock-names:
> > +          items:
> > +            - const: pixel
> > +            - const: hf_fmm
> > +            - const: hf_fdp
> > +    else:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +          maxItems: 3
> > +        clock-names:
> > +          items:
> > +            - const: pixel
> > +            - const: engine
> > +            - const: pll
> > +
> >  additionalProperties: false
> >  
> >  examples:
> > -- 
> > 2.33.0
