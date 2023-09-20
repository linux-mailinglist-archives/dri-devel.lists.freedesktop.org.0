Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6EF7A8F75
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 00:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF3210E449;
	Wed, 20 Sep 2023 22:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493A410E449
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 22:33:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78C0D61E1B;
 Wed, 20 Sep 2023 22:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E143C433CC;
 Wed, 20 Sep 2023 22:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695249189;
 bh=SBThQbOMOMdYmyDrdiY4+dScgD2UaJ6Jd/k2Lspawco=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uOk2QfJTBwQDO+Hv2Hn3QAXr/yVpQ9Mklh4At1SracF88uIUlVaZVZnpQeAz3F2wX
 HFKXu5ZOvVj49fbD/n++FrtR3JQ8t7AF5+9QV75HrhB3oH9TxnXg9WCiNEFZvZL97I
 MIYKOXv1zU4lqw/sHcXBderrAwdQYWLq3aF3p4mWzJiAAx6kLVbR/gezIT1iEfTdi6
 oAKIRAipLXWtar8tSCbX/2Cc5iyTAK9hQbJZ9iQtWpZfUhelilA2K1PU5ygLkZMhbC
 svL8G+8aLdHXeAogiW1WUhZUzs3ZNmX8K/xEFe97mzaYHU8/oOhcvXBbCI2GMsSBYF
 xlBz+uD+KMzSw==
Received: (nullmailer pid 3103973 invoked by uid 1000);
 Wed, 20 Sep 2023 22:33:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20230920171009.3193296-1-l.stach@pengutronix.de>
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
Message-Id: <169524918454.3103954.3587892243903347971.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI PVI
Date: Wed, 20 Sep 2023 17:33:04 -0500
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
Cc: devicetree@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, patchwork-lst@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 20 Sep 2023 19:10:08 +0200, Lucas Stach wrote:
> Add binding for the i.MX8MP HDMI parallel video interface block.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.example.dtb: display-bridge@32fc4000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230920171009.3193296-1-l.stach@pengutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

