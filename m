Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284EA76793A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 01:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D9110E7A6;
	Fri, 28 Jul 2023 23:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4405E10E7A6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 23:59:36 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99bccc9ec02so373647866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 16:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690588774; x=1691193574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9kqDR+gYxI0WrHXLyeEIAHFRT0r1ybmEtGMOrfNZ584=;
 b=Tc0wphbbxfm9O2B0ehlGXg4Xw4QqX4IOSagQYjNoN38Dowjt5CGj6XENdjXc2NBYM0
 pCo6O1I0+web9tC3/vquiqUAKICYZLIhz+18P9jGVd4/tSp3v2LMjilFSpo8M5e2Db59
 LZTCjgh4lPbuOsl/nTWwSn7PpnI2TFCZD9GtFYm/GzOIXhFoebTPCJ03y1vcKM7/ATBV
 1O+FTo2G0Pbl0aFe+juAjfN+IUrnTnYS609cF4ouzkDJYw974ZOXMhYaArKKETZAF6NB
 guQiELXSLn71F4DOGdwEEyZ581FzYQAznkVDeojK3D9lPl9n8Mr/TcmKciUGKoTeAiDy
 a2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690588774; x=1691193574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9kqDR+gYxI0WrHXLyeEIAHFRT0r1ybmEtGMOrfNZ584=;
 b=MMNuQJnzZc49T/X+bjGjDrvd0IKzvUHpSZ4Io65e3PNwcbd8+aSqYMO32w9x9gGXqS
 qootrgmLg5p6Q/jZfHlHhUIQs0NrM00IJ3DtV/x17TVpSmsGUuGVdH8zgd6o1BfGC5BQ
 p8aeLrIFPCnPHZe50VtWqXt33oJR8cpytRyR3Z9CRwb8xm0/lmjyswboDiAgDX/MgUqk
 xxU5w7tG5tCZnMpXksg5FMFqBY5D5+OclMyHMj44AEFn2P3moGqhEcOBPRgpoburI54J
 nd19YuL5cCLo0+lm/p3gi3fKUYsXfsTLtaOba4FPv3UIwOvzTvF7cLO36E6xvM6zrl4A
 X1aw==
X-Gm-Message-State: ABy/qLZC47gDOzgAN0k1OBkEA9MbV2+XzPLF+NXTVnjCTjaqhG3gdIrp
 PCbsng6J7s1MMqtkalmuENI/vg==
X-Google-Smtp-Source: APBJJlEIy2d3ZrA7+NcNoTs2/vz7hH8S6b+sy/peh9Yw91p+0JyXTHFn6ajEj8qf14VFxR+vX13AzQ==
X-Received: by 2002:a17:906:18:b0:99b:504d:d9c7 with SMTP id
 24-20020a170906001800b0099b504dd9c7mr669088eja.67.1690588774689; 
 Fri, 28 Jul 2023 16:59:34 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170906408700b0098de7d28c34sm2585366ejj.193.2023.07.28.16.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 16:59:34 -0700 (PDT)
Message-ID: <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
Date: Sat, 29 Jul 2023 02:59:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when
 supported by HW
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 23:03, Marijn Suijten wrote:
> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
>> Rather than checking for the flag, check for the presense of the
>> corresponding interrupt line.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> That's a smart use of the interrupt field.  I both like it, and I do
> not.  While we didn't do any validation for consistency previously, this
> means we now have multiple ways of controlling available "features":
> 
> - Feature flags on hardware blocks;
> - Presence of certain IRQs;
> - DPU core revision.

I hesitated here too. For INTF it is clear that there is no other good 
way to check for the TE feature. For PP we can just check for the DPU 
revision.

> 
> Maybe that is more confusing to follow?  Regardless of that I'm
> convinced that this patch does what it's supposed to and gets rid of
> some ambiguity.  Maybe a comment above the IF explaining the "PP TE"
> feature could alleviate the above concerns thoo.  Hence:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 9298c166b213..912a3bdf8ad4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>>   	c->idx = cfg->id;
>>   	c->caps = cfg;
>>   
>> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
>> +	if (cfg->intr_rdptr) {
>>   		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>   		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>>   		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

