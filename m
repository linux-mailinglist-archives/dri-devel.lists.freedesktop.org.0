Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CBF55BC34
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458A10E6C0;
	Mon, 27 Jun 2022 21:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C80E890A2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:43:51 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id h187so16768295ybg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zVVDV7APfU9r2RLbdKg5/cTGtWPknd1MSe7r7DyJqGA=;
 b=WK98TF2fZfBa0/bAmyVmVIC8Zjaro5lVsqZPE5F2DRd46BRHPENt4IdG+aMKFgGu6J
 UevhukZvj75uZFsswaLyKxkHDNFvW7Cc+3iPnoqOqD4ItNDx0K39pOfz9U6daqXVR8xU
 ur0I66+aTKigkDWmRRrnTlFqWXcdrUkD5QxlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zVVDV7APfU9r2RLbdKg5/cTGtWPknd1MSe7r7DyJqGA=;
 b=Ag8lEz3gKqKlcFH9tVaQvST1ETJ4iIFT2801/A1WbTTMlRsplHOElElU2c1fKtBbgn
 LfKQMNxIhoJC40CLQ9OYPBKBqXPM3tbGwDx6y6sWzkyvpRVjgI+wTUa7E2PVHR/CUcqL
 vLNoTH5e+mSlEV9WLCOaN1CsBY5vm8TXYfeOXistOrvfop3lmmG1+LOFb0mZ7rRTFhCn
 yJSA6Z6l6gTGnv8pMwFptVyScRGe4cS8nQM+f8s3iLQySl0lFUDzcYHE4woHWBRfbcbX
 06m9+3nJ43IiCSRnTooa6GcyARjH9pGvQ1VKolwfk3H4hsMo4kFRc75eGC4DXDDLuWs1
 EQ6w==
X-Gm-Message-State: AJIora/bL9Gxe0SAqKOW+vwFehXnNkHXt9mT1P+Z1eqpwF5wfqgOAxeP
 cfIz+U8yafLG/7n2Uv7w514FkmN3M3r746cqirzLZQ==
X-Google-Smtp-Source: AGRyM1vMpp/K/ujDLij5isvZcyN2Qbx0yJqK9sa2MgUAZ3WMBHbnXgtvinV7drhL36FdOgCoVMVawRrt3FHUO4o+rng=
X-Received: by 2002:a25:da0b:0:b0:66c:850f:1b71 with SMTP id
 n11-20020a25da0b000000b0066c850f1b71mr16460322ybf.336.1656366230372; Mon, 27
 Jun 2022 14:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <20220627210407.GA2905757-robh@kernel.org>
In-Reply-To: <20220627210407.GA2905757-robh@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 27 Jun 2022 14:43:39 -0700
Message-ID: <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
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
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob,

On Mon, Jun 27, 2022 at 2:04 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 22, 2022 at 05:34:30PM +0000, Prashant Malani wrote:
> > Introduce a binding which represents a component that can control the
> > routing of USB Type-C data lines as well as address data line
> > orientation (based on CC lines' orientation).
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v4:
> > - Added Reviewed-by tags.
> > - Patch moved to 1/9 position (since Patch v4 1/7 and 2/7 were
> >   applied to usb-next)
> >
> > Changes since v3:
> > - No changes.
> >
> > Changes since v2:
> > - Added Reviewed-by and Tested-by tags.
> >
> > Changes since v1:
> > - Removed "items" from compatible.
> > - Fixed indentation in example.
> >
> >  .../devicetree/bindings/usb/typec-switch.yaml | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/=
Documentation/devicetree/bindings/usb/typec-switch.yaml
> > new file mode 100644
> > index 000000000000..78b0190c8543
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> > @@ -0,0 +1,74 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB Type-C Switch
> > +
> > +maintainers:
> > +  - Prashant Malani <pmalani@chromium.org>
> > +
> > +description:
> > +  A USB Type-C switch represents a component which routes USB Type-C d=
ata
> > +  lines to various protocol host controllers (e.g USB, VESA DisplayPor=
t,
> > +  Thunderbolt etc.) depending on which mode the Type-C port, port part=
ner
> > +  and cable are operating in. It can also modify lane routing based on
> > +  the orientation of a connected Type-C peripheral.
> > +
> > +properties:
> > +  compatible:
> > +    const: typec-switch
> > +
> > +  mode-switch:
> > +    type: boolean
> > +    description: Specify that this switch can handle alternate mode sw=
itching.
> > +
> > +  orientation-switch:
> > +    type: boolean
> > +    description: Specify that this switch can handle orientation switc=
hing.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: OF graph binding modelling data lines to the Type-C s=
witch.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Link between the switch and a Type-C connector.
> > +
> > +    required:
> > +      - port@0
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +anyOf:
> > +  - required:
> > +      - mode-switch
> > +  - required:
> > +      - orientation-switch
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    drm-bridge {
> > +        usb-switch {
> > +            compatible =3D "typec-switch";
>
> Unless this child is supposed to represent what the parent output is
> connected to, this is just wrong as, at least for the it6505 chip, it
> doesn't know anything about Type-C functionality. The bridge is
> just a protocol converter AFAICT.

I'll let Pin-Yen comment on the specifics of the it6505 chip.

>
> If the child node represents what the output is connected to (like a
> bus), then yes that is a pattern we have used.

For the anx7625 case, the child node does represent what the output is conn=
ected
to (the usb-c-connector via the switch). Does that not qualify? Or do you m=
ean
the child node should be a usb-c-connector itself?

> For example, a panel
> represented as child node of a display controller. However, that only
> works for simple cases, and is a pattern we have gotten away from in
> favor of using the graph binding.

The child node will still use a OF graph binding to connect to the
usb-c-connector.
Is that insufficient to consider a child node usage here?
By "using the graph binding", do you mean "only use the top-level ports" ?
I'm trying to clarify this, so that it will inform future versions and patc=
hes.

>
> I think Stephen and I are pretty much saying the same thing.
>
> Rob
