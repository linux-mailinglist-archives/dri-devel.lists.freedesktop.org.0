Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37F5602C2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 16:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914E510E17D;
	Wed, 29 Jun 2022 14:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCC610E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 14:33:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e28so17621376wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=et3EcQEBUZk/CN1WmGC2ef8SgdBnOceUNyXQ8zegZnQ=;
 b=NY9EhLcmVasQdduwhrTvgkuRlrqv9dJgtGE65oKC5nKzFPOe0dUvq9ndrReSc+wZCc
 rquKt8aGLvTTm1TgX9rc4f4iV5YS0w9glfOVzwkDcoBQdePuJsaPQIfpghHFPjx6aFt3
 Mq/HZLy7KVi0TOV4qL7+7nynumP71XEbhxXTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=et3EcQEBUZk/CN1WmGC2ef8SgdBnOceUNyXQ8zegZnQ=;
 b=5W5tUpeqsnnlJLGDn5ciYYiXtK0hIeyfRgbrGs2XM6UwsTyKbOD8eqMWws1a4fo8Fy
 76W2sNepNesPegQkFd1oFLaUZ+f+tdDPFg1C63jOOROOQOG2EbDeF8VK0EBwF60JSdts
 KhABtjGrJP9nf02/FDxGr8VKs+n+3p0McOAK+NkNT9pPwCBT7ZLkfTvY3O6vDDVtWx3x
 TbjyBc68JLwNVGuJ07r3Jb1TZgRUoosIUWs9rm82jt6OhqkM2+W1zgQNCzQO25aM1xKx
 cdMa31L4Y9IrYvGQM8MTVHRTOxz59UBAPmUV/cyohlVLGxf12VXW+vGwHkXPtfzQZRmg
 pKqw==
X-Gm-Message-State: AJIora8fPwnI7bJA3qscpKss/jypulaz9ug3uynE0lUdVPyDxHYyuzpA
 anzmjwXCY9WbbrT7EuEWBaEBkaRamRcT9drPK/LcGw==
X-Google-Smtp-Source: AGRyM1sylKm/YHfEHJJKoNtk4iDXMychQ2hjNGZay0zkjmxmi8kAllmVuxZxqfR//wwsPw4FU0+o6d/8FykpLAogQcc=
X-Received: by 2002:a05:6000:1245:b0:21b:83b2:191c with SMTP id
 j5-20020a056000124500b0021b83b2191cmr3487570wrx.493.1656513213258; Wed, 29
 Jun 2022 07:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
In-Reply-To: <20220628182336.GA711518-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 29 Jun 2022 22:33:22 +0800
Message-ID: <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To: Rob Herring <robh@kernel.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 swboyd@chromium.org, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 2:23 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jun 27, 2022 at 02:43:39PM -0700, Prashant Malani wrote:
> > Hello Rob,
> >
> > On Mon, Jun 27, 2022 at 2:04 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Jun 22, 2022 at 05:34:30PM +0000, Prashant Malani wrote:
> > > > Introduce a binding which represents a component that can control t=
he
> > > > routing of USB Type-C data lines as well as address data line
> > > > orientation (based on CC lines' orientation).
> > > >
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > > > Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > > > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > > ---
> > > >
> > > > Changes since v4:
> > > > - Added Reviewed-by tags.
> > > > - Patch moved to 1/9 position (since Patch v4 1/7 and 2/7 were
> > > >   applied to usb-next)
> > > >
> > > > Changes since v3:
> > > > - No changes.
> > > >
> > > > Changes since v2:
> > > > - Added Reviewed-by and Tested-by tags.
> > > >
> > > > Changes since v1:
> > > > - Removed "items" from compatible.
> > > > - Fixed indentation in example.
> > > >
> > > >  .../devicetree/bindings/usb/typec-switch.yaml | 74 +++++++++++++++=
++++
> > > >  1 file changed, 74 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/usb/typec-swi=
tch.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yam=
l b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > > new file mode 100644
> > > > index 000000000000..78b0190c8543
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > > > @@ -0,0 +1,74 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: USB Type-C Switch
> > > > +
> > > > +maintainers:
> > > > +  - Prashant Malani <pmalani@chromium.org>
> > > > +
> > > > +description:
> > > > +  A USB Type-C switch represents a component which routes USB Type=
-C data
> > > > +  lines to various protocol host controllers (e.g USB, VESA Displa=
yPort,
> > > > +  Thunderbolt etc.) depending on which mode the Type-C port, port =
partner
> > > > +  and cable are operating in. It can also modify lane routing base=
d on
> > > > +  the orientation of a connected Type-C peripheral.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: typec-switch
> > > > +
> > > > +  mode-switch:
> > > > +    type: boolean
> > > > +    description: Specify that this switch can handle alternate mod=
e switching.
> > > > +
> > > > +  orientation-switch:
> > > > +    type: boolean
> > > > +    description: Specify that this switch can handle orientation s=
witching.
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +    description: OF graph binding modelling data lines to the Type=
-C switch.
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description: Link between the switch and a Type-C connecto=
r.
> > > > +
> > > > +    required:
> > > > +      - port@0
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - ports
> > > > +
> > > > +anyOf:
> > > > +  - required:
> > > > +      - mode-switch
> > > > +  - required:
> > > > +      - orientation-switch
> > > > +
> > > > +additionalProperties: true
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    drm-bridge {
> > > > +        usb-switch {
> > > > +            compatible =3D "typec-switch";
> > >
> > > Unless this child is supposed to represent what the parent output is
> > > connected to, this is just wrong as, at least for the it6505 chip, it
> > > doesn't know anything about Type-C functionality. The bridge is
> > > just a protocol converter AFAICT.
> >
> > I'll let Pin-Yen comment on the specifics of the it6505 chip.
>
> We're all waiting...

Yes it6505 is just a protocol converter. But in our use case, the output DP
lines are connected to the Type-C ports and the chip has to know which
port has DP Alt mode enabled. Does this justify a child node here?

Does it make more sense if we we eliminate the usb-switch node here
and list the ports in the top level?
>
> > > If the child node represents what the output is connected to (like a
> > > bus), then yes that is a pattern we have used.
> >
> > For the anx7625 case, the child node does represent what the output is =
connected
> > to (the usb-c-connector via the switch). Does that not qualify? Or do y=
ou mean
> > the child node should be a usb-c-connector itself?
> >
> > > For example, a panel
> > > represented as child node of a display controller. However, that only
> > > works for simple cases, and is a pattern we have gotten away from in
> > > favor of using the graph binding.
> >
> > The child node will still use a OF graph binding to connect to the
> > usb-c-connector.
> > Is that insufficient to consider a child node usage here?
> > By "using the graph binding", do you mean "only use the top-level ports=
" ?
> > I'm trying to clarify this, so that it will inform future versions and =
patches.
>
> What I want to see is block diagrams of possible h/w with different
> scenarios and then what the binding looks like in those cases. The
> switching/muxing could be in the SoC, a bridge chip, a Type C
> controller, a standalone mux chip, or ????. If you want a somewhat
> genericish binding, then you need to consider all of these.
>
> I don't really have the b/w to work thru all this (and switch/mux is
> just one part of dealing with Type-C). This is just one of about a
> hundred patches I get to review a week.
>
> Rob
