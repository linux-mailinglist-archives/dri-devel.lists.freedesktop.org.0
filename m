Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4796314CC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 16:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFCF10E066;
	Sun, 20 Nov 2022 15:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2FA10E066;
 Sun, 20 Nov 2022 15:09:27 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id m204so10286797oib.6;
 Sun, 20 Nov 2022 07:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CVGUqFNK7QHl7oagdZ7ol1T74KslFgB97zBDrmW7P5U=;
 b=BzaprO16+EvyzBh6wX50UyqUZgwIP8zT5Kb+K5nRv7y+2iV8+AJ82pztAN70TWMkLM
 iigPDfR3GEJMKNkTXoGq6vd6CPtsQqDLHfFAS4SJEtmXejjFLnfJS3IfpT7w2r6dPCrZ
 6AmubjXgZc6rrRXm1gswfuwVnV+OfKTZQYrOnJFuAUIzS6zztpJd6e9dD9ab3aWkeuSi
 rqxglp7rDq7LsqOkjrOXPq0pbjqhHmf5hYRyVCBpiEoYQkV0wwZDC7J+nEbSycSYPjfB
 qZRdNFvUpvOudYow/7l9OXrtKKmVtxmZ643mAGeeX5AxjZgAXt9WXGCoY0JTLmUHCueE
 JTmw==
X-Gm-Message-State: ANoB5pkA3eYqQlYztxRTIr5RrifgmL/ssvnZqRZn2xkoa1DOc5VTYm7A
 GL8gg8QOGQNbJEY91fGDcQ==
X-Google-Smtp-Source: AA0mqf5t9jVGZnwDJIFnAQp0beLeBUk4w470fj8UcMal8bLIZI7yowIDLhhJ0BpHZYRywhVfdYjFUw==
X-Received: by 2002:a54:4611:0:b0:35a:1d79:181b with SMTP id
 p17-20020a544611000000b0035a1d79181bmr10190286oip.8.1668956966705; 
 Sun, 20 Nov 2022 07:09:26 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f6:1a48:29f6:113d:266f:a78e])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056870f15500b001226d2100f2sm4838243oac.33.2022.11.20.07.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 07:09:26 -0800 (PST)
Received: (nullmailer pid 3068618 invoked by uid 1000);
 Sun, 20 Nov 2022 15:09:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Adam Skladowski <a39.skl@gmail.com>
In-Reply-To: <20221120133744.24808-2-a39.skl@gmail.com>
References: <20221120133744.24808-1-a39.skl@gmail.com>
 <20221120133744.24808-2-a39.skl@gmail.com>
Message-Id: <166895687938.3066844.689710891045782245.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: add support for the display
Date: Sun, 20 Nov 2022 09:09:23 -0600
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Adam Skladowski <a_skl39@protonmail.com>,
 Vinod Koul <vkoul@kernel.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Jason Wang <wangborong@cdjrlc.com>, Sean Paul <sean@poorly.run>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 20 Nov 2022 14:37:36 +0100, Adam Skladowski wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM6115 platform.
> Configuration for DSI/PHY is shared with QCM2290 so compatibles are reused.
> Lack of dsi phy supply in example is intended
> due to fact on qcm2290, sm6115 and sm6125
> this phy is supplied via power domain, not regulator.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../bindings/display/msm/qcom,sm6115-dpu.yaml |  87 ++++++++
>  .../display/msm/qcom,sm6115-mdss.yaml         | 187 ++++++++++++++++++
>  2 files changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/display/msm/dpu-common.yaml
./Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/display/msm/mdss-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.example.dtb: display-controller@5e01000: False schema does not allow {'compatible': ['qcom,sm6115-dpu'], 'reg': [[98570240, 585728], [99287040, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 63], [4294967295, 2], [4294967295, 10], [4294967295, 12], [4294967295, 16], [4294967295, 18]], 'clock-names': ['bus', 'iface', 'core', 'lut', 'rot', 'vsync'], 'operating-points-v2': [[4294967295]], 'power-domains': [[4294967295, 0]], 'interrupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}, '$nodename': ['display-controller@5e01000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.example.dtb: display-controller@5e01000: Unevaluated properties are not allowed ('interrupts', 'operating-points-v2', 'ports', 'power-domains' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: mdss@5e00000: False schema does not allow {'#address-cells': [[1]], '#size-cells': [[1]], 'compatible': ['qcom,sm6115-mdss'], 'reg': [[98566144, 4096]], 'reg-names': ['mdss'], 'power-domains': [[4294967295, 0]], 'clocks': [[4294967295, 61], [4294967295, 63], [4294967295, 10]], 'clock-names': ['iface', 'bus', 'core'], 'interrupts': [[0, 186, 4]], 'interrupt-controller': True, '#interrupt-cells': [[1]], 'iommus': [[4294967295, 1056, 2], [4294967295, 1057, 0]], 'ranges': True, 'display-controller@5e01000': {'compatible': ['qcom,sm6115-dpu'], 'reg': [[98570240, 585728], [99287040, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 63], [4294967295, 2], [4294967295, 10], [4294967295, 12], [4294967295, 16], [4294967295, 18]], 'clock-names': ['bus', 'iface', 'core', 'lut', 'rot', 'vsync'], 'operating-points-v2': [[4294967295]], 'power-domains': [[4294967295, 0]], 'int
 errupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[1]], 'phandle': [[3]]}}}}, 'dsi@5e94000': {'compatible': ['qcom,dsi-ctrl-6g-qcm2290'], 'reg': [[99172352, 1024]], 'reg-names': ['dsi_ctrl'], 'interrupts': [[4]], 'clocks': [[4294967295, 4], [4294967295, 7], [4294967295, 14], [4294967295, 8], [4294967295, 2], [4294967295, 63]], 'clock-names': ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus'], 'assigned-clocks': [[4294967295, 5], [4294967295, 15]], 'assigned-clock-parents': [[2, 0], [2, 1]], 'operating-points-v2': [[4294967295]], 'power-domains': [[4294967295, 0]], 'phys': [[2]], 'phy-names': ['dsi'], '#address-cells': [[1]], '#size-cells': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[3]], 'phandle': [[1]]}}, 'port@1': {'reg': [[1]], 'endpoint': {}}}}, 'phy@5e94400': {'compatible': ['qcom,dsi-phy-14nm-2290'], 'reg': [[9917
 3376, 256], [99173632, 768], [99174400, 392]], 'reg-names': ['dsi_phy', 'dsi_phy_lane', 'dsi_pll'], '#clock-cells': [[1]], '#phy-cells': [[0]], 'clocks': [[4294967295, 2], [4294967295, 0]], 'clock-names': ['iface', 'ref'], 'phandle': [[2]]}, '$nodename': ['mdss@5e00000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: mdss@5e00000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'interrupt-controller', 'interrupts', 'power-domains', 'ranges', 'reg', 'reg-names' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: display-controller@5e01000: False schema does not allow {'compatible': ['qcom,sm6115-dpu'], 'reg': [[98570240, 585728], [99287040, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 63], [4294967295, 2], [4294967295, 10], [4294967295, 12], [4294967295, 16], [4294967295, 18]], 'clock-names': ['bus', 'iface', 'core', 'lut', 'rot', 'vsync'], 'operating-points-v2': [[4294967295]], 'power-domains': [[4294967295, 0]], 'interrupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[1]], 'phandle': [[3]]}}}, '$nodename': ['display-controller@5e01000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: display-controller@5e01000: Unevaluated properties are not allowed ('interrupts', 'operating-points-v2', 'ports', 'power-domains' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221120133744.24808-2-a39.skl@gmail.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

