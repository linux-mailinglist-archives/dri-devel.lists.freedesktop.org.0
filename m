Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851D351E1A2
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602BF10E6C2;
	Fri,  6 May 2022 22:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929A310E44D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 22:40:01 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id r185so4204065oih.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 15:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6BDcq2/11wXT5ygpG8JsCxIz2tjuPiA5pRN86PbS0vI=;
 b=jbs5GssSFOnbQ+sz4Lj0L5iTK14pe2NiIBSoHla7+XieIlNAp9oQFGY9PZ1Yp1L6V0
 xiSqHLBjLEUY3MqDO2jTqGo+0npy2GFadgNejLjjvFDqXiJjEG030xokQhOOIjKnoQ9z
 vgk19+j2S12ozvImeZcqkjBrgaFNVZxGuuMzjTM0/W7Lg2S6yKgQLeLyX8XgCbQj+ho8
 J66dyrGxfsV2Uja7N+Al/SVJQVR3YCjuCoPYGQ9eQViElU5Rw3exrEGH/20iPpp/P2Ls
 Oj5LU2d0HAkX3SflDQkMplPJQaLp3A6Hz/kCaxD+X19OcC7uI7iZ7f4VNGlDJTx0Fpcs
 ahmw==
X-Gm-Message-State: AOAM530ETs9DrHTEWQjuMiz1obPFdsLRuRlkKBoKXA99Sa4PlPyXp4+x
 YzhDdEXHK9/maKN+2t2hdw==
X-Google-Smtp-Source: ABdhPJykNbPqgTnhxpQ3+9FySStpxKn6CnG4HKiaM88MdReBQJlRzfsjbL84a8XB3b8YS+Vagne/ig==
X-Received: by 2002:a54:460b:0:b0:322:7964:1b60 with SMTP id
 p11-20020a54460b000000b0032279641b60mr2534634oip.16.1651876801265; 
 Fri, 06 May 2022 15:40:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k2-20020a056870570200b000edae17a8cesm2166063oap.3.2022.05.06.15.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:40:00 -0700 (PDT)
Received: (nullmailer pid 2407417 invoked by uid 1000);
 Fri, 06 May 2022 22:39:53 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20220506181034.2001548-6-l.stach@pengutronix.de>
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
 <20220506181034.2001548-6-l.stach@pengutronix.de>
Subject: Re: [PATCH v0.5 5/9] dt-bindings: phy: add binding for the i.MX8MP
 HDMI PHY
Date: Fri, 06 May 2022 17:39:53 -0500
Message-Id: <1651876793.663191.2407416.nullmailer@robh.at.kernel.org>
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

On Fri, 06 May 2022 20:10:30 +0200, Lucas Stach wrote:
> Add a DT binding for the HDMI PHY found on the i.MX8MP SoC.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.example.dts:29.45-46 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.example.dtb] Error 1
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

