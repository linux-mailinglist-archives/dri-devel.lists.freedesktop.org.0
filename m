Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2F51E19F
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9F310E29F;
	Fri,  6 May 2022 22:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE8210E253
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 22:39:59 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so8296567fac.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 15:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=gdnoN48c4OtIQTvkUpqjNfjiuzwFbiiCs1QABjCyBsY=;
 b=WiRuaWu8BCya+Of/bzuyTXHGJyBJwEEYh/w9bPJc1gLlx4+CcOLRXdMi/LCk2so9UT
 XfHLiRHzknG7wn62/LB2gv81plGsoC3kp7lOCJrtGK84j2z+ZM/XCNxgPGlwog7eRpSE
 2COd1uLgW830OD/OPRfgXOdRm0TX1ldI9ux1SoyqFP8xCq2RNCcAGcMzJ1B7nOnSEfnT
 hs5LGAHXDvoKjWL5zCpAOKQkfT/83tjpc53qFxG7NFpxB/PYi9ix+inW3xHfWzrwP6q6
 43gqFJ3wDyTV5Q1cMJ1waef0awvzQHc5CPqjydIXpC6KttTT6mQaZcIGlf2g7IOkGo6u
 OzEQ==
X-Gm-Message-State: AOAM532BHAX8Rj9wMhg1MBeU7bkSgJG4S4eC/s6oRw6GzSaQExRpjSkB
 xVGGwMG2+yJmTKvZDoFBmNSC1MkfoA==
X-Google-Smtp-Source: ABdhPJypMneSibUbRivL8Yoczz0j4CFSkTRWYurL+negj4qJZ/gZTxYlBuqjNPARGG9bxw2fstna9g==
X-Received: by 2002:a05:6870:d68e:b0:e2:af08:6cc3 with SMTP id
 z14-20020a056870d68e00b000e2af086cc3mr5506584oap.189.1651876798315; 
 Fri, 06 May 2022 15:39:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g93-20020a9d2de6000000b0060603221240sm2113095otb.16.2022.05.06.15.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:39:57 -0700 (PDT)
Received: (nullmailer pid 2407415 invoked by uid 1000);
 Fri, 06 May 2022 22:39:53 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20220506181034.2001548-4-l.stach@pengutronix.de>
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
 <20220506181034.2001548-4-l.stach@pengutronix.de>
Subject: Re: [PATCH v0.5 3/9] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI PVI
Date: Fri, 06 May 2022 17:39:53 -0500
Message-Id: <1651876793.651712.2407414.nullmailer@robh.at.kernel.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org,
 Robert Foss <robert.foss@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 May 2022 20:10:28 +0200, Lucas Stach wrote:
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

