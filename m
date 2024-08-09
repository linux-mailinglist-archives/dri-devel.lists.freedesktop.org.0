Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB094D467
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F29310E984;
	Fri,  9 Aug 2024 16:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L9p0E7Ee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B41110E984
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 16:18:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2F4DCCE168B;
 Fri,  9 Aug 2024 16:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA725C32782;
 Fri,  9 Aug 2024 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723220290;
 bh=ek/Kg6OmXUi6D5cWxC7C10DYiBHbw6OL9TD8XPV7y4Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=L9p0E7EeQlzvhjRAqoGpPdcihwHW1MjQbllDSkwN06TxsM8qdXsU6oSBQB9tXP/cJ
 yADOr0bk3A/w5CS4ytEl0pVafURAAnGy6zOvlnWf8hPhBHiuJYleEaHytbChUqrC9B
 smY3y3ezB64BiTbn8lBcvsjxyjgez2K8ANOqBorTJAS4uoVBXKsNQbje2c176iUbT6
 wxjvkme+t/94n448CAveKNbDTTIPJ04CYafRy5mU8vc0mD07nhhG+8SZf0IgPHbfpZ
 Ra2eBlsO5e959W0mhdWJGXYF5ZMTqAC0vktQbwOFxeyiFqIHmmeh9jU9rqdy79t52Y
 6bOG5kGvno5TA==
Date: Fri, 09 Aug 2024 10:18:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 dri-devel@lists.freedesktop.org, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20240809151314.221746-1-yannick.fertre@foss.st.com>
References: <20240809151314.221746-1-yannick.fertre@foss.st.com>
Message-Id: <172322028851.588157.5328364169708651531.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: st,stm32-ltdc: Document
 stm32mp25 compatible
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


On Fri, 09 Aug 2024 17:13:14 +0200, Yannick Fertre wrote:
> Add "st,stm32mp25-ltdc" compatible for SOC MP25. This new SOC introduce
> new clocks (bus, ref & lvds). Bus clock was separated from lcd clock.
> New sources are possible for lcd clock (lvds / ref).
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
> Changes in v2: Rework clock property.
>  .../bindings/display/st,stm32-ltdc.yaml       | 51 +++++++++++++++----
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml: allOf:0:else:properties:clocks: {'maxItems': 1, 'items': [{'description': 'Lcd Clock'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml: allOf:0:then:properties:clocks: {'maxItems': 4, 'items': [{'description': 'Lcd Clock'}, {'description': 'Bus Clock'}, {'description': 'Reference Clock'}, {'description': 'Lvds Clock'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.example.dtb: display-controller@40016800: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/st,stm32-ltdc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240809151314.221746-1-yannick.fertre@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

