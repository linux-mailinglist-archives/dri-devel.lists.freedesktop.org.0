Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DE53662EB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 02:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063AF6E91F;
	Wed, 21 Apr 2021 00:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6369F6E91F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 00:11:36 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id g24so1565667uak.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nr8WfPTD0ymzHIbs2kjYSoWUK3mdmT/dSasQxodVNi4=;
 b=GI0ovTiZqm8iMDijT4AKKjtlbOiJDgwVXdcalz+E7xX62mEZJ37VWi/mWslqbVug/r
 HTOUNI+5vJnyoE73eJbkyqOggquJwm2Loj79niLY//q6M1JrIAk+Mn3llXaADlbTjTxk
 gXyqJcylyjURRI7oYreUxNV7uQgdWHUO/ZYeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nr8WfPTD0ymzHIbs2kjYSoWUK3mdmT/dSasQxodVNi4=;
 b=B6DbNtG8DYL6W+uMRw1zKrZKGdtld9Ywizqwbe6DHmELVm5aXjU8mCVpxBdXBuuMZj
 gB7kMOr49m3lQJ/4vDTA0TohPObYc9wN0MX+V89N8KuYmcgeeX4KWPg/SnKlEovr6Vt/
 tkr3r8BlDnOaSxKRkIAKT70oAtqALrQ2WN7WHc4qbUmJvQeYpWeZ2OqntBrPOixUzeyX
 JfZpNjRM1vN4lzaFC2r1spRQNVGdxEnTl+fLEktb49a7p4ONUCf8zx2b785W8FwNP5Ns
 eBIJqmZ1Co566+XtIAltiKjvJsu1zzNkuYDbfHarEtixN3SBCPtZwC2U4fhyCiAqeHBU
 kH1g==
X-Gm-Message-State: AOAM531W+OQS+Osbl1b+S8oTZpWOzWi5BrUNYWkBlZIHBUACxSxwrYZc
 gt+Rufvl1Osczhnnif8nskVht2HeMckhlOxrniRu/Q==
X-Google-Smtp-Source: ABdhPJxUAnIDoIjMJ4cqmCiIvJa73yvdSkT6+oLpfc5i3QoBtmDV3PFojekJpmrhUyBafr5ivJ6qVjyvOPNT7jFjNAk=
X-Received: by 2002:ab0:380e:: with SMTP id x14mr15131536uav.27.1618963895533; 
 Tue, 20 Apr 2021 17:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <CAL_Jsq+gWm+94zF1XN2KiRYgAZewiDkCk5B5bhLB=M+-HbD=fA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+gWm+94zF1XN2KiRYgAZewiDkCk5B5bhLB=M+-HbD=fA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 21 Apr 2021 08:11:24 +0800
Message-ID: <CANMq1KCNMx4hS02ZFd0NSOwvw3Xaqm13v8aHO6UMP5Nn3_uX-Q@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
To: Rob Herring <robh@kernel.org>
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 9:01 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 25, 2021 at 7:18 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > Changes in v11:
> >  - binding: power-domain-names not power-domainS-names
> >
> > Changes in v10:
> >  - Fix the binding to make sure sram-supply property can be provided.
> >
> > Changes in v9: None
> > Changes in v8: None
> > Changes in v7: None
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >
> > Changes in v3: None
> > Changes in v2: None
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 184492162e7e..3e758f88e2cd 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -17,6 +17,7 @@ properties:
> >      items:
> >        - enum:
> >            - amlogic,meson-g12a-mali
> > +          - mediatek,mt8183-mali
> >            - realtek,rtd1619-mali
> >            - rockchip,px30-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > @@ -41,6 +42,8 @@ properties:
> >
> >    mali-supply: true
> >
> > +  sram-supply: true
> > +
> >    operating-points-v2: true
> >
> >    power-domains:
> > @@ -87,6 +90,31 @@ allOf:
> >      then:
> >        required:
> >          - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8183-mali
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          description:
> > +            List of phandle and PM domain specifier as documented in
> > +            Documentation/devicetree/bindings/power/power_domain.txt
> > +          minItems: 3
> > +          maxItems: 3
>
> This won't work because the top level schema restricts this to 1. The
> top level needs to say:
>
> power-domains:
>   minItems: 1
>   maxItems: 3
>
> And you need just 'minItems: 3' here and 'maxItems: 1' in the else clause.
>
> And drop the description. That's every 'power-domains' property.
>
> > +        power-domain-names:
> > +          items:
> > +            - const: core0
> > +            - const: core1
> > +            - const: core2
>
> Blank line

Thanks, hopefully all fixed in v12.

> > +      required:
> > +        - sram-supply
> > +        - power-domains
> > +        - power-domain-names
> > +    else:
> > +      properties:
> > +        sram-supply: false
> >
> >  examples:
> >    - |
> > --
> > 2.30.0.280.ga3ce27912f-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
