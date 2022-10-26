Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1141160DA26
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 06:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7673D10E24D;
	Wed, 26 Oct 2022 04:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32F910E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 04:03:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v27so17249412eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 21:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2uOlcqyDGSB4FINYNMxtwAMo4ngxfOnBT6eemWeFWJ4=;
 b=EW9EpFTccPDUI0/2LEeGkX3N0u5lqQu2IUx8wDKOUeqskFQ4tz3dOIwmqhUMbCmBES
 wiFEgbHsQt8NVCcTxbIlUhhxGs/mSxBYq4BV5bzLp/meVmX/R2W6Q34qdGsfkrxVa3Iv
 EFBY+Mm59uimY2pz0lkIxYIlEDCTxGSWm77oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2uOlcqyDGSB4FINYNMxtwAMo4ngxfOnBT6eemWeFWJ4=;
 b=x9bM8J3xm0YUfJfEEI80rT7e3JQuwBOOMQKXv8J+8HSYK2eUN7fRMGWHh/r4wh/V9i
 Ee6a8/iDdKlFbXA2bttxpIsFuSJobNIfFozuHa3OvW7n3gVGo58E3D5MJ2iFkd7EKKxh
 xfJ3a7xaaDBHzhR8srDplDwHpGW0uMKciT3ta+nnT9CVBo/lc1QYh8PdDxBex4V9hhyK
 aiaQIEsUfaTTJBnHvlAmrwpycDV9zP0L/cwRcV1Rj4zNYme/EzQ5Oe9WiHc1vDhXw0Mk
 l0Aki2HQ+1aRc7v9m5tXHYvRm0apwpFo2zVS2goR6NOATlN9z0C7gEibwjgAg2vedwo+
 a65A==
X-Gm-Message-State: ACrzQf2hoa+OnIheMNhu/6PBlkWlO9pGOsfgI+BrSvylOq0zo3OEltdW
 C7/JYS1MNGJ7UE3B3r7HTc7bM7VPs3MHv5/O0bXA2A==
X-Google-Smtp-Source: AMsMyM72JkPtZUBNDSOZ7vAWrHE+Q6xEgcuOJDPIOW7eeHJAyW+j5W/LFwfUClpE53jDCvSgE+EJiU/tu1YGTZD6fFo=
X-Received: by 2002:a05:6402:b0e:b0:461:f7a8:3e3a with SMTP id
 bm14-20020a0564020b0e00b00461f7a83e3amr8968352edb.372.1666756993340; Tue, 25
 Oct 2022 21:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221019093215.8204-1-allen.chen@ite.com.tw>
 <20221019093215.8204-2-allen.chen@ite.com.tw>
 <20221024163748.GA1874793-robh@kernel.org>
In-Reply-To: <20221024163748.GA1874793-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 26 Oct 2022 12:03:02 +0800
Message-ID: <CAEXTbpfpmAAaXOEkirMtuSJLopv-Us6w-46oE+GSxXiMGU-ZfQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
To: allen <allen.chen@ite.com.tw>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen,

On Tue, Oct 25, 2022 at 12:37 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 19, 2022 at 05:32:13PM +0800, allen wrote:
> > From: allen chen <allen.chen@ite.com.tw>
> >
> > Add properties to restrict dp output data-lanes and clock.
> >
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > ---
> >  .../bindings/display/bridge/ite,it6505.yaml   | 89 +++++++++++++++++--
> >  1 file changed, 83 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index 833d11b2303a7..8e607b6929fc9 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -52,9 +52,70 @@ properties:
> >      maxItems: 1
> >      description: extcon specifier for the Power Delivery
> >
> > -  port:
> > -    $ref: /schemas/graph.yaml#/properties/port
> > -    description: A port node pointing to DPI host port node
>
> No existing users you are breaking? The commit msg should explain.
>
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: A port node pointing to DPI host port node
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              link-frequencies:
> > +                minItems: 1
> > +                maxItems: 1
> > +                description: Allowed max link frequencies in Hz
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Video port for DP output
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                oneOf:
> > +                  - minItems: 1
> > +                    maxItems: 1
> > +                    uniqueItems: true
> > +                    items:
> > +                      enum:
> > +                        - 0
> > +                        - 1
> > +                    description: For one lane operation.
> > +
> > +                  - minItems: 2
> > +                    maxItems: 2
> > +                    uniqueItems: true
> > +                    items:
> > +                      enum:
> > +                        - 0
> > +                        - 1
> > +                    description: For two lanes operation.
> > +
> > +                  - minItems: 4
> > +                    maxItems: 4
> > +                    uniqueItems: true
> > +                    items:
> > +                      enum:
> > +                        - 0
> > +                        - 1
> > +                        - 2
> > +                        - 3
> > +                    description: For four lanes operation.
>
> I would do just:
>
> data-lanes:
>   minItems: 1
>   items:
>     - enum: [ 0, 1 ]
>     - const: 1
>     - const: 2
>     - const: 3

I believe we also want a `uniqueItems: true` to prevent duplicate
items like `<1 1>`.

Regards,
Pin-yen

>
> It does allow 3 lanes, but I don't think that's a big deal. What it does
> doesn't allow is any order and yours does.
>
> Rob
