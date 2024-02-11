Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5A8509A4
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 15:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8D510E1B6;
	Sun, 11 Feb 2024 14:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EJLCdW2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBE110E1B6
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 14:31:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F09F60C54;
 Sun, 11 Feb 2024 14:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A82C43394;
 Sun, 11 Feb 2024 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707661882;
 bh=M2ROTBpPPeoXDo4q3ygSvsi+wjQ5/8bZ4o1Eldz6b5Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=EJLCdW2oul0Wqblq4lCB7WW4E4SNMavTBqZtnuAHxWR+QBN61F/n5TJEVdA9tGRxE
 yfdONdRZaSXQvjanRxLxwv9ANlMugq3og4e/mL/5HWGQTvuuRkcTcLBplFRyoNF7os
 iFNk2dmijQG513ac3YQ6ShvU/RJIy13r8ULqYNyfVLtypqFN/vsU1JhPGVLi87RVmE
 73ndYszdKOLu/IULVyhRKKwvubgqkWkBxuLi3wa8l5mgjYQAExrMLRUSWZl5U/daw0
 EUTwxOF4q24fgIBCWsevT44R6hjkPHyLiRKYWhP5vckFcdVffN/zID+tQFAI12Apn+
 MHQMvI1jl0qAw==
Date: Sun, 11 Feb 2024 08:31:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Simha BN <simhavcs@gmail.com>, 
 Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20240211095144.2589-4-tony@atomide.com>
References: <20240211095144.2589-1-tony@atomide.com>
 <20240211095144.2589-4-tony@atomide.com>
Message-Id: <170766188030.1496210.4618630360601260863.robh@kernel.org>
Subject: Re: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add
 support for tc358765
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


On Sun, 11 Feb 2024 11:51:08 +0200, Tony Lindgren wrote:
> The tc358765 is similar to tc358775. The tc358765 just an earlier version
> of the hardware, and it's pin and register compatible with tc358775 for
> most part.
> 
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml:87:8: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: allOf:0:if: None is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: allOf:0:then: 'anyOf' conditional failed, one must be fixed:
	'stby-gpios' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml: ignoring, error in schema: allOf: 0: if
Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.example.dtb: /example-0/i2c@78b8000/bridge@f: failed to match any schema with compatible: ['toshiba,tc358775']
Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.example.dtb: /example-1/i2c@78b8000/bridge@f: failed to match any schema with compatible: ['toshiba,tc358775']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240211095144.2589-4-tony@atomide.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

