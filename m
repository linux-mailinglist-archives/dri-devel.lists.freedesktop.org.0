Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A268D4CE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B6B10E4C7;
	Tue,  7 Feb 2023 10:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F12B10E4C7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675767019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWccwJILvPfir6IoRku7EfqJmuwZVLGK2lUu+Ccdb5Y=;
 b=TYQ/kjZXyWyg2n/I2gj+nNPcXjw8Y1OKtGvHK3T9WpEFn6P2WCGlgOojKA43AfhvddUpxu
 TJhjm0CcL/4MgVu9OYFJVa7pL65d7dcj7N4gpIsqSLGKErdjtSPjmsZsBw9hwKa+WSih8i
 96zAHDI+6JLagKbYkEF42/6SdjH9DUw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-BlWCAZkENc2KoBxnjbBCCg-1; Tue, 07 Feb 2023 05:50:17 -0500
X-MC-Unique: BlWCAZkENc2KoBxnjbBCCg-1
Received: by mail-ed1-f70.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso9796411edd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 02:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gWccwJILvPfir6IoRku7EfqJmuwZVLGK2lUu+Ccdb5Y=;
 b=gBU0fs8u52qHizLP6WFqQnzB3Gn13TBxWdJO9zEvJ3v4gPuF6awxnTM08zzBLeA7uU
 LoWgTOyZWDyvO92x69qYSaaTPyrTAVEZ2fThX2SYXO9EZG4h/JnjMHsrth/C4hZky3sE
 RPMi7osagj9PHErveaHdxdK+mslxBdN90BwCvOuyjL5h1uYdOldUuY6cak42UsQiD+SH
 0c5w/vqlCs6kFXVj/TgFx2MtZX7A++ukhXWBvzD2M8YpzYEAr9qRBwaJbflX/VZ3KhGc
 Mfn6BLaXT/EZwNXbldj6G2QMYUHSh1To45nciLmhc9Bl9yX7VLDoKck08LaUKCWaNhw/
 5IHw==
X-Gm-Message-State: AO0yUKVqZjt6xv6BT4EZQF/UFWrF+z/re4umpUhewSUnCCSbUPhC+O8a
 94xGJh2uk00w8mxteuoLvwCHKHNf4BkNffCnjShUKnvZu3VXPJrVTwLHr4umoOvyw90scdJo3Ys
 0a1/uGMWVaz/bJMt6zT84g5Okc5E0
X-Received: by 2002:a17:906:f253:b0:88f:8c13:52ba with SMTP id
 gy19-20020a170906f25300b0088f8c1352bamr3157346ejb.48.1675767016374; 
 Tue, 07 Feb 2023 02:50:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9oW8U930FGBTV8niNO+uHiUUmonlSEzr9xcfkIrG51boczPSjNCISgwtjiF9d6Q0UULEduHA==
X-Received: by 2002:a17:906:f253:b0:88f:8c13:52ba with SMTP id
 gy19-20020a170906f25300b0088f8c1352bamr3157328ejb.48.1675767016165; 
 Tue, 07 Feb 2023 02:50:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a170906264c00b00878769f1e6bsm6694723ejc.55.2023.02.07.02.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:50:15 -0800 (PST)
Message-ID: <69e87e6a-7e6a-7b8d-c877-739be9cba0a1@redhat.com>
Date: Tue, 7 Feb 2023 11:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
 <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
 <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
 <4439c44b-cbd0-7160-da3d-e78f6aeeec77@redhat.com>
 <85548cd2-1bea-3c04-40b9-9abb03cb57b3@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <85548cd2-1bea-3c04-40b9-9abb03cb57b3@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/7/23 10:35, Christian König wrote:
> Am 06.02.23 um 19:20 schrieb Danilo Krummrich:
>> On 2/6/23 17:14, Christian König wrote:
>>> Concentrating this discussion on a very big misunderstanding first.
>>>
>>> Am 06.02.23 um 14:27 schrieb Danilo Krummrich:
>>>> [SNIP]
>>>> My understanding is that userspace is fully responsible on the parts 
>>>> of the GPU VA space it owns. This means that userspace needs to take 
>>>> care to *not* ask the kernel to modify mappings that are in use 
>>>> currently.
>>>
>>> This is a completely wrong assumption! Take a look at what games like 
>>> Forza Horizzon are doing.
>>>
>>> Basically that game allocates a very big sparse area and fills it 
>>> with pages from BOs while shaders are accessing it. And yes, as far 
>>> as I know this is completely valid behavior.
>>
>> I also think this is valid behavior. That's not the problem I'm trying 
>> to describe. In this case userspace modifies the VA space 
>> *intentionally* while shaders are accessing it, because it knows that 
>> the shaders can deal with reading 0s.
> 
> No, it's perfectly valid for userspace to modify the VA space even if 
> shaders are not supposed to deal with reading 0s.
> 
>>
>>
>> Just to have it all in place, the example I gave was:
>>  - two virtually contiguous buffers A and B
>>  - binding 1 mapped to A with BO offset 0
>>  - binding 2 mapped to B with BO offset length(A)
>>
>> What I did not mention both A and B aren't sparse buffers in this 
>> example, although it probably doesn't matter too much.
>>
>> Since the conditions to do so are given, we merge binding 1 and 
>> binding 2 right at the time when binding 2 is requested. To do so a 
>> driver might unmap binding 1 for a very short period of time (e.g. to 
>> (re-)map the freshly merged binding with a different page size if 
>> possible).
> 
> Nope, that's not correct handling.

I agree, and that's exactly what I'm trying to say. However, I start 
noticing that this is not correct if it happens within the same buffer 
as well.

> 
>>
>> From userspace perspective buffer A is ready to use before applying 
>> binding 2 to buffer B, hence it would be illegal to touch binding 1 
>> again when userspace asks the kernel to map binding 2 to buffer B.
>>
>> Besides that I think there is no point in merging between buffers 
>> anyway because we'd end up splitting such a merged mapping anyway 
>> later on when one of the two buffers is destroyed.
>>
>> Also, I think the same applies to sparse buffers as well, a mapping 
>> within A isn't expected to be re-mapped just because something is 
>> mapped to B.
>>
>> However, in this context I start wondering if re-mapping in the 
>> context of merge and split is allowed at all, even within the same 
>> sparse buffer (and even with a separate page table for sparse mappings 
>> as described in my last mail; shaders would never fault).
> 
> See, your assumption is that userspace/applications don't modify the VA 
> space intentionally while the GPU is accessing it is just bluntly 
> speaking incorrect.
> 

I don't assume that. The opposite is the case. My assumption is that 
it's always OK for userspace to intentionally modify the VA space.

However, I also assumed that if userspace asks for e.g. a new mapping 
within a certain buffer it is OK for the kernel to apply further changes 
(e.g. re-organize PTs to split or merge) to the VA space of which 
userspace isn't aware of. At least as long as they happen within the 
bounds of this particular buffer, but not for other buffers.

I think the reasoning I had in mind was that I thought if userspace asks 
for any modification of a given portion of the VA space (that is a 
VKBuffer) userspace must assume that until this modification (e.g. 
re-organization of PTs) is complete reading 0s intermediately may 
happen. This seems to be clearly wrong.

> When you have a VA address which is mapped to buffer A and accessed by 
> some GPU shaders it is perfectly valid for the application to say "map 
> it again to the same buffer A".
> 
> It is also perfectly valid for an application to re-map this region to a 
> different buffer B, it's just not defined when the access then transits 
> from A to B. (AFAIK this is currently worked on in a new specification).
> 
> So when your page table updates result in the shader to intermediately 
> get 0s in return, because you change the underlying mapping you simply 
> have some implementation bug in Nouveau.

Luckily that's not the case (anymore).

> 
> I don't know how Nvidia hw handles this, and yes it's quite complicated 
> on AMD hw as well because our TLBs are not really made for this use 
> case, but I'm 100% sure that this is possible since it is still part of 
> some of the specifications (mostly Vulkan I think).
> 
> To sum it up as far as I can see by giving the regions to the kernel is 
> not something you would want for Nouveau either.

If, as it turns out, it's also not allowed to do what I described above 
within the same VKBuffer, I agree the bounds aren't needed for merging.

However, I still don't see why we would want to merge over buffer 
boundaries, because ultimately we'll end up splitting such a merged 
mapping later on anyway once one of the buffers is destroyed.

Also, as explained in one of the previous mails in nouveau we can have 
separate PTs for sparse mappings with large page sizes and separate PTs 
for memory backed mappings with smaller page sizes overlaying them. 
Hence, I need to track a single sparse mapping per buffer spanning the 
whole buffer (which I do with a region) and the actual memory backed 
mappings within the same range.

Now, this might or might not be unique for Nvidia hardware. If nouveau 
would be the only potential user, plus we don't care about potentially 
merging mappings over buffer boundaries and hence producing foreseeable 
splits of those merged mappings, we could get rid of regions entirely.

> 
> Regards,
> Christian.
> 
> 
>>
>>>
>>> So you need to be able to handle this case anyway and the approach 
>>> with the regions won't help you at all preventing that.
>>>
>>> Regards,
>>> Christian.
>>>
>>
> 

