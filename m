Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A166663C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC310E146;
	Wed, 11 Jan 2023 22:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BAE10E2C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:31:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bp15so25698160lfb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rp25D3bpkGkPu4rqAIvIiJqw9TCkFV237Xcq6MSn6jI=;
 b=nZpODa42Zjq+siNDxStA+Is8kupwkixG+uXrwgRWHIUE+AzLuKoMPB5nJ/sFjAWQqQ
 VdqrEgA1dxZsSNSIXGz4Q+ExhQDYRDnDxX8a1/fQj1UPQOy/stiBE1iWrVLyNiDOIld6
 ZFcnfxeqcs00WfdlgetgUVLbLNOV4UUItolTDVKScgYiL4RAni83TOaBwy53CbXQpYiu
 UvjUU7q6css5wo91vkpD8naP+3MNUtcx9O7On02lSjKQMCKQyDBSF5HzN+SBZgFOdp4g
 mdSSVhTQF9t7XEaB5pY+Ma1RYy8O/2eGnUUgXTeOmRWF+DvvZIfq4QgE8+pF064+F7gS
 qCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rp25D3bpkGkPu4rqAIvIiJqw9TCkFV237Xcq6MSn6jI=;
 b=5DTUpsarqTb01UjgqyUYC1h/wFqfwx62Lks9AQlNqMmWpy8yoFPy3BqJnbb6iIIgH1
 +0NgSuq/R1Mg7LTLRsH0HnTD8iVlOQQmGRzlFSxHtzj3CKFZqPW1I4AUG7rrmU8Qef0u
 lnlOgp7colSLfIIfUWdtKqH5xV1RC1IJzc1o440GNsSECcJXS5giGYSFmf6U0RKSMN3m
 cq17hqKPLxk3+Ls3CpOgFGM+c2ayT3uHhW1izovRmUg3v/t0KBclPrxXcVYh8ZYTyVGZ
 Zls8C1CAn7lwz12xk8dih0iTMm7Tg6kG1Eg32eSZouMI86I0PNNb5eABQzp2WZTWmKnr
 J6vA==
X-Gm-Message-State: AFqh2koeY4DFPF6RMwNJfO0oyMAprzUUJmztLA8egAd1Gd0Ch/n1UjzG
 br1Ohko9XA3HshkbHlc8RmF0Gw==
X-Google-Smtp-Source: AMrXdXuxyWEMX6IypiOJufOVsEp8WAmQoSdkUxEDG8qfqBbzmpGWiUKheQU67c6WPsTqA3daYULgqA==
X-Received: by 2002:a05:6512:151e:b0:4ca:f3c2:2675 with SMTP id
 bq30-20020a056512151e00b004caf3c22675mr19737511lfb.31.1673476294647; 
 Wed, 11 Jan 2023 14:31:34 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a056512078400b004cc548b35fbsm2926896lfr.71.2023.01.11.14.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 14:31:34 -0800 (PST)
Message-ID: <1d371e40-0639-16f8-abef-afcd05e72e22@linaro.org>
Date: Thu, 12 Jan 2023 00:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
 <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
 <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230111222903.otbur6yi4iv4mpgz@SoMainline.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2023 00:29, Marijn Suijten wrote:
> On 2023-01-10 06:40:27, Dmitry Baryshkov wrote:
>> On 09/01/2023 09:49, Marijn Suijten wrote:
>>> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
> <snip>
>>>> +    description: |
>>>
>>> Should multiline descriptions be treated as a oneline string with `>`?
>>
>> Ack, I'm fine with either of them, let's use the >
>>
>>>
>>>> +      Contains the list of output ports from DPU device. These ports
>>>> +      connect to interfaces that are external to the DPU hardware,
>>>> +      such as DSI, DP etc. MDP5 devices support up to 4 ports::
>>>
>>> How do these double colons render?  Is this intentional?
>>
>> double colons is an escape for a single colon if I remember correcly.
> 
> I thought no escaping was necessary here, especially since this is
> already a value - it is a multiline string.

I was mostly following examples, grep :: through the dt-bindings.

> 
>> BTW: how to render the DT schema?
> 
> I'm not sure if there's currently any rendering tool to view these docs
> in a "friendly" manner, e.g. an html page, or whether they're only used
> as specifications for DT validation.

Probably there will be one at some point. It might make good addition to 
devicetree.org.

> 
> - Marijn

-- 
With best wishes
Dmitry

