Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C576BD175
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40F610ECFC;
	Thu, 16 Mar 2023 13:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815B010ECFB;
 Thu, 16 Mar 2023 13:53:39 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id v10so802837iol.9;
 Thu, 16 Mar 2023 06:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678974819;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mUdpbi5TGJoaUXHkv97gIa7NonUCQAJZsK/HjadTtxE=;
 b=DE8v+cnFrxFzLco5+ZJXevkQi96AlxAhQ31Hx0nhmUdl6HRI8l81kuDc5Xz4zbY8fi
 GaukzVSVel4pJjk7bhgCJwHuq89+PBkTvLJxPZ91RlknjHVnor1wd2gWCl2QP6vsWKw0
 pAHOLpvJXyYoNlymm91mIZvB9t5Kax50X+Jpkm0xhoQeljxs6UePf54MXe6PMCCu1J+h
 2fjU1ta3MaTXMwOZVblbcfZfuNl0PeCJ8puNWNTlsngPkOa5+9skv5X/Q3b+MQe9nQGi
 eVrgmUKaf48RPfO1XogA6s4hmv0YhwabH7hukL+0819viPFNBAyBgjFGUq7ViAfetS51
 nwqA==
X-Gm-Message-State: AO0yUKV3WhJzmzr0Er5Gp8Fexzip9eDktpC4mVMnGUX1K/b4WBikR0zq
 kJnwtx4rJPcGJR10tG6jxw==
X-Google-Smtp-Source: AK7set8W8UPFeVE0DXWj4IT3uiG6YG5+JfpqujbxicCe7RzbD9be9VSYYcqSzrSQFSB/MR4qFE0y2w==
X-Received: by 2002:a5d:9544:0:b0:74c:7db1:47cf with SMTP id
 a4-20020a5d9544000000b0074c7db147cfmr16981351ios.14.1678974818768; 
 Thu, 16 Mar 2023 06:53:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a02c857000000b004061d6abcd2sm1151352jao.146.2023.03.16.06.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 06:53:38 -0700 (PDT)
Received: (nullmailer pid 2744948 invoked by uid 1000);
 Thu, 16 Mar 2023 13:53:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-1-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
 <20230307-topic-dsi_qcm-v5-1-9d4235b77f4f@linaro.org>
Message-Id: <167897435368.2729763.13155358018368815833.robh@kernel.org>
Subject: Re: [PATCH v5 01/10] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
Date: Thu, 16 Mar 2023 08:53:34 -0500
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 16 Mar 2023 09:51:07 +0100, Konrad Dybcio wrote:
> The qcom, prefix was missed previously. Fix it.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: dsi@5e94000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,dsi-ctrl-6g-qcm2290'] is too short
	'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: dsi@5e94000: Unevaluated properties are not allowed ('compatible' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: dsi@5e94000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,dsi-ctrl-6g-qcm2290'] is too short
	'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: dsi@5e94000: Unevaluated properties are not allowed ('compatible' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230307-topic-dsi_qcm-v5-1-9d4235b77f4f@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

