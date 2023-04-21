Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469A26EA9CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB33E10E066;
	Fri, 21 Apr 2023 11:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B08710E066;
 Fri, 21 Apr 2023 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682078357; x=1713614357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GlskIVbpC/T4dBmlRS8eqI09qaAdrtmiII1F3Y+p6K0=;
 b=etSLKj9Ea5iC4MTMDEYoznjeHm5APMwLwWyrfRK7CUsF6qkyJIdDwT48
 rTvHeGFsHXBHQSR2l0YPUk8WtN3aK8+BCOnaAHUz2V5d7u9B/0dZ3v5QG
 l+YsEFrLqa5Ne9sdMWf1kmbFNhDo9NRzYFw1LYpIGSNhZ4NYq1+HYDFc8
 smpvZKxxJhkkxFSWELJpvlMxUFJ6dKifD6JvEdin9mXyXhi0BswzZRLl3
 5BW6Muxwk8J/YsVrba60JGLUX0s5CDTbBWeDU22AcezdavcJRF2X5Lmi3
 JD5AH0Mwh1zLqaTjkvZb3ZQN4eFVsW6yw7LZ9gvwvpHPpzrx67W9xR/zB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="345994925"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="345994925"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938458823"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="938458823"
Received: from vhavelx-mobl2.ger.corp.intel.com (HELO [10.213.192.37])
 ([10.213.192.37])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 04:59:10 -0700
Message-ID: <e16dc626-30bf-be19-8668-bdc14dfd051a@linux.intel.com>
Date: Fri, 21 Apr 2023 12:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 5/6] drm: Add fdinfo memory stats
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-6-robdclark@gmail.com>
 <CACvgo525ogS4LSZDUyaqjSqjJWj=qLRkphji5469=3obFXoMrQ@mail.gmail.com>
 <f2a423c2-302a-024a-cf65-199f4be6caec@linux.intel.com>
 <CACvgo53dP03r1BuxntyyoYjua5k6XPvVhu4iTGqXJq31UMUgxg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CACvgo53dP03r1BuxntyyoYjua5k6XPvVhu4iTGqXJq31UMUgxg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/04/2023 12:45, Emil Velikov wrote:
> On Fri, 21 Apr 2023 at 12:23, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> 
>> On 21/04/2023 11:26, Emil Velikov wrote:
>>> On Wed, 12 Apr 2023 at 23:43, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>>> +/**
>>>> + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
>>>> + * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
>>>> + * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
>>>> + *
>>>> + * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
>>>> + * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
>>>> + * it still active or not resident, in which case drm_show_fdinfo() will not
>>>
>>> nit: s/can/can be/;s/if it still/if it is still/
>>>
>>>> + * account for it as purgeable.  So drivers do not need to check if the buffer
>>>> + * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
>>>> + * as purgeable even while it is still busy on the GPU.. it does not _actually_
>>>> + * become puregeable until it becomes idle.  The status gem object func does
>>>
>>> nit: s/puregeable/purgeable/
>>>
>>>
>>> I think we want a similar note in the drm-usage-stats.rst file.
>>>
>>> With the above the whole series is:
>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>
>> Have you maybe noticed my slightly alternative proposal? (*) I am not a
>> fan of putting this flavour of accounting into the core with no way to
>> opt out. I think it leaves no option but to add more keys in the future
>> for any driver which will not be happy with the core accounting.
>>
>> *) https://patchwork.freedesktop.org/series/116581/
>>
> 
> Indeed I saw it. Not a fan of it, I'm afraid.

Hard to guess the reasons. :)

Anyway, at a minimum I suggest that if the no opt out version has to go 
in, it is clearly documented drm-*-memory-* is *not* about the full 
memory use of the client, but about memory belonging to user visible 
buffer objects *only*. Possibly going as far as naming the keys as 
drm-user-bo-memory-... That way there is a way to implement proper 
drm-*-memory- in the future.

Regards,

Tvrtko

>>> Fwiw: Keeping the i915 patch as part of this series would be great.
>>> Sure i915_drm_client->id becomes dead code, but it's a piece one can
>>> live with for a release or two. Then again it's not my call to make.
>>
>> Rob can take the i915 patch from my RFC too.
>>
> 
> Indeed.
> 
> -Emil
