Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70554DDA4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035E1113B53;
	Thu, 16 Jun 2022 08:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913C113B53
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:54:48 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso1138486fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izy7G0Q7eyiWE4CXZRSUEvvAZl4UlL5s+oh9NOxs2Sw=;
 b=kw2JCD+9bg7YOxTxat/3v8ub8VvvKqI0njMJGF+ad+eadhs27fzl9BFeQv7mXrnXFj
 5F0UD7pL4owCnSDf+B/MGtppwdgoOUwI32SrXC9Jnn4hesFB7IpEutH8sv8tadlPdfmz
 /DTD75UVSaR5k7QhtB/F0kiZBN78lRUe7nShw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izy7G0Q7eyiWE4CXZRSUEvvAZl4UlL5s+oh9NOxs2Sw=;
 b=xE5MdDs38GCc4axegijcM+IF0+eHzCsEQi37KPZTiHTQYSt0qRZhBJMvqNGWdIRL0W
 us0y7luLbiCeNPIVDzm9kEGBRGAcbXQwNUu0wDGIgoIiqKVf4CDluftywyBuN3t4I/th
 IH/Y9Aj5nWOVsj0HLPLaXMnSIfi5i+nvD9lbF7SoiiQM6TkEkNO+GTIp9xjLxcDNXAcK
 3e2zWF+hcHZzaIRitZjqxIQXTmI89Ef2eIJEeklhvVGO65WAmAD7I2VZeeK8DjvShyhe
 W0acQBeqXI0LyGzxm7VR8ytfLWkr0oZIChIcZ8dFZGucs2D9hQl7ji5LowtRyPEs7gjJ
 I71w==
X-Gm-Message-State: AJIora8K423nJV2YZL0kiYGAwiCT0vFfIkSeI1b+UEOLeC/18XylRyQG
 QKBQOrSz2nj8R9gk+0peLrZ64G475Km5cSGO90BEVQ==
X-Google-Smtp-Source: AGRyM1uhUYcMtitQM4jJdfNJolzBnGTLonEqSwWIHXrtDX+cR8z8UZIQ6lZPZgUYmrTcIOcE9GdejlAEnbggRsGmtDk=
X-Received: by 2002:a05:6870:891f:b0:e1:ec98:3c59 with SMTP id
 i31-20020a056870891f00b000e1ec983c59mr2102642oao.295.1655369687319; Thu, 16
 Jun 2022 01:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <20220615172129.1314056-5-pmalani@chromium.org>
 <CAE-0n53ub30HXB325wPoMB4C3n4j_9FWnNu5AmtYgU3PBvs8mQ@mail.gmail.com>
In-Reply-To: <CAE-0n53ub30HXB325wPoMB4C3n4j_9FWnNu5AmtYgU3PBvs8mQ@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 16 Jun 2022 01:54:36 -0700
Message-ID: <CACeCKadSCXZo3E4JZiwxFn_4CH3KDfQkk=xRrxSqCEWAgYhV6Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 12:42 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-15 10:20:20)
> >
> >  .../display/bridge/analogix,anx7625.yaml      | 64 +++++++++++++++++++
> >  1 file changed, 64 insertions(+)
>
> Can this file get a link to the product brief[1]? It helps to quickly
> find the block diagram.

Sure, but I don't really think that should be included in this patch
(or series).
I'd be happy to submit a separate patch once this series is resolved.

>
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 35a48515836e..bc6f7644db31 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -105,6 +105,34 @@ properties:
> >        - port@0
> >        - port@1
> >
> > +  switches:
> > +    type: object
> > +    description: Set of switches controlling DisplayPort traffic on
> > +      outgoing RX/TX lanes to Type C ports.
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^switch@[01]$':
> > +        $ref: /schemas/usb/typec-switch.yaml#
> > +        unevaluatedProperties: false
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
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -167,5 +195,41 @@ examples:
> >                      };
> >                  };
> >              };
> > +            switches {
>
> Is "switches" a bus?

No.

>
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                switch@0 {
> > +                    compatible = "typec-switch";
>
> Is this compatible matched against a driver that's populated on this
> "switches" bus?

No. Patch 6/7 has the implementation details on how the anx driver
performs the enumeration of switches.

>
> > +                    reg = <0>;
> > +                    mode-switch;
> > +
> > +                    ports {
> > +                        #address-cells = <1>;
> > +                        #size-cells = <0>;
> > +                        port@0 {
> > +                            reg = <0>;
> > +                            anx_typec0: endpoint {
> > +                                remote-endpoint = <&typec_port0>;
> > +                            };
> > +                        };
> > +                    };
>
> I was expecting to see these simply be more ports in the existing graph
> binding of this device, and then have the 'mode-switch' or
> 'orientation-switch' properties be at the same level as the compatible
> string "analogix,anx7625". Here's the reasoning, based on looking at the
> product brief and the existing binding/implementation.
>
> Looking at the only existing implementation of this binding upstream in
> mt8183-kukui-jacuzzi.dtsi it looks like one of these typec ports is
> actually the same physically as the 'anx7625_out' endpoint (reg address
> of 1) that is already defined in the binding. It seems that MIPI DSI/DPI
> comes in and is output through 2 lanes, SSRX2 and SSTX2 according to the
> product brief[1], and that is connected to some eDP panel
> ("auo,b116xw03"). Presumably that is the same as anx_typec1 in this
> patch? I suspect the USB3.1 input is not connected on this board, and
> thus the crosspoint switch is never used, nor the SSRX1/SSTX1 pins.
>
> The existing binding defines the MIPI DSI/DPI input as port0 and two of
> the four lanes of output that is probably by default connected to the
> "DisplayPort Transmitter" as port1 because that's how the crosspoint
> switch comes out of reset. That leaves the USB3.1 input possibly needing
> a port in the ports binding, and the other two lanes of output needing a
> port in the ports binding to describe their connection to the downstream
> device. And finally information about if the crosspoint switch needs to
> be registered with the typec framework to do typec things, which can be
> achieved by the presence of the 'mode-switch' property.
>
> On a board like kukui-jacuzzi these new properties and ports wouldn't be
> specified, because what is there is already sufficient. If this chip is
> connected to a usb-c-connector then I'd expect to see a connection from
> the output ports in the graph binding to the connector node's ports.
> There aren't any ports in the usb-c-connector binding though from what I
> see.
>
> I believe there's also one more use case here where USB3.1 or MIPI
> DSI/DPI is connected on the input side and this device is used to steer
> USB3.1 or DP through the crosspoint switch to either of the two output
> pairs. This last scenario means that we have to describe both output
> pairs, SSRX1/SSTX1 and SSRX2/SSTX2, as different ports in the binding so
> they can be connected to different usb-c-connectors if the hardware
> engineer wired the output pins that way.
>
> TL;DR: Can we add 'mode-switch' as an optional property and two more
> ports at address 2 and 3 for the USB3.1 input and the SSRX1/SSTX1 pair
> respectively to the existing graph part of this binding?

Sorry, but I got lost midway through the preceding explanation. The binding
can always add additional ports to each "switch" to accomplish the
graph connections
you are alluding to (if the driver needs/uses it, which I don't think
this one does at present).

Adding extra ports to existing ports gets tricky from a mode-switch
enumeration perspective (which
ports should have the modes switches, which shouldn't? Do you follow
the remote end points for each port
and see which one is a Type C connector? What if we add an
intermediate switch device in the future?)
Having a dedicated "switch" binding makes this consistent and easy
(port0 will always have the end-point for the switch).

While there may be more than 1 valid approach here, I believe the
current one is appropriate.

>
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
> > +                                remote-endpoint = <&typec_port1>;
> > +                            };
> > +                        };
> > +                    };
> > +                };
> > +            };
> >          };
>
> [1] https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
