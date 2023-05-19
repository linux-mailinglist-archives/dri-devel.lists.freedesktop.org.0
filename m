Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761ED708D83
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 03:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BCD10E02D;
	Fri, 19 May 2023 01:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B230010E02D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 01:50:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f37b860173so3057209e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 18:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684461038; x=1687053038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3kqWUbGPuJ0AZnsNMjbaLKd3uApQBze4SHqNuyvJdyQ=;
 b=yvZyLvfZS/pHGHahyifTI5c5BBxiQt8RyEJtSap5tOmH7k4aVXJy7QQDsu/WAqUa2e
 xVWBkCu4mrHDAo0kazuFOrens2afKzYcbOhm4lz3J++NM6Gv3NoQir7dGWbLXZELlmVi
 GiwEXOksZ8uQQlHPhdkGXt36TEHpkXUeW+gC8eLaBzPm0smb0idm9iOljOcxJfqB/fee
 nsm2wpwI1aiyzsRL2lEbBh4lAui7s6g0zpbZi5E61NySOvUtyhROpQKZ/o27qKwjX3l0
 FfkV4pAQGJ6NUl3DqQd8kjEKg1RddzkvtmBH4dJaZZTyI4A8kLPf9cUztNVta5deN00E
 1GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684461038; x=1687053038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3kqWUbGPuJ0AZnsNMjbaLKd3uApQBze4SHqNuyvJdyQ=;
 b=UM4oadbsGAfiSV4mh3ZCLpmoNwY3OAGR4p2iZmWb8hj1ll4vtj046XTszUKGdg1XXK
 h7goSzH09REmSTligrX/Hz3ndfzzSQbfLR+OoIcgLp5E7CpQTZkN4ave7oTa6upW3KTK
 o+1ay9tFCfLo3tOxqVzC35DKGoQ6VBWkET9E3gpw6bEYuMg/wQNpL0NzGrcYJc/GJBel
 fEZ7h/wP41a97+v6e7Ivt1m5BW6bqODLfQe5zKEz3uO8T/5iI4DLPn0t2a5yHDX7aBqH
 GOpsjYTPYs/fqjLoCHPSMG1vYGrRO03jHP8lqk7gucyPNfh8qaIF3qRQcJvLqxhmNOie
 LqkA==
X-Gm-Message-State: AC+VfDznjac2yaaPw65EJeodURbmAdBgPvJRC/8/RH6QcJx8SlsmnL9d
 etUN9dMlU/ElzrBgA7Y0gKny2Q==
X-Google-Smtp-Source: ACHHUZ4mwgMlQysaPbVr5iKYTkt++zeFdUJl1i7RvxfQtZT6E/zKW9Gn2stBf2ud/UKNBv+/bGH6hg==
X-Received: by 2002:ac2:5297:0:b0:4f3:9f9b:ad09 with SMTP id
 q23-20020ac25297000000b004f39f9bad09mr198258lfm.38.1684461038575; 
 Thu, 18 May 2023 18:50:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac25e8f000000b004ec84d24818sm421493lfq.282.2023.05.18.18.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 18:50:38 -0700 (PDT)
Message-ID: <bf12ab07-4901-0a97-6e97-77d537a2cfe3@linaro.org>
Date: Fri, 19 May 2023 04:50:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v2 06/13] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-7-dmitry.baryshkov@linaro.org>
 <29c1aa19-f1c7-4aff-0f48-b4e849547ebd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <29c1aa19-f1c7-4aff-0f48-b4e849547ebd@quicinc.com>
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

On 19/05/2023 02:46, Abhinav Kumar wrote:
> 
> 
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>> Up to now the driver has been using encoder to allocate hardware
>> resources. Switch it to use CRTC id in preparation for the next step.
>>
> 
> This decision to use encoder id instead of CRTC has been there 
> downstream for quite sometime. So most of the delay in reviewing this 
> series was trying to understand why we had this in the first place and 
> who knew that story.
> 
> You are right that from the perspective of clone mode mapping resources 
> to CRTC is correct but using encoder id is what has been working so far 
> without too much difficulty with a little more management  But another 
> use-case can get simplified with this.

Thank you for the historical perspective and for the feedback.

I think that keeping resource allocation in dpu_encoder was required 
when INTF/WB themselves were allocated through the RM. However as 
INTF/WB blocks are now allocated in a static way, it doesn't make so 
much sense anymore.

> 
> There is another angle to this. There are hardware blocks which can do 
> writeback and the physical display concurrently. We call it concurrent 
> writeback or CWB. This is present even on some of the chipsets already 
> supported upstream.
> 
> Now, lets say we start a concurrent writeback session , in todays code 
> we will allocate the resources with the encoder id of the writeback's 
> encoder and the other physical display's encoder.
> 
> When the session stops, we can just deallocate the resources of the 
> writeback encoder without touching the other encoder. So it will become 
> easier to just free up the resources mapped to the encoder.

I have not looked into CWB programming. However from your description it 
would be as easy to do a full reallocation of the pipeline as just 
dropping the CWB/extra encoder. In fact this is what the driver was 
doing: in case of a modeset, drop all old resources and allocate full 
set of resources.

> With clone mode implemented with CRTC id to map resources, we will have 
> to probably do some extra book-keeping to handle concurrent writeback.

Probably not much. We'd have to describe the topology/requirements and 
then pass that to RM. I have been waiting for this patchset (and up to 
some point the DSC/ctl) to be reviewed before finalizing/submitting the 
patches that rework the CTL interface to use this kind of data structure.

> Thats the use-case which gets impacted with this but for others, there 
> shouldnt be a major impact from what we see.
> 
> That being said, what benefit are you seeing from making that change now 
> for this series? Why is it specifically needed for virtual planes?
> 
> I see in the commit text that you have mentioned this is in preparation 
> for next step and next step talks about clone mode. But clone mode is 
> not there yet. So why this change now?

There were several items that triggered this review.

First thing first. Current design allocates resources from 
dpu_encoder_virt_atomic_check(), then in 
dpu_encoder_virt_atomic_mode_set() the driver has to poke manually in 
the cstate and fill CTL and LM. This kept on bugging me for some time. 
The encoder should not be poking into the CRTC state.

Then came the virtual planes. I think you'd agree that for the virtual 
planes we assign SSPPs to the CRTCs. My initial design kept enc_id for 
all the resources except the SSPP blocks (which were allocated per 
crtc_id). This was not perfect from the symmetry point of view.

Above all, filling the cstate in mode_set was too late for atomic_check 
to look into allocated LM to see if it supports MIXER_SOURCESPLIT or 
not. See dpu_plane_atomic_check().

I started by moving the cstate filling from the 
dpu_encoder_virt_atomic_mode_set() to dpu_encoder_virt_atomic_check(). 
And then it just became natural to turn it to be CRTC-centric code. The 
encoder doesn't have to peek into CRTC state. CRTC/plane do not have to 
delay the checks becasuse the necessary data is provided by the other 
party at a later point.

> Resource allocation is centered around LMs for the blocks we have seen 
> so far like LM, SSPP  but  ....

And LM is a CRTC.

> DSC is already an exception because in earlier chipsets we saw that PP 
> and DSC go together and cannot be muxed but later on that changed.
> 
> Now, I have explained this case but I am not getting why we need to make 
> the change for this series. Is it absolutely necessary?

Strictly, we don't. I can work around all the deficiencies of the 
current code. But it is more natural to do it now rather than later.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  16 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  10 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 119 ++++++++++----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  15 ++-
>>   4 files changed, 77 insertions(+), 83 deletions(-)


[trimmed the patch contents, it is not relevant to this discussion]

-- 
With best wishes
Dmitry

