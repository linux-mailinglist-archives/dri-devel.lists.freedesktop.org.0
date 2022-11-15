Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3B629BA5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 15:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556710E401;
	Tue, 15 Nov 2022 14:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DA010E401;
 Tue, 15 Nov 2022 14:11:18 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so8406360otb.1; 
 Tue, 15 Nov 2022 06:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TacVoOO9NDNFIMt31qzCtRgln1ccwtifAk7PyC4xZ0s=;
 b=G8jaMA4qGzVNU5n4ikSLm5E03a6TTkhAIboKMh7y+w2Bgl0YJta6VEQYAALENnL6aA
 3khHR/ef3tPATGavqlclB4m8gcII4jrzCyyS9uUPqQ0veyZ76FRPbJ3aW3j9IMhs/Bwd
 rZcasUSZxp6AARg1NKumHVNgAuqR4kUoz/w9W5ATlEy7M9x29dXrCelrmodX+i+mevMl
 vro97kEi1LvS5uH5q2oOB3I6pfxpaXCbgZuCpbHgBi1uBBv42j4RvA2M30Lt+xqU1IvX
 AZBQM86WHzaSX3DZKru61iO/e05v44KUi9G6IINdyuzfJsM21Q4JVv1yD327xO4P+Tj5
 QzZQ==
X-Gm-Message-State: ANoB5pkHH323pxXrHWyMTnT8iP/cPc7cQLcSaQrENcQs2+0T+B5nxuwk
 yk0Vm9E/wr8nh12ZlqVtvg==
X-Google-Smtp-Source: AA0mqf41qwNznHD4daQ+Mhz0sumypTqDXe1dh5cjhOzl/ybpdXvQQEyrHv+3a+htI5DwxWlPOz3B+g==
X-Received: by 2002:a05:6830:153:b0:66c:a3a8:3870 with SMTP id
 j19-20020a056830015300b0066ca3a83870mr8901401otp.54.1668521477402; 
 Tue, 15 Nov 2022 06:11:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s5-20020a4adb85000000b00499527def25sm4840834oou.47.2022.11.15.06.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 06:11:16 -0800 (PST)
Received: (nullmailer pid 908584 invoked by uid 1000);
 Tue, 15 Nov 2022 14:11:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
In-Reply-To: <20221115111721.891404-3-robert.foss@linaro.org>
References: <20221115111721.891404-1-robert.foss@linaro.org>
 <20221115111721.891404-3-robert.foss@linaro.org>
Message-Id: <166851961892.867704.17058917320073105789.robh@kernel.org>
Subject: Re: [PATCH v2 02/12] dt-bindings: display: msm: Add qcom,
 sm8350-mdss binding
Date: Tue, 15 Nov 2022 08:11:14 -0600
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 15 Nov 2022 12:17:11 +0100, Robert Foss wrote:
> Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for MDSS device
> tree bindings
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../display/msm/qcom,sm8350-mdss.yaml         | 240 ++++++++++++++++++
>  1 file changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/display/msm/mdss-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb: display-subsystem@ae00000: False schema does not allow {'compatible': ['qcom,sm8350-mdss'], 'reg': [[182452224, 4096]], 'reg-names': ['mdss'], 'interconnects': [[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295, 1, 0]], 'interconnect-names': ['mdp0-mem', 'mdp1-mem'], 'power-domains': [[4294967295, 0]], 'resets': [[4294967295, 0]], 'clocks': [[4294967295, 0], [4294967295, 27], [4294967295, 28], [4294967295, 32]], 'clock-names': ['iface', 'bus', 'nrt_bus', 'core'], 'iommus': [[4294967295, 2080, 1026]], 'interrupts': [[0, 83, 4]], 'interrupt-controller': True, '#interrupt-cells': [[1]], '#address-cells': [[1]], '#size-cells': [[1]], 'ranges': True, 'display-controller@ae01000': {'compatible': ['qcom,sm8350-dpu'], 'reg': [[182456320, 585728], [183173120, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 27], [4294967295, 28], [4294967295, 0], [42
 94967295, 34], [4294967295, 32], [4294967295, 44]], 'clock-names': ['bus', 'nrt_bus', 'iface', 'lut', 'core', 'vsync'], 'assigned-clocks': [[4294967295, 44]], 'assigned-clock-rates': [[19200000]], 'operating-points-v2': [[1]], 'power-domains': [[4294967295, 6]], 'interrupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[2]], 'phandle': [[4]]}}}, 'opp-table': {'compatible': ['operating-points-v2'], 'phandle': [[1]], 'opp-200000000': {'opp-hz': [[0], [200000000]], 'required-opps': [[4294967295]]}, 'opp-300000000': {'opp-hz': [[0], [300000000]], 'required-opps': [[4294967295]]}, 'opp-345000000': {'opp-hz': [[0], [345000000]], 'required-opps': [[4294967295]]}, 'opp-460000000': {'opp-hz': [[0], [460000000]], 'required-opps': [[4294967295]]}}}, 'dsi@ae94000': {'compatible': ['qcom,mdss-dsi-ctrl'], 'reg': [[183058432, 1024]], 'reg-names': ['dsi_ctrl'], 'interrupts': [[4]], 'clocks': [[4294967295, 2], [4294967295,
  5], [4294967295, 36], [4294967295, 28], [4294967295, 0], [4294967295, 27]], 'clock-names': ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'], 'assigned-clocks': [[4294967295, 3], [4294967295, 37]], 'assigned-clock-parents': [[3, 0], [3, 1]], 'operating-points-v2': [[4294967295]], 'power-domains': [[4294967295, 6]], 'phys': [[3]], 'phy-names': ['dsi'], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4]], 'phandle': [[2]]}}, 'port@1': {'reg': [[1]], 'endpoint': {}}}}, 'phy@ae94400': {'compatible': ['qcom,dsi-phy-5nm-8350'], 'reg': [[183059456, 512], [183059968, 640], [183060736, 608]], 'reg-names': ['dsi_phy', 'dsi_phy_lane', 'dsi_pll'], '#clock-cells': [[1]], '#phy-cells': [[0]], 'clocks': [[4294967295, 0], [4294967295, 0]], 'clock-names': ['iface', 'ref'], 'vdds-supply': [[4294967295]], 'phandle': [[3]]}, '$nodename': ['display-subsystem@ae00000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'interrupt-controller', 'interrupts', 'power-domains', 'ranges', 'reg', 'reg-names', 'resets' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

