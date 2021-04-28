Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0566B36D915
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 16:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF556E114;
	Wed, 28 Apr 2021 14:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187EF6E114
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:03:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z13so18421141lft.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hIlZcAoSbYPGRqVrq1QW1VGSSVC9v2Q8BKI4bIbHGWE=;
 b=hJ0AFlu82jzBPuRmLSQ7D7SqUBH1V2fY11cf4JrWJ1nTp6ZtolN0+wZKDr6WplTRmh
 8LWa1+1xasUijb3AJaGv0RWr9W4cuZkqPRHAe3+gHq4RSNs50442wwfZTHhW2od9x4Hk
 sZODx3vv9bcIBTKNuJ8d/rnTq8aRInMWhsIjwejnWdn318XZNJujvpfE7dVgORaGnGyu
 bM2WkuD4PjIURZNOSrfc8zsUJdgYMGIIN0ibQTeFlW4bsERdxXaWbZ3P91j7YoVLAhOz
 W0a8jglsrVYh9/1+/jazB2AxxUVP6DcMBI9VVG6Ngq0p5voMYDLNze9LkuqWEV4ReBEG
 owHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hIlZcAoSbYPGRqVrq1QW1VGSSVC9v2Q8BKI4bIbHGWE=;
 b=NQvMoC/0clJcphQ1xt6fPw7BotKwEVAZDUCSt0uMCd28X8dxaVPR1fykpWlGL8B56O
 8FLSd+A89iAnxL1DROxwLUbz4xrAitrobcFtxWdcASaEmc+ik71z0ts8CVN2l2R/2H9b
 5rnlNCW7tmqcCFPgc84ZJ3LGSiZwOgyldzZeUNljzYugxjn3gaHwZcr9G854t0/99uhA
 LKjjzwwkfez2hLahJPfQP4ECH38UIMXomY1QbeEK54ucY9DBPNwuKOWBk+SQ5w5MqZCU
 7Hydya4MaGwOiZ7CBtbffHC+HpWExG80KqAkAfNGjwiCzJTb82HiDflO9FPLzzP2hPbp
 BnZQ==
X-Gm-Message-State: AOAM531aDJjGTyua9CCNyHnqb/hiD5r8KgTGFwzSO6mNq1xXK94C/ZtT
 jMoWyNo+wmsrDkPpDCyUeGhuOA==
X-Google-Smtp-Source: ABdhPJwYPf7XPgjwdPAFFKGQ/RLPs3pjlVEgdifm7lbHkjGOkCxRrFZMRyNQF9IY/tYNzFapwDdf2w==
X-Received: by 2002:a19:ee0f:: with SMTP id g15mr21587709lfb.407.1619618583470; 
 Wed, 28 Apr 2021 07:03:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b29sm1166981ljf.87.2021.04.28.07.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:03:03 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
 <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
 <20210428135901.GK1908499@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7b9e9b69-1817-6884-21ba-dde5e24d8f4d@linaro.org>
Date: Wed, 28 Apr 2021 17:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210428135901.GK1908499@yoga>
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/04/2021 16:59, Bjorn Andersson wrote:
> On Wed 28 Apr 08:41 CDT 2021, Dmitry Baryshkov wrote:
> 
>> On 28/04/2021 05:47, Bjorn Andersson wrote:
>>> On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
>>> [..]
>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>>> index 92fe844b517b..be578fc4e54f 100644
>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>>> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>>>>    }
>>>>    static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
>>>> -				  const char *dbgname, bool quiet)
>>>> +				  const char *dbgname, bool quiet, phys_addr_t *psize)
>>>
>>> size_t sounds like a better fit for psize...
>>
>> I was trying to select between size_t and phys_addr_t, settling on the
>> latter one because it is used for resource size.
>>
> 
> I always thought resource_size_t was an alias for size_t, now I know :)
> 
> That said, I still think that size_t (in line with resource_size_t)
> gives a better hint about what the parameter represents...

Indeed, I'll change that in the next version.

> 
> Regards,
> Bjorn
> 


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
