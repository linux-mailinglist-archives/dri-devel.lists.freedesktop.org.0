Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51A619F47
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892C810E97F;
	Fri,  4 Nov 2022 17:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE98410E97F;
 Fri,  4 Nov 2022 17:54:15 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-13b23e29e36so6306243fac.8; 
 Fri, 04 Nov 2022 10:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u7AHuf0DqeM+V9xiT6efORX/S9z2qweBOkj1kn1GRs4=;
 b=ZUob0/lcHERXm9tKcG60YS/6kkCCq4Dwkhh+Ih0ZtC8apg+OomqbPq5THSYr+/Sso1
 EOZsfTBYws5c6kuPBmQHbWLkiQ2oevGlZRhaFAbsZZG1vRO6WQCArhZ3o92CtWjhs1Mj
 +bgi3wvUH3ft5+stJS0yD4ca36c4GFuwL2Khm0Iap9p0b5MYkgTmkzzMLo8eLHAYuuGM
 FJofsFpLl5VjyWqafL88h+7YWkJMVxPhT0qZZhdFRjw84sqvS60+CMeYpDrhPP2FVxnN
 pPBKAn23OX+GBYXDHH4+1iRTUMq5V4e5EpHHKQx2W607C8pI1xIy1ebA0cF/Zp+Oj+V4
 a8CQ==
X-Gm-Message-State: ACrzQf0sXF53Ch5TAVSZ2YX2XYoEGu06XXjp6H4nndnGbdJVjECLAI7/
 52gYyfd/iU3ooft9GJ/QCQ==
X-Google-Smtp-Source: AMsMyM6kU+jqpdhuEc+A1TS9uvGNWlwogKOJv8gvkoL4lBPWHzE6K6dqi+QCXOj0qPtBg4le4Fab8Q==
X-Received: by 2002:a05:6870:4284:b0:101:202e:a78d with SMTP id
 y4-20020a056870428400b00101202ea78dmr31712560oah.37.1667584454747; 
 Fri, 04 Nov 2022 10:54:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o3-20020a544783000000b00342ded07a75sm1669705oic.18.2022.11.04.10.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 10:54:14 -0700 (PDT)
Received: (nullmailer pid 2078500 invoked by uid 1000);
 Fri, 04 Nov 2022 17:54:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221104130324.1024242-4-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-4-dmitry.baryshkov@linaro.org>
Message-Id: <166758411702.2065980.14252732148824060814.robh@kernel.org>
Subject: Re: [PATCH v3 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
Date: Fri, 04 Nov 2022 12:54:15 -0500
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 04 Nov 2022 16:03:19 +0300, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>  .../display/msm/qcom,sm8450-mdss.yaml         | 347 ++++++++++++++++++
>  2 files changed, 479 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/display/msm/mdss-common.yaml
./Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/display/msm/dpu-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.example.dtb: display-controller@ae01000: False schema does not allow {'compatible': ['qcom,sm8450-dpu'], 'reg': [[182456320, 585728], [183173120, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 28], [4294967295, 29], [4294967295, 1], [4294967295, 63], [4294967295, 60], [4294967295, 75]], 'clock-names': ['bus', 'nrt_bus', 'iface', 'lut', 'core', 'vsync'], 'assigned-clocks': [[4294967295, 75]], 'assigned-clock-rates': [[19200000]], 'operating-points-v2': [[1]], 'power-domains': [[4294967295, 6]], 'interrupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}, 'opp-table': {'compatible': ['operating-points-v2'], 'phandle': [[1]], 'opp-172000000': {'opp-hz': [[0], [172000000]], 'required-opps': [[4294967295]]}, 'o
 pp-200000000': {'opp-hz': [[0], [200000000]], 'required-opps': [[4294967295]]}, 'opp-325000000': {'opp-hz': [[0], [325000000]], 'required-opps': [[4294967295]]}, 'opp-375000000': {'opp-hz': [[0], [375000000]], 'required-opps': [[4294967295]]}, 'opp-500000000': {'opp-hz': [[0], [500000000]], 'required-opps': [[4294967295]]}}, '$nodename': ['display-controller@ae01000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.example.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('interrupts', 'operating-points-v2', 'opp-table', 'ports', 'power-domains' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: False schema does not allow {'compatible': ['qcom,sm8450-mdss'], 'reg': [[182452224, 4096]], 'reg-names': ['mdss'], 'interconnects': [[4294967295, 14, 0, 4294967295, 3, 0], [4294967295, 14, 0, 4294967295, 3, 0]], 'interconnect-names': ['mdp0-mem', 'mdp1-mem'], 'resets': [[4294967295, 0]], 'power-domains': [[4294967295, 0]], 'clocks': [[4294967295, 1], [4294967295, 28], [4294967295, 29], [4294967295, 60]], 'clock-names': ['iface', 'bus', 'nrt_bus', 'core'], 'interrupts': [[0, 83, 4]], 'interrupt-controller': True, '#interrupt-cells': [[1]], 'iommus': [[4294967295, 10240, 1026]], '#address-cells': [[1]], '#size-cells': [[1]], 'ranges': True, 'display-controller@ae01000': {'compatible': ['qcom,sm8450-dpu'], 'reg': [[182456320, 585728], [183173120, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 28], [4294967295, 29], [4294967295, 1], 
 [4294967295, 63], [4294967295, 60], [4294967295, 75]], 'clock-names': ['bus', 'nrt_bus', 'iface', 'lut', 'core', 'vsync'], 'assigned-clocks': [[4294967295, 75]], 'assigned-clock-rates': [[19200000]], 'operating-points-v2': [[1]], 'power-domains': [[4294967295, 6]], 'interrupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[2]], 'phandle': [[6]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[3]], 'phandle': [[8]]}}}, 'opp-table': {'compatible': ['operating-points-v2'], 'phandle': [[1]], 'opp-172000000': {'opp-hz': [[0], [172000000]], 'required-opps': [[4294967295]]}, 'opp-200000000': {'opp-hz': [[0], [200000000]], 'required-opps': [[4294967295]]}, 'opp-325000000': {'opp-hz': [[0], [325000000]], 'required-opps': [[4294967295]]}, 'opp-375000000': {'opp-hz': [[0], [375000000]], 'required-opps': [[4294967295]]}, 'opp-500000000': {'opp-hz': [[0], [500000000]], 'required-opps': [[4294967295]]}}}, '
 dsi@ae94000': {'compatible': ['qcom,mdss-dsi-ctrl'], 'reg': [[183058432, 1024]], 'reg-names': ['dsi_ctrl'], 'interrupts': [[4]], 'clocks': [[4294967295, 3], [4294967295, 6], [4294967295, 65], [4294967295, 55], [4294967295, 1], [4294967295, 28]], 'clock-names': ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'], 'assigned-clocks': [[4294967295, 4], [4294967295, 66]], 'assigned-clock-parents': [[4, 0], [4, 1]], 'operating-points-v2': [[5]], 'power-domains': [[4294967295, 6]], 'phys': [[4]], 'phy-names': ['dsi'], '#address-cells': [[1]], '#size-cells': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[6]], 'phandle': [[2]]}}, 'port@1': {'reg': [[1]], 'endpoint': {}}}, 'opp-table': {'compatible': ['operating-points-v2'], 'phandle': [[5]], 'opp-160310000': {'opp-hz': [[0], [160310000]], 'required-opps': [[4294967295]]}, 'opp-187500000': {'opp-hz': [[0], [187500000]], 'required-opps': [[4294967295]]}, 'opp-300000
 000': {'opp-hz': [[0], [300000000]], 'required-opps': [[4294967295]]}, 'opp-358000000': {'opp-hz': [[0], [358000000]], 'required-opps': [[4294967295]]}}}, 'phy@ae94400': {'compatible': ['qcom,dsi-phy-5nm-8450'], 'reg': [[183059456, 512], [183059968, 640], [183060736, 608]], 'reg-names': ['dsi_phy', 'dsi_phy_lane', 'dsi_pll'], '#clock-cells': [[1]], '#phy-cells': [[0]], 'clocks': [[4294967295, 1], [4294967295, 0]], 'clock-names': ['iface', 'ref'], 'vdds-supply': [[4294967295]], 'phandle': [[4]]}, 'dsi@ae96000': {'compatible': ['qcom,mdss-dsi-ctrl'], 'reg': [[183066624, 1024]], 'reg-names': ['dsi_ctrl'], 'interrupts': [[5]], 'clocks': [[4294967295, 7], [4294967295, 10], [4294967295, 67], [4294967295, 57], [4294967295, 1], [4294967295, 28]], 'clock-names': ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'], 'assigned-clocks': [[4294967295, 8], [4294967295, 68]], 'assigned-clock-parents': [[7, 0], [7, 1]], 'operating-points-v2': [[5]], 'power-domains': [[4294967295, 6]], 'phys': [[7
 ]], 'phy-names': ['dsi'], '#address-cells': [[1]], '#size-cells': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[8]], 'phandle': [[3]]}}, 'port@1': {'reg': [[1]], 'endpoint': {}}}}, 'phy@ae96400': {'compatible': ['qcom,dsi-phy-5nm-8450'], 'reg': [[183067648, 512], [183068160, 640], [183068928, 608]], 'reg-names': ['dsi_phy', 'dsi_phy_lane', 'dsi_pll'], '#clock-cells': [[1]], '#phy-cells': [[0]], 'clocks': [[4294967295, 1], [4294967295, 0]], 'clock-names': ['iface', 'ref'], 'vdds-supply': [[4294967295]], 'phandle': [[7]]}, '$nodename': ['display-subsystem@ae00000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'interrupt-controller', 'interrupts', 'power-domains', 'ranges', 'reg', 'reg-names', 'resets' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-controller@ae01000: False schema does not allow {'compatible': ['qcom,sm8450-dpu'], 'reg': [[182456320, 585728], [183173120, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 28], [4294967295, 29], [4294967295, 1], [4294967295, 63], [4294967295, 60], [4294967295, 75]], 'clock-names': ['bus', 'nrt_bus', 'iface', 'lut', 'core', 'vsync'], 'assigned-clocks': [[4294967295, 75]], 'assigned-clock-rates': [[19200000]], 'operating-points-v2': [[1]], 'power-domains': [[4294967295, 6]], 'interrupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[2]], 'phandle': [[6]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[3]], 'phandle': [[8]]}}}, 'opp-table': {'compatible': ['operating-points-v2'], 'phandle': [[1]], 'opp-172000000': {'opp-hz': [[0], [172000000]], 'required-opps': 
 [[4294967295]]}, 'opp-200000000': {'opp-hz': [[0], [200000000]], 'required-opps': [[4294967295]]}, 'opp-325000000': {'opp-hz': [[0], [325000000]], 'required-opps': [[4294967295]]}, 'opp-375000000': {'opp-hz': [[0], [375000000]], 'required-opps': [[4294967295]]}, 'opp-500000000': {'opp-hz': [[0], [500000000]], 'required-opps': [[4294967295]]}}, '$nodename': ['display-controller@ae01000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('interrupts', 'operating-points-v2', 'opp-table', 'ports', 'power-domains' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

