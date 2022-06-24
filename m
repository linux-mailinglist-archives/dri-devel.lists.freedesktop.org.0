Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3855A218
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C53110E221;
	Fri, 24 Jun 2022 19:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75F10E221
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:50:48 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q11so4833371oih.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 12:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=e/cuN06gu5d3H08+E32P24eeFEsHL/38GmTdr7mnsJI=;
 b=DnD73jfYTyMuwYURD46ZCgwurf3N4iJrI4aj5oZtEeRISafyiuc6ktpCpOpiMsRmq8
 ddnPwMFCsQQyngFhq5tbBvbBI6oqOSkkHvqKDFZy5gVaEd/TbPvd9ugCgZ72gdY22lp4
 nV7RAIU3NiJ6taFPiMV9hc+kpVdaz3PoyPnhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=e/cuN06gu5d3H08+E32P24eeFEsHL/38GmTdr7mnsJI=;
 b=CEYyiXvMC8dvMa1XY1q7ktz4lcVpJydnGuxVrXsLLhVBdRg0Utpl6050B8zeVeyrUq
 DhWJu2YMtMXYuJ7HM4f96BEC0VIUsmo3Y0dniyAJ8ifNjWSUWYXXMjzkadE59o5DFWXS
 nLDelNwXPz0+H/uEydzC433jArNZFzsixK3Q68F2WyOLbqvCh7odfR9LZBlDcuDUarLP
 kjtFKPlcEoCk7sRQIeTO8j/kBMdKY3U24vShi4BMgDU2yxCVJViIOqYZr7EjV/GuBA75
 8hBotLHB+ZRWic6wSrfbIUqJ/peebNJkD3NXFLfJqrw7/FXUmIKgIJB5LNQtGC10rwKw
 Z/cg==
X-Gm-Message-State: AJIora+FPtEvW2sMpfxNOJOMhvLJTE0d/jUTEILfNfVh3ElZg0XJelRZ
 GAret50wv3O1aaFjCb02Z0kMuItjjK8Cobk833AH9Q==
X-Google-Smtp-Source: AGRyM1vJzTGGcyi3EtPhNbDexEz9ca3AqycOPzRVlRGeieEqyWu+bKX7aXFWlYmnwjQVgeL0ky+0dN/IPTvYySDJ8A4=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr459282oib.63.1656100247798; Fri, 24
 Jun 2022 12:50:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 12:50:47 -0700
MIME-Version: 1.0
In-Reply-To: <CACeCKaffqb6v7TFji2u00VSQ=DGvRe-gcxMnAEbZCC1qtDZF6A@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
 <CACeCKac4eL9++QwbDBKrVTpUzhes=WczqZfh+cFiVgoO4py4MQ@mail.gmail.com>
 <CAE-0n51E1TLMRNWnqiV-jU_qg15BF4D6A+0G1y1SRTu1zNs2Dg@mail.gmail.com>
 <CACeCKacGZFY-_yn1R33OVcsdG47oqNTGBA43L5hrH2zyhK=cRw@mail.gmail.com>
 <CAE-0n53i90ZUFSmrR=ScXtMdn_bWPY49WWTf9LXbxu_udGgP9w@mail.gmail.com>
 <CACeCKaffqb6v7TFji2u00VSQ=DGvRe-gcxMnAEbZCC1qtDZF6A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 12:50:47 -0700
Message-ID: <CAE-0n51AYqr4wcD-JaVaTYjFgxCj+iX+xAYKCrZCqGHE2XEUgA@mail.gmail.com>
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

Quoting Prashant Malani (2022-06-23 19:48:04)
> On Thu, Jun 23, 2022 at 7:13 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-23 17:35:38)
> > > On Thu, Jun 23, 2022 at 4:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > I'm not aware of any documentation for the dos and don'ts here. Are
> > > > there any examples in the bindings directory that split up a device into
> > > > subnodes that isn't in bindings/mfd?
> > >
> > > usb-c-connector [3] and its users is an example.
> >
> > What are the subnodes? The graph ports? That is not what I meant.
>
> cros-ec-typec [4] uses subnodes of usb-c-connector. Chrome OS DTs
> use the ports from the included usb-c-connector to switching hardware.

Ok, got it. usb-c-connector nodes are children of the typec controller
(in this case cros-ec-typec) because otherwise we would need to make a
phandle link from the usb-c-connector node(s) under the root node / to
the typec controller. The phandle link may need to be done in both
directions, so it makes more sense to put the usb-c-connector nodes
underneath the typec controller to express the direct relationship
between the typec controller and the usb-c-connectors.

Furthermore, the usb-c-connector is not integrated as part of the EC in
the same package. There is a discrete part placed on the board that
corresponds to the usb-c-connector and that is separate from the EC. The
connectors are in essence only controllable through the EC because
that's the typec controller. It's similar to how we place i2c devices as
child nodes of the i2c controller.

>
> > I meant splitting up a device functionality, like type-c and display
> > bridge, into subnodes. Composition of devices through DT bindings isn't
> > how it's done. Instead, we dump all the different functionality into the
> > same node. For example, look at the number of bindings that have both
> > #clock-cells and #reset-cells, when those are distinct frameworks in the
> > kernel and also different properties. We don't make subnodes to contain
> > the different functionality of a device.
> >
> > And in this case I still don't see the point to making a subnode.
>
> I've already provided my best effort at explaining the rationale.
>
> > The
> > API can simply setup a type-c switch based on a graph binding for the
> > toplevel node, e.g. the drm-bridge, and the driver can tell the API
> > which port+endpoint to use to search the graph for the usb-c-connector
> > to associate with the switch.
>
> OK, drm-bridge uses that approach. This is another approach. I didn't fully
> understand why we *have* to follow what drm-bridge is doing.
>
> > We don't need to connect the graph within
> > the drm-bridge node to the graph within the typec-switch node to do
> > that. That's an internal detail of the drm-bridge that we don't expose
> > to DT, because the driver knows the detail.
>
> I still don't understand why we can't do that. These devices have actual
> hardware blocks that represent the Type-C switch functionality.
>

We don't break up device functionality for an IC into different subnodes
with different compatibles. Similarly, we don't describe internal
connection details of device nodes. The device driver that binds to the
compatible should know the details of the internal block diagram of the
part. The DT binding should describe the external connections of the
part and have properties that inform the driver about how the part was
integrated into the system (e.g. mode-switch). The unwritten DT mantra
is "less is more".

We could definitely make many subnodes and add properties for everything
inside an IC so that the DT describes the complete block diagram of the
part, but at that point the driver is a shell of its former self. The
driver will spend time parsing properties to learn details that are
entirely unchanging for the lifetime of the device (e.g. that the device
has typec switch capabilities); things that should be hard-coded in the
driver.

Of course, if the device is integrated into the system and doesn't need
to perform typec switching, then we want a property to tell the driver
that this device is integrated in a way that the typec switch is not
needed/used. Basically the driver should key that functionality off of
the presence of the 'mode-switch' or 'orientation-switch' property
instead of off the presence of a typec-switch subnode.

> > >
> > > >
> > > > How would I even know which two differential pairs correspond to port0
> > > > or port1 in this binding in the ITE case?
> > >
> > > Why do we need to know that? It doesn't affect this or the other
> > > driver or hardware's
> > > functioning in a perceivable way.
> >
> > If the device registers allow control of the DP lane to physical pin
> > mapping, so that DP lane0 and DP lane1 can be swapped logically, then
> > we'll want to know which DP lanes we need to swap by writing some lane
> > remapping register in the device. Sometimes for routing purposes devices
> > support this lane remapping feature so the PCB can route the lines
> > directly to the connector instead of going in circles and destroying the
> > signal integrity.
>
> Then add more end-points to port@1 (for each differential pair
> you want to describe) of the usb-c-connector and route them
> to the typec-switch accordingly.
> FWIW I'm not aware of h/w *that supports DP alt mode* that uses the
> functionality
> you're referring to.
>

The Qualcomm QMP usb+dp phy supports lane remapping.

> >
> > >
> > > > Is that why you're proposing this binding? To
> > > > avoid describing a graph binding in the usb-c-connector and effectively
> > > > "pushing" the port count up to the mux?
> > >
> > > No, that is not the intention behind this series. The
> > > 'usb-c-connector' still needs the
> > > graph binding to the `typec-switch`. SBU, HS and SS lanes might have different
> > > muxes altogether (usb-c-connect has separate ports for SBU, HS and SS lanes)
> >
> > If the usb-c-connector still needs a graph binding to the typec-switch
> > then why isn't that part of this series?
>
> That's not what I meant (what I meant earlier is the intention is not
> what you stated).
> I simply meant that the usb-c-connectors ports should be connected to
> the typec-switch
> ports. There isn't any binding update required for this.
>

Ok. Got it.
