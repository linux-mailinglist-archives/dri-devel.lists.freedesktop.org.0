Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863466E595
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4ED10E59B;
	Tue, 17 Jan 2023 18:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D4910E59B;
 Tue, 17 Jan 2023 18:05:48 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 k44-20020a9d19af000000b00683e176ab01so18277759otk.13; 
 Tue, 17 Jan 2023 10:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PM98rtw7LbzsvTCif2C+5NEYIZSk3KLr63ivyr75RYs=;
 b=UtqhCwSROXrCAAPKBn3oePzlmPwbpBKiifiIvClW/8eDbzAYk/VXtErl+uv+2nY+ho
 v748YcpQ9EseFl7InttmoWkFr8aTG4s3EQdUo3emmzXHZQuFPBOw+IIPtN5XGt+NPoY8
 nwHgJmi85/Nl3Avp+RuHnPo8fzBg0L8m5O19eoBmKIHCVTEr9WL0vA0WYjPiuiSn9TID
 0Ia7EJq5hn1Te2gbzAAaqZ4rg6TN6lMPYYUBU9xV1lfoSc8MRflipWxuh5SbYAtQAewI
 7zhImkeZllu5Ah0w7rah2tndEDjG2I6C9/W0XhqRIQXdSFSGJbBcfjGG8gs96M8Z3+eA
 2kzA==
X-Gm-Message-State: AFqh2kqEoREWsqc4SsoY1ivhxiqL8TiajJSuZxyHuDeg63L6NfUh9/Zf
 +a6VORHBb14ZZqfbQmcNqg==
X-Google-Smtp-Source: AMrXdXsPrNCO64CoqtqVoJIgO/1bF3oVZOIa0uU6FJXT3ezisRO3DooZ35OaZk84rtCZ7k9My/qgow==
X-Received: by 2002:a9d:624a:0:b0:66d:a5f7:9adc with SMTP id
 i10-20020a9d624a000000b0066da5f79adcmr2638708otk.2.1673978747227; 
 Tue, 17 Jan 2023 10:05:47 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t11-20020a9d590b000000b00677714a440fsm16777969oth.81.2023.01.17.10.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:05:46 -0800 (PST)
Received: (nullmailer pid 3328585 invoked by uid 1000);
 Tue, 17 Jan 2023 18:05:46 -0000
Date: Tue, 17 Jan 2023 12:05:46 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 02/11] dt-bindings: display/msm: add SoC-specific
 compats to qcom,mdp5.yaml
Message-ID: <20230117180546.GA3323490-robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-3-dmitry.baryshkov@linaro.org>
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

On Fri, Jan 13, 2023 at 10:37:11AM +0200, Dmitry Baryshkov wrote:
> Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
> distinguishing between various platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
>  .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index 5e3cd7abf046..cb7bf48c3a58 100644
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
> index ba0460268731..dcde34ffc8d0 100644
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

Just 'contains' is sufficient for all this. The exact length and order 
will be checked by qcom,mdp5.yaml. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
