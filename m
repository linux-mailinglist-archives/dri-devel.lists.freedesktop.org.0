Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FA791206
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A0110E2AA;
	Mon,  4 Sep 2023 07:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 471 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 00:49:33 UTC
Received: from james.steelbluetech.co.uk (james.steelbluetech.co.uk
 [92.63.139.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A73310E265;
 Mon,  4 Sep 2023 00:49:33 +0000 (UTC)
Received: from [10.0.5.25] (tv.ehuk.net [10.0.5.25])
 by james.steelbluetech.co.uk (Postfix) with ESMTP id A3C05BFC11;
 Mon,  4 Sep 2023 01:41:38 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.10.3 james.steelbluetech.co.uk A3C05BFC11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ehuk.net; s=default;
 t=1693788098; bh=QVu39wB/wdpDUmhFZ16BD56J1JZefShVT6nfmmsX3aU=;
 h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
 b=r/tLnuN0s51iXJIk2yGflAPpi8cBtPKDfxH2ixJ+IMzo/2qGEOB93wugoMCqqWKWn
 +T4ObAGsDKuoC1O/uz2i1YI/e4yqkl9weiCOMfZ4mXRLMZAHi+njmG7kt4qHUjllBZ
 /hgI22tb0T+r6U6uGrPXC2Lw8al3k5OdkhPDNjre7Vh8RHwNSjOh7iRwatQyGJPexJ
 QIcKl5TFFt3mjLTsSJH6BbUI/7/WbcK0WHtByW4iiYO6c+WSzSIZJ0CcXOA/MSOgyo
 JgtuSEFyYnH0lXJM5mAUjUipe4d3YNGtV1RYfISXJiOWVXPgb/kWDjNIC9Aq9sA0s7
 ujcxwi3BVRb+w==
Message-ID: <f3c5bb3d-9a78-65e0-97b5-ced02bd6b524@ehuk.net>
Date: Mon, 4 Sep 2023 01:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Chia-I Wu <olvaffe@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20230724012419.2317649-1-sashal@kernel.org>
 <20230724012419.2317649-13-sashal@kernel.org>
 <CAPaKu7RTgAMBLHbwtp4zgiBSDrTFtAj07k5qMzkuLQy2Zr+sZA@mail.gmail.com>
 <55fc4a28-1e17-44df-2069-a688828080e6@gmail.com>
 <2023083145-scoured-celery-2511@gregkh>
 <c657653e-24d8-5790-a91c-4c13bb9eaeb0@gmail.com>
 <2023083144-railroad-daybreak-7f41@gregkh>
 <CAPaKu7Q2vq5m6Av6L2LthnFy5w2XtjKUYF8Z2__0hVp0vj2L1A@mail.gmail.com>
 <44fd45f9-8e2c-f9a2-fe89-97329734e13c@gmail.com>
Content-Language: en-GB
From: Eddie Chapman <eddie@ehuk.net>
In-Reply-To: <44fd45f9-8e2c-f9a2-fe89-97329734e13c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:24:28 +0000
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
Reply-To: eddie@ehuk.net
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2023 07:02, Christian König wrote:
> Am 31.08.23 um 20:55 schrieb Chia-I Wu:
>> On Thu, Aug 31, 2023 at 7:01 AM Greg KH <gregkh@linuxfoundation.org> 
>> wrote:
>>> On Thu, Aug 31, 2023 at 03:26:28PM +0200, Christian König wrote:
>>>> Am 31.08.23 um 12:56 schrieb Greg KH:
>>>>> On Thu, Aug 31, 2023 at 12:27:27PM +0200, Christian König wrote:
>>>>>> Am 30.08.23 um 20:53 schrieb Chia-I Wu:
>>>>>>> On Sun, Jul 23, 2023 at 6:24 PM Sasha Levin <sashal@kernel.org> 
>>>>>>> wrote:
>>>>>>>> From: Lang Yu <Lang.Yu@amd.com>
>>>>>>>>
>>>>>>>> [ Upstream commit 187916e6ed9d0c3b3abc27429f7a5f8c936bd1f0 ]
>>>>>>>>
>>>>>>>> When using cpu to update page tables, vm update fences are unused.
>>>>>>>> Install stub fence into these fence pointers instead of NULL
>>>>>>>> to avoid NULL dereference when calling dma_fence_wait() on them.
>>>>>>>>
>>>>>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>>>>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++--
>>>>>>>>     1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>>> We start getting this warning spew on chromeos
>>>>>> Yeah because the older kernels still kept track of the last VM 
>>>>>> fence in the
>>>>>> syncobj.
>>>>>>
>>>>>> This patch here should probably not have been back ported.
>>>>>>
>>>>>> Why was that done anyway? The upstream commit doesn't have a CC 
>>>>>> stable and
>>>>>> this is only a bug fix for a new feature not present on older 
>>>>>> kernels.
>>>>> It is part of the AUTOSEL process.
>>>> Could we prevent patches from being backported by adding a Fixes: tag?
>>> Yes, that will show exactly where the patch should be backported to.
>> This is also AUTOSEL'ed to 5.15.  That might need a revert as well,
>> depending on when the amdgpu feature landed.
> 
> Both the feature and the bug fix landed in 6.5.
> 
> The bug fix should have never been backported to any older kernel at all 
> as far as I can see.
> 
> Regards,
> Christian.

I can confirm I've also started to get this warning hundreds of times 
per second having upgraded from 5.15.123 to 5.15.130. There's also a 
report from someone else of exactly the same on 5.15.128, here:
https://gitlab.freedesktop.org/drm/amd/-/issues/2820

Eddie
