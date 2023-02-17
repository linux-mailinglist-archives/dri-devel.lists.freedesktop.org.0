Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9269AC1E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E874B10EFC3;
	Fri, 17 Feb 2023 13:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758E910EFC3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:06:45 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y29so1312639lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vvEa0mJYtd+G6bvaOGxPbkna4LTkKOOJGlw7PwM4jDk=;
 b=OutRggqL6ChRrd7U4h7FjSaKRX8WvJF/ILzuPwurg/Db6xOW3nMZZYCNIJfBd8JIux
 8zbjn89swfdF7wVtCdBXk9jnBBSKY+0gDx0/HaYI8LQ62I4G6Ousiqg5KBaOLkPRje/c
 xmL9hhjL9D9hEPMTml7RRabmctWihOc/iDi9/vi/yfbRFj7WBmwFZhEg5+UpDaYNrIp7
 qXHnjYWt0lwDte8lMI5kYdP053zXRMe8BfuLqvzE1oh3jG70fSkcdL+6V4t6lClAZCCF
 qP+LPRs85W+uYpwc5mXsNiLGEgzxpr/GVtvJIFDjCCZQDHa+OMqYZ0SvNTQWy3uS7zy6
 Hcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vvEa0mJYtd+G6bvaOGxPbkna4LTkKOOJGlw7PwM4jDk=;
 b=ocgoeVW4IXdNdJ9vmjuSfuEvMl64lmpyXi5pP4Z9r3Id0x7OYFMZL8QxL1YubupEw4
 QZbwpb25ZcBm8pbWQiT9q5A2FxOaxgbfpS1uhGsoIz4KJm5kAvL97/mcRqXOHkWMOUe1
 ECxZbdX3Euztj86XYqIcNdXPjIklyYaWZ8xa1NEsDL88/0RvitEOBpP+XnQ03hpg2XtM
 5qPdTAAfiDltyqRwrxOWknyD+UaTjNkiiWS2z5eYv71t/qmQAYaJKpcDCcH92mxYeHtf
 fF/ZPdymXJycbJIZw2OODlYeewWCKxF18Re3SwAwvA8bPdzvmWNiWq6raqDYsgvKXhgE
 vMiQ==
X-Gm-Message-State: AO0yUKVC2vElOMBeCYC4Wqs58dfaKOGptjvE7QJzbd6o6CFIAqvAey/X
 UIkWPPmVUPoB+A/hHW3XWua3cA==
X-Google-Smtp-Source: AK7set/lbeT9EHF1pBE4+EMSMKbkVmLPsQwro43XW0FTt2Afuh+Wj39B9+9Wd1kBfJ9Q0Dco/BJl4g==
X-Received: by 2002:a19:ad42:0:b0:4da:e925:c95b with SMTP id
 s2-20020a19ad42000000b004dae925c95bmr152872lfd.62.1676639203626; 
 Fri, 17 Feb 2023 05:06:43 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 t1-20020ac25481000000b004d16263b36bsm673878lfk.111.2023.02.17.05.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 05:06:43 -0800 (PST)
Message-ID: <0d955930-df72-127a-7c53-3e3519affafa@linaro.org>
Date: Fri, 17 Feb 2023 14:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2023 13:24, Krzysztof Kozlowski wrote:
> On 17/02/2023 12:36, Konrad Dybcio wrote:
>>>>
>>>> compatible = "qcom,dsi-ctrl-6g-qcm2290";
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm6115.dtsi?h=next-20230217#n1221
>>>
>>> I meant, that original commit wanted to deprecate:
>>> compatible="qcom,dsi-ctrl-6g-qcm2290";
>>> compatible="qcom,mdss-dsi-ctrl";
>>>
>> Okay, so what would be the correct resolution?
>> Drop this patch and keep 2/2?
> 
> First, it would be nice to know what was the intention of Bryan's commit?
AFAICT, it was necessary to add per-SoC compatibles to all DSI hosts
to make documenting clocks possible (they differ per-platform).

The qcm2290 deprecation came from the oddity of the compatible name
(it did not match qcom,socname-hw), but he seems to have overlooked
that (at least before my recent patchset [1]), it was necessary as it
needed to circumvent part of the driver's logic. So it was first made
up-to-speed with the rest by adding the fallback common compatible and
then (wrongly) deprecated.


Then, SM6115 DSI DTS part was added parallel to that, so he did not
update it.

With [1] its deprecation is correct and this series tries to complete
it.

Konrad

[1] https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
> 
> Second, if the intention was to deprecate both of these, then this
> commit could stay with changes - make it enum for both compatibles (not
> list).
> 
> Best regards,
> Krzysztof
> 
