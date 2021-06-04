Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6A239BA9B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 16:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11106E059;
	Fri,  4 Jun 2021 14:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362856E059;
 Fri,  4 Jun 2021 14:06:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g8so14743792ejx.1;
 Fri, 04 Jun 2021 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VqbUuTecDRG6kqVgQCdooQUxGUyC+/oN8ye5pYJxZek=;
 b=YdzuqTTIA45UsQ606iB+FcZ6fkKGMf43Lgb3XWtVWD1uAKXntpETqJivgC1vIqBahb
 Q0VxYnQZhvf0XV1+WGaRCq5eI8uJcIYFVL/ZKnB1UVCFGk5pvMOAPL80PeC+PFel5Bug
 MTwMymapnxzprSt/gnKjGhcLaYjOed4y8QP2bOBjqqDaFgW3PkGpAmXK04Gc9Qr0tGfz
 pdCA+akLeDJMeC8PCA0q862E1WkNKe1EUQJTHSC4FEJEq5itEtgIXiElsV2NRP0cw248
 4T6q5s6QzieVwnS/Nqkhu8o0akBg8xtupSApk/VMHQFbPV7SxbaYT3LaZqiEQqQuYurv
 JisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VqbUuTecDRG6kqVgQCdooQUxGUyC+/oN8ye5pYJxZek=;
 b=eXuQKmOnnJT6Tz3UyIdj5uWrTC9jPjwlSpG36UAo0wcZkPrMeL7mOSNba1/DPigpQQ
 jv16gR/7cgmA1GTvPJwfs426e/8C3T159Gxv0F8+nUrJTyEwkNIe06p/nYA4k+A0w8Yr
 no+UHlOSm0qENGGuzYC/U9rtKUYlJJziOwZ9YocpJ9OWMKxFgUiSXPzDsyGOtVFlfgzj
 GQyItjifp8mg8VyLv7rfuVPrX0AZBu66snFNzSm+A9tmgieUWz9/EC3PpBkoBMKzDSYQ
 0fSAMF5wXkaZAAgSzVhBBq4rMFO78J1N74I6ESRVxSRWXoiY/AaJ4Bb/NF0Az2PksJCf
 jkMg==
X-Gm-Message-State: AOAM533tWT7gRK4rgkhZ1Gd2RfYcto+w/MEglxC8VS3IAuvEE7310QpF
 yYfwEvfkN27yY6HkKyKO9wA=
X-Google-Smtp-Source: ABdhPJxm9y7oUklYL2H9o2QL8/GqWQwZ80Z7kBOtG3xitGDzwZPIa66pDnRkjQK3eD0iHr9LCnP1Ng==
X-Received: by 2002:a17:906:f6cb:: with SMTP id
 jo11mr4402509ejb.439.1622815563711; 
 Fri, 04 Jun 2021 07:06:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id v23sm3354805eds.25.2021.06.04.07.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 07:06:03 -0700 (PDT)
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
References: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
 <a6965639-acf6-b5f5-482c-2715e7fa69d4@amd.com>
 <b4c18e45-98c9-ce7f-b22c-c00c795844c2@shipmail.org>
 <baf4f828-76c8-6b47-5bba-9b9c8e7b307b@amd.com>
 <YLfQplT8H6PdCCLX@phenom.ffwll.local>
 <c50fa98f-3735-fe04-d3f9-8a7a08a7562e@linux.intel.com>
 <CAKMK7uE+fB_+UG668O=QMXwQ9_Xb--KhzehT77HLfBoWve-zLg@mail.gmail.com>
 <68e6057c-df17-64ce-3116-cd5e79578795@amd.com>
 <a3f789a0-9e75-280a-7602-4728738024eb@linux.intel.com>
 <YLnuj0jmF8q05pta@phenom.ffwll.local>
 <b81637c8-fd97-0927-f356-51fa98604bd1@gmail.com>
 <4e465ada6f8b1a8b76fea782adcf3043630efa5e.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fd0fa98b-876d-d3e6-0b67-9537d944d33f@gmail.com>
Date: Fri, 4 Jun 2021 16:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4e465ada6f8b1a8b76fea782adcf3043630efa5e.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.06.21 um 16:03 schrieb Thomas Hellström:
> On Fri, 2021-06-04 at 15:38 +0200, Christian König wrote:
>> Am 04.06.21 um 11:12 schrieb Daniel Vetter:
>>> On Fri, Jun 04, 2021 at 11:01:40AM +0200, Thomas Hellström wrote:
>>>> On 6/4/21 9:51 AM, Christian König wrote:
>>>>> Am 03.06.21 um 09:36 schrieb Daniel Vetter:
>>>>>> On Thu, Jun 3, 2021 at 8:50 AM Thomas Hellström
>>>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>>>> On 6/2/21 8:40 PM, Daniel Vetter wrote:
>>>>>>>> On Wed, Jun 02, 2021 at 11:48:41AM +0200, Christian König
>>>>>>>> wrote:
>>>>>>>>> Am 02.06.21 um 11:16 schrieb Thomas Hellström (Intel):
>>>>>>>>>> On 6/2/21 10:32 AM, Christian König wrote:
>>>>>>>>>>> Uff I'm just waiting for feedback from Philip to
>>>>>>>>>>> merge a large patch
>>>>>>>>>>> set for TTM through drm-misc-next.
>>>>>>>>>>>
>>>>>>>>>>> I'm pretty sure we will run into merge conflicts if
>>>>>>>>>>> you try to push
>>>>>>>>>>> your changes through the Intel tree.
>>>>>>>>>>>
>>>>>>>>>>> Christian.
>>>>>>>>>> OK, so what would be the best approach here?, Adding
>>>>>>>>>> the TTM patches to
>>>>>>>>>> drm-misc-next when your set has landed?
>>>>>>>>> I think I will send out out my set to Matthew once more
>>>>>>>>> for review, then
>>>>>>>>> push the common TTM stuff to drm-misc-next as much as
>>>>>>>>> possible.
>>>>>>>>>
>>>>>>>>> Then you should be able to land your stuff to
>>>>>>>>> drm-misc-next and rebase on
>>>>>>>>> the end result.
>>>>>>>>>
>>>>>>>>> Just need to note to David that drm-misc-next should be
>>>>>>>>> merged to drm-next
>>>>>>>>> before the Intel patches depending on that stuff land
>>>>>>>>> as well.
>>>>>>>> Other option (because the backmerges tend to be slow) is
>>>>>>>> a
>>>>>>>> topic branch,
>>>>>>>> and we just eat/resolve the conflicts in both drm-misc-
>>>>>>>> next and
>>>>>>>> drm-intel-gt-next in the merge commit. If it's not too
>>>>>>>> bad (I haven't
>>>>>>>> looked at what exactly we need for the i915 side from ttm
>>>>>>>> in detail).
>>>>>>>>
>>>>>>>> But also often figuring out the topic branch logistics
>>>>>>>> takes
>>>>>>>> longer than
>>>>>>>> just merging to drm-misc-next as the patches get ready.
>>>>>>>> -Daniel
>>>>>>> Daniel: So the thing we need to get into TTM is the
>>>>>>> iterator-based
>>>>>>> move_memcpy which is more adaptable than the current one
>>>>>>> and needed to
>>>>>>> support non-linear lmem buffers, some bug-fixes and minor
>>>>>>> changes to be
>>>>>>> able to keep our short-term-pinning while on the LRU. A
>>>>>>> necessary evil.
>>>>>>>
>>>>>>> Christian: it looks like you have landed some TTM changes
>>>>>>> already, in
>>>>>>> particular the &bo->mem -> bo->resource change which is the
>>>>>>> main
>>>>>>> conflict I think.
>>>>> Yes, I thought that pushing this with Matthew rb should solve
>>>>> at least a
>>>>> bit of the conflict.
>>>>>
>>>>>>> Is the 10 patches self-allocation series the main
>>>>>>> remaining part?
>>>>> Yes, exactly. I only need Matthew's, Daniel's or your ok and
>>>>> I'm good to
>>>>> go as well
>>>>>
>>>>>>> That will probably cause some conflicts with already
>>>>>>> pushed i915 TTM setup code, but otherwise will not conflict
>>>>>>> with the
>>>>>>> rest of the TTM code I think, which should make it possible
>>>>>>> to bring in
>>>>>>> our TTM changes after conflict resolution with what you've
>>>>>>> already
>>>>>>> pushed. The memcpy code is pretty self-contained.
>>>>>> I think in that case topic branch on top of drm-next (once
>>>>>> the ttm
>>>>>> bits we conflict with are there) is probably best, and then
>>>>>> pull that
>>>>>> into drm-misc-next and drm-intel-gt-next. Merge window freeze
>>>>>> is also
>>>>>> approach, so without topic branch we'd be stuck until like -
>>>>>> rc2 when
>>>>>> drm-next reopens. I guess Maarten can do the topic branch
>>>>>> logistics in
>>>>>> drm-misc.git for this.
>>>>> That approach sounds good to me as well.
>>>>>
>>>>> The amdgpu branch had some merge conflicts as well, but nothing
>>>>> we
>>>>> couldn't fix.
>>>> OK, so this is going to be a little tricky, I guess.
>>>>
>>>>   From what I can tell, the memcpy TTM stuff is resolved locally
>>>> and can be
>>>> merged to drm-misc-next immediately. It might have a very minor
>>>> conflict
>>>> with your 10 patches I think, if any.
>>>>
>>>> Your 10 patches will conflict slightly with current drm-intel-gt-
>>>> next I
>>>> think.
>>>>
>>>> Remaining intel patches will conflict only with current drm-misc-
>>>> next.
>>>>
>>>> So We could have pull order
>>>>
>>>> - drm-misc-next up to bot not including your 10 patches,
>>>> - drm-intel-gt-next
>>>> - drm-misc-next from your 10 paches and onwards,
>>>> - Intel's ttm enablement topic branch.
>>> If it's just slight conflicts then I wouldn't bother with careful
>>> merge
>>> order. Because if we do this we can get around to the i915 ttm
>>> topic
>>> branch only when we're back to -rc2.
>> I've just pushed the remaining 10 patches to drm-misc-next and ran
>> into
>> minor merge conflicts in drm-tip.
>>
>> I'm working on this, but I'm not very familiar with drm-tip handling.
>>
>> Christian.
> Np, I'll hold off until Monday.

Ok I've fixed up drm-tip for amdgpu, but there are also merge conflicts 
for i915.

Can you handle those? Doesn't looks to hard, but I would prefer not to 
touch code I can't test.

Christian.

>
> /Thomas
>
>

