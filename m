Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F22565970F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 11:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F83310E132;
	Fri, 30 Dec 2022 10:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA710E132
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/XXcsqpwwhzC7dXBuKnRV/g66zh19Xq0hf1OrfkeqS8=; b=UMpUouaYbyb6lFYmh/OQDwAWoM
 z/4Kej+eMAG6ox29+YT0uvZDThoK9B8F99YFJ+n2HNmAZKuL9DjKA9jQKHkRXs0tG/n1/yU/ud2zI
 q0xfsvK//rj6alYEdenP3OWbjVcTQverVSA1oLylSuExwD2GUiQgvEeRHqzL21bHCNMX28zkR2H54
 Fn/Lj9I7d08086BNegBI2vqxhButaW9+XoTwmV8Ez9bg/WWQ/bgwQ8F8UuMDp3QT3ZcFKDiVLHNVh
 cA62BwI7m5UF67tlE+z1pWKD4gpcEN3ikiaqcaufGkPosrY9+5o9G56c6+VbnVgJebp6I3u/97RQ8
 dZuyc4KA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pBCCa-00Gqsu-51; Fri, 30 Dec 2022 12:01:24 +0200
Message-ID: <65468c84-fc40-e4e1-0adb-ddfc23ec4fb9@kapsi.fi>
Date: Fri, 30 Dec 2022 12:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <Y6sn7XptKyk5cbrA@qemulion>
 <864f2fdd-4289-a178-bbf1-c2a6a579c58c@kapsi.fi> <Y6w/4IzoMFsVnCmu@qemulion>
 <280170a7-de12-f362-cda3-11208ead0a88@kapsi.fi>
 <20221230091501.GA1285371@linux.intel.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20221230091501.GA1285371@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: Deepak R Varma <drv@mailo.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/30/22 11:15, Stanislaw Gruszka wrote:
> On Wed, Dec 28, 2022 at 03:17:59PM +0200, Mikko Perttunen wrote:
>> On 12/28/22 15:08, Deepak R Varma wrote:
>>> On Wed, Dec 28, 2022 at 02:28:54PM +0200, Mikko Perttunen wrote:
>>>> On 12/27/22 19:14, Deepak R Varma wrote:
>>>>> kfree() & vfree() internally perform NULL check on the pointer handed
>>>>> to it and take no action if it indeed is NULL. Hence there is no need
>>>>> for a pre-check of the memory pointer before handing it to
>>>>> kfree()/vfree().
>>>>>
>>>>> Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
>>>>>
>>>>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>>>>> ---
>>>>>     drivers/gpu/drm/tegra/submit.c | 4 ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
>>>>> index 066f88564169..06f836db99d0 100644
>>>>> --- a/drivers/gpu/drm/tegra/submit.c
>>>>> +++ b/drivers/gpu/drm/tegra/submit.c
>>>>> @@ -680,8 +680,8 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
>>>>>     		kfree(job_data->used_mappings);
>>>>>     	}
>>>>>
>>>>> -	if (job_data)
>>>>> -		kfree(job_data);
>>>>> +	kfree(job_data);
>>>>> +
>>>>>     put_bo:
>>>>>     	gather_bo_put(&bo->base);
>>>>>     unlock:
>>>>> --
>>>>> 2.34.1
>>>>>
>>>>>
>>>>>
>>>>
>>>> It continues to be the case that I think this transform is bad. Same applies
>>>> to the host1x patch.
>>>
>>> Hello Mikko,
>>> Thank you for responding to the patch proposal. Could you please explain why is
>>> this bad?
>>>
>>> Regards,
>>> ./drv
>>>
>>>>
>>>> Mikko
>>>
>>>
>>
>> Hi,
>>
>> it gets rid of visual hints on code paths indicating the possible liveness
>> of pointer variables. I.e., after the change, whether the pointer can be
>> NULL or not is more difficult to reason about locally, instead requiring
>> more global reasoning which is mentally more taxing.
>>
>> Since C's type system doesn't help with tracking these kinds of things, I
>> believe it is important to have these kinds of local contextual cues to help
>> the programmer.
> 
> I agree with your point of view. But regarding this particular patch,
> at least on code base I can see, after free_job_data label job_done
> can not be NULL. So patch seems to be ok, but maybe changelog need to
> be different
> 
> Regards
> Stanislaw

It can be NULL; see:

         job->user_data = job_data;
         job->release = release_job;
         job->timeout = 10000;

         /*
          * job_data is now part of job reference counting, so don't release
          * it from here.
          */
         job_data = NULL;

If we go into free_job_data after this code (which happens if there is 
no error, or if host1x_job_submit fails), job_data will be NULL.

The memory is instead released in the 'put_job' label; host1x_job_put 
ends up calling release_job, which does the kfree.

(Yes, it is rather complicated..)

Thanks,
Mikko
