Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38455BC10
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E1510E394;
	Mon, 27 Jun 2022 21:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232F710E394
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:04:11 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id m13so10994329ioj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VA6ORkBSx7XmeTMDyx85R9tA3TNtUa5l/wq0WUtTI6U=;
 b=LiBkRo3KtHlBYrAJF5gh4WfKir2Io1m8DOD4NZh67N8+/A7YURFdJk8aXq2VirMQY7
 IJ8K42Zw+x2/2ezNiLj3vWYCLLjQeWcLlB98RwwSG5SlpYhMM0uVvJ9qDgcjnaAOXV90
 ewEjRBdIsBI347kfyMlqS7sQC0Wf3lhl0xl05OSKjACjoH+blU0Wd9r5rV19d7ww0hPE
 FO7R+7XPtivswNI2HUPLGqb05R4+UZKMvJmwFdhMAXtL/g2QR+rtWfAZNsWlB7nt2PBE
 ASSsdoFsSSmGQ1OX4tP8vVQrgyesbuhnxm1MoalmTMiBiBRy+bMoW8Qso7vMB5zIGKIv
 SkXw==
X-Gm-Message-State: AJIora/jiy3UAqudvwozUu8fjci+AxrrCl7iCvSDcQg5rob6Uu8NRv/l
 ygbpxvPocgfmSF9PJOoVHw==
X-Google-Smtp-Source: AGRyM1t4abnkeVbOz7m4JFXhTp+ZgOE+dhLfycD1T0nq7VKCENH5U1t29c/Aixyg12ceJlgkwe/REg==
X-Received: by 2002:a05:6602:2a4b:b0:66a:44ad:89f3 with SMTP id
 k11-20020a0566022a4b00b0066a44ad89f3mr7492274iov.10.1656363850219; 
 Mon, 27 Jun 2022 14:04:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a0566380cc400b00339dbd4c8d7sm5215727jak.45.2022.06.27.14.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 14:04:09 -0700 (PDT)
Received: (nullmailer pid 2954489 invoked by uid 1000);
 Mon, 27 Jun 2022 21:04:07 -0000
Date: Mon, 27 Jun 2022 15:04:07 -0600
From: Rob Herring <robh@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
Message-ID: <20220627210407.GA2905757-robh@kernel.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220622173605.1168416-2-pmalani@chromium.org>
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

On Wed, Jun 22, 2022 at 05:34:30PM +0000, Prashant Malani wrote:
> Introduce a binding which represents a component that can control the
> routing of USB Type-C data lines as well as address data line
> orientation (based on CC lines' orientation).
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v4:
> - Added Reviewed-by tags.
> - Patch moved to 1/9 position (since Patch v4 1/7 and 2/7 were
>   applied to usb-next)
> 
> Changes since v3:
> - No changes.
> 
> Changes since v2:
> - Added Reviewed-by and Tested-by tags.
> 
> Changes since v1:
> - Removed "items" from compatible.
> - Fixed indentation in example.
> 
>  .../devicetree/bindings/usb/typec-switch.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml
> 
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

Unless this child is supposed to represent what the parent output is 
connected to, this is just wrong as, at least for the it6505 chip, it 
doesn't know anything about Type-C functionality. The bridge is 
just a protocol converter AFAICT. 

If the child node represents what the output is connected to (like a 
bus), then yes that is a pattern we have used. For example, a panel 
represented as child node of a display controller. However, that only 
works for simple cases, and is a pattern we have gotten away from in 
favor of using the graph binding.

I think Stephen and I are pretty much saying the same thing.

Rob
