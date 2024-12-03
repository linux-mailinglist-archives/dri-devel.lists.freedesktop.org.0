Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4FA9E1DF2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121B110E45B;
	Tue,  3 Dec 2024 13:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yj5hAAty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247C910E13B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:43:40 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso6519093e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233418; x=1733838218; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BexXqu1YANquKbhWrZTOr7m0R8hKt1AEONAGEhu8ML8=;
 b=Yj5hAAtyVtQ2f3UoILIMS42IOMZV+vm/V8tjosat+CANgf20GvmxdhmKNPVRcQHwta
 8paQdUWSkY0bvUNQhgiZUygC3KmDauXAnAVQCrtkjHQ3rjQMIdKjbtDYWFtxMOScbHFh
 /MWFsdV2pG9gMyWURY803NBBz+J1ga/g2YPDEbsBYftulen9hXtb+FEO3WSehx29pa3z
 zF22FoVl+9w+F0FdrcgPYi0ivq6cuFKBEI5TvQwPhN9ZH30b0Vd3cKI7Qd+Uvm8Lsh2A
 EaLAAmdqylSd3UhD2oHqtijDYP/5zFLY0BNJeN4NfLlMlpNXqEifV4En/yWo/xyVgRIG
 N5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233418; x=1733838218;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BexXqu1YANquKbhWrZTOr7m0R8hKt1AEONAGEhu8ML8=;
 b=JUMQfx782llFWl5HbcLcNFG3KoOb/RbXRnGGzf1+FRr6lImF4Ug8QQUoGTwC0KFmF5
 e+ZYMIXy1D0QNZxCbOJwikNUh87d1VL264U7NrHQyxDOxJTLHz395e9hv1V0e95At+G8
 MzoLQwzyu6AspB96eJho1yX20LG3rXKmziTd17xQh2FAi5272edsPfbDG0K8qTqZuqaa
 akX4zoz51sjIj6gi7fvHTaehvsmkbWicFk9W8Hyrg6XaQMXoCLhrqNTuBYiC9oLGS7eY
 kL4rH23QYMEhLOkg6QiMrodQPfTlsPIynmsAVup+8X+JuVRjzNFPi0WMtvw6+qLOawOZ
 xHyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEa7iga81ijro1rlO2UXzrOwhmiWI/2RKWqssyPT5DOhGKt9+9j45THkPOiAzMLwS26Cz0SkNqZAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxunugSk/LtzFdfGZgoHkZbFbpPb8mXOuC0pP/biJASSg6vt3vQ
 Z7mHg0pvmK9cH11o6+6K9leUzTTlW+o62Ya7nA4ad0FZAzaYckHCc80MI4Y6aNc=
X-Gm-Gg: ASbGncu7fWl0K0Y14YOshvBviOezhX7DJxpei85uQJC4ZgSKLOAAO9d5Hh5mSDRlp8L
 vvUvDMgHqfnGKvTiNNvcIqTngYji1ThONypIrxRfkdnBHPMdES+6rnOAFTbc2Kj/d29cLobtCqm
 fyQi/+XLYliOJiTTZm+tgnO9xhFzJIw3vM3ZpV9FfHeaH/dDWOKIu3LhCpd+k1JzgFk2IegfwNT
 B1Dl5L0Fl4BV0BCTwgWuPirS9MU9ghGxi5gzu2hI6zBpn477UJI/FWy9f5nynvdRKX42dnfe3c5
 P7vk3rjm1pLm7WqJuNGNsLYhPA1L6g==
X-Google-Smtp-Source: AGHT+IE8R6jm4cCT/ek6WXdRlNZG6O64AcF1SkyDRfFBDn4mzR/uUulOEMTuStC5oxV2xJ+QqSD9DQ==
X-Received: by 2002:a05:6512:12cd:b0:53d:ea1d:50fc with SMTP id
 2adb3069b0e04-53e12a28351mr1659356e87.48.1733233418239; 
 Tue, 03 Dec 2024 05:43:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1394662fsm197862e87.38.2024.12.03.05.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:43:37 -0800 (PST)
Date: Tue, 3 Dec 2024 15:43:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
Message-ID: <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2024 at 07:31:41PM -0800, Abhinav Kumar wrote:
> On some chipsets the display port controller can support more
> than one pixel stream (multi-stream transport). To support MST
> on such chipsets, add the binding for stream 1 pixel clock for
> display port controller. Since this mode is not supported on all
> chipsets, add exception rules and min/max items to clearly mark
> which chipsets support only SST mode (single stream) and which ones
> support MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9fe2bf0484d8..650d19e58277 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -50,30 +50,38 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
>        - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
>  
>    assigned-clocks:
> +    minItems: 2
>      items:
>        - description: link clock source
>        - description: stream 0 pixel clock source
> +      - description: stream 1 pixel clock source
>  
>    assigned-clock-parents:
> +    minItems: 2
>      items:
>        - description: Link clock PLL output provided by PHY block
>        - description: Stream 0 pixel clock PLL output provided by PHY block
> +      - description: Stream 1 pixel clock PLL output provided by PHY block
>  
>    phys:
>      maxItems: 1
> @@ -175,6 +183,30 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-dp

Why do you need an extra platform conditional?

> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: core_iface
> +            - const: core_aux
> +            - const: ctrl_link
> +            - const: ctrl_link_iface
> +            - const: stream_pixel
> +            - const: stream_1_pixel
> +        assigned-clocks:
> +          maxItems: 3
> +        assigned-clock-parents:
> +          maxItems: 3
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index 58f8a01f29c7..7f10e6ad8f63 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -177,16 +177,19 @@ examples:
>                       <&dispcc_dptx0_aux_clk>,
>                       <&dispcc_dptx0_link_clk>,
>                       <&dispcc_dptx0_link_intf_clk>,
> -                     <&dispcc_dptx0_pixel0_clk>;
> +                     <&dispcc_dptx0_pixel0_clk>,
> +                     <&dispcc_dptx0_pixel1_clk>;
>              clock-names = "core_iface",
>                            "core_aux",
>                            "ctrl_link",
>                            "ctrl_link_iface",
> -                          "stream_pixel";
> +                          "stream_pixel",
> +                          "stream_1_pixel";
>  
>              assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> +                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
>                                <&dispcc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
> +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>, <&mdss0_edp_phy 1>;
>  
>              phys = <&mdss0_edp_phy>;
>              phy-names = "dp";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
