Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211513EB27F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 10:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9EE6E56A;
	Fri, 13 Aug 2021 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698C96E56A;
 Fri, 13 Aug 2021 08:19:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="212411480"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="212411480"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 01:19:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="528352765"
Received: from mbubula-mobl1.ger.corp.intel.com (HELO [10.252.55.29])
 ([10.252.55.29])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 01:19:40 -0700
Subject: Re: [PATCH 2/2] drm/i915: Add pci ids and uapi for DG1
To: Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210812124452.622233-1-maarten.lankhorst@linux.intel.com>
 <20210812124452.622233-2-maarten.lankhorst@linux.intel.com>
 <CAKMK7uGMqYbiqZqV4gUy1KMbBCX=ZAGf-vT69SP9LbZU3hcSiQ@mail.gmail.com>
 <CAOFGe97N1-6wuP0FxvsYkXknBFW3PaU69kGqAGbJh+o8L53zrA@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <3aeb1745-f8ea-95c5-a23b-d077f0a4bccd@linux.intel.com>
Date: Fri, 13 Aug 2021 10:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe97N1-6wuP0FxvsYkXknBFW3PaU69kGqAGbJh+o8L53zrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 12-08-2021 om 23:10 schreef Jason Ekstrand:
> On Thu, Aug 12, 2021 at 9:49 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> On Thu, Aug 12, 2021 at 2:44 PM Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com> wrote:
>>> DG1 has support for local memory, which requires the usage of the
>>> lmem placement extension for creating bo's, and memregion queries
>>> to obtain the size. Because of this, those parts of the uapi are
>>> no longer guarded behind FAKE_LMEM.
>>>
>>> According to the pull request referenced below, mesa should be mostly
>>> ready for DG1. VK_EXT_memory_budget is not hooked up yet, but we
>>> should definitely just enable the uapi parts by default.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> References: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11584
>>> Cc: Jordan Justen jordan.l.justen@intel.com
>>> Cc: Jason Ekstrand jason@jlekstrand.net
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Jason Ekstrand <jason@jlekstrand.net>
>
>>> ---
>>>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 3 ---
>>>  drivers/gpu/drm/i915/i915_pci.c            | 1 +
>>>  drivers/gpu/drm/i915/i915_query.c          | 3 ---
>>>  3 files changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> index 23fee13a3384..1d341b8c47c0 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> @@ -347,9 +347,6 @@ static int ext_set_placements(struct i915_user_extension __user *base,
>>>  {
>>>         struct drm_i915_gem_create_ext_memory_regions ext;
>>>
>>> -       if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
>>> -               return -ENODEV;
>>> -
>>>         if (copy_from_user(&ext, base, sizeof(ext)))
>>>                 return -EFAULT;
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>>> index 1bbd09ad5287..93ccdc6bbd03 100644
>>> --- a/drivers/gpu/drm/i915/i915_pci.c
>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>>> @@ -1115,6 +1115,7 @@ static const struct pci_device_id pciidlist[] = {
>>>         INTEL_RKL_IDS(&rkl_info),
>>>         INTEL_ADLS_IDS(&adl_s_info),
>>>         INTEL_ADLP_IDS(&adl_p_info),
>>> +       INTEL_DG1_IDS(&dg1_info),
>>>         {0, 0, 0}
>>>  };
>>>  MODULE_DEVICE_TABLE(pci, pciidlist);
>>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>>> index e49da36c62fb..5e2b909827f4 100644
>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>> @@ -432,9 +432,6 @@ static int query_memregion_info(struct drm_i915_private *i915,
>>>         u32 total_length;
>>>         int ret, id, i;
>>>
>>> -       if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
>>> -               return -ENODEV;
>>> -
>>>         if (query_item->flags != 0)
>>>                 return -EINVAL;
>>>
>>> --
>>> 2.32.0
>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

Pushed this patch and did the revert from previous patch in drm-intel/topic/core-for-ci, enjoy!

