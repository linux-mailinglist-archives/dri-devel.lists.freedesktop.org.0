Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532773E8CF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 20:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C459010E122;
	Mon, 26 Jun 2023 18:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A218A10E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 18:29:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fa99f6a482so11555675e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687804181; x=1690396181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ciOBPyu+sPG/PKmYcGSQsv3KkzCK7Nt7aYmMhEDjDGY=;
 b=j4CEk6ctLOsGMGmJWmlUl/9qeH9Ix3rM02o9HB2xpYBYHlFD7BQ5v4L1g7VKorj0eS
 u+UQ1Q4HEzTwSLikfOUzA4HNfR5a2NOxXMyXV8RhBIjpxxqFpYLTbbQR1r3xoE3IvS9O
 yT6JTc8aBedyR0boA3VZ0O/M9smdhh8yA0Egk8WSz5j0cX/WMinxVhqOfHN/x9XQqbSV
 vk5ZKzNueC/weR+IyeNOCGT74B86kM9gGqBQ7Ek/jkgdvsTe1PQX7Fb9AjhkmTBTS82z
 MsWn0oRUD0wntafSTc5sn1Wt+HHtxP6dg2PuNuVlBfiqbhr1MfUrDYM35dmwIoIyApw9
 57pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687804181; x=1690396181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ciOBPyu+sPG/PKmYcGSQsv3KkzCK7Nt7aYmMhEDjDGY=;
 b=j9902Fz0WURqpLRpkhyZDmK9dILuaW170fH0RcWOBlQyf4gK+4R6I9vH6e584Zx0UW
 r/chftd6FWLq5c4SWy2dY8eCjhsL9b9rcV7dbvCxisV1nuLkDbaQ9u2eDtXquwzI459w
 FKQqgBgh0lluIO+muRBaBO2DjYtJ6bkBpLc1oF26DRokDVW210ktRSGuDxFgJpOOStzE
 l29PbL5TMYtom4GUwOuxLr3a8wKnpbxKj8dmndbg5hxnmWmrawbnaH2cYhhq00r8WyJX
 0ED8YFPRKUe4B6Bqn0FH+Upiw3+eEb2LTBIUTdQvg9OyzqCJSEDP5i1E2lax/kWEv6Ql
 EhUA==
X-Gm-Message-State: AC+VfDwbkZKakEa2snkVyU5UM/7envqOsGsAGfXoI42Is2Kk/8QLOGTA
 PFn4d7m43SQxEmMc3xpNOyNLnQ==
X-Google-Smtp-Source: ACHHUZ6SiiVfSIYwx/dCsp5tW8i7z1sIDCnOdX5N2PHNcEVe4w7x5ZWmNvzNg1eUdrPkf/HUzHz1ZQ==
X-Received: by 2002:a7b:c7c9:0:b0:3fa:7d11:ad00 with SMTP id
 z9-20020a7bc7c9000000b003fa7d11ad00mr7893257wmk.25.1687804180787; 
 Mon, 26 Jun 2023 11:29:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc019000000b003f819faff24sm11383213wmb.40.2023.06.26.11.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 11:29:40 -0700 (PDT)
Message-ID: <6311f26f-79ee-c471-649f-5e0b4629cfcc@linaro.org>
Date: Mon, 26 Jun 2023 20:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom, dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
 <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
 <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <jmtjuya4c423rmdlo4ubvvqndbxvgapal5otjqnejdpdd25izp@kewbjmqdu2xs>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/06/2023 19:49, Marijn Suijten wrote:
> On 2023-06-26 18:10:44, Krzysztof Kozlowski wrote:
>> On 25/06/2023 21:48, Marijn Suijten wrote:
>>> On 2023-06-24 11:08:54, Krzysztof Kozlowski wrote:
>>>> On 24/06/2023 03:45, Konrad Dybcio wrote:
>>>>> On 24.06.2023 02:41, Marijn Suijten wrote:
>>>>>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>>>>>> be passed from DT, and should be required by the bindings.
>>>>>>
>>>>>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>> ---
>>>>> Ideally, you'd stick it at the bottom of the list, as the items: order
>>>>> is part of the ABI
>>>>
>>>> Yes, please add them to the end. Order is fixed.
>>>
>>> Disagreed for bindings that declare clock-names and when the driver
>>> adheres to it, see my reply to Konrad's message.
>>
>> That's the generic rule, with some exceptions of course. Whether one
>> chosen driver (chosen system and chosen version of that system) adheres
>> or not, does not change it. Other driver behaves differently and ABI is
>> for everyone, not only for your specific version of Linux driver.
>>
>> Follow the rule.
> 
> This has no relation to the driver (just that our driver adheres to the
> bindings, as it is supposed to be).  The bindings define a mapping from
> a clock-names=<> entry to a clock on the same index in the clocks=<>
> array.  That relation remains the same with this change.

Not really, binding also defines the list of clocks - their order and
specific entries. This changes.

Best regards,
Krzysztof

