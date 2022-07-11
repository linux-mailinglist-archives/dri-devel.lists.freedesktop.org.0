Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE485700C8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F78DBCE;
	Mon, 11 Jul 2022 11:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291F68DBCC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:37:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id r9so179808lfp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dRCit7PDdPHjZBOwp4u9jORbpMarXZ1yRwqNnSgrgDo=;
 b=ZMw7KZQ3z67YtPsjQBn2Ndo6Quz211hdWH+61kRV6pTN8Jb1Wjr0yQuQkRDk4S8Tsa
 y6gkScoDmAu0WaLA6/lxe1dKYtywgB4mxbh5oDwYWASvma5bsJpi2pg7LIFco+Ek2tbM
 9yXtNRhGeIVPsCE/WuiqPyCjWlvXxciMaX4f5FzFIUJ+a7qV5oc3h9pK9EppSLVQPtD1
 gQHrJRis95eq0DYSilPMkb3/K0xM3FWU1+Lv5Hl6co6uxDD8E5okWczRwpwzYYDEPbzn
 /21+P6KDY5OAQvFK0N4escrzif6ZMIs1gNXpLw889qpP6YtQXvUT1OdLvuBhv3to4V/I
 7uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dRCit7PDdPHjZBOwp4u9jORbpMarXZ1yRwqNnSgrgDo=;
 b=7A6HQTf7Zb5SPi7qnhlHZhBNRz4Y22y5nTD/DL91FWm/LvmsOD5b78EzkO4SUTS4wq
 rxdemSKhLsNgZMPIPgwKG9HSwUvHYHpyQGnhKmPhkcLPOK3rvl/I8edo0MoZqcfHX/jp
 go+RFrU44lpTY7Y8gEgZY6PPuxRel/L8Fq9w+RzUaNnBqOdd38u+KDCKo3tEGrFNtg7r
 lf1ycAHBTHnlxPYmTdL2MiXQVFLZEP2ai/1pgjWUtCjRgHIp9EuRyv9hz7jUap4mSzBR
 ZFJVA+5ftra1SPSSHxaBRJLT3nOTWoRQrlPS7F7L6ykoQE+9LhR0Mv/8ZI1SockyubMp
 /3vQ==
X-Gm-Message-State: AJIora/JLd0K6tzTvnGsFU/GiZ9zAeO7qap+q1GXiblpJhr7Alpm+++S
 wcagG6hEZIyee0Ks93zZzBg1bA==
X-Google-Smtp-Source: AGRyM1u/zuOZEHQSioAp2lToRg2hUW+1+7Vg4tCi+2Nk5KkWA+Awxx0SdA1o6LpLrslnO04WuATicg==
X-Received: by 2002:a05:6512:1111:b0:481:22b1:8db9 with SMTP id
 l17-20020a056512111100b0048122b18db9mr11247160lfg.333.1657539436440; 
 Mon, 11 Jul 2022 04:37:16 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05651236ca00b00489d7fec4f5sm937284lfs.122.2022.07.11.04.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:37:15 -0700 (PDT)
Message-ID: <677d6387-6225-29c2-3190-8f443222019f@linaro.org>
Date: Mon, 11 Jul 2022 13:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/11] dt-bindings: display/msm: split qcom, mdss
 bindings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2022 11:00, Dmitry Baryshkov wrote:

Thank you for your patch. There is something to discuss/improve.

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "^mdp@(0|[1-9a-f][0-9a-f]*)$":

You used some unusual pattern. It's just "[0-9a-f]+" - the device
schema's job is not to validate patterns in unit addresses.

Another question - why do you allow "@0" alone?

> +    type: object
> +    # TODO: add reference once the mdp5 is converted
> +
> +  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
> +    $ref: dsi-controller-main.yaml#


Best regards,
Krzysztof
