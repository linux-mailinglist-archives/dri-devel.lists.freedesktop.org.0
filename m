Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50966C35D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 16:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6F10E454;
	Mon, 16 Jan 2023 15:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4C910E071;
 Mon, 16 Jan 2023 15:11:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ss4so61521088ejb.11;
 Mon, 16 Jan 2023 07:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwVfqCUwwnvhsYtzo+5nTUzITY861JFZKjMPyS8d1jc=;
 b=eye7WXiqksqmIcR0AmNiQ47kNiiDc3xNw3od3VtfeXjPrsVQ8+pPPGqe8z303b9AsJ
 C/cfk6cISk5sTroX5/6df47yW5Uv9TSxcnHPjKxu3FbhwF/sWB/4kZ6wGrxvi5pD5BzP
 y0KVp0L0NAylWy6zY1T7tTyC/k0dCSwVKLtT+r+unUiJI2xMM2ITwbKTwUFgPqrFhMwH
 MFOtAHNOkabWTxfUw1qugCXwd2nKGRUqrbdAKll0mb6eAmiaWAmqKH7TfcCYtKPE7VGi
 Qk3bNdO1RfJ7DxqoSVUahNQSOzLu1v20rZ57/mkUDuAkX7nWKHFHHritywfGmJ6UnTzx
 L9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SwVfqCUwwnvhsYtzo+5nTUzITY861JFZKjMPyS8d1jc=;
 b=kC86Qy+0+8dXZ/iDEVz/pQJZJyhi3n5D7t1NRxqB+RYE8bm92hvyG6AqZ0RRaspU95
 z6S6vtXnU7ZjFNM1NLPllVybmMqBl9pUlB4s5fKtJsyejl55q4xYmlcQ8TryhK7RfZlV
 LViI4WpGcyAP8G1SsfIaB5N5i5QYm71dy9DPMw5sxzYntSrRsHO6X2X2cnUwIam4+NKT
 PRZC6EysaF5a8jCUgwaOewFLTmNsA7Jt/Qay4sHqgWKVuGe+pCroUzYGoNFNf/G5RI7W
 ZmUgsnvu4lq2lpM3P498e5pT/kdh2IZ29Nia9u+H9D8+BnuWY5/fsR/VWtMc4zlQ2+PO
 h6dQ==
X-Gm-Message-State: AFqh2kosQOcmhFSEP/Rk9QGV1j8iHoFfTPvvKGzzg3tUwg/fzW1EttoK
 +vAIyR5oDSdZShTYkMp5wSM=
X-Google-Smtp-Source: AMrXdXunaYLKkuW4LOma+Z3npGASK5ohwySE3li0bi1qFJwTBpKHcN81DVYBkzjOgn4pNPEdORUkyg==
X-Received: by 2002:a17:906:60cd:b0:845:bb21:f638 with SMTP id
 f13-20020a17090660cd00b00845bb21f638mr72045889ejk.75.1673881908359; 
 Mon, 16 Jan 2023 07:11:48 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:c7e2:a704:7e6c:f038?
 ([2a02:908:1256:79a0:c7e2:a704:7e6c:f038])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170906474300b0084d4cb08f27sm8991575ejs.104.2023.01.16.07.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 07:11:47 -0800 (PST)
Message-ID: <8e121589-9e53-9237-6fa3-2a78ecc2dd8a@gmail.com>
Date: Mon, 16 Jan 2023 16:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
 <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
 <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
 <e55cc02a-3180-20b9-8255-f95f5910e7fe@amd.com>
 <bac027e4-0e91-8341-3baa-74520c60c808@amd.com>
 <b5101ba0-aa12-b3f1-10c0-368dc50ae4ac@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <b5101ba0-aa12-b3f1-10c0-368dc50ae4ac@amd.com>
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

Am 16.01.23 um 15:52 schrieb Felix Kuehling:
> Am 2023-01-16 um 06:42 schrieb Christian König:
>> [SNIP]
>>>>> When the BO is imported into the same GPU, you get a reference to 
>>>>> the same BO, so the imported BO has the same mmap_offset as the 
>>>>> original BO.
>>>>>
>>>>> When the BO is imported into a different GPU, it is a new BO with 
>>>>> a new mmap_offset.
>>>>
>>>> That won't work.
>>>>
>>>>> I don't think this is incorrect.
>>>>
>>>> No, this is completely incorrect. It mixes up the reverse tracking 
>>>> of mappings and might crash the system.
>>>
>>> I don't understand that. The imported BO is a different BO with a 
>>> different mmap offset in a different device file. I don't see how 
>>> that messes with the tracking of mappings.
>>
>> The tracking keeps note which piece of information is accessible 
>> through which address space object and offset. I you suddenly have 
>> two address spaces and offsets pointing to the same piece of 
>> information that won't work any more.
>
> How do you identify a "piece of information". I don't think it's the 
> physical page. VRAM doesn't even have struct pages. I think it's the 
> BO that's being tracked.

Both struct page as well as pfn. Essentially everything you can give 
vm_insert_pfn() or vm_insert_page() as parameter.

> With a dmabuf import you have a second BO aliasing the same physical 
> pages as the original BO.

No, exactly that's wrong. You have a BO which contains a bunch of dma 
addresses. The pages or whatever lies behind those as backing store are 
intentionally hidden from the importer.

Daniel even started mangling the page pointer to prevent people from 
using them: 
https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#L769

> Then those two BOs are seen as two distinct "pieces of information" 
> that can each have their own mapping.

Well I need to correct myself: Creating a "fake" offset for the BO is 
ok, but we should just never ever mmap() through two different address 
spaces.

>
>>>
>>>> This is the reason why we can't mmap() imported BOs.
>>>
>>> I don't see anything preventing that. For userptr BOs, there is this 
>>> code in amdgpu_gem_object_mmap:
>>>
>>>         if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm))
>>>                 return -EPERM;
>>>
>>> I don't see anything like this preventing mmapping of imported 
>>> dmabuf BOs. What am I missing?
>>>
>>
>> At some point I really need to make a big presentation about all this 
>> stuff, we had the same discussion multiple times now :)
>>
>> It's the same reason why you can't mmap() VRAM through the kfd node: 
>> Each file can have only one address space object associated with it.
>
> I remember that. We haven't used KFD to mmap BOs for a long time for 
> that reason.
>
>
>>
>> See dma_buf_mmap() and vma_set_file() how this is worked around in 
>> DMA-buf.
>
> These are for mmapping memory through the dmabuf fd. I'm not sure 
> that's a good example. drm_gem_prime_mmap creates a temporary struct 
> file and struct drm_file that are destroyed immediately after calling 
> obj->dev->driver->fops->mmap. I think that would break any reverse 
> mapping.

I was hoping we have removed that code by now. Today obj->funcs->mmap 
should be used and not the hack with temporary creating an file/fpriv 
any more.

>>>>
>>>>> mmapping the memory with that new offset should still work. The 
>>>>> imported BO is created with ttm_bo_type_sg, and AFAICT ttm_bo_vm.c 
>>>>> supports mapping of SG BOs.
>>>>
>>>> Actually it shouldn't. This can go boom really easily.
>>>
>>> OK. I don't think we're doing this, but after Xiaogang raised the 
>>> question I went looking through the code whether it's theoretically 
>>> possible. I didn't find anything in the code that says that mmapping 
>>> imported dmabufs would be prohibited or even dangerous. On the 
>>> contrary, I found that ttm_bo_vm explicitly supports mmapping SG BOs.
>>>
>>>
>>>>
>>>> When you have imported a BO the only correct way of to mmap() it is 
>>>> to do so on the original exporter.
>>>
>>> That seems sensible, and this is what we do today. That said, if 
>>> mmapping an imported BO is dangerous, I'm missing a mechanism to 
>>> protect against this. It could be as simple as setting 
>>> AMDGPU_GEM_CREATE_NO_CPU_ACCESS in amdgpu_dma_buf_create_obj.
>>
>> At least for the GEM mmap() handler this is double checked very early 
>> by looking at obj->import_attach and then either rejecting it or 
>> redirecting the request to the DMA-buf file instead.
>
> Can you point me at where this check is? I see a check for 
> obj->import_attach in drm_gem_dumb_map_offset. But I can't see how 
> this function is called in amdgpu. I don't think it is used at all.

Uff, good question! @Thomas and @Dmitry: I clearly remember that one of 
you guys was involved in the DRM/GEM mmap cleanup and DMA-buf with 
workarounds for the KFD and DMA-buf.

What was the final solution to this? I can't find it of hand any more.

>>
>> We probably need something similar when stuff is mapped through the 
>> KFD node. But I think we don't do that any more for "normal" BOs 
>> anyway, don't we?
>
> Correct, we don't map BOs through the KFD device file. The only 
> mappings we still use it for are:
>
>  * Doorbells on APUs
>  * Events page on APUs
>  * MMIO page for HDP flushing
>
> The code for mmapping regular BOs through /dev/kfd was never upstream.

Good, that's probably much less problematic.

Regards,
Christian.


>
> Regards,
>   Felix
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>   Felix
>>

