Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB0A65E4D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 20:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EAE10E18F;
	Mon, 17 Mar 2025 19:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LOa737wr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D242710E17F;
 Mon, 17 Mar 2025 19:44:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 051235C3CE2;
 Mon, 17 Mar 2025 19:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DB4C4CEE3;
 Mon, 17 Mar 2025 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742240684;
 bh=OiQVuvTN1/XflXpR3RqcHCaJ640D1uHI1i9Ur7T7qKs=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=LOa737wrjHepnbxep326FXIDSAcB2rL++PYLUj/AszMLNZHv7tdoRhUNrX9QZrleC
 A0dKbD1XhZRR5Kv2Fi+eBXALlamDgHb3ExZfje4E09ZLXgLCzdM/CMLltD/YSV7Pql
 e7ZJ5fJgFeVAZJVt/ZwuHnhroS4ZRwlm5COLLNnvU8vbZJXfoyHcuiETR0b9hB60XY
 aFKci0gMNcgOLFIieuVYhfo08wg0yLhvo7tpxm4rMSU2JW1PuIIf5br0HavPhfuvHQ
 PCMfyIH4pXJC7Kvc1Ss6nyRrHrpCcUm6EDHLoZdJDiFJf2sqKkQp++J2gbgdnaGf5p
 pRfeDmX1+CpwQ==
Date: Mon, 17 Mar 2025 14:44:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Georgi Djakov <djakov@kernel.org>, James Clark <james.clark@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@linux.dev>, Andy Gross <agross@codeaurora.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 coresight@lists.linaro.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Heidelberg <david@ixit.cz>, 
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Kumar Gala <galak@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Message-Id: <174224068328.474126.11922746474259386307.robh@kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: arm:
 qcom,coresight-static-replicator: add optional clocks
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


On Mon, 17 Mar 2025 19:44:39 +0200, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks (or both). Document those optional clocks in the schema.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: properties:clock-names: 'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

