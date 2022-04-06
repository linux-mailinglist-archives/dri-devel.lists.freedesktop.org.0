Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67E4F6ADF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 22:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01A810E030;
	Wed,  6 Apr 2022 20:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765A710E030
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 20:08:26 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso2477054ots.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 13:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Jba1vSeRP1HF/2xdMVwK3zKEPMIqomVyRzHfIeKZsuY=;
 b=OqbGzrbdQnU2SAMUgor+PTv3HcYIVtU/ZV21ASgt6CyES+8nXa8HXyGkDwGSDu5PIY
 gV9tLVb9Ilbws9BtgcwXLZdP0jSjO5+/Q3ER2RQQl0bgb+wst65S4t/voFDaz4iv2Jj0
 pPfHD7Mi793SA9g6p/qYII1XwwJ96UvLy2lGtey7rp1psMQLv4SRuJjf36fGVa5w45V/
 fSXd8qFesRI6HE+TEsU86Vj+7Tn4pM23hCUkKwybiPlbkSn1Suah8w2+bHtHgasDeHLb
 M9iTB8EtkiPOli6k+Tv+HCNqesW3sY3r4HDL81+a2SxFGM6uNXjLKizzcIVCEAeW0mkG
 jI9A==
X-Gm-Message-State: AOAM5337yOQ1TdLuErJJE0Lsydg/biOJmswYPwq+9CaevHMLZUufSf0S
 fJmh3PFdYHl1y7Z/ndRKPg==
X-Google-Smtp-Source: ABdhPJymdB2qRyAE4P6pRY0v0g5bx14Pp9fxc/u5M6zMOtOt95SXs96EoRWJvD2Hj1G1XlilxiDxKg==
X-Received: by 2002:a05:6830:1498:b0:5cd:a787:e8c1 with SMTP id
 s24-20020a056830149800b005cda787e8c1mr3759352otq.11.1649275705675; 
 Wed, 06 Apr 2022 13:08:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s22-20020a056830149600b005b24a96174asm7200413otq.8.2022.04.06.13.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 13:08:24 -0700 (PDT)
Received: (nullmailer pid 2682168 invoked by uid 1000);
 Wed, 06 Apr 2022 20:08:22 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20220406160123.1272911-5-l.stach@pengutronix.de>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-5-l.stach@pengutronix.de>
Subject: Re: [PATCH v0 04/10] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI PVI
Date: Wed, 06 Apr 2022 15:08:22 -0500
Message-Id: <1649275702.760311.2682167.nullmailer@robh.at.kernel.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Apr 2022 18:01:17 +0200, Lucas Stach wrote:
> Add binding for the i.MX8MP HDMI parallel video interface block.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.example.dts:26.45-46 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.example.dtb] Error 1
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

