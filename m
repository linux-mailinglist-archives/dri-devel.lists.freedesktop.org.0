Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803E51E19D
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA0A10E1D1;
	Fri,  6 May 2022 22:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458FF10E1D1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 22:39:56 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-edf9ddb312so7762037fac.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 15:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=EARAirmRDARZJDnc2wIGPiTE3SCh1Sk7ihIbfULQouQ=;
 b=Nja2Xv4uLL8Ke57tzQUH/ZOnfE0zyCr2rkVIqScyDM+772e3G1Vrj+HrgK4Tp37qLN
 WPppIZ0rqqDgq2CS29hFJvkcQKmrL1MXMTUXSdxPrMFaLVUBxxBXAJOrxFjxFMWYga2I
 tsjAnvAtopkAGdkA6ijy9MTcgWdQ3LJCNjxQCf7T2pvhGxb318ivhg9i8uwnf2Q9MbR4
 204g6oVPdKSwk7TBjHmKWvv/4p0CwkYh591/M6b3y4gnftrZMZ0yGYxqqUy/hcY0/YUT
 goWQA6ZzaOGOPG+c+hGGOYFUMLZAs0pMAX7Zx+gTN56D23WBBSwxpEw6XcQOY7iuurJJ
 wngQ==
X-Gm-Message-State: AOAM5302GQbsV1Wk+U0C5wqNNvq7BRbkKUNaTCT47vgA2mzFLW1gjlNj
 32FmARLtipnG9ciYMdl2+Q==
X-Google-Smtp-Source: ABdhPJyCG67cLedleTEytlah9EbrGMeFPIlbBbUWhHQVbzJSRnDcIllrDprW/uYuVOEWDyz152z+xg==
X-Received: by 2002:a05:6870:c59a:b0:e9:3d37:1bbd with SMTP id
 ba26-20020a056870c59a00b000e93d371bbdmr5428453oab.91.1651876795325; 
 Fri, 06 May 2022 15:39:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e6-20020aca1306000000b00325cda1ffb5sm2059016oii.52.2022.05.06.15.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:39:54 -0700 (PDT)
Received: (nullmailer pid 2407412 invoked by uid 1000);
 Fri, 06 May 2022 22:39:53 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20220506181034.2001548-2-l.stach@pengutronix.de>
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
 <20220506181034.2001548-2-l.stach@pengutronix.de>
Subject: Re: [PATCH v0.5 1/9] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI TX
Date: Fri, 06 May 2022 17:39:53 -0500
Message-Id: <1651876793.638106.2407411.nullmailer@robh.at.kernel.org>
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
 Sandor Yu <Sandor.yu@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 May 2022 20:10:26 +0200, Lucas Stach wrote:
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
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

