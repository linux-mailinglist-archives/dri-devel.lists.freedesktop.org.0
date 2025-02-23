Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5352A42129
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF5010E449;
	Mon, 24 Feb 2025 13:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Aan6HSP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0238C10E04E;
 Sun, 23 Feb 2025 20:29:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 94ECA61160;
 Sun, 23 Feb 2025 20:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE95C4CEDD;
 Sun, 23 Feb 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740342541;
 bh=KR7W999H3HhWOx6HbD/qJn1w4eHNm4Exj/VdOj3oOD4=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Aan6HSP1ONPevUNZiyUU8ETFdE0qaWvH++o/iVGUuu5Xh2KbPzp71A0/5ttes+Q5/
 yOPLnxK6yiuf7wV4uqrDTJNc9i7oTy8KKWL7WdO5fI0IYU8QKZFPh2/Oa/2/qVqTED
 vO2OhHsiRfoxz9hgIKyPNgLpj5J3LzLT7a5G4fGmiXMG/LuhJ0K8lICySXzxA9Rlbr
 rebPb+m8p92pd53t8TGdJJe+D3oQEqrTftCNnBQJQk2PkPrbLLgOARCk1wXy1p6AZy
 LEleD5gExrcWP7vUt8tgs1ii4a51YClasTyM7kIUT859txQXFcNpN+5r0rGCxAu2gO
 F4FJ8Vd0VfFxw==
Date: Sun, 23 Feb 2025 14:28:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org, 
 Will Deacon <will@kernel.org>, Sean Paul <sean@poorly.run>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Joerg Roedel <joro@8bytes.org>, Lee Jones <lee@kernel.org>, 
 iommu@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-1-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
 <20250223-msm8937-v2-1-b99722363ed3@mainlining.org>
Message-Id: <174034253684.156189.15967514216362963573.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom: Add MSM8937 Global
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


On Sun, 23 Feb 2025 19:57:46 +0100, Barnabás Czémán wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223-msm8937-v2-1-b99722363ed3@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

