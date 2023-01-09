Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE3662881
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D098310E0B1;
	Mon,  9 Jan 2023 14:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C69510E05C;
 Mon,  9 Jan 2023 14:30:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id e205so7213928oif.11;
 Mon, 09 Jan 2023 06:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cEtiZmOlPmj7+0osikAlaU0wda2snqapMro7/OnMBS0=;
 b=oeiA/LPZKtb4ZopVea/VcmnOTFKRm7zoMASPq+JX3vhKlicGkYoEFxg+icP1yCPj4P
 XZC9Sd1abW1QOLuG8ERVHYrUw4NI8Tt2+jfGeMShDVCBE67PncVXimkCsj7stJtjW4yg
 t+YslOnEEp50FvCw/LePuNXK+r8peMLLTO+Jl4BM7x7KEoxRyn1sCIZejw8cM4xe5CZl
 4+/HfbMYVdSQrv/lkSv3mgbYfuUaBadO4Utu03k/iLcM2/ZXP5Su5J15v00UF7paNjOb
 jRLXpg4qHeqy3Z8ppjuFEThMORZtzx2uaqGD/7+F/7i5IsxPHg6UkiqH5GpljJpMlhX+
 ZqCQ==
X-Gm-Message-State: AFqh2krQhQmynUpTsOkK4rzrmbEy5ZmbHiv+5+4qNWlZEdA0mIFFKVaz
 2ETLLJiPMpelZFJ/AUglZA==
X-Google-Smtp-Source: AMrXdXs63wOixqgxtIDGY1yMIvVV753STG4GiVydHxCYw4oCKfkBAipIkbRYpm/4/gnUVlrsgDcEtg==
X-Received: by 2002:a05:6808:2b08:b0:363:1449:1614 with SMTP id
 fe8-20020a0568082b0800b0036314491614mr31278725oib.2.1673274637390; 
 Mon, 09 Jan 2023 06:30:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0034d9042758fsm3973459oic.24.2023.01.09.06.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 06:30:36 -0800 (PST)
Received: (nullmailer pid 237512 invoked by uid 1000);
 Mon, 09 Jan 2023 14:30:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
 <20230109051402.317577-2-dmitry.baryshkov@linaro.org>
Message-Id: <167327376625.60943.17966814849467816091.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: rename mdss nodes to
 display-sybsystem
Date: Mon, 09 Jan 2023 08:30:36 -0600
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
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 07:13:57 +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdss nodes to
> display-subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230109051402.317577-2-dmitry.baryshkov@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

