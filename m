Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7F4D5148
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 19:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9FE10E42D;
	Thu, 10 Mar 2022 18:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BC310E423;
 Thu, 10 Mar 2022 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646937209; x=1678473209;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wsjvapr5yIahHs3tDFxuZjwkNwsgsnfLRY2K2pKkuhM=;
 b=P/WSYYBLzxW8sK4I5EAvyFD9eA0971f6jHMuq+uQ1YmV6naE6ERFyiKs
 PmM7cFN8TR23rcjLLdBb+Hd/8dJg3lE2YplpO6KiTelMqkuRjiiefs1iL
 5Pmzrb2effS7VnN933HLMIQO5kxz7KixviAPlPvwn4/f1N1kqJMkgftMF Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Mar 2022 10:33:27 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 10:33:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 10 Mar 2022 10:33:26 -0800
Received: from [10.110.35.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 10 Mar
 2022 10:33:25 -0800
Message-ID: <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
Date: Thu, 10 Mar 2022 10:33:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, "Sharma, Shashank"
 <shashank.sharma@amd.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/10/2022 9:40 AM, Rob Clark wrote:
> On Thu, Mar 10, 2022 at 9:19 AM Sharma, Shashank
> <shashank.sharma@amd.com> wrote:
>>
>>
>>
>> On 3/10/2022 6:10 PM, Rob Clark wrote:
>>> On Thu, Mar 10, 2022 at 8:21 AM Sharma, Shashank
>>> <shashank.sharma@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/10/2022 4:24 PM, Rob Clark wrote:
>>>>> On Thu, Mar 10, 2022 at 1:55 AM Christian König
>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> Am 09.03.22 um 19:12 schrieb Rob Clark:
>>>>>>> On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
>>>>>>> <contactshashanksharma@gmail.com> wrote:
>>>>>>>> From: Shashank Sharma <shashank.sharma@amd.com>
>>>>>>>>
>>>>>>>> This patch adds a new sysfs event, which will indicate
>>>>>>>> the userland about a GPU reset, and can also provide
>>>>>>>> some information like:
>>>>>>>> - process ID of the process involved with the GPU reset
>>>>>>>> - process name of the involved process
>>>>>>>> - the GPU status info (using flags)
>>>>>>>>
>>>>>>>> This patch also introduces the first flag of the flags
>>>>>>>> bitmap, which can be appended as and when required.
>>>>>>> Why invent something new, rather than using the already existing devcoredump?
>>>>>>
>>>>>> Yeah, that's a really valid question.
>>>>>>
>>>>>>> I don't think we need (or should encourage/allow) something drm
>>>>>>> specific when there is already an existing solution used by both drm
>>>>>>> and non-drm drivers.  Userspace should not have to learn to support
>>>>>>> yet another mechanism to do the same thing.
>>>>>>
>>>>>> Question is how is userspace notified about new available core dumps?
>>>>>
>>>>> I haven't looked into it too closely, as the CrOS userspace
>>>>> crash-reporter already had support for devcoredump, so it "just
>>>>> worked" out of the box[1].  I believe a udev event is what triggers
>>>>> the crash-reporter to go read the devcore dump out of sysfs.
>>>>
>>>> I had a quick look at the devcoredump code, and it doesn't look like
>>>> that is sending an event to the user, so we still need an event to
>>>> indicate a GPU reset.
>>>
>>> There definitely is an event to userspace, I suspect somewhere down
>>> the device_add() path?
>>>
>>
>> Let me check that out as well, hope that is not due to a driver-private
>> event for GPU reset, coz I think I have seen some of those in a few DRM
>> drivers.
>>
> 
> Definitely no driver private event for drm/msm .. I haven't dug
> through it all but this is the collector for devcoredump, triggered
> somehow via udev.  Most likely from event triggered by device_add()
> 
> https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/crash-reporter/udev_collector.cc

Yes, that is correct. the uevent for devcoredump is from device_add()

https://github.com/torvalds/linux/blob/master/drivers/base/core.c#L3340

> 
> BR,
> -R
