Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C83AF21D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 19:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BEF6E2DF;
	Mon, 21 Jun 2021 17:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEC06E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 17:40:12 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id q10so20719476oij.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=42icZQ+8GFfOaTwG88ozPYml3jznNBXOTDzI2KCtdZY=;
 b=W+wC+gxDnTzfmj3BhNVhl9NVfW0XRix5+2JSNnYLpZFYk/jD+5SfoeixaHfSgW2B/I
 +AnRyWpdTyNCj0Ww6NFeLfhhcdFkxMcN9ZmIcUHA8AkN33fYkXAkSniKPURDmv8kSm9y
 lqYFgAcTw/jC68kozVeQ04sbo2Sa/tlP3El+AKmb/6+TjG97i8emDZRkipReh9lDj3LN
 JEdJjCJflP5rZAZb93t98ZA0h+zsLu8269PPT6Z8Sw8MzIAebh8LGfbIB05CQvObWRrI
 5x0OIstfP5Rj+ivoUHnpOLuiPF5VsNx2JAWxvCAn/oQUe0XNuUQT+Ki9rFhETwv4p7RL
 z4Vw==
X-Gm-Message-State: AOAM532jgNCIfmbB2D3yHpzkeIGyy9J5V+c8dIpJalXDPprgo/WWwERN
 jzQP8KRab4OJ5LbXfg6jlA==
X-Google-Smtp-Source: ABdhPJwlT5h0QKO9Yle57uzgnLiyyYOL2NRu/vSbCoTR9VqstQpf8L5ccpGM5R125N/E7bi9sHGL8w==
X-Received: by 2002:a05:6808:8e6:: with SMTP id
 d6mr25915392oic.147.1624297212142; 
 Mon, 21 Jun 2021 10:40:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u10sm4244248otj.75.2021.06.21.10.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 10:40:11 -0700 (PDT)
Received: (nullmailer pid 1161637 invoked by uid 1000);
 Mon, 21 Jun 2021 17:40:02 -0000
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20210621072424.111733-4-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-4-jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 3/9] dt-bindings: phy: Add SEC DSIM DPHY bindings
Date: Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.363586.1161636.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-amarula@amarulasolutions.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 12:54:18 +0530, Jagan Teki wrote:
> Samsung SEC MIPI DSIM DPHY controller is part of registers
> available in SEC MIPI DSIM bridge for NXP's i.MX8M Mini and
> Nano Processors.
> 
> Add dt-bingings for it.
> 
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../bindings/phy/samsung,sec-dsim-dphy.yaml   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.example.dts:20:18: fatal error: dt-bindings/power/imx8mm-power.h: No such file or directory
   20 |         #include <dt-bindings/power/imx8mm-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/phy/samsung,sec-dsim-dphy.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494925

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

