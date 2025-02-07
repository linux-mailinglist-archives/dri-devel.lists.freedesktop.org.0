Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A9A2C2EE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 13:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D6710EA7B;
	Fri,  7 Feb 2025 12:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Utg5HGGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A21D10EAF0;
 Fri,  7 Feb 2025 12:41:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92CB25C0655;
 Fri,  7 Feb 2025 12:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4DCC4CED1;
 Fri,  7 Feb 2025 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738932084;
 bh=83oi4/LiFKnJ4b4PYfNcNbnSk8G43axrtIKV2z9iTyU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Utg5HGGEduun4GLdnqK10VI4vdtOGRLduTUttUqUUI4R8v/XZErkWN0dN/cCUwmdN
 26qNOFtf17ckL4mpHUX1WpjWudfk3Wg56Iu67vvTbyV8/FsuCQ5uL4T6Q2ozkJA5fP
 voLg0ydK8znhYwNARpFaAh01jGIg1Q3/syV490H3pyMMRum1d1zPOV2xRPeheNtGM/
 uXl/x8UCd0vcG+lHpkw0k+WAF7NQycgoYRFOi+sJUcd1JvD3plXJgcYC0HNMz07sFa
 ldTyZ4RWM6hBoU0v5d0oi6lynqAeEYK1IaU9JpiespGoR7ibv1bEOTBIkrf9/P2mWQ
 ahLXBUVyvRTlg==
Date: Fri, 07 Feb 2025 06:41:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org>
Message-Id: <173893208278.4072473.6097194764742914829.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: qcom,sm8550-mdss: only
 document the mdp0-mem interconnect path
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


On Fri, 07 Feb 2025 11:50:37 +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
> mdp0-mem interconnect entry.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnects: [[4294967295, 3, 0, 4294967295, 13, 0], [4294967295, 0, 0, 4294967295, 1, 0]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem'] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

