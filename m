Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6328D457
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 21:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4362F6E933;
	Tue, 13 Oct 2020 19:22:04 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D621D6E932
 for <dri-devel@freedesktop.org>; Tue, 13 Oct 2020 19:22:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602616922; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BLvUKsHh2gcPJXFOm+KsCsgg7j5b0BHxJ3Yy/jJ5lq4=;
 b=nD5SgdTh5lCrXn24tf5ZckcnO8GhLDLIMZgXZi71jCU2EGvyfEUiPdSyywKIQs63i4Y7ITL7
 NaXpdnu9JCEX+Izsad0MCbc5DYEmRky1fdfnYTpx+JfnFxHBdYapu4rQUBxLhj8UM1hjqwXX
 cMDQMRIFSDVc33yZK/hogK6tnyk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f85fe5abfed2afaa63b9ce2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 19:22:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 56BA0C433FE; Tue, 13 Oct 2020 19:22:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.180.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ACF5CC433F1;
 Tue, 13 Oct 2020 19:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACF5CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [2/2] drm/msm: Add support for GPU cooling
To: mka@chromium.org
References: <1602176947-17385-2-git-send-email-akhilpo@codeaurora.org>
 <20201009183640.GB1292413@google.com>
 <cab2105e-7a8c-988f-dcc1-056692a94e8b@codeaurora.org>
 <20201012174035.GA44627@google.com>
 <80ded484-a058-70fc-be9d-045be2933563@codeaurora.org>
 <20201013174038.GA424420@google.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <ae3ca3c7-fb80-e9fc-a76b-2add8969a178@codeaurora.org>
Date: Wed, 14 Oct 2020 00:51:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013174038.GA424420@google.com>
Content-Language: en-US
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/2020 11:10 PM, mka@chromium.org wrote:
> On Tue, Oct 13, 2020 at 07:23:34PM +0530, Akhil P Oommen wrote:
>> On 10/12/2020 11:10 PM, mka@chromium.org wrote:
>>> On Mon, Oct 12, 2020 at 07:03:51PM +0530, Akhil P Oommen wrote:
>>>> On 10/10/2020 12:06 AM, mka@chromium.org wrote:
>>>>> Hi Akhil,
>>>>>
>>>>> On Thu, Oct 08, 2020 at 10:39:07PM +0530, Akhil P Oommen wrote:
>>>>>> Register GPU as a devfreq cooling device so that it can be passively
>>>>>> cooled by the thermal framework.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/msm_gpu.c | 13 ++++++++++++-
>>>>>>     drivers/gpu/drm/msm/msm_gpu.h |  2 ++
>>>>>>     2 files changed, 14 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>>>>> index 55d1648..93ffd66 100644
>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>>>>> @@ -14,6 +14,7 @@
>>>>>>     #include <generated/utsrelease.h>
>>>>>>     #include <linux/string_helpers.h>
>>>>>>     #include <linux/devfreq.h>
>>>>>> +#include <linux/devfreq_cooling.h>
>>>>>>     #include <linux/devcoredump.h>
>>>>>>     #include <linux/sched/task.h>
>>>>>> @@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>>>>>>     	if (IS_ERR(gpu->devfreq.devfreq)) {
>>>>>>     		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
>>>>>>     		gpu->devfreq.devfreq = NULL;
>>>>>> +		return;
>>>>>>     	}
>>>>>>     	devfreq_suspend_device(gpu->devfreq.devfreq);
>>>>>> +
>>>>>> +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
>>>>>> +			gpu->devfreq.devfreq);
>>>>>> +	if (IS_ERR(gpu->cooling)) {
>>>>>> +		DRM_DEV_ERROR(&gpu->pdev->dev,
>>>>>> +				"Couldn't register GPU cooling device\n");
>>>>>> +		gpu->cooling = NULL;
>>>>>> +	}
>>>>>>     }
>>>>>>     static int enable_pwrrail(struct msm_gpu *gpu)
>>>>>> @@ -926,7 +936,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>>>     	msm_devfreq_init(gpu);
>>>>>> -
>> Will remove this unintended change.
>>>>>>     	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
>>>>>>     	if (gpu->aspace == NULL)
>>>>>> @@ -1005,4 +1014,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>>>>>>     		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
>>>>>>     		msm_gem_address_space_put(gpu->aspace);
>>>>>>     	}
>>>>>> +
>>>>>> +	devfreq_cooling_unregister(gpu->cooling);
>>>>>
>>>>> Resources should be released in reverse order, otherwise the cooling device
>>>>> could use resources that have already been freed.
>>>>> Why do you think this is not the correct order? If you are thinking
>>>> about devfreq struct, it is managed device resource.
>>>
>>> I did not check specifically if changing the frequency really uses any of the
>>> resources that are released previously, In any case it's not a good idea to
>>> allow other parts of the kernel to use a half initialized/torn down device.
>>> Even if it isn't a problem today someone could change the driver to use any
>>> of these resources (or add a new one) in a frequency change, without even
>>> thinking about the cooling device, just (rightfully) asuming that things are
>>> set up and torn down in a sane order.
>> 'sane order' relative to what specifically here? Should we worry about freq
>> change at this point because we have already disabled gpu runtime pm and
>> devfreq?
> 
> GPU runtime PM and the devfreq being disabled is not evident from the context
> of the function. You are probably right that it's not a problem in practice,
> but why give reason for doubts in the first place if this could be avoided
> by following a common practice?
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
Other option I see is to create a managed device resource (devm) version 
of the devfreq_cooling_register API and use that. Is that what you are 
trying to suggest?

-Akhil.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
