Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168631344E0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 15:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270216E2F2;
	Wed,  8 Jan 2020 14:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E9B6E2F2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 14:21:34 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i1so2714814oie.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 06:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oeAm7H9MXTcOn7oMc/cjvjqdocfYyvFvZAivnMFc/sA=;
 b=Nh62bUXfWML2sbKV3Uw8ZNNC3zuIL7fVPnxVRZ519FPNXJuuUKRwxXwVVO3wt1rb8P
 UO1bw7mCjaTWJnbNNSCw2Atw4EjG6CMNZC9HHcQsXJWkfBpf5cOeSWHVJvifYKR1WX9M
 XrXRJccjPoRaS/xMCrzYxkO5bcWWAEmuW511sSQ8fTn/odgo3/eXFp/pKKbKeoFXc9T9
 YN10OmRkNwQjPHfKg24UElUThwoeIgeiS+VVCT53iPOakXU6BFq9HE6Xtj1mAgTfHGKR
 qRwzjHIf5q7H4X12mqGwWLFbVVOvja0r0a4t5B8OlI3ksyMMXDjaZeVX3DMl/dmAM1Bl
 n1cg==
X-Gm-Message-State: APjAAAXwMth9NXp9r9JnGvkvRQiPDSHNEc+hVNmkmtkMHbHpf92GOmzk
 oOD8L3UlHMIRyaiBt4Ui+gOz0rI=
X-Google-Smtp-Source: APXvYqzGGUyroXykIp3UW7pjmLmHrQkW0Jwu50f1I8q1mz/B0laHj/+zulxtTuVesKpzsSDlJonNmw==
X-Received: by 2002:a54:4086:: with SMTP id i6mr3225810oii.65.1578493293648;
 Wed, 08 Jan 2020 06:21:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h1sm1149023otn.6.2020.01.08.06.21.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 06:21:33 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 22001a
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 08:21:32 -0600
Date: Wed, 8 Jan 2020 08:21:32 -0600
From: Rob Herring <robh@kernel.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 2/3] dt-bindings: display: Add Chrontel CH7033 Video
 Encoder binding
Message-ID: <20200108142132.GA4830@bogus>
References: <20191220074914.249281-1-lkundrak@v3.sk>
 <20191220074914.249281-3-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220074914.249281-3-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 08:49:13AM +0100, Lubomir Rintel wrote:
> Add binding document for the Chrontel CH7033 VGA/DVI/HDMI Encoder.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../display/bridge/chrontel,ch7033.yaml       | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> new file mode 100644
> index 0000000000000..f19b336a99c78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +# Copyright (C) 2019 Lubomir Rintel <lkundrak@v3.sk>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/chrontel,ch7033.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chrontel CH7033 Video Encoder Device Tree Bindings
> +
> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +properties:
> +  compatible:
> +    const: chrontel,ch7033
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Video port for RGB input.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          DVI port, should be connected to a node compatible with the
> +          dvi-connector binding.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dvi-connector {
> +        compatible = "dvi-connector";
> +        ddc-i2c-bus = <&twsi5>;
> +        hpd-gpios = <&gpio 62 GPIO_ACTIVE_LOW>;
> +        digital;
> +        analog;
> +
> +        port {
> +            dvi_in: endpoint {
> +                remote-endpoint = <&encoder_out>;
> +            };
> +        };
> +    };
> +
> +    vga-dvi-encoder@76 {
> +        compatible = "chrontel,ch7033";
> +        reg = <0x76>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&lcd0_rgb_out>;
> +                };
> +            };
> +
> +            encoder_out: port@1 {
> +                reg = <1>;
> +                endpoint {
> +                    remote-endpoint = <&dvi_in>;
> +                };
> +            };
> +
> +        };
> +    };
> -- 
> 2.24.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
