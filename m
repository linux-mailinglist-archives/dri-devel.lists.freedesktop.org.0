Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C91694A66
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF2F10E5EE;
	Mon, 13 Feb 2023 15:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05DC10E5EE;
 Mon, 13 Feb 2023 15:09:44 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id s9so4153825ilt.1;
 Mon, 13 Feb 2023 07:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ogFsLNQEFVm7C6QvQZMbka0qqj2F6J8HwmRYO32/VOg=;
 b=bQ28pSjjEtHHLB0V8WSZqToAh+XG8IdGpqbPi7nKp5L8gc9anIC7Ns8qKF6tDq4ViZ
 2q687pbLTmQHCqs5/4pCrzX1O0yh5nRdVPaLZK1TEwYpUPPScp37aVCAGJ6GMRJ/gtZl
 pgCgBXIsXlTAucF2BC+wsQj1gXDexJWUy38tqSE/0ENulLR5KTY0e9LmOdblMT6a5ys6
 etO4iTdtciS55qOYD00QYvllR1EfMuhsp1KUqHwW9M7QtGqzrpnNbPa2sbheHDLdCbTX
 8sJk+0gwnC1RtKGW/rgBORPNmIVshVHN6xPFdDZYWxeecwMglyhOekVftiTYlcbjgZzW
 tqkw==
X-Gm-Message-State: AO0yUKXPnhxfqZAqEXKsGc5GJHjgWtrW5xCvCeQpUbQfWYIKPA3wOWNp
 ZQ19Z4/MNwabQwNHMGcd7w==
X-Google-Smtp-Source: AK7set9DOOH8pVq0q18oUvyYwV+s2TWpICsRn/3fLBdCPEA0O6cjKYg+qIAzs4dUab0rq9PFB6kMoQ==
X-Received: by 2002:a92:a007:0:b0:313:d914:e544 with SMTP id
 e7-20020a92a007000000b00313d914e544mr21549100ili.23.1676300983976; 
 Mon, 13 Feb 2023 07:09:43 -0800 (PST)
Received: from robh_at_kernel.org (c-73-14-99-67.hsd1.co.comcast.net.
 [73.14.99.67]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056e021a2f00b003141eddd283sm2746676ile.22.2023.02.13.07.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 07:09:43 -0800 (PST)
Received: (nullmailer pid 11608 invoked by uid 1000);
 Mon, 13 Feb 2023 15:09:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211122656.1479141-4-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-4-konrad.dybcio@linaro.org>
Message-Id: <167630050949.6199.14243256327599171035.robh@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: display/msm: Add SM6350 DPU & MDSS
Date: Mon, 13 Feb 2023 09:09:41 -0600
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, agross@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 11 Feb 2023 13:26:49 +0100, Konrad Dybcio wrote:
> Document 6350 DPU and MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6350-dpu.yaml |  94 ++++++++
>  .../display/msm/qcom,sm6350-mdss.yaml         | 213 ++++++++++++++++++
>  2 files changed, 307 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml:55:11: [warning] wrong indentation: expected 8 but found 10 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml: patternProperties:^dsi@[0-9a-f]+$:properties:compatible: [{'const': 'qcom,sm6350-dsi-ctrl'}, {'const': 'qcom,mdss-dsi-ctrl'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml: ignoring, error in schema: patternProperties: ^dsi@[0-9a-f]+$: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.example.dtb: dsi@ae94000: compatible:0: 'qcom,sm6350-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.example.dtb: dsi@ae94000: compatible: ['qcom,sm6350-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.example.dtb: phy@ae94400: 'vdds-supply' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230211122656.1479141-4-konrad.dybcio@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

