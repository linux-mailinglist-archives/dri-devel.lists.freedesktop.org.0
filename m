Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4368B797
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 09:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A444210E32C;
	Mon,  6 Feb 2023 08:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896210E32C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 08:43:45 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id g28so5736403vkd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 00:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p8oD7R/FrBAkelIyxEM30uYD5gBcZlDZhHvr+FZng8E=;
 b=Nu81GZyEPAhLyKvqA8hK3yjuBadLPq/OVMOmYEObPhNf2/DKkCmXdZqOLJWZqHMyXo
 NZIYjTV+s6RChRPAaCo7wrHHpfathmnstTrzEvaFR0b+kCEoIS6XyE/BdDW+cmQfE5cL
 8lSkomPhvvSestXsJzriH0Mncz82ICUOTfcQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p8oD7R/FrBAkelIyxEM30uYD5gBcZlDZhHvr+FZng8E=;
 b=ViztIns2QHzeZ5EL66nmRVfTM9nmzdyYyVlQGsvYpy4OMGL5Lp31D9vDz3jCJ82KYZ
 bEYyx2pvK0U0mq65ECYjePTdUlxTLqtJnFJf8f4u8SBoPEm6qZltEydjmthP1bcS83GA
 08qF6/cPpwAZGyn0vwK0Y4l/QHdopz6ZfEcsXoRJRA92nxts2yL7psQdytugPyLML6P5
 P/Ejy8dYpA44ErusaEYHBCD15UrONSqpkO2socubtYbEJLNUtxRksJ+N7iHRUq/58/tO
 1fROerFivK46jZ3SwwEg2naL2bYnb6IIUB+itCZgaNxq4jNUX35WMUWtSbJlZO0uXQIT
 ntjQ==
X-Gm-Message-State: AO0yUKV3xQwL48yYnWxjOWSyZZG3C0TDcmbZ1gS26yFilWsPh7AjnQA/
 2I/PxBdwdGyr95SRMjUIsR2yLBt6Mha4XQCzyzv1OQ==
X-Google-Smtp-Source: AK7set8rfNXDkSD7s7g/Z9Yi+fgiFxMAJA536L7Dzqiaomn/KaU5rwWRdIO8WqqAsbdrjqdw1OE5rCloQrh5y08A5OA=
X-Received: by 2002:ac5:cac7:0:b0:3ea:7394:e9ef with SMTP id
 m7-20020ac5cac7000000b003ea7394e9efmr2630363vkl.11.1675673024627; Mon, 06 Feb
 2023 00:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-5-treapking@chromium.org>
In-Reply-To: <20230204133040.1236799-5-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Feb 2023 16:43:33 +0800
Message-ID: <CAGXv+5Gf5r4Unz+JCHUJS33uvuxPRDnwi=vTfxyM4rPTQZ0xbw@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 4, 2023 at 9:31 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Analogix 7625 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
>
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
>
> Also include the link to the product brief in the bindings.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ---
>
> Changes in v11:
> - Updated the description of the endpoints
> - Referenced video-interfaces.yaml instead for the endpoints
>
> Changes in v10:
> - Collected Reviewed-by and Tested-by tags
>
> Changes in v9:
> - Collected Reviewed-by tag
>
> Changes in v8:
> - Updated anx7625 bindings for data-lane property
> - Fixed the subject prefix
>
> Changes in v7:
> - Fixed issues reported by dt_binding_check
> - Updated the schema and the example dts for data-lanes.
> - Changed to generic naming for the example dts node.
>
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
>
>  .../display/bridge/analogix,anx7625.yaml      | 94 ++++++++++++++++++-
>  1 file changed, 91 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 4590186c4a0b..f287e8e0602f 100644
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
> @@ -112,9 +113,46 @@ properties:
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
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3

Given that this bridge only supports up to two lanes, including all four
lanes doesn't make sense.

> +
> +              mode-switch:
> +                type: boolean
> +                description: Register this node as a Type-C mode switch or not.

I would reword this as "Serves as Type-C mode switch if present"

ChenYu
