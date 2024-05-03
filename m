Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86B8BAE25
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDFF10FF8A;
	Fri,  3 May 2024 13:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gVR3UYBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E6910FF8A;
 Fri,  3 May 2024 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wAUAethpvBAW9bUj28ub4clrqxTLCy+9ZOCpM/HiZ8c=; b=gVR3UYBUGJsLR6H6U+VF74HBAL
 /qYsj2m/303tj4gwEOLmWRqcjnfS1ATSQwF/X+RPrv9iqLFA7ANhp6COf3GaYGlCW8YWj3fJ5Xc+m
 nDiNZQRWkmfbFWNBZoSiPHdFDNiUI8Jl/5gzTAOTQ9Ta046COh7G0o8uTvUwbiWx8RROMJ+FeppQa
 o8wCzTXkfmRNh0VD7+5/wWOFx7cwhdqjkytG/7k7pJpv22uh1ilRO2v4xmt2dm52XQF2l94PM9Siy
 wjdarYEi00Q7tonSjDvNJ/X/13vADDL+RykGWvZteZ4vYPTzyEkMhDE57sjjvIMWSYQjwHRwAvY4L
 XmVidCMw==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s2tNb-0008yk-Sc; Fri, 03 May 2024 15:55:16 +0200
Message-ID: <42b6c88b-c0aa-4a33-8e5f-bb9bfd181308@igalia.com>
Date: Fri, 3 May 2024 14:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
Content-Language: en-GB
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
 <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
 <CADnq5_NAO_Ao0EJTO=MJxvR-KJkF1WCwKGV-9ami7qQdzf029w@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CADnq5_NAO_Ao0EJTO=MJxvR-KJkF1WCwKGV-9ami7qQdzf029w@mail.gmail.com>
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


On 03/05/2024 14:39, Alex Deucher wrote:
> On Fri, May 3, 2024 at 8:58 AM Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>
>>
>> [And I forgot dri-devel.. doing well!]
>>
>> On 03/05/2024 13:40, Tvrtko Ursulin wrote:
>>>
>>> [Correcting Christian's email]
>>>
>>> On 03/05/2024 13:36, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Currently it is not well defined what is drm-memory- compared to other
>>>> categories.
>>>>
>>>> In practice the only driver which emits these keys is amdgpu and in them
>>>> exposes the total memory use (including shared).
>>>>
>>>> Document that drm-memory- and drm-total-memory- are aliases to prevent
>>>> any
>>>> confusion in the future.
>>>>
>>>> While at it also clarify that the reserved sub-string 'memory' refers to
>>>> the memory region component.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Christian König <christian.keonig@amd.com>
>>>
>>> Mea culpa, I copied the mistake from
>>> 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
>>>
> 
> I'm not following.  What is the mistake from that commit?

Just the spelling of Christian's last name in the email address, nothing 
in the code itself. I failed to spot both that when copying the email 
for git commit, and also failed to cc dri-devel so I am having a bad day.

Regards,

Tvrtko

> 
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst
>>>> b/Documentation/gpu/drm-usage-stats.rst
>>>> index 6dc299343b48..ef5c0a0aa477 100644
>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>> @@ -128,7 +128,9 @@ Memory
>>>>    Each possible memory type which can be used to store buffer objects
>>>> by the
>>>>    GPU in question shall be given a stable and unique name to be
>>>> returned as the
>>>> -string here.  The name "memory" is reserved to refer to normal system
>>>> memory.
>>>> +string here.
>>>> +
>>>> +The region name "memory" is reserved to refer to normal system memory.
> 
> Is this supposed to mean drm-memory-memory?  That was my impression,
> but that seems sort of weird.  Maybe we should just drop that
> sentence.
> 
> Alex
> 
>>>>    Value shall reflect the amount of storage currently consumed by the
>>>> buffer
>>>>    objects belong to this client, in the respective memory region.
>>>> @@ -136,6 +138,9 @@ objects belong to this client, in the respective
>>>> memory region.
>>>>    Default unit shall be bytes with optional unit specifiers of 'KiB'
>>>> or 'MiB'
>>>>    indicating kibi- or mebi-bytes.
>>>> +This is an alias for drm-total-<region> and only one of the two
>>>> should be
>>>> +present.
>>>> +
>>>>    - drm-shared-<region>: <uint> [KiB|MiB]
>>>>    The total size of buffers that are shared with another file (e.g.,
>>>> have more
>>>> @@ -145,6 +150,9 @@ than a single handle).
>>>>    The total size of buffers that including shared and private memory.
>>>> +This is an alias for drm-memory-<region> and only one of the two
>>>> should be
>>>> +present.
>>>> +
>>>>    - drm-resident-<region>: <uint> [KiB|MiB]
>>>>    The total size of buffers that are resident in the specified region.
