Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD21617E55
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8649310E5E2;
	Thu,  3 Nov 2022 13:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EB310E5DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:47:46 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id o8so1121193qvw.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 06:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2Nr5wIdGbAWm3WH/I4UVUKpbhCh82dprUQ26IZeMhc=;
 b=qPv7iGDsarIyeVkPtASpJ9T0zxFA9vMYe5noup38EWHE174XLESSO8pOb+cAor4t9T
 ohhqAr79b6QEkwtwsx1unZIDNieHhMgFD9w9spQ4q/VBD5K4xYW68UL2J9qaz1sr6Qt9
 azDBNxlr5M/IQ4Ff9DHEhfwoCRVapzw1g0YsApKJoFs0cSqXJ2Q7SHX/X0YoeZbRbzOx
 BymutPAUVmDMaT8ZbF4AFM7Ajszy/g2+5VFI3IeKTLVfTKsjqPpXt6WrbOUBszbc7IAe
 /5k9YdNLB5XOFmjitCa51wUbm3bUWV+u5wZwSVmsl8M9vNCHMCGUzZFSZWkv8rLhmt9H
 ye/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2Nr5wIdGbAWm3WH/I4UVUKpbhCh82dprUQ26IZeMhc=;
 b=32k3aZH9exZfjHCRPs0qml2DTPoWKtpClxFs/XEEwnqyM2hfsFHsxCor6xrRsh1Dxh
 MV/ZYp690VA0tgUG0tpYw7V2HqdR3T3mG1rxtc08NUoDAgD7QwIFNJb6XATnLQscnWXh
 sUlJ5Tbs4kg6M3ohT8tmDdV4gaZxL/iKFCBwIwetaTgI+tznai7tO3TL3hxTErYXqRdw
 pp66cuHc3rm1GfmT8LIgVLXdd4I2VyNtNOsXLzFO3Gpoe9eI5WVe52P3q7tKLOZLOIUU
 B4ckqFujDXMugkbE82COn7UEu31ULTofCnud4KWlFNr7utSbiNeV33TyGNytK0NYrNxj
 isYA==
X-Gm-Message-State: ACrzQf0O8NfuNqX/m6RTlQwD8d0U/D0F4ewCNO29Mk3oB503bRF4VMKK
 ptNG7nFmIyOR1WnUgU2QNKMwcA==
X-Google-Smtp-Source: AMsMyM4EEMjML/TvKjG45RThBKF8f13QmyxMU3XEC+DuAu8ouWpZko/uukZBffWcUYkLAXPI5btEJw==
X-Received: by 2002:a05:6214:20aa:b0:4bb:7e1a:9df0 with SMTP id
 10-20020a05621420aa00b004bb7e1a9df0mr26673735qvd.34.1667483265779; 
 Thu, 03 Nov 2022 06:47:45 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a05620a449100b006fa31bf2f3dsm802424qkp.47.2022.11.03.06.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 06:47:45 -0700 (PDT)
Message-ID: <07fca6e0-994f-ed08-632c-dd26bc7086b8@linaro.org>
Date: Thu, 3 Nov 2022 09:47:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RESEND PATCH v1] dt-bindings: display/msm: convert MDP5 schema
 to YAML format
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102220844.569977-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102220844.569977-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2022 18:08, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 

Thank you for your patch. There is something to discuss/improve.

> +
> +  clock-names:
> +    oneOf:
> +      - minItems: 4
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: vsync
> +          - const: lut
> +          - const: tbu
> +          - const: tbu_rt
> +        #MSM8996 has additional iommu clock
> +      - items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: iommu
> +          - const: vsync
> +
> +  interconnects:
> +    minItems: 1
> +    items:
> +      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
> +      - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from rotator port to the data bus
> +
> +  interconnect-names:
> +    minItems: 1
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: rotator-mem
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc.

You could include here information about number of ports per variant.

> +
> +    patternProperties:
> +      "^port@[0-9a-f]+$":

[0-3]

> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +    # at least one port is required
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdp@1a01000 {

display-controller@......

> +        compatible = "qcom,mdp5";
> +        reg = <0x1a01000 0x90000>;
> +        reg-names = "mdp_phys";
> +

Best regards,
Krzysztof

