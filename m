Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161E65A5E58
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A6510ECCF;
	Tue, 30 Aug 2022 08:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E04210ED40
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:41:40 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4MH14c4KWkz9sXk;
 Tue, 30 Aug 2022 10:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1661848896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5ZPMVhxadbf9vtrHMXgTodBWRS2OT9QwH85pNlr7vI=;
 b=anG3YmkURmaFLsPuqRjcIMcad4YoiniCjjAzfFlA5zQAspE4AEUgcq7D2y/SZhai+D4k8o
 B0e3Tehj7sIYxQCrco2oXN/k9wTy9+yllWadygTrxs5FZl7lJ/qzSMynssH+xhz/Ise8un
 frCRjF6WzJ4frs+M4s1cleEjecy7A72Oqg3QxMzftHHYNzINFM14Rxhs/gnmFKvYzaIfbH
 wtnqSNiLpMZcGx8lRW3BASy3yboz9YbikjV8kdSHVeYIZ7RMF3ZCZnmn+/5ZD94/PrRmD2
 EC1oWlac884s1U3x6qZID5HcjZg3TOejpbogGxk4FYgiVfSPSy2s+a8Qguzvsw==
Message-ID: <f7465260-5f5b-44da-4119-7bae9c8e9c8d@mailbox.org>
Date: Tue, 30 Aug 2022 10:41:33 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Content-Language: en-CA
To: Simon Ser <contact@emersion.fr>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr> <YwiB/xQf6Z6ScU+Z@intel.com>
 <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: m1jzb69eucxk65q75c6dnq3yw975qcrp
X-MBO-RS-ID: a885e6d48843c64160b
X-Rspamd-Queue-Id: 4MH14c4KWkz9sXk
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-29 18:01, Simon Ser wrote:
> On Friday, August 26th, 2022 at 10:19, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Wed, Aug 24, 2022 at 03:08:55PM +0000, Simon Ser wrote:
>>> This new kernel capability indicates whether async page-flips are
>>> supported via the atomic uAPI. DRM clients can use it to check
>>> for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel.
>>
>> I think we'd need to clarify the semantics of the async flag
>> for atomic commits.
>>
>> Eg. on Intel hw only pure page flips are possible async, if you do
>> anything else (change plane size/pos/scaling/etc.) you will need
>> to do a sync update. Technically not even all page flips (from the
>> uapi POV) might be possible as the exact scanout source address
>> is specified via two registers, only one of which can be update
>> async. So technically the two framebuffers might be laid out
>> just slightly differently which could prevent an async flip.
>> Also only some subset of planes actually support async flips.
> 
> Also IIRC some format modifiers don't support async flip at all (CCS)?
> 
>> And on hw where multiple planes support it on the same crtc, only one
>> plane can do it at a time. Well, more accurately we can only select
>> one plane at a time to give us the "flip done" interrupt. I guess
>> if the user wants to async flip multiple planes at the same time
>> we could do them serially as opposed to in parallel to make sure
>> all the flips actually happened before we signal completion of the
>> entire commit. Async flips of multiple planes probably won't
>> happen atomically anyway so doing them serially seems fine.
>>
>> ATM in i915 we probably don't have sufficient state checks in
>> place to catch all the restrictions, and instead in part we rely
>> on the limited scope of the legacy async flip ioctl to make sure
>> the operation doesn't attempt something the hw can't do.
> 
> Yeah, that makes sense.
> 
> In the documentation patch discussion [1], it appears it's not clear what
> drivers should do when async flip isn't possible with the legacy uAPI.
> 
> For the atomic uAPI, we need to pick on of these two approaches:
> 
> 1. Let the kernel fall back to a sync flip if async isn't possible. This
>    simplifies user-space, but then user-space has no reliable way to figure out
>    what really happened (sync or async?). That could be fixed with a new
>    read-only CRTC prop indicating whether the last flip was async or not.
>    However, maybe someone will come up in the future with user-space which
>    needs to only apply an update if async flip is possible, in which case this
>    approach falls short.

The future is now. :)

As I described in the documentation patch discussion, this approach would make it tricky for a Wayland compositor to decide if it should use an async commit (which needs to be done ASAP to serve the intended purpose) or not (in which case the compositor may want to delay the commit as long as possible for minimal latency).


> Another possible shortcoming of the proposed new uAPI here is that user-space
> cannot submit a single atomic commit which updates multiple CRTCs, and
> individually select which CRTC does an async flip. This could be fixed with
> a "ASYNC_FLIP" CRTC prop which the kernel always resets to 0 on commit. I'm not
> sure we want/need to cross that bridge right now, it would be easy enough to
> add as a second step if some user-space would benefit from it.

I thought about this as well, but I came to the conclusion it shouldn't be needed. User space can do one commit for the sync CRTC/s planes first and another commit for the async ones afterwards.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

