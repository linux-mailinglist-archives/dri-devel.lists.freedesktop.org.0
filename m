Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB1669115
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF6C10E9AD;
	Fri, 13 Jan 2023 08:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B2910E9AD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:36:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y25so32086739lfa.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 00:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MbcF412+htBpP6c3Z0Q4p3qLBGDCwBxu74wvh/PMgNw=;
 b=VpSslbPElfSFkioF2esjTVMWOD8pQfbbCeJ6uRoN7SwA/DpDfkNJg5YbMKDjOyQm58
 Lref6nMkgaioreG3O9Kqk3MKFGbEuLb4YGcEbtI8+FxecrhtP5vogKIiQQd/BeDrIU7P
 B5yaBqDCZbyuMlczVjJ8CCUwZXTvBC954sVEXQfxdbvLdx7tYmrvCvPJWtb2fMYKEZ4a
 /Ji8PZljruID8qRbeX8XbMukIH+Q3qfRpdLg6DWzsLjrc9qYlr88xVRYrHpMSORoINoF
 nDgPE7T9M9KYW8qRICOu5YW/OAo98RpWHb5ILPxNfgXsLbQLw3D+ICsSsfVuFiqSQve3
 lEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbcF412+htBpP6c3Z0Q4p3qLBGDCwBxu74wvh/PMgNw=;
 b=qbv30V8/kAhPfmtLImdUyEEcyYXfQfkTzIQYGxvMP3AEMhTXNSCc1FbQ8zH6zJuXYH
 p41BZc3yAZVkzbXlJG2o8b5fzsNSc+thLcjvnbaMQmR4/eGUM/lrc6SdiLOEaGdHVlKw
 FKKjYsz0HrnI2BA46roLEE+NXzMRp1oaQiBiKHW6057keaquVlO9aqV/od7McAX3KftV
 w+ZXfYcoRJy1pbRqe7UJDrKzRLmg/rDk7uMAzxTRXqkQDZEJ59SfeCB7UmRcpYw1hwm/
 bC9c8LCIsWqEv+yk0/wv9+QidjMj23G2+OR6z5Os2/bj9JXLIMhib6iKckF6IkUs5xOG
 AfUQ==
X-Gm-Message-State: AFqh2kpzjxXi70OZhROb5Hx/6yZiB+Ye2GudFqWrUsinPPzK7sX2YJ6h
 QveB0Pp1GHs9vmtpaxMPOl9pAQ==
X-Google-Smtp-Source: AMrXdXvWNzx7rgSBewTKrQ2TXk3lTNoL04kHq5ZP4XC25VP4PEcDLfWV9uvN9qcdP5fMa1q3Tiag1w==
X-Received: by 2002:a05:6512:224f:b0:4cc:586b:1834 with SMTP id
 i15-20020a056512224f00b004cc586b1834mr9610322lfu.45.1673598972387; 
 Fri, 13 Jan 2023 00:36:12 -0800 (PST)
Received: from [192.168.2.31] ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 v15-20020ac258ef000000b004b57a253deasm3739416lfo.162.2023.01.13.00.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:36:11 -0800 (PST)
Message-ID: <81cf71ed-1daa-222d-d67a-efded42e70d2@linaro.org>
Date: Fri, 13 Jan 2023 10:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
 <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
 <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
 <1d371e40-0639-16f8-abef-afcd05e72e22@linaro.org>
 <20230111223553.e3xrxmdys5zxxleh@SoMainline.org>
 <20230112215015.GA259261-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112215015.GA259261-robh@kernel.org>
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

On 12/01/2023 23:50, Rob Herring wrote:
> On Wed, Jan 11, 2023 at 11:35:53PM +0100, Marijn Suijten wrote:
>> On 2023-01-12 00:31:33, Dmitry Baryshkov wrote:
>>> On 12/01/2023 00:29, Marijn Suijten wrote:
>>>> On 2023-01-10 06:40:27, Dmitry Baryshkov wrote:
>>>>> On 09/01/2023 09:49, Marijn Suijten wrote:
>>>>>> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
>>>> <snip>
>>>>>>> +    description: |
>>>>>>
>>>>>> Should multiline descriptions be treated as a oneline string with `>`?
> 
> Depends if you want to keep paragraphs. Generally, we use '|' or
> nothing. If just a colon (or ???), then I think you want '>'.

Ack, thanks for the explanation. I'll fix this for v6.

> 
> I get tired of saying to drop unnecessary '|' in reviews. It would be
> nice to analyze the text to check what's needed automatically.
> 
> -- 
With best wishes
Dmitry

