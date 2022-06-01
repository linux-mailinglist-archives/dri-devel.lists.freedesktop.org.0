Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5716753AD9D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 22:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3694F10EF1B;
	Wed,  1 Jun 2022 20:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73A310EF1B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 20:17:00 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id l84so4068193oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 13:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KWGUC4uO5PZbQJw1t/pJ6JrU01XaVoUwRy9nGcZRULo=;
 b=qh1BAAMDSwgoImbb6g5u5uvEntW0J0yYatCwXcfYl6VE9PmUPvG0J5AifxLW9StC6v
 JK9+1iQytCdYaC4t6/4XYZAL0SuARTrfGKqfwZVosVNs5BwoXygObHpeYtRserRgRmBp
 3Ue3fnTKq9zmtDFJFgXIXxJYubEJTF4hi60TrM1jpwK35H7hYf5EP2TZSq9Nb3xDZfpb
 n8Rq6eif50WQBv1kmvTGLSGciTqw1xMkC2M/2TJAwVZklGidDyHpicaRaAy52rT5jou7
 A+XYnmgt5ubWWy0JgeckG9fIV5r9gMw/ZrSrw6IcjNQex7Edcw2W5RWyxvcj+fZ/HnGZ
 Oo5w==
X-Gm-Message-State: AOAM530mZXu6ZzUbTMaleLJXQk2cX3r23o4kEVmaY3WlL7ehVzyo3OQd
 70v7u1hj08uc6n3hVhf4BA==
X-Google-Smtp-Source: ABdhPJy46FwaV+/CuAdl76b9QW0BOahsGYFHA8hMlljpnhRVmZB5/xAKRzNhgVlrdw6+EL1l8OAIEg==
X-Received: by 2002:a05:6808:1a8c:b0:32b:df97:b1fa with SMTP id
 bm12-20020a0568081a8c00b0032bdf97b1famr767976oib.184.1654114620054; 
 Wed, 01 Jun 2022 13:17:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r10-20020a4aa2ca000000b0035eb4e5a6cfsm1336181ool.37.2022.06.01.13.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 13:16:59 -0700 (PDT)
Received: (nullmailer pid 365044 invoked by uid 1000);
 Wed, 01 Jun 2022 20:16:58 -0000
Date: Wed, 1 Jun 2022 15:16:58 -0500
From: Rob Herring <robh@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: add new bus-format property
 for panel-dpi
Message-ID: <20220601201658.GA342879-robh@kernel.org>
References: <20220518115541.38407-1-max.oss.09@gmail.com>
 <20220518115541.38407-2-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518115541.38407-2-max.oss.09@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 max.krummenacher@toradex.com,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 18, 2022 at 01:55:38PM +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The property is used to set the enum bus_format and infer the bpc
> for a panel defined by 'panel-dpi'.
> This specifies how the panel is connected to the display interface.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> 
> ---
> 
> Changes in v2:
>     - Fix errors found by dt_binding_check
> 
>  .../bindings/display/panel/panel-dpi.yaml     | 11 +++++++++
>  .../dt-bindings/display/dt-media-bus-format.h | 23 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 include/dt-bindings/display/dt-media-bus-format.h
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index dae0676b5c6e..a20b5898941e 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -21,6 +21,14 @@ properties:
>        - {}
>        - const: panel-dpi
>  
> +  bus-format:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Constraints?

> +    description: |
> +      Describes how the display panel is connected to the display interface.
> +      Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
> +      The mapping between the color/significance of the panel lines to the
> +      parallel data lines are defined in [1].

Just drop the [1] and use a colon.

> +      [1] https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats

Why not just use the V4L number space rather than invent yet another 
number space?

Need a blank line here too.

>    backlight: true
>    enable-gpios: true
>    height-mm: true
> @@ -39,11 +47,14 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/display/dt-media-bus-format.h>
> +
>      panel {
>          compatible = "startek,startek-kd050c", "panel-dpi";
>          label = "osddisplay";
>          power-supply = <&vcc_supply>;
>          backlight = <&backlight>;
> +        bus-format = <DT_MEDIA_BUS_FMT_RGB888_1X24>;

Other properties describing the interface have been put in the endpoint 
node. This should too I think.

>  
>          port {
>              lcd_in: endpoint {
> diff --git a/include/dt-bindings/display/dt-media-bus-format.h b/include/dt-bindings/display/dt-media-bus-format.h
> new file mode 100644
> index 000000000000..c0f2a7b59aa1
> --- /dev/null
> +++ b/include/dt-bindings/display/dt-media-bus-format.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2022 Max Krummenacher <max.krummenacher@toradex.com>
> + */
> +
> +#ifndef __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H
> +#define __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H
> +
> +/*
> + * Attention: Keep these macro names in sync with
> + * include/uapi/linux/media-bus-format.h
> + */
> +
> +#define DT_MEDIA_BUS_FMT_RGB565_1X16		1
> +#define DT_MEDIA_BUS_FMT_RGB666_1X18		2
> +#define DT_MEDIA_BUS_FMT_RBG888_1X24		3
> +#define DT_MEDIA_BUS_FMT_RGB666_1X24_CPADHI	4
> +#define DT_MEDIA_BUS_FMT_BGR888_1X24		5
> +#define DT_MEDIA_BUS_FMT_GBR888_1X24		6
> +#define DT_MEDIA_BUS_FMT_RGB888_1X24		7
> +#define DT_MEDIA_BUS_FMT_RGB888_1X32_PADHI	8
> +
> +#endif /* __DT_BINDINGS_DT_MEDIA_BUS_FORMAT_H */
> -- 
> 2.20.1
> 
> 
