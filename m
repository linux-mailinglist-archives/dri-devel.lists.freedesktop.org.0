Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37338668636
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 22:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D829E10E932;
	Thu, 12 Jan 2023 21:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A8B10E92E;
 Thu, 12 Jan 2023 21:52:07 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 m23-20020a4abc97000000b004bfe105c580so5148118oop.4; 
 Thu, 12 Jan 2023 13:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pocd7oPe80m3B5bK7WHq/GJVxDYkLdBzBVnfgMx2yo8=;
 b=skMtWnoUIBP+3uVRJeXSGdrAWcRM6PQ56932Fobfv6oBewtifsLB0oFmCsI/NG1tUZ
 xLYWGE0wD4Xz/KHIM083eHS6ARkCCdOtFvjsbwhtJWar7BFK1BxVhSv0+SaPY/zFA0M8
 quwltjLyobJFiaHpLZgIYfOKGvqC5slMfSP0QXXe7mBijqmjvBXbiledzuWmGZliAWPF
 DM+qkhe+Vl7+Z6yE9OAk3lkk8p3EZyXwTuOTMlkYS+SPWOPrtRuS9kck1Bm9XsGCB1/K
 6lgqUbCm3KWwqGi5Qe5wjWp/5UcqTzAAOYgkhdS3p8INxTnliZBOzLUfQKABzVnno6Ca
 ONzQ==
X-Gm-Message-State: AFqh2koa+GD+sxWY6ypjKaURSgmLO1lRpzOgPER3znidaQRBpkLYZ+dB
 QQnNV99u1FTB/5o97UQnlQ==
X-Google-Smtp-Source: AMrXdXuUxmFMe5f8pEIH/6rzb8K6cObPqDQgkF6n1oTIbC3iMUMSim9U1gouK8fOzAeh7+xNp7/TDQ==
X-Received: by 2002:a4a:8c32:0:b0:4f2:6891:7f76 with SMTP id
 u47-20020a4a8c32000000b004f268917f76mr1861329ooj.4.1673560327099; 
 Thu, 12 Jan 2023 13:52:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d144-20020a4a5296000000b004f269f9b8f3sm1349426oob.25.2023.01.12.13.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 13:52:03 -0800 (PST)
Received: (nullmailer pid 283232 invoked by uid 1000);
 Thu, 12 Jan 2023 21:52:02 -0000
Date: Thu, 12 Jan 2023 15:52:02 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: display/msm: add SoC-specific
 compats to qcom,mdp5.yaml
Message-ID: <20230112215202.GA281635-robh@kernel.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109050152.316606-3-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 07:01:50AM +0200, Dmitry Baryshkov wrote:
> Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
> distinguishing between various platforms. For msm8998 list
> qcom,msm8998-dpu rather than -mdp5 to allow this binding to be handled
> by either of the drivers.

8998 is where?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
>  .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index cbcbe8b47e9b..681d6ac48d33 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -16,7 +16,22 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: qcom,mdp5
> +    oneOf:
> +      - const: qcom,mdp5
> +        deprecated: true
> +      - items:
> +          - enum:
> +              - qcom,apq8084-mdp5
> +              - qcom,msm8916-mdp5
> +              - qcom,msm8917-mdp5
> +              - qcom,msm8953-mdp5
> +              - qcom,msm8974-mdp5
> +              - qcom,msm8976-mdp5
> +              - qcom,msm8994-mdp5
> +              - qcom,msm8996-mdp5
> +              - qcom,sdm630-mdp5
> +              - qcom,sdm660-mdp5
> +          - const: qcom,mdp5
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index 7479cd96fdec..7a81a10c0a9b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -88,7 +88,11 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: qcom,mdp5
> +        oneOf:
> +          - const: qcom,mdp5
> +          - items:
> +              - {}
> +              - const: qcom,mdp5
>  
>    "^dsi@[1-9a-f][0-9a-f]*$":
>      type: object
> -- 
> 2.39.0
> 
