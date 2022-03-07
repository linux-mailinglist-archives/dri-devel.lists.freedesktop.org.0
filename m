Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54444D0443
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC94A10E07B;
	Mon,  7 Mar 2022 16:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915CC10E07B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:38:35 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 s35-20020a0568302aa300b005b2463a41faso877513otu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 08:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G2URj90cYLqtG2lIJusw4O3o8WOwpC5yHpCp8rYs1A8=;
 b=VJuuIh/VlDUZ12mRZwlK8a2jY4tZqJFfxOVHY4KlL3443cC0EM6J072hoV/p55wtMh
 6Lji1nv4vcmzzZKsb25QK4O4Uuh/fwciFziFGc1u5Q89lI3NvAr9tNP5JnMwIVJzlXH5
 X/KIB6ngmSgTdbC0UU7uFP0npGGYmXOz3RPqSyS4avm097MQy46NHeVHztUbKTyDcUVA
 NVd52qb0VOjH8+8Y27GtRSm7Qx7H3gTVCrz5rVt1/JOgGU3FO5IUmEk+9XcmUtIhdYMT
 FGedt++wV5UO/fnVYpsLqEN1SSJjjINO0/AcEminT4gRYZzI363E0fmBbZf67zn3adxu
 O9Fg==
X-Gm-Message-State: AOAM5332bAeb6eOIfRALlcc8enHkwdMQ97NiAWfF97cIl0Zd9ZqainEr
 8ui4Hm2diTFJ4jSrKAV+zA==
X-Google-Smtp-Source: ABdhPJwG6TQ1eVLmDZC3HPSQcHalxWCETuB8YBMN2NdaUXdQXdZEWF19x+Z006sW1YkSwErpjfaY6g==
X-Received: by 2002:a9d:6047:0:b0:5b2:4003:cfcb with SMTP id
 v7-20020a9d6047000000b005b24003cfcbmr1164225otj.59.1646671114763; 
 Mon, 07 Mar 2022 08:38:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bb33-20020a056820162100b00320ecc89402sm1427379oob.36.2022.03.07.08.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:38:33 -0800 (PST)
Received: (nullmailer pid 2723434 invoked by uid 1000);
 Mon, 07 Mar 2022 16:38:32 -0000
Date: Mon, 7 Mar 2022 10:38:32 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
Message-ID: <YiY1CP6DkfgU4re/@robh.at.kernel.org>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307154558.2505734-2-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 04:45:57PM +0100, Robert Foss wrote:
> This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.

S-o-b and reason for the revert?

> ---
>  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
>  1 file changed, 2 insertions(+), 63 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 1d3e88daca041..ab48ab2f4240d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -43,70 +43,14 @@ properties:
>    vdd33-supply:
>      description: Regulator that provides the supply 3.3V power.
>  
> -  analogix,lane0-swing:
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 1
> -    maxItems: 20
> -    description:
> -      an array of swing register setting for DP tx lane0 PHY.
> -      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> -      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
> -      [Swing control] setting.
> -      Registers 0~9, bit 3:0 is [Boost control], these bits control
> -      post cursor manual, increase the [Boost control] to increase
> -      Pre-emphasis value.
> -      Registers 0~9, bit 6:4 is [Swing control], these bits control
> -      swing manual, increase [Swing control] setting to add Vp-p value
> -      for each Swing, Pre.
> -      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> -      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
> -      [R Termination control] setting.
> -      Registers 10~19, bit 4:0 is [R select control], these bits are
> -      compensation manual, increase it can enhance IO driven strength
> -      and Vp-p.
> -      Registers 10~19, bit 5:6 is [R termination control], these bits
> -      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
> -      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
> -
> -  analogix,lane1-swing:
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 1
> -    maxItems: 20
> -    description:
> -      an array of swing register setting for DP tx lane1 PHY.
> -      DP TX lane1 swing register setting same with lane0
> -      swing, please refer lane0-swing property description.

These apply to the DP side, so no need to revert this part.

> -
> -  analogix,audio-enable:
> -    type: boolean
> -    description: let the driver enable audio HDMI codec function or not.
> -

Not sure on this one...

>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          MIPI DSI/DPI input.
> -
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint: true
> -
> -              bus-type:
> -                enum: [1, 5]

I think the error here is really 1 should be 4 which corresponds to 
D-PHY which is used by both CSI and DSI. Otherwise, I don't really see 
the issue with bus-type being shared between CSI and DSI.

> -                default: 1
> -
> -              data-lanes: true
> +          Video port for MIPI DSI input.
>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> @@ -143,9 +87,6 @@ examples:
>              vdd10-supply = <&pp1000_mipibrdg>;
>              vdd18-supply = <&pp1800_mipibrdg>;
>              vdd33-supply = <&pp3300_mipibrdg>;
> -            analogix,audio-enable;
> -            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> -            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
>  
>              ports {
>                  #address-cells = <1>;
> @@ -155,8 +96,6 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> -                        bus-type = <5>;
> -                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>  
> -- 
> 2.32.0
> 
> 
