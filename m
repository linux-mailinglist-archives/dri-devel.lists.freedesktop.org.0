Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7C8450403
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C733A6EAB4;
	Mon, 15 Nov 2021 12:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 567A56EA7B;
 Mon, 15 Nov 2021 12:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 82FDD202024;
 Mon, 15 Nov 2021 13:04:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id egoHZeRvx0mx; Mon, 15 Nov 2021 13:04:16 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 2C23F202020;
 Mon, 15 Nov 2021 13:04:16 +0100 (CET)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1mmaid-000Tmm-Fq;
 Mon, 15 Nov 2021 13:04:15 +0100
Message-ID: <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
Date: Mon, 15 Nov 2021 13:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-CA
To: Lang Yu <Lang.Yu@amd.com>
References: <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
 <YZJFHMEqm1oz7QJN@lang-desktop>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Questions about KMS flip
In-Reply-To: <YZJFHMEqm1oz7QJN@lang-desktop>
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
Cc: Christian KKKnig <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian KKKnig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-15 12:31, Lang Yu wrote:
> On Mon, Nov 15, 2021 at 10:49:39AM +0100, Michel DDDnzer wrote:
>> On 2021-11-15 10:04, Lang Yu wrote:
>>> On Mon, Nov 15, 2021 at 09:38:47AM +0100, Michel DDDnzer wrote:
>>>> On 2021-11-15 07:41, Lang Yu wrote:
>>>>> On Fri, Nov 12, 2021 at 05:10:27PM +0100, Michel DDDnzer wrote:
>>>>>> On 2021-11-12 16:03, Christian König wrote:
>>>>>>> Am 12.11.21 um 15:30 schrieb Michel Dänzer:
>>>>>>>> On 2021-11-12 15:29, Michel Dänzer wrote:
>>>>>>>>> On 2021-11-12 13:47, Christian König wrote:
>>>>>>>>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D214621&amp;data=04%7C01%7CLang.Yu%40amd.com%7Cee54c4d055d040ef9f8b08d9a81d3eb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725665833112900%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=7nwIYd1um420XHVpOzeIvz37%2FLQqHF%2F6aRKfzgxUTnM%3D&amp;reserved=0
>>>>>>>>>>
>>>>>>>>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
>>>>>>>>>>
>>>>>>>>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
>>>>>>>>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
>>>>>>>>> dm_plane_helper_cleanup_fb.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
>>>>>>>> This should say amdgpu_display_unpin_work_func.
>>>>>>>
>>>>>>> Ah! So that is the classic (e.g. non atomic) path?
>>>>>>
>>>>>> Presumably.
>>>>>>
>>>>>>
>>>>>>>>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
>>>>>>>
>>>>>>> Nope, my educated guess is rather that we free up the BO before amdgpu_display_unpin_work_func is called.
>>>>>>>
>>>>>>> E.g. not pin unbalance, but rather use after free.
>>>>>>
>>>>>> amdgpu_display_crtc_page_flip_target calls amdgpu_bo_ref(work->old_abo), and amdgpu_display_unpin_work_func calls amdgpu_bo_unref(&work->old_abo) only after amdgpu_bo_unpin. So what you describe could only happen if there's an imbalance elsewhere such that amdgpu_bo_unref is called more often than amdgpu_bo_ref, or maybe if amdgpu_bo_reserve fails in amdgpu_display_unpin_work_func (in which case the "failed to reserve buffer after flip" error message should appear in dmesg).
>>>>>
>>>>>
>>>>> Actually, each call to amdgpu_display_crtc_page_flip_target() will
>>>>>
>>>>> 1, init a work(amdgpu_display_unpin_work_func) to unpin an old buffer
>>>>>    (crtc->primary->fb), the work will be queued in dce_vX_0_pageflip_irq().
>>>>>
>>>>> 2, pin a new buffer, assign it to crtc->primary->fb. But how to unpin it?
>>>>>    Next call.
>>>>>
>>>>> The problem is the pinned buffer of last call to 
>>>>> amdgpu_display_crtc_page_flip_target() is not unpinned.
>>>>
>>>> It's unpinned in dce_v*_0_crtc_disable.
>>>
>>> I just found crtc->primary->fb is NULL when came in dce_v*_0_crtc_disable().
>>> So it's not unpinned...
>>
>> __drm_helper_disable_unused_functions sets crtc->primary->fb = NULL only after calling crtc_funcs->disable. Maybe this path can get hit for a CRTC which was already disabled, in which case crtc->primary->fb == NULL in dce_v*_0_crtc_disable is harmless.
>>
>> Have you checked for the issue I described below? Should be pretty easy to catch.
>>
>>
>>>> I think I've found the problem though: dce_v*_0_crtc_do_set_base pin the BO from target_fb unconditionally, but unpin the BO from the fb parameter only if it's different from the former. So if they're the same, the BO's pin count is incremented by 1.
> 
> Form my observations, amdgpu_bo_unpin() in dce_v*_0_crtc_disable() is
> never called.

It would be expected to happen when the screen turns off, e.g. due to DPMS.


> Though a single call to dce_v*_0_crtc_do_set_base() will 
> only pin the BO, I found it will be unpinned in next call to 
> dce_v*_0_crtc_do_set_base().

Yeah, that's the normal case when the new BO is different from the old one.

To catch the case I described, try something like

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c

index 18a7b3bd633b..5726bd87a355 100644

--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c

+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c

@@ -1926,6 +1926,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,

                return r;



        if (!atomic) {

+               WARN_ON_ONCE(target_fb == fb);

                r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);

                if (unlikely(r != 0)) {

                        amdgpu_bo_unreserve(abo);



-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
