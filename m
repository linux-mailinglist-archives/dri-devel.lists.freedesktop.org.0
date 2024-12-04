Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C139E38CD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 12:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E386D10E33C;
	Wed,  4 Dec 2024 11:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nX5Ft9Df";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED31C10E22A;
 Wed,  4 Dec 2024 11:29:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D47EA41328;
 Wed,  4 Dec 2024 11:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39183C4CED1;
 Wed,  4 Dec 2024 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733311767;
 bh=QRBMAHrwweIqh048wM3KrM83eMO0ESk41FRcpvhVQmA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=nX5Ft9DfBblqTs7c/nKmC+u/cjdwSptI6KfxNp8KyaP0WN1Z4AdxJfQRgjvetJw7k
 Vu9K3ukcc67MVsdy+kzgRtRURd5bi7R2M5G+by0u0Bd0SzGgePKRD3FMzVzJ9Sopsk
 42ajT/s48EXlA+Sv/LpnmHROrRko3fPD4CipF8lINrSlKG9n1OZDrhhr1WJ9J8cJ+S
 R5ESBVDoQ95urYk1uhiuEekhyM/HeJ6cpLeiiUpd5nbD65QeUcR5Pgczn8wOb7CpP+
 lobaClyc5+jRr00bf4SjtrPMWA7fzv/RcivJLWUZ0zoFaSP5almJSmMX4rYok6IzJy
 0NCAIDx2WUoeQ==
Date: Wed, 04 Dec 2024 05:29:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
References: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
Message-Id: <173331176548.4095099.9767845657326548018.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the
 third interconnect path
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


On Wed, 04 Dec 2024 11:36:37 +0100, Neil Armstrong wrote:
> Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
> found on the Qualcomm SM8350 platform.
> 
> This fixes:
> display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> 
> Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb: display-subsystem@ae00000: interconnects: [[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295, 1, 0]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem'] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

