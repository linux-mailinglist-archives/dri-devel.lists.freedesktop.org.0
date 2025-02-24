Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAF9A41432
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 04:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD64310E011;
	Mon, 24 Feb 2025 03:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dZ66Gnkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA67810E011;
 Mon, 24 Feb 2025 03:45:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19B1A5C01E2;
 Mon, 24 Feb 2025 03:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98399C4CEDD;
 Mon, 24 Feb 2025 03:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740368743;
 bh=x36eM8I9mvfh06MWtqJiRZWuU4kR0fM4aRJdD6U8/3A=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=dZ66Gnkx4ceRLCODpuOct/FlYIgHKqs09y3VyEDNYAeha11wFWePwaaELtFepl9+4
 jHgmYb1wgobZRs68fx2xUSo42mlGXp5LeZdbA7pATs9awNxbbS/uxz1ztkFYUTN4oj
 PnprRGqYhqO2eefvXY+Z0u0lZ78dy2w14Iw0W2KSSgNO816Gi2Tum51Ve1u1uQP7BO
 nujq0yaUYUivZXPjg0DV+Gh7ujILbkVD3/6JFA27qQnmbnoxooiI3JN4esbPZ4X9y+
 wlKpoWNBvVA8QtFog4fqlNwBGOSMDhftxLpAs+Zbz7K+VdV9iHxLyOGM2MKd9L6SBE
 7aPO9gLogFY+Q==
Date: Sun, 23 Feb 2025 21:45:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 linux-clk@vger.kernel.org, Will Deacon <will@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephan Gerhold <stephan@gerhold.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Lee Jones <lee@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-1-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
 <20250224-msm8937-v3-1-dad7c182cccb@mainlining.org>
Message-Id: <174036873937.769195.3244673416189974329.robh@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: qcom: Add MSM8937 Global
 Clock Controller
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


On Mon, 24 Feb 2025 02:56:16 +0100, Barnabás Czémán wrote:
> Add device tree bindings for the global clock controller on Qualcomm
> MSM8937 platform.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8937.yaml           | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
>  2 files changed, 90 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.example.dts:24.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-msm8937-v3-1-dad7c182cccb@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

