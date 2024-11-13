Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8219C70B2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 14:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB8210E6FC;
	Wed, 13 Nov 2024 13:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZJqt32Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A205610E6F9;
 Wed, 13 Nov 2024 13:32:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93691A40873;
 Wed, 13 Nov 2024 13:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCE1C4CECD;
 Wed, 13 Nov 2024 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731504750;
 bh=gfCmgl3jagwHGldFjUB4K2gH4J6eJxXe8/I/qAemYJk=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=ZJqt32ThN/8+imW4Kgw6RaW3o7K6lP9reDKy572Iu31gEfEj6vKcOiUy7grZrUrLV
 4oBs8fS3SxU1SQ+2fzOLAygB+gwDSMU5s+kNXqO+5Dyi4GE0ZH+7Dd65HlNCwkHUMS
 UJUml5PZhst1zmCxBZigJFzCJVlLCXEnqukzdPvRpR0hcrrIU78SWJIPeIFwsSt8hu
 XyGPX7fYzyWSIL3eJ4brqSOtqTpPtGMC7+PZPxV3vdCK+WDTgwRigx0RartzZVT9fZ
 t2XT8pFt1mMkHRHxP6fqE28qR4UvBY82U4ZazE/zOIT4jWBOP/GDRE00uSRJ80/ZxB
 5MV5X6EP7fI3w==
Date: Wed, 13 Nov 2024 07:32:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Li Liu <quic_lliu6@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Fange Zhang <quic_fangez@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com>
Message-Id: <173150474841.4106927.5975815443901282337.robh@kernel.org>
Subject: Re: [PATCH v2 3/9] dt-bindings: display/msm: Add QCS615 MDSS & DPU
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


On Wed, 13 Nov 2024 19:51:45 +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document the MDSS and DPU hardware found on the Qualcomm QCS615 platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 118 ++++++++++
>  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 252 +++++++++++++++++++++
>  2 files changed, 370 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,qcs615-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

