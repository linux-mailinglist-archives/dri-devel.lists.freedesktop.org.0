Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE618BB16B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 19:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35A911317A;
	Fri,  3 May 2024 17:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sFtADOpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A89113178;
 Fri,  3 May 2024 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W5VXEDo8Aepn5JuFIZuObXvwkeTfdfzi9G1CqSCo1Mk=; b=sFtADOpzRnND5YlZt5Tc8NJkkh
 cYAcebKR4MdIaolxRDKNvtJV23UDR8jC9CtGEfyJg9fOOf/FfCAYezPfM2b+L58QAygnT8R13l2ay
 nYVpMbVb+qFTkHW2SZJMfMME39Jh0hwBuq6SIuFgNZJHPNOtq2QU0lcrXtJB0guEz3jlzQ4tgt9qJ
 7E7hWz29kyk0UbxR32/4EbaIEHRAEbSNHBn3G4UZfKbQsOogfkVP85Kr2bmJoTWYa2Gui3slJ9jlu
 GVuky6s5bsTr8nOECHAnEeq1Ezu3bOhqP9UMatdQK4482ixd1uRD/U5Ar50ofRRn5SPOwk3LJ6nqf
 QJhRktQQ==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s2wMG-000CJj-9b; Fri, 03 May 2024 19:06:04 +0200
Message-ID: <4705c6e4-04e3-4f97-9f9a-629b6495e92a@igalia.com>
Date: Fri, 3 May 2024 18:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
Content-Language: en-GB
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
 <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
 <ZjUDsRIHHmJ0oM-1@phenom.ffwll.local>
 <CADnq5_Mp0y559dGHuK2HWJp_UuiknOhvQB90yw_tdOuo1eV8gQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CADnq5_Mp0y559dGHuK2HWJp_UuiknOhvQB90yw_tdOuo1eV8gQ@mail.gmail.com>
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


On 03/05/2024 16:58, Alex Deucher wrote:
> On Fri, May 3, 2024 at 11:33 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Fri, May 03, 2024 at 01:58:38PM +0100, Tvrtko Ursulin wrote:
>>>
>>> [And I forgot dri-devel.. doing well!]
>>>
>>> On 03/05/2024 13:40, Tvrtko Ursulin wrote:
>>>>
>>>> [Correcting Christian's email]
>>>>
>>>> On 03/05/2024 13:36, Tvrtko Ursulin wrote:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>
>>>>> Currently it is not well defined what is drm-memory- compared to other
>>>>> categories.
>>>>>
>>>>> In practice the only driver which emits these keys is amdgpu and in them
>>>>> exposes the total memory use (including shared).
>>>>>
>>>>> Document that drm-memory- and drm-total-memory- are aliases to
>>>>> prevent any
>>>>> confusion in the future.
>>>>>
>>>>> While at it also clarify that the reserved sub-string 'memory' refers to
>>>>> the memory region component.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Christian König <christian.keonig@amd.com>
>>>>
>>>> Mea culpa, I copied the mistake from
>>>> 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>>    Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
>>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst
>>>>> b/Documentation/gpu/drm-usage-stats.rst
>>>>> index 6dc299343b48..ef5c0a0aa477 100644
>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>>> @@ -128,7 +128,9 @@ Memory
>>>>>    Each possible memory type which can be used to store buffer
>>>>> objects by the
>>>>>    GPU in question shall be given a stable and unique name to be
>>>>> returned as the
>>>>> -string here.  The name "memory" is reserved to refer to normal
>>>>> system memory.
>>>>> +string here.
>>>>> +
>>>>> +The region name "memory" is reserved to refer to normal system memory.
>>>>>    Value shall reflect the amount of storage currently consumed by
>>>>> the buffer
>>>>>    objects belong to this client, in the respective memory region.
>>>>> @@ -136,6 +138,9 @@ objects belong to this client, in the respective
>>>>> memory region.
>>>>>    Default unit shall be bytes with optional unit specifiers of 'KiB'
>>>>> or 'MiB'
>>>>>    indicating kibi- or mebi-bytes.
>>>>> +This is an alias for drm-total-<region> and only one of the two
>>>>> should be
>>>>> +present.
>>
>> This feels a bit awkward and seems to needlessly complicate fdinfo uapi.
>>
>> - Could we just patch amdgpu to follow everyone else, and avoid the
>>    special case? If there's no tool that relies on the special amdgpu
>>    prefix then that would be a lot easier.
>>
>> - If that's not on the table, could we make everyone (with a suitable
>>    helper or something) just print both variants, so that we again have
>>    consisent fdinfo output? Or breaks that a different set of existing
>>    tools.
>>
>> - Finally maybe could we get away with fixing amd by adding the common
>>    format there, deprecating the old, fixing the tools that would break and
>>    then maybe if we're lucky, remove the old one from amdgpu in a year or
>>    so?
> 
> I'm not really understanding what amdgpu is doing wrong.  It seems to
> be following the documentation.  Is the idea that we would like to
> deprecate drm-memory-<region> in favor of drm-total-<region>?
> If that's the case, I think the 3rd option is probably the best.  We
> have a lot of tools and customers using this.  It would have also been
> nice to have "memory" in the string for the newer ones to avoid
> conflicts with other things that might be a total or shared in the
> future, but I guess that ship has sailed.  We should also note that
> drm-memory-<region> is deprecated.  While we are here, maybe we should
> clarify the semantics of resident, purgeable, and active.  For
> example, isn't resident just a duplicate of total?  If the memory was
> not resident, it would be in a different region.

Amdgpu isn't doing anything wrong. It just appears when the format was 
discussed no one noticed (me included) that the two keys are not clearly 
described. And it looks there also wasn't a plan to handle the uncelar 
duality in the future.

For me deprecating sounds fine, the 3rd option. I understand we would 
only make amdgpu emit both sets of keys and then remove drm-memory- in 
due time.

With regards to key naming, yeah, memory in the name would have been 
nice. We had a lot of discussion on this topic but ship has indeed 
sailed. It is probably workarble for anything new that might come to add 
their prefix. As long as it does not clash with the memory categories is 
should be fine.

In terms of resident semantics, think of it as VIRT vs RES in top(1). It 
is for drivers which allocate backing store lazily, on first use.

Purgeable is for drivers which have a form of MADV_DONTNEED ie. 
currently have backing store but userspace has indicated it can be 
dropped without preserving the content on memory pressure.

Active is when reservation object says there is activity on the buffer.

Regards,

Tvrtko

> 
> Alex
> 
>>
>> Uapi that's "either do $foo or on this one driver, do $bar" is just
>> guaranteed to fragement the ecosystem, so imo that should be the absolute
>> last resort.
>> -Sima
>>
>>>>> +
>>>>>    - drm-shared-<region>: <uint> [KiB|MiB]
>>>>>    The total size of buffers that are shared with another file (e.g.,
>>>>> have more
>>>>> @@ -145,6 +150,9 @@ than a single handle).
>>>>>    The total size of buffers that including shared and private memory.
>>>>> +This is an alias for drm-memory-<region> and only one of the two
>>>>> should be
>>>>> +present.
>>>>> +
>>>>>    - drm-resident-<region>: <uint> [KiB|MiB]
>>>>>    The total size of buffers that are resident in the specified region.
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
