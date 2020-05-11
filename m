Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC931CE7AF
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 23:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAC96E5A2;
	Mon, 11 May 2020 21:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D926E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 21:47:30 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k110so8875188otc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 14:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kr536AH92tCs886e1ZVZycHlp8zzTbbAYS9sSy9+r90=;
 b=e0yFk21iix3dRW+gRpBeesWqrDjGwUz3Xo+9VWwLIkEEvkH4i2rjZfKLRZfDaD36NH
 H/nhvIPQiLltfwLJqGgUMhTHTqukrbm3TrQigw0WVtIThgxoKzhsBaVnlgBWD+2L792H
 zCDiGoMAEA2oP0zeHJjJdk/iSMldK9GYEC1jWxmTPoSQbPHFQaObh6R8WDGK8OvFLAR6
 Qs1Q2pCxRnEacAw8Vs/JbsuBi0rzlVgOByffMQQNiN/hI6fPBX6HBu41zI3C6ToMfpRD
 wE3z037aHlxkmvqY7q99/lBt7UfOl1mOIcMWnHbLFqc5u5PyENMhzvR5VhYqfmH2qz+m
 rqvA==
X-Gm-Message-State: AGi0PuaelZll+uEWf7LmwoWgXvyPRqA6OffJRmJt5xSRJEbHs1WtGSp1
 m6GNNzxlLxN7Vo6AUAi2yg==
X-Google-Smtp-Source: APiQypL9c25jA4qb587PTmaLEbxVx0mD5FwZCOgGZkDio2qGfy6/FFbMg2/4qBhezaAEnuubpNLpxA==
X-Received: by 2002:a9d:6c94:: with SMTP id c20mr14832489otr.318.1589233650111; 
 Mon, 11 May 2020 14:47:30 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l187sm4956929oig.0.2020.05.11.14.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:47:29 -0700 (PDT)
Received: (nullmailer pid 4611 invoked by uid 1000);
 Mon, 11 May 2020 21:47:27 -0000
Date: Mon, 11 May 2020 16:47:27 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 03/91] dt-bindings: clock: Add a binding for the RPi
 Firmware clocks
Message-ID: <20200511214727.GA20924@bogus>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <69e869b0a79ea17f2cdb79df986409963672495a.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69e869b0a79ea17f2cdb79df986409963672495a.1587742492.git-series.maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 05:33:44PM +0200, Maxime Ripard wrote:
> The firmware running on the RPi VideoCore can be used to discover and
> change the various clocks running in the BCM2711. Since devices will
> need to use them through the DT, let's add a pretty simple binding.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> index cec540c052b6..b48ed875eb8e 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> @@ -22,6 +22,25 @@ properties:
>        Phandle to the firmware device's Mailbox.
>        (See: ../mailbox/mailbox.txt for more information)
>  
> +  clocks:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: raspberrypi,firmware-clocks
> +
> +      "#clock-cells":
> +        const: 1
> +        description: >
> +          The argument is the ID of the clocks contained by the
> +          firmware messages.

Not really any reason to make this a child node. The parent can be a 
clock provider.

> +
> +    required:
> +      - compatible
> +      - "#clock-cells"
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - mboxes
> @@ -31,5 +50,10 @@ examples:
>      firmware {
>          compatible = "raspberrypi,bcm2835-firmware", "simple-bus";
>          mboxes = <&mailbox>;
> +
> +        firmware_clocks: clocks {
> +            compatible = "raspberrypi,firmware-clocks";
> +            #clock-cells = <1>;
> +        };
>      };
>  ...
> -- 
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
