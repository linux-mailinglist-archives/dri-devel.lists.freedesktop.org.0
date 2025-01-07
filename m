Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C2A03CF6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 11:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D99610E3F7;
	Tue,  7 Jan 2025 10:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="cdP7ilIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC2810E3FC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 10:51:32 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5401be44b58so16343808e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 02:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736247030; x=1736851830;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JBvwPO7uMOawN7K708HQlElZF2GeKij7i1s54/VpKLc=;
 b=cdP7ilIaqDoPuPqMzvqmAUD/3L3Dg3IMqQuH2RB+OWS6DLWJJWlkgOi0am/e8qbqwy
 NePdc3mKldrG9yrMvEE/n0sDkDvZ9r5VoIYyWVHW+Pb1EsFRM0QO9uDdQfTYyDjqL7Ar
 0yvd1LB7Lm7JRkEIYUpgSTIH6dTdKr/vgXf6Kvp1y1iozB9tSJHqOKWoUgpc517i9iMK
 4omM4r15UdwUqeEshriw4RCIaudabwTlDlkebjBBMC1L5K6c8EijMqQT+RpbHwAuaBXi
 NgKXcitO5Q0q3rJMTgjKsOkizdK5x8AD8Sir44sCGZWvFIWnrLzHJEnNjzAFCBIMiISX
 kZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736247030; x=1736851830;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JBvwPO7uMOawN7K708HQlElZF2GeKij7i1s54/VpKLc=;
 b=KNiZEIpeM1xWWMlZ13Azm+6FB6DmWJlsh4njxSp5sohTlCf1eFzuLkHyPVveI9MYRl
 fwcMPtD7j1I7EXw+LTTIgQ2v+xCzI62sDPysbHozE8Xe2o1U3J4mxoe5x8nnP+J0fi3N
 NdME0XUFKyn5iAWQnpsu1AOQkreWQWkB74/yqMudx2St1Vyyf4yDQjIXMQ1AWmVQjD7I
 9B4ESaP1MSJQGupM2tha/EW6sgm/hQJC1wTChDLUNuE6Ted9fRUrNM2z9BbRs5a4YW/t
 hH+R5hMPyJLsiEZMKA8pu2AXM6+rY5U9Bw1+WCXPOYFOvMQYZBBial7tcuXEpCzcRusG
 fY1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlPLPLizVYzuvUxPFVuJYFqkWw+OFReTM63+gvYJPIRWxExdIlH7WvoStKOsbKtxceNeRowhvGt/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzULvt9dWOAhFjlH/6o36S8WUmnjUlZWppW2H0qZVLg3ew21N/M
 NW/xIhWpUNz2aH67ofNf9IpSmBxLBlugyT4Hj0vTgIcVtv21+PPf829A7CihtXPtt3er9N3an78
 HOAs=
X-Gm-Gg: ASbGncvPRhe3QcCHkRFx9NsLTeyH1y9o1RQmGfnVHmZ0nZJixE4N7q+BwVgw8oDLGWW
 1W3b5BNgaxNcuVjXy9CfdQkdlj/+FIQI9CSpgkuZ54KkYhVqg7okG49WY7QZWDxMySZpjn8CIo/
 N1RKuaJcBZrL22NRVZ3FE8mrovCm8+8VwDkZ25y7FjhFvDmdCb3bRIGcN3hXFCkqmmsilw6hpJ7
 Sqk/7y1873ZtYHWvjImCmt/7bKrVPLh9o3gvPj61QL/bOA1fdm5ZcgfPVt2pHcYw+pawKwD
X-Google-Smtp-Source: AGHT+IFG9ndcnZmaPryeFVAEaT7e8OE+j+/swO6098jqZEuPtknSWTu+gb1vbHX6ZmbX2bo+mdB/tw==
X-Received: by 2002:a05:600c:45cf:b0:434:fbd5:2f0a with SMTP id
 5b1f17b1804b1-43668642e7bmr539646015e9.9.1736246615171; 
 Tue, 07 Jan 2025 02:43:35 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b1143dsm624441675e9.18.2025.01.07.02.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 02:43:34 -0800 (PST)
Message-ID: <0f70fa7b-c6fa-4bb5-8f33-c40e9cfaaa80@ursulin.net>
Date: Tue, 7 Jan 2025 10:43:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
To: =?UTF-8?Q?Adri=C3=A1n_Mart=C3=ADnez_Larumbe?=
 <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-3-adrian.larumbe@collabora.com>
 <1ef1d07b-bfa9-4e52-bfa0-20f569752701@ursulin.net>
 <2sb72aco2lc5hlvwn7hpc5k27naep7u2s64lc6qzk4ruy6jkhd@c2dfhvhe76yt>
 <c76881d9-e7e4-48b3-904c-439ab28d9782@ursulin.net>
 <lzvil3iy7cq4t3kz3dl5g2j5n6lr4wd5qwtmqt2l2hwsqyzd3q@sumaho6upjvv>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <lzvil3iy7cq4t3kz3dl5g2j5n6lr4wd5qwtmqt2l2hwsqyzd3q@sumaho6upjvv>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/01/2025 16:53, Adrián Martínez Larumbe wrote:
> On 03.01.2025 10:49, Tvrtko Ursulin wrote:
>> On 02/01/2025 22:18, Adrián Martínez Larumbe wrote:
>>> On 02.01.2025 21:59, Tvrtko Ursulin wrote:
>>>>
>>>> On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
>>>>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>>>
>>>>> A previous commit enabled display of driver-internal kernel BO sizes
>>>>> through the device file's fdinfo interface.
>>>>>
>>>>> Expand the description of the relevant driver-specific key:value pairs
>>>>> with the definitions of the new drm-*-internal ones.
>>>>>
>>>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>>> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
>>>>> ---
>>>>>     Documentation/gpu/panthor.rst | 14 ++++++++++++++
>>>>>     1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
>>>>> index 3f8979fa2b86..23aa3d67c9d2 100644
>>>>> --- a/Documentation/gpu/panthor.rst
>>>>> +++ b/Documentation/gpu/panthor.rst
>>>>> @@ -26,6 +26,10 @@ the currently possible format options:
>>>>>          drm-cycles-panthor:     94439687187
>>>>>          drm-maxfreq-panthor:    1000000000 Hz
>>>>>          drm-curfreq-panthor:    1000000000 Hz
>>>>> +     drm-total-internal:     10396 KiB
>>>>> +     drm-shared-internal:    0
>>>>> +     drm-active-internal:    10396 KiB
>>>>> +     drm-resident-internal:  10396 KiB
>>>>>          drm-total-memory:       16480 KiB
>>>>>          drm-shared-memory:      0
>>>>>          drm-active-memory:      16200 KiB
>>>>> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>>>>>     Where `N` is a bit mask where cycle and timestamp sampling are respectively
>>>>>     enabled by the first and second bits.
>>>>> +
>>>>> +Possible `drm-*-internal` keys are: `total`, `active`, `resident` and `shared`.
>>>>> +These values convey the sizes of the internal driver-owned shmem BO's that
>>>>> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
>>>>> +sync object arrays and heap chunks. Because they are all allocated and pinned
>>>>> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
>>>>> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
>>>>> +VM's and groups currently being scheduled for execution by the GPU.
>>>>> +`drm-shared-internal` is unused at present, but in the future it might stand for
>>>>> +the size of executable FW regions, since they do not belong to an open file context.
>>>>
>>>> The description is way too specific, too tied to some of the implementations.
>>>
>>> These are panthor-specific key:value pairs. I was in the belief that drivers
>>> could define their own when it suits their interest beyond the DRM-wide ones
>>> defined in the drm-fdinfo spec.
>>>
>>>> I also don't remember that you ever explained why totting up the internal
>>>> objects into existing regions isn't good enough. I keep asking, you keep not
>>>> explaining. Or I missed your emails somehow.
>>>
>>> It's not that it's not good enough, but rather that it cannot be done in the
>>> current state of affairs. drm_show_memory_stats() defines its own
>>> drm_memory_stats struct as an automatic variable so we don't have access to it
>>> from anywhere else in the driver. In a previous revision of the patch series I
>>> had come up with a workaround that would let drivers pass a function pointer to
>>> drm_show_memory_stats() which would gather those numbers in a driver-specific
>>> way, but it didn't seem to get any traction.
>>
>> Side note - i915 and amdgpu manage to do it so it is not that it is not
>> possible.
>>
>>>> And you keep not copying me on the thread. Copying people who expressed
>>>> interest, gave past feedback, etc should be the norm.
>>>
>>> I did not CC you on this series because these are all panthor-specific changes
>>> which do not touch on any DRM fdinfo-wide code, and also because I didn't think
>>> that driver-specific key:value pairs needed the approval of the drm-fdinfo core
>>> maintainers.
>>
>> Ah my bad.. sorry! I saw drm-internal-* and did not spot it is actually *in*
>> panthor.rst. So I think you just need to rename those to panthor- prefix. Same
>> as amdgpu has its own private keys amd-evicted-vram etc.
> 
> This complicates things because that means I can no longer use
> drm_print_memory_stat(), since print_size() will prefix every single key with

Maybe you even shouldn't because it does not seem to fit that well? For 
instance you define total and resident must always match. And shared is 
unused. So why expose the duplicate keys to start with? You will not be 
able to change it later and keep userspace compatibility. And keys like 
shared "might be used for X in the future" is also not very useful. What 
does userspace do with those when parsing? It cannot make a decision.

> "drm-". But then not using print_size() means I'm giving up on the nice unit
> size selection loop, which I guess I could just copy and paste inside Panthor,
> but I do remember a recent patch series where the unit selection criteria
> changed slightly so wouldn't like to keep these manually sync'd.
> 
> There's also the thing that the units I'm displaying here match up nicely with
> those representing the size of DRM objects with a UM-facing handle, so crafting
> my own function to display these when the only difference is a single key prefix
> seems like an overkill. I guess drm_print_memory_stats() and the functions
> underneath should offer more flexibility, but I guess that's something that can
> be discussed in a later patch series.

What you describe here could be just some refactoring is needed rather 
than being a huge problem. Like export a new helper from the code which 
takes the prefix as argument.

> And then there's the following statement in Documentation/gpu/drm-usage-stats.rst:24:
> 
> "- All keys shall be prefixed with `drm-`."
> 
> It doesn't say Driver-specific keys should begin with the name of the driver. In
> fact, it seems neither AMD nor Intel drivers have theirs documented.
> 
> In light of all this, I'd much rather not modify the names of Panthor-specific
> fdinfo's internal memory keys.

Amdgpu indeed fails to document its specific keys but some lenience 
there since it predated the standardisation and a patch can be submitted 
to fix that. I've been making some changes too to make it use more of 
common keys and helpers.

No other drivers appear to have driver specific keys at this point. 
Which ones do you see on Intel side?

If indeed there are none then that leaves the question of what 
drm-usage-stats.rst means when it says:

- All keys shall be prefixed with `drm-`.

We could for instance clarify that applies to common keys and that the 
driver specific keys should use a different prefix.

To me it feels like doing that (clarifying documentation) and tweaking 
your series to add some core helpers you could use would lead to the 
better end result.

Regards,

Tvrtko

>>>> Until we can clarify the above points I don't think this can go in.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>
>>> Adrian Larumbe
> 
> Adrian Larumbe
