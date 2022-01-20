Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78147494E19
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 13:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F03510E2E8;
	Thu, 20 Jan 2022 12:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89B10E2E8;
 Thu, 20 Jan 2022 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642682584; x=1674218584;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LxQN3LQ4Y2fQO+qdVXmTdV15Tg7PxkxAqfatNhhw8Bs=;
 b=gJs66Whc07bHJhwxlDgnkYTtdBOpAV8lch8g6RZ/9sLpDs23WQsywisu
 Lcr+FuApADj3y6kfA55MTq8cx+VhPCcchK4hP/CVaiQnsBvu+VslgAdiK
 RZgucI9U4RhMa8RiBcyOuTJAhtzzStUxrgNCbQzN3ZSWmw1a6a70ThqfR
 xR5fhBP28waZ2JXsuw8wQW1bQRb8XxVj/rNJeuSybHR/dM/8K5Phx9afj
 3jCgK2zHX3lwIb1Mu30DEoemO1dUUqOKaCWmlMgbalA6xteKsU7Vq7lvS
 fI6TCfj8SCFsFiGjDSUacQyuUK0iMH3aReLciy+7b9G5qPhLLpZ08mI9b A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="244163050"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="244163050"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 04:43:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="532757226"
Received: from gschleye-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.52.145])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 04:43:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/locking: fix drm_modeset_acquire_ctx kernel-doc
In-Reply-To: <CAKMK7uHqf_Cn02WuZtx7m4_fe-rDKZ=cz0OoHusvEwYBGmVSiA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220120094856.3004147-1-jani.nikula@intel.com>
 <CAKMK7uHqf_Cn02WuZtx7m4_fe-rDKZ=cz0OoHusvEwYBGmVSiA@mail.gmail.com>
Date: Thu, 20 Jan 2022 14:42:57 +0200
Message-ID: <87tudy8tny.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Jan 20, 2022 at 10:49 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> The stack_depot member was added without kernel-doc, leading to below
>> warning. Fix it.
>>
>> ./include/drm/drm_modeset_lock.h:74: warning: Function parameter or
>> member 'stack_depot' not described in 'drm_modeset_acquire_ctx'
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  include/drm/drm_modeset_lock.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
>> index b84693fbd2b5..ec4f543c3d95 100644
>> --- a/include/drm/drm_modeset_lock.h
>> +++ b/include/drm/drm_modeset_lock.h
>> @@ -34,6 +34,7 @@ struct drm_modeset_lock;
>>   * struct drm_modeset_acquire_ctx - locking context (see ww_acquire_ctx)
>>   * @ww_ctx: base acquire ctx
>>   * @contended: used internally for -EDEADLK handling
>> + * @stack_depot: used internally for contention debugging
>
> Uh would be nice to switch to the inline style, since we already have
> inline comments (just not kerneldoc). Either way:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for the review and testing, pushed to drm-misc-next.

BR,
Jani.

>
>
>>   * @locked: list of held locks
>>   * @trylock_only: trylock mode used in atomic contexts/panic notifiers
>>   * @interruptible: whether interruptible locking should be used.
>> --
>> 2.30.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
