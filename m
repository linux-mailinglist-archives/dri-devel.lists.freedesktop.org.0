Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E194B0FB4B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 22:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B7810E002;
	Wed, 23 Jul 2025 20:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jCJp0Bf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6E410E002
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:14:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92A505C5835;
 Wed, 23 Jul 2025 20:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BF3C4CEE7;
 Wed, 23 Jul 2025 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753301674;
 bh=jvyd5gZ8Yc1tzNpu1BaLajVAt3Y77GcYmGmUjOFLFAs=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=jCJp0Bf/AVvyIsegdpk6O9POgiv+mu0Bny/CtyWwFvrMp69OgTj5myi8GzhwHxTUi
 Rs/m4O7csK2svQYdW4r0aqRyamyvjCwb57W2a7W61oM5y6R1buAqXbjKROFyg3kZhs
 A530Z7Tx/GvxCY2/g81Dv/dRJrx8dRb3F1DbXTAVSIsHfHMWe5Ypzu+Gcs45iHi0aZ
 u1E7qNk2ryausvb4vs5JGsodns5IqpXZWuBGZyzwg0yqreNnC/mm6Zlc/IPvHEVXzZ
 YI00DFBTcr0mpiQbPC9YIduaVbs5nm+rDt+e5FIsfJGLubEbhjipYca4mNNJWQS0G6
 j2rNAGd16o60g==
Date: Wed, 23 Jul 2025 15:14:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: simona@ffwll.ch, tzimmermann@suse.de, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, mripard@kernel.org, quic_jesszhan@quicinc.com, 
 conor+dt@kernel.org, krzk+dt@kernel.org, airlied@gmail.com
To: Alicja Michalska <alicja.michalska@9elements.com>
In-Reply-To: <20250723145208.338162-2-alicja.michalska@9elements.com>
References: <20250723145208.338162-2-alicja.michalska@9elements.com>
Message-Id: <175330167329.4381.10395843458101350582.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Add Samsung EA8076 panel
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


On Wed, 23 Jul 2025 16:52:08 +0200, Alicja Michalska wrote:
> Add bindings for Samsung EA8076 LCD panel.
> This panel was usually used in mid-high end smartphones manufactured by
> Xiaomi in 2018 and 2019 (Mi 9 Lite and Mi Mix 3, with codenames
> "xiaomi-pyxis" and "xiaomi-perseus", respectively).
> 
> Signed-off-by: Alicja Michalska <alicja.michalska@9elements.com>
> ---
>  .../display/panel/samsung,ea8076.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml:9:111: [warning] line too long (155 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml: ignoring, error in schema: properties: reset-gpios
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml: properties:port: 'Required on platforms using MDSS DSI (Qualcomm).' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml: properties:te-gpios: 'VSync GPIO pin, usually GPIO_ACTIVE_LOW.' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml: properties:reset-gpios: 'Reset GPIO pin, usually GPIO_ACTIVE_LOW.' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml: properties:port: 'Required on platforms using MDSS DSI (Qualcomm).' is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml: properties:te-gpios: 'VSync GPIO pin, usually GPIO_ACTIVE_LOW.' is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml: properties:reset-gpios: 'Reset GPIO pin, usually GPIO_ACTIVE_LOW.' is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/display/panel/samsung,ea8076.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['samsung,ea8076']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250723145208.338162-2-alicja.michalska@9elements.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

