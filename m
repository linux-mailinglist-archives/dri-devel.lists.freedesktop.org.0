Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E163166E5A2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CFE10E5A1;
	Tue, 17 Jan 2023 18:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E3C10E5A1;
 Tue, 17 Jan 2023 18:09:08 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-12c8312131fso32861195fac.4; 
 Tue, 17 Jan 2023 10:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gqw/5tUVUFWZUJ3ijOC+BanMFqqlxId5Bt34OdwKlMQ=;
 b=YLree8UmZZxlffbcA6i+UXtYq2wMp5gWJwsx6HkqnfI0wGPqR57JJglsm8yUF8LE7j
 4uZQxEd5Igk1TU1eJZ3q3JFvrI5cBopr1eFi/pfgXz8bHeswo855GUhXfV6uv2c5ltLT
 TQfukpWDb7ZFVymo20uLszUUmeRXEI0nIGQ9QjdQIP69OK2bNY58F3V9BUdNDMHOX+WN
 GaCup30o2IxABXjb2oy0z7v/RYK0VbnbS4qCTGf/2167dtSu8hRMRuouiwtk97/dFiSy
 ipHsbjq50pBhicxQh78rhIAnd6zxRWGlCC+HddtAJ9rXEox8ckVPu4y5wp2hKlsyUv6F
 5L5g==
X-Gm-Message-State: AFqh2kqYtznKSiegWCDdg0mXXgFbDqNZFEcbOvNkN5owWfbMkcStQmqZ
 ebnXyC76qnAe6ntk0WY7PQ==
X-Google-Smtp-Source: AMrXdXuqGyaQl2dDRHMGbKH9ekCkyJwxw4SbKZJTVVpjrracMtDL8+Zi/hTfaSz0T6DO+ODf/DkwVg==
X-Received: by 2002:a05:6870:2f02:b0:155:a38f:70d1 with SMTP id
 qj2-20020a0568702f0200b00155a38f70d1mr2118087oab.18.1673978947062; 
 Tue, 17 Jan 2023 10:09:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q18-20020a056870329200b00155ffbdbaffsm16922521oac.18.2023.01.17.10.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:09:06 -0800 (PST)
Received: (nullmailer pid 3352727 invoked by uid 1000);
 Tue, 17 Jan 2023 18:09:05 -0000
Date: Tue, 17 Jan 2023 12:09:05 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 03/11] dt-bindings: display/msm: add core clock to the
 mdss bindings
Message-ID: <20230117180905.GA3329090-robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-4-dmitry.baryshkov@linaro.org>
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

On Fri, Jan 13, 2023 at 10:37:12AM +0200, Dmitry Baryshkov wrote:
> Add (optional) core clock to the mdss bindings to let the MDSS driver
> access harware registers before MDP driver probes.

typo

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index dcde34ffc8d0..6948ae3ac7bc 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -45,17 +45,11 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    items:
> -      - description: Display abh clock
> -      - description: Display axi clock
> -      - description: Display vsync clock
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 1
> -    items:
> -      - const: iface
> -      - const: bus
> -      - const: vsync
> +    maxItems: 4
>  
>    "#address-cells":
>      const: 1
> @@ -69,6 +63,30 @@ properties:
>      items:
>        - description: MDSS_CORE reset
>  
> +oneOf:

This is not based on compatible? If not rather than at the top level, 
you can do 'oneOf' under 'clocks' and 'clock-names'.

> +  - properties:
> +      clocks:
> +        minItems: 3
> +        maxItems: 4
> +
> +      clock-names:
> +        minItems: 3
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: vsync
> +          - const: core
> +  - properties:
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - const: iface
> +          - const: core
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.39.0
> 
