Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680336D873
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1E6EB45;
	Wed, 28 Apr 2021 13:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB7F6EB44
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:41:27 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id n138so99449875lfa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UdaUkpA5N5nHKWHA6Y11Sw4irRFTX3g8KA8orjrfBsU=;
 b=mKD+BwdqpP+b4KJs/cYSekD0cEqSNkwjJ5DGcCum6eqpKHUSCvM/ojFkhfTdJaCf1L
 YkU6lF8VpmpvOtIXQ2+DTfQWGSMHqtHXDQkAHtME33M58Q9cIbnGCoVoODFMT0OOeHIu
 xS4OTqDnhP/SMWzJRCmsMsV484MSsmaAGILVqfzwTQxc/3UKq4lDk6kouQpxk+XBc52J
 byNA8QeOoiyx52h0rJeCEb2uvsCMONG/z9C0ykmUagZKP3ZClBUXuwTxB8Mt9TEJGj5l
 MWabM6x7lSjmFYFlbpPGRYQWF9U6McKdiO3iwkZcRQP7HZWyQ+8lGMdXxAf2Osa9F7I8
 dpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UdaUkpA5N5nHKWHA6Y11Sw4irRFTX3g8KA8orjrfBsU=;
 b=XfJfaR1PRtmivgdpMYGHZZWbD8kdPLAMfEbZvF0ZkJJBsEIACNeqG6UTkyD7UGf4TS
 54PBoU8665wwNnAJN9zLzCNKH7dAxdeGT3zonxu6Evpy0HKEZJ0Wprh5yx/0izhLnIt8
 zATP1RgQvhgx+5ozXSn7jnDur1OHxg+XIS+9aNTP1vfvMl7Ih3hRmN/h4HiWGy6kkmR0
 6Mh935JNxpluC6nsf7UK5brZ/CUe8rY0oboR84+lLDgvAPLW85nheLbDPxP4CpdKrLY1
 oFcl2mdl1YOKVlKSumQVIeVX72tYJUy6rNhhHFupa803pWrC/ClRqNYF6vec1Bd9IHbR
 S6bA==
X-Gm-Message-State: AOAM533UB7+u7ZQPpsDXu1Foxt2BLIPL7l+chNAVCpJAOiFURd4RePOI
 LirT8JPfqDYQF3/VgHRb7HSNjw==
X-Google-Smtp-Source: ABdhPJwZ8hSuuPlle9JJpl95OeROAwnXVDtwnjuR43flrbjDNYUGcXMjeq6y8jBeVkreKP1v4+xBtA==
X-Received: by 2002:ac2:5f92:: with SMTP id r18mr7033680lfe.253.1619617285747; 
 Wed, 28 Apr 2021 06:41:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f20sm1181344ljn.123.2021.04.28.06.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 06:41:25 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
Date: Wed, 28 Apr 2021 16:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210428024755.GJ1908499@yoga>
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

On 28/04/2021 05:47, Bjorn Andersson wrote:
> On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
> [..]
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index 92fe844b517b..be578fc4e54f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>>   }
>>   
>>   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
>> -				  const char *dbgname, bool quiet)
>> +				  const char *dbgname, bool quiet, phys_addr_t *psize)
> 
> size_t sounds like a better fit for psize...

I was trying to select between size_t and phys_addr_t, settling on the 
latter one because it is used for resource size.


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
