Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EBB694A68
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE72810E5F7;
	Mon, 13 Feb 2023 15:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02DE10E613;
 Mon, 13 Feb 2023 15:09:49 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id v6so339312ilc.10;
 Mon, 13 Feb 2023 07:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=izcvmEfYGF1qHX8/hJIplnh01MRs+KJ7qGdimHU+1VM=;
 b=HcCIyZMQ4rE5hqvYGqyHhUvaMxc6+rh6yFa7xC/4JJBCE1LGkGZHP7SGzhWyg+I6QT
 lYgzQ2WaNMMv4PjXGnHfnZ2JiTZ7wFADs1fQDKcmV94/uMyKsZUKzqefQNTpPfwtEBT+
 cw4S6bDNLXU+di0LIlxni2+/Uht21KozTxcNoLQFQb20BPdJ0QEgtvpYawUv3/v9ifJs
 ggXUmX5qmMyVs0AwwMSCf0XkVEQ53whR+mUta8Qck2R+IPAWl6qzOYNS9cXd6a53hiij
 wdnghzSYerXomLrV7hXPcsuASbUeSBG8b4/ZT67A3MzlLmW1XdKCL6d/f+4HRaeI+OEl
 9fCA==
X-Gm-Message-State: AO0yUKWjJkWr6DQBBRMLJiZjnAnt5D9j0LfkCb3m0kqjl+1faL/RnnVn
 dDh3QskaYloiujRY6cYLvQ==
X-Google-Smtp-Source: AK7set/PauQ/4h5+1OHFxdgFVp3PLCj5fX29L44DbapxgCZR3zDCwMZWu/ZKbFWwXtvHlLVLC8DXEg==
X-Received: by 2002:a92:c263:0:b0:315:3948:1c5a with SMTP id
 h3-20020a92c263000000b0031539481c5amr5310369ild.15.1676300989045; 
 Mon, 13 Feb 2023 07:09:49 -0800 (PST)
Received: from robh_at_kernel.org (c-73-14-99-67.hsd1.co.comcast.net.
 [73.14.99.67]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056e020d0300b003153787b444sm1493791ilj.21.2023.02.13.07.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 07:09:48 -0800 (PST)
Received: (nullmailer pid 11611 invoked by uid 1000);
 Mon, 13 Feb 2023 15:09:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211122656.1479141-5-konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-5-konrad.dybcio@linaro.org>
Message-Id: <167630051091.6244.17725263778561654199.robh@kernel.org>
Subject: Re: [PATCH 04/10] dt-bindings: display/msm: Add SM6375 DPU & MDSS
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, Rob Herring <robh+dt@kernel.org>,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 11 Feb 2023 13:26:50 +0100, Konrad Dybcio wrote:
> Document SM6375 DPU and MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6375-dpu.yaml | 106 +++++++++
>  .../display/msm/qcom,sm6375-mdss.yaml         | 216 ++++++++++++++++++
>  2 files changed, 322 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6375-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.example.dtb: dsi@5e94000: compatible:0: 'qcom,sm6375-dsi-ctrl' is not one of ['qcom,mdss-dsi-ctrl', 'qcom,dsi-ctrl-6g-qcm2290']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.example.dtb: dsi@5e94000: compatible: ['qcom,sm6375-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230211122656.1479141-5-konrad.dybcio@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

