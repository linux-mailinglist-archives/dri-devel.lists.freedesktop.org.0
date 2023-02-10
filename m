Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4E8691FE4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 14:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C3610ED21;
	Fri, 10 Feb 2023 13:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B82C10ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 13:38:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ml19so16072142ejb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wGZBlKzLot5G5ZNAFR/UYoNjmgF3Zw9uLwSQvF6UL/U=;
 b=cXT/Vtv75lD9skK1aJ5+o49E0ZZUPsArbONjsgQKHHEtwHj1dHIuArOHqJsO82rGNG
 E57EUh4HRUG1qs4mhmkrjNwGxOcZqF54zwKrlVNylDqPVf3oSDgG+HoIfZBoR8bJixNe
 TmFiRTsXKAWe9S8LTM5KixcgeQNrPz5ZSsZiFCuU7PCXb1zALgEjUYBSkZO34rSVhAOF
 o4wFx06W9UyC8gCZU0hrARKbHGfjzK5uj/Q1zpG50uGQgllW89sRu/X/Ki+f+dMQoY9D
 iSGxhlhuUMzkVqVN4CfjGqzLwQ7Ebwe7sLFxVR/jrWD52tJa14I6gMfZEk+Nlevw4Lm5
 /Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wGZBlKzLot5G5ZNAFR/UYoNjmgF3Zw9uLwSQvF6UL/U=;
 b=GSI4N2AkMf9b9eE9vayxd1wx3DkT2DI3fbgMRUe8ACuiWSSTkqYb2tXIY2TXe+WKsc
 29UCjth2136IZHDERZRjYadtmqI+sVISsEkb0MAzpBy2Ctwt91LQ5pTRozW1oO7twVEH
 c6HKvoCPstluHkExT67Izm4ferXQJmUfXr9rOKUALKN36yv5EcUE4raibOFnmXGm0yar
 n3H/UbtBPh902yzIgf1dPKODvIaT3aYMPaHJHBXVijbfG1mCxrGueDGB/vAoGArF4+Xh
 RiaiwZkpem7newNTRXKRqwmWjKTfgEYcFmJJykuUQjJSK0IjL4QG74mTPuWJKCuSRqQW
 fHqQ==
X-Gm-Message-State: AO0yUKX0JOXWrZHnesSQpY+rIHT0c7i7TwQiVBwOIj5Ho44hug6MHbo+
 jSuJu0UFmbzYV2DPmsmJoae1BA==
X-Google-Smtp-Source: AK7set8Qz1WEv12T0wi17JGL89euHbN9k4j3kt4S2BuuPD2RzvuBGdp4+wNH9BkCuaXaA9tfsXfcJQ==
X-Received: by 2002:a17:906:3915:b0:87b:cdab:988e with SMTP id
 f21-20020a170906391500b0087bcdab988emr15043139eje.21.1676036315069; 
 Fri, 10 Feb 2023 05:38:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a170906271000b0073d796a1043sm2355762ejc.123.2023.02.10.05.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:38:34 -0800 (PST)
Message-ID: <7a00a42f-1345-ea89-0b62-6e27958ffddd@linaro.org>
Date: Fri, 10 Feb 2023 15:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2023 11:59, Marijn Suijten wrote:
> On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
>> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
>> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
>> planes). Correct corresponding SSPP declarations.
>>
>> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Cc: Jami Kettunen <jami.kettunen@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 0f3da480b066..ad0c55464154 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
>>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> 
> Drop the _CURSOR mask here?  And the double space....

As a second thought, I think I will keep the spacing in this patchset. I 
will clean up spacing during the hw catalog split.



-- 
With best wishes
Dmitry

