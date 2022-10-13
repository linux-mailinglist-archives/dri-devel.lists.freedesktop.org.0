Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73A35FD9F0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386BB10E8A1;
	Thu, 13 Oct 2022 13:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 564 seconds by postgrey-1.36 at gabe;
 Thu, 13 Oct 2022 13:07:59 UTC
Received: from smtp-out-06.comm2000.it (smtp-out-06.comm2000.it [212.97.32.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B0110E225
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 13:07:59 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id 7572E5639DE;
 Thu, 13 Oct 2022 14:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1665665911;
 bh=VwMyq6K/Y20d9lPOV/FUqg1ALLGkcp+OHNu++vwyun4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
 b=QAqrBZjY6/M2FLKYEVmxD4MKm7EQg1D0jqIdhgEI1P8ccnfsqSqXeHM6WVovzq1yP
 KRtea5CqX4ChN/TgzTzuU9iRtVj8/HQO8teNsnQ1KV9sR8PFAMwH4vpq4Hb2Z3mC1O
 U5GhOXdkgvgGO6Qk3N8douYN7JKsqXJ3vCLIxogJM8FbRXq5KNYUMBurrcacwUTyRC
 vqDd6ylWojGksPmsNpmBqEqINd9fei3HTHHo09DvKfOv6kx/f/mDlYOyKh6wGlknVg
 5JmGazYqiepBMQLw60hiiDM6DaedyBt1Xi/erFxc0kAwPYtZv9lQVt3jOqqw5XvAf3
 QxsuuxG1N2a0g==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id CF3D87F83D; Thu, 13 Oct 2022 14:58:29 +0200 (CEST)
Date: Thu, 13 Oct 2022 14:58:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Max Krummenacher <max.oss.09@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: add new bus-format property
 for panel-dpi
Message-ID: <Y0gLdQleE64FQgn9@gaggiata.pivistrello.it>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-3-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628181838.2031-3-max.oss.09@gmail.com>
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
Reply-To: francesco.dolcini@toradex.com
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 max.krummenacher@toradex.com,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Max, Marek, Dave et al.

On Tue, Jun 28, 2022 at 08:18:36PM +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The property is used to set the enum bus_format and infer the bpc
> for a panel defined by 'panel-dpi'.
> This specifies how the panel is connected to the display interface.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> 

<snip>

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index dae0676b5c6e..52f5db03b6a8 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -26,7 +26,28 @@ properties:
>    height-mm: true
>    label: true
>    panel-timing: true
> -  port: true
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description:
> +      Input port node, receives the panel data.
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +
> +        properties:
> +          bus-format:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0x1001
> +            maximum: 0x1fff
> +            description: |
> +              Describes how the display panel is connected to the display interface.
> +              Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
> +              The mapping between the color/significance of the panel lines to the
> +              parallel data lines are defined in:
> +              https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
> +

Last month I had the chance to talk in person about this topic with
Dave, Marek and Max in Dublin.

My understanding is that this change is addressing a general need, Dave
confirmed me they have a downstream patch for raspberrypi [1].

From what I could tell the only concern is about the actual encoding of
this `bus-format` property.

I am personally convinced that a simple enum is the way to go, I think
that Marek proposal is adding complexity and not flexibility (from my
understanding Dave is on the same page, just correct me if I
misunderstood you).

The current proposal is already encoding the exact bit placing as
described in Documentation/userspace-api/media/v4l/subdev-formats.rst [2],
this enumeration can be extended to address any future needs
and I would not invent a new one to define the exact same
things (and using the same enum was also suggested by Rob).

Marek: you told me that you had some concern about some valid use case
not covered by this solution, would you mind explaining why that would
not be covered with an addition on this enumeration?

Any other opinion on this topic? How can we move this forward?

Francesco

[1] https://github.com/raspberrypi/linux/commit/8e43f1898191b43aa7ed6e6ca3a4cd28709af86d
[2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html

