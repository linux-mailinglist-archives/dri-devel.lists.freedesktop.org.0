Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDF3EFDCA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052CB6E455;
	Wed, 18 Aug 2021 07:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F596E455
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:30:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id u1so1001641wmm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 00:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K37RpQgduGf6cvmEt6AB4pJkqE0MT/cYTaC8+8kynqA=;
 b=dqsQq2hENrvqT9BzV9h+2JDiHZaXdqk9meXJ3RKVdZXt2BBomSy/5iaukTOyTlsDvh
 B4cMimHPA093CA6ruHFYQmeYpeX9/nWHEp7hejYQ6VqnNSAvSTqz0qVNS4G/M7bIhAWm
 DhYTRuaDxHvWSaaOd8j3bbZP9ZMJtnJ3fj274Ll0FfD0xIeYSHgcUwnwDydgWL7K9el4
 OrrQYDUrVjhphQCZ7y8MBB2W6OdCIaYbMmcrYL/60Tzbqhrc0VXPdeUF5fBGBxn2iYL4
 xR/2kgPuAF2yPsa/okCaXnjwUZRYloBYRvIhZOzxOZuFyZXKST1CWR6CDgvn8+c8h8kC
 K54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K37RpQgduGf6cvmEt6AB4pJkqE0MT/cYTaC8+8kynqA=;
 b=l3Pjmm860f/fZxCVeFmDp7VCzRRjYqsmAkU4UyRwB5K8X+6XGILkVLQMVgfdpO6eti
 eZBrnM4en9bEKSqbr8aCjnj6bG9Yem5NDMjiaxWMWZwZ1BqVqZMxk8xdgqslU5+i599t
 zBM3Nd0qz2lpqqPbg9mNvaFkg+d9tMVy56g66jC6t83A6ANC3zwEvjvFmfuYihccgUUq
 9Kzbgnb3RCeNd01cl2T9mLxL6jFEAlpVFtOAWgq4dwnNNFFCL0OPZb1lqy3gj0ZVg+kR
 pdXSC4IW3FSNLXNviS1EjAIP0ccxlja9ngKOqXloy8szv8KaFLUrCq+rprsSjpvPlU/n
 WaZg==
X-Gm-Message-State: AOAM53287Qm5Q6ajKPbOtC2M5vkK/4J5HFXZ7wDfC3IvLEHTYexNekY0
 dlzSXvJcjc11QX75875xemI61w==
X-Google-Smtp-Source: ABdhPJwG7UtHarbunzYv3llbcStKNeNfIbWFPioQ43OD0/LSFnX9kWS6tw3mWTmKtG7K1ZBNhcTsaQ==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr7021633wmi.77.1629271838448; 
 Wed, 18 Aug 2021 00:30:38 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id l2sm4277221wme.28.2021.08.18.00.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:30:38 -0700 (PDT)
Date: Wed, 18 Aug 2021 09:30:37 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/5] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Message-ID: <20210818073037.apmh2cf5hxhya6vo@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-2-msp@baylibre.com>
 <1629261946.11678.5.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629261946.11678.5.camel@mtksdaap41>
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

Hi,

On Wed, Aug 18, 2021 at 12:45:46PM +0800, CK Hu wrote:
> Hi, Markus:
> 
> On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> > DP_INTF is similar to the actual dpi. They differ in some points
> > regarding registers and what needs to be set but the function blocks
> > itself are similar in design.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  .../display/mediatek/mediatek,dpi.yaml        | 48 ++++++++++++++++---
> >  1 file changed, 42 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index dd2896a40ff0..de4bdacd83ac 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -4,7 +4,7 @@
> >  $id: https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml*__;Iw!!CTRNKA9wMg0ARbw!z5TyPvbq3ZLHjRPscOHigUMlikjhtJMFrEQqemcjQZa4NaXBE9tzMnDFMa1qYg$ 
> >  $schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!z5TyPvbq3ZLHjRPscOHigUMlikjhtJMFrEQqemcjQZa4NaXBE9tzMnAjuBCxsg$ 
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
> 
> I've reviewed the modification in driver, it seems that dpintf is almost
> the same as dpi. Why use the name "dpintf"? I could accept this name
> only it's defined by hardware data sheet.

Yes the data sheet makes a distinction between DPI and DP_INTF. mt8195
has a DPI unit as well. DP_INTF has a slightly different feature set and
also uses slightly different register bits.

Best,
Markus

> 
> Regards,
> CK
> 
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
> > +      For dpi clocks pixel, engine and pll are required. For dpintf pixel, pll,
> > +      pll_d2, pll_d4, pll_d8, pll_d16, hf_fmm, hf_fdp are required.
> > +    minItems: 3
> > +    maxItems: 8
> >  
> >    pinctrl-0: true
> >    pinctrl-1: true
> > @@ -64,6 +67,39 @@ required:
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
> > +          minItems: 8
> > +          maxItems: 8
> > +        clock-names:
> > +          items:
> > +            - const: pixel
> > +            - const: pll
> > +            - const: pll_d2
> > +            - const: pll_d4
> > +            - const: pll_d8
> > +            - const: pll_d16
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
> 
