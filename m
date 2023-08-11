Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A708779130
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 16:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACC410E69D;
	Fri, 11 Aug 2023 14:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FEE10E69D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 14:01:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E22266434;
 Fri, 11 Aug 2023 14:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24B3C433C7;
 Fri, 11 Aug 2023 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691762458;
 bh=C4cXeWQX/r0IzEoOEZ08WLIpkcXhN7kt7P6JcA2SsfA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rjOirqlUfvyMrYGK2PVWBJ5zUsGe2FKOjHY1dp1jcP9Za9VNrHnzeLPV7j1s1GKa1
 pnp1TVUnexW5wXbSCI3Uk3aG2vO8T4NzWCjTg3lJK8GOE2Ino+Ns0Y/bKJM3NavB2d
 3iUhkptkfGP3N80QGn989MfZaaFKYrBXKHxS/3AgluHVulS8sMU19qP0/juWN2eCCY
 DRFczAh/0LRrjffN/6Wp78U0yrotycsm4dPQ5UJL878xSXCDzRFY+d6EZFHZXMjbS9
 cuExJx9o92mxn5k/NIJeQDrfDBE/26mqajanE/DM4vYlIGsPLyiz2hHJqA/dR5sOLK
 H24h7Nxq2gFqQ==
Received: (nullmailer pid 3322998 invoked by uid 1000);
 Fri, 11 Aug 2023 14:00:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230810144451.1459985-3-alexander.stein@ew.tq-group.com>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
 <20230810144451.1459985-3-alexander.stein@ew.tq-group.com>
Message-Id: <169176235704.3319932.12605780111430379869.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: imx-thermal: Add
 #thermal-sensor-cells property
Date: Fri, 11 Aug 2023 08:00:55 -0600
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 10 Aug 2023 16:44:47 +0200, Alexander Stein wrote:
> This property is defined in thermal-sensor.yaml. Reference this file and
> constraint '#thermal-sensor-cells' to 0 for imx-thermal.
> Fixes the warning:
> arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: tempmon:
>  '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>  From schema: Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/imx-thermal.example.dtb: tempmon: '#thermal-sensor-cells' is a required property
	from schema $id: http://devicetree.org/schemas/thermal/imx-thermal.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810144451.1459985-3-alexander.stein@ew.tq-group.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

