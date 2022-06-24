Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA33558D29
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 04:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130BC10E070;
	Fri, 24 Jun 2022 02:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1CC10E070
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 02:13:59 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 j2-20020a4ab1c2000000b00425813b407bso80261ooo.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 19:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/VGk8F/SGTm+nA86WQSFAF1khuATXIOmF7Nb/YW6zYU=;
 b=U/aMFLc9SlPd0ev9cbNDFUH3VZKjxLKW1usFu47cpdQVNYEfRax18X59Fi1QCls4Kz
 /m6OenxKag+dBrD6MDGaB6XsTliXs89R/ZvtHWPjrPuJ5PYveZy18cNT4Q60enrEIudb
 IcU8OWtqxoWRLS260YbgyuS9xrDef0ymfLOpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/VGk8F/SGTm+nA86WQSFAF1khuATXIOmF7Nb/YW6zYU=;
 b=GAAfNi8v/dzGeldaXMlUvb+B5UzY+Nm/zfm8Sx6GymJ43ZDkp35Y8xOJ1VwYw4qIZ1
 dv/PCtmZCCmMRIYE4BsOcQD6TeWm5mdq9SVTOzrQRXj/NJGkPSDEmts4f0bcBK6SplCB
 gl24nYMJgSFnD1YIdsD/5VyNA581ZtW2PeiCfDNSOQkkdMgprOYJwGPgSZiRNndZXTv3
 kBjoRlScGqDGKbG2tbQwCif78fCWO3UKcszxgmIdzTtg2lDj0rbm6RayWpBEvoniL8ny
 R2wYx+iGPrSplBqioGAd1od4acR3eU+/L/cN9aj53kMAtnvIjTiE+QjoGBuwIX3ALw+h
 9zrA==
X-Gm-Message-State: AJIora8Mz9J4ZfERvOmop6gMbMy3ZHClPnyh98qC2+QoConJS7BwgnIs
 DA8q+clmrcVKCKwWvkikPbWkh/vAb2JPZaMZxkpWrQ==
X-Google-Smtp-Source: AGRyM1tSxFFQ/8QuvcgiN9oT0/xNSfBR6w7RlimtXUAU8niX16bpVvTWIUPp0rLiKRd3ZOPqXYv8KQj1I+iTf8xqCqs=
X-Received: by 2002:a4a:98a6:0:b0:41b:e04e:70ce with SMTP id
 a35-20020a4a98a6000000b0041be04e70cemr5013135ooj.25.1656036838607; Thu, 23
 Jun 2022 19:13:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 19:13:58 -0700
MIME-Version: 1.0
In-Reply-To: <CACeCKacGZFY-_yn1R33OVcsdG47oqNTGBA43L5hrH2zyhK=cRw@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
 <CACeCKac4eL9++QwbDBKrVTpUzhes=WczqZfh+cFiVgoO4py4MQ@mail.gmail.com>
 <CAE-0n51E1TLMRNWnqiV-jU_qg15BF4D6A+0G1y1SRTu1zNs2Dg@mail.gmail.com>
 <CACeCKacGZFY-_yn1R33OVcsdG47oqNTGBA43L5hrH2zyhK=cRw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 Jun 2022 19:13:57 -0700
Message-ID: <CAE-0n53i90ZUFSmrR=ScXtMdn_bWPY49WWTf9LXbxu_udGgP9w@mail.gmail.com>
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

Quoting Prashant Malani (2022-06-23 17:35:38)
> On Thu, Jun 23, 2022 at 4:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > I'm not aware of any documentation for the dos and don'ts here. Are
> > there any examples in the bindings directory that split up a device into
> > subnodes that isn't in bindings/mfd?
>
> usb-c-connector [3] and its users is an example.

What are the subnodes? The graph ports? That is not what I meant. I
meant splitting up a device functionality, like type-c and display
bridge, into subnodes. Composition of devices through DT bindings isn't
how it's done. Instead, we dump all the different functionality into the
same node. For example, look at the number of bindings that have both
#clock-cells and #reset-cells, when those are distinct frameworks in the
kernel and also different properties. We don't make subnodes to contain
the different functionality of a device.

And in this case I still don't see the point to making a subnode. The
API can simply setup a type-c switch based on a graph binding for the
toplevel node, e.g. the drm-bridge, and the driver can tell the API
which port+endpoint to use to search the graph for the usb-c-connector
to associate with the switch. We don't need to connect the graph within
the drm-bridge node to the graph within the typec-switch node to do
that. That's an internal detail of the drm-bridge that we don't expose
to DT, because the driver knows the detail. It also aligns the graph
binding for the top-level node with non-typec bindings, like drm, which
don't use a second level of graph binding to achieve essentially the
same thing when the output is connected to a DP connector.

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
> require modifications to the binding and the driver code.

Ok, sounds like it is not any harder.

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

If the device registers allow control of the DP lane to physical pin
mapping, so that DP lane0 and DP lane1 can be swapped logically, then
we'll want to know which DP lanes we need to swap by writing some lane
remapping register in the device. Sometimes for routing purposes devices
support this lane remapping feature so the PCB can route the lines
directly to the connector instead of going in circles and destroying the
signal integrity.

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

I'm simply saying that we can extend existing bindings like anx or ite
to have required properties for ports so that we know the driver will
find something on the other end of the graph. A binding that doesn't
have any ports will be invalid. I don't know if that's possible to do
in the schema.

>
> > Is that why you're proposing this binding? To
> > avoid describing a graph binding in the usb-c-connector and effectively
> > "pushing" the port count up to the mux?
>
> No, that is not the intention behind this series. The
> 'usb-c-connector' still needs the
> graph binding to the `typec-switch`. SBU, HS and SS lanes might have different
> muxes altogether (usb-c-connect has separate ports for SBU, HS and SS lanes)

If the usb-c-connector still needs a graph binding to the typec-switch
then why isn't that part of this series?
