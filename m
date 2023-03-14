Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9216B9753
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 15:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D8910E80F;
	Tue, 14 Mar 2023 14:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03CA10E80D;
 Tue, 14 Mar 2023 14:10:34 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id bp11so3289407ilb.3;
 Tue, 14 Mar 2023 07:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678803034;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hNpfc7BgFs/QBGJwy9bFLZmokBPnc2fbGlgGUBh/mSc=;
 b=6bqlWr6DE9yhvAN+qHgmxkIZIgiZS7AFVryWgbsPsjBjR1bILLgictdAQB5MwCyLFg
 OdA+zBwaWUgwxgWMN+43r8e58/hDdXfsY4ZeK0KVNkJERtJkmHws8kKMeILBOZWnKqi7
 T2K42q7Hw7VTdH2iZ4Kjk5Q1TAf5ZRCAdyndSYoBQ72w89el26B4OOswuaaHjvRfBN7x
 kI05Ez6g4rVQ33HvKOVh7TMIsmJlJkXAHb3t9s/GLoZvO0te/oP3Oi9Sa93jgxP1U+Wn
 yqoFanwG1dbEsS33jY/dTcLWAbo5ob3Ddwh3ipxQa+9LxJDDXwivK2nVhzf0Vqaq1yy9
 OlOg==
X-Gm-Message-State: AO0yUKX+QrupknoZkVZfxpUAXbAPN8RhB6n5o0HklBe7Ip/XHhl2CNmQ
 2vbASB6gUmfaj9soXc2Tlw==
X-Google-Smtp-Source: AK7set9LSYW6ANPssoQsKqCg6fbc+vL/1K6HqYJuwjBLyO6XQblN3+7FQuU33PDOnTe1njtyDC1ykQ==
X-Received: by 2002:a05:6e02:966:b0:311:1168:b9b5 with SMTP id
 q6-20020a056e02096600b003111168b9b5mr2170694ilt.23.1678803033757; 
 Tue, 14 Mar 2023 07:10:33 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a924442000000b0031599ebe3a5sm799799ilm.32.2023.03.14.07.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 07:10:32 -0700 (PDT)
Received: (nullmailer pid 83798 invoked by uid 1000);
 Tue, 14 Mar 2023 14:10:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-1-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
 <20230307-topic-dsi_qcm-v4-1-54b4898189cb@linaro.org>
Message-Id: <167880255009.26088.15283601844060717114.robh@kernel.org>
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
Date: Tue, 14 Mar 2023 09:10:19 -0500
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
Cc: devicetree@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 14 Mar 2023 13:13:39 +0100, Konrad Dybcio wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230307-topic-dsi_qcm-v4-1-54b4898189cb@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

