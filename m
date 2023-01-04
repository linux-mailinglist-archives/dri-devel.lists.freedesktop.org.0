Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC5865CAD0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 01:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0799410E41D;
	Wed,  4 Jan 2023 00:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F0810E41C;
 Wed,  4 Jan 2023 00:29:08 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id h26so4623903ila.11;
 Tue, 03 Jan 2023 16:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oFl9C+pdV8o+KMF9oxiGndE/yHy/VbU0fKzAvJ4LrQ=;
 b=XwtdNKgXz3o2/+bKX1AaIy9LZF8NLP2CHZpmXwDRXW8QzYxhv7gn3avW8OG1AsMmH/
 +MGsUpaGx6BtSo1dsVisyhRK1BIylgg+IvyFNUrC94lpPqsKKj4pqyux4yrjZA3Dwft0
 g5/uyVbfXeOYb1FZYAMiB/XiECCkL8L5/E//RT7d3cuf3ovL8dmDkXruESXxuE7r8Ho8
 eTsEF2W+Jp6/WUWt8Uv3TyTWD7uzC9DeUmih91wQ+itgaKtza+M7gNZwfALo5Fuo/6a0
 0LHHz8oT4PWRdj3O0w4srtxfe6FqWt8NiC6Z1+89haE56lX5cjj16d1++O3K33HGBX2T
 V2Eg==
X-Gm-Message-State: AFqh2krm3qB3j4Oqr/nDxC3hUhk+xzmHTBU4nvioF0f3wozbNUw+q5qQ
 Oq1oXpno/Xf5g1j6AunHCQ==
X-Google-Smtp-Source: AMrXdXtT403stngUA7JGfIW3gdVGtgW+fbAfI4N20y5CYBCxGtOZUKCUGWgIkSQqAkYQIE8JGXUwnw==
X-Received: by 2002:a92:c085:0:b0:30c:f88:e807 with SMTP id
 h5-20020a92c085000000b0030c0f88e807mr17877427ile.6.1672792147532; 
 Tue, 03 Jan 2023 16:29:07 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a92ddc5000000b002faf6559e90sm10184711ilr.51.2023.01.03.16.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 16:29:07 -0800 (PST)
Received: (nullmailer pid 143313 invoked by uid 1000);
 Wed, 04 Jan 2023 00:29:05 -0000
Date: Tue, 3 Jan 2023 18:29:05 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 07/18] dt-bindings: display/msm: Add list of
 mdss-dsi-ctrl compats
Message-ID: <20230104002905.GA134092-robh@kernel.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
 <20221223021025.1646636-8-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223021025.1646636-8-bryan.odonoghue@linaro.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 david@ixit.cz, dianders@chromium.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 02:10:14AM +0000, Bryan O'Donoghue wrote:
> Add the list of current compats absent the deprecated qcm2290 to the list
> of dsi compats listed here.
> 
> Several MDSS yaml files exist which document the dsi sub-node.
> For each existing SoC MDSS yaml, provide the right dsi compat string.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml          | 16 +++++++++++++++-
>  .../bindings/display/msm/qcom,msm8998-mdss.yaml  |  8 +++++---
>  .../bindings/display/msm/qcom,sc7180-mdss.yaml   |  6 ++++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml   |  6 ++++--
>  .../bindings/display/msm/qcom,sdm845-mdss.yaml   |  8 +++++---
>  .../bindings/display/msm/qcom,sm8250-mdss.yaml   |  8 +++++---
>  6 files changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index ba0460268731b..86bb43489bf4a 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -94,7 +94,21 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: qcom,mdss-dsi-ctrl
> +        items:
> +          - enum:
> +              - qcom,apq8064-dsi-ctrl
> +              - qcom,msm8916-dsi-ctrl
> +              - qcom,msm8953-dsi-ctrl
> +              - qcom,msm8974-dsi-ctrl
> +              - qcom,msm8996-dsi-ctrl
> +              - qcom,msm8998-dsi-ctrl
> +              - qcom,qcm2290-dsi-ctrl
> +              - qcom,sc7180-dsi-ctrl
> +              - qcom,sc7280-dsi-ctrl
> +              - qcom,sdm660-dsi-ctrl
> +              - qcom,sdm845-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

No need to have an exact match here. Just this is enough:

compatible:
  contains:
    const: qcom,mdss-dsi-ctrl

Then the DSI schema will check the rest.

Same for the rest.

Rob
