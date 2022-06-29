Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A74560810
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 19:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70B110E2E8;
	Wed, 29 Jun 2022 17:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8092710E2E8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 17:59:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A698161EE8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 17:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AEFC341C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656525546;
 bh=Fy/apOfvb4p1KQqRwI17vjTWg/3tIVKASMjwkPxeDWU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GRHtKYVsoycis//F2NlVUJ5pLTI2hwvyhf20pFj9mZT2oZlVHKUVKOVcGo5V/dq++
 IrYZLE1DbSzt0SJ87J9n7qdYNAlvdNp0dO5vr9eaODhnghatVb8twousDNF4AmNQit
 3C1QQi9NzWiIU0frWJvYRDYuhS0uU7mel4vi8VkFuxxvf1ZC+cp5iADgQz9xYG+0ov
 x3HCO0178151gUYMwlaUwWgRJv8/fP1nLu096Avusdh3r9kpLdWD8YeyweRQ4n+Zvp
 HFWHZ7vXqQlS8M1NMrU3KCbt0a7Koq7TTx85EMtmMYOziNpRG/ABATGFReA6piTqU0
 3HeR6GCf3l4ng==
Received: by mail-vs1-f46.google.com with SMTP id 189so5054244vsh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 10:59:05 -0700 (PDT)
X-Gm-Message-State: AJIora9qBv6+wm0+3ZpGvM7KZo+cU+MI/ovefyqnw8YhBeLgaRrWaTQX
 y8i/miAzYgVZ4M8RyJ7tu2pPwrQi7CDk28fx5w==
X-Google-Smtp-Source: AGRyM1tW2XajM7K3qBROl9U3bzJTXDFjgJqbSfqgtNnxuue1iJ/u9pvfftkoQjF4q9bsvS2MBHJPZF1ZTE2+LsY5N70=
X-Received: by 2002:a67:e18e:0:b0:354:4c38:11dd with SMTP id
 e14-20020a67e18e000000b003544c3811ddmr5762839vsl.6.1656525544847; Wed, 29 Jun
 2022 10:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
 <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
In-Reply-To: <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Jun 2022 11:58:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
Message-ID: <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To: Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 9:01 AM Pin-yen Lin <treapking@chromium.org> wrote:
>
> On Wed, Jun 29, 2022 at 10:33 PM Pin-yen Lin <treapking@chromium.org> wro=
te:
> >
> > On Wed, Jun 29, 2022 at 2:23 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Jun 27, 2022 at 02:43:39PM -0700, Prashant Malani wrote:
> > > > Hello Rob,
> > > >
> > > > On Mon, Jun 27, 2022 at 2:04 PM Rob Herring <robh@kernel.org> wrote=
:
> > > > >
> > > > > On Wed, Jun 22, 2022 at 05:34:30PM +0000, Prashant Malani wrote:
> > > > > > Introduce a binding which represents a component that can contr=
ol the
> > > > > > routing of USB Type-C data lines as well as address data line
> > > > > > orientation (based on CC lines' orientation).
> > > > > >
> > > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.or=
g>
> > > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delre=
gno@collabora.com>
> > > > > > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.c=
om>
> > > > > > Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com=
>
> > > > > > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > > > > ---
> > > > > >
> > > > > > Changes since v4:
> > > > > > - Added Reviewed-by tags.
> > > > > > - Patch moved to 1/9 position (since Patch v4 1/7 and 2/7 were
> > > > > >   applied to usb-next)
> > > > > >
> > > > > > Changes since v3:
> > > > > > - No changes.
> > > > > >
> > > > > > Changes since v2:
> > > > > > - Added Reviewed-by and Tested-by tags.
> > > > > >
> > > > > > Changes since v1:
> > > > > > - Removed "items" from compatible.
> > > > > > - Fixed indentation in example.
> > > > > >
> > > > > >  .../devicetree/bindings/usb/typec-switch.yaml | 74 +++++++++++=
++++++++
> > > > > >  1 file changed, 74 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/usb/typec=
-switch.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/usb/typec-switch=
.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..78b0190c8543
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > > > > @@ -0,0 +1,74 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: USB Type-C Switch
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Prashant Malani <pmalani@chromium.org>
> > > > > > +
> > > > > > +description:
> > > > > > +  A USB Type-C switch represents a component which routes USB =
Type-C data
> > > > > > +  lines to various protocol host controllers (e.g USB, VESA Di=
splayPort,
> > > > > > +  Thunderbolt etc.) depending on which mode the Type-C port, p=
ort partner
> > > > > > +  and cable are operating in. It can also modify lane routing =
based on
> > > > > > +  the orientation of a connected Type-C peripheral.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: typec-switch
> > > > > > +
> > > > > > +  mode-switch:
> > > > > > +    type: boolean
> > > > > > +    description: Specify that this switch can handle alternate=
 mode switching.
> > > > > > +
> > > > > > +  orientation-switch:
> > > > > > +    type: boolean
> > > > > > +    description: Specify that this switch can handle orientati=
on switching.
> > > > > > +
> > > > > > +  ports:
> > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > +    description: OF graph binding modelling data lines to the =
Type-C switch.
> > > > > > +
> > > > > > +    properties:
> > > > > > +      port@0:
> > > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > +        description: Link between the switch and a Type-C conn=
ector.
> > > > > > +
> > > > > > +    required:
> > > > > > +      - port@0
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - ports
> > > > > > +
> > > > > > +anyOf:
> > > > > > +  - required:
> > > > > > +      - mode-switch
> > > > > > +  - required:
> > > > > > +      - orientation-switch
> > > > > > +
> > > > > > +additionalProperties: true
> > > > > > +
> > > > > > +examples:
> > > > > > +  - |
> > > > > > +    drm-bridge {
> > > > > > +        usb-switch {
> > > > > > +            compatible =3D "typec-switch";
> > > > >
> > > > > Unless this child is supposed to represent what the parent output=
 is
> > > > > connected to, this is just wrong as, at least for the it6505 chip=
, it
> > > > > doesn't know anything about Type-C functionality. The bridge is
> > > > > just a protocol converter AFAICT.
> > > >
> > > > I'll let Pin-Yen comment on the specifics of the it6505 chip.
> > >
> > > We're all waiting...
> >
> > Yes it6505 is just a protocol converter. But in our use case, the outpu=
t DP
> > lines are connected to the Type-C ports and the chip has to know which
> > port has DP Alt mode enabled. Does this justify a child node here?
> >
> > Does it make more sense if we we eliminate the usb-switch node here
> > and list the ports in the top level?

In the it6505 node? No, the it6505 h/w knows nothing about Type-C
switching so neither should its binding.

What device controls the switching in this case? Again, block diagrams
please if you want advice on what the binding should look like.

> > > > > If the child node represents what the output is connected to (lik=
e a
> > > > > bus), then yes that is a pattern we have used.
> > > >
> > > > For the anx7625 case, the child node does represent what the output=
 is connected
> > > > to (the usb-c-connector via the switch). Does that not qualify? Or =
do you mean
> > > > the child node should be a usb-c-connector itself?
> > > >
> > > > > For example, a panel
> > > > > represented as child node of a display controller. However, that =
only
> > > > > works for simple cases, and is a pattern we have gotten away from=
 in
> > > > > favor of using the graph binding.
> > > >
> > > > The child node will still use a OF graph binding to connect to the
> > > > usb-c-connector.
> > > > Is that insufficient to consider a child node usage here?
> > > > By "using the graph binding", do you mean "only use the top-level p=
orts" ?
> > > > I'm trying to clarify this, so that it will inform future versions =
and patches.
> > >
> > > What I want to see is block diagrams of possible h/w with different
> > > scenarios and then what the binding looks like in those cases. The
> > > switching/muxing could be in the SoC, a bridge chip, a Type C
> > > controller, a standalone mux chip, or ????. If you want a somewhat
> > > genericish binding, then you need to consider all of these.
>
> Then, is it suitable to put the switch binding into the drivers own bindi=
ngs
> (i.e., the bindings for it6505 and anx7625), and introduce some helper
> functions to eliminate the duplication in the code?

Only for h/w devices that have switch h/w.

> Though we will have two similar bindings in two drivers with this approac=
h.

While the anx7625 driver having Type-C awareness makes sense given it
has a switch and a type-C controller, that doesn't make sense for
it6505 (and every other bridge driver that's just providing DP
output).

Rob
