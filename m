Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE073BB91
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4084B10E657;
	Fri, 23 Jun 2023 15:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8A910E657
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687533858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/S7PlGAxyYZzFvK0bsc5hgdhJYvUxmCp25URDm0iv8=;
 b=MV2H5bTkmptXE8NO5A/M+kvN0fzA2KfSXujADovC5AFQOZq2NE2nELm+c7hkdF/Qk0pvNe
 v3tMdLg81i3xDb1T99vGxqvVYtP/1F1aLYPOpbNkMdZBUNF8Uvcx1dwFRcID5lsb0qS3yc
 ORf188P2ppOqRQ8Zk/l4xEHx3gO35q8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-XAxN7uqbMCizNGGc7-4B9g-1; Fri, 23 Jun 2023 11:24:17 -0400
X-MC-Unique: XAxN7uqbMCizNGGc7-4B9g-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1b52498ece5so5449635ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 08:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687533856; x=1690125856;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/S7PlGAxyYZzFvK0bsc5hgdhJYvUxmCp25URDm0iv8=;
 b=C39MsiJYS1kl+g5/VjxFBA80Cf/iG6O5F3PFzIgB9iHVzWlbeyOuvBvo1vAtT6eXbG
 IwDV38Mzbg/6EcGzm8ZbHBIo/CH4DT2NeqSW69fEJpDay+cvG9Gdz3plDaHBMFF8vy1T
 QoXCjEXu6fp+hamHkm3X57of89YimUblBlldOI2BewxQoPO17zJFkNA4LhT2FxOeNtmb
 /Or5G4xWabLngC+OU1+iXOF0PZISiUxsSY/VV7sKdTIFZDeMf1aDQhn/s52ueby+gYco
 WcuRB35fYhipaHeC2qA9vniM6cVgNz8wvNBK/Rj9bmIRjSlU04RrYr4LGGnxcl2WliR5
 SQOQ==
X-Gm-Message-State: AC+VfDyqS+j6GDpFJm8P27wkjz6/+wVzITpgrVWUDWWzJ/4JPw8kaCOG
 XCJTXeFINYbEa5VIF2GnuOIl3hxn4G/c5Pno5UrKwVVDC6gmqwvCSQkljTz5DFmxn8z9Ksb7mVZ
 QaD0Udhlkf9tlMuGP+v0mg8n6bHpu
X-Received: by 2002:a17:902:efcb:b0:1b5:11e:e48a with SMTP id
 ja11-20020a170902efcb00b001b5011ee48amr19497411plb.69.1687533855750; 
 Fri, 23 Jun 2023 08:24:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RurcfAp7lRzkU6veda3yFfLKhnT+ZP/W2E7cRQ76Iy3mMxyblmZ4BOb9jbh0S7Ay8fzqw7w==
X-Received: by 2002:a17:902:efcb:b0:1b5:11e:e48a with SMTP id
 ja11-20020a170902efcb00b001b5011ee48amr19497390plb.69.1687533855411; 
 Fri, 23 Jun 2023 08:24:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a170902779000b001b03cda6389sm7387865pll.10.2023.06.23.08.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 08:24:15 -0700 (PDT)
Message-ID: <d18a4ea5-4e8e-be69-84c3-ca658f5cfd24@redhat.com>
Date: Fri, 23 Jun 2023 15:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
 <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
 <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
 <86ef9898-c4b6-f4c0-7ad3-3ffe5358365a@amd.com>
 <c1f05169-dec0-22ee-52fa-c8070678394e@redhat.com>
 <2f502150-c1f8-615c-66d9-c3fb59b8c409@redhat.com>
 <4a52ac7c-19ba-8906-5902-fbf75673bf59@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <4a52ac7c-19ba-8906-5902-fbf75673bf59@amd.com>
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/23/23 09:16, Christian König wrote:
> Am 22.06.23 um 17:07 schrieb Danilo Krummrich:
>> On 6/22/23 17:04, Danilo Krummrich wrote:
>>> On 6/22/23 16:42, Christian König wrote:
>>>> Am 22.06.23 um 16:22 schrieb Danilo Krummrich:
>>>>> On 6/22/23 15:54, Christian König wrote:
>>>>>> Am 20.06.23 um 14:23 schrieb Danilo Krummrich:
>>>>>>> Hi Christian,
>>>>>>>
>>>>>>> On 6/20/23 08:45, Christian König wrote:
>>>>>>>> Hi Danilo,
>>>>>>>>
>>>>>>>> sorry for the delayed reply. I've trying to dig myself out of a 
>>>>>>>> hole at the moment.
>>>>>>>
>>>>>>> No worries, thank you for taking a look anyway!
>>>>>>>
>>>>>>>>
>>>>>>>> Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
>>>>>>>>> [SNIP]
>>>>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>>>>> index bbc721870c13..5ec8148a30ee 100644
>>>>>>>>> --- a/include/drm/drm_gem.h
>>>>>>>>> +++ b/include/drm/drm_gem.h
>>>>>>>>> @@ -36,6 +36,8 @@
>>>>>>>>>   #include <linux/kref.h>
>>>>>>>>>   #include <linux/dma-resv.h>
>>>>>>>>> +#include <linux/list.h>
>>>>>>>>> +#include <linux/mutex.h>
>>>>>>>>>   #include <drm/drm_vma_manager.h>
>>>>>>>>> @@ -379,6 +381,18 @@ struct drm_gem_object {
>>>>>>>>>        */
>>>>>>>>>       struct dma_resv _resv;
>>>>>>>>> +    /**
>>>>>>>>> +     * @gpuva:
>>>>>>>>> +     *
>>>>>>>>> +     * Provides the list of GPU VAs attached to this GEM object.
>>>>>>>>> +     *
>>>>>>>>> +     * Drivers should lock list accesses with the GEMs 
>>>>>>>>> &dma_resv lock
>>>>>>>>> +     * (&drm_gem_object.resv).
>>>>>>>>> +     */
>>>>>>>>> +    struct {
>>>>>>>>> +        struct list_head list;
>>>>>>>>> +    } gpuva;
>>>>>>>>> +
>>>>>>>>>       /**
>>>>>>>>>        * @funcs:
>>>>>>>>>        *
>>>>>>>>
>>>>>>>> I'm pretty sure that it's not a good idea to attach this 
>>>>>>>> directly to the GEM object.
>>>>>>>
>>>>>>> Why do you think so? IMHO having a common way to connect mappings 
>>>>>>> to their backing buffers is a good thing, since every driver 
>>>>>>> needs this connection anyway.
>>>>>>>
>>>>>>> E.g. when a BO gets evicted, drivers can just iterate the list of 
>>>>>>> mappings and, as the circumstances require, invalidate the 
>>>>>>> corresponding mappings or to unmap all existing mappings of a 
>>>>>>> given buffer.
>>>>>>>
>>>>>>> What would be the advantage to let every driver implement a 
>>>>>>> driver specific way of keeping this connection?
>>>>>>
>>>>>> Flexibility. For example on amdgpu the mappings of a BO are groups 
>>>>>> by VM address spaces.
>>>>>>
>>>>>> E.g. the BO points to multiple bo_vm structures which in turn have 
>>>>>> lists of their mappings.
>>>>>
>>>>> Isn't this (almost) the same relationship I introduce with the 
>>>>> GPUVA manager?
>>>>>
>>>>> If you would switch over to the GPUVA manager right now, it would 
>>>>> be that every GEM has a list of it's mappings (the gpuva list). The 
>>>>> mapping is represented by struct drm_gpuva (of course embedded in 
>>>>> driver specific structure(s)) which has a pointer to the VM address 
>>>>> space it is part of, namely the GPUVA manager instance. And the 
>>>>> GPUVA manager keeps a maple tree of it's mappings as well.
>>>>>
>>>>> If you still would like to *directly* (indirectly you already have 
>>>>> that relationship) keep a list of GPUVA managers (VM address 
>>>>> spaces) per GEM, you could still do that in a driver specific way.
>>>>>
>>>>> Do I miss something?
>>>>
>>>> How do you efficiently find only the mappings of a BO in one VM?
>>>
>>> Actually, I think this case should even be more efficient than with a 
>>> BO having a list of GPUVAs (or mappings):
>>
>> *than with a BO having a list of VMs:
>>
>>>
>>> Having a list of GPUVAs per GEM, each GPUVA has a pointer to it's VM. 
>>> Hence, you'd only need to iterate the list of mappings for a given BO 
>>> and check the mappings VM pointer.
> 
> Yeah, and that is extremely time consuming if you have tons of mappings 
> in different VMs.
> 
>>>
>>> Having a list of VMs per BO, you'd have to iterate the whole VM to 
>>> find the mappings having a pointer to the given BO, right?
> 
> No, you don't seem to understand what I'm suggesting.
> 
> Currently you have a list of mappings attached to the BO, so when you 
> need to make sure that a specific BO is up to date in a specific VM you 
> either need to iterate over the VM or the BO. Neither of that is a good 
> idea.
> 
> What you need is a representation of the data used for each BO+VM 
> combination. In other words another indirection which allows you to 
> handle all the mappings of a BO inside a VM at once.

Ok, after having a quick look at amdgpu, I can see what you mean.

The missing piece for me was that the BO+VM abstraction itself keeps a 
list of mappings for this specific BO and VM.

Just to make it obvious for other people following the discussion, let 
me quickly sketch up how this approach would look like for the GPUVA 
manager:

1. We would need a new structure to represent the BO+VM combination, 
something like:

	struct drm_gpuva_mgr_gem {
     		struct drm_gpuva_manager *mgr;
		struct drm_gem_object *obj;
		struct list_head gpuva_list;
	};

with a less horrible name, hopefully.

2. Create an instance of struct drm_gpuva_mgr_gem once a GEM becomes 
associated with a GPUVA manager (VM) and attach it to the GEMs, as by 
now, "gpuva" list.

In amdgpu, for example, this seems to be the case once a GEM object is 
opened, since there is one VM per file_priv.

However, for other drivers this could be different, hence drivers would 
need to take care about this.


3. Attach GPUVAs to the new gpuva_list of the corresponding instance of
struct drm_gpuva_mgr_gem.

4. Drivers would need to clean up the instance of struct 
drm_gpuva_mgr_gem, once the GEM is not associated with the GPUVA manager 
anymore.

As pointed out by Christian, this would optimize the "get all mappings 
backed by a specific BO from a given VM" use case.

The question for me is, do other drivers than amdgpu commonly need this?

And what does amdgpu need this for? Maybe amdgpu does something we're 
not doing (yet)?

Christian - I know you didn't ask for "do it the way amdgpu does", 
instead you voted for keeping it entirely driver specific. But I think 
everyone is pretty close and I'm still optimistic that we could just 
generalize this.

- Danilo

> 
>>>
>>> I'd think that a single VM potentially has more mapping entries than 
>>> a single BO was mapped in multiple VMs.
>>>
>>> Another case to consider is the case I originally had in mind 
>>> choosing this relationship: finding all mappings for a given BO, 
>>> which I guess all drivers need to do in order to invalidate mappings 
>>> on BO eviction.
>>>
>>> Having a list of VMs per BO, wouldn't you need to iterate all of the 
>>> VMs entirely?
> 
> No, see how amdgpu works.
> 
> Regards,
> Christian.
> 

