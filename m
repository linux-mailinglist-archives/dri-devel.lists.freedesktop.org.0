Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251CB6C6A2F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1271910E0C7;
	Thu, 23 Mar 2023 13:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A710E0C7;
 Thu, 23 Mar 2023 13:58:41 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-17aceccdcf6so22739271fac.9; 
 Thu, 23 Mar 2023 06:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679579921;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3EdY5iCPNRdL2TyeF/Jo7q7w4WXQEC68Fw8bFxtFUC0=;
 b=pftPhrx7QjEWzx6nOH/MWJRAEefztyfLWQxqeduXoxTI1w7mXxynfX1qH5NPGriTSP
 7lV/qkA9rMeavEPNdMaBxtVtJtGTifU0447bTAqXqHlHZzfOxwyLhlKomDmCE2h3LeVf
 akPlHJb0+NNeuoL3FxwOdkrlyjgmd/Nc28JB0XCNXZE22fvpM/BawAK0i3LNGaCG3Qv2
 cUxSxjrBXrNc44FvP9H3ZYWjk8fGJyCokERG3v6O7PnrEcW7XePSZhfiwUI1a8n1+fGR
 LOpBfWClxnWJpNoae38tvt8YDMWnbG5N6XWDyfxlxJeom7USRCFWPk5IWdvwMyr93IUf
 tAhw==
X-Gm-Message-State: AAQBX9cT9Uh6U4pRw2LT37/BbasDj8EIou8Ax6/ARMlzf87M7PgwlxPN
 EjYJoqH6+qd2tu0ktPmkgA==
X-Google-Smtp-Source: AKy350ahvKVl/qTqdPvklQDydqu6nw60l4wULSmXqHKjZDmyQTqFM7vvOu4LY79a97GpbICq0EgPrQ==
X-Received: by 2002:a05:6870:b006:b0:178:fe16:4e6c with SMTP id
 y6-20020a056870b00600b00178fe164e6cmr1979157oae.50.1679579921108; 
 Thu, 23 Mar 2023 06:58:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 vd21-20020a0568708f9500b0017ae1aede32sm6104388oab.46.2023.03.23.06.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 06:58:40 -0700 (PDT)
Received: (nullmailer pid 3103740 invoked by uid 1000);
 Thu, 23 Mar 2023 13:58:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org>
Message-Id: <167957963042.3095255.5445133387110199668.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: display: msm: sm8450-mdss: Fix DSI
 compatible
Date: Thu, 23 Mar 2023 08:58:37 -0500
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 23 Mar 2023 11:25:16 +0100, Neil Armstrong wrote:
> The DSI compatible changed between patchset revisions, but that wasn't
> reflected in the bindings. Fix it.
> 
> 0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: 'qcom,sm8450-dsi-phy-5nm' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: phy@ae96400:compatible:0: 'qcom,sm8450-dsi-phy-5nm' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: /example-0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,dsi-phy-5nm-8450']
Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: /example-0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,dsi-phy-5nm-8450']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

