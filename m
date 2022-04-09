Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA554FA090
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 02:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D757B10F24F;
	Sat,  9 Apr 2022 00:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109CE10F24F
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 00:18:59 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id x5so8732739qvk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 17:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LrNVvLpOj6dTmwk7aa8KUTu0jhCOqauaVgReZqBa7c=;
 b=xE0tX7NtCkWLvBMwhqajK3qfCfoNEpWFKuP2acf2SlDT23Qqs0ecoD80HseySZgDsF
 WKCXbRoEzgKZXIs+RWz7X5ab107GjaBlxA1ptNfo68jBnFEbdSt0OAxsqV5vWKZbdbVy
 ExcYExo1BlK8zkkHupU0MlYVAQVBsW9LxraTaHQ94tdbP057gScytmZB/f2fDvXBI5y9
 rKI7/OlSwwcmCMSe9L+IklhhYjR+N1b5HHDd7KkRmQnU3nlf4MnwgQmrx7tZBCgd58o6
 HTb1hxQkkAcON4uoLJ9N4IgxzSnvvz/MB+tygzfFwbaDbjpvnxnOwiIChZd6mtxyL+WS
 KGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LrNVvLpOj6dTmwk7aa8KUTu0jhCOqauaVgReZqBa7c=;
 b=pPKGOYFZNYqjBRnvui7W6RlZ3Kf/yvyO2ZzhEAnvyOAA8EWDtDCSVuEN49Aa/8ovzW
 vEz9ySCnxts19nmAuwzYvzqSQrGyL65y1YP2HI/hsa2sxW3ugX6lxr+xU7QJj33bUZQJ
 K9vakz8NxLdem0c39kvcWUJuFdtVPxRKj7QbICFBhzA6fMQa5IJ1v5q23zFHbzyN+5uk
 B1ckbk95KQdaz4WQeZFCoA7K/K0jJbrjEB/nGXLutYEX7T/XDQ/0ey1C2eqmOvtBwtJl
 FaldnshAPcUZQDzwiTnKK863EJj3HrkcQF26t/WFXAChbZ/vanA4SaM3Zj+a69+Djtft
 ZXiA==
X-Gm-Message-State: AOAM5304uBUGFkt5VVdNKe5R3JMr3HKwSAqjAM9EBdPPTNxM4vBNKc39
 75tq+cU8j3K3MKv67jCHmLBgNcrq9t+Ve465Ik0kJA==
X-Google-Smtp-Source: ABdhPJzyS2BKDeVIYsYws7rF8u0vK8mefrCUH0O7J9tqRAkVK9AS1lptIkXtSiP4qBJZJpVRd03iCrSudeAaaxy+1Ns=
X-Received: by 2002:ad4:4eaf:0:b0:441:7ff6:f639 with SMTP id
 ed15-20020ad44eaf000000b004417ff6f639mr18482856qvb.73.1649463538218; Fri, 08
 Apr 2022 17:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220408210813.581391-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220408210813.581391-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Apr 2022 03:18:47 +0300
Message-ID: <CAA8EJprtAubOe==dND9ru2ws71cGXt=B4vB5Hm8ZcZuQ5h9qLA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: msm: Add optional resets
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Apr 2022 at 00:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> Add an optional reference to the MDSS_CORE reset, which when specified
> can be used by the implementation to reset the hardware blocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>
> Resending these two patches again as I put "v2" in the subject, even though I
> meant v3. Sorry about that.
>
> Changes since v2:
> - None
>
>  .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
>  4 files changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index 6fb7e321f011..734d14de966d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -66,6 +66,10 @@ properties:
>    interconnect-names:
>      const: mdp0-mem
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> index 12a86b1ec1bc..b41991eaa454 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -65,6 +65,10 @@ properties:
>    interconnect-names:
>      const: mdp0-mem
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> index fbeb931a026e..6e417d06fc79 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> @@ -64,6 +64,10 @@ properties:
>    interconnect-names:
>      const: mdp0-mem
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index 0dca4b3d66e4..1a42491efdbc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -57,6 +57,10 @@ properties:
>
>    ranges: true
>
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
>  patternProperties:
>    "^display-controller@[0-9a-f]+$":
>      type: object
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
