Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0D558B9A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 01:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336E210E03C;
	Thu, 23 Jun 2022 23:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E9610E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 23:14:47 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso1488361fac.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 16:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=u2JKqHVyLSRZBXOkaIltewzMrD4pEO849tuySbHDpwc=;
 b=ThCoMRZVlzD3JZVM5bQQPX5vhiupuoW4v/3wdvco6scQqVAZitzrddJfdkyplTyehS
 JZ9k9G7cKpXJ/MFoQT6dYLK4JpoYjT15t00LJpVSVZybSphePavVdLh80M5BW8KApsg2
 IFawMA9OkxkM3dk/SZcOeeDwiYToFJUww13y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=u2JKqHVyLSRZBXOkaIltewzMrD4pEO849tuySbHDpwc=;
 b=icURwp8p0tnz9HJCV8T7UspjMaKhSmi1Pz/NreN6vK4YDhmoqLECsxi9t/O/he8Gsu
 h6Zq49oDtLRrbknBXftE0tWymMU4MA6aABCSHKWq7IALSyBiel7lACtavEVdFaNQsJ8s
 +w40W/8MDv1vTxCSbFapwBqzOMGF0+esfxOzP8ltZvSYxUWh8aPrC5we9VcGRcYjvgyn
 QOZORaaSzvqgR/fFYsDxuhiRtJi7SKZRBDEj9P4sMDWaAcX9B1Ms6xeABWCxghX0zGve
 D8rMa15mLn4wqw/aMETG6sglU5ZRGv0iw8PZwAyazvRWRYGMIyhY9M6nzBtxi81POJps
 1/NQ==
X-Gm-Message-State: AJIora9QfjG3sVM8CVD0V0yCY1vBR71Y5DAqMfcpZ0p6I+JFf/Ws9G/K
 US5sX3cm1gJ47jL9UK1fx6IhF8cBo/UsmnNSAb66OA==
X-Google-Smtp-Source: AGRyM1vGcj9wdhnXfYcW15SE2elwZofl+K6gam8C4ktPrjNMjEUlSOW18Z8GsUBiy0N2iC9aY8GH6El/ZS/RoeZfOmI=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr227480oab.193.1656026086919; Thu, 23
 Jun 2022 16:14:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 16:14:46 -0700
MIME-Version: 1.0
In-Reply-To: <CACeCKac4eL9++QwbDBKrVTpUzhes=WczqZfh+cFiVgoO4py4MQ@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
 <CACeCKac4eL9++QwbDBKrVTpUzhes=WczqZfh+cFiVgoO4py4MQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 Jun 2022 16:14:46 -0700
Message-ID: <CAE-0n51E1TLMRNWnqiV-jU_qg15BF4D6A+0G1y1SRTu1zNs2Dg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To: Prashant Malani <pmalani@chromium.org>
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
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-23 12:08:21)
> On Thu, Jun 23, 2022 at 11:30 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-22 10:34:30)
> > > diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > new file mode 100644
> > > index 000000000000..78b0190c8543
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > @@ -0,0 +1,74 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
[...]
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description: OF graph binding modelling data lines to the Type-C switch.
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Link between the switch and a Type-C connector.
> >
> > Is there an update to the usb-c-connector binding to accept this port
> > connection?
>
> Not at this time. I don't think we should enforce that either.
> (Type-C data-lines could theoretically be routed through intermediate
> hardware like retimers/repeaters)

I'm mostly wondering if having such a connection to the usb-c-connector,
or even through some retimer/repeater, would be sufficient to detect how
many type-c ports are connected to the device. If the type-c pin
assignments only support two or four lanes for DP then it seems like we
should describe the two lanes or four lanes as one graph endpoint
"output" and then have some 'data-lanes' property in case the DP lanes
are flipped while being sent to the retimer or usb-c-connector. This
would of course depend on the capability of the device, i.e. if it can
remap DP lanes or only has 2 lanes of DP, etc.

> > > +  - |
> > > +    drm-bridge {
> > > +        usb-switch {
> > > +            compatible = "typec-switch";
> >
> > I still don't understand the subnode design here. usb-switch as a
> > container node indicates to me that this is a bus, but in earlier rounds
> > of this series it was stated this isn't a bus.
>
> I am not aware of this as a requirement. Can you please point me to the
> documentation that states this needs to be the case?

I'm not aware of any documentation for the dos and don'ts here. Are
there any examples in the bindings directory that split up a device into
subnodes that isn't in bindings/mfd? I just know from experience that
any time I try to make a child node of an existing node that I'm
supposed to be describing a bus, unless I'm adding some sort of
exception node like a graph binding or an opp table. Typically a node
corresponds 1:1 with a device in the kernel. I'll defer to Rob for any
citations.

>
> > Why doesn't it work to
> > merge everything inside usb-switch directly into the drm-bridge node?
>
> I attempted to explain the rationale in the previous version [1], but
> using a dedicated sub-node means the driver doesn't haven't to
> inspect individual ports to determine which of them need switches
> registered for them. If it sees a `typec-switch`, it registers a
> mode-switch and/or orientation-switch. IMO it simplifies the hardware
> device binding too.

How is that any harder than hard-coding that detail into the driver
about which port and endpoint is possibly connected to the
usb-c-connector (or retimer)? All of that logic could be behind some API
that registers a typec-switch based on a graph port number that's passed
in, ala drm_of_find_panel_or_bridge()'s design.

Coming from a DT writer's perspective, I just want to go through the
list of output pins in the datasheet and match them up to the ports
binding for this device. If it's a pure DP bridge, where USB hardware
isn't an input or an output like the ITE chip, then I don't want to have
to describe a port graph binding for the case when it's connected to a
dp-connector (see dp-connector.yaml) in the top-level node and then have
to make an entirely different subnode for the usb-c-connector case with
a whole other set of graph ports.

How would I even know which two differential pairs correspond to port0
or port1 in this binding in the ITE case? Ideally we make the graph
binding more strict for devices by enforcing that their graph ports
exist. Otherwise we're not fully describing the connections between
devices and our dtb checkers are going to let things through where the
driver most likely will fail because it can't figure out what to do,
e.g. display DP on 4 lanes or play some DP lane rerouting games to act
as a mux.

>
> It also maps with the internal block diagram for these hardware
> components (for ex. the anx7625 crosspoint switch is a separate
> sub-block within anx7625).

We don't make DT bindings for sub-components like this very often. It
would make more sense to me to have a subnode if a typec switch was some
sort of off the shelf hard macro that the hardware engineer placed down
inside the IC that they delivered. Then we could have a completely
generic driver that binds to the generic binding that knows how to drive
the hardware, because it's an unchangeable hard macro with a well
defined programming interface.

>
> [1] https://lore.kernel.org/linux-usb/CACeCKaeH6qTTdG_huC4yw0xxG8TYEOtfPW3tiVNwYs=P4QVPXg@mail.gmail.com/

I looked at the fsa4480 driver and the device has a publicly available
datasheet[2]. That device is designed for "audio accessory mode" but I
guess it's being used to simply mux SBU lines? There isn't an upstream
user of the binding so far, but it also doesn't look like a complete
binding. I'd expect to see DN_L/R as a graph output connected to the
usb-c-connector and probably have a usb2.0 input port and a 'sound-dai'
property to represent the input audio path.

Finally, simply connecting to the typec controller node isn't sufficient
because a typec controller can be controlling many usb-c-connectors so I
don't see how the graph binding would be able to figure out how many
usb-c-connectors are connected to a mux like device, unless we took the
approach of this patch. Is that why you're proposing this binding? To
avoid describing a graph binding in the usb-c-connector and effectively
"pushing" the port count up to the mux?

[2] https://www.onsemi.com/pdf/datasheet/fsa4480-d.pdf
