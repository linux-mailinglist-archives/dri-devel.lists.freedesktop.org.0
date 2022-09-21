Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D326F5BF778
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103F210E891;
	Wed, 21 Sep 2022 07:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8876010E8A3;
 Wed, 21 Sep 2022 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663744740; x=1695280740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HSZTMK+OzgjkkJc46wpoJ6LXz/VcyVp9nJzrHrfVOlE=;
 b=Pgc3hXG3k5dOAxjz6lzAVh+oal3g9B5cZEuqEiefsrQDLO91qpooC8E+
 P1f8WfC/C8VW7AIgxcQMji8KjQwQVOezBDUS6G/OyHmiNP+U7nK18DVg3
 erxcqoMHIwZb5BxVOCzS7dQu/tsxp4Ymi8WfaiReJW2HHRc29IxTNFRU7
 N4XruSgSTWkT4LAt165vaUrTApHkU+tXZVXE2cDm7Eb7b10iVVRwr631x
 Bq2NTIAirxI/sEmj9QgGkmlMBczqfazijzz3o1xp2FMXxSSlyCjrd8uoq
 eptDLdEQsuNBr3VsGnHy8Ph1kkX68v0rMsUNTM/BCHTsh1XHFYIe45Mz8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="280299082"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="280299082"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 00:18:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="723085499"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 00:18:40 -0700
Date: Wed, 21 Sep 2022 00:18:16 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH v3 10/17] drm/i915/vm_bind: Implement
 I915_GEM_EXECBUFFER3 ioctl
Message-ID: <20220921071816.GY10283@nvishwa1-DESK>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-11-andi.shyti@linux.intel.com>
 <8ecb0b8f-f253-1318-444a-8370960c6140@linux.intel.com>
 <20220901050910.GG10283@nvishwa1-DESK>
 <f0ee82ec-03bd-1e02-affe-98f127b2d72a@linux.intel.com>
 <20220902054158.GJ10283@nvishwa1-DESK>
 <c8055bb0-1aee-c6fb-1b59-f1cd36c39a50@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8055bb0-1aee-c6fb-1b59-f1cd36c39a50@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Ramalingam C <ramalingampc2008@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 04:08:57PM +0100, Tvrtko Ursulin wrote:
>
>On 02/09/2022 06:41, Niranjana Vishwanathapura wrote:
>>On Thu, Sep 01, 2022 at 08:58:57AM +0100, Tvrtko Ursulin wrote:
>>>
>>>
>>>On 01/09/2022 06:09, Niranjana Vishwanathapura wrote:
>>>>On Wed, Aug 31, 2022 at 08:38:48AM +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>>On 27/08/2022 20:43, Andi Shyti wrote:
>>>>>>From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>>>>
>>>>>>Implement new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
>>>>>>works in vm_bind mode. The vm_bind mode only works with
>>>>>>this new execbuf3 ioctl.
>>>>>>
>>>>>>The new execbuf3 ioctl will not have any list of objects to validate
>>>>>>bind as all required objects binding would have been requested by the
>>>>>>userspace before submitting the execbuf3.
>>>>>>
>>>>>>And the legacy support like relocations etc are removed.
>>>>>>
>>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>>><niranjana.vishwanathapura@intel.com>
>>>>>>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>>>>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>>>---
>>>
>>>[snip]
>>>
>>>>>>+static void signal_fence_array(const struct i915_execbuffer *eb,
>>>>>>+������������������ struct dma_fence * const fence)
>>>>>>+{
>>>>>>+��� unsigned int n;
>>>>>>+
>>>>>>+��� for (n = 0; n < eb->num_fences; n++) {
>>>>>>+������� struct drm_syncobj *syncobj;
>>>>>>+������� unsigned int flags;
>>>>>>+
>>>>>>+������� syncobj = ptr_unpack_bits(eb->fences[n].syncobj, &flags, 2);
>>>>>>+������� if (!(flags & I915_TIMELINE_FENCE_SIGNAL))
>>>>>>+����������� continue;
>>>>>>+
>>>>>>+������� if (eb->fences[n].chain_fence) {
>>>>>>+����������� drm_syncobj_add_point(syncobj,
>>>>>>+������������������������� eb->fences[n].chain_fence,
>>>>>>+������������������������� fence,
>>>>>>+������������������������� eb->fences[n].value);
>>>>>>+����������� /*
>>>>>>+������������ * The chain's ownership is transferred to the
>>>>>>+������������ * timeline.
>>>>>>+������������ */
>>>>>>+����������� eb->fences[n].chain_fence = NULL;
>>>>>>+������� } else {
>>>>>>+����������� drm_syncobj_replace_fence(syncobj, fence);
>>>>>>+������� }
>>>>>>+��� }
>>>>>>+}
>>>>>Semi-random place to ask - how many of the code here is direct 
>>>>>copy of existing functions from i915_gem_execbuffer.c? There 
>>>>>seems to be some 100% copies at least. And then some more with 
>>>>>small tweaks. Spend some time and try to figure out some code 
>>>>>sharing?
>>>>>
>>>>
>>>>During VM_BIND design review, maintainers expressed thought on keeping
>>>>execbuf3 completely separate and not touch the legacy execbuf path.
>>>
>>>Got a link so this maintainer can see what exactly was said? Just 
>>>to make sure there isn't any misunderstanding on what "completely 
>>>separate" means to different people.
>>
>>Here is one (search for copypaste/copy-paste)
>>https://patchwork.freedesktop.org/patch/486608/?series=93447&rev=3
>>It is hard to search for old discussion threads. May be maintainers
>>can provide feedback here directly. Dave, Daniel? :)
>
>Thanks. I had a read and don't see a fundamental conflict with what I 
>said. Conclusion seemed to be to go with a new ioctl and implement 
>code sharing where it makes sense. Which is what TODO in the cover 
>letter acknowledges so there should be no disagreement really.
>
>>>>I also think, execbuf3 should be fully separate. We can do some code
>>>>sharing where is a close 100% copy (there is a TODO in cover letter).
>>>>There are some changes like the timeline fence array handling here
>>>>which looks similar, but the uapi is not exactly the same. Probably,
>>>>we should keep them separate and not try to force code sharing at
>>>>least at this point.
>>>
>>>Okay did not spot that TODO in the cover. But fair since it is RFC 
>>>to be unfinished.
>>>
>>>I do however think it should be improved before considering the 
>>>merge. Because looking at the patch, 100% copies are:
>>>
>>>for_each_batch_create_order
>>>for_each_batch_add_order
>>>eb_throttle
>>>eb_pin_timeline
>>>eb_pin_engine
>>>eb_put_engine
>>>__free_fence_array
>>>put_fence_array
>>>await_fence_array
>>>signal_fence_array
>>>retire_requests
>>>eb_request_add
>>>eb_requests_get
>>>eb_requests_put
>>>eb_find_context
>>>
>>>Quite a lot.
>>>
>>>Then there is a bunch of almost same functions which could be 
>>>shared if there weren't two incompatible local struct 
>>>i915_execbuffer's. Especially given when the out fence TODO item 
>>>gets handled a chunk more will also become a 100% copy.
>>>
>>
>>There are difinitely a few which is 100% copies hence should have a
>>shared code.
>>But some are not. Like, fence_array stuff though looks very similar,
>>the uapi structures are different between execbuf3 and legacy execbuf.
>>The internal flags are also different (eg., __EXEC3_ENGINE_PINNED vs
>>__EXEC_ENGINE_PINNED) which causes minor differences hence not a
>>100% copy.
>>
>>So, I am not convinced if it is worth carrying legacy stuff into
>>execbuf3 code. I think we need to look at these on a case by case
>>basis and see if abstracting common functionality to a separate
>>shared code makes sense or it is better to keep the code separate.
>
>No one is suggesting to carry any legacy stuff into eb3. What I'd 
>suggest is to start something like i915_gem_eb_common.h|c and stuff 
>the 100% copies from the above list in there.
>
>Common struct eb with struct eb2 and eb3 inheriting from it should do 
>the trick. Similarly eb->flags shouldn't be a hard problem to solve.
>
>Then you see what remains and whether it makes sense to consolidate further.
>

Tvrtko,

I have posted vm_bind v4 rfc series with some code sharing between two
execbuf paths. My approach was not having to touch legacy execbuff path
all over the place.

Regards,
Niranjana

>Regards,
>
>Tvrtko
>
>>>This could be done by having a common struct i915_execbuffer and 
>>>then eb2 and eb3 specific parts which inherit from it. After that 
>>>is done it should be easier to see if it makes sense to do 
>>>something more and how.
>>
>>I am not a big fan of it. I think we should not try to load the execbuf3
>>code with the legacy stuff.
>>
>>Niranjana
>>
>>>
>>>Regards,
>>>
>>>Tvrtko
