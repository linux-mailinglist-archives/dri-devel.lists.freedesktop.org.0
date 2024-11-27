Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C789DA3CB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 09:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B998910EA1F;
	Wed, 27 Nov 2024 08:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ewpMAi6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4348810EA18;
 Wed, 27 Nov 2024 08:21:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 79A74A437BB;
 Wed, 27 Nov 2024 08:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CE5C4CECC;
 Wed, 27 Nov 2024 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732695674;
 bh=id+aTLaJGkl5TLeYDuyrx5kMCJuL6YRs6MH/F+wlEOI=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=ewpMAi6MGGWdMkdebEubYl1DCfaacM++ANTuAZSa7N0oVKYmhw9hf/VLbvFPUp0V2
 PG+KRKTyE8GuSrESVPfDLxO7uhKPNBTQAazlNDrO751JylvbyA6U6lv/dtX2a9m86w
 vnf67ND7Or5ae7sTJoceHsYFLWOjmEK9Oaf5LJJN2KRO0FaqMMH0kb2cIIoIxHdp1b
 DBQ+4q0GTQwPFAyv5kLuaIN4r6BS9ao/sSBozNeSAx2AyFfhxh38tISvolaidUXfbP
 92Un52aKvvsriH1Qa7AAzHYkSniu1b4i1mT3RmsARtwEBCHxnyGS6oRHD3o3QTjnAW
 MrKCIQH/mv4Hw==
Date: Wed, 27 Nov 2024 02:21:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
To: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
Message-Id: <173269567235.2233485.7286772244329561840.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300
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


On Wed, 27 Nov 2024 15:05:01 +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 239 +++++++++++++++++++++
>  1 file changed, 239 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
   26 |         #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

