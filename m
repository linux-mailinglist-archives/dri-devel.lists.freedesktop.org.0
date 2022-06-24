Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB72558CC4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 03:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13C10E25A;
	Fri, 24 Jun 2022 01:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716F610E25A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 01:24:14 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id u9so2070540ybq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 18:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10PmzWCyUBI5Vfce1rbhp0nN4ZOkA3OYApu3p4Z3wDQ=;
 b=glXeRVHVfV8WrwBqJ/kMZnqq8X5UeIcwOsiFsj/kz7g3p9ZhnG8+7rYmkC4Ooh8CoD
 H2ZxY3SNaBMWVW1hTeMEGJiRLySNetp6ZqokKzzuE+/3PiJro+eTVWkGtMnExLj35OJs
 zcso9bW6vOY8KzWSW9Oetg7R7bOFMcqDtfmfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10PmzWCyUBI5Vfce1rbhp0nN4ZOkA3OYApu3p4Z3wDQ=;
 b=j1D02ruje8n7LnD5qx67h5QCmXs0yC32ZvTvfqZbySqTPdvRLpt4TJkHkzsJ5JqO2X
 XoVJq2In85Is7W4ByeMuW4wAdWLe0VesDx5RMih/3mVTyP2/SbttKemp+eLgXrb2X2WB
 dhmXhKbXy44e4h9LePcQxN3mIKAl7yLvj4X2T8sP5Ss4nt+1cERwcbdReotHSjcQWlKu
 rGL9qXEtc+FuRXmtt4dFSz0xMLhxpaS2fm7NJNQUo2Cn3hTcvVQgKwadO0LGf+n9DVTG
 ZrNwbs9E8uDE/6ZlUYIPer2jCFxGlPah6/R/opmq4OGwOXEdfYTQQ6ZiB26r9HfUvaiS
 Ak2g==
X-Gm-Message-State: AJIora9mhcabcQ9G1BMaukt5VrrvCA8rqEOebmCnaPU3f2v9BZZEJblq
 jcLvHA1RemozSavuGrl4qFsAQZJB7pionUgEJ7Mmew==
X-Google-Smtp-Source: AGRyM1uzGBk9nFl76gEcXxNwEdLIRcnWpYTQHhBodEuO9ylyG3VAyW/StyEf8ihoveC1W4ma6tvIzZhoSPWESvWOAUs=
X-Received: by 2002:a25:f30b:0:b0:669:9f30:7c84 with SMTP id
 c11-20020a25f30b000000b006699f307c84mr9265199ybs.240.1656033853604; Thu, 23
 Jun 2022 18:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
 <CACeCKac4eL9++QwbDBKrVTpUzhes=WczqZfh+cFiVgoO4py4MQ@mail.gmail.com>
 <CAE-0n51E1TLMRNWnqiV-jU_qg15BF4D6A+0G1y1SRTu1zNs2Dg@mail.gmail.com>
 <CACeCKacGZFY-_yn1R33OVcsdG47oqNTGBA43L5hrH2zyhK=cRw@mail.gmail.com>
In-Reply-To: <CACeCKacGZFY-_yn1R33OVcsdG47oqNTGBA43L5hrH2zyhK=cRw@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 23 Jun 2022 18:24:02 -0700
Message-ID: <CACeCKaessEPP+aPmwuF8C74hgOFQyc5YFJ_cWqLvQSzXLWaqVg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
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

On Thu, Jun 23, 2022 at 5:35 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> On Thu, Jun 23, 2022 at 4:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-23 12:08:21)
> > > On Thu, Jun 23, 2022 at 11:30 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Prashant Malani (2022-06-22 10:34:30)
> > > > > diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..78b0190c8543
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > > > @@ -0,0 +1,74 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > [...]
> > > > > +  ports:
> > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > +    description: OF graph binding modelling data lines to the Type-C switch.
> > > > > +
> > > > > +    properties:
> > > > > +      port@0:
> > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > +        description: Link between the switch and a Type-C connector.
> > > >
> > > > Is there an update to the usb-c-connector binding to accept this port
> > > > connection?
> > >
> > > Not at this time. I don't think we should enforce that either.
> > > (Type-C data-lines could theoretically be routed through intermediate
> > > hardware like retimers/repeaters)
> >
> > I'm mostly wondering if having such a connection to the usb-c-connector,
> > or even through some retimer/repeater, would be sufficient to detect how
> > many type-c ports are connected to the device. If the type-c pin
> > assignments only support two or four lanes for DP then it seems like we
> > should describe the two lanes or four lanes as one graph endpoint
> > "output" and then have some 'data-lanes' property in case the DP lanes
> > are flipped while being sent to the retimer or usb-c-connector. This
> > would of course depend on the capability of the device, i.e. if it can
> > remap DP lanes or only has 2 lanes of DP, etc.
> >
> > > > > +  - |
> > > > > +    drm-bridge {
> > > > > +        usb-switch {
> > > > > +            compatible = "typec-switch";
> > > >
> > > > I still don't understand the subnode design here. usb-switch as a
> > > > container node indicates to me that this is a bus, but in earlier rounds
> > > > of this series it was stated this isn't a bus.
> > >
> > > I am not aware of this as a requirement. Can you please point me to the
> > > documentation that states this needs to be the case?
> >
> > I'm not aware of any documentation for the dos and don'ts here. Are
> > there any examples in the bindings directory that split up a device into
> > subnodes that isn't in bindings/mfd?
>
> usb-c-connector [3] and its users is an example.
>
> >  I just know from experience that
> > any time I try to make a child node of an existing node that I'm
> > supposed to be describing a bus, unless I'm adding some sort of
> > exception node like a graph binding or an opp table. Typically a node
> > corresponds 1:1 with a device in the kernel. I'll defer to Rob for any
> > citations.
> >
> > >
> > > > Why doesn't it work to
> > > > merge everything inside usb-switch directly into the drm-bridge node?
> > >
> > > I attempted to explain the rationale in the previous version [1], but
> > > using a dedicated sub-node means the driver doesn't haven't to
> > > inspect individual ports to determine which of them need switches
> > > registered for them. If it sees a `typec-switch`, it registers a
> > > mode-switch and/or orientation-switch. IMO it simplifies the hardware
> > > device binding too.
> >
> > How is that any harder than hard-coding that detail into the driver
> > about which port and endpoint is possibly connected to the
> > usb-c-connector (or retimer)? All of that logic could be behind some API
> > that registers a typec-switch based on a graph port number that's passed
> > in, ala drm_of_find_panel_or_bridge()'s design.
>
> If each driver has to do it (and the port specifics vary for each driver),
> it becomes an avoidable overhead for each of them.
> I prefer hard-coding such details if avoidable. I suppose both approaches
Sorry, I meant "I prefer not hard-coding such details..."

> require modifications to the binding and the driver code.
>
> >
> > Coming from a DT writer's perspective, I just want to go through the
> > list of output pins in the datasheet and match them up to the ports
> > binding for this device. If it's a pure DP bridge, where USB hardware
> > isn't an input or an output like the ITE chip, then I don't want to have
> > to describe a port graph binding for the case when it's connected to a
> > dp-connector (see dp-connector.yaml) in the top-level node and then have
> > to make an entirely different subnode for the usb-c-connector case with
> > a whole other set of graph ports.
>
> This approach still allows for that, if the driver has any use for it
> (AFAICT these drivers don't).
> Iff that driver uses it, one can (optionally) route their output
> (top-level) ports through the
> "typec-switch" sub-node (and onwards as required).
> If it's being used in a "pure-DP" configuration, the "typec-switch" just
> goes away (the top level ports can be routed as desired by the driver).
> (Again, I must reiterate that neither this driver or the anx driver
> utilizes this)
>
> >
> > How would I even know which two differential pairs correspond to port0
> > or port1 in this binding in the ITE case?
>
> Why do we need to know that? It doesn't affect this or the other
> driver or hardware's
> functioning in a perceivable way.
>
> > Ideally we make the graph
> > binding more strict for devices by enforcing that their graph ports
> > exist. Otherwise we're not fully describing the connections between
> > devices and our dtb checkers are going to let things through where the
> > driver most likely will fail because it can't figure out what to do,
> > e.g. display DP on 4 lanes or play some DP lane rerouting games to act
> > as a mux.
>
> How is the current binding enforcing this? The typec-switch binding
> as a first step ensures that the DT is connecting the hardware(anx,ite
> etc) to something
> that at least "claims" to be a Type-C switch.
>
> >
> > >
> > > It also maps with the internal block diagram for these hardware
> > > components (for ex. the anx7625 crosspoint switch is a separate
> > > sub-block within anx7625).
> >
> > We don't make DT bindings for sub-components like this very often. It
> > would make more sense to me to have a subnode if a typec switch was some
> > sort of off the shelf hard macro that the hardware engineer placed down
> > inside the IC that they delivered. Then we could have a completely
> > generic driver that binds to the generic binding that knows how to drive
> > the hardware, because it's an unchangeable hard macro with a well
> > defined programming interface.
> >
> > >
> > > [1] https://lore.kernel.org/linux-usb/CACeCKaeH6qTTdG_huC4yw0xxG8TYEOtfPW3tiVNwYs=P4QVPXg@mail.gmail.com/
> >
> > I looked at the fsa4480 driver and the device has a publicly available
> > datasheet[2]. That device is designed for "audio accessory mode" but I
> > guess it's being used to simply mux SBU lines? There isn't an upstream
> > user of the binding so far, but it also doesn't look like a complete
> > binding. I'd expect to see DN_L/R as a graph output connected to the
> > usb-c-connector and probably have a usb2.0 input port and a 'sound-dai'
> > property to represent the input audio path.
> >
> > Finally, simply connecting to the typec controller node isn't sufficient
> > because a typec controller can be controlling many usb-c-connectors so I
> > don't see how the graph binding would be able to figure out how many
> > usb-c-connectors are connected to a mux like device, unless we took the
> > approach of this patch.
>
> It can follow the endpoint of the typec-switch port (the port parent
> of the remote
> end-point would be a 'usb-c-connector'). That is if the graph binding
> (I'm assuming you mean the switch device here) wants to figure this
> out in the first place.
>
> > Is that why you're proposing this binding? To
> > avoid describing a graph binding in the usb-c-connector and effectively
> > "pushing" the port count up to the mux?
>
> No, that is not the intention behind this series. The
> 'usb-c-connector' still needs the
> graph binding to the `typec-switch`. SBU, HS and SS lanes might have different
> muxes altogether (usb-c-connect has separate ports for SBU, HS and SS lanes)
>
> >
> > [2] https://www.onsemi.com/pdf/datasheet/fsa4480-d.pdf
>
> [3] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/connector/usb-connector.yaml#L23
