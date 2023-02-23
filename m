Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBBC6A04A3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 10:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2510310EAFD;
	Thu, 23 Feb 2023 09:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCC510EAEF;
 Thu, 23 Feb 2023 09:19:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso9391996wmq.0; 
 Thu, 23 Feb 2023 01:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aXb7GwfUN0cPM9ffS/TJOhN7coUOiUmAkZkN563cZ0A=;
 b=gV3Nvd/I3sLagNtoe/0Nixb+GwdroCY8lEBmFhyEcjhaUSbT1MEjcQh8FvqXLxuU1V
 88aqzk0OEArNRcvloLJBr5VvDZTR73SwtEpwh3tuxYARFyqfObt8DChHh4fnsb9qVj3c
 EbNVB1O87gI2d4wJwCI3MpuOz3i3e0iuCUSXh/EWYbHrhaVXGpWKJcsNowaZFHQS/a8/
 Rnw2npFalAOXK8yOWYfmjmPp97R5FiZGCCCWi1JUWoVfkT4Yo9Ug/hGphKZxXNGGCx0M
 Oq+KlketkfabePRdMX5ybr/+v1bXmHn5xwY4zg7LNhUUQE+0VcP0YEBVdzJhiBZxS54y
 qadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aXb7GwfUN0cPM9ffS/TJOhN7coUOiUmAkZkN563cZ0A=;
 b=VOz6o/m03GkUmRH6ogBSYZp/wsRsVlvxCSN2FxH+edGoE/QAZTJS6rD9M5f+NSTxyZ
 UwgivUzgY+1w0QAJ4t9g1s5rbhVJZ6JmIpsCTuownvE03RlSfc0r52G7ytgrDmecsH4U
 YfzCJcROSRvHToOOsnjQo93EyxfKfFxc0wNbIN/Ulfn4888jS18Sa3XarrE2p87yhY3z
 duVlMJcl5MaNoxKpq7504Td+DLswizmyDCDzagjqVbSaMbXRUhvvBH4KfzFr9x88FM0Q
 wCUslG15cusyj70o24X1lunRfQqx8PiQf/QhI9GR2SF2HqBx9maFmN28E5No78OGDTJS
 vDVw==
X-Gm-Message-State: AO0yUKXy1pzEeLjIOJi/19eK5J8crrVIZe8v54nu17pskwSM/wi4U3uw
 gupUMziBbQguu6Bz/nFtbkw=
X-Google-Smtp-Source: AK7set8Da8KLBgwP2TWYEXBmUT5TzKxe8bZF7sIVo4a4wryItNeUSucRY7Yf2Jh1alUa+EB0mBx+Xg==
X-Received: by 2002:a05:600c:2a08:b0:3dc:5deb:40a0 with SMTP id
 w8-20020a05600c2a0800b003dc5deb40a0mr8297512wme.8.1677143984188; 
 Thu, 23 Feb 2023 01:19:44 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c409200b003db06224953sm11610441wmh.41.2023.02.23.01.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 01:19:43 -0800 (PST)
Message-ID: <5e66efbf-b33b-a3a2-9723-ea2be30a567d@gmail.com>
Date: Thu, 23 Feb 2023 10:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 05/14] dma-buf/sync_file: Add SET_DEADLINE ioctl
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-6-robdclark@gmail.com>
 <37ec0125-8d0b-7d87-321d-ed4c7c7b32a7@amd.com>
 <CAF6AEGtAHXQ05tWoXdbx3_TK+11+XN6J9wuXssSh3PswUhvwgg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGtAHXQ05tWoXdbx3_TK+11+XN6J9wuXssSh3PswUhvwgg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.02.23 um 17:09 schrieb Rob Clark:
> On Mon, Feb 20, 2023 at 12:27 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 18.02.23 um 22:15 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> The initial purpose is for igt tests, but this would also be useful for
>>> compositors that wait until close to vblank deadline to make decisions
>>> about which frame to show.
>>>
>>> The igt tests can be found at:
>>>
>>> https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline
>>>
>>> v2: Clarify the timebase, add link to igt tests
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
>>>    include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
>>>    2 files changed, 41 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
>>> index af57799c86ce..fb6ca1032885 100644
>>> --- a/drivers/dma-buf/sync_file.c
>>> +++ b/drivers/dma-buf/sync_file.c
>>> @@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>>>        return ret;
>>>    }
>>>
>>> +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
>>> +                                     unsigned long arg)
>>> +{
>>> +     struct sync_set_deadline ts;
>>> +
>>> +     if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
>>> +             return -EFAULT;
>>> +
>>> +     if (ts.pad)
>>> +             return -EINVAL;
>>> +
>>> +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>    static long sync_file_ioctl(struct file *file, unsigned int cmd,
>>>                            unsigned long arg)
>>>    {
>>> @@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
>>>        case SYNC_IOC_FILE_INFO:
>>>                return sync_file_ioctl_fence_info(sync_file, arg);
>>>
>>> +     case SYNC_IOC_SET_DEADLINE:
>>> +             return sync_file_ioctl_set_deadline(sync_file, arg);
>>> +
>>>        default:
>>>                return -ENOTTY;
>>>        }
>>> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
>>> index ee2dcfb3d660..c8666580816f 100644
>>> --- a/include/uapi/linux/sync_file.h
>>> +++ b/include/uapi/linux/sync_file.h
>>> @@ -67,6 +67,20 @@ struct sync_file_info {
>>>        __u64   sync_fence_info;
>>>    };
>>>
>>> +/**
>>> + * struct sync_set_deadline - set a deadline on a fence
>>> + * @tv_sec:  seconds elapsed since epoch
>>> + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
>>> + * @pad:     must be zero
>>> + *
>>> + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
>>> + */
>>> +struct sync_set_deadline {
>>> +     __s64   tv_sec;
>>> +     __s32   tv_nsec;
>>> +     __u32   pad;
>> IIRC struct timespec defined this as time_t/long (which is horrible for
>> an UAPI because of the sizeof(long) dependency), one possible
>> alternative is to use 64bit nanoseconds from CLOCK_MONOTONIC (which is
>> essentially ktime).
>>
>> Not 100% sure if there is any preferences documented, but I think the
>> later might be better.
> The original thought is that this maps directly to clock_gettime()
> without extra conversion needed, and is similar to other pre-ktime_t
> UAPI.  But OTOH if userspace wants to add an offset, it is maybe
> better to convert completely to ns in userspace and use a u64 (as that
> is what ns_to_ktime() uses).. (and OFC whatever decision here also
> applies to the syncobj wait ioctls)
>
> I'm leaning towards u64 CLOCK_MONOTONIC ns if no one has a good
> argument against that.

+1 for that.

Regards,
Christian.

>
> BR,
> -R
>
>> Either way the patch is Acked-by: Christian König
>> <christian.koenig@amd.com> for this patch.
>>
>> Regards,
>> Christian.
>>
>>> +};
>>> +
>>>    #define SYNC_IOC_MAGIC              '>'
>>>
>>>    /**
>>> @@ -95,4 +109,12 @@ struct sync_file_info {
>>>     */
>>>    #define SYNC_IOC_FILE_INFO  _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
>>>
>>> +
>>> +/**
>>> + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
>>> + *
>>> + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
>>> + */
>>> +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
>>> +
>>>    #endif /* _UAPI_LINUX_SYNC_H */

