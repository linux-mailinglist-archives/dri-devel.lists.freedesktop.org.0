Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9EA487ED
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 19:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847110EB65;
	Thu, 27 Feb 2025 18:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qSHGOAE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED09E10EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 195BF5C62DF;
 Thu, 27 Feb 2025 18:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8B1C4CEDD;
 Thu, 27 Feb 2025 18:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740681523;
 bh=gaDfvyAyEGdnh+pBzY02Mc2ZhsDIKncJW5KgRSiIhjc=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=qSHGOAE5CS9mvoPTeN7OC6NF9NHWFWZPFoNwLuYXD7d6j+4tbS9+oFL593MPL6UC9
 WO18g4G+u9hSw0ethh4nS3l49mnhdnuWJiU0HgStcXfKxAht4DNfVEqhQ5YvTb5KKk
 869/GUT+3g+Tl1O5DtL6bh9OYIMSeCOiglNWNM5tdeFngzwXx/ndkBkcTDbX+I8s8k
 YktWGltKaz+SsAeDoBDyGDffM2R8FrIvpYhm6qsdjCGbfTmQN6ki7lEclXN9G/Rn0f
 SkrZfn9S85iJS2GVAnBdHELGvvCTyjKQQkdn9MIcyjUuU48VAalRlF6x66At3ZFEcl
 Vpw67HHjS+XdA==
Date: Thu, 27 Feb 2025 12:38:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Steven Price <steven.price@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liviu Dudau <liviu.dudau@arm.com>, 
 Simona Vetter <simona@ffwll.ch>, Sebastian Reichel <sre@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227170012.124768-2-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-2-marex@denx.de>
Message-Id: <174068151845.3906421.16004446583205919737.robh@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 27 Feb 2025 17:58:01 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for this reset register.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../reset/fsl,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml: properties:compatible: [{'const': 'fsl,imx95-gpu-blk-ctrl'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml: properties:compatible: [{'const': 'fsl,imx95-gpu-blk-ctrl'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Error: Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.example.dts:21.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-2-marex@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

