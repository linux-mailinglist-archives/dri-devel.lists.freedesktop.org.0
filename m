Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C269A6AF42
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 21:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0FB10E05A;
	Thu, 20 Mar 2025 20:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c5Y7G1tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Thu, 20 Mar 2025 20:38:54 UTC
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BD510E6A6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 20:38:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F98143CF1;
 Thu, 20 Mar 2025 20:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DFCC4CEDD;
 Thu, 20 Mar 2025 20:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742502733;
 bh=cnp33NkEi4UH3U5nL6OYRxVdAuacty7X9TFypMwuZc8=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=c5Y7G1tvB/Ta8X0sil3in+E5BlgUQLGV605yIuYzK8co8+TfnSTkhayTb29bKddDk
 +jFC1pNEeqjwmuPrpSI/38CKKsGu9/CsI6AsdE4hKxzQyiKhrZWt7BfciBUYCeQ239
 5Yl3/plunvner2fZUkOkczdgYCQ7IMzhMaJ4ymXk3DmlodYr3I/Cghj1CmuKhUiBk5
 EftCKULjpQMvSx/J2e+2hIVtbn+WnBF7cr5uwnmo8QZNRsTnqTlepHwpofKa+7NwyS
 7ClZ0RQBUJkY8n5aytEXu0i9y6Vyws1VGr3XM9bf4TG+pUf75im+fJ0S+uHpDE1i5w
 qQWbPYtJiLnXA==
Date: Thu, 20 Mar 2025 15:32:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Darren Etheridge <detheridge@ti.com>, 
 Alessio Belle <alessio.belle@imgtec.com>, Simona Vetter <simona@ffwll.ch>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tero Kristo <kristo@kernel.org>, David Airlie <airlied@gmail.com>, 
 Randolph Sapp <rs@ti.com>, Frank Binns <frank.binns@imgtec.com>
To: Matt Coster <matt.coster@imgtec.com>
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-1-d987cf4ca439@imgtec.com>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
 <20250320-sets-bxs-4-64-patch-v1-v4-1-d987cf4ca439@imgtec.com>
Message-Id: <174250273222.1046427.15822439763542356679.robh@kernel.org>
Subject: Re: [PATCH v4 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
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


On Thu, 20 Mar 2025 11:32:11 +0000, Matt Coster wrote:
> The first compatible strings added for the AXE-1-16M are not sufficient to
> accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
> string refers to the entire family of Series AXE GPUs, but this is
> primarily a marketing term and does not denote a level of hardware
> similarity any greater than just "Rogue".
> 
> The more specific "img,img-axe-1-16m" string refers to individual AXE-1-16M
> GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16M
> only uses a single power domain.
> 
> The situation is actually slightly worse than described in the first
> paragraph, since many "series" (such as Series BXS found in the TI AM68
> among others and added later in this series) contain cores with both Rogue
> and Volcanic architectures.
> 
> Besides attempting to move away from vague groupings defined only
> by marketing terms, we want to draw a line between properties inherent to
> the IP core and choices made by the silicon vendor at integration time.
> For instance, the number of power domains is a property of the IP core,
> whereas the decision to use one or multiple clocks is a vendor one.
> 
> In the original compatible strings, we must use "ti,am62-gpu" to constrain
> both of these properties since the number of power domains cannot be fixed
> for "img,img-axe".
> 
> Work is currently underway to add support for volcanic-based Imagination
> GPUs, for which bindings will be added in "img,powervr-volcanic.yaml".
> As alluded to previously, the split between rogue and volcanic cores is
> non-obvious at times, so add a generic top-level "img,img-rogue" compatible
> string here to allow for simpler differentiation in devicetrees without
> referring back to the bindings.
> 
> The currently supported GPU (AXE-1-16M) only requires a single power
> domain. Subsequent patches will add support for BXS-4-64 MC1, which has
> two power domains. Add infrastructure now to allow for this.
> 
> Also allow the dma-coherent property to be added to IMG Rogue GPUs, which
> are DMA devices. The decision for coherency is made at integration time and
> this property should be applied wherever it accurately describes the
> vendor integration.
> 
> Note that the new required properties for power domains are conditional on
> the new base compatible string to avoid an ABI break.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v4:
> - Add img,img-rogue back to ti,am62-gpu compatible strings to allow
>   compatibility with older kernels
> - Revert change to power-domains property and add proper constraint
> - Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-1-143b3dbef02f@imgtec.com
> Changes in v3:
> - Remove unnecessary example
> - Remove second power domain details, add these where they're used instead
> - Avoid ABI breaks by limiting new required properties to new compatible
>   strings and making all binding changes in a single patch.
> - Links to v2:
>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45d9fb0cf@imgtec.com
>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45d9fb0cf@imgtec.com
>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 44 +++++++++++++++++++---
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml: properties:power-domains: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/power-domain.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250320-sets-bxs-4-64-patch-v1-v4-1-d987cf4ca439@imgtec.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

