Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC61558791
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 20:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449F510E516;
	Thu, 23 Jun 2022 18:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A506B10E516
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 18:30:54 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-101e1a33fe3so512076fac.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Cu7lUOJoF8MsEjjhUXAlemBJalFdNx5NoIAp/Yb+L0Q=;
 b=nQ2MU2YT94Izi+5I8Ke/MStU+26iA3FQ3xvEONgZPTjFfFYPAoizbLAA0uG5U81vpE
 NshxXiXosueJ/uRGjjobd3cG3l1+B6lUmVHBpc3V0PLikCz9a1VG3fhPuwbx3c4KB3sw
 Za5hbikmA8b00LbJhlzEAp8zTbksKTtI3lDHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Cu7lUOJoF8MsEjjhUXAlemBJalFdNx5NoIAp/Yb+L0Q=;
 b=gJedBvQmNX8EKHsRCzbJU9aarTLyG0fquPoN/sy2TTFDsAhgaPwaUTyQhoJHGGsaPB
 vLHU4mXF0n4/zrbyAvHvnTGQN+sstkH95XXCQbu5g+sjsSjkpAcHo4zgljKD96JagnA2
 eYYjBcrUpg0VK/wqA7u/rERGK6RUuDIWOuZbaKGL5/C/TBPP60u2kJ5fvr3pvafkrd+Y
 Z5l50eG966+5EeOJ9zkxoB3vTvgs2EGiHdmJP0pUBVL+whaqwkjpTw35euc7EReQKEA+
 hecydxflWzl3wvIVFaiW3yX057u55Btx5MUvZNSsqMuqeX0z596/3XaCDnrrz6F0cwtx
 w6iw==
X-Gm-Message-State: AJIora+4Qbks46gT/AIIDIr7yuqDrmvm51P7yYz0F8HL4PyK5WzYn2bi
 vJerjwSn2Mf6t/kJ3bHut0RblJI3OGgGPF1Wx21DaQ==
X-Google-Smtp-Source: AGRyM1saP/3AppAsDEde7X7gr4a6wLFmXqfljFPOVADgh3UBV9SWu3eefISwFStbs1Rv04lvbJFDkeSrzdI0yAqIkb4=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr3345847oap.63.1656009053852; Thu, 23 Jun
 2022 11:30:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 14:30:53 -0400
MIME-Version: 1.0
In-Reply-To: <20220622173605.1168416-2-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 Jun 2022 14:30:53 -0400
Message-ID: <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-22 10:34:30)
> diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> new file mode 100644
> index 000000000000..78b0190c8543
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: USB Type-C Switch
> +
> +maintainers:
> +  - Prashant Malani <pmalani@chromium.org>
> +
> +description:
> +  A USB Type-C switch represents a component which routes USB Type-C data
> +  lines to various protocol host controllers (e.g USB, VESA DisplayPort,
> +  Thunderbolt etc.) depending on which mode the Type-C port, port partner
> +  and cable are operating in. It can also modify lane routing based on
> +  the orientation of a connected Type-C peripheral.
> +
> +properties:
> +  compatible:
> +    const: typec-switch
> +
> +  mode-switch:
> +    type: boolean
> +    description: Specify that this switch can handle alternate mode switching.
> +
> +  orientation-switch:
> +    type: boolean
> +    description: Specify that this switch can handle orientation switching.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: OF graph binding modelling data lines to the Type-C switch.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Link between the switch and a Type-C connector.

Is there an update to the usb-c-connector binding to accept this port
connection?

> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - ports
> +
> +anyOf:
> +  - required:
> +      - mode-switch
> +  - required:
> +      - orientation-switch
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    drm-bridge {
> +        usb-switch {
> +            compatible = "typec-switch";

I still don't understand the subnode design here. usb-switch as a
container node indicates to me that this is a bus, but in earlier rounds
of this series it was stated this isn't a bus. Why doesn't it work to
merge everything inside usb-switch directly into the drm-bridge node?

> +            mode-switch;
> +            orientation-switch;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    anx_ep: endpoint {
> +                        remote-endpoint = <&typec_controller>;
> +                    };
> +                };
> +            };
> +        };
