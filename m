Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C06A1C7C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 13:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87AD10E066;
	Fri, 24 Feb 2023 12:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED1610E066
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 12:54:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bv17so981730wrb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 04:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sKJQDv4Kif6EGyfqOTg66AyQtr3vwAgyU41TdnYU1ok=;
 b=n5Dy01q6kUixJ9kKRCOGyblC2Dy5qoduTfh5ms/rHvPjmTstlc+RWyu71B8e3+Kotg
 QmDj8qStmtWPrIydTH0Q69pcr7WxYIcDBFZJsIxPzf68qfurepjaOLAOGNu5J+BA7Gpx
 T1KEq1qxa/+NE85nrB151iM3kKRiU/TSTWsBg28N1J0Rl5gaLGqFe4Sa9tmrdk3ceq4q
 jqkx2KfdEyAWleRWkIC3OGm7i4JNcueEmHJ22uhX9+5YbT804eI+mw03dTuRJNTvYl5r
 LZrmao6nugHccwZT0ODuT+3A+1EPR4XRcENjPyC8rZCiMgJ6c14h8+ceCGiazj4j6vn+
 eRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sKJQDv4Kif6EGyfqOTg66AyQtr3vwAgyU41TdnYU1ok=;
 b=37/JMN9TGGPylVLph4ivwaDu2ONQ2eW1xdUIXyhXzoec09tB9joHPuUW1n/QqHUQ5h
 zNKhgmPuLf6D03lEOjxbhFuGi5DDx8ZHXXsx7CikRlxFzsnLTDDXA2NleBSGmpIlOEWq
 0aNj7Q0bwfXDdgMVS8yPpdjhaEb+VBPIxOio5q8REFScm6E4tWYA1quRzwfs2em5miQ+
 CsU5Cdb3Rl/jLTmOj3wrkR/BOe+sL595iFyFgJbdRbuZyudoP11YCHWD+pZnwg++a/cx
 MT/OWmbcXEtkoWJrus3PJiDxHDZgXYoGWC1Uf0jnPJcj0bfalauM21zUp2W3T7MnsKU5
 Sd+w==
X-Gm-Message-State: AO0yUKXkBc4lit1bZGxKGNHn+Fef27wcpa6CbdAMtKGYiGOPE9M/8jou
 ASx5b2gtUrLroI0jKR91Cljt+A==
X-Google-Smtp-Source: AK7set9YMD34P8T/oGssJCIPFl6P4x2re05kDEPyfm4ulVZnvWLTPtalofrM1ozZ42Xn60QYUEdqhQ==
X-Received: by 2002:adf:f802:0:b0:2c5:4c7d:53ab with SMTP id
 s2-20020adff802000000b002c54c7d53abmr11060307wrp.20.1677243273310; 
 Fri, 24 Feb 2023 04:54:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adfe84a000000b002c71d206329sm1714946wrn.55.2023.02.24.04.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 04:54:32 -0800 (PST)
Message-ID: <3bfa1895-a282-14c2-9710-7e887a5d52ee@linaro.org>
Date: Fri, 24 Feb 2023 13:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
 <c3376575-c24f-18a3-1d8b-c3d67f072287@linaro.org>
 <a28c4e67-78b4-21b5-7094-9953316576b2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a28c4e67-78b4-21b5-7094-9953316576b2@linaro.org>
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

On 24/02/2023 12:51, Konrad Dybcio wrote:
>>> +    else:
>>> +      if:
>>> +        properties:
>>> +          compatible:
>>> +            contains:
>>> +              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
>>> +
>>> +      then: # Starting with A6xx, the clocks are usually defined in the GMU node
>>
>> The comment is not accurate anymore.
> I'll argue the semantics, they are still "usually" defined
> in the GMU node..

Ah, usually. It's fine then.

Best regards,
Krzysztof

