Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356E63D9A6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952910E48E;
	Wed, 30 Nov 2022 15:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C67E10E48D;
 Wed, 30 Nov 2022 15:42:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26FE7D6E;
 Wed, 30 Nov 2022 07:42:59 -0800 (PST)
Received: from [10.57.71.118] (unknown [10.57.71.118])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8CE63F67D;
 Wed, 30 Nov 2022 07:42:51 -0800 (PST)
Message-ID: <adf4a9b2-c30d-1e74-9848-7a63b3e0c674@arm.com>
Date: Wed, 30 Nov 2022 15:42:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Screen corruption using radeon kernel driver
Content-Language: en-GB
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
 <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
 <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
 <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
 <Y4Y9SJC7gtUxP4+R@sqrt.uni.cx> <a5f73cfa-bd2a-3ab8-1e5c-253cfd832ea7@arm.com>
 <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Mikhail Krylov <sqarert@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-11-30 14:28, Alex Deucher wrote:
> On Wed, Nov 30, 2022 at 7:54 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2022-11-29 17:11, Mikhail Krylov wrote:
>>> On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
>>>> On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com> wrote:
>>>>>
>>>>> On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
>>>>>> On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
>>>>>>>
>>>>>>> On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
>>>>>>>
>>>>>>>>>> [excessive quoting removed]
>>>>>>>
>>>>>>>>> So, is there any progress on this issue? I do understand it's not a high
>>>>>>>>> priority one, and today I've checked it on 6.0 kernel, and
>>>>>>>>> unfortunately, it still persists...
>>>>>>>>>
>>>>>>>>> I'm considering writing a patch that will allow user to override
>>>>>>>>> need_dma32/dma_bits setting with a module parameter. I'll have some time
>>>>>>>>> after the New Year for that.
>>>>>>>>>
>>>>>>>>> Is it at all possible that such a patch will be merged into kernel?
>>>>>>>>>
>>>>>>>> On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
>>>>>>>> Unless someone familiar with HIMEM can figure out what is going wrong
>>>>>>>> we should just revert the patch.
>>>>>>>>
>>>>>>>> Alex
>>>>>>>
>>>>>>>
>>>>>>> Okay, I was suggesting that mostly because
>>>>>>>
>>>>>>> a) it works for me with dma_bits = 40 (I understand that's what it is
>>>>>>> without the original patch applied);
>>>>>>>
>>>>>>> b) there's a hint of uncertainity on this line
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
>>>>>>> saying that for AGP dma_bits = 32 is the safest option, so apparently there are
>>>>>>> setups, unlike mine, where dma_bits = 32 is better than 40.
>>>>>>>
>>>>>>> But I'm in no position to argue, just wanted to make myself clear.
>>>>>>> I'm okay with rebuilding the kernel for my machine until the original
>>>>>>> patch is reverted or any other fix is applied.
>>>>>>
>>>>>> What GPU do you have and is it AGP?  If it is AGP, does setting
>>>>>> radeon.agpmode=-1 also fix it?
>>>>>>
>>>>>> Alex
>>>>>
>>>>> That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=-1 doesn't
>>>>> help, it just makes 3D acceleration in games such as OpenArena stop
>>>>> working.
>>>>
>>>> Just to confirm, is the board AGP or PCIe?
>>>>
>>>> Alex
>>>
>>> It is AGP. That's an old machine.
>>
>> Can you check whether dma_addressing_limited() is actually returning the
>> expected result at the point of radeon_ttm_init()? Disabling highmem is
>> presumably just hiding whatever problem exists, by throwing away all
>>   >32-bit RAM such that use_dma32 doesn't matter.
> 
> The device in question only supports a 32 bit DMA mask so
> dma_addressing_limited() should return true.  Bounce buffers are not
> really usable on GPUs because they map so much memory.  If
> dma_addressing_limited() returns false, that would explain it.

Right, it appears to be the only part of the offending commit that 
*could* reasonably make any difference, so I'm primarily wondering if 
dma_get_required_mask() somehow gets confused.

Thanks,
Robin.
