Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E85439E9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 19:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6A1129EF;
	Wed,  8 Jun 2022 17:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46291129EF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 17:08:15 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id y196so18863747pfb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WF0RJla2oohMUn0MJv8rKYykIuR4lAmipthSFfnmiVU=;
 b=ljLJW0sL8NMXgQOt9f+zRCmJO50/PXowFcD4/QA46kqBPGof6uWEKlImxcs74TyV6z
 ugR7xf1sjKW23f+3OUb+SNoGJLZb/n2XEgdiJ85CN9nWx+EbNzqFJv7V+jBeIY5drPjC
 DOQsGx5dB3xTghvaIYzNBgRb/ogigexSYAx34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WF0RJla2oohMUn0MJv8rKYykIuR4lAmipthSFfnmiVU=;
 b=6k8/n4UW9HywQPJ9zwr/SXxrkgaffHeozmyWzYdoNws81H45K+fuRtpWrcHBVgiB9e
 ZkRVR2DGdvP6iVVbjhYWKypi0HUUpEAscJx6dCo/cHAuwZaJHXF1LmOqnPMKheS+yqHz
 z+bfs6oVmZs9RU3wiaPsWo2tTaQI8fp7kvZ5xtbT3ZzLiP8CacCD/LT8KMhGoMtSpc9t
 JeVUeG0weFpyj6gNzX+DNZ4e+OApbJfEe5I6i58qAoq4jmHDmlUHdaw1+4l+bHnKMfia
 a60OyUNAJJcAvFvIrs9vJg13OgNBQz0BP6VbXmRv9vMHGjfVduxUvQdpvGzJrS1tOXyZ
 OpUw==
X-Gm-Message-State: AOAM532h6+RKDF23WRY7MxBHD5YD0OV/yLdEZJpwI/4XvaVJR697NhUK
 cdD4Py7AAZnKxcQg/QPlhFnMTA==
X-Google-Smtp-Source: ABdhPJy/e3J9zrHD59CzKJz+zzlVENMog9HQc2BMCmxEhETwD0FomiEyVUlscJH5sJcpsdfkzRRVfw==
X-Received: by 2002:a63:f14a:0:b0:3fd:d2aa:6b30 with SMTP id
 o10-20020a63f14a000000b003fdd2aa6b30mr12839836pgk.348.1654708095078; 
 Wed, 08 Jun 2022 10:08:15 -0700 (PDT)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 d2-20020a630e02000000b003fa95b940bdsm15361474pgl.88.2022.06.08.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 10:08:14 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:08:12 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Message-ID: <YqDXfGa9bugnLFGH@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-5-pmalani@chromium.org>
 <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thank you for looking at the patch.

On Jun 08 11:24, Krzysztof Kozlowski wrote:
> On 07/06/2022 21:00, Prashant Malani wrote:
> > Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> > alternate mode lane traffic between 2 Type-C ports.
> > 
> > Update the binding to accommodate this usage by introducing a switch
> > property.
> > 
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 35a48515836e..7e1f655ddfcc 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -105,6 +105,26 @@ properties:
> >        - port@0
> >        - port@1
> >  
> > +  switches:
> > +    type: object
> > +    description: Set of switches controlling DisplayPort traffic on
> > +      outgoing RX/TX lanes to Type C ports.
> > +
> > +    properties:
> > +      switch:
> 
> You allow only one switch with such schema, so no need for "switches"...

See below comment (summary: we'd like to allow 1 or 2 switches).
> 
> > +        $ref: /schemas/usb/typec-switch.yaml#
> > +        maxItems: 2
> 
> Are you sure this works? what are you limiting here with maxItems? I
> think you wanted patternProperties...

Yeah, I might not have used the DT syntax correctly here.
What I'm aiming for is:
"switches" should can contain 1 or 2 "switch" nodes.
2 is the maximum (limitation of the hardware).

> 
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - switch@0
> 
> This does not match the property.
> 
> You also need unevaluatedProperties:false

Ack, will update this in the next version.

> 
> 
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -167,5 +187,41 @@ examples:
> >                      };
> >                  };
> >              };
> > +            switches {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                switch@0 {
> > +                    compatible = "typec-switch";
> > +                    reg = <0>;
> > +                    mode-switch;
> > +
> > +                    ports {
> > +                        #address-cells = <1>;
> > +                        #size-cells = <0>;
> > +                        port@0 {
> > +                            reg = <0>;
> > +                            anx_typec0: endpoint {
> > +                              remote-endpoint = <&typec_port0>;
> 
> Messed up indentation. Your previous patch should also switch to 4-space
> as recommended by schema coding style.

Sorry about that, will fix up the indentation in the next version.

> 
> > +                            };
> > +                        };
> > +                    };
> > +                };
> > +                switch@1 {
> > +                    compatible = "typec-switch";
> > +                    reg = <1>;
> > +                    mode-switch;
> > +
> > +                    ports {
> > +                        #address-cells = <1>;
> > +                        #size-cells = <0>;
> > +                        port@0 {
> > +                            reg = <0>;
> > +                            anx_typec1: endpoint {
> > +                              remote-endpoint = <&typec_port1>;
> 
> Ditto.
> 
> > +                            };
> > +                        };
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> 
> 
> Best regards,
> Krzysztof
