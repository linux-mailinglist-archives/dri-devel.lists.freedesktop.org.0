Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA06EAB0C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 14:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ABB10E096;
	Fri, 21 Apr 2023 12:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F3C10E080;
 Fri, 21 Apr 2023 12:56:21 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6a438f0d9c9so1659355a34.1; 
 Fri, 21 Apr 2023 05:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682081780; x=1684673780;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8iHqSMwo/rp53MUqa385NdmlLYpp8taR9HcafwH8WBg=;
 b=Xn6LJ+ypKX4aERr2zvrxEajzqNf7SxT5asBRtjvrnlEbZe3a8r7oV17Ok6+ig8iBAV
 DXi12kBytZZbgDX+NVCcAPfKfJyYW/R0MBt0dG4CdAEPRHZpJdwzi8jipkpplPNg9tbt
 0gskBxQ20z0sJ0fdY7Aj9sS2frs6heOW8qQmij3TnBbqbQf+pbMuHF3/JBjvpZHSfxSx
 rmai/+KsHqEGc7pFrgQcM3pFBfpeZMhCrHXVfHd9P86+XLI6HDLoul2Av/YHIN7G+ELn
 d+mvv9sEDnwlqOda2W1WHVmRWJfHR3N/d4BCuG5P72OcumZMHB/9vJ8P8RsiGilBJnuw
 qlpg==
X-Gm-Message-State: AAQBX9c2B8Qf29VbCaisSKTqCF81glP23/l/4wts7pCUnmAe5Hn/ZJC8
 6QPiODiiV6NbUIYVQN0TUAeo43ensQ==
X-Google-Smtp-Source: AKy350aomGuxUTztWOPXI+gVl1MEgcB2Ww3EEurAtTYT7QWYKij3fQcsX+CIjfRPUgtasssGom9CvA==
X-Received: by 2002:a05:6830:1e79:b0:6a5:ff72:4fea with SMTP id
 m25-20020a0568301e7900b006a5ff724feamr2740190otr.29.1682081780049; 
 Fri, 21 Apr 2023 05:56:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l4-20020a0568301d6400b0069fa883c738sm1742364oti.35.2023.04.21.05.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 05:56:19 -0700 (PDT)
Received: (nullmailer pid 936702 invoked by uid 1000);
 Fri, 21 Apr 2023 12:56:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-4-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-4-5def73f50980@linaro.org>
Message-Id: <168208107852.922456.2603583984839094907.robh@kernel.org>
Subject: Re: [PATCH v2 04/13] dt-bindings: display/msm: Add SM6350 MDSS
Date: Fri, 21 Apr 2023 07:56:18 -0500
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
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 21 Apr 2023 00:31:13 +0200, Konrad Dybcio wrote:
> Document the SM6350 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.example.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
	'qcom,sm6350-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl']
	'qcom,sm6350-dsi-ctrl' is not one of ['dsi-ctrl-6g-qcm2290']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.example.dtb: dsi@ae94000: Unevaluated properties are not allowed ('compatible' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230411-topic-straitlagoon_mdss-v2-4-5def73f50980@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

