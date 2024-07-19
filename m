Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A1937C72
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 20:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6598E10EC92;
	Fri, 19 Jul 2024 18:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOh0kvBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ECF10EC92
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721413737; x=1752949737;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FHFGsiCjOEDjK1W0fJVMwqd9akHr6/lWx46Dk1bh+jw=;
 b=ZOh0kvBMiaANM2eDE01fLqFDvUgcBd41fz0Uws9dOJHKiupANboxz6xS
 hlwL94IAblcEu5NJ/bAQF7VrhzRNVJhMSCAAVOJ5m7+OO5x7mz2/kzXty
 YSAt2OCc0Hwd6P3jcuNNuG3Vlww6Q03xZ97a/iIW+C/tAnfxIE3rNHZZI
 I2dNoR+beVRq08a+2EGd7kKUq+WWQA1WMWyH8v0VrHj37gby3gP5LoHEi
 Uk+YgpYyPW6J4GTUkPweBR9FuUJiqs7bLE3BhZanCIvtDvC9loaLcbe0W
 YgYOJzwMRt6W0aUVlBVK+g6Z2Wp1XybxZNgh0ZltckDTmCP6epkrHPVw0 w==;
X-CSE-ConnectionGUID: OptLti93RA6xIT8bPSWLVg==
X-CSE-MsgGUID: 3Ipx+316QXeKSK4huGt74A==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="36484315"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="36484315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 11:26:36 -0700
X-CSE-ConnectionGUID: tD2Yiy7NQQixSR30ZezlkA==
X-CSE-MsgGUID: Fe46p6Y3TDeQhwYtw5ICLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55749369"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 19 Jul 2024 11:26:35 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E6F9E28775;
 Fri, 19 Jul 2024 19:26:32 +0100 (IST)
Message-ID: <cccc02bb-9082-4451-8246-bd2303afa6a3@intel.com>
Date: Fri, 19 Jul 2024 20:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Add missing static inline to
 drm_panic_is_enabled()
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240719122051.1507927-1-jfalempe@redhat.com>
 <0bc6a8d1-d206-4d64-b170-bd70c7129f80@intel.com>
 <f9f2f13a-b66e-461f-88c9-92a42e36bcd5@redhat.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f9f2f13a-b66e-461f-88c9-92a42e36bcd5@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.07.2024 17:37, Jocelyn Falempe wrote:
> 
> 
> On 19/07/2024 17:28, Michal Wajdeczko wrote:
>>
>>
>> On 19.07.2024 14:20, Jocelyn Falempe wrote:
>>> This breaks build if DRM_PANIC is not enabled.
>>> Also add the missing include drm_crtc_internal.h in drm_panic.c
>>>
>>> Fixes: 9f774c42a908 ("drm/panic: Add drm_panic_is_enabled()")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_crtc_internal.h | 2 +-
>>>   drivers/gpu/drm/drm_panic.c         | 2 ++
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_crtc_internal.h
>>> b/drivers/gpu/drm/drm_crtc_internal.h
>>> index c10de39cbe83..bbac5350774e 100644
>>> --- a/drivers/gpu/drm/drm_crtc_internal.h
>>> +++ b/drivers/gpu/drm/drm_crtc_internal.h
>>> @@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector
>>> *connector)
>>>   #ifdef CONFIG_DRM_PANIC
>>>   bool drm_panic_is_enabled(struct drm_device *dev);
>>>   #else
>>> -bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>>> +static inline bool drm_panic_is_enabled(struct drm_device *dev)
>>> {return false; }

btw, missing space after opening {

did you run checkpatch.pl ?

>>>   #endif
>>
>> shouldn't this whole chunk be part of <drm/drm_panic.h> ?
>> other exported drm_panic functions have forward declarations there
>>
> drm/drm_panic.h is for GPU drivers implementing drm_panic.
> And they don't need this function.
> 
> This function is only for drm internal (it's called from drm_fb_helper.c).
> 
> Sima suggested this change in my previous series:
> https://lists.freedesktop.org/archives/dri-devel/2024-July/462375.html
> 
> I will move drm_panic_[un]register() prototypes there for the same
> reason in follow-up patch.
> 

hmm, but then IMO there is a little (?) problem with the layering, as
drm_panic.h no longer matches drm_panic.c and forward decls for
functions from drm_panic.c are in some random internal header

but that's probably topic for another discussion, and now we need to fix
the drm-tip ASAP, so with above nit fixed:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
