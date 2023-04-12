Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5D6DE909
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 03:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC5210E183;
	Wed, 12 Apr 2023 01:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12CB10E183
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 01:38:27 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e20so10190399lji.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 18:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681263505; x=1683855505;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=x4I7A7fTrqw2RjiH+FANl1pHUb1mo4v70F1ZP1YYmH0=;
 b=eddehjaxa279W/YrUOmm1WgvC8vDX4Tc3sYAKlXKYyV36fw4dQ/qyq+r8+UTYIVkmA
 9+nD3VH5DqzPAN3u0aJka1TzhZNJ0Mozj2KrChdbZxyRaHskhIAL2Yl4+XW3MpxGifyX
 TewzYAl4ZckxEtP5KKFLTI/6fnR6+sgtt05Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681263505; x=1683855505;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4I7A7fTrqw2RjiH+FANl1pHUb1mo4v70F1ZP1YYmH0=;
 b=GkT3FqunyRu67wfT3aFdmGSkFFqOG+UgOhTg9doqDF/iZqSiumXuOosjFxH8/+0DZw
 ZUVQzso/fcQjea0DhKndNKbxjYMviMSph71X6Beh5EIGEv/abmFKC3/sB/1qpxE7cWlp
 WaYk6N/Uw9QOGlm6N7ntrpmZdFyUDSFhqWmIPNaXmO8fJV/33jfHmWs6QgDmD/0CgSe3
 BY/8spTFGx4v7VTcKK6Lp6JvDuH/Agy5ONbj9StOYIdTPcZcDY//2NDr5/EgAIvn2i6U
 /FSP0lKbLcx5H+9yunA4BDXxmDEd2OejIhDfEffOrNcs+SbXb3EsloM+qkA1a6KlAoCE
 9/8w==
X-Gm-Message-State: AAQBX9fvv88JXwByyB6N4MS+AIbbVzgobbXwqpu+XEoADY3uLYDWa6lm
 xRWWL2EsjdJkCjMbZUsu86puJWEYn3OOrAZGmUh2UA==
X-Google-Smtp-Source: AKy350ZrQD2Vb2BW3i4nlZswnqh11mfvwRG/pRKEBtPfKm06ImQY4Wy4cFsAYomIBa6rGCRvOo5AoNfsAyZRUXeax+8=
X-Received: by 2002:a2e:8e96:0:b0:2a7:8402:c934 with SMTP id
 z22-20020a2e8e96000000b002a78402c934mr1460102ljk.10.1681263505347; Tue, 11
 Apr 2023 18:38:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Apr 2023 18:38:24 -0700
MIME-Version: 1.0
In-Reply-To: <20230331091145.737305-5-treapking@chromium.org>
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 11 Apr 2023 18:38:24 -0700
Message-ID: <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, 
 Daniel Scally <djrscally@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <groeck@chromium.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, 
 Prashant Malani <pmalani@chromium.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 chrome-platform@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Pin-yen Lin (2023-03-31 02:11:39)
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index b42553ac505c..604c7391d74f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -12,7 +12,8 @@ maintainers:
>
>  description: |
>    The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> -  designed for portable devices.
> +  designed for portable devices. Product brief is available at
> +  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
>
>  properties:
>    compatible:
> @@ -112,9 +113,40 @@ properties:
>                data-lanes: true
>
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>          description:
> -          Video port for panel or connector.
> +          Video port for panel or connector. Each endpoint connects to a video
> +          output downstream, and the "data-lanes" property is used to describe
> +          the pin connections. 0, 1, 2, 3 in "data-lanes" maps to SSRX1, SSTX1,
> +          SSRX2, SSTX2, respectively.
> +
> +        patternProperties:
> +          "^endpoint@[01]$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            properties:
> +              reg: true
> +
> +              remote-endpoint: true
> +
> +              data-lanes:
> +                oneOf:
> +                  - items:
> +                      - enum: [0, 1, 2, 3]
> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +
> +                  - items:
> +                      - const: 2
> +                      - const: 3
> +
> +              mode-switch:

Is it possible to not have this property? Can we have the driver for
this anx device look at the remote-endpoint and if it sees that it is
not a drm_bridge or panel on the other end, or a DP connector, that it
should register a typec mode switch (or two depending on the number of
endpoints in port@1)? Is there any case where that doesn't hold true?

I see these possible scenarios:

1. DPI to DP bridge steering DP to one of two usb-c-connectors

In this case, endpoint@0 is connected to one usb-c-connector and
endpoint@1 is connected to another usb-c-connector. The input endpoint
is only connected to DPI. The USB endpoint is not present (although I
don't see this described in the binding either, so we would need a
port@2, entirely optional to describe USB3 input). The driver will
register two mode switches.

2. DPI to DP bridge with USB3 to one usb-c-connector

In this case, endpoint@1 doesn't exist. The SSTX1/2 and SSRX1/2 pins are
all connected to a usb-c-connector node. The input ports (0 and 2) are
connected to both DPI and USB. The device acts as both a mode-switch and
an orientation-switch. It registers both switches. I wonder if there is
any benefit to describing SBU connections or CC connections? Maybe we
don't register the orientation-switch if the SBU or CC connection isn't
described?

3. DPI to DP bridge connected to eDP panel

In this case, endpoint@1 doesn't exist. The USB endpoint is not present
(port@2). Depending on how the crosspoint should be configured, we'll
need to use data-lanes in the port@1 endpoint to describe which SSTRX
pair to use (1 or 2). Or we'll have to use the endpoint's reg property
to describe which pair to drive DP on. Presumably the default
configuration is SSRX2/SSTX2 providing 2 lanes of DP to an eDP panel.
The endpoint@0 in port@1 will be connected to a drm_panel, and the
driver will be able to detect this properly by checking for the
existence of an aux-bus node or the return value of
of_dp_aux_populate_bus().

4. DPI to DP bridge connected to DP connector

This is similar to the eDP panel scenario #3. In this case, endpoint@1
doesn't exist. The USB endpoint is not present (port@2). Same story
about port@1 and lane configuration, but we don't have an aux-bus node.
In this case, the drivers/gpu/drm/bridge/display-connector.c driver will
probe for the dp-connector node and add a drm_bridge. This anx driver
will similarly add a drm_bridge, but it needs to look at the node
connected on port@1:endpoint@0 with drm_of_get_bridge() and check if it
is a drm_bridge (DP connector) or if it is some type-c thing (connector
or orientation-switch).

I think having this mode-switch property here lets us avoid calling
drm_of_get_bridge() unconditionally in anx7625_parse_dt().
drm_of_get_bridge() will always return -EPROBE_DEFER when this is the
last drm_bridge in the chain and the other side of the endpoint is a
type-c thing (scenarios #1 and #2). Maybe we should teach
drm_of_get_bridge() that a drm_bridge might be connected to a type-c
device and have it not return -EPROBE_DEFER in that case. Or make some
new API like drm_of_get_bridge_typec() that checks if the typec
framework knows about the endpoint in question (as either a typec switch
or a connector) and returns a NULL bridge pointer. If we had that then I
think this property is not necessary.

Hopefully the usb-c-connector can always be registered with the typec
framework? I'm worried that the driver that registers the
usb-c-connector node may want to form a struct typec_port with
typec_register_port() and that will get stuck in a similar -EPROBE_DEFER
loop waiting for this mode-switch to appear. So having this property
also avoids that problem by telling typec framework to wait until this
driver can register a mode-switch.

TL;DR: Is this mode-switch property a workaround for probe defer? Can we
figure out where the mode switch is in software and not have the
property in DT? If we can it would certainly improve things because
forgetting to add the property can lead to broken behavior, and we don't
do anything like this for chains of drm_bridge devices. We just describe
the display chain and let the kernel figure out which bridge should
handle hpd, edid reading, or mode detection, etc.
