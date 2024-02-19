Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5585A5FB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9652710E0F3;
	Mon, 19 Feb 2024 14:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NII8P/Jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4D010E0F3;
 Mon, 19 Feb 2024 14:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0E8C2CE109B;
 Mon, 19 Feb 2024 14:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3FEC433F1;
 Mon, 19 Feb 2024 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708353138;
 bh=p7CKu3q3ddLdu/9KSihXnzeOfwJAXWsmYHQH7vap+SM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=NII8P/JvDIQSdS6jY3XVqY9OwEYbCNImuVFaDu7HQh8UC/uvUsJ/tkH4r3cwOJ+pL
 zJC9tno6EAU0Rwg3c2/M9j9dKoVcp+yyaxWmbqEk5xDYdsbNzfdFWzGDPZCWUqf1UT
 1XOTqVxZ30LixtHGzYdSUyM9WfyPAE52bNCuTsaC37iFtygZ/aVqmpAT/F3888Qoi7
 28SlXXlJIKfquDWCKFgsdWWDg2t7yhd8iE4bHlpCx0GWBGRxq9TCSBZPeC/qmjKIsy
 cVHutL99zjZP+dIprMmy7elANko4CEteHsdjrXyt4h5KHYPUhO2VE6+H361hGc5AyS
 HKW39QrDx9ExA==
Date: Mon, 19 Feb 2024 08:32:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Rob Clark <robdclark@gmail.com>, 
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Joerg Roedel <joro@8bytes.org>, linux-clk@vger.kernel.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-2-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-2-d260fa854707@linaro.org>
Message-Id: <170835313573.3576894.7520977778258170562.robh@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: clock: Add Qcom QCM2290 GPUCC
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


On Mon, 19 Feb 2024 14:35:47 +0100, Konrad Dybcio wrote:
> Add device tree bindings for graphics clock controller for Qualcomm
> Technology Inc's QCM2290 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/clock/qcom,qcm2290-gpucc.yaml         | 76 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcm2290-gpucc.h     | 32 +++++++++
>  2 files changed, 108 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml: properties:compatible: [{'const': 'qcom,qcm2290-gpucc'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml: properties:compatible: [{'const': 'qcom,qcm2290-gpucc'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.example.dtb: /example-0/soc/clock-controller@5990000: failed to match any schema with compatible: ['qcom,qcm2290-gpucc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240219-topic-rb1_gpu-v1-2-d260fa854707@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

