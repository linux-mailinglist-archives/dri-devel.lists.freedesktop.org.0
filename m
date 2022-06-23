Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061E558858
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 21:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA41810E13E;
	Thu, 23 Jun 2022 19:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BE410E719
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 19:08:32 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3177e60d980so3430427b3.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cI9+Tt7Z23d5RLVvZyen7R3tMKAwKXD+mtIbHKBAs/0=;
 b=EwRTeyODFUti7GZ+xjLiRABaUIFE+v7VX2QUxT1gLoLb7OcrDvTuc6YmjFeBi4QPK8
 cMcrZYL/sB3CiRaYHBqxYeHyYY9+3MMopZKUBg8OgBIT5gj7y2fBBjARSaMRIu9EVLOi
 /mclFnDn/0H+0h2tsaiH5pZNuBZIw6OokDWIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cI9+Tt7Z23d5RLVvZyen7R3tMKAwKXD+mtIbHKBAs/0=;
 b=evpZm3hTbMgoe8H/h6uY/MmHoyM8v66QZTtSm/9FTui42tLipz7EHPmtONV+A8pRHL
 jPwsl3DYs1p3rEVQcClZafqK9NXablHHDt4Sy4uZyWpz/tPl1sDAKdfkNpQGEzEKu/HE
 GzYZekE9UBrM25CSsWZu3y8AT9xJ6aiWbDe3U/ntXa8vRTRdd968/AKFjvsnipWSgl+f
 C6GmvLhvOL9STwRPvkxzX3Dj3v0DdmPMBAn7FsBoM7WdUSwbaY+ybD1CeiaXjD6HpBCO
 j/F2qufL72u5mzvIBHQI7x45lfWlwDjCOBHzQhM2rJJ1nTp1S51FXpGHmTiloYvKosaW
 05sQ==
X-Gm-Message-State: AJIora8HzFoNICD/j2ceSgpkqO0AX9P7q82IMMaAjZiIU1+AJAiUOp44
 0cpMn2cziYUVV5kvp8E2jhgmXDXUQryNlKkEqyXTHQ==
X-Google-Smtp-Source: AGRyM1uI+NXVSDSF+kdbOhzo94TrmT6zO+AbQ7d8LLAT0eOAHI6q+f2Lm9Z72G3mIZo/6BEfD/8XNNQ0xyYslCAEtI8=
X-Received: by 2002:a0d:f045:0:b0:317:e6b2:2c64 with SMTP id
 z66-20020a0df045000000b00317e6b22c64mr12234518ywe.350.1656011311909; Thu, 23
 Jun 2022 12:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
In-Reply-To: <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 23 Jun 2022 12:08:21 -0700
Message-ID: <CACeCKac4eL9++QwbDBKrVTpUzhes=WczqZfh+cFiVgoO4py4MQ@mail.gmail.com>
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

On Thu, Jun 23, 2022 at 11:30 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-22 10:34:30)
> > diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
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
> > +  A USB Type-C switch represents a component which routes USB Type-C data
> > +  lines to various protocol host controllers (e.g USB, VESA DisplayPort,
> > +  Thunderbolt etc.) depending on which mode the Type-C port, port partner
> > +  and cable are operating in. It can also modify lane routing based on
> > +  the orientation of a connected Type-C peripheral.
> > +
> > +properties:
> > +  compatible:
> > +    const: typec-switch
> > +
> > +  mode-switch:
> > +    type: boolean
> > +    description: Specify that this switch can handle alternate mode switching.
> > +
> > +  orientation-switch:
> > +    type: boolean
> > +    description: Specify that this switch can handle orientation switching.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: OF graph binding modelling data lines to the Type-C switch.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Link between the switch and a Type-C connector.
>
> Is there an update to the usb-c-connector binding to accept this port
> connection?

Not at this time. I don't think we should enforce that either.
(Type-C data-lines could theoretically be routed through intermediate
hardware like retimers/repeaters)

>
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
> > +            compatible = "typec-switch";
>
> I still don't understand the subnode design here. usb-switch as a
> container node indicates to me that this is a bus, but in earlier rounds
> of this series it was stated this isn't a bus.

I am not aware of this as a requirement. Can you please point me to the
documentation that states this needs to be the case?

> Why doesn't it work to
> merge everything inside usb-switch directly into the drm-bridge node?

I attempted to explain the rationale in the previous version [1], but
using a dedicated sub-node means the driver doesn't haven't to
inspect individual ports to determine which of them need switches
registered for them. If it sees a `typec-switch`, it registers a
mode-switch and/or orientation-switch. IMO it simplifies the hardware
device binding too.

It also maps with the internal block diagram for these hardware
components (for ex. the anx7625 crosspoint switch is a separate
sub-block within anx7625).

[1] https://lore.kernel.org/linux-usb/CACeCKaeH6qTTdG_huC4yw0xxG8TYEOtfPW3tiVNwYs=P4QVPXg@mail.gmail.com/

>
> > +            mode-switch;
> > +            orientation-switch;
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    anx_ep: endpoint {
> > +                        remote-endpoint = <&typec_controller>;
> > +                    };
> > +                };
> > +            };
> > +        };
