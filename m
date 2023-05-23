Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F470D4E4
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329AA10E3D4;
	Tue, 23 May 2023 07:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C00710E3C3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:26:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f3af4295ddso4555211e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684826760; x=1687418760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2RRVVPdjPYMfb5LcuanGe7TjuH1tUUrDPIxP2XvP3tA=;
 b=VxdO1IEXwTY19NdveTqoOqoPN2kVBbvrbAtZHLe9Bl4mBOxPAx7XZJJwDYNRL0X5IW
 iBgusAgLtC2smNj7dhlX7V2l5A/020ie7t4zHV9jBat7EwofssDrFXZfC2KgLE+RW+cK
 DQOqbFnNspx39Fq41qgAyFovhH/N7gYLJf580nB9Jalp3MWMc8MY2IADeqDSTodtxbdO
 YGO1jdCuy8D1W8wsrWxvSRnRao2cAoKFXUZ/3nuo8Bn9uoa3SJXY1/QaVuDN8RY0sUs8
 Y81ZzIt1Sc9gDMlUNhY4k4MDP9OKx7MBihCqdhx76wYkUY4RERyJBbMSbd95Bsu5GNcP
 26Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684826760; x=1687418760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2RRVVPdjPYMfb5LcuanGe7TjuH1tUUrDPIxP2XvP3tA=;
 b=d0LeZsvJN3hbobzGFBDHFWsb0FY1u88TESR4AXXAEg0usobodJpEe396q+5H5xrjBc
 Jduae9ABpyxtDknsnp65+aMkSTqGU6zuUZtjPXouxD2CRZBpipE8RiccBDppo2te4Tob
 RyxTODBzKItdvVD9eVe8Z/+c70rnKHGztMZhQ5r3foBRvim34jQcKFpa6LL1E6qg0gwl
 vj7yivXfFh18+tvYT/NWo9hvGVMGoKKkrLhsZgjusTXJPFR7cDFaF/+MT6hB9KfW/pjD
 0TSbReSeXdxXKwdtdkJqn4U/kFaFNCIAscnXSYbgB6N71pMLMOb3MWubNVjcFEw1/Muu
 NnJQ==
X-Gm-Message-State: AC+VfDxftsTql4nk3KtQbrmlZPdmR69NbeRiv9xCDFr5FK2VDgQtrOK/
 vXAErlTa3/nqQTJo79jV9fNOJA==
X-Google-Smtp-Source: ACHHUZ7tfwO1DEcx489zNOHBK5BZGEB7Xduxhi+LIoBu6F/UqYxbikP/4BneRmzO82Y5Vce/AGSXVQ==
X-Received: by 2002:ac2:544e:0:b0:4f2:6817:2379 with SMTP id
 d14-20020ac2544e000000b004f268172379mr3847395lfn.23.1684826760225; 
 Tue, 23 May 2023 00:26:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a2e6e17000000b002a9f1b23604sm1486280ljc.93.2023.05.23.00.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 00:25:59 -0700 (PDT)
Message-ID: <5bcfb2dd-5cf4-b4cb-414a-9f6ad3838d36@linaro.org>
Date: Tue, 23 May 2023 10:25:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [RFC PATCH v2 06/13] drm/msm/dpu: switch RM to use
 crtc_id rather than enc_id for allocation
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-7-dmitry.baryshkov@linaro.org>
 <29c1aa19-f1c7-4aff-0f48-b4e849547ebd@quicinc.com>
 <bf12ab07-4901-0a97-6e97-77d537a2cfe3@linaro.org>
 <266dcc31-18dc-10ad-6e2a-4e21239a74dc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <266dcc31-18dc-10ad-6e2a-4e21239a74dc@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 01:22, Abhinav Kumar wrote:
> Sorry for the delay, other topics delayed my response on this one.
> 
> On 5/18/2023 6:50 PM, Dmitry Baryshkov wrote:
>> On 19/05/2023 02:46, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>> Up to now the driver has been using encoder to allocate hardware
>>>> resources. Switch it to use CRTC id in preparation for the next step.
>>>>
>>>
>>> This decision to use encoder id instead of CRTC has been there 
>>> downstream for quite sometime. So most of the delay in reviewing this 
>>> series was trying to understand why we had this in the first place 
>>> and who knew that story.
>>>
>>> You are right that from the perspective of clone mode mapping 
>>> resources to CRTC is correct but using encoder id is what has been 
>>> working so far without too much difficulty with a little more 
>>> management  But another use-case can get simplified with this.
>>
>> Thank you for the historical perspective and for the feedback.
>>
>> I think that keeping resource allocation in dpu_encoder was required 
>> when INTF/WB themselves were allocated through the RM. However as 
>> INTF/WB blocks are now allocated in a static way, it doesn't make so 
>> much sense anymore.
>>
> 
> No, whether intf/wb block themselves are allocated through RM or not did 
> not really go into this. It was just about considering where all 
> hardware blocks make sense to be mapped : crtc or encoder. At the end, 
> considering the dsc, cwb and some more blocks encoder id was used.

Ack, thanks for the historical perspective. Didn't know that.

> 
>>>
>>> There is another angle to this. There are hardware blocks which can 
>>> do writeback and the physical display concurrently. We call it 
>>> concurrent writeback or CWB. This is present even on some of the 
>>> chipsets already supported upstream.
>>>
>>> Now, lets say we start a concurrent writeback session , in todays 
>>> code we will allocate the resources with the encoder id of the 
>>> writeback's encoder and the other physical display's encoder.
>>>
>>> When the session stops, we can just deallocate the resources of the 
>>> writeback encoder without touching the other encoder. So it will 
>>> become easier to just free up the resources mapped to the encoder.
>>
>> I have not looked into CWB programming. However from your description 
>> it would be as easy to do a full reallocation of the pipeline as just 
>> dropping the CWB/extra encoder. In fact this is what the driver was 
>> doing: in case of a modeset, drop all old resources and allocate full 
>> set of resources.
>>
> 
> Correct and the reason it was able to seamlessly drop all the old 
> resources was because of the encoder_id mapping, for the cwb use-case 
> using crtc id will not be so seamless to release the resources.

Can you please tell, why? At all the times we can drop all resources and 
then reacquire them. In the worst case it results in wasted time, but 
there should no be troubles doing this acquisition.

Also see below.	

>>> With clone mode implemented with CRTC id to map resources, we will 
>>> have to probably do some extra book-keeping to handle concurrent 
>>> writeback.
>>
>> Probably not much. We'd have to describe the topology/requirements and 
>> then pass that to RM. I have been waiting for this patchset (and up to 
>> some point the DSC/ctl) to be reviewed before finalizing/submitting 
>> the patches that rework the CTL interface to use this kind of data 
>> structure.
>>
> 
> There is some effort there from what I can see in the cwb case. I am 
> unable to visualize how your rework will help that case. If you want to 
> move this mapping to crtc id to that series to convince us how, then it 
> is a better fit for that series.

-ENOTFINISHED. Anyway, I think it is separate from the topology changes too.

> 
>>> Thats the use-case which gets impacted with this but for others, 
>>> there shouldnt be a major impact from what we see.
>>>
>>> That being said, what benefit are you seeing from making that change 
>>> now for this series? Why is it specifically needed for virtual planes?
>>>
>>> I see in the commit text that you have mentioned this is in 
>>> preparation for next step and next step talks about clone mode. But 
>>> clone mode is not there yet. So why this change now?
>>
>> There were several items that triggered this review.
>>
>> First thing first. Current design allocates resources from 
>> dpu_encoder_virt_atomic_check(), then in 
>> dpu_encoder_virt_atomic_mode_set() the driver has to poke manually in 
>> the cstate and fill CTL and LM. This kept on bugging me for some time. 
>> The encoder should not be poking into the CRTC state.
>>
> 
> Interesting point, but the DRM documentation seems to allow that and I 
> think now thats one of the positives to have things in encoder's atomic 
> check.
> 
> 803      * This callback is used to validate encoder state for atomic 
> drivers.
> 804      * Since the encoder is the object connecting the CRTC and 
> connector it
> 805      * gets passed both states, to be able to validate interactions and
> 806      * update the CRTC to match what the encoder needs for the 
> requested
> 807      * connector.
> 808      *
> 
> Encoder is the place where we have both the crtc and the connector state 
> being passed down to. the crtc's atomic check doesnt have the states of 
> encoder. So it just seems the encoder's atomic check is more centralized 
> for the entire pipeline.

First. Once [1] lands, the driver will not use connector state.

Regarding the encoder vs crtc state. Currently the CRTC's atomic_check() 
code can not influence resource allocation. Encoder's atomic_check() 
happens earlier. This results in code like msm_atomic_check().

If display resources are allocated from CRTC's atomic_check(), the 
mentioned function can go away by moving this check to 
dpu_crtc_atomic_check().

Last, but not least, let me point our the text you have quoted: "... 
update the CRTC to match what the encoder needs for the requested 
connector.". In our case the driver doesn't update the CRTC state 
according to the needs of the requested connector. Instead, it updates 
the CRTC state for what is needed for the CRTC. It is the CRTC itself 
who needs one or two LMs, not the connector.

[1] https://patchwork.freedesktop.org/series/117979/

> 
>> Then came the virtual planes. I think you'd agree that for the virtual 
>> planes we assign SSPPs to the CRTCs. My initial design kept enc_id for 
>> all the resources except the SSPP blocks (which were allocated per 
>> crtc_id). This was not perfect from the symmetry point of view.
>>
> 
> Yes for SSPPs, since they are connected to LMs and LM is mapped to CRTC 
> yes its right that it will be better of to map to CRTC , only if we 
> think about these two blocks in isolation. But if I would think that if 
> we want to validate the pipeline encoder is more central.

I don't agree here. Especially if we have cloned output (=CWB?) support.
There will be two encoders/bridge-chains/connectors being driven by a 
single CRTC. CRTC is the spider in the centre of the web with the 
threads going around to the connectors.

And this is pretty much supported by the fact that the encoder doesn't 
have its own atomic_state. IIRC, quite frequently encoder is just a shim 
between the CRTC and bridge-chain/connector.

>> Above all, filling the cstate in mode_set was too late for 
>> atomic_check to look into allocated LM to see if it supports 
>> MIXER_SOURCESPLIT or not. See dpu_plane_atomic_check().
>>
>> I started by moving the cstate filling from the 
>> dpu_encoder_virt_atomic_mode_set() to dpu_encoder_virt_atomic_check(). 
>> And then it just became natural to turn it to be CRTC-centric code. 
>> The encoder doesn't have to peek into CRTC state. CRTC/plane do not 
>> have to delay the checks becasuse the necessary data is provided by 
>> the other party at a later point.
>>
> 
> I agree that moving from mode_set() to atomic_check() for the cstate had 
> to be done. But like I wrote encoder being passed a crtc state is 
> exactly for this purpose as its central to crtc and connector.
> 
>>> Resource allocation is centered around LMs for the blocks we have 
>>> seen so far like LM, SSPP  but  ....
>>
>> And LM is a CRTC.
>>
>>> DSC is already an exception because in earlier chipsets we saw that 
>>> PP and DSC go together and cannot be muxed but later on that changed.
>>>
>>> Now, I have explained this case but I am not getting why we need to 
>>> make the change for this series. Is it absolutely necessary?
>>
>> Strictly, we don't. I can work around all the deficiencies of the 
>> current code. But it is more natural to do it now rather than later.
>>
> 
> Overall, like I wrote in my last response, I am not against the idea but 
> from your reasoning so far and from the responses i have given above, I 
> do not think that this series demands this change necessarily. I think 
> without this change, the virtual plane series itself is pretty small to 
> review and will be an easier task to land that first. We should deal 
> with it on a need basis rather than just deciding to use virtual planes 
> to make this design change.

To save time on arguing, I'll take a look at rebasing patches. Please 
continue review with patches 1,2,9-13.

> 
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  16 +--
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  10 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 119 
>>>> ++++++++++----------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  15 ++-
>>>>   4 files changed, 77 insertions(+), 83 deletions(-)
>>
>>
>> [trimmed the patch contents, it is not relevant to this discussion]
>>

-- 
With best wishes
Dmitry

