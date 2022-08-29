Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63CA5A4077
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 02:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD85210F00C;
	Mon, 29 Aug 2022 00:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965FE10F00C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 00:46:38 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 s10-20020a0568302a8a00b0063b1cac26deso2816841otu.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 17:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=jG76vHCaDSfTC668k+E6lh3DddsaHQtM+f7tt8B3rco=;
 b=RJ7uB0p/8HhZlE9TMtClk5RFIZKRg2V7tPoix80NeYzT73a/BzPI1RWi6HXZV+GWbP
 9hhZGAqVC+PEkl/DYbTfwqq+blS128t53LGhbRpIm6H4Ci6Tfgv9Kwo5mVamKK5acamd
 nSH2BBn0oRBEiSLxA6s4G1b53HZ8KQXKIi3CLw9wKGgqC2M2FqDslwib16c8iPfsccl7
 f8r5dfPbLSy8XP/nlY3IdO1PiDeyByUgnPslPfsjZ7hU3nzMKcJqmAAxIIEOtC4he1Ik
 ZU4j5jt952lY7CEv+UsV9+cVMXZegdc2XoMnQLZloxSIsX5ER/dj07qhmyFp3e1yS9YB
 Spug==
X-Gm-Message-State: ACgBeo3TMg2fdbhQ4GCUFFrnHoMKvEeC3xVo/wL21ULvgVKHUvjpQui9
 d+0digouGnQlhb9AXFPBTA==
X-Google-Smtp-Source: AA6agR7Jxjc+RWeZEYuKslOFfZDus4+k/GRobiiixwqr222gj8+gqdOoCtWhPtDKhkbOm+ioR+HMbQ==
X-Received: by 2002:a05:6830:1281:b0:636:d7e9:1906 with SMTP id
 z1-20020a056830128100b00636d7e91906mr5656718otp.116.1661733997747; 
 Sun, 28 Aug 2022 17:46:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 be36-20020a05687058a400b0010c0d04eb00sm5568174oab.2.2022.08.28.17.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 17:46:37 -0700 (PDT)
Received: (nullmailer pid 75735 invoked by uid 1000);
 Mon, 29 Aug 2022 00:46:36 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20220826192424.3216734-1-l.stach@pengutronix.de>
References: <20220826192424.3216734-1-l.stach@pengutronix.de>
Subject: Re: [PATCH 1/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI TX
Date: Sun, 28 Aug 2022 19:46:36 -0500
Message-Id: <1661733996.323919.75734.nullmailer@robh.at.kernel.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Aug 2022 21:24:21 +0200, Lucas Stach wrote:
> The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
> core with a little bit of SoC integration around it.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
>  .../bindings/display/imx/fsl,imx8mp-hdmi.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.example.dtb: hdmi@32fd8000: clock-names:2: 'cec' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.example.dtb: hdmi@32fd8000: clock-names:3: 'pix' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.example.dtb: hdmi@32fd8000: clock-names:4: 'fdcc' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

