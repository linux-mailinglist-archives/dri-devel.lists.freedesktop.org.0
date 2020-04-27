Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EA1BB088
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 23:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A33389E65;
	Mon, 27 Apr 2020 21:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBBB89E65
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 21:32:02 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id g14so4218345ooa.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w1uDZO2LdODIUIXzVhRK1SKj6P79fg3brB4R+H6ilss=;
 b=N+k2mGrkrRr5JO0y+/r5+lc8Gd43NIVcz6u+wo2WoxLYgTSd0xtHrvWYQLhzyltUuD
 xdQhhhOMZYttSxkl4iXlkbxYNjmfoKKTZrJMZFPJROzJwPOVPtBt2I9tplMkWecq7uDf
 6SGXBHm5iqo9WJ3EwG1EhjOV5bO63/S0wWuXHp0ghomBQ5u4MoiwekMs2rGT2UdDUh3r
 lfiYCtYaxHRWXHMC5Cq1P8f18QpnlElxb5xYpLi8dzuQblJv6a1Q2Z60UXkhc/rvAoPJ
 M3+iFwCYvWHl2TUXOmEoT3o6Y4SiOmtj4Z13EfpTDZu87egEpvqpJEo5tKWZxp9mVri+
 tBqA==
X-Gm-Message-State: AGi0PuanSZVPn9G7rAMnGH4gzPguyLmcKQo9CIxq+sehNXn3GbFZ0/X3
 Ck0PxgLlip4adEn1J37cAQ==
X-Google-Smtp-Source: APiQypJf8rbZu6QH32eGiwrCo4i51dejGBYEAQsVJu6W92eQMIOBXv+t0wckN+3tyVZcrQoflUHTxw==
X-Received: by 2002:a4a:3e8b:: with SMTP id t133mr20894000oot.52.1588023122070; 
 Mon, 27 Apr 2020 14:32:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u1sm2015687oif.54.2020.04.27.14.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 14:32:01 -0700 (PDT)
Received: (nullmailer pid 31301 invoked by uid 1000);
 Mon, 27 Apr 2020 21:32:00 -0000
Date: Mon, 27 Apr 2020 16:32:00 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 27/91] dt-bindings: display: Convert VC4 bindings to
 schemas
Message-ID: <20200427213200.GA30618@bogus>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <abfe72e59b796c86820d933bd81ba5ae0699e5b6.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abfe72e59b796c86820d933bd81ba5ae0699e5b6.1587742492.git-series.maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Apr 2020 17:34:08 +0200, Maxime Ripard wrote:
> The BCM283x SoCs have a display pipeline composed of several controllers
> with device tree bindings that are supported by Linux.
> 
> Now that we have the DT validation in place, let's split into separate
> files and convert the device tree bindings for those controllers to
> schemas.
> 
> This is just a 1:1 conversion though, and some bindings were incomplete so
> it results in example validation warnings that are going to be addressed in
> the following patches.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt              | 174 +------------------------------------------------------------------------
>  Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml         |  66 +++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml        |  73 ++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml        |  75 +++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml         |  37 +++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml |  40 +++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml         |  37 +++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml         |  42 +++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml         |  34 ++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml         |  44 ++++++++++++++++++-
>  MAINTAINERS                                                             |   2 +-
>  11 files changed, 449 insertions(+), 175 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml: properties: '#clock-cells' is a dependency of 'clock-output-names'
Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1276439

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
