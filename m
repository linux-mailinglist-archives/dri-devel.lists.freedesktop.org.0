Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EAB6F8C67
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 00:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD46110E684;
	Fri,  5 May 2023 22:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F393510E0E8;
 Fri,  5 May 2023 22:34:51 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-38dee9a7795so874046b6e.3; 
 Fri, 05 May 2023 15:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683326091; x=1685918091;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x2bjE4y2k/ZRonBr5I4qWlh5CoiWSN7zhAV2pZnn6Zo=;
 b=TngJJdavKHbutznHBxHv5Otioe9qUEqxO1zDbe3a9ujYBR98j8IkvpPPW/nW1rwHJu
 S1ZDhzy8DRwvuhrhc1FED7i13Rv05BWF4PgOWtcn3QUaxIN/teZ3U/GcgWpJTYqXjWhQ
 n8QuWGasAm2X4AbZXoZHs9J/kZZ/55ssGTYcd6ejuOTO4PqJOVtPycqvnGDCbORAbWjO
 AsXl9JVb8a0lWD9BfqLMNYSqbElDpjyYZmwKmtAayxOdAUo7n73DwbgDL/PCHZzz4NMW
 SDJ2SUZQ6w8VUIo8O8shlSGVuLejmvRhFm96mDc9Peaw4U7jEVRXShI6ryRzHql/a8RS
 8etw==
X-Gm-Message-State: AC+VfDyAQk5G3NrW4kLgSwCQxYBFMvMCNvY841Q85Foyr/wsl1Si/iuR
 nJPMUfX34G65r8fd1Ba+DVxqa61X2w==
X-Google-Smtp-Source: ACHHUZ53cI1CM7mECZnA6cYHzHY3nz4n6zr1YDhdJXJbCXDc1XMGMyxqi2QWT5S0Nvb2PxvZUxA5IA==
X-Received: by 2002:a05:6808:1c4:b0:387:2e2e:7b2 with SMTP id
 x4-20020a05680801c400b003872e2e07b2mr1330779oic.26.1683326090853; 
 Fri, 05 May 2023 15:34:50 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j16-20020a9d7690000000b006a6558ef17fsm1404537otl.30.2023.05.05.15.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 15:34:50 -0700 (PDT)
Received: (nullmailer pid 3806405 invoked by uid 1000);
 Fri, 05 May 2023 22:34:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org>
Message-Id: <168332608833.3806341.1631479517447632665.robh@kernel.org>
Subject: Re: [PATCH v3 04/12] dt-bindings: display/msm: Add SM6350 MDSS
Date: Fri, 05 May 2023 17:34:48 -0500
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, iommu@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 05 May 2023 23:40:30 +0200, Konrad Dybcio wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230411-topic-straitlagoon_mdss-v3-4-9837d6b3516d@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

