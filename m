Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEDA58F8A7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 09:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3497612B8DE;
	Thu, 11 Aug 2022 07:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C607F10F3A5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 07:56:09 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id x10so916099ljq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=HGD+mIOoUzZZibF46I+q3hJDknL0evsBnB4j8896RDE=;
 b=w2Ve8pp7kpZ5uxP6kONzTfBLYo+GLlwLTI7YboNcnwSUyzMvCwh29zN6fAO49uGDiN
 2VkGvu5lb5NoOGvCo9WLrxVNL2kkhkZIqJy4urwI/xgg+7eImhMqGsWALOoMnzCuQr5a
 bKphNe9iQ97fbwjNLqIGNqLFqimYiYA4/dLFxdeNGB77EkbPI0c/rV9Hivs6Z4wDlomk
 mQ/HBLn/W6xohgtVK02g79ptUnDbrLrzhBlbmIFRD9MiGsm31GZQ1IOFu1mw95/Nafxo
 H+2XTOYXnTJd9XCIgwRairgOHXj4qxGE/iMLiBsmwycAmo1lOFjZ/OQyThUyS/wqO6Gi
 L1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=HGD+mIOoUzZZibF46I+q3hJDknL0evsBnB4j8896RDE=;
 b=7V1ZDO+SumGw1gCiTVNirxx3ivUlI8bt7qdj9/K4zVBnecqwUxP1Z/QSZIhW0stRQQ
 RqNlKvjSMXRxWrMquYf3Ctz3DScoFjoWSrzCN8ATuVbfE5chihX8f6X7ng9l/DREtqaK
 +Fepa5UhN+hM80sf6cRj3m5uoKYwr/K3lJOzAuL+vWW88vDpViDZZLWn5EleReyhmYZF
 ydl5gmnGUtjfmc2savM7IuybgsmmGKNlJpZ23iXJoLsuT1UhHBJRBLym9H8zdKFP5HXl
 qPra8+TF/myKno4yhq+QPuxqe6kZ4c3CE9MpEsv9SxOAtpXxGTju908g9GiRsonQFIwa
 /YHQ==
X-Gm-Message-State: ACgBeo2sz0IrSIJVCYnTvyyKdbn/rVXnLEKhbbhABWiUMD8xUPI6saG2
 p3fvqgLvvQZq8oi6l9ajhuH8fw==
X-Google-Smtp-Source: AA6agR4c8fIm9+sSNAAoQ/CG7qvl6RSg1/y9svFJ1Yzku00jo7ICQImd2/4B1MH6UMreW6bzwNBm1A==
X-Received: by 2002:a05:651c:241:b0:25e:65bd:3a8a with SMTP id
 x1-20020a05651c024100b0025e65bd3a8amr10308517ljn.206.1660204567994; 
 Thu, 11 Aug 2022 00:56:07 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a056512398200b0048b008844b8sm607407lfu.270.2022.08.11.00.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 00:56:07 -0700 (PDT)
Message-ID: <db9b74f9-1f65-5b88-1c81-0a3fd6dcf9a6@linaro.org>
Date: Thu, 11 Aug 2022 10:56:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: display/msm: Add binding for SC8280XP
 MDSS
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-2-bjorn.andersson@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811040121.3775613-2-bjorn.andersson@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08/2022 07:01, Bjorn Andersson wrote:
> Add binding for the display subsystem and display processing unit in the
> Qualcomm SC8280XP platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc8280xp.yaml    | 284 ++++++++++++++++++
>  1 file changed, 284 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> new file mode 100644
> index 000000000000..6c25943e639c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml

qcom prefix is needed (also when file is in msm subdir)

The file name should be based on compatible, so "qcom,sc8280xp-mdss.yaml"

> @@ -0,0 +1,284 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc8280xp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Processing Unit for SC8280XP
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for SC8280XP.

s/Device tree bindings//
so just:

SC8280XP MSM Mobile Display Subsystem (MDSS) that encapsulates
sub-blocks like DPU display controller, DSI and DP interfaces etc.

> +
> +properties:
> +  compatible:
> +    const: qcom,sc8280xp-mdss
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss

You do not need reg names for one item, especially if the name is kind
of obvious... unless you re-use existing driver which needs it? Then
maybe let's change the driver to take first element?

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AHB clock from dispcc
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ahb
> +      - const: core
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true

I see other DPU bindings also specify both as "true". Why not a fixed
number (const)?

> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +
> +  ranges: true
> +
> +  interconnects:
> +    minItems: 2

No need for minItems in such case.

> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.

additionalProperties:false on this level

which will point to missing properties (e.g. opp-table)

> +
> +    properties:
> +      compatible:
> +        const: qcom,sc8280xp-dpu
> +


Best regards,
Krzysztof
