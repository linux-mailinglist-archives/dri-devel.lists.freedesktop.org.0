Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCC5FE298
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 21:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497DC10E943;
	Thu, 13 Oct 2022 19:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB7610E36A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 19:20:17 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1324e7a1284so3438906fac.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 12:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHfuZiPuTw4pNJzvk+reOtyVXJc2qDgE8sjvtsqunIA=;
 b=ze/7QtKFA3oNik6rQsaYSc2fhuvztq7ZpOQbiMJCVAQWt7pcQK5zmaJDYKaVg8iPMr
 OPD3gRhuuMnLXAo2tokjycVHGrY0s6AELQ4WYT/gbsA6YtbcGbDg6n2wYpo3yEcp6ouH
 dQG5ovQk7oRh4ZbsXW3+8eqOXplnNZK2fHTgF+Ag/2lIGzkfoqTfUkQSUGvxecIqbjLG
 4eVgLSGWts2+Zd1P0/9tx0CUBXZiDY2lK5qxNDcEfJ+s0Ln6yuGffD6Sm1BLchViKZYc
 5OrJBUAV9i6eY17bxlvSE7oXg7mOp/zgQydIn3PYc8f7iP7r77a/N4na7pDdykG6fa3C
 NYcA==
X-Gm-Message-State: ACrzQf3lP2UXpjLd4xsFvqFQv7glA0XzzSFqqpssU/e6o2ktInRhgK05
 fK1B7bg7+odmcStmnHeHQg==
X-Google-Smtp-Source: AMsMyM620O7/pFMb3P05EqziVBwdc+OC0+VsssMYve/fHn5KXegVNL+wEkzIHrrLHFC7So7V5q4KnA==
X-Received: by 2002:a05:6870:618e:b0:130:9e9d:650d with SMTP id
 a14-20020a056870618e00b001309e9d650dmr714936oah.109.1665688816240; 
 Thu, 13 Oct 2022 12:20:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a20-20020a544e14000000b00339befdfad0sm187921oiy.50.2022.10.13.12.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 12:20:15 -0700 (PDT)
Received: (nullmailer pid 98235 invoked by uid 1000);
 Thu, 13 Oct 2022 19:20:16 -0000
Date: Thu, 13 Oct 2022 14:20:16 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v4 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Message-ID: <20221013192016.GA95717-robh@kernel.org>
References: <20221013105116.180380-1-allen.chen@ite.com.tw>
 <20221013105116.180380-2-allen.chen@ite.com.tw>
 <Y0fxCVUtlkB4XHIq@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0fxCVUtlkB4XHIq@pendragon.ideasonboard.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 02:05:45PM +0300, Laurent Pinchart wrote:
> Hi Allen,
> 
> Thank you for the patch.
> 
> On Thu, Oct 13, 2022 at 06:51:13PM +0800, allen wrote:
> > From: allen chen <allen.chen@ite.com.tw>
> > 
> > Add properties to restrict dp output data-lanes and clock.
> > 
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> > ---
> >  .../bindings/display/bridge/ite,it6505.yaml   | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index 833d11b2303a7..f2c3d1d10359e 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -52,10 +52,51 @@ properties:
> >      maxItems: 1
> >      description: extcon specifier for the Power Delivery
> >  
> > +  data-lanes:
> > +    oneOf:
> > +      - minItems: 1
> > +        maxItems: 1
> > +        uniqueItems: true
> > +        items:
> > +          enum:
> > +            - 0
> > +            - 1
> > +        description: For one lane operation.
> > +
> > +      - minItems: 2
> > +        maxItems: 2
> > +        uniqueItems: true
> > +        items:
> > +          enum:
> > +            - 0
> > +            - 1
> > +        description: For two lanes operation.
> > +
> > +      - minItems: 4
> > +        maxItems: 4
> > +        uniqueItems: true
> > +        items:
> > +          enum:
> > +            - 0
> > +            - 1
> > +            - 2
> > +            - 3
> > +        description: For four lanes operation.
> 
> The data lanes should be in the output endpoint. If there's no output
> port, one should be added.
> 
> > +
> >    port:
> >      $ref: /schemas/graph.yaml#/properties/port

To fix the error, this must be:

$ref: /schemas/graph.yaml#/$defs/port-base
unevaluatedProperties: false

> >      description: A port node pointing to DPI host port node
> >  
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +
> > +        properties:
> > +          link-frequencies:
> > +            minItems: 1
> > +            maxItems: 1
> > +            description: Allowed max link frequencies in Hz.
> > +
> >  required:
> >    - compatible
> >    - ovdd-supply
> > @@ -84,10 +125,12 @@ examples:
> >              pwr18-supply = <&it6505_pp18_reg>;
> >              reset-gpios = <&pio 179 1>;
> >              extcon = <&usbc_extcon>;
> > +            data-lanes = <0 1>;
> >  
> >              port {
> >                  it6505_in: endpoint {
> >                      remote-endpoint = <&dpi_out>;
> > +                    link-frequencies = /bits/ 64 <150000000>;
> >                  };
> >              };
> >          };
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
