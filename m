Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F187A50AC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 19:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C295210E26D;
	Mon, 18 Sep 2023 17:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D756D10E26D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695057108; x=1726593108;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=nNMVW3fRZcJWksvHbg8Bdc93HVugXXkPSBcjkhuLjIA=;
 b=lIC+uN4e+rM8TbJeNSFN4xhtDJeIKFhPvMt2euFmfXOh3Lg+O4cx1eVL
 enr8TGUx1TYLheCBseAuTyMIitevIRR1q/5NzbPNsp/rgsXVWYTaxg3jK
 AjeMwi0fxoKnlVNb+/+Tv3z1Cm7qwU3v5lF0AJ6HeEr7WsiYOOyvfFFaY
 sm//AQnEYU1JKgAFt9GpXVyBQ43Wo1GaO53QKJpnEdT0RgMqb08S5nKuy
 GTyDKAOo5g5AFBtzF5c2KAz9AxpCtxxaGGS0rwA6hXPgA7hbyzJLba7Iu
 L/rpVWw5Zypu/Cjcenn4z9IWRji+gklOTMh1bPky49F+jogy0/CPgGVgJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377038035"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="377038035"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775204903"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="775204903"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.250])
 ([10.249.254.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:11:46 -0700
Message-ID: <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
Date: Mon, 18 Sep 2023 19:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Decrypting tt maps in ttm
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/18/23 17:52, Zack Rusin wrote:
> On Mon, 2023-09-18 at 17:13 +0200, Thomas Hellström wrote:
>> Hi,
>>
>> On 9/18/23 16:56, Thomas Hellström wrote:
>>> Hi Zack, Christian
>>>
>>> On 9/18/23 13:36, Christian König wrote:
>>>> Hi Zack,
>>>>
>>>> adding Thomas and Daniel.
>>>>
>>>> I briefly remember that I talked with Thomas and some other people
>>>> about that quite a while ago as well, but I don't fully remember the
>>>> outcome.
>>> Found one old thread, but didn't read it:
>>>
>>> https://lists.freedesktop.org/archives/dri-devel/2019-September/234100.html
>>>
>>>
>>> /Thomas
>>>
>>>
>> Ugh. Now starting to read that thread I have a vague recollection it all
>> ended with not supporting mapping any device pages whatsoever when SEV
>> was enabled, but rather resorting to llvmpipe and VM-local bos.
> Hi, Thomas.
>
> Thanks for finding this! I'd (of course) like to solve it properly and get vmwgfx
> running with 3d support with SEV-ES active instead of essentially disabling the
> driver when SEV-ES is active.
>
> I think there are two separate discussions there, the non-controversial one and the
> controversial one:
> 1) The non-controversial: is there a case where drivers would want encrypted memory
> for TT pages but not for io mem mappings? Because if not then as Christian pointed
> out we could just add pgprot_decrypted to ttm_io_prot and be essentially done. The
> current method of decrypting io mem but leaving sys mem mappings encrypted is a bit
> weird anyway.
>
> If the answer to that question is "yes, some driver does want the TT mappings to be
> encrypted" then your "[PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support
> AMD memory encryption" solves that. I think getting one of those two in makes sense
> regardless of everything else, agreed?

Well, there is more to it I think.

IIRC, the AMD SME encryption mode has a way for a device to have the 
memory controller (?) encrypt / decrypt device traffic by using an 
address range alias, so in theory it supports encrypted TT pages, and 
the dma-layer may indeed hand encrypted DMA pages to TTM on such systems 
depending on the device's DMA mask. That's why I think that 
force_dma_unencrypted() export was needed, and If the amdgpu driver 
accesses TT memory in SME mode *without* pgprot_decrypted() and it still 
works, then I think that mode is actually used. How could it otherwise work?

But anyway, I agree SEV-ES mode would *always* want pgprot_decrypted for 
dma allocated memory, whether it's in PL_SYSTEM or in PL_TT, but I guess 
the above SME case need to be sorted out first.

>
> 2) The controversial part of your series seems to be exporting of
> force_dma_unencrypted and its usage within ttm. Personally I'm perfectly ok with
> ignoring that for now. Getting #1 in is still a million times (rounded up to the
> nearest million) faster than just using llvmpipe in the guest. And getting #1 also
> fixes modern presentation on vmwgfx.


>
> So #1 is "make the driver work", while #2 is an optimisation - I think we should
> treat them as separate things/series. Does that make sense?

I guess that depends on the tradeoff between security and speed for 
people running SEV-enabled VMs. But giving them a choice is probably not 
a bad idea.

/Thomas


>
> z
>
> P.S. I forgot to cc dri-devel on the initial email, that wasn't by design. Sorry.
> I'm ok with moving the discussion to dri-devel.
