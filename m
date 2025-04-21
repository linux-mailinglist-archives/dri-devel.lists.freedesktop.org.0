Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363CA94BFC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 06:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6767810E071;
	Mon, 21 Apr 2025 04:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gda07qmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA18610E071;
 Mon, 21 Apr 2025 04:28:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ECD3F61155;
 Mon, 21 Apr 2025 04:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC41C4CEEB;
 Mon, 21 Apr 2025 04:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745209709;
 bh=7RTjC413WFNTnsJ+sW8AYTWPri18G27NFZBUWSw+9jY=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=gda07qmIq4zjbljH2XaqDeIlFaDNEcWJ94MEuYowVNAeWl2WSVru4XnzlYVwIntgT
 i6ZPsySZnkqdfF782pC1R5Yl2KnMVu7+9WRXRmzBbMfP6V3i3/FsgFep3TVXz4/rwy
 uEp5JRNE7DBD5vK625t9740OVCJnLlsVgaotWh/posQF1UwLJPNrdu5c5DTSHn6FgI
 G6+yjEDVqLx6PzadoSvbxRRlPkuex+LeD3lSPMGozrwUC9tcxpkl7UfQMRTEyeW0U9
 AzYApueuj4mdi6ndXGQ6Yfx6pdHr1doOT+QHcjkYFUinD4Gfp/qrAf5ZcpMM5yDqDx
 oBRR/fO1tq8pg==
Date: Sun, 20 Apr 2025 23:28:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Rob Clark <robdclark@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250421-a5xx-schema-v1-1-7d96b889322a@mainlining.org>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-1-7d96b889322a@mainlining.org>
Message-Id: <174520970724.607579.8539771287232502050.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: Document clocks of
 Adreno 505/506/510
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


On Mon, 21 Apr 2025 05:09:21 +0200, Barnabás Czémán wrote:
> Adreno 505/506/510 have previously undocumented alwayson clock.
> Document clocks for them and enforce their order.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 83 +++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:1:then:properties:clock-names: {'items': [{'const': 'alt_mem_iface', 'description': 'GPU Alternative Memory Interface clock'}, {'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}], 'minItems': 6, 'maxItems': 6} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:1:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'alt_mem_iface', 'description': 'GPU Alternative Memory Interface clock'}, {'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too long
	[{'const': 'alt_mem_iface', 'description': 'GPU Alternative Memory Interface clock'}, {'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too short
	False schema does not allow 6
	1 was expected
	6 is greater than the maximum of 2
	6 is greater than the maximum of 3
	6 is greater than the maximum of 4
	6 is greater than the maximum of 5
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:2:then:properties:clock-names: {'items': [{'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem', 'description': 'GPU Memory clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}], 'minItems': 6, 'maxItems': 6} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:2:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem', 'description': 'GPU Memory clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too long
	[{'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem', 'description': 'GPU Memory clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too short
	False schema does not allow 6
	1 was expected
	6 is greater than the maximum of 2
	6 is greater than the maximum of 3
	6 is greater than the maximum of 4
	6 is greater than the maximum of 5
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250421-a5xx-schema-v1-1-7d96b889322a@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

