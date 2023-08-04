Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FF770C43
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 01:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A64310E147;
	Fri,  4 Aug 2023 23:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4286110E147;
 Fri,  4 Aug 2023 23:12:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6593D62168;
 Fri,  4 Aug 2023 23:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F794C433C8;
 Fri,  4 Aug 2023 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691190751;
 bh=0huTYlOJ7ehSTpvXygP50IFdkKHSLFUaNDSomV/oL2s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=COsw38xLrXJZtdKt2cIk6TcwwogHZlQxG7I3f07LaPeBZO1zTPZoE6l/oBymxpAZU
 5qe/YFXj5kh/yAjR+PjMTo9PI8F48UvEEoUOnR6LOJFiccBPR2QRgP/YKj2m5WfjvK
 ueXUEREPXhK8FxpVnpDpPgQMnQM+K79OCwaTLo2/acBLUsqQyRQQAtClVs5RFMCshi
 UU5S6ADPnpmbLMhiHj2bqQjznnSbRfRrPMvSWHI6kvdSkLDZK61nTiN5GuWEeNBu2k
 3mNsFjeUhAHeKKsUslMM0DGeLjyqibKe0lH7R+re759TslgJDcjC3Ir9AE4lBDxL/1
 T9xZrJbVh9Rdg==
Received: (nullmailer pid 62476 invoked by uid 1000);
 Fri, 04 Aug 2023 23:12:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <20230803194724.154591-2-danila@jiaxyga.com>
References: <20230803194724.154591-1-danila@jiaxyga.com>
 <20230803194724.154591-2-danila@jiaxyga.com>
Message-Id: <169119074853.62442.8646318839779071410.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: document DPU on SM7150
Date: Fri, 04 Aug 2023 17:12:28 -0600
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
Cc: quic_rmccann@quicinc.com, dri-devel@lists.freedesktop.org,
 liushixin2@huawei.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, quic_khsieh@quicinc.com, rfoss@kernel.org,
 davidwronek@gmail.com, quic_vpolimer@quicinc.com, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, sean@poorly.run,
 neil.armstrong@linaro.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 03 Aug 2023 22:47:23 +0300, Danila Tikhonov wrote:
> Document the DPU hardware found on the Qualcomm SM7150 platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../bindings/display/msm/qcom,sm7150-dpu.yaml | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.example.dts:24:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230803194724.154591-2-danila@jiaxyga.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

