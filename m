Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA11629BA0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 15:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2BA10E403;
	Tue, 15 Nov 2022 14:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6017110E402;
 Tue, 15 Nov 2022 14:11:16 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso2225684otl.13; 
 Tue, 15 Nov 2022 06:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EqWqP263F0VBi+wp6NIdMw44Os0nhYFuBkjSSobCBrM=;
 b=0Tb/q8nJwg9EcTzaQKBdb06kMe4v5YoKTSVsoaAkcN45NOBeBxlQQMgb1ux5roCiO9
 LCU4fPhQZtRDMOPfzWE8ZJ4+QGI8H68edwludNJ2N37LjwKnlTgFhpc8QM/d/k+OOpMG
 6N0kWL/KyM7viQYM3m1r5v6XQvLcm9WKiYz5QhvJoPY8bPiIF/9h0vRUJIelq1q7rc+6
 GumpEDCjjTYcrDfEMLQAuOckFiQEhGy72eK9jcoCqkrGfVU+pLDf7d5VJfIEI/M3Y8DJ
 xQ7bN4Qqk8+sjX0+W+PbwbhOAXImH0HUKZzEoc8wVeEPZ/BQihNp6Pka6gB+h2rVvry6
 cA6A==
X-Gm-Message-State: ANoB5pk29pd9QDW5IA/DWNSCFmYmfw7TQAgkRLPgAbZbP4VSFXgmMtoe
 L0j9gEfpJ8Q7JHT58U/0serA5ecXWA==
X-Google-Smtp-Source: AA0mqf79qA6Fs+UZ4mUVQEbyhd/P9Pj/81uhRm470TyNwj7sRxVAqBNhJBdEn+OuAqL6o613cSb4XA==
X-Received: by 2002:a05:6830:20ca:b0:66c:4f87:fd14 with SMTP id
 z10-20020a05683020ca00b0066c4f87fd14mr8909225otq.159.1668521475440; 
 Tue, 15 Nov 2022 06:11:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 185-20020aca06c2000000b0035a5b95bd38sm4915712oig.54.2022.11.15.06.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 06:11:14 -0800 (PST)
Received: (nullmailer pid 908582 invoked by uid 1000);
 Tue, 15 Nov 2022 14:11:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
In-Reply-To: <20221115111721.891404-2-robert.foss@linaro.org>
References: <20221115111721.891404-1-robert.foss@linaro.org>
 <20221115111721.891404-2-robert.foss@linaro.org>
Message-Id: <166851961813.867662.5795540352280640159.robh@kernel.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: display: msm: Add qcom,
 sm8350-dpu binding
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
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, sean@poorly.run, quic_kalyant@quicinc.com,
 loic.poulain@linaro.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 15 Nov 2022 12:17:10 +0100, Robert Foss wrote:
> Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/display/msm/dpu-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.example.dtb: display-controller@ae01000: False schema does not allow {'compatible': ['qcom,sm8350-dpu'], 'reg': [[182456320, 585728], [183173120, 8200]], 'reg-names': ['mdp', 'vbif'], 'clocks': [[4294967295, 27], [4294967295, 28], [4294967295, 0], [4294967295, 34], [4294967295, 32], [4294967295, 44]], 'clock-names': ['bus', 'nrt_bus', 'iface', 'lut', 'core', 'vsync'], 'assigned-clocks': [[4294967295, 44]], 'assigned-clock-rates': [[19200000]], 'operating-points-v2': [[1]], 'power-domains': [[4294967295, 6]], 'interrupts': [[0]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}, 'opp-table': {'compatible': ['operating-points-v2'], 'phandle': [[1]], 'opp-200000000': {'opp-hz': [[0], [200000000]], 'required-opps': [[4294967295]]}, 'opp-300000000': {'opp-hz': [[0], [300000000]], 'required-opps': [[4294967295
 ]]}, 'opp-345000000': {'opp-hz': [[0], [345000000]], 'required-opps': [[4294967295]]}, 'opp-460000000': {'opp-hz': [[0], [460000000]], 'required-opps': [[4294967295]]}}, '$nodename': ['display-controller@ae01000']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.example.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('interrupts', 'operating-points-v2', 'opp-table', 'ports', 'power-domains' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

