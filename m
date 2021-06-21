Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABE13AF228
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 19:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2F76E2D8;
	Mon, 21 Jun 2021 17:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F166E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 17:40:29 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 g19-20020a9d12930000b0290457fde18ad0so4653892otg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=HN13gmA7y3nz/59kVoPJCGFXMqRoOajwJRx5YAglxNM=;
 b=Zz4hJEDjlYUZMvhGLqT83DzbdP2pCb2pqAAQnKbiFvf0mwWKUIFQ0/+JyAaeGEUU6L
 R+/ls82ex91bHa/LRMEHw5WJX2krI593/nIwc7rgSsDJK7LRc3dCoId8bKyuUaGYPBwd
 LGW8DUI8gn7wav8hNHEVbbrD+kmqvisoMG+sjBhJtuM+JnMenNVpRzGKEoW8APAa4Pcs
 /85IW+sTphJSX62MKKShZOXLD/QEDYmEcClG/WiVM5t4fNHO1PA8gHkuhhcS/N/3z5Ch
 5UfBE04Dg1LmdV1Oi42F5j+fYWM9rG0IoSoWnO4LZT5ejle8iibsszI3DemTMXM6ww3d
 AKtw==
X-Gm-Message-State: AOAM532p8cCRke0uoSvbrBRKniJ9Mhk25fWS0YovJN28I1N7mzM8ysJo
 eonrDcWKSYs9IdTUFsIYTw==
X-Google-Smtp-Source: ABdhPJxGwFqtkOtwDEBJ3jIvQc8diAPAd9rGu2tJSvFeQ6qyy/qsnWkiPbHoebGF3hQmi+JBnknbfw==
X-Received: by 2002:a9d:7d07:: with SMTP id v7mr21673915otn.204.1624297228726; 
 Mon, 21 Jun 2021 10:40:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p25sm3661220ood.4.2021.06.21.10.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 10:40:28 -0700 (PDT)
Received: (nullmailer pid 1161635 invoked by uid 1000);
 Mon, 21 Jun 2021 17:40:02 -0000
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20210621072424.111733-2-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-2-jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 1/9] dt-bindings: display: bridge: Add Samsung SEC
 MIPI DSIM bindings
Date: Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.352850.1161634.nullmailer@robh.at.kernel.org>
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
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 12:54:16 +0530, Jagan Teki wrote:
> Samsung SEC MIPI DSIM Bridge controller is MIPI DSI bridge
> available in NXP's i.MX8M Mini and Nano Processors.
> 
> Add dt-bingings for it.
> 
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../display/bridge/samsung,sec-dsim.yaml      | 184 ++++++++++++++++++
>  1 file changed, 184 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.example.dts:20:18: fatal error: dt-bindings/power/imx8mm-power.h: No such file or directory
   20 |         #include <dt-bindings/power/imx8mm-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/bridge/samsung,sec-dsim.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494924

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

