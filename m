Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC43542A5A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DC410E0A2;
	Wed,  8 Jun 2022 09:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A754110E149
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:05:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w27so26127486edl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oiAKojnSb91/fs9PbBc2BR8fQQ+2pgjjbaqdMMi6Ld0=;
 b=iR8SBG8llqld/s9wiSkQcvkD5SyH+0lxEupixJwq/BcjKOMCXVBNd3hXbWO/YaHTOM
 paTtgKf2qAwV140JUSvJP3aItVayrqwIahefBZVHlo01Y7sgOdMTOMaRrhaOArLXZDMD
 tdRyAxv3IHihl+A1mOzpRv9vE9xkdidbHad5YfE0mHNyWWTewseGB//634ZxSlY49cSI
 MaQ6lfEVCdTgzvQQO44fyhTeFPzslfQcvaOWYKXlSt3uuWoXl9pU7ZDRb4EHPMsRlKjc
 6hHDdhhR05SjWAzKg8JdiuUhuQT+C9kmTSiPm8/ugSJYS00Ms/FRUdrNBSE6LEzLnLao
 njcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oiAKojnSb91/fs9PbBc2BR8fQQ+2pgjjbaqdMMi6Ld0=;
 b=kt5GesVe3GE2YZhypXleQJx+fHp4e88UKTnC2JCfESWVV29eJ9zifyar0aXm/QpnTO
 lVA7Pon31vMHz3LEo9Lg4awJ3AhrFEUQyeWYNZ2aB/NM1j3B5g8hM/e58Np+NmZnzVBH
 T2cjiTc1ydfQFKh6GHtn6bs9dyxOHOi9sdL33Nn/kel9lEbIOcQugJJfF1Iku3+quYC5
 MX7LzAUpLPnVPpUQcu4gVYQBQTLdyrLxjOrydXwFQ7vPEjO1r10IL2P/vIkzl5GNih3D
 dP82AeaF2a9fmToMjAwcPMCHTlKoH7R5oNJYrZ/t/FWNkBQDHXHD/unZ5wRcxRh52pd4
 RnRA==
X-Gm-Message-State: AOAM532SDv904G+JyGbKAMCOPncFH0lHDw65V54ZyQUPGQCxkyR+8D49
 I495s4huEQb0S3EPoAjbqT56IA==
X-Google-Smtp-Source: ABdhPJyckb8xscBNTOvpq4Q37RPBgb7rImH1MWN1fFRpLJNZ8145876OyuEylO5gyszpaBgghwXnrg==
X-Received: by 2002:a05:6402:2750:b0:42e:3d52:d270 with SMTP id
 z16-20020a056402275000b0042e3d52d270mr30814728edd.332.1654679115174; 
 Wed, 08 Jun 2022 02:05:15 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g22-20020aa7c596000000b0042deea0e961sm11689352edq.67.2022.06.08.02.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:05:14 -0700 (PDT)
Message-ID: <c431b51a-f68f-8608-5d5d-6dac85e2be4f@linaro.org>
Date: Wed, 8 Jun 2022 11:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/7] dt-bindings: display/msm: hdmi: mark old GPIO
 properties as deprecated
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
 <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2022 20:58, Dmitry Baryshkov wrote:
> Mark obsolete GPIO properties as deprecated. They are not used by
> existing device trees. While we are at it, also drop them from the
> schema example.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,hdmi.yaml         | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> index 2f485b5d1c5d..2b1cac0851ce 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> @@ -59,22 +59,27 @@ properties:
>  
>    qcom,hdmi-tx-ddc-clk-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI DDC clock
>  
>    qcom,hdmi-tx-ddc-data-gpios:
>      maxItems: 1
> +    deprecated: true

This is confusing. These two are not defined in the old bindings, not
used by DTS, not used by Linux implementation - why did you add them?

>      description: HDMI DDC data
>  
>    qcom,hdmi-tx-mux-en-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI mux enable pin
>  
>    qcom,hdmi-tx-mux-sel-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI mux select pin
>  
>    qcom,hdmi-tx-mux-lpm-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI mux lpm pin
>  
>    '#sound-dai-cells':
> @@ -171,8 +176,6 @@ examples:
>            <&clk 61>,
>            <&clk 72>,
>            <&clk 98>;
> -      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
> -      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
>        hpd-gpios = <&msmgpio 72 0>;
>        core-vdda-supply = <&pm8921_hdmi_mvs>;
>        hdmi-mux-supply = <&ext_3p3v>;


Best regards,
Krzysztof
