Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE94E20B6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 07:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F7210E1FD;
	Mon, 21 Mar 2022 06:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B8010E1FD;
 Mon, 21 Mar 2022 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647845604; x=1679381604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2Nzu/qZgFO4MPdAb5gqPGgcAwCbJfWVgAUzNwmPir+Y=;
 b=DhrSf6mf1LsVYK6PCkJYEC3SJH+M6PtjCa8sau5WSVvMMJU49Lhl4GyA
 9lLKLFFBFaMJXYlANKdnWznOw9nIiFlZizifsT9QZzbZuDezezn+6mX1p
 eEcFhrROH0svBfUYpk6atoF9TJNo2RVQMHPRKR+EkNn7sevMf9DHvWYq2
 pxhwtn2q3fQ/h8r0VuYkHIfIMPPSs+UfPBDHBDGYNIQw9JqgrbOxYDCO/
 Aa7RbHSbYnT2jDxkRlXb3iQVjy7+aBcg9KMywUYnuGzqgS229M4SEl+ty
 Y48MH9aA+qBniDQDTKYAHr2RJ4HZ/8p2JI5nW91Z8J3a4JtKvpmW3IYOn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257430229"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="257430229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:53:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="648452501"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.88])
 ([10.249.254.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:53:20 -0700
Message-ID: <13e7feb3-4a4b-aaf1-7b34-d8313edd8314@linux.intel.com>
Date: Mon, 21 Mar 2022 07:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] Small bar recovery vs compressed content on DG2
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 "Bloomfield, Jon" <jon.bloomfield@intel.com>,
 Kenneth W Graunke <kenneth.w.graunke@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
References: <162c1566-87c6-072f-d340-1693f6a71aea@linux.intel.com>
 <164750662822.7267.9355161518284202141@jlahtine-mobl.ger.corp.intel.com>
 <9eb06b576948707f9a0527b07b58b9640821bf19.camel@linux.intel.com>
 <d874ba08a65e4468baae737d826a85a5@intel.com>
 <ddd7af8f57320a7e2a84b3fdb94e3050eae81857.camel@linux.intel.com>
 <f80dc6ccf38343beb819e1584a9017f7@intel.com>
 <CAKMK7uGsCFJR2d-m0TsVjEy36bN1Z38fuoME6gezA9xY_MkSeA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAKMK7uGsCFJR2d-m0TsVjEy36bN1Z38fuoME6gezA9xY_MkSeA@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/18/22 19:12, Daniel Vetter wrote:
> Maybe also good to add dri-devel to these discussions.
>
> I'm not sure where exactly we landed with dgpu error capture (maybe I
> should check the code but it's really w/e here), but I think we can
> also toss in "you need a non-recoverable context for error capture to
> work on dgpu".

Error capture now works even with multiple pipelined migrations simply 
by looking at the vma_resource for the metadata snapshot when the 
request was queued instead of the vma for metadata, so no additional 
restrictions. (Also fixed up the gfp mode and completely avoided the 
contiguous allocations for the page directories).

> Since that simplifies things even more. Maybe Thomas
> forgot to add that to the list of restrictions.
>
> Anyway on the "we can't capture lmem-only compressed buffers", I think
> that's totally fine. Those are for render targets, and we don't
> capture those. Adding Lionel and Ken to confirm.
OK.
> -Daniel
>
> On Fri, 18 Mar 2022 at 17:26, Bloomfield, Jon <jon.bloomfield@intel.com> wrote:
>> @Thomas Hellström - I agree :-)
>>
>> My question was really to @Joonas Lahtinen, who was saying we could always migrate in the CPU fault handler. I am pushing back on that unless we have no choice. It's the very complication we were trying to avoid with the current SAS. If that's what's needed, then so be it. But I'm asking whether we can instead handle this specially, instead of adding generic complexity to the primary code paths.
>>
>> Jon
>>
>>> -----Original Message-----
>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Sent: Friday, March 18, 2022 2:48 AM
>>> To: Bloomfield, Jon <jon.bloomfield@intel.com>; Joonas Lahtinen
>>> <joonas.lahtinen@linux.intel.com>; Intel Graphics Development <intel-
>>> gfx@lists.freedesktop.org>; Auld, Matthew <matthew.auld@intel.com>; C,
>>> Ramalingam <ramalingam.c@intel.com>; Vetter, Daniel
>>> <daniel.vetter@intel.com>
>>> Subject: Re: Small bar recovery vs compressed content on DG2
>>>
>>> Hi,
>>>
>>> On Thu, 2022-03-17 at 18:21 +0000, Bloomfield, Jon wrote:
>>>> +@Vetter, Daniel
>>>>
>>>> Let's not start re-inventing this on the fly again. That's how we got
>>>> into trouble in the past. The SAS/Whitepaper does currently require
>>>> the SMEM+LMEM placement for mappable, for good reasons.
>>> Just to avoid any misunderstandings here:
>>>
>>> We have two hard requirements from Arch that clash, main problem is
>>> compressed bos can't be captured on error with current designs.
>>>
>>>  From an engineering point of view we can do little more than list
>>> options available to resolve this and whether they are hard or not so
>>> hard to implemement. But IMHO Arch needs to agree on what's got to
>>> give.
>>>
>>> Thanks,
>>> Thomas
>>>
>>>
>>>> We cannot 'always migrate to mappable in the fault handler'. Or at
>>>> least, this is not as trivial as it is to write in a sentence due to
>>>> the need to spill out other active objects, and all the usual
>>>> challenges with context synchronization etc. It is possible, perhaps
>>>> with a lot of care, but it is challenging to guarantee, easy to
>>>> break, and not needed for 99.9% of software. We are trying to
>>>> simplify our driver stack.
>>>>
>>>> If we need a special mechanism for debug, we should devise a special
>>>> mechanism, not throw out the general LMEM+SMEM requirement. Are
>>> there
>>>> any identified first-class clients that require such access, or is it
>>>> only debugging tools?
>>>>
>>>> If only debug, then why can't the tool use a copy engine submission
>>>> to access the data in place? Or perhaps a bespoke ioctl to access
>>>> this via the KMD (and kmd submitted copy-engine BB)?
>>>>
>>>> Thanks,
>>>>
>>>> Jon
>>>>
>>>>> -----Original Message-----
>>>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Sent: Thursday, March 17, 2022 2:35 AM
>>>>> To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Bloomfield,
>>>>> Jon
>>>>> <jon.bloomfield@intel.com>; Intel Graphics Development <intel-
>>>>> gfx@lists.freedesktop.org>; Auld, Matthew <matthew.auld@intel.com>;
>>>>> C,
>>>>> Ramalingam <ramalingam.c@intel.com>
>>>>> Subject: Re: Small bar recovery vs compressed content on DG2
>>>>>
>>>>> On Thu, 2022-03-17 at 10:43 +0200, Joonas Lahtinen wrote:
>>>>>> Quoting Thomas Hellström (2022-03-16 09:25:16)
>>>>>>> Hi!
>>>>>>>
>>>>>>> Do we somehow need to clarify in the headers the semantics for
>>>>>>> this?
>>>>>>>
>>>>>>>   From my understanding when discussing the CCS migration series
>>>>>>> with
>>>>>>> Ram, the kernel will never do any resolving (compressing /
>>>>>>> decompressing) migrations or evictions which basically implies
>>>>>>> the
>>>>>>> following:
>>>>>>>
>>>>>>> *) Compressed data must have LMEM only placement, otherwise the
>>>>> GPU
>>>>>>> would read garbage if accessing from SMEM.
>>>>>> This has always been the case, so it should be documented in the
>>>>>> uAPI
>>>>>> headers and kerneldocs.
>>>>>>
>>>>>>> *) Compressed data can't be assumed to be mappable by the CPU,
>>>>>>> because
>>>>>>> in order to ensure that on small BAR, the placement needs to be
>>>>>>> LMEM+SMEM.
>>>>>> Not strictly true, as we could always migrate to the mappable
>>>>>> region
>>>>>> in
>>>>>> the CPU fault handler. Will need the same set of tricks as with
>>>>>> limited
>>>>>> mappable GGTT in past.
>>>>> In addition to Matt's reply:
>>>>>
>>>>> Yes, if there is sufficient space. I'm not sure we want to
>>>>> complicate
>>>>> this to migrate only part of the buffer to mappable on a fault
>>>>> basis?
>>>>> Otherwise this is likely to fail.
>>>>>
>>>>> One option is to allow cpu-mapping from SYSTEM like TTM is doing
>>>>> for
>>>>> evicted buffers, even if SYSTEM is not in the placement list, and
>>>>> then
>>>>> migrate back to LMEM for gpu access.
>>>>>
>>>>> But can user-space even interpret the compressed data when CPU-
>>>>> mapping?
>>>>> without access to the CCS metadata?
>>>>>
>>>>>>> *) Neither can compressed data be part of a CAPTURE buffer,
>>>>>>> because
>>>>>>> that
>>>>>>> requires the data to be CPU-mappable.
>>>>>> Especially this will be too big of a limitation which we can't
>>>>>> really
>>>>>> afford
>>>>>> when it comes to debugging.
>>>>> Same here WRT user-space interpretation.
>>>>>
>>>>> This will become especially tricky on small BAR, because either we
>>>>> need
>>>>> to fit all compressed buffers in the mappable portion, or be able
>>>>> to
>>>>> blit the contents of the capture buffers from within the fence
>>>>> signalling critical section, which will require a lot of work I
>>>>> guess.
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>> Regards, Joonas
>>>>>>
>>>>>>> Are we (and user-mode drivers) OK with these restrictions, or
>>>>>>> do we
>>>>>>> need
>>>>>>> to rethink?
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Thomas
>>>>>>>
>>>>>>>
>
