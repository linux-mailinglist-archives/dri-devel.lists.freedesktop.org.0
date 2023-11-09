Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A827E6AC3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 13:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1975910E0E5;
	Thu,  9 Nov 2023 12:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FD510E0E5;
 Thu,  9 Nov 2023 12:44:40 +0000 (UTC)
Received: from [100.116.205.35] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 20D4B66074AC;
 Thu,  9 Nov 2023 12:44:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699533878;
 bh=8aZTpXv059m0WrMHiogmcRnmZfrI6GVeXOICP1uiu9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VEvXfsptEeNlxrznjcN6qd8PPpdRNEa00wrYBn2Ei0vnA45ZKukRVQyOIsj0PNr4R
 yEZn5dWdD5Icfv7MxAnVeMlj9VQ2Sq6th9wSLHsEsmwcVM85lt9mdc774buWEHmzHa
 IZ4VosGckt6ADyTgdqq5pJWOlxP+GJvrfTstxlYQ8rSjoTdLk13MUOQ5ZrbcWrbrEV
 meI0y9vPbTVqjPfz4W9QTPmYkx72h/2a9SSI4ArRDz5nBU2dda63hC06933VRQzw4s
 O8GvtdTbpnKpiXOYAhym8YLmoSceiUEXmHR4xMYiWniGUguHr87ej0sC+g2tcgdXWi
 nk6pDvp8uXG+w==
Message-ID: <5c803b76-9baf-4328-9b64-7c7277fe987e@collabora.com>
Date: Thu, 9 Nov 2023 09:44:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/ci: Add support for SM8250 Gitlab Runner
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
 <0b0b1065-06e8-44ea-a4a1-395980afac5a@collabora.com>
 <f97c86a6-34d3-45e1-8673-8a3f02f88392@quicinc.com>
 <aa112fd1-478a-43b2-8e8f-cef72c930bb2@quicinc.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <aa112fd1-478a-43b2-8e8f-cef72c930bb2@quicinc.com>
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/11/2023 21:10, Jessica Zhang wrote:
> 
> 
> On 11/6/2023 9:35 AM, Jessica Zhang wrote:
>>
>>
>> On 11/4/2023 6:02 AM, Helen Koike wrote:
>>> Hi Jessica,
>>>
>>> On 10/10/2023 19:25, Jessica Zhang wrote:
>>>> Recently, we've registered a Gitlab runner for a Qualcomm RB5 device 
>>>> that will be
>>>> hosted and maintained in Qualcomm labs.
>>>>
>>>> This series will add a corresponding CI job for testing SM8250 
>>>> devices and add the
>>>> skip/fails/flakes list. We were able to complete a successful run 
>>>> [1] with these
>>>> changes.
>>>>
>>>> For now, we will keep the job as manual trigger only and drop that 
>>>> rule later
>>>> after we stabilize the tests.
>>>>
>>>> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/50092719
>>>>
>>>> ---
>>>
>>> Thank you for you patchset.
>>>
>>> I'm getting the following error:
>>>
>>> "serial.serialutil.SerialException: [Errno 2] could not open port 
>>> /dev/ttyUSB0: [Errno 2] No such file or directory: '/dev/ttyUSB0'"
>>>
>>> https://gitlab.freedesktop.org/helen.fornazier/linux/-/jobs/51193215#L146
>>>
>>> I'm wondering if I'm missing some configuration.
>>>
>>> I tested on top of drm-misc-next.
>>
>> Hi Helen,
>>
>> Sorry for the inconvenience, but I had to temporarily take down the 
>> runner last Friday to physically move the setup (as part of a 
>> reorganization of our lab here).
>>
>> I'll update this thread as soon as the runner is back up -- the move 
>> will be complete by the end of this week.
> The RB5 runner is back up -- please let me know if you run into any 
> issues with it.

It worked now, I runned on drm-tip-next, I got several UnexpectedPass, 
except for kms_color@ctm-green-to-red,Fail, could you check if those are 
flakes or things got fixed and we can remove them from -fails.txt?

https://gitlab.freedesktop.org/helen.fornazier/linux/-/jobs/51385345#L23356


Thanks!

Regards,
Helen

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>>
>>> Also, I'd like to add in the docs an entry about the devices we have, 
>>> which tag they need, which dts they correspond to, which farm they 
>>> are located, who to contact if there is any problem and maybe some 
>>> comment about the device (how it is hooked up, the logs comes from 
>>> uart or ssh, does it use fastboot, etc) if you find it useful.
>>> Would you mind adding an entry in the docs with this information for 
>>> the sm8250? (Than I'll add the info of the other devices after yours).
>>
>> Sure, sounds good.
>>
>>>
>>>
>>>> Jessica Zhang (3):
>>>>        drm/ci: Add SM8250 job to CI
>>>
>>> I would also move this patch to last, so we don't have a commit where 
>>> things shouldn't work properly.
>>> Or maybe squash them all.
>>
>> Acked -- I'll move this patch to the end.
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>> Regards,
>>> Helen
>>>
>>>>        drm/ci: enable CONFIG_INTERCONNECT_QCOM_SM8250 for arm64 config
>>>>        drm/ci: Add skips, fails and flakes for SM8250
>>>>
>>>>   drivers/gpu/drm/ci/arm64.config                 |  1 +
>>>>   drivers/gpu/drm/ci/build.sh                     |  1 +
>>>>   drivers/gpu/drm/ci/test.yml                     | 15 +++++++++++++
>>>>   drivers/gpu/drm/ci/xfails/msm-sm8250-fails.txt  | 29 
>>>> +++++++++++++++++++++++++
>>>>   drivers/gpu/drm/ci/xfails/msm-sm8250-flakes.txt |  3 +++
>>>>   drivers/gpu/drm/ci/xfails/msm-sm8250-skips.txt  |  8 +++++++
>>>>   6 files changed, 57 insertions(+)
>>>> ---
>>>> base-commit: dcd88f8c63341ed11a8c5019408f62202cd9d1f2
>>>> change-id: 20230919-rb5-runner-77ec32bd61e7
>>>>
>>>> Best regards,
