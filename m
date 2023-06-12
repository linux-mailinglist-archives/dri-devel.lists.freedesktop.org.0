Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42772BA64
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AA210E1BE;
	Mon, 12 Jun 2023 08:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADFD10E1BB;
 Mon, 12 Jun 2023 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686558369; x=1718094369;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+ogtnKRJGWjGfBa+VpYTRfrIADIeHv6/eKXf/S8bk9w=;
 b=E00VCtILdpVES5a6Dxp6ETsFqSvk5fXnDyTyOxoRmBJK4bZb5HsyL2Pv
 aPTq0euLOa8jRbf36cyyv3pHF29wi5bD5MXvRBLHt1dpGuN6FrBvW8eTT
 WyN6riMQ1xMh7Xk+AQYOfograGgMcwf6t8Vv5+NPRqaq1jLfZoQdjgYIl
 mYaJL5V373wllwep+k8iwl9MGvEzt3wwJdwyWbh9v4jjpmMMvgeEZmtSN
 cwYZ1wCM9IBAVWsAqzc9z4Zv1tj6seazRqZmsMSMJLfWrThyl9d5ReQuq
 uZ/b0gm1l8U6LwLnEj4VpjPYpIm2he1qRx8Z9k2bzlFzlQ7fsxDBzS0f9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347628151"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="347628151"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 01:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744248327"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="744248327"
Received: from mcantwex-mobl.ger.corp.intel.com (HELO [10.213.224.167])
 ([10.213.224.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 01:26:04 -0700
Message-ID: <55cddc4c-9a95-2c92-84d9-b2ea60c358c2@linux.intel.com>
Date: Mon, 12 Jun 2023 09:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/8] drm: Add drm_gem_prime_fd_to_handle_obj
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
 <20230609121143.1232420-7-tvrtko.ursulin@linux.intel.com>
 <2faa3900-6456-136c-0a1a-8629ed6d3784@intel.com>
 <bfa71c75-4b61-ce17-8eba-0aa48ec14097@linux.intel.com>
 <CAF6AEGtcezsfSV3kqdbPUHGN8Pr1Jwo78fvtDQ4aGVZ+b8Ni_w@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGtcezsfSV3kqdbPUHGN8Pr1Jwo78fvtDQ4aGVZ+b8Ni_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Iddamsetty,
 Aravind" <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/06/2023 18:09, Rob Clark wrote:
> On Fri, Jun 9, 2023 at 7:12 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 09/06/2023 13:44, Iddamsetty, Aravind wrote:
>>> On 09-06-2023 17:41, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> I need a new flavour of the drm_gem_prime_fd_to_handle helper, one which
>>>> will return a reference to a newly created GEM objects (if created), in
>>>> order to enable tracking of imported i915 GEM objects in the following
>>>> patch.
>>>
>>> instead of this what if we implement the open call back in i915
>>>
>>> struct drm_gem_object_funcs {
>>>
>>>           /**
>>>            * @open:
>>>            *
>>>            * Called upon GEM handle creation.
>>>            *
>>>            * This callback is optional.
>>>            */
>>>           int (*open)(struct drm_gem_object *obj, struct drm_file *file);
>>>
>>> which gets called whenever a handle(drm_gem_handle_create_tail) is
>>> created and in the open we can check if to_intel_bo(obj)->base.dma_buf
>>> then it is imported if not it is owned or created by it.
>>
>> I wanted to track as much memory usage as we have which is buffer object
>> backed, including page tables and contexts. And since those are not user
>> visible (they don't have handles), they wouldn't be covered by the
>> obj->funcs->open() callback.
>>
>> If we wanted to limit to objects with handles we could simply do what
>> Rob proposed and that is to walk the handles idr. But that does not feel
>> like the right direction to me. Open for discussion I guess.
> 
> I guess you just have a few special case objects per context?

Per context we have context image (register state etc) and ring buffer 
(command emission), per engine.

Then we have all the page table backing store per each VM/ppgtt/context 
allocated as GEM objects.

> Wouldn't it be easier to just track _those_ specially and append them
> to the results after doing the normal idr table walk?

In a way yes and in a way it is not as elegant. IMHO at least.
> (Also, doing something special for dma-buf smells a bit odd..
> considering that we also have legacy flink name based sharing as
> well.)

It's not really special, just needed to return a tuple of (object, 
handle) from the prime import helper. So it can plug into the very same 
tracking I use from other paths.

I was going for some kind of elegance with one loop - single tracking - 
as long as I had to add new list head to our buffer object.

Anyway, I can re-spin a simplified version (fewer patches) with two 
loops. Only downside is that the new list head will only be used for 
internal objects.

Regards,

Tvrtko

P.S.
Flink I indeed missed. Is that used nowadays btw?
