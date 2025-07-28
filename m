Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B0B13B6E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 15:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F3910E508;
	Mon, 28 Jul 2025 13:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A311C10E161;
 Mon, 28 Jul 2025 13:25:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F561516;
 Mon, 28 Jul 2025 06:25:23 -0700 (PDT)
Received: from [10.57.53.40] (unknown [10.57.53.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94C793F66E;
 Mon, 28 Jul 2025 06:25:27 -0700 (PDT)
Message-ID: <ce8b4bd9-5122-4b85-b605-a1bf10556208@arm.com>
Date: Mon, 28 Jul 2025 14:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
To: Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
 <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
 <DBNF8SZWLI79.1NRX9AMW5QW45@nvidia.com>
 <d0ffb55b-690a-4a65-98b5-b83adebfd88b@arm.com>
 <DBNNTU14VH90.25AZCJSVT4JDR@nvidia.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <DBNNTU14VH90.25AZCJSVT4JDR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 28/07/2025 12:43, Alexandre Courbot wrote:
> On Mon Jul 28, 2025 at 4:51 PM JST, Steven Price wrote:
>> On 28/07/2025 05:59, Alexandre Courbot wrote:
>>> Hi Daniel, thanks for the review!
>>>
>>> On Sat Jul 26, 2025 at 1:14 AM JST, Daniel Almeida wrote:
>>>> Hi Alex. Thank you and John for working on this in general. It will be useful
>>>> for the whole ecosystem! :) 
>>>>
>>>>> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>>>>
>>>>> From: John Hubbard <jhubbard@nvidia.com>
>>>>>
>>>>> There is only one top-level macro in this file at the moment, but the
>>>>> "macros.rs" file name allows for more. Change the wording so that it
>>>>> will remain valid even if additional macros are added to the file.
>>>>>
>>>>> Fix a couple of spelling errors and grammatical errors, and break up a
>>>>> run-on sentence, for clarity.
>>>>>
>>>>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>>> ---
>>>>> drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
>>>>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
>>>>> index cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661e038f4c9fd87d33f69a7 100644
>>>>> --- a/drivers/gpu/nova-core/regs/macros.rs
>>>>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>>>>> @@ -1,17 +1,17 @@
>>>>> // SPDX-License-Identifier: GPL-2.0
>>>>>
>>>>> -//! Macro to define register layout and accessors.
>>>>> +//! `register!` macro to define register layout and accessors.
>>>>
>>>> I would have kept this line as-is. Users will most likely know the name of the
>>>> macro already. At this point, they will be looking for what it does, so
>>>> mentioning "register" here is a bit redundant IMHO.
>>>>
>>>>> //!
>>>>> //! A single register typically includes several fields, which are accessed through a combination
>>>>> //! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
>>>>> //! not all possible field values are necessarily valid.
>>>>> //!
>>>>> -//! The macro in this module allow to define, using an intruitive and readable syntax, a dedicated
>>>>> -//! type for each register with its own field accessors that can return an error is a field's value
>>>>> -//! is invalid.
>>>>> +//! The `register!` macro in this module provides an intuitive and readable syntax for defining a
>>>>> +//! dedicated type for each register. Each such type comes with its own field accessors that can
>>>>> +//! return an error if a field's value is invalid.
>>>>>
>>>>> -/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
>>>>> -/// setter methods for its fields and methods to read and write it from an `Io` region.
>>>>> +/// Defines a dedicated type for a register with an absolute offset, including getter and setter
>>>>> +/// methods for its fields and methods to read and write it from an `Io` region.
>>>>
>>>> +cc Steven Price,
>>>>
>>>> Sorry for hijacking this patch, but I think that we should be more flexible and
>>>> allow for non-literal offsets in the macro.
>>>>
>>>> In Tyr, for example, some of the offsets need to be computed at runtime, i.e.:
>>>>
>>>> +pub(crate) struct AsRegister(usize);
>>>> +
>>>> +impl AsRegister {
>>>> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
>>>> +        if as_nr >= 32 {
>>>> +            Err(EINVAL)
>>>> +        } else {
>>>> +            Ok(AsRegister(mmu_as(as_nr) + offset))
>>>> +        }
>>>> +    }
>>>>
>>>> Or:
>>>>
>>>> +pub(crate) struct Doorbell(usize);
>>>> +
>>>> +impl Doorbell {
>>>> +    pub(crate) fn new(doorbell_id: usize) -> Self {
>>>> +        Doorbell(0x80000 + (doorbell_id * 0x10000))
>>>> +    }
>>>>
>>>> I don't think this will work with the current macro, JFYI.
>>>
>>> IIUC from the comments on the next patches, your need is covered with
>>> the relative and array registers definitions, is that correct?
>>
>> My Rust is somewhat shaky, but I believe "non-contiguous register 
>> arrays" will do what we want. Although I'll admit it would be neater for 
>> the likes of the AS registers if there was a way to define a "block" of 
>> registers and then use an array of blocks. Something vaguely like this 
>> (excuse the poor Rust):
>>
>> register_block!(MMU_AS_CONTROL @ 0x2400[16 ; 64], "MMU Address Space registers" {
>> 	register!(TRANSTAB @ 0x0000, "Translation table base address" {
>> 		31:0	base as u32;
>> 	});
>> 	register!(MEMATTR @ 0x0008, "Memory attributes" {
>> 		7:0	attr0 as u8;
>> 		7:0	attr1 as u8;
>> 		// ...
>> 	});
>> 	// More registers
>> });
> 
> I can think of two ways to achieve something similar using the current
> patchset:
> 
> - As you mentioned, a set of non-contiguous register arrays. This should
>   work rather well, as you could just do
>   `MMU_AS_CONTROL_MEMATTR::read(bar, 4)` to read the `MMU_AS_CONTROL_MEMATTR`
>   register of the 5th instance, with compile-time bound validation. It's
>   not what register arrays are for originally, but it does the job.

Sadly we generally don't want a compile time index - the whole point is
that each address space is functionally the same, so the index (address
space ID) is going to be dynamic in the code. The disadvantage here is
that every register access will involve a bounds check - the compiler
might be able to optimise but the code will still have to deal with a
potential error from every access.

> - As a set of relative offset registers sharing the same group. This is
>   more in line with the idea of a register block, but it also means that
>   each instance needs to have its own type declared, which is a bit
>   cumbersome but can be mitigated with a macro. More inconvenient if the
>   fact that you cannot address using a simple number anymore...

Yeah this does sound cumbersome. Would you end up with a macro
duplicating the code 16 times (once for each type of the 16 register
blocks) and hoping the compiler can optimise it all back together?

> The idea of register blocks is interesting. I wonder how that would
> translate in terms of access to invididual registers, i.e. does the
> block end up just being a prefix into the full register name, or is it
> something else? From your example declaration I picture that accesses
> would look something like `MMU_AS_CONTROL[4]::MEMATTR::read(bar)`, which
> ngl looks great, but I also cannot think of a construct that would allow
> such a syntax... Happy to think more about it though.

Yes, that is the sort of syntax I was imagining, although I was hoping
you could do something like:

  let as = MMU_AS_CONTROL[as_id]::try_get(&bar)?;

  let memattr = as.MEMATTR.read(&bar);
  memattr.set_attr0(3).write(&bar);
  as.TRANSTAB.write(&bar, 0x1000);

Which I'm sure shows how little Rust I've written, but hopefully you get
the idea - only the first line is a try_xxx which can fail and takes the
address space ID from a variable and bounds checks it. The other
accesses we already know the bounds so there's no need to deal with
failure, and we don't have to consider the situation where MEMATTR is
written but the TRANSTAB write fails (which couldn't actually happen
with non-contiguous register arrays but the compiler wouldn't be able to
tell).

[And of course having written the above I realise that MEMATTR being
split up as separate named fields is also broken - we want to generate
it by looping over the fields.]

Steve

