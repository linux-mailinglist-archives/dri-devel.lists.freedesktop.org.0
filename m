Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42781539F4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 22:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616E06F95B;
	Wed,  5 Feb 2020 21:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6503B6E9F7;
 Wed,  5 Feb 2020 21:07:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3b2e5a0000>; Wed, 05 Feb 2020 13:06:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 05 Feb 2020 13:07:32 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 05 Feb 2020 13:07:32 -0800
Received: from [172.20.40.58] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Feb
 2020 21:07:32 +0000
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: Support NVIDIA format
 modifiers
To: Ben Skeggs <skeggsb@gmail.com>
References: <20191217004520.2404-1-jajones@nvidia.com>
 <CACAvsv6AKt=10JgjaEKc=pkmKfGJoUJjq_Unn0yGTuQK85Es2g@mail.gmail.com>
 <b273ad88-d246-3395-2fd0-8188bc41a127@nvidia.com>
 <CACAvsv5bhaJozct9fgnJ8JNSXpdd5QCH+tCxciZetbnWuzzBPw@mail.gmail.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <4105692e-c8ab-04c6-7008-9e3c946aea8d@nvidia.com>
Date: Wed, 5 Feb 2020 13:08:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACAvsv5bhaJozct9fgnJ8JNSXpdd5QCH+tCxciZetbnWuzzBPw@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580936795; bh=ZdIqsPJjH4CVvzmArcEfPtS1iBMC8dObGh0i6uTPgmQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=S9gP8UBvLz41SjKtkXKVN1VABScARs4mRHNZm0yahv02xeaP268Ajs2Vq3wjuxKcD
 0uK75U95ykcn8AkRO7o9DBlvtrqZsD+PBnQ6VlapZSLNPGojftLtTravpVkgWIg/5/
 IsrV7erp5jg317DXx9eIRspQ7bf3DplSBf8DRaXKpKyy3Y3TFXHHlnWASZTqbd47/w
 jbhkVgfRFzoxjEqo5/vAVVblQgo0l91rlEUKe0t94KnmuU5ibO/dpctZ/VPfdK3d1c
 CcVr1jkSwjR+cGzlectx8UKmCT4rs8YFeDV6FOgVDDbfjJceDrykltG8abqt9fMBEe
 AgWXJTunKVsFg==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/6/20 3:27 PM, Ben Skeggs wrote:
> On Tue, 7 Jan 2020 at 05:17, James Jones <jajones@nvidia.com> wrote:
>>
>> On 1/5/20 5:30 PM, Ben Skeggs wrote:
>>> On Tue, 17 Dec 2019 at 10:44, James Jones <jajones@nvidia.com> wrote:
>>>>
>>>> This series modifies the NV5x+ nouveau display backends to advertise
>>>> appropriate format modifiers on their display planes in atomic mode
>>>> setting blobs.
>>>>
>>>> Corresponding modifications to Mesa/userspace are available here:
>>>>
>>>> https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work
>>>>
>>>> But those need a bit of cleanup before they're ready to submit.
>>>>
>>>> I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
>>>> using various formats and all the exposed format modifiers, plus some
>>>> negative testing with invalid ones.
>>>>
>>>> NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
>>>> Linear DRM format mod" patch submitted to dri-devel.
>>>>
>>>> v2: Used Tesla family instead of NV50 chipset compare to avoid treating
>>>>       oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
>>>>       of compares with chipset number in the series were audited, deemed
>>>>       safe, and left as-is for consistency with existing code.
>>> Hey James,
>>>
>>> These look OK to me, with the minor issue I mentioned on one of the
>>> patches dealt with.  I'll hold off merging anything until I get the
>>> go-ahead that the modifier definitions are definitely set in stone /
>>> userspace is ready for inclusion.
>>
>> Thanks for having a look.  I'll try to get the userspace changes
>> finalized soon.  I think from the NV side, we consider the modifier
>> definition itself (the v3 version of the patch) final, so if there's any
>> stand-alone feedback from yourself or other drm/nouveau developers on
>> that layout, we'd be eager to hear it.  I don't want it rushed in, but
>> we do have several projects blocked on getting that approved & committed.
>>
>> I assume the sequencing should be:
>>
>> * Fix the minor issue you identified here/complete review of nouveau
>> kernel patches
>> * Complete review of the related TegraDRM new modifier support patch
>> * Finalize and complete review of userspace/Mesa nouveau modifier
>> support patches
>> * Get drm_fourcc.h updates committed
>> * Get these patches and TegraDRM patches committed
>> * Integrate final drm_fourcc.h to Mesa patches and get Mesa patches
>> committed
>>
>> Does that sound right to you?
> Seems very reasonable!

Thanks.  I needed to do more cleanup than I expected (a rewrite in the 
end), but the corresponding Mesa patches are out for review now, and 
I've sent out v3 of this patchset to address the remaining issue raised 
here.

Thanks,
-James

> Ben.
> 
>>
>> Thanks,
>> -James
>>
>>> Thanks,
>>> Ben.
>>>
>>>>
>>>> James Jones (3):
>>>>     drm/nouveau: Add format mod prop to base/ovly/nvdisp
>>>>     drm/nouveau: Check framebuffer size against bo
>>>>     drm/nouveau: Support NVIDIA format modifiers
>>>>
>>>>    drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
>>>>    drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
>>>>    drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
>>>>    drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
>>>>    drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
>>>>    drivers/gpu/drm/nouveau/nouveau_display.c   | 154 ++++++++++++++++++++
>>>>    drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
>>>>    7 files changed, 272 insertions(+), 8 deletions(-)
>>>>
>>>> --
>>>> 2.17.1
>>>>
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
