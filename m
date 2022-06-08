Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45F543088
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F93810E660;
	Wed,  8 Jun 2022 12:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D6D10E660
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:37:45 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gl15so27331843ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H0WIvtDK8p0hub9/Szus7esLARC3UMiO3VioApHUPBY=;
 b=Tsg1x0Q8gQ3BwxdDKxr3GztlxX4tjBiwzsVdK/a8gxfowQSkHgSZ8zcX0TpFfNRidL
 Srb+CtQa6fOlcNTwnam9zdq22zbwYe0P046H0hS5F+qvQNjoTBe11Hs29KrKR/npMjtl
 aqy20peak7dBdXuXTvUODVZI2rhuhgApqEtHi3M37GUaDppZaxRrQYO/o+QnrEQD+W9i
 3s95MzkblBaQ99c+Lm937NU/9RjX5gaiJWh14VA+NP1sLlLI2nRJbi4c8nln+9YEXzmz
 93l1W1tv+z9yU/XV7Yo2kqFxQHqLcuH1Fg/2d8ltZCJg22FG4R8aaHFQ8qS0NMPIiI/E
 MoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H0WIvtDK8p0hub9/Szus7esLARC3UMiO3VioApHUPBY=;
 b=7KTyL/HyA/zNsOlPvjySMOEny1SUMXCyDn/sipJs+Xf8Y13oJtRlPVsZK72evf/9sF
 In0CaZd52/6e/OlTpdO2S0hwdcEIuswFwzTz9WFUrYKJD9OAhmqz7xl2MdpulGyBu2zs
 rFj69uEp7YmGRCb/4ptHL1ABjXF2ynvpJPc7sAljyN/mpDM6GJb42H+KzT22pZK8LFgQ
 1tWcBJVQtbiP9puvT4uimV/ZNnwDZhODwg2/9QXOzUFWv7WbqH0epZNs7+4c0iGsiEo8
 RTZJ9url+5qIU8xVzgnFJPHKs2QvjvtjJA+EfPYVRK+jZ9KDxvWm34wIgluG9qC/kaR6
 Nk9w==
X-Gm-Message-State: AOAM533zsd0dHlR2cd6W+gpeOrXiOjTe3Qo/Fm8KQH50I0/PdIrlNmsc
 /CfHjCPoxy3uXCnmZMc16MC0dQ==
X-Google-Smtp-Source: ABdhPJy0CWdqL36Ktq7laF+3NF2aMLunQqcEfbts6nMe4AvWKnaPdOnxG/P/zeEoYq1eMlQKYpwQeQ==
X-Received: by 2002:a17:907:6286:b0:6da:6e24:5e43 with SMTP id
 nd6-20020a170907628600b006da6e245e43mr31108018ejc.449.1654691864091; 
 Wed, 08 Jun 2022 05:37:44 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w2-20020a056402268200b0042ddd08d5f8sm12908878edd.2.2022.06.08.05.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 05:37:43 -0700 (PDT)
Message-ID: <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
Date: Wed, 8 Jun 2022 14:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/12] dt-bindings: display/msm: hdmi: split and
 convert to yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
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

On 08/06/2022 14:07, Dmitry Baryshkov wrote:
> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
> 
> Changes to schema:
> HDMI:
>  - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>  - dropped qcom,tx-ddc-* from example, they were not documented
> 
> PHY:
>  - moved into phy/ directory
>  - split into QMP and non-QMP PHY schemas
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>

David also needs to SoB here.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

(...)

> +$id: http://devicetree.org/schemas/display/msm/hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Adreno/Snapdragon HDMI output
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hdmi-tx-8084
> +      - qcom,hdmi-tx-8660
> +      - qcom,hdmi-tx-8960
> +      - qcom,hdmi-tx-8974
> +      - qcom,hdmi-tx-8994
> +      - qcom,hdmi-tx-8996
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: core_physical
> +      - const: qfprom_physical
> +      - const: hdcp_physical
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    enum:
> +      - hdmi_phy
> +      - hdmi-phy

I did not notice your question on v1. I see now two DTS files using two
different names... yeah, let's mark it deprecated and remove entirely
from DTS. Let's hope DTS does not have other users than Linux kernel. :)

> +
> +  core-vdda-supply:
> +    description: phandle to VDDA supply regulator
> +
> +  hdmi-mux-supply:
> +    description: phandle to mux regulator
> +
> +  core-vcc-supply:
> +    description: phandle to VCC supply regulator
> +

(...)

> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hdmi-phy-8660
> +      - qcom,hdmi-phy-8960
> +      - qcom,hdmi-phy-8974
> +      - qcom,hdmi-phy-8084
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: hdmi_phy
> +      - const: hdmi_pll
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  core-vdda-supply:
> +    description: phandle to VDDA supply regulator

Blank line

> +  vddio-supply:
> +    description: phandle to VDD I/O supply regulator
> +


Best regards,
Krzysztof
