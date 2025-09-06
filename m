Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F292B476DB
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 21:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CCA10E178;
	Sat,  6 Sep 2025 19:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PRmMeziJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFAC10E0E9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 19:17:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ABB4060376;
 Sat,  6 Sep 2025 19:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C21C4CEE7;
 Sat,  6 Sep 2025 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757186268;
 bh=PKtVETpt3iAueUyOAHaFirlCACUUZHxID9Y/hmP47vQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=PRmMeziJu1HlJ53s8cvAtqN3495uZxs/Jtw+3b/wl/tpByw8ltRq0GtkKT5oNdf+C
 TAPPZz4RcsGIf/NRUAbhLQ1RSKhHGo5C/s6RGcWQE/PKHndd2wjq1zei3fsjuYZt5+
 /FxHE04rv5z6gL73pOHTaHTdlXmCUpjihD9LfZFQMUecsAMq/3zSKISSdOJQxTCN3f
 4Gw5xhCv7blWlgh30jQ+SKks6wMMmRv7JcZkwuBNy6dCHZBlWltomYuPA1N4Xy687k
 lv4lhcd9mWTWgfRbJ0jk8MKkaJeRUwkodnUSY+8hO/LuGvKxnmLYLtAH8FJfzD1M7P
 mYZfDluqIseqQ==
Date: Sat, 06 Sep 2025 14:17:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, 
 =?utf-8?q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>, 
 Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Osipenko <digetx@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250906135345.241229-5-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-5-clamor95@gmail.com>
Message-Id: <175718505408.1618397.11958757465445078243.robh@kernel.org>
Subject: Re: [PATCH v2 04/23] dt-bindings: display: tegra: document Tegra30
 VI and VIP
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


On Sat, 06 Sep 2025 16:53:25 +0300, Svyatoslav Ryhel wrote:
> Existing Parallel VI interface schema for Tegra20 is fully compatible with
> Tegra30; hence, lets reuse it by setting fallback for Tegra30.
> 
> Adjust existing VI schema to reflect that Tegra20 VI is compatible with
> Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
> an enum instead of list of const.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
>  .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml: properties:compatible: 'anyOf' conditional failed, one must be fixed:
	'one0f' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml: properties:compatible: Additional properties are not allowed ('one0f' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250906135345.241229-5-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

