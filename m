Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB136B06D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 11:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3096E195;
	Mon, 26 Apr 2021 09:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463796E194;
 Mon, 26 Apr 2021 09:21:13 +0000 (UTC)
IronPort-SDR: lIcAbPAMaGFUI2cexdpCrZAiAkhfBAk98nkaHRgDykMrq9qqMSETeflmoT7BpIjXACTNTx8I4b
 sMV6l2enAu3g==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="194188331"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="194188331"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:21:12 -0700
IronPort-SDR: XApczgaA7qtn7G0vg5iuSgilz5Ke2hjXLwMIEQMfNuedyHRvysQ2yrW8IB/tJnjSHA0hHlnu7y
 yy8fUFCEe17Q==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429328024"
Received: from jmwalsh-mobl.amr.corp.intel.com (HELO [10.213.207.212])
 ([10.213.207.212])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 02:21:10 -0700
Subject: Re: [Intel-gfx] [PATCH 11/19] drm/i915: Update the helper to set
 correct mapping
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-12-matthew.auld@intel.com>
 <7bc2a663-fbc0-6486-341a-7dca980c2440@linux.intel.com>
 <CAM0jSHNhWcscW9txPDyKActTiTWjzhASJb5xC8XPzHeN+Y18QA@mail.gmail.com>
 <9aca524c-3710-dfaa-bfec-aef76aee7b26@linux.intel.com>
 <CAM0jSHN57bwK6f=tH59iAO5R5WpWfZOw56tsjzxVuJf8SkM+vw@mail.gmail.com>
 <ed521b72-4dd0-2b0f-e313-5fc31c37fae1@linux.intel.com>
 <55e16b78-d9ee-a0ad-5877-9901cf74669f@intel.com>
 <5701f034-3da9-55d2-e966-33afb7236b8b@linux.intel.com>
 <0b1b88db-da62-841d-23cd-7902c9a78b77@intel.com>
 <7b108dc9-b03c-2f9c-0d44-cb672daec9ae@linux.intel.com>
 <f0e1ad21-397b-5c32-a368-febfd877f5f3@intel.com>
 <0be7012c-c889-c5c5-6624-2f63b9daf46b@linux.intel.com>
 <CAM0jSHMBTFuO8Th6NDQpGhzr9XtP_zczKSjDiD3Q5onV5MLdYA@mail.gmail.com>
 <CAM0jSHN=08bmcZ+BgmEkZkZu8-1VwzEi_tSgkWv88We5rAm=xw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <883dfc43-0fcd-7a3b-5701-d5726eed9992@linux.intel.com>
Date: Mon, 26 Apr 2021 10:21:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHN=08bmcZ+BgmEkZkZu8-1VwzEi_tSgkWv88We5rAm=xw@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/04/2021 09:57, Matthew Auld wrote:
> On Wed, 21 Apr 2021 at 20:13, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
>>
>> On Wed, 21 Apr 2021 at 16:41, Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>>
>>> On 21/04/2021 12:42, Matthew Auld wrote:
>>>> On 19/04/2021 16:01, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 19/04/2021 15:37, Matthew Auld wrote:
>>>>>> On 19/04/2021 15:07, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 19/04/2021 12:30, Matthew Auld wrote:
>>>>>>>> On 15/04/2021 12:05, Tvrtko Ursulin wrote:
>>>>>>>>>
>>>>>>>>> On 15/04/2021 10:23, Matthew Auld wrote:
>>>>>>>>>> On Thu, 15 Apr 2021 at 09:21, Tvrtko Ursulin
>>>>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 14/04/2021 17:20, Matthew Auld wrote:
>>>>>>>>>>>> On Wed, 14 Apr 2021 at 16:22, Tvrtko Ursulin
>>>>>>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 12/04/2021 10:05, Matthew Auld wrote:
>>>>>>>>>>>>>> From: Venkata Sandeep Dhanalakota
>>>>>>>>>>>>>> <venkata.s.dhanalakota@intel.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Determine the possible coherent map type based on object
>>>>>>>>>>>>>> location,
>>>>>>>>>>>>>> and if target has llc or if user requires an always coherent
>>>>>>>>>>>>>> mapping.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>>>>>>>>>> Cc: CQ Tang <cq.tang@intel.com>
>>>>>>>>>>>>>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>>>>>>>>> Signed-off-by: Venkata Sandeep Dhanalakota
>>>>>>>>>>>>>> <venkata.s.dhanalakota@intel.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  3 ++-
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/intel_engine_pm.c    |  2 +-
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/intel_lrc.c          |  4 +++-
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/intel_ring.c         |  9 ++++++---
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/selftest_context.c   |  3 ++-
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/selftest_hangcheck.c |  4 ++--
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/selftest_lrc.c       |  4 +++-
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/uc/intel_guc.c       |  4 +++-
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/gt/uc/intel_huc.c       |  4 +++-
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/i915_drv.h              | 11
>>>>>>>>>>>>>> +++++++++--
>>>>>>>>>>>>>>      drivers/gpu/drm/i915/selftests/igt_spinner.c |  4 ++--
>>>>>>>>>>>>>>      11 files changed, 36 insertions(+), 16 deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>>>>>> index efe935f80c1a..b79568d370f5 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>>>>>>>> @@ -664,7 +664,8 @@ static int init_status_page(struct
>>>>>>>>>>>>>> intel_engine_cs *engine)
>>>>>>>>>>>>>>          if (ret)
>>>>>>>>>>>>>>                  goto err;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -     vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>>>>>>>>>>>>>> +     vaddr = i915_gem_object_pin_map(obj,
>>>>>>>>>>>>>> + i915_coherent_map_type(engine->i915, obj, true));
>>>>>>>>>>>>>>          if (IS_ERR(vaddr)) {
>>>>>>>>>>>>>>                  ret = PTR_ERR(vaddr);
>>>>>>>>>>>>>>                  goto err_unpin;
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>>>>>>>>>>> index 7c9af86fdb1e..47f4397095e5 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>>>>>>>>>>> @@ -23,7 +23,7 @@ static void dbg_poison_ce(struct
>>>>>>>>>>>>>> intel_context *ce)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          if (ce->state) {
>>>>>>>>>>>>>>                  struct drm_i915_gem_object *obj =
>>>>>>>>>>>>>> ce->state->obj;
>>>>>>>>>>>>>> -             int type =
>>>>>>>>>>>>>> i915_coherent_map_type(ce->engine->i915);
>>>>>>>>>>>>>> +             int type =
>>>>>>>>>>>>>> i915_coherent_map_type(ce->engine->i915, obj, true);
>>>>>>>>>>>>>>                  void *map;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>                  if (!i915_gem_object_trylock(obj))
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>>>>>>>>>>>>> index e86897cde984..aafe2a4df496 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>>>>>>>>>>>>> @@ -903,7 +903,9 @@ lrc_pre_pin(struct intel_context *ce,
>>>>>>>>>>>>>>          GEM_BUG_ON(!i915_vma_is_pinned(ce->state));
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          *vaddr = i915_gem_object_pin_map(ce->state->obj,
>>>>>>>>>>>>>> - i915_coherent_map_type(ce->engine->i915) |
>>>>>>>>>>>>>> + i915_coherent_map_type(ce->engine->i915,
>>>>>>>>>>>>>> + ce->state->obj,
>>>>>>>>>>>>>> + false) |
>>>>>>>>>>>>>>                                           I915_MAP_OVERRIDE);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          return PTR_ERR_OR_ZERO(*vaddr);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_ring.c
>>>>>>>>>>>>>> index aee0a77c77e0..3cf6c7e68108 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
>>>>>>>>>>>>>> @@ -53,9 +53,12 @@ int intel_ring_pin(struct intel_ring
>>>>>>>>>>>>>> *ring, struct i915_gem_ww_ctx *ww)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          if (i915_vma_is_map_and_fenceable(vma))
>>>>>>>>>>>>>>                  addr = (void __force *)i915_vma_pin_iomap(vma);
>>>>>>>>>>>>>> -     else
>>>>>>>>>>>>>> -             addr = i915_gem_object_pin_map(vma->obj,
>>>>>>>>>>>>>> - i915_coherent_map_type(vma->vm->i915));
>>>>>>>>>>>>>> +     else {
>>>>>>>>>>>>>> +             int type =
>>>>>>>>>>>>>> i915_coherent_map_type(vma->vm->i915, vma->obj, false);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +             addr = i915_gem_object_pin_map(vma->obj, type);
>>>>>>>>>>>>>> +     }
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>          if (IS_ERR(addr)) {
>>>>>>>>>>>>>>                  ret = PTR_ERR(addr);
>>>>>>>>>>>>>>                  goto err_ring;
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/selftest_context.c
>>>>>>>>>>>>>> index b9bdd1d23243..26685b927169 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
>>>>>>>>>>>>>> @@ -88,7 +88,8 @@ static int __live_context_size(struct
>>>>>>>>>>>>>> intel_engine_cs *engine)
>>>>>>>>>>>>>>                  goto err;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          vaddr = i915_gem_object_pin_map_unlocked(ce->state->obj,
>>>>>>>>>>>>>> - i915_coherent_map_type(engine->i915));
>>>>>>>>>>>>>> + i915_coherent_map_type(engine->i915,
>>>>>>>>>>>>>> + ce->state->obj, false));
>>>>>>>>>>>>>>          if (IS_ERR(vaddr)) {
>>>>>>>>>>>>>>                  err = PTR_ERR(vaddr);
>>>>>>>>>>>>>>                  intel_context_unpin(ce);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>>>>>>>>>>> index 746985971c3a..5b63d4df8c93 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>>>>>>>>>>>> @@ -69,7 +69,7 @@ static int hang_init(struct hang *h, struct
>>>>>>>>>>>>>> intel_gt *gt)
>>>>>>>>>>>>>>          h->seqno = memset(vaddr, 0xff, PAGE_SIZE);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          vaddr = i915_gem_object_pin_map_unlocked(h->obj,
>>>>>>>>>>>>>> - i915_coherent_map_type(gt->i915));
>>>>>>>>>>>>>> + i915_coherent_map_type(gt->i915, h->obj, false));
>>>>>>>>>>>>>>          if (IS_ERR(vaddr)) {
>>>>>>>>>>>>>>                  err = PTR_ERR(vaddr);
>>>>>>>>>>>>>>                  goto err_unpin_hws;
>>>>>>>>>>>>>> @@ -130,7 +130,7 @@ hang_create_request(struct hang *h,
>>>>>>>>>>>>>> struct intel_engine_cs *engine)
>>>>>>>>>>>>>>                  return ERR_CAST(obj);
>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -     vaddr = i915_gem_object_pin_map_unlocked(obj,
>>>>>>>>>>>>>> i915_coherent_map_type(gt->i915));
>>>>>>>>>>>>>> +     vaddr = i915_gem_object_pin_map_unlocked(obj,
>>>>>>>>>>>>>> i915_coherent_map_type(gt->i915, obj, false));
>>>>>>>>>>>>>>          if (IS_ERR(vaddr)) {
>>>>>>>>>>>>>>                  i915_gem_object_put(obj);
>>>>>>>>>>>>>>                  i915_vm_put(vm);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>>>>>>>>>>>>> index 85e7df6a5123..d8f6623524e8 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>>>>>>>>>>>>> @@ -1221,7 +1221,9 @@ static int compare_isolation(struct
>>>>>>>>>>>>>> intel_engine_cs *engine,
>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>          lrc = i915_gem_object_pin_map_unlocked(ce->state->obj,
>>>>>>>>>>>>>> - i915_coherent_map_type(engine->i915));
>>>>>>>>>>>>>> + i915_coherent_map_type(engine->i915,
>>>>>>>>>>>>>> + ce->state->obj,
>>>>>>>>>>>>>> + false));
>>>>>>>>>>>>>>          if (IS_ERR(lrc)) {
>>>>>>>>>>>>>>                  err = PTR_ERR(lrc);
>>>>>>>>>>>>>>                  goto err_B1;
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>>>>>>>>>>>> index 78305b2ec89d..adae04c47aab 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>>>>>>>>>>>>> @@ -682,7 +682,9 @@ int intel_guc_allocate_and_map_vma(struct
>>>>>>>>>>>>>> intel_guc *guc, u32 size,
>>>>>>>>>>>>>>          if (IS_ERR(vma))
>>>>>>>>>>>>>>                  return PTR_ERR(vma);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -     vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
>>>>>>>>>>>>>> I915_MAP_WB);
>>>>>>>>>>>>>> +     vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
>>>>>>>>>>>>>> + i915_coherent_map_type(guc_to_gt(guc)->i915,
>>>>>>>>>>>>>> + vma->obj, true));
>>>>>>>>>>>>>>          if (IS_ERR(vaddr)) {
>>>>>>>>>>>>>>                  i915_vma_unpin_and_release(&vma, 0);
>>>>>>>>>>>>>>                  return PTR_ERR(vaddr);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>>>>>>>>>>>> index 2126dd81ac38..56d2144dc6a0 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>>>>>>>>>>>>> @@ -82,7 +82,9 @@ static int intel_huc_rsa_data_create(struct
>>>>>>>>>>>>>> intel_huc *huc)
>>>>>>>>>>>>>>          if (IS_ERR(vma))
>>>>>>>>>>>>>>                  return PTR_ERR(vma);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -     vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
>>>>>>>>>>>>>> I915_MAP_WB);
>>>>>>>>>>>>>> +     vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
>>>>>>>>>>>>>> + i915_coherent_map_type(gt->i915,
>>>>>>>>>>>>>> + vma->obj, true));
>>>>>>>>>>>>>>          if (IS_ERR(vaddr)) {
>>>>>>>>>>>>>>                  i915_vma_unpin_and_release(&vma, 0);
>>>>>>>>>>>>>>                  return PTR_ERR(vaddr);
>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h
>>>>>>>>>>>>>> b/drivers/gpu/drm/i915/i915_drv.h
>>>>>>>>>>>>>> index 69e43bf91a15..2abbc06712a4 100644
>>>>>>>>>>>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>>>>>>>>>>>> @@ -78,6 +78,7 @@
>>>>>>>>>>>>>>      #include "gem/i915_gem_context_types.h"
>>>>>>>>>>>>>>      #include "gem/i915_gem_shrinker.h"
>>>>>>>>>>>>>>      #include "gem/i915_gem_stolen.h"
>>>>>>>>>>>>>> +#include "gem/i915_gem_lmem.h"
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>      #include "gt/intel_engine.h"
>>>>>>>>>>>>>>      #include "gt/intel_gt_types.h"
>>>>>>>>>>>>>> @@ -1921,9 +1922,15 @@ static inline int
>>>>>>>>>>>>>> intel_hws_csb_write_index(struct drm_i915_private *i915)
>>>>>>>>>>>>>>      }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>      static inline enum i915_map_type
>>>>>>>>>>>>>> -i915_coherent_map_type(struct drm_i915_private *i915)
>>>>>>>>>>>>>> +i915_coherent_map_type(struct drm_i915_private *i915,
>>>>>>>>>>>>>> +                    struct drm_i915_gem_object *obj, bool
>>>>>>>>>>>>>> always_coherent)
>>>>>>>>>>>>>>      {
>>>>>>>>>>>>>> -     return HAS_LLC(i915) ? I915_MAP_WB : I915_MAP_WC;
>>>>>>>>>>>>>> +     if (i915_gem_object_is_lmem(obj))
>>>>>>>>>>>>>> +             return I915_MAP_WC;
>>>>>>>>>>>>>> +     if (HAS_LLC(i915) || always_coherent)
>>>>>>>>>>>>>> +             return I915_MAP_WB;
>>>>>>>>>>>>>> +     else
>>>>>>>>>>>>>> +             return I915_MAP_WC;
>>>>>>>>>>>>>
>>>>>>>>>>>>> Seems this patch is doing two things.
>>>>>>>>>>>>>
>>>>>>>>>>>>> First it is adding lmem support to this helper by always
>>>>>>>>>>>>> returning WC
>>>>>>>>>>>>> for lmem objects.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Secondly it is introducing an idea of "always coherent" in a
>>>>>>>>>>>>> helper
>>>>>>>>>>>>> called i915_coherent_map_type. Could someone explain what is
>>>>>>>>>>>>> coherent vs
>>>>>>>>>>>>> always coherent?
>>>>>>>>>>>>>
>>>>>>>>>>>>> And also, why is always coherent happy with WB? Sounds counter
>>>>>>>>>>>>> intuitive
>>>>>>>>>>>>> to me.
>>>>>>>>>>>>
>>>>>>>>>>>> All this does is try to keep the existing behaviour intact, whilst
>>>>>>>>>>>> also ensuring that all lmem objects are mapped using only WC, no
>>>>>>>>>>>> matter what. The always_coherent=true thing is for the existing
>>>>>>>>>>>> places
>>>>>>>>>>>> where we sometimes map the object using WB, without first
>>>>>>>>>>>> considering
>>>>>>>>>>>> whether the device has the fast shared LLC vs snooping. Yes, it's
>>>>>>>>>>>> slightly ugly :)
>>>>>>>>>>>
>>>>>>>>>>> Not fully following - if we had to write kerneldoc for
>>>>>>>>>>> always_coherent
>>>>>>>>>>> input argument - what it would say?
>>>>>>>>>>
>>>>>>>>>> @always_coherent - If true we should always try to map the object
>>>>>>>>>> using WB. If false we should only map as WB if the device
>>>>>>>>>> supports the
>>>>>>>>>> fast shared LLC, in the case of snooped devices we will map use WC.
>>>>>>>>>> Note that If the resource is lmem then we will always map as WC,
>>>>>>>>>> regardless of the value of always_coherent, since that's all we
>>>>>>>>>> currently support.
>>>>>>>>>>
>>>>>>>>>> Maybe the naming is poor?
>>>>>>>>>
>>>>>>>>> Maybe just confusing to me, not sure yet.
>>>>>>>>>
>>>>>>>>> So always_coherent is not about how the callers wants to use it,
>>>>>>>>> but about platform knowledge? Or a performance concern for LLC vs
>>>>>>>>> snooping cases? Does WB works (coherently) on snooping platforms?
>>>>>>>>
>>>>>>>> The always_coherent=true is for the existing callers that want WB,
>>>>>>>> regardless of LLC vs snooping.
>>>>>>>>
>>>>>>>> The other callers use the existing i915_coherent_map_type() which
>>>>>>>> only gives out WB for LLC platforms.
>>>>>>>>
>>>>>>>> AFAIK, LLC vs snooping should offer the same in terms of coherency,
>>>>>>>> but in terms of performance the shared LLC is much faster, and so
>>>>>>>> for snooping platforms we choose to not enable WB everywhere.
>>>>>>>>
>>>>>>>> On top of that we now have lmem, but for that we only allow WC.
>>>>>>>> This patch just rolls all of that into one helper, while keeping
>>>>>>>> the existing behaviour unchanged.
>>>>>>>
>>>>>>> Thanks. But I am still struggling with the API. :(
>>>>>>>
>>>>>>> Is the introduction of always_coherent flag in the context of DG1
>>>>>>> required even? AFAICT for lmem objects the flag is ignored so no?
>>>>>>
>>>>>> If we drop the flag/helper thing, then we need something like:
>>>>>>
>>>>>> type = WB;
>>>>>> if (i915_gem_object_is_lmem(obj))
>>>>>>       type = WC;
>>>>>>
>>>>>> vaddr = i915_gem_object_pin_map(obj, type);
>>>>>>
>>>>>> In all the places where we currently do:
>>>>>>
>>>>>> vaddr = i915_gem_object_pin_map(obj, WB);
>>>>>>
>>>>>> Where obj can be lmem, so ctx, ring, guc etc. Is that better or
>>>>>> worse? The existing i915_coherent_map_type() callers should work
>>>>>> as-is, since DG1 is snooped. And this patch just extends that to
>>>>>> cover all cases.
>>>>>>
>>>>>> Perhaps we need a new helper instead? Maybe you have a better idea?
>>>>>
>>>>> Not yet. Would it make sense to put something in kerneldoc about when
>>>>> callers might choose always_coherent true vs false? In terms of
>>>>> expected usage (frequency, simplicity?) and any rules with regards
>>>>> when callers need to worry about flushing/ordering when there are
>>>>> mixed read and writes?
>>>>
>>>> Hmmm, looking at this again, maybe for now we should just go with:
>>>>
>>>> type = WB;
>>>> if (i915_gem_object_is_lmem(obj))
>>>>         type = WC;
>>>>
>>>> vaddr = i915_gem_object_pin_map(obj, type)
>>>>
>>>> Which is way less confusing, plus there are only a handful of places
>>>> where we need this, so doesn't seem too bad?
>>>>
>>>> Alternatively, we could wrap that in something like:
>>>>
>>>> /* Returns WB for system memory, or WC for local memory */
>>>> void *i915_gem_object_pin_map_default(obj);
>>>>
>>>> Thoughts?
>>>
>>> I went and looked at the use sites to try and figure it out.
>>>
>>> First thing, the bool always_coherent story is only relevant when we
>>> decide to place some object in system memory. Otherwise mapping is
>>> always WC so I guess our code needs to handle it anyway. Well, if the
>>> assumption is that we can change the location of the objects and it all
>>> just keeps working? Or that is not the goal?
>>
>> I guess your concern is that mapping as WC has different semantics,
>> and that might somehow break the caller?
>>
>>>
>>> Let see about the users (ignoring selftests):
>>>
>>> 1) lrc_reg_state and ring; always_coherent=false
>>>
>>> Update frequency medium and mostly write from the CPU side.
>>>
>>> They say always_coherent=false - which means they have to handle being
>>> given a WC mapping anyway.
>>>
>>> What is the benefit of ever selecting WB here?
>>>
>>> 2) Engine status page; always_coherent=true
>>>
>>> Frequently read and written from the CPU and GPU so cost of snooping is
>>> therefore fine? Apart from having to be ready to deal with WC anyway.
>>>
>>> 3) dbg_poison_ce; always_coherent=true
>>>
>>> Writes to lrc_reg_state once - meh. Could just as well always ask for WC.
>>>
>>> 4) intel_guc_allocate_and_map_vma; always_coherent=true
>>>
>>> This one has three users:
>>>
>>> a) guc_stage_desc_pool_create stage_desc_pool_vaddr
>>>
>>> This one seems write once at init.
>>>
>>> b) intel_guc_ct_init
>>>
>>> Use for CT communication so similar to CSB on engine status page in
>>> principle. But code also has to deal with WC when object is in lmem.
>>>
>>> c) intel_guc_ads_create
>>>
>>> CPU appears to only write on init and GPU reset.
>>>
>>> 5) intel_huc_rsa_data_create; always_coheret=true
>>>
>>> Called from intel_huc_init so it appears write once from CPU. Not sure
>>> why it would need a coherent mapping if that is correct.
>>>
>>> I think this exercise left me equally confused. Because flushing and
>>> read-write ordering rules are different between WB and WC. And code
>>> which accesses all these mappings either has to know which one is in
>>> use, or does not care. For the latter case we have to be sure about for
>>> every path.
>>
>> Users of pin_map() are generally meant to call flush_map() where
>> appropriate, which should do the right thing for us. For WC it only
>> needs to flush the wcb. For WB it's more complicated since that
>> depends on if the object is considered coherent or not, if it is then
>> we don't need to do anything, otherwise we need to clflush.
>>
>> Also note that we If we just map the buffer as WB, that by itself
>> doesn't magically enable snooping for the pages AFAIK. We still have
>> to tell the GPU that these pages are meant to be coherent, which we
>> always do for LLC platforms I think, since the shared LLC is
>> considered fast, whereas on snooping platforms, we don't enable this
>> by default, and have this as CACHE_NONE instead(see shmem_object_init
>> for example), and incur the cost of additional clflushing.  Doing an
>> explicit i915_gem_object_set_coherency(I915_CACHE_LLC) I think will
>> mark the object as coherent for us. I think there are also some
>> matching GTT bits for caching.
>>
>> Also for DG1 you apparently can't disable snooping, as per what Daniel
>> was saying in another thread.
>>
>>>
>>> The write on init / reset ones are easy enough and it doesn't really
>>> matter for them to use the coherent helper.
>>>
>>> Lrc_reg_state as well I think can be WC with explicit flushing - it has
>>> to on lmem, no?
>>
>> I doubt it has to be, since the GPU still just accesses it through the GTT.
>>
>>>
>>> This leaves the status page (CSB, etc) and GuC CT. Those are frequent
>>> R/W but also code has to be able to handle WC so what is the benefit of
>>> WB? It ends up faster than if it was WC, considering explicit
>>> flushes/barriers are still in there?
>>
>> No idea for GuC, but for the hwsp it's still in system memory, and is
>> WB, even for discrete. Chris measured this to be more performant with
>> our execlists submission path than say just sticking it in lmem, and
>> mapping it as WC.
> 
> Ping? How should we proceed with this patch?

I just re-freshed my memory on when the write combine buffer gets 
flushed and realized uncached reads are also an implicit flush. So my 
complications from earlier reply were purely mine and I think you can 
proceed with the patch as is.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
