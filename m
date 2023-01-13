Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B84668FA2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 08:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFD210E00A;
	Fri, 13 Jan 2023 07:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D3210E00A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 07:54:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b3so31975013lfv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N67jHu9VPuTFdj17UUm5v+m/LOkC9ATqB6ZFcng9mBM=;
 b=Bki18zw1En9C22F6tltWIdlUyTDANgWT8zXiUg1559uid/2tdN/7WqSaAGQfEIUfTY
 bpCF1BaNvZNMMH2tfv/nANrTrQc0klkN2ntLhDyBG6FQyeXBm2Iifvz6AEOBc6cW1sFf
 O9ddT7Z/NRiLNoUQfTN82aWWu5qAhhebJPhuvYW38I05YBON2Xd1d6C33y/shn8sdZRM
 Y/anSY0r6XtnKMUguUar+VYEpbc866d0QwLc2DgaRNZ7fYpEEUdmxlLY88VypAEu1XHF
 M2bXERmFufs57MYM7BKSKhEW5/ncEzqy1aJsGmBEbxEm1XhilojsS1YxHgRp+9HlFGxv
 NJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N67jHu9VPuTFdj17UUm5v+m/LOkC9ATqB6ZFcng9mBM=;
 b=jqPMrsFl8voY5PQT062T9U4B2Bcuv2eQFyvgqBi1MimvQwBrsLYdnphQ0oFzgP/h+o
 m5s4DvTghpyN+F71pr6Sy41mJXXJB1TTKSxd5nlUSiadN9xRmgfeheACSMGRvX4vclhB
 6xfeEaHcRYtWzpkNvjkkOolVecEijRlhgejrTMhfpGY2Yi26BagYfpw3XdGQSwpvElJE
 PQWIn1FD2c+B5X+5EXaO0UkGs/VNkUMdXio9nqoRHJITt/MVkLLkWeu3BQx+zWQdHIo3
 XKw1o0VNw5jP3SK46Vfz3KMRz49kE5SQ/am3gFlTPK3vhBy4kBUoUatz7jZnil7aQh78
 SBnw==
X-Gm-Message-State: AFqh2kqgoIhTrvnDQ0DThsUnwDKLRj/O6q3TzCGfsuFf35tNvQa3QK06
 4JFQs5VWUxhSsRwVzkOhgNZKTQ==
X-Google-Smtp-Source: AMrXdXv6pH4riHGD4hlzNNEYTm3aN2sryaYRoXVh/PWP9xQnGwYrK8GnJHedEA8Rrv00tgoxfGLv7g==
X-Received: by 2002:a05:6512:234a:b0:4cc:a19a:7a1b with SMTP id
 p10-20020a056512234a00b004cca19a7a1bmr2033934lfu.65.1673596488202; 
 Thu, 12 Jan 2023 23:54:48 -0800 (PST)
Received: from [192.168.2.31] ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05651203a900b004d01e47b7d9sm285163lfp.223.2023.01.12.23.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:54:47 -0800 (PST)
Message-ID: <edae9929-bec3-789c-8807-2209847e8156@linaro.org>
Date: Fri, 13 Jan 2023 09:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/4] dt-bindings: display/msm: add SoC-specific compats
 to qcom,mdp5.yaml
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-3-dmitry.baryshkov@linaro.org>
 <20230112215202.GA281635-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112215202.GA281635-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 23:52, Rob Herring wrote:
> On Mon, Jan 09, 2023 at 07:01:50AM +0200, Dmitry Baryshkov wrote:
>> Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
>> distinguishing between various platforms. For msm8998 list
>> qcom,msm8998-dpu rather than -mdp5 to allow this binding to be handled
>> by either of the drivers.
> 
> 8998 is where?

Ugh, I dropped it from the patch (because of the existing 
qcom,msm8998-mdss and qcom,msm8998-dpu). I'll fix the message for the 
next iteration.

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
>>   .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
>>   2 files changed, 21 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry

