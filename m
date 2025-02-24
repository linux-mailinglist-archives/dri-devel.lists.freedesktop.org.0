Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146CA41437
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 04:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0425E10E12F;
	Mon, 24 Feb 2025 03:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RkR+ERFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE5110E12A;
 Mon, 24 Feb 2025 03:45:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDEF75C4D99;
 Mon, 24 Feb 2025 03:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D322C4CEE8;
 Mon, 24 Feb 2025 03:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740368747;
 bh=6a0qjdqlzvGzQVstllexhGYhGqe+l900EvniR1D7J4g=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=RkR+ERFxNZmnBs2BeeB0SYJ1Z1A24/AlraglZB+UaMuqntfYU2Uar+pP3y+iob1ik
 TNPWnR06qmZut+a++1LJvHnNlxVYnMpOVMW9GcXLteZjsedOkqhVuGF8kwBC7iaY/c
 as3BPFNKnYsVyVKU8N6W1NyTISlx4tVvaSjiOSlE+enNGXks/RxQAEyel1MzddQVt3
 2XeYg4SuIp6ZseOLWkUXVfjtdQfuJ4f36xltML4JACN2cWtMDp8VlxjSlGJHrAWObq
 aoCp8FztTrFLZzeKus2vDfG1t0hC/UY5IfvD+T08OTK0m44Sajjf+y6CkJtwxBpVAd
 l12y9aAZjgAbQ==
Date: Sun, 23 Feb 2025 21:45:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-gpio@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Stephan Gerhold <stephan@gerhold.net>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Stephen Boyd <sboyd@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-7-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
 <20250224-msm8937-v3-7-dad7c182cccb@mainlining.org>
Message-Id: <174036874208.769324.12190196634420728570.robh@kernel.org>
Subject: Re: [PATCH v3 7/8] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
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


On Mon, 24 Feb 2025 02:56:22 +0100, Barnabás Czémán wrote:
> Document Xiaomi Redmi 3S (land).
> Add qcom,msm8937 for msm-id, board-id allow-list.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-msm8937-v3-7-dad7c182cccb@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

