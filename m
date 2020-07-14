Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972721ECD6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 11:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88EA6E593;
	Tue, 14 Jul 2020 09:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE166E593;
 Tue, 14 Jul 2020 09:28:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f18so20459391wrs.0;
 Tue, 14 Jul 2020 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Yb6pOJywA24wMvEKXpudcS+IoJWPzT24gjxu1xfgKOs=;
 b=g9MDky5McmDDSf7HJNMqV9eaOvZdV6W+3rSpG9O2h5t/xEDltYJzR3v+J7M9I3nmjx
 Ah/2qj1wyzbfzPggNV6e//H1WuQh2mOXaELeAAzC4623ZGk+8o5btNM9THPxxkniw4uH
 tgXi07vN/VvbSJDUYEw2JO7zVegC96eZdqWaFLLnsncBuTDrOxdwxiL4NH2Yya4Q977x
 J0EKAmhbug5rxixS6hzI3baGTjXGL8E6cgkb0zT9p0RWPnsn6D/TVcSQLBfeJTTpjNP1
 uKRf9LcTS+oBAb3O5jw+VsliYY+Q8B5hqxbeYCAp1WztdWnRu34mZnfqGbFeK2QeYa1x
 YpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Yb6pOJywA24wMvEKXpudcS+IoJWPzT24gjxu1xfgKOs=;
 b=LfmqkgC8hB4leV6G+1v4CTtkWRcsxoxePOZ9sttwsFe0L7mnMDF0rPAjS5e1FJW+FG
 SbF9hJAYB9Y93/8OYY1zOQ+a6COMEhmH4Fj+nay0PK8RKAsgSu8/IoLp+EJVrR5Gtv8c
 CYU1PT8UF7PGWteqFEdAaJC6kdddcIvMR76NN0HHZayck80Ptz5N9Qqbdz/jSNhHfio2
 cmAnTbPPja+kDo7dS8SAn8AzagEXjm2u+saobbEe1RnCpdNYn16MksyqUhqhTFJyDb0D
 lAnkhU6OlgYvLCbkCcQBWpnyjJKuK4UOpjIBW+VFCoeKwjhz7zlm3cDqFjnapzen9bLE
 iaBw==
X-Gm-Message-State: AOAM531+U/ZnNjKnzwt+RqwMLLxJ+0Gh/0fkXQyPuCme433DcwY3zycw
 FBm2j7VGkz9kSCx3xEUQVQdMk9Hn
X-Google-Smtp-Source: ABdhPJz5dTrAlwHhGulVhPnVCJlU2RQAue3MD59DpOCPQSClrafY0ow167Yno90932GkJsWgjJPWBQ==
X-Received: by 2002:adf:fd8b:: with SMTP id d11mr4344446wrr.371.1594718893964; 
 Tue, 14 Jul 2020 02:28:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w14sm28064723wrt.55.2020.07.14.02.28.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jul 2020 02:28:13 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/amdkfd: Add IPC API
To: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
 <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
 <4245d340-f4f6-eeb5-40a6-3afd7754852c@amd.com>
 <CAPM=9tz3UC8VuP=n_OAF5LnAmXSVR32LztqeEWtssnodMj70dQ@mail.gmail.com>
 <20200714085850.GX3278063@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <97e221e7-ea50-a02d-0791-0555a256e374@gmail.com>
Date: Tue, 14 Jul 2020 11:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200714085850.GX3278063@phenom.ffwll.local>
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.20 um 10:58 schrieb Daniel Vetter:
> On Tue, Jul 14, 2020 at 02:26:36PM +1000, Dave Airlie wrote:
>> On Tue, 14 Jul 2020 at 14:09, Felix Kuehling <felix.kuehling@amd.com> wrote:
>>> Am 2020-07-13 um 11:28 p.m. schrieb Dave Airlie:
>>>> On Tue, 14 Jul 2020 at 13:14, Felix Kuehling <Felix.Kuehling@amd.com> wrote:
>>>>> This allows exporting and importing buffers. The API generates handles
>>>>> that can be used with the HIP IPC API, i.e. big numbers rather than
>>>>> file descriptors.
>>>> First up why? I get the how.
>>> The "why" is compatibility with HIP code ported from CUDA. The
>>> equivalent CUDA IPC API works with handles that can be communicated
>>> through e.g. a pipe or shared memory. You can't do that with file
>>> descriptors.
>> Okay that sort of useful information should definitely be in the patch
>> description.
>>
>>> https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html#group__CUDART__DEVICE_1g8a37f7dfafaca652391d0758b3667539
>>>
>>> https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html#group__CUDART__DEVICE_1g01050a29fefde385b1042081ada4cde9
>>>
>>>>> + * @share_handle is a 128 bit random number generated with
>>>>> + * @get_random_bytes. This number should be very hard to guess.
>>>>> + * Knowledge of the @share_handle implies authorization to access
>>>>> + * the shared memory. User mode should treat it like a secret key.
>>>>> + * It can be used to import this BO in a different process context
>>>>> + * for IPC buffer sharing. The handle will be valid as long as the
>>>>> + * underlying BO exists. If the same BO is exported multiple times,
>>>> Do we have any examples of any APIs in the kernel that operate like
>>>> this? That don't at least layer some sort of file permissions  and
>>>> access control on top?
>>> SystemV shared memory APIs (shmget, shmat) work similarly. There are
>>> some permissions that can be specified by the exporter in shmget.
>>> However, the handles are just numbers and much easier to guess (they are
>>> 32-bit integers). The most restrictive permissions would allow only the
>>> exporting UID to attach to the shared memory segment.
>>>
>>> I think DRM flink works similarly as well, with a global name IDR used
>>> for looking up GEM objects using global object names.
>> flink is why I asked, because flink was a mistake and not one I'd care
>> to make again.
>> shm is horrible also, but at least has some permissions on what users
>> can attack it.
> Yeah this smells way too much like flink. I had the same reaction, and
> kinda sad that we have to do this because nvidia defines how this works
> with 0 input from anyone else. Oh well, the world sucks.
>
>>>> The reason fd's are good is that combined with unix sockets, you can't
>>>> sniff it, you can't ptrace a process and find it, you can't write it
>>>> out in a coredump and have someone access it later.
>>> Arguably ptrace and core dumps give you access to all the memory
>>> contents already. So you don't need the shared memory handle to access
>>> memory in that case.
>> core dumps might not dump this memory though, but yeah ptrace would
>> likely already mean you have access.
>>
>>>> Maybe someone who knows security can ack merging this sort of uAPI
>>>> design, I'm not confident in what it's doing is in any ways a good
>>>> idea. I might have to ask some people to take a closer look.
>>> Please do. We have tried to make this API as secure as possible within
>>> the constraints of the user mode API we needed to implement.
>> I'll see if I hear back, but also if danvet has any input like I
>> suppose it's UUID based buffer access, so maybe 128-bit is enough and
>> you have enough entropy not to create anything insanely predictable.
> So one idea that crossed my mind is if we don't want to do this as a
> generic dma-buf handle converter.
>
> Something like /dev/dri/cuda_is_nasty (maybe slightly nicer name) which
> provides a generic dma-buf <-> cuda uuid converter. With separate access
> restrictions, so admins can decide whether they want to allow this
> silliness, or not. Anyone else who wants to reimplement cuda will need
> this too, so that's another reason for splitting this out.
>
> Wrt security: I think assuming that there's none and the lookup has a
> side-channel you can use to efficiently scan the entire range is probably
> the safe approach here. This is way out of my league, but I think people
> who know how to do this won't have a much harder time scanning this than
> the flink space.
>
> Also, if we have one common uuid->dma-buf converter, we might actually
> have a chance to proof the "it's not secure" assumption wrong. Also, we
> might be able to tie this into cgroups or namespaces or similar that way.
>
> Just some thoughts to give my initial "eek, why this" reaction a bit more
> substance :-) No idea whether this would work or make more sense.

Yeah, my initial reaction was the same. On the pro side is that we use 
more than the 32bits flink did as identifier.


What we could maybe do to improve this is to link DMA-buf file 
descriptors into the file system from userspace. And then we could just 
do something like:

open("/tmp/dma-buf-0x0123-4567-89AB-CDEF-0123-4567-89AB-CDEF", "rw");

But to be honest I don't really know the fs code that well enough to 
judge if this is possible or not.


Or we let DMA-bufs appear under some directory of /sys by their name so 
that applications can open and use them.

Regards,
Christian.

>
> Cheers, Daniel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
