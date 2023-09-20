Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD067A744C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 09:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03DB10E162;
	Wed, 20 Sep 2023 07:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D638510E162
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695195416; x=1726731416;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bmX7cOhCs1b9+LbE8pH65YkkAL3guK1dlnbeZ+r5AwI=;
 b=TNDbNrCZi1ZqUGDJz09w2jcSB0UVw3oWXokwFDwGqWK3GqtJECjGvc5k
 IDy/6VioWK8eN9jQkN3NKs/dEpZOsJ0nsvzLRRWPLy+Kro+61L+LgwUzc
 HtKKf6TPAFNIsdaHNjsX436JZo8moyb4UOCwYa+v9Li6tOTmDSCjQxjHq
 66uim2WmliE6aZiBUMrnJ7uODU/veRkBhmmCCkAsOon0XUn9ILKYTzpoc
 sWDyEiRUM5iksblBpbmktm3UHYUQAcYyQtpxDiWGwQjoxeKEixqwZQkVc
 aPcPaRiogIQCYfGQi3W5lufFdrYHb1ZWYrSd5sS87ggGpp77m6IVmJTYc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="444245269"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="444245269"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920176310"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="920176310"
Received: from noors55x-mobl1.gar.corp.intel.com (HELO [10.249.254.146])
 ([10.249.254.146])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 00:36:54 -0700
Message-ID: <70af0fd3-3dbb-b19a-8a4d-dcddab60d3e9@linux.intel.com>
Date: Wed, 20 Sep 2023 09:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Decrypting tt maps in ttm
To: Zack Rusin <zackr@vmware.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
 <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
 <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
 <5efd9a5d-7c88-855a-8a2f-5d984ea4a5e7@amd.com>
 <53e09f13-eb54-9662-a511-77c012df9646@linux.intel.com>
 <beb209b5-fb67-5b53-62b8-bc1c78b41cc5@amd.com>
 <d61a3236737e13a6a303fd9902cf6938e29cf32d.camel@vmware.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <d61a3236737e13a6a303fd9902cf6938e29cf32d.camel@vmware.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Zack,

On 9/20/23 05:43, Zack Rusin wrote:
> On Tue, 2023-09-19 at 09:47 +0200, Christian König wrote:
>> !! External Email
>>
>> Am 19.09.23 um 08:56 schrieb Thomas Hellström:
>>> On 9/19/23 07:39, Christian König wrote:
>>>> Am 19.09.23 um 03:26 schrieb Zack Rusin:
>>>>> On Mon, 2023-09-18 at 16:21 -0400, Alex Deucher wrote:
>>>>>> !! External Email
>>>>>>
>>>>>> On Mon, Sep 18, 2023 at 3:06 PM Thomas Hellström
>>>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>>>> On 9/18/23 17:52, Zack Rusin wrote:
>>>>>>>> On Mon, 2023-09-18 at 17:13 +0200, Thomas Hellström wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 9/18/23 16:56, Thomas Hellström wrote:
>>>>>>>>>> Hi Zack, Christian
>>>>>>>>>>
>>>>>>>>>> On 9/18/23 13:36, Christian König wrote:
>>>>>>>>>>> Hi Zack,
>>>>>>>>>>>
>>>>>>>>>>> adding Thomas and Daniel.
>>>>>>>>>>>
>>>>>>>>>>> I briefly remember that I talked with Thomas and some other
>>>>>>>>>>> people
>>>>>>>>>>> about that quite a while ago as well, but I don't fully
>>>>>>>>>>> remember the
>>>>>>>>>>> outcome.
>>>>>>>>>> Found one old thread, but didn't read it:
>>>>>>>>>>
>>>>>>>>>> https://lists.freedesktop.org/archives/dri-devel/2019-September/234100.html
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> /Thomas
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>> Ugh. Now starting to read that thread I have a vague
>>>>>>>>> recollection it all
>>>>>>>>> ended with not supporting mapping any device pages whatsoever
>>>>>>>>> when SEV
>>>>>>>>> was enabled, but rather resorting to llvmpipe and VM-local bos.
>>>>>>>> Hi, Thomas.
>>>>>>>>
>>>>>>>> Thanks for finding this! I'd (of course) like to solve it
>>>>>>>> properly and get
>>>>>>>> vmwgfx
>>>>>>>> running with 3d support with SEV-ES active instead of essentially
>>>>>>>> disabling
>>>>>>>> the
>>>>>>>> driver when SEV-ES is active.
>>>>>>>>
>>>>>>>> I think there are two separate discussions there, the
>>>>>>>> non-controversial one
>>>>>>>> and the
>>>>>>>> controversial one:
>>>>>>>> 1) The non-controversial: is there a case where drivers would
>>>>>>>> want encrypted
>>>>>>>> memory
>>>>>>>> for TT pages but not for io mem mappings? Because if not then as
>>>>>>>> Christian
>>>>>>>> pointed
>>>>>>>> out we could just add pgprot_decrypted to ttm_io_prot and be
>>>>>>>> essentially done.
>>>>>>>> The
>>>>>>>> current method of decrypting io mem but leaving sys mem mappings
>>>>>>>> encrypted is
>>>>>>>> a bit
>>>>>>>> weird anyway.
>>>>>>>>
>>>>>>>> If the answer to that question is "yes, some driver does want the
>>>>>>>> TT mappings
>>>>>>>> to be
>>>>>>>> encrypted" then your "[PATCH v2 3/4] drm/ttm, drm/vmwgfx:
>>>>>>>> Correctly support
>>>>>>>> support
>>>>>>>> AMD memory encryption" solves that. I think getting one of those
>>>>>>>> two in makes
>>>>>>>> sense
>>>>>>>> regardless of everything else, agreed?
>>>>>>> Well, there is more to it I think.
>>>>>>>
>>>>>>> IIRC, the AMD SME encryption mode has a way for a device to have the
>>>>>>> memory controller (?) encrypt / decrypt device traffic by using an
>>>>>>> address range alias, so in theory it supports encrypted TT pages, and
>>>>>>> the dma-layer may indeed hand encrypted DMA pages to TTM on such
>>>>>>> systems
>>>>>>> depending on the device's DMA mask. That's why I think that
>>>>>>> force_dma_unencrypted() export was needed, and If the amdgpu driver
>>>>>>> accesses TT memory in SME mode *without* pgprot_decrypted() and it
>>>>>>> still
>>>>>>> works, then I think that mode is actually used. How could it
>>>>>>> otherwise work?
>>>>>> For SME, as long as the encrypted bit is set in the physical address
>>>>>> used for DMA, the memory controller will handle the encrypt/decrypt
>>>>>> for the device.  For devices with a limited dma mask, you need to use
>>>>>> the IOMMU so that the encrypted bit is retained when the address hits
>>>>>> the memory controller.
>>>>> How does that work on systems with swiotlb, e.g. swiotlb=force, or
>>>>> i.e. what would
>>>>> decrypt the ttm tt mappings when copying between system and vram
>>>>> when iommu is
>>>>> disabled/absent?
>>>> SME makes it mandatory that all devices can handle the physical
>>>> address used for DMA, either native or with the help of IOMMU.
>>>>
>>>> Hacks like SWIOTLB are not directly supported as far as I know. Maybe
>>>> somehow SWIOTLB manually decrypts the data while copying it or
>>>> something like this, but I'm not 100% sure if that is actually
>>>> implemented.
>>>>
>>>> Regards,
>>>> Christian.
>>> A bold guess after looking at various code and patches:
>>>
>>> 1) Devices under SME that don't support the encryption bit and SEV:
>>> a) Coherent memory is unencrypted.
>>> b) Streaming DMA under IOMMU: The IOMMU sets the encrypted bit.
>>> c) Streaming DMA with SWIOTLB: The bounce buffer is unencrypted.
>>> Copying to/from bounce-buffer decrypts/encrypts.
>>>
>>> 2) Devices under SME that do support the encryption bit (which I
>>> believe is most graphics devices in general on SME systems, not just
>>> amdgpu; it "just works")
>>> *) Coherent memory is encrypted. The DMA layer sets dma addresses and
>>> pgprot accordingly.
>>> *) Streaming DMA is encrypted.
>>>
>>> So the bug in TTM would then be it's not handling 1a) and 1b) correctly.
>>>
>>> Remedy:
>>> 1b) Shouldn't be used with encryption.
>>> 1a) This is what we should try to fix. Exporting
>>> dma_force_unencrypted() didn't seem to be a way forward. Properly
>>> fixing this would, I guess, mean implement the missing functionality
>>> in the dma layer: For vmap / kmap we could simply reuse the virtual
>>> addresses we get back from dma_alloc_coherent(), but for faulting one
>>> would want something like dma_coherent_insert_pfn() (if it doesn't
>>> exist already) after a proper disussion with Christoph Hellwig.
>> Christoph once pointed me to dma_mmap_attrs() for this, but I never
>> found the time to fully look into it.
> Hmm, yea, that would make sense
> https://elixir.bootlin.com/linux/latest/source/kernel/dma/direct.c#L564
> Replacing the vmap's with dma_mmap_attrs would probably fix this, but it would
> require a bit of extra setup.
>
> So we're saying that yes, we don't want unconditional pgprot_decrypt in ttm_io_prot.
> We'd like to leave those tt mappings as encrypted when possible and instead maybe
> add a vaddr to ttm_tt (or extract it from the pages->private via the  ttm_pool_dma,
> but that seems rather ugly),

It could probably be extracted from pages->private from a helper in the 
ttm pool code, (Christian has a final saying here). However, that 
requires that all ttm_tts are built from a single dma_alloc chunk. Not 
sure that's the case? In that case we're back to square zero for vmaps.


>   plus add get_vm_area() to be able to use dma_mmap_attrs
> instead of vmap when use_dma_alloc's is true in ttm_bo_vmap/ttm_bo_kmap?

vmap is for kernel mappings, and dma_mmap_attrs is for user-space 
mappings, But dma_mmap_attrs()wouldn't be sufficient. If, for example. a 
bo is moved from VRAM to dma-coherent memory, or vice-versa we Zap the 
user-space page-table entries and replace them using faulting to the new 
address. That's why we'd need a dma_coherent_insert_pfn().

I think at the time Christoph was under the impression that you could 
replace xxx_insert_pfn() with xxx_mmap() in the fault handler, but that 
doesn't work since the latter requires the mmap_lock in write mode, 
whereas the fault handler only holds it in read mode. (That caused some 
bugs in the i915 driver when that change was attempted).

/Thomas


>
> z
>
>
