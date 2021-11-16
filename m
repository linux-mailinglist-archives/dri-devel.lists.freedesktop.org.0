Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35C4534A3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 15:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E04C6EB5A;
	Tue, 16 Nov 2021 14:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8695F6EA6F;
 Tue, 16 Nov 2021 14:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 5E152202041;
 Tue, 16 Nov 2021 15:50:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id MEPAWvOihQG7; Tue, 16 Nov 2021 15:50:33 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 558A220203F;
 Tue, 16 Nov 2021 15:50:33 +0100 (CET)
Received: from localhost ([127.0.0.1]) by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mmzn6-000eC4-7Q;
 Tue, 16 Nov 2021 15:50:32 +0100
Message-ID: <b5dc0b2f-523b-eb27-3fba-9ee110f69ee3@daenzer.net>
Date: Tue, 16 Nov 2021 15:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-CA
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
 <YZJFHMEqm1oz7QJN@lang-desktop>
 <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
 <YZMlGSA9iG3aVCUu@lang-desktop>
 <391ee32e-f1b1-d92b-c9f3-17dbc0a9d690@gmail.com>
 <YZNlE9bZSJmTvS6d@lang-desktop>
 <52cc2823-35b3-0cb1-2119-82a3677e9b99@gmail.com>
 <CADnq5_Phwb-qDwtco+dm5n9Z2oveTpba=vxNLjD+geh9wRgFxg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Questions about KMS flip
In-Reply-To: <CADnq5_Phwb-qDwtco+dm5n9Z2oveTpba=vxNLjD+geh9wRgFxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Lang Yu <Lang.Yu@amd.com>,
 Christian KKKnig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-16 15:10, Alex Deucher wrote:
> On Tue, Nov 16, 2021 at 3:09 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>>
>> Am 16.11.21 um 09:00 schrieb Lang Yu:
>>> On Tue, Nov 16, 2021 at 08:14:08AM +0100, Christian KKKnig wrote:
>>>> Am 16.11.21 um 04:27 schrieb Lang Yu:
>>>>> On Mon, Nov 15, 2021 at 01:04:15PM +0100, Michel DDDnzer wrote:
>>>>>> [SNIP]
>>>>>>> Though a single call to dce_v*_0_crtc_do_set_base() will
>>>>>>> only pin the BO, I found it will be unpinned in next call to
>>>>>>> dce_v*_0_crtc_do_set_base().
>>>>>> Yeah, that's the normal case when the new BO is different from the old one.
>>>>>>
>>>>>> To catch the case I described, try something like
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>>>>>
>>>>>> index 18a7b3bd633b..5726bd87a355 100644
>>>>>>
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>>>>>
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>>>>>
>>>>>> @@ -1926,6 +1926,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
>>>>>>
>>>>>>                   return r;
>>>>>>
>>>>>>
>>>>>>
>>>>>>           if (!atomic) {
>>>>>>
>>>>>> +               WARN_ON_ONCE(target_fb == fb);
>>>>>>
>>>>>>                   r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
>>>>>>
>>>>>>                   if (unlikely(r != 0)) {
>>>>>>
>>>>>>                           amdgpu_bo_unreserve(abo);
>>>>>>
>>>>> I did some tests, the warning can be triggered.
>>>>>
>>>>> pin/unpin operations in *_crtc_do_set_base() and
>>>>> amdgpu_display_crtc_page_flip_target() are mixed.
>>>> Ok sounds like we narrowed down the root cause pretty well.
>>>>
>>>> Question is now how can we fix this? Just not pin the BO when target_fb ==
>>>> fb?
>>> That worked. I did a few simple tests and didn't observe ttm_bo_release warnings
>>> any more.
>>>
>>> The pin/unpin logic,
>>>
>>> 1, fist crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
>>> old_fb is NULL.
>>>
>>> 2, second crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
>>> unpins old fb.
>>>
>>> 3, amdgpu_display_crtc_page_flip_target() pin/unpin operations.
>>>
>>> 4, third crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
>>> unpins old fb (it is pinned in last call to amdgpu_display_crtc_page_flip_target)
>>>
>>> 5, amdgpu_display_crtc_page_flip_target() pin/unpin operations.
>>>
>>> .....
>>>
>>> x, reboot, amdgpu_display_suspend_helper() is called, the last pinned fb was unpinned.
>>>
>>> And I didn't observe amdgpu_bo_unpin() in dce_v*_0_crtc_disable() is called.
>>>
>>> If the logic is wrong, please correct me.
>>
>> I can't fully judge because I'm not that deep with my head in the old
>> display code, but from a ten mile high view it sounds sane to me. Michel
>> what do you think?

Sounds good to me.


Would be nice to address the other issue identified in this thread as well:

The pin in amdgpu_display_crtc_page_flip_target is guarded by if (!adev->enable_virtual_display), but the corresponding unpins in 
amdgpu_display_unpin_work_func & dce_v*_0_crtc_disable aren't. This probably results in pin count underflows with virtual display.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
