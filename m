Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261D542B3E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B1E10E2C5;
	Wed,  8 Jun 2022 09:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246CD10E751
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:18:38 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id d14so660173eda.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uslo1ay+/qxoDJknXX4jPIC6SbHTLg2hMT/co1gVHAM=;
 b=Pqt7muh1OBZiOFSiS3jyVF1QSLKEUn1uSY8nr2V3ACJvzmkgVnQHkAfGVZauD+0c1v
 +hbhGHn5MnERl91/CB0MMUI9XDTrcXhx0xM3sYOanaEnHzpdQmnI3TNih+WK9C1iHNkT
 xYWWuW3xA5Ocf/tmlVbVefF7Jso7rh5Jh4AGyQ0BuqDFP19TMjU4BRRmRMAqtP+wrr2c
 1hK3Qb1ssTEMomdCVyzMefEjWQ98Tl0LZxhibkrlEE8aFG/MV2Mv36nNxUfUbo2ChLCz
 iEzuVGRJ22qzlV6VKnZGcI7LF9aLW+tFAh1BdCSbZAEdRsoACcYubLtMyucU9tKAXSi5
 /1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uslo1ay+/qxoDJknXX4jPIC6SbHTLg2hMT/co1gVHAM=;
 b=lh5MJYW+SS2AcERFHLjXgxlL82w5BTMyeqKRabUcjS8V93cUtYZqz11ROl/zel9gMn
 +8wBoZOOtt3XvLHbnVvIzWa5wEgcFJJ4h6g4Db/MGCGvBUA214CBFlqyoWv2KrmlV/Mz
 MYHK4hI2RKXK9NWNdTbNlg0F91fYlb5X8T1XeEIrJ72qvK9OLy2ehapXCfVGHyPayw/A
 imSEmwQHuHWCBZ9nkzIdoREC3SwkYcJEBWLc3FVlguT3995ZyHIfwGUs1fiexbziDLGo
 ZidUy40VLxEEgoeUtZ0iyiYuHRTCnGTv4x0igqFmWPslR0p8iQ6C5QaCG9zQmxvfcvdp
 5AXQ==
X-Gm-Message-State: AOAM533e4vhZbG0SmXQT3ni8Ve204z2+GqYCMhrPZps/Ls7io9SQdROJ
 UFuDzLqMEQJYV9tc4cm5aH00vw==
X-Google-Smtp-Source: ABdhPJxhwRETD56REVG88NNrnjg9TIUTndzhZYmh/uo+HYu0/kJkj0sbCqXQDYyYFhdRJ09ufgeBng==
X-Received: by 2002:aa7:d9d9:0:b0:42d:f9e4:49e0 with SMTP id
 v25-20020aa7d9d9000000b0042df9e449e0mr37661598eds.299.1654679916702; 
 Wed, 08 Jun 2022 02:18:36 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e1-20020a1709062c0100b0070bdc059ab2sm7432535ejh.138.2022.06.08.02.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:18:36 -0700 (PDT)
Message-ID: <ba499783-1794-1c00-348a-d912c9562e1e@linaro.org>
Date: Wed, 8 Jun 2022 11:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] dt-bindings: usb: Add Type-C switch binding
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-4-pmalani@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607190131.1647511-4-pmalani@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2022 21:00, Prashant Malani wrote:
> Introduce a binding which represents a component that can control the
> routing of USB Type-C data lines as well as address data line
> orientation (based on CC lines' orientation).
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>  .../devicetree/bindings/usb/typec-switch.yaml | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> new file mode 100644
> index 000000000000..60a600a63fef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
> @@ -0,0 +1,76 @@
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
> +    items:

Single item, so no need for items.

> +      - enum:
> +          - typec-switch
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

Why true? I see usb-connector has it from commit 6a0e321ea735
("dt-bindings: Explicitly allow additional properties in common schemas")
 but that looks also weird - this is not a common schema, but a
complete, generic one.

> +
> +examples:
> +  - |
> +    anx7625 {

Generic node name.

> +      typecswitch {

I guess here as well, so "usb-switch"?

> +        compatible = "typec-switch";
> +        mode-switch;
> +        orientation-switch;
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            anx_ep: endpoint {
> +              remote-endpoint = <&typec_controller>;
> +            };
> +          };
> +        };
> +      };
> +    };


Best regards,
Krzysztof
