Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27146F759F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 21:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3A710E518;
	Thu,  4 May 2023 19:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011C110E513
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 19:59:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4edc114c716so1102569e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 12:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683230363; x=1685822363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KhLpJ+4XVYMTBbKU5i+ULfTcOdDtMfpoFQixhCU6m6w=;
 b=P1TaeZiy8dHyKAfQzKNATcoayZn7NA+JIEILyutmHhTCOn0eggaiZyVYj+Sp56HtrZ
 xtaSRn7tkCO71yqi3K2ljV77/9422akzHLrXDDiSukABH5+8VEOxkJnV2sRf3ZdB/S2i
 MKb9hIlcvGy0L0BFAuEqgETg2qWEQnt5AfsxAVD3FSpGmm45U0dE270MhBTv05beT2E6
 oH+sxJ4OiKwz4M1F3f6oWrzUJ17mm1/+iRgeYT23c8WEbVtqa+8LAeYADFFESSt3uTNy
 ltd7OUu96GFi5/Q/QjSvdzwBjccOWBOBKv0tEgl1mny4K8WQIawuJrmjRR+ks++yAqmy
 x+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683230363; x=1685822363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KhLpJ+4XVYMTBbKU5i+ULfTcOdDtMfpoFQixhCU6m6w=;
 b=TrT31lfL6QtSI7BFD5Po/qQwY+BfIThcNPMpKVY2t7O6v1BVor/9ofsPPKOfXHMzAF
 mwqRWMsGKfK26p3Lyryu+ulOxEDm7U63jfqjh0SoQAKwLVOXfKErCzu+6F3gdgTP3b9B
 nsIRNqFAK4CSF/KQWgfGmcrpWGkeYrU5NJXTSuU4wpJNXiDHYH+zuXp1LLxmYD4eHdGO
 osMaTg9frvyO9fOZk2sK5vAL8Q8NMOw2Sk1FIAoW0FbcJz77gAsdA1TPe7NHbroYxDWZ
 axrPLRFhJAqcJ1TO7iS8gBvfSKuylczADSR+/5t20BoUy9AXHKsPdefkbwP8ldwP0jXy
 AcKg==
X-Gm-Message-State: AC+VfDyKkBdc2DaWDFz0G9VTrdAfRtl2j6EVp27lwgFr/oFOBhTk4vaN
 +GswkAWGPn0P60CaUih7w15pew==
X-Google-Smtp-Source: ACHHUZ42P42FbCtfpSKN3KOROAYlmZPNwEI3F+cHVDekGGCUpP8K37i1bTQKHm0lbQ5uu6KwhWGzaQ==
X-Received: by 2002:a05:6512:964:b0:4d5:a689:7f9d with SMTP id
 v4-20020a056512096400b004d5a6897f9dmr1925019lft.57.1683230363234; 
 Thu, 04 May 2023 12:59:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 19-20020ac24853000000b004d887e0e9edsm482lfy.168.2023.05.04.12.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 12:59:22 -0700 (PDT)
Message-ID: <06864435-3db9-a91c-2e99-69829d8296b1@linaro.org>
Date: Thu, 4 May 2023 22:59:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK
 and PP_BLK_TE marcos
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
 <1683218805-23419-4-git-send-email-quic_khsieh@quicinc.com>
 <ljt5mp4ew5lcrrrdd7xyof3jv3friafbmr3im35ddwxjc42ekh@toez7xfdreg2>
 <CAA8EJpreM9i3DUp+93K7p14f_tNMy-m+C-WdyN5_drmmkGV66g@mail.gmail.com>
 <u7hlzltevx675gfg4w6emmeceo6nj76taqeecsor6iqsi3hmki@lg43y65m6chz>
 <11ef769a-5089-57d4-db87-4c5766d98206@quicinc.com>
 <6qg25ffuq6xcfz3vuqm5lguspihjospctjclxmwyu2ifau4p7b@txywjmir7lg5>
 <9011a078-9962-b3de-6427-b9114fcd0cf4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9011a078-9962-b3de-6427-b9114fcd0cf4@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2023 22:50, Abhinav Kumar wrote:
> 
> 
> On 5/4/2023 12:36 PM, Marijn Suijten wrote:
>> On 2023-05-04 11:25:44, Abhinav Kumar wrote:
>> <snip>
>>>> Sure, if you really prefer a split I'd go for two patches:
>>>> 1. Add the flag to the enum and catalog;
>>>> 2. Add the ops guard (functional change).
>>>>
>>>> Then don't forget to reword the commit message, following the 
>>>> guidelines
>>>> below and the suggestion for 2/7.
>>>>
>>>> - Marijn
>>>
>>> Plan sounds good to me.
>>>
>>> Marijn, we will wait for a couple of days to post the next rev but would
>>> be hard more than that as we need to pick up other things which are
>>> pending on top of this. Hence would appreciate if you can finish reviews
>>> by then.
>>
>> It depends on how many more revisions are needed after that, and not all
>> patches in this series have an r-b just yet.  Given the amount of review
>> comments that are still trickling in (also on patches that already have
>> maintainer r-b) I don't think we're quite there to start thinging about
>> picking this up in drm-msm just yet.  I doubt anyone wants a repeat of
>> the original DSC series, which went through many review rounds yet still
>> required multiple series of bugfixes (some of which were pointed out and
>> ignored in review) to be brought to a working state.  But the split
>> across topics per series already makes this a lot less likely, many
>> thanks for that.
>>
> 
> I think the outstanding comments shouldnt last more than 1-2 revs more 
> on this one as its mostly due to multiple patches on the list touching 
> catalog at the same time. I have been monitoring the comments closely 
> even though I dont respond to all of them.
> 
> One of the major reasons of the number of issues with DSC 1.1 was QC 
> didn't really have the devices or panels to support it. Thats why I 
> changed that this time around to take more control of validation of DSC 
> 1.2 and ofcourse decided to break up of series into the least amount of 
> functionality needed to keep the DPU driver intact.
> 
> All that being said, we still value your comments and would gladly wait 
> for a couple of days like I already wrote. But there are more 
> incremental series on top of this:
> 
> -> DSI changes for DSC 1.2
> -> proper teardown for DSC
> -> DSC pair allocation support
> -> DSC 1.2 over DP
> 
> We will be posting all of these within next couple of weeks on top of this.

I'd say, it's fine to post them now, as we have more or less agreed on 
the helper series. The interface between the series should be stable then.

The RM series is probably the one having bigger dependencies/conflicts 
on other pending patches (include virtual wide planes)

> 
>> In other words, let's take it slow and do things properly this time. And
>> who knows, perhaps the rest of these patches are more straightforward.
>>
> 
> Ack. the intent is always to do things right the first time.
> 
>> - Marijn
>>
>> <snip>

-- 
With best wishes
Dmitry

