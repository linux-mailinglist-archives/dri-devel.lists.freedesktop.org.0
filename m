Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09BA42152
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F05010E488;
	Mon, 24 Feb 2025 13:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EMu3xoiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9110E04E;
 Sun, 23 Feb 2025 20:29:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 15A755C630A;
 Sun, 23 Feb 2025 20:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E73C4CEEC;
 Sun, 23 Feb 2025 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740342545;
 bh=gcpP4QAXBjl72D8XNOpucie4qYX2x+ECVvClPZgS6JU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=EMu3xoiLvSz5FypZw6ueucOe00lB8KncS2CE02T5OjC8mVvXz6a8uxzU1unXSzQ+U
 uOiJMnp/2wqBkyPTTGrrYAg05DpHCDSI0jlyEgAMSJ1w0XcnbmaxTLEe+j11iaU5wR
 2rmKsjnNtsUxIDTD5YAck8JTsHpQiRuVv/hWlludlLkmVzDn2nKgLWG9/DWvgk+XCt
 N45rI6zpJXVcAcMnHmrRFJSrll0R/2l0Q6UBGdukOauKZn2TBjIhAm2YHTu5Hm8C36
 PH07XFD6CIyPS3+MAeAtilUvkoXM/DqkqdhIHKdgIfPEiOoKxcJNgSsT5ByYUYg4k5
 C+DfEaIfSLWbA==
Date: Sun, 23 Feb 2025 14:29:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>, 
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-gpio@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Stephan Gerhold <stephan@gerhold.net>, iommu@lists.linux.dev, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-7-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
 <20250223-msm8937-v2-7-b99722363ed3@mainlining.org>
Message-Id: <174034253945.156304.15112460035182362046.robh@kernel.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
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


On Sun, 23 Feb 2025 19:57:52 +0100, Barnabás Czémán wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223-msm8937-v2-7-b99722363ed3@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

