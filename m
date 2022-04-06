Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A94F6ADE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 22:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0800810E028;
	Wed,  6 Apr 2022 20:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEEE10E028
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 20:08:24 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id q189so3546388oia.9
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 13:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Ij58TvIE+TDuatjfhEwf9b3mQ663OItZ9ImpiU3kgrI=;
 b=P8CdJ2pdu1/j1fdQjqJhqQgUADh8DM4e8jIhM5+K6kMEraf++MsHdC63mwcG2+3bU4
 EoT67Y310hOwitxBpaE7ZaMlwhtmtwhz3h0ZQ0DRClkO2fPSaRm8trPfkOsiyK+4ciEb
 2weV9DQB7GZ+0QkcI88sUTxn750Yh9Qk1tjtkYzZUdaHOYyhHe40p+auiZIMb4sSmDnB
 8LR5ULv78Hoi23K0ktgy9Iwhdsxlc0apWzvJb1IwYhOe014bUsveUdydEBcLEH+uggbY
 D8YmMmAyyW0BYFvy4NtI7dswmoLPjjS+QBhyhpwezaCTCsFfgWnfJIQ4AYS7xgFbbxL0
 hYww==
X-Gm-Message-State: AOAM5322P1DUVLleokz07affNQYugxTSS3eFYBEbELMWQguXCFb9B48e
 Dqs3aVnV90hsx2/dG5XkXQ==
X-Google-Smtp-Source: ABdhPJxYnIz2g0qPXdqTbqLE0eqrv8euhVAVjzwh4ZLxVREAHMcDwMoJ3msELLzm3uy3CAyi87Z3jQ==
X-Received: by 2002:a05:6808:1b12:b0:2da:28e1:39f7 with SMTP id
 bx18-20020a0568081b1200b002da28e139f7mr4422301oib.289.1649275703960; 
 Wed, 06 Apr 2022 13:08:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0568301e2400b005c9781086d9sm7003791otr.9.2022.04.06.13.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 13:08:23 -0700 (PDT)
Received: (nullmailer pid 2682165 invoked by uid 1000);
 Wed, 06 Apr 2022 20:08:22 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20220406160123.1272911-3-l.stach@pengutronix.de>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-3-l.stach@pengutronix.de>
Subject: Re: [PATCH v0 02/10] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
Date: Wed, 06 Apr 2022 15:08:22 -0500
Message-Id: <1649275702.749756.2682164.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 patchwork-lst@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Apr 2022 18:01:15 +0200, Lucas Stach wrote:
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.example.dts:36.45-46 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

