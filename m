Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C1973E4B9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 18:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC22710E242;
	Mon, 26 Jun 2023 16:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D187910E242
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 16:17:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f9bdb01ec0so42892795e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 09:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687796222; x=1690388222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JXeypSA36Qg27xwQK6BwDtx9kWu+FNhZhOD5YziOszI=;
 b=sPsZ86m5T5T04cUPJ6T5/9291QbjPMFyaSlceLp+6Z3VkTseFFaRaaj41GdRaDMyKW
 AvmGwchSI6OBo/R40KeXNU5aHaqvZvg0lsACalGibHKNU+CNWuFw1mvHO/nh0DKSi9a0
 4bS3YQTuGx565//jrqHhGQlMAG8aZv1g8XI2BA12PuebSxfmh6hdCsToQiU7W6v0XrZZ
 8FPHh/SQoESnw4D6xAaMCB6CFHo+5T5YfwNWcymt+52ohKUxeXvttYBts30DvDz1SqJ1
 BuzYc+04nuOYWdh7C96S21OoNlqBBJiFS3mSwLElfEbgAGB8EKt0oDV1Lviql/E0lEQa
 8pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687796222; x=1690388222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JXeypSA36Qg27xwQK6BwDtx9kWu+FNhZhOD5YziOszI=;
 b=hw4iUO8X66GaEsokTDVW8owkpVbKqwTW4JwLta7mLzjbE33VibKmmvfY/d+KOcesfM
 Q0RjlfPHBZJXfNALKD4WqSmFSylhvz/5L8cFoYzcRHa6eL0u3pTPjVcCSwNXo74GnBfc
 O2QVS45/oB9Kcik1pM7knsKB42UthG/ErprhiBqQgAkhoTSB5I6mhIAeZo5fGz5yAdxX
 H2kdIEFOGmktbXFMvNCQ5kMxLV8f0V/nPW5snFWeIO30aMNxxlj9FrdY+w07MRLT8R7t
 +mk/scj4dxOxvaDlXfAbG4sCek3whgsd/AW1z43ieUTHnTkUDBGNo47jGHrSdo9AiU+e
 GpRg==
X-Gm-Message-State: AC+VfDxjzaLzi8ilXQV0kbxHrZQHWRMHh92iEKVC+2xC5l/UoTMJKQse
 6s89ubk4c/7ss1C2Nro91w0O0Q==
X-Google-Smtp-Source: ACHHUZ5D7uHptdZqFo2PIkF6RpQXHdVAueCcOlxaXh158opWn01xLXfxyk7SpixUISeHvjWi2z+a3Q==
X-Received: by 2002:a7b:cd1a:0:b0:3fb:7184:53eb with SMTP id
 f26-20020a7bcd1a000000b003fb718453ebmr127490wmj.18.1687796221657; 
 Mon, 26 Jun 2023 09:17:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b003fa968e9c27sm3404076wmo.9.2023.06.26.09.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 09:17:01 -0700 (PDT)
Message-ID: <a6f3906a-98a7-de7a-3e26-4b8c45fe93f7@linaro.org>
Date: Mon, 26 Jun 2023 18:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
 <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
 <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
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

On 25/06/2023 21:52, Marijn Suijten wrote:
> On 2023-06-24 11:12:52, Krzysztof Kozlowski wrote:
>> On 24/06/2023 02:41, Marijn Suijten wrote:
>>> SM6125 is identical to SM6375 except that while downstream also defines
>>> a throttle clock, its presence results in timeouts whereas SM6375
>>> requires it to not observe any timeouts.
>>
>> Then it should not be allowed, so you need either "else:" block or
>> another "if: properties: compatible:" to disallow it. Because in current
>> patch it would be allowed.
> 
> That means this binding is wrong/incomplete for all other SoCs then.
> clock(-name)s has 6 items, and sets `minItems: 6`.  Only for sm6375-dpu
> does it set `minItems: 7`, but an else case is missing.

Ask the author why it is done like this.

> 
> Shall I send a Fixes: ed41005f5b7c ("dt-bindings: display/msm:
> sc7180-dpu: Describe SM6350 and SM6375") for that, and should maxItems:
> 6 be the default under clock(-name)s or in an else:?

There is no bug to fix. Or at least it is not yet known. Whether other
devices should be constrained as well - sure, sounds reasonable, but I
did not check the code exactly.

We talk here about this patch.

Best regards,
Krzysztof

