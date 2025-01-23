Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702BCA1A2D5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3B110E7F2;
	Thu, 23 Jan 2025 11:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U6jJOoa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F0C10E7E3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:22:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A9AF5C5770;
 Thu, 23 Jan 2025 11:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD1DC4CED3;
 Thu, 23 Jan 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737631363;
 bh=dOPumK8qpk9/lF2H2ETAfWwPgfWjceIap9jfDJzhbCQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=U6jJOoa9E7/CT2C3/91caq1JtSj0tQh/jMzWt6DTk8r8w8PtvqJ+Gd+pl5fQPOpHo
 rBU7c3ISLWVl+8dy74YjwInGSqHG9l0D3pLGU44zcgPyDPyZVa8nuZE/VgYcJs+Ucz
 hnTpXJwl+ahiaWzHd6O+xt7yeG/oaobCNUZ1W9RKH3iM+Gtsn6nMIV5bzXZlgoo3Ga
 QsDHUHTm34pMdIhQKCrbrv5wsEc1oN+o1bYKYVZmjYgaLouHo+DY1PHMepe9BDvVVF
 ai40tdrnqUb61zhmmFw4CgVNn++RSKtRsr7j8e+hKxCoWw7DyBJY2IboaODdIqlHfo
 YHxBbgw1FhlBw==
Date: Thu, 23 Jan 2025 05:22:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kever.yang@rock-chips.com, 
 l.stach@pengutronix.de, linux-phy@lists.infradead.org, vkoul@kernel.org, 
 linux-kernel@vger.kernel.org, cristian.ciocaltea@collabora.com, 
 hjc@rock-chips.com, sebastian.reichel@collabora.com, 
 dmitry.baryshkov@linaro.org, rfoss@kernel.org, krzk+dt@kernel.org, 
 heiko@sntech.de, andy.yan@rock-chips.com, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 algea.cao@rock-chips.com, linux-rockchip@lists.infradead.org, 
 conor+dt@kernel.org
To: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250123100747.1841357-10-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-10-damon.ding@rock-chips.com>
Message-Id: <173763136187.3345079.11905359473404124812.robh@kernel.org>
Subject: Re: [PATCH v6 09/14] dt-bindings: display: rockchip: analogix-dp:
 Add support for RK3588
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


On Thu, 23 Jan 2025 18:07:42 +0800, Damon Ding wrote:
> Compared with RK3288/RK3399, the HBR2 link rate support is the main
> improvement of RK3588 eDP TX controller, and there are also two
> independent eDP display interfaces on RK3588 Soc.
> 
> The newly added 'apb' reset is to ensure the APB bus of eDP controller
> works well on the RK3588 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the main defferences of the RK3588 eDP and the previous versions
>   in commit message
> 
> Changes in v3:
> - Expand the property clock-names, resets and reset-names
> 
> Changes in v4:
> - Remove 'spdif' clock which added in v3
> - Add the comment of newly added 'apb' reset in commit message
> 
> Changes in v5:
> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
> 
> Changes in v6:
> - Keep the widest constraints and add only RK3588 related constraints
>   into 'allOf'
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: properties:reset-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250123100747.1841357-10-damon.ding@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

