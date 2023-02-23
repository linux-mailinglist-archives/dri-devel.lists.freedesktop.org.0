Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32D6A083C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418E10E170;
	Thu, 23 Feb 2023 12:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4494110E170
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:08:44 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m7so13430690lfj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VQn70AP+A3I2sqmjhfgfqL1Y9XTnRaJMCZdiO2SRAdA=;
 b=sRsF5eRVhlmOFCywnN66o4x7hIsjnlo+cWOI++wvBg3w7DbFNASgEvl3i4emeNfmUH
 kKzoEjujEgFiAaYYD7THOVWUlp8iKd6Zpr6CKzVYEsifp9nhIe8JbDP7ohG1qANgSx3H
 gEUo+g45pmRdlJPGeREwrWiYametw2jcpSB/6KviTPtGU8sM0CYf7AM/M9PfggKMBnu4
 VW5XcA+egquL2zQdIc/+fCb0sYxw3dQpDaULAWsK/NePCEh9p6jCJlN/WKr8MBiwN4yt
 wewBTQS7JB1n0lVHjUN1N8Jdpd96QrSTS1ONhNv9K/PcWdTkbleJHCCMjYxnznEv7Pv5
 YBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQn70AP+A3I2sqmjhfgfqL1Y9XTnRaJMCZdiO2SRAdA=;
 b=iLbJNSphLz/mwS01xhdt8jX/74XdB9PDJaNBMf7ZGRzrG1I5c0tYkIrtuIxjWwILYb
 UNP9dQJ4VRQaBYd/SmTgSCt2JVby3oQ3R4ovDRY4+YQtxX9jEUXVGQWWvY2ixNqmtdm7
 W5jy4VaYDn90F67UXu4irPDac20s5mXvcmep8DzoI4ETNdywunefoAGd31AMiCGPK1FR
 gegvHnn5XF2LdY5mjECFo/lo/lLmYS4IO9PPguniA5TXp8HyNxXJmDXhr58tAn1+eUaq
 d5KXkcB4+TJZAVRIFlvMKq10RXZhpz55JXmkqr3qRXUJOowubs80hgM42JHgY0kPaqs9
 v9yw==
X-Gm-Message-State: AO0yUKVxqSmn//frtKHz+UNBQqAMyWmxlcvCIC3H3pI439hmlH4d4s7G
 7VSe+h1EiQwMDESHhQNUrvassw==
X-Google-Smtp-Source: AK7set+O7HU38OM6BC/kSjZpEGP7oZyfke11r+upQCHouYa68PvTYy0DG/uzr00PZxqYJE6A8ov2tg==
X-Received: by 2002:ac2:560f:0:b0:4d5:c96f:f7c7 with SMTP id
 v15-20020ac2560f000000b004d5c96ff7c7mr3460171lfd.23.1677154122485; 
 Thu, 23 Feb 2023 04:08:42 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 v26-20020ac2593a000000b004dc4d984911sm638214lfi.271.2023.02.23.04.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 04:08:42 -0800 (PST)
Message-ID: <1c4f3f2c-d435-3721-df03-152c6468e0e3@linaro.org>
Date: Thu, 23 Feb 2023 13:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.02.2023 13:06, Konrad Dybcio wrote:
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins.
> Account for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
[...]
> -    then: # Since Adreno 6xx series clocks should be defined in GMU
> +            enum:
> +              - qcom,adreno-610.0
> +              - qcom,adreno-619.1
Immediate comment: this could be improved by checking
the compatible of the node referenced in qcom,gmu, but
frankly - I have no idea how to do this / whether it's
possible with schema.

Konrad
> +    then:
>        properties:
> -        clocks: false
> -        clock-names: false
> +        clock-names:
> +          items:
> +            - const: core
> +              description: GPU Core clock
> +            - const: iface
> +              description: GPU Interface clock
> +            - const: mem_iface
> +              description: GPU Memory Interface clock
> +            - const: alt_mem_iface
> +              description: GPU Alternative Memory Interface clock
> +            - const: gmu
> +              description: CX GMU clock
> +            - const: xo
> +              description: GPUCC clocksource clock
> +
> +        reg-names:
> +          minItems: 1
> +          items:
> +            - const: kgsl_3d0_reg_memory
> +            - const: cx_dbgc
> +
> +      required:
> +        - clocks
> +        - clock-names
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
> +
> +      then: # Starting with A6xx, the clocks are usually defined in the GMU node
> +        properties:
> +          clocks: false
> +          clock-names: false
> +
> +          reg-names:
> +            minItems: 1
> +            items:
> +              - const: kgsl_3d0_reg_memory
> +              - const: cx_mem
> +              - const: cx_dbgc
>  
>  examples:
>    - |
> 
