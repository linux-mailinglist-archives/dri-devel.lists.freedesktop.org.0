Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228A139B9FB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FE66E4BA;
	Fri,  4 Jun 2021 13:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0E26E5BD;
 Fri,  4 Jun 2021 13:38:52 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a11so13850962ejf.3;
 Fri, 04 Jun 2021 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Tj0G0XSg7Nx3nQIkh7MdEjpygJdtAfUFdAzLDfqqW9k=;
 b=p+05F38oKu1FTKbgI5lkUNKxuXrlfJN3DpaoHEvAd4RRA53LEa8qRU8RMZP6rmbbJe
 lTcuh0mPiMIQz75Depg9/IAuQqnV+6CfIYYjeo0+B2ceC2Y9yxE+/+i/bhsVJHmt7BuT
 0YAxoGCI/DofOv4MRCdfsKxOs1gD37WOWrIgbkPxX9fN4k8BgV6EMTov65d6pv4jSHfc
 jP2Nl/WpFPgaU2PyL1QddslzwV9S5+z+z4WxgNFBoOobhrkprFsD8rTIci/7ef8d1OQM
 Jt6K9rfbq1rmjKUr+su9H8DSNCjlwQDaifuWdvLhs2nbBk/h0MBvWuz0FX3k8k+mn7hf
 R92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Tj0G0XSg7Nx3nQIkh7MdEjpygJdtAfUFdAzLDfqqW9k=;
 b=HR/dzI7u1lahRn1yBbJ4Sh8q+WAAnPQYRfotNXZ3ZbaRefz25rqbFFXFffgstkYW2e
 ZXawedb7futs8p6skFqKp58nQNTzbvGaO6/ijdCjBqGQTDZ/nh1wbiEgOKKmjG/Rr6If
 vlFAmu6hyJUTFoWK44QXGAsfZMOfcab8GOyd0KpF6z16mCcDiRsjDTqw1GXgs2ZsxKgR
 UOkFo+wjTyRiOFVCZL0ECx6cO7vnp2HU9cHt98ZjsnxWas6R7RANYBSx0Mr3p94gZKdJ
 U3PVA4sw2HIMqCCbXp/UHMbisoY8NovNYpF6GCFHNxQq3YEdzUmcJ0Euia+tXe35BH3G
 /FFw==
X-Gm-Message-State: AOAM532+mF2p0gT5gMUpWLuuyHgNrrLX0qThPqRchHekb5AiNfDMEM2Z
 fqa1mcATr0femwbk2vd8/ps=
X-Google-Smtp-Source: ABdhPJyAAy9VOY/zxOH0qgt/LWuB8qUDUan96nCKG5Ukkx+SgX5/zUYgSketWk+3R4/vwhRDnVPVBg==
X-Received: by 2002:a17:906:26cb:: with SMTP id
 u11mr4318532ejc.385.1622813930706; 
 Fri, 04 Jun 2021 06:38:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id f21sm3311825edr.45.2021.06.04.06.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 06:38:50 -0700 (PDT)
Subject: Re: [Intel-gfx] Merging TTM branches through the Intel tree?
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b81637c8-fd97-0927-f356-51fa98604bd1@gmail.com>
Date: Fri, 4 Jun 2021 15:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLnuj0jmF8q05pta@phenom.ffwll.local>
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

Am 04.06.21 um 11:12 schrieb Daniel Vetter:
> On Fri, Jun 04, 2021 at 11:01:40AM +0200, Thomas Hellström wrote:
>> On 6/4/21 9:51 AM, Christian König wrote:
>>> Am 03.06.21 um 09:36 schrieb Daniel Vetter:
>>>> On Thu, Jun 3, 2021 at 8:50 AM Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>> On 6/2/21 8:40 PM, Daniel Vetter wrote:
>>>>>> On Wed, Jun 02, 2021 at 11:48:41AM +0200, Christian König wrote:
>>>>>>> Am 02.06.21 um 11:16 schrieb Thomas Hellström (Intel):
>>>>>>>> On 6/2/21 10:32 AM, Christian König wrote:
>>>>>>>>> Uff I'm just waiting for feedback from Philip to
>>>>>>>>> merge a large patch
>>>>>>>>> set for TTM through drm-misc-next.
>>>>>>>>>
>>>>>>>>> I'm pretty sure we will run into merge conflicts if you try to push
>>>>>>>>> your changes through the Intel tree.
>>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>> OK, so what would be the best approach here?, Adding
>>>>>>>> the TTM patches to
>>>>>>>> drm-misc-next when your set has landed?
>>>>>>> I think I will send out out my set to Matthew once more
>>>>>>> for review, then
>>>>>>> push the common TTM stuff to drm-misc-next as much as possible.
>>>>>>>
>>>>>>> Then you should be able to land your stuff to
>>>>>>> drm-misc-next and rebase on
>>>>>>> the end result.
>>>>>>>
>>>>>>> Just need to note to David that drm-misc-next should be
>>>>>>> merged to drm-next
>>>>>>> before the Intel patches depending on that stuff land as well.
>>>>>> Other option (because the backmerges tend to be slow) is a
>>>>>> topic branch,
>>>>>> and we just eat/resolve the conflicts in both drm-misc-next and
>>>>>> drm-intel-gt-next in the merge commit. If it's not too bad (I haven't
>>>>>> looked at what exactly we need for the i915 side from ttm in detail).
>>>>>>
>>>>>> But also often figuring out the topic branch logistics takes
>>>>>> longer than
>>>>>> just merging to drm-misc-next as the patches get ready.
>>>>>> -Daniel
>>>>> Daniel: So the thing we need to get into TTM is the iterator-based
>>>>> move_memcpy which is more adaptable than the current one and needed to
>>>>> support non-linear lmem buffers, some bug-fixes and minor changes to be
>>>>> able to keep our short-term-pinning while on the LRU. A necessary evil.
>>>>>
>>>>> Christian: it looks like you have landed some TTM changes already, in
>>>>> particular the &bo->mem -> bo->resource change which is the main
>>>>> conflict I think.
>>> Yes, I thought that pushing this with Matthew rb should solve at least a
>>> bit of the conflict.
>>>
>>>>> Is the 10 patches self-allocation series the main
>>>>> remaining part?
>>> Yes, exactly. I only need Matthew's, Daniel's or your ok and I'm good to
>>> go as well
>>>
>>>>> That will probably cause some conflicts with already
>>>>> pushed i915 TTM setup code, but otherwise will not conflict with the
>>>>> rest of the TTM code I think, which should make it possible to bring in
>>>>> our TTM changes after conflict resolution with what you've already
>>>>> pushed. The memcpy code is pretty self-contained.
>>>> I think in that case topic branch on top of drm-next (once the ttm
>>>> bits we conflict with are there) is probably best, and then pull that
>>>> into drm-misc-next and drm-intel-gt-next. Merge window freeze is also
>>>> approach, so without topic branch we'd be stuck until like -rc2 when
>>>> drm-next reopens. I guess Maarten can do the topic branch logistics in
>>>> drm-misc.git for this.
>>> That approach sounds good to me as well.
>>>
>>> The amdgpu branch had some merge conflicts as well, but nothing we
>>> couldn't fix.
>> OK, so this is going to be a little tricky, I guess.
>>
>>  From what I can tell, the memcpy TTM stuff is resolved locally and can be
>> merged to drm-misc-next immediately. It might have a very minor conflict
>> with your 10 patches I think, if any.
>>
>> Your 10 patches will conflict slightly with current drm-intel-gt-next I
>> think.
>>
>> Remaining intel patches will conflict only with current drm-misc-next.
>>
>> So We could have pull order
>>
>> - drm-misc-next up to bot not including your 10 patches,
>> - drm-intel-gt-next
>> - drm-misc-next from your 10 paches and onwards,
>> - Intel's ttm enablement topic branch.
> If it's just slight conflicts then I wouldn't bother with careful merge
> order. Because if we do this we can get around to the i915 ttm topic
> branch only when we're back to -rc2.

I've just pushed the remaining 10 patches to drm-misc-next and ran into 
minor merge conflicts in drm-tip.

I'm working on this, but I'm not very familiar with drm-tip handling.

Christian.

>
> We can also validate any conflicts in drm-tip easily before they get baked
> in in drm-next.
>
> So I'd just go with
> - drm-misc-next gets those 10 patches from Christian and the memcpy prep
>    stuff from you, gets send to drm-next (that's probably the last feature
>    pull for 5.14 anyway, maybe another one)
> - drm-intel-gt-next gets send to drm-next
> - topic branch with remaining i915 ttm work that's in flight on top of
>    drm-next and we pull that into drm-misc-next and drm-intel-gt-next as
>    needed
>
> Only thing we need for this is a few days of testing to make sure any
> conflicts between -misc-next and -gt-next are fully validated.
>
> Adding Dave for that so he knows too.
>
>> Whether I push the ttm memcpy stuff before your 10 patches or after
>> shouldn't really matter except it might take some time to resolve the 10
>> patches - drm-intel-gt-next conflict in drm-tip.
>>
>> So OK to merge the memcpy stuff to drm-misc-next now or do you want me to
>> hold on?
>>
>> I'll take a look at what's remaining to review in your series. I guess it's
>> in our interest that both these series get merged asap.
> Yeah that part I think makes sense.
> -Daniel
>
>> /Thomas
>>
>>
>>
>>> Christian.
>>>
>>>> -Daniel

