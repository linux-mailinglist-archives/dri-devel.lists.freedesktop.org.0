Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FEC6638B7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 06:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240CD10E532;
	Tue, 10 Jan 2023 05:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0CA10E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 05:47:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id cf42so16657274lfb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 21:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sjlcbVEgS5pgrAjtiDRiz81od9MScN0SBmwZV8y/lIs=;
 b=SrXc9fMrzGJBPKtaDr9H/2PtiGIoWp7vzGiZa3QXIVOzdnPNHj+Gg3cJhcKmPhWPGk
 zFF5piQbTPqBRWYVrybTXvmOygaq6XMEUqck6aapxH45bbqyIEoN15UpW4iyFXs1fJe9
 juKrr+tPimFaqDGwJmbMHXl/vMM6U8WwtkI/iO+tsqtoYPuFKE7dvrfIZyGL6Ds9cr1T
 WLCdsk1LfMuAZQNXx7QO315gx6CHEvWsILN9xy7iy3f4eH78fjmIjx2jVvZSQar7BF9l
 deIcihzYmhuV+Q8My/N/kxKeCBKV84kSTuLWUIykCl8DR42FimSk8U/R/z28AhyJt5MP
 MZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sjlcbVEgS5pgrAjtiDRiz81od9MScN0SBmwZV8y/lIs=;
 b=jNhOlF5AeWDm36w5Np9o/hfi6ZRAvG2qiwpUYkwujkBljELKiNU23NTofzL/dbTwoE
 micDYgo/yoQ/7YYuaA0leWclYAhKiVz2n3uBSivv8CdTm9Eus115gPhN/pfUZYtrMFeS
 nsNE6GCv+x4aEcqOA3sBjdn8vDX2feY3NdaBdovxI5pfJWUOsKwZH5nRr5cCCQJ2Lwat
 t6Sv+UTf4nqRmgj3jt8agTlXYg2LWwxL2L8heUdnOWtuUuAb1hT4Glhme+kOo86F0cnl
 xDcJurGDlK8j+d7KZR7rfmpkRaLFEVwRHdvfTudbbKzqjEiVMtEU6j/Po/0/i/ul8WXF
 csHw==
X-Gm-Message-State: AFqh2koPhrOG9VcZZ04hDeaBzdKZKk3ADbiuCu54casQb+Fgti/CS+Pw
 jG4LSMR7IwKnXuLAAFmtURhsiw==
X-Google-Smtp-Source: AMrXdXuwuTdxaEcEUK1aqTKbAxOoMfEtFDgOViKB9zqN6QGZvAv1BcY7LatZ/ouCEGtzFXpln7UQBw==
X-Received: by 2002:a05:6512:6d6:b0:4a4:68b9:609b with SMTP id
 u22-20020a05651206d600b004a468b9609bmr22353836lff.38.1673329650416; 
 Mon, 09 Jan 2023 21:47:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 cf33-20020a056512282100b004a05767bc07sm2006201lfb.28.2023.01.09.21.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 21:47:29 -0800 (PST)
Message-ID: <fc525e85-c271-3912-f19b-25a9e90dc2a9@linaro.org>
Date: Tue, 10 Jan 2023 07:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 05/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
 <20221223021025.1646636-6-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221223021025.1646636-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/12/2022 04:10, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 209 ++++++++++++++++--
>   1 file changed, 192 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 98d54a7ee28d4..4b79b31123515 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
>   maintainers:
>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>   
> -allOf:
> -  - $ref: "../dsi-controller.yaml#"
> -
>   properties:
>     compatible:
>       oneOf:
> @@ -46,22 +43,23 @@ properties:
>       maxItems: 1
>   
>     clocks:
> -    items:
> -      - description: Display byte clock
> -      - description: Display byte interface clock
> -      - description: Display pixel clock
> -      - description: Display core clock
> -      - description: Display AHB clock
> -      - description: Display AXI clock
> +    description: |
> +      Several clocks are used, depending on the variant. Typical ones are::
> +       - bus:: Display AHB clock.
> +       - byte:: Display byte clock.
> +       - byte_intf:: Display byte interface clock.
> +       - core:: Display core clock.
> +       - core_mss:: Core MultiMedia SubSystem clock.
> +       - iface:: Display AXI clock.
> +       - mdp_core:: MDP Core clock.
> +       - mnoc:: MNOC clock
> +       - pixel:: Display pixel clock.
> +    minItems: 3
> +    maxItems: 9
>   
>     clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> +    minItems: 3
> +    maxItems: 9
>   
>     phys:
>       maxItems: 1
> @@ -157,6 +155,183 @@ required:
>     - assigned-clock-parents
>     - ports
>   
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,apq8064-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: src
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8916-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: bus
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8953-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: bus
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8974-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: vsync

8974 has broader clocks list:

@@ -244,12 +248,16 @@ allOf:
      then:
        properties:
          clocks:
-          maxItems: 3
+          maxItems: 7
          clock-names:
            items:
+            - const: mdp_core
              - const: iface
              - const: bus
-            - const: vsync
+            - const: byte
+            - const: pixel
+            - const: core
+            - const: core_mmss


> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8996-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: byte
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8998-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-dsi-ctrl
> +              - qcom,sc7280-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl

Could you please also add sm8150 and sm8[345]50?

> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm660-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 9
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: byte
> +            - const: byte_intf
> +            - const: mnoc
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
>   additionalProperties: false
>   
>   examples:

-- 
With best wishes
Dmitry

