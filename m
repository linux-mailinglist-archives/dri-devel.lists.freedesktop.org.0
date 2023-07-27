Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E57654C0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 15:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6CC10E580;
	Thu, 27 Jul 2023 13:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC4D10E123;
 Thu, 27 Jul 2023 13:17:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D5F761E76;
 Thu, 27 Jul 2023 13:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069B3C433C9;
 Thu, 27 Jul 2023 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690463818;
 bh=DUlLuWL4cE5am5s9QK+fFshV+j9iTbP7jA5deX6kjTs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AFf47cE1LQhpwJRelzAV0a/V4s5bbicoushv8cjJw/luJEv4giXHlRWecPmsEJA0/
 KnV36cP0ASblrAOaCu+7P//cqsn/ro7m/wo4b8mWOzEF3iWoH3Uuc3QjmRNuzkKPCw
 CymVnlaBP2D81Dc5uAcTohwZXHIkdunCZgLGmZKCIxYbJpmcwvgcAZVTYJuaIT07px
 KwWMvDOBmzvhdZZqM5SMc7umTjVmTwIdIlYICgroOSI1S3flF00xjkJZt6MWV6g0t5
 uvIMDSHFSTx21w2LzS8iH1SyVbl4VzIRFVCTkK840ezWoEQVbi15e2d2DBy1fJsdPE
 MxsnA0AvFR5bw==
Received: (nullmailer pid 1270046 invoked by uid 1000);
 Thu, 27 Jul 2023 13:16:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
In-Reply-To: <1690461813-22564-1-git-send-email-quic_rohiagar@quicinc.com>
References: <1690461813-22564-1-git-send-email-quic_rohiagar@quicinc.com>
Message-Id: <169046381501.1270011.10571652656239031435.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: qcom: Update RPMHPD entries for some SoCs
Date: Thu, 27 Jul 2023 07:16:55 -0600
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
Cc: ulf.hansson@linaro.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_vgarodia@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, linux-clk@vger.kernel.org, rfoss@kernel.org,
 jonathan@marek.ca, stanimir.k.varbanov@gmail.com, agross@kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 bhupesh.sharma@linaro.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, mchehab@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, mathieu.poirier@linaro.org,
 sboyd@kernel.org, andersson@kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 vladimir.zapolskiy@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 27 Jul 2023 18:13:33 +0530, Rohit Agarwal wrote:
> Update the RPMHPD references with new bindings defined in rpmhpd.h
> for Qualcomm SoCs SM8[2345]50.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
> 
> Changes in v2:
>  - Removed the unnecessary inclusion of header rpmpd.h.
> 
> This patch is dependent on the series that includes the new rpmhpd.h header
> https://lore.kernel.org/all/1689744162-9421-1-git-send-email-quic_rohiagar@quicinc.com/
> 
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml   | 4 ++--
>  Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml  | 4 ++--
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml    | 4 ++--
>  Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml   | 4 ++--
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml  | 4 ++--
>  Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml   | 4 ++--
>  Documentation/devicetree/bindings/clock/qcom,videocc.yaml         | 4 ++--
>  .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml          | 4 ++--
>  .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 8 ++++----
>  .../devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml          | 4 ++--
>  .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 6 +++---
>  .../devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml          | 4 ++--
>  .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++----
>  .../devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml          | 4 ++--
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++----
>  Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml    | 4 ++--
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml              | 4 ++--
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 6 +++---
>  18 files changed, 44 insertions(+), 44 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dts:21:18: fatal error: dt-bindings/power/qcom,rpmhpd.h: No such file or directory
   21 |         #include <dt-bindings/power/qcom,rpmhpd.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1690461813-22564-1-git-send-email-quic_rohiagar@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

