Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBBD5B0D77
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 21:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B8B10E85B;
	Wed,  7 Sep 2022 19:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE49C10E85B;
 Wed,  7 Sep 2022 19:51:17 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so10954633otq.11; 
 Wed, 07 Sep 2022 12:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2tHJcPRMA/L2h1yHgmybl9yCk/t2j3caUqHniiiqs5g=;
 b=tQmf2Wm7eEvkGZl4VmHMA3AHBV1WUY2x0lJKcf8tybjV8tn9hZuET53vfmHCQigxZz
 G3P3B2rel7a6ug3iz2PIXFNiA/dqRHc1M6pAlv7Hs6VVFd3cXv8s1f5Rt2YJLpf1kx4G
 sD8AxutBdVk/lNuUAewHiDFNtxq4PdboJpZO4jIwuK22pQblIxLdU4jPpEeQIc/tl8lP
 taJoy2z1jsZuDI3XuUXRCA2sFyqD7o9Hi/r+23RmKqtYQy2fFu1SXcS5qNm27HYEggqp
 hYQvtk4/NC5WpYRP4f8uZY7tgyTAPAkJtWQPqHGRzC9kX8PUsQ0a5I2iPOX7vUOdVau4
 0h5g==
X-Gm-Message-State: ACgBeo01xPpUvmbj/Fxa9Pyb3vL1g/G2Q/YyMXCLDyOg6m453xEw6JWc
 rbWxo+kzptMjAQWVrp5U0Q==
X-Google-Smtp-Source: AA6agR4B3Klfz1/Zi+H/2ENUSQEKObGDWqwgJE6mFKnC0VsBTUhSNMz2KGmwSJU3J2PLUUUTVL2hLA==
X-Received: by 2002:a9d:4814:0:b0:639:2e6c:d86e with SMTP id
 c20-20020a9d4814000000b006392e6cd86emr2184065otf.320.1662580277060; 
 Wed, 07 Sep 2022 12:51:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p66-20020aca4245000000b003451c927e0dsm6801928oia.38.2022.09.07.12.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 12:51:16 -0700 (PDT)
Received: (nullmailer pid 98144 invoked by uid 1000);
 Wed, 07 Sep 2022 19:51:15 -0000
Date: Wed, 7 Sep 2022 14:51:15 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
Message-ID: <20220907195115.GA96580-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 01:23:03PM +0300, Dmitry Baryshkov wrote:
> Add interconnects required for the SDM845 MDSS device tree node. This
> change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> Add interconnects property for display"), but was not reflected in the
> schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index 3cb2ae336996..ff19555d04e2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -57,6 +57,16 @@ properties:
>  
>    ranges: true
>  
> +  interconnects:
> +    items:
> +      - description: Interconnect path specifying the port ids for data bus
> +      - description: Interconnect path specifying the port ids for data bus

The same description twice is not useful.

> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +
>    resets:
>      items:
>        - description: MDSS_CORE reset
> -- 
> 2.35.1
> 
> 
