Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A882637E67
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 18:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A167510E162;
	Thu, 24 Nov 2022 17:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AA310E162;
 Thu, 24 Nov 2022 17:39:27 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id d12so1041479ilv.4;
 Thu, 24 Nov 2022 09:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GUtAsbJjtVstvd/b0ZGms/6XAruxEAzhFNxybJwuAKI=;
 b=MyxI/M6KeLFhUcENaD3HldesHB8H6iBzw9URcpF11jkB9+nEXImIq9J9wfL+8foj2g
 jfSJW2hZWfNIGUE5TKZK2uPFq3WmBDbsFFGo9dC8omJ2Q5j2MirjRwyULmNSbQ5Vnz+H
 z3maaGFLxns8NGgBZjM/nBZwAPGhaK5sCLac5mZpyWVlFyHwCpN4KJ+pOlulRh2DTpWn
 4UFfOJQJamHN7NPHYqDRb1M6chw3zB4yptBEmsBElimlOxXPNJhL4MiKf5EW+dNiDCvI
 rOr87lLGkg9QRjGlqaV3W64OezEegjMqqn2j7a06E3Hghm1hUjlszRa20T7ajL7qjbl4
 h4Wg==
X-Gm-Message-State: ANoB5pkSDEw5BeuQXvTwjvaPLKZQkW1wtwc+FJWQlS0RTtSc1WHBl/w8
 afujj5gbfzKhsBLkirhiXA==
X-Google-Smtp-Source: AA0mqf5LnzuB0Q7FUVU6kDolp5fz6a9D/ptnXBsEj4VJRjUHp9cPfRVI5EbQBTT+LdQ+G2TVumuDcw==
X-Received: by 2002:a05:6e02:1d17:b0:302:9392:5a01 with SMTP id
 i23-20020a056e021d1700b0030293925a01mr6314525ila.268.1669311566801; 
 Thu, 24 Nov 2022 09:39:26 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id
 s193-20020a0251ca000000b00375b5370314sm617539jaa.62.2022.11.24.09.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 09:39:26 -0800 (PST)
Received: (nullmailer pid 4182339 invoked by uid 1000);
 Thu, 24 Nov 2022 17:39:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221124004801.361232-5-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-5-bryan.odonoghue@linaro.org>
Message-Id: <166930149919.3946571.17568259975526028936.robh@kernel.org>
Subject: Re: [PATCH v3 04/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Date: Thu, 24 Nov 2022 11:39:27 -0600
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 quic_abhinavk@quicinc.com, konrad.dybcio@somainline.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org, david@ixit.cz,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run,
 andersson@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 24 Nov 2022 00:47:47 +0000, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm630-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> 
> Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml        | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.example.dtb: dsi@ae94000: compatible:0: 'qcom,mdss-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm630-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm8250-dsi-ctrl']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.example.dtb: dsi@ae94000: compatible: ['qcom,mdss-dsi-ctrl'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221124004801.361232-5-bryan.odonoghue@linaro.org

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

