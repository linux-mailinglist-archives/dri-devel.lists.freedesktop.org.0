Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9754F6AE1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 22:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4325710E244;
	Wed,  6 Apr 2022 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A521010E03D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 20:08:28 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-e2442907a1so3778892fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 13:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=9GOGQPLtuasIPU+hPu7wy8z60MF6fDmhm1D+vI0APLI=;
 b=IGBWAuL5T2VSqGUMUZtCaa/+v3DnGX08iua8J4Q9OtZmYnre0wOu9IvBDDv/DnbF+5
 HobJZwq3FtuIU475l7eo6Th3j66bU947DjzBX+yclyT5hZIZ+bAN+5613V19ZEq7CQDG
 RQOWEUn23VkkdqZxIYWsXV4qMZ2fetsEoufVNU1Oywo1OPyF+mCwMQuAoBrTEMeynUp9
 vw0MTy+8jl5K5OyK2DRKU5h691e6v9eOS4bnVy9a/yn9F2GOVS/33D4RRTIB1gGbvnbs
 zQjaKTQzCxvlCMBa1kxFrJOThlb2l/xey65assdEugqJoTGXklZbWm7WjOlHvYqc10SG
 coxg==
X-Gm-Message-State: AOAM530PEUA87MIKUtSBSJ67U4ZKCdw9Ppe1K4Z0TwI+k4DSY6IL58T4
 /A6JixxDKhdT4wcqxpDLng==
X-Google-Smtp-Source: ABdhPJwPM2nBzH3fx/dq32NcGY5jSLBz2GG/NZTBkySkXZIlhqcuKORPud0F4Xp5Kssn3AamEfuZBA==
X-Received: by 2002:a05:6870:f20e:b0:e1:c609:74d8 with SMTP id
 t14-20020a056870f20e00b000e1c60974d8mr4701557oao.34.1649275707803; 
 Wed, 06 Apr 2022 13:08:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm7028605oih.53.2022.04.06.13.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 13:08:27 -0700 (PDT)
Received: (nullmailer pid 2682170 invoked by uid 1000);
 Wed, 06 Apr 2022 20:08:22 -0000
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20220406160123.1272911-7-l.stach@pengutronix.de>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-7-l.stach@pengutronix.de>
Subject: Re: [PATCH v0 06/10] dt-bindings: phy: add binding for the i.MX8MP
 HDMI PHY
Date: Wed, 06 Apr 2022 15:08:22 -0500
Message-Id: <1649275702.767869.2682169.nullmailer@robh.at.kernel.org>
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
 patchwork-lst@pengutronix.de, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Apr 2022 18:01:19 +0200, Lucas Stach wrote:
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

