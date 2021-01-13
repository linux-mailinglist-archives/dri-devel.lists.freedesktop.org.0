Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B871D2F4435
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 06:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665889D4F;
	Wed, 13 Jan 2021 05:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE27589D4F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 05:59:38 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id i25so353500uat.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 21:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uflk09hDM8jdt4VETF4zx5oJUWKH+szab3bAtMaySZM=;
 b=V3XzRVPHSN8FFVcOv8s7cpuEkmtlGkiiHwAJaarEz7yvvOdfJhsgwyKvQTQNg2o7ZL
 V/GK4fj9ALPENfCozfr27V58sVnrLv/ZmwzCHf2X68mFcnMuUdhY46ER2c0BLdYLtUly
 AqfsKcS4XhbLMY3ZWLO+Vk8IPH2OooUGZr9lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uflk09hDM8jdt4VETF4zx5oJUWKH+szab3bAtMaySZM=;
 b=n3RIl1cvHjb1rNirGIMEDLpTd7aX3ct+wEJR39mUKmr/8T8x6naH3sBH0ejxn3moDf
 bSMzh5keiL9M+KkEN2KfuzBMqcyf+hrJcqhHP95FYmQVjp4ZVJLUDaSU+aSeCCAKSiC5
 FPsqKw71INhs8+uJneyTM1LHTDBa+AzHAFVAwXnJvqNvr9OQ6/LCl0MrGHO0q3EM+rBx
 i3bszXEzpqa8RJGsvW9LcIZYvWK4jyvhd+FwU08M1MDXqY97KCQUaizfhMmZ/RYaTlaf
 mrUECZIXn9+zX++PwmfCHNlRldSjN1modKe8pMkP1g28TfbX98QumezxvcWhibIZiV1n
 BqZg==
X-Gm-Message-State: AOAM532cMM5BF6DZfLmFOjN5XQLnwJvr8Igt9bg9WpEvCNgE3hfmx9Rw
 cylZLI7mjZK39fGzR71km/zVZGaP8NkAKmO3Idp5tQ==
X-Google-Smtp-Source: ABdhPJxUOJXjPKGrSYhZlqGURvTegd9S+519z9w10z9Cg+aIQfHXMgodScbQmK240/7XPSZwmWdqBfZO5TB6vzygsss=
X-Received: by 2002:ab0:74d2:: with SMTP id f18mr516697uaq.48.1610517577824;
 Tue, 12 Jan 2021 21:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20210108011011.4061575-1-drinkcat@chromium.org>
 <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <20210112150726.GA330364@robh.at.kernel.org>
In-Reply-To: <20210112150726.GA330364@robh.at.kernel.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 13 Jan 2021 13:59:26 +0800
Message-ID: <CANMq1KAY+KgXGNaVttESfW+1m3Daec6B-GqHgRW0gdFmOGf=qA@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
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
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 11:07 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 08, 2021 at 09:10:08AM +0800, Nicolas Boichat wrote:
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > ---
> >
> > (no changes since v6)
> >
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >  - No change
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >
> > Changes in v3:
> >  - No change
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 184492162e7e..71b613ee5bd7 100644
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
> > @@ -87,6 +88,30 @@ allOf:
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
> > +        sram-supply: true
>
> This has to be defined at the top-level or there will be an error when
> it is present (due to additionalProperties).
>
> In this if/then you can do:
>
> else:
>   sram-supply: false
>
> to disallow it if not 'mediatek,mt8183-mali'

I see. Thanks Rob, will send a v10.



>
> > +        power-domains:
> > +          description:
> > +            List of phandle and PM domain specifier as documented in
> > +            Documentation/devicetree/bindings/power/power_domain.txt
> > +          minItems: 3
> > +          maxItems: 3
> > +        power-domain-names:
> > +          items:
> > +            - const: core0
> > +            - const: core1
> > +            - const: core2
> > +
> > +      required:
> > +        - sram-supply
> > +        - power-domains
> > +        - power-domains-names
> >
> >  examples:
> >    - |
> > --
> > 2.29.2.729.g45daf8777d-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
