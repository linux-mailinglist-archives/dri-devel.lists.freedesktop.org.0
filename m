Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B76A2CAA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 01:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D628810E643;
	Sun, 26 Feb 2023 00:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED77E10E2AB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 00:01:07 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id n2so3890455lfb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NjVLhBPAT9DIYkJC2epy3EtjhT3l2n1ZS1kPjCgoj6c=;
 b=U8VTd3FkrrdcsT34hgXS5PmfWsOfu9ktb8W1hVtaHF4ZGI7BACBfRTWF7wxn0MgREv
 88iSWDUNGSmY3ySUJN3B9eF76qv7b3ghfM8eFwXh9uvCT13VGOR+LjR3WiwvJ8I8egob
 tQzEUP3tP4+EPW0xIYMmaiagY7cKO6sqEcQ3fUEj2cjybei8Kjkcq/r2YX3tgLfrOChf
 UtZKWJhH+WdFSK6YhbZXNmQexMoyoi8mkPce/rmE9RR69fjBYPRp+NIEh8AWz2XAjyQv
 TvhmcP0w/zLx8F8A2kxW2fYavSXpo5GwSX2pXDM0cB9bQvuQS65vMjtFVIba5O82Qm/u
 wGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NjVLhBPAT9DIYkJC2epy3EtjhT3l2n1ZS1kPjCgoj6c=;
 b=QyJCQIAg/piXFP5yEk4JMDCbyflEHNP5bShNc/hfvcWFNWiamPNiofL/ZFntAXKfg1
 /IQas29dqqUbHtcb1DrviKcHLEj4TMn3DCH92MKILB09HCV5bIYxvBhAA7harPaSbL63
 ISWVyFt9AJdD2GQ3AvC6XY7J/JaPbFVcusuJ9Y4K1vhUJKYEprlxyN7OACewgsYne+Ec
 0uw90fgrljZZCjlrinx7yOzIn7xOm4EemqyVq4QVG9mZRnQm4+uOXsVEs9LQR++whMMf
 2iNV0FyKWZtk1S+R7YyFgWOPapn6e3CvmPhakvJH5/lF24lqYCF8qL8NTbPbF5bhJ5H1
 aX2Q==
X-Gm-Message-State: AO0yUKU0GFM3HswJ029BMcxi+mxFg4OhdAF9M7++WrU1r2212lyWGQY3
 3x1rGoDyNh7QofAclInHGMr9UQ==
X-Google-Smtp-Source: AK7set+4MeIHwpZRKccsb3cOrj9nC4Wv9xP7wm5S9x9GWXb79gLNJOLhPpqBe4Z3R/6ghV3Ee1ngbg==
X-Received: by 2002:ac2:547c:0:b0:4db:3605:9bd3 with SMTP id
 e28-20020ac2547c000000b004db36059bd3mr6691639lfn.17.1677369666174; 
 Sat, 25 Feb 2023 16:01:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g17-20020ac25391000000b004d6f86c52fcsm350033lfh.193.2023.02.25.16.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 16:01:05 -0800 (PST)
Message-ID: <eca8a9f2-3ae1-25ff-3305-329a6f8db344@linaro.org>
Date: Sun, 26 Feb 2023 02:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 10/50] drm/msm/dpu: correct sm6115 scaler
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-11-dmitry.baryshkov@linaro.org>
 <6a93947d-496f-1720-0bc6-f0dd86d2ea04@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6a93947d-496f-1720-0bc6-f0dd86d2ea04@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2023 01:11, Abhinav Kumar wrote:
> 
> 
> On 2/11/2023 3:12 PM, Dmitry Baryshkov wrote:
>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>> sm6115. Fix the used feature masks.
>>
>> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> 
> Fixes tag is wrong here. It should be
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on 
> SM6115")

Ack, you are correct here.

> 
> (please ignore the line break, I will fix it while applying)
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
> 
> Otherwise LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

