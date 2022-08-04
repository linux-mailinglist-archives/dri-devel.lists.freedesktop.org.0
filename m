Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EA589B52
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 14:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF4396E91;
	Thu,  4 Aug 2022 12:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA161125D9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659614431; x=1691150431;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3qikVgZjGfcc4wyT0BfWCj0kAhQ8pokceuePFkHwpfY=;
 b=G1cCu+dtSaFKSr47YoophXK+EwQeruicBTBu5aA0ICu3UypOVO9ABNwM
 SqTkSsTWgJs1JIpIeZrcFp7O8U52Mdo2pV6bd4qwJ5lHLeVFGxPseoNyY
 G3fC9kKegCrPfCLBO9dE3fN1y7D8rMHZO+uUM3OF+rcLhr/SfnziAB5LK
 Ex7+WQILaJF0EBkNZLu0JJYwtYxAJYbWHIFdbPNozGMCevZJnoAeAm6JN
 lmfUZuohiFgMlwQzORskeZODI7kvcIRr2TMPy/TCO2lna7cKmK51fLGvm
 A8ThRk/LC9vsFNL1dWoDoGWOrUuGxjeTnSZWtZLPjZA29QklDOG3wgUkU w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="289925686"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="289925686"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 05:00:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="603192231"
Received: from fzoltan-mobl1.ger.corp.intel.com (HELO [10.213.220.160])
 ([10.213.220.160])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 05:00:28 -0700
Message-ID: <e9250ec3-1e29-5b38-c4eb-7e380f1eed4f@linux.intel.com>
Date: Thu, 4 Aug 2022 13:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: New subsystem for acceleration devices
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Oded Gabbay <oded.gabbay@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/08/2022 00:54, Dave Airlie wrote:
> On Thu, 4 Aug 2022 at 06:21, Oded Gabbay <oded.gabbay@gmail.com> wrote:
>>
>> On Wed, Aug 3, 2022 at 10:04 PM Dave Airlie <airlied@gmail.com> wrote:
>>>
>>> On Sun, 31 Jul 2022 at 22:04, Oded Gabbay <oded.gabbay@gmail.com> wrote:
>>>>
>>>> Hi,
>>>> Greg and I talked a couple of months ago about preparing a new accel
>>>> subsystem for compute/acceleration devices that are not GPUs and I
>>>> think your drivers that you are now trying to upstream fit it as well.
>>>
>>> We've had some submissions for not-GPUs to the drm subsystem recently.
>>>
>>> Intel GNA, Intel VPU, NVDLA, rpmsg AI processor unit.
>>>
>>> why is creating a new subsystem at this time necessary?
>>>
>>> Are we just creating a subsystem to avoid the open source userspace
>>> consumer rules? Or do we have some concrete reasoning behind it?
>>>
>>> Dave.
>>
>> Hi Dave.
>> The reason it happened now is because I saw two drivers, which are
>> doing h/w acceleration for AI, trying to be accepted to the misc
>> subsystem.
>> Add to that the fact I talked with Greg a couple of months ago about
>> doing a subsystem for any compute accelerators, which he was positive
>> about, I thought it is a good opportunity to finally do it.
>>
>> I also honestly think that I can contribute much to these drivers from
>> my experience with the habana driver (which is now deployed in mass at
>> AWS) and contribute code from the habana driver to a common framework
>> for AI drivers.
> 
> Why not port the habana driver to drm now instead? I don't get why it
> wouldn't make sense?
> 
> Stepping up to create a new subsystem is great, but we need rules
> around what belongs where, we can't just spawn new subsystems when we
> have no clear guidelines on where drivers should land.
> 
> What are the rules for a new accel subsystem? Do we have to now
> retarget the 3 drivers that are queued up to use drm for accelerators,
> because 2 drivers don't?

Isn't there three on the "don't prefer drm" side as well? Habana, 
Toshiba and Samsung? Just so the numbers argument is not misrepresented. 
Perhaps a poll like a) prefer DRM, b) prefer a new subsystem, c) don't 
care in principle; is in order?

More to the point, code sharing is a very compelling argument if it can 
be demonstrated to be significant, aka not needing to reinvent the same 
wheel.

Perhaps one route forward could be a) to consider is to rename DRM to 
something more appropriate, removing rendering from the name and 
replacing with accelerators, co-processors, I don't know... Although I 
am not sure renaming the codebase, character device node names and 
userspace headers is all that feasible. Thought to mention it 
nevertheless, maybe it gives an idea to someone how it could be done.

And b) allow the userspace rules to be considered per driver, or per 
class (is it a gpu or not should be a question that can be answered). 
Shouldn't be a blocker if it still matches the rules present elsewhere 
in the kernel.

Those two would remove the two most contentions points as far as I 
understood the thread.

Regards,

Tvrtko

> There's a lot more to figure out here than merge some structures and
> it will be fine.
> 
> I think the one area I can see a divide where a new subsystem is for
> accelerators that are single-user, one shot type things like media
> drivers (though maybe they could be just media drivers).
> 
> I think anything that does command offloading to firmware or queues
> belongs in drm, because that is pretty much what the framework does. I
> think it might make sense to enhance some parts of drm to fit things
> in better, but that shouldn't block things getting started.
> 
> I'm considering if, we should add an accelerator staging area to drm
> and land the 2-3 submissions we have and try and steer things towards
> commonality that way instead of holding them out of tree.
> 
> I'd like to offload things from Greg by just not having people submit
> misc drivers at all for things that should go elsewhere.
> 
> Dave.
> 
> 
>>
>> Regarding the open source userspace rules in drm - yes, I think your
>> rules are too limiting for the relatively young AI scene, and I saw at
>> the 2021 kernel summit that other people from the kernel community
>> think that as well.
>> But that's not the main reason, or even a reason at all for doing
>> this. After all, at least for habana, we open-sourced our compiler and
>> a runtime library. And Greg also asked those two drivers if they have
>> matching open-sourced user-space code.
>>
>> And a final reason is that I thought this can also help in somewhat
>> reducing the workload on Greg. I saw in the last kernel summit there
>> was a concern about bringing more people to be kernel maintainers so I
>> thought this is a step in the right direction.
>>
>> Oded
