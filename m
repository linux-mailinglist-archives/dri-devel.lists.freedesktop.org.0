Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA15A5DBF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702710EA1F;
	Tue, 30 Aug 2022 08:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F5510EA1F;
 Tue, 30 Aug 2022 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661846907; x=1693382907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aCOtu5mJtloHvcZhzNP00HYW8VmMwT3F6/4mM6Hy5Hk=;
 b=BpmeUbVH68jdxcXQU1eZ9fkqDY0h6c/pfGzK4DgoccIHHG8SKa43lPOy
 sbjHXZkwMg7PmCX8jIyUOs6yT6LLjhZYXYSHSTkGot7EU1Iz1KSP4vT3D
 3RqtDiiZ6VB+TbxBnPL7m2l+Xye7X+pBpXHWUfNcz9VG36i1rmJbNq3iV
 b2YYaTYTIsKgycqudfbViIiuVPumT0nwtkE6+KYTkAnNgE7roS8JzXlUr
 4Rlta/or84K0tqyd4w28A9dtVnRpXT4mTPkS6Dp7P3bSOiTGP4Rc8FazY
 PmxZQgEtB7cjVcmZBBr5RvZYrEcJVlCQtIykt/HPcEaK8a1ygWweH6JfV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="356829683"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="356829683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 01:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="644744769"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 30 Aug 2022 01:08:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 11:08:22 +0300
Date: Tue, 30 Aug 2022 11:08:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <Yw3FdhzAst1RRPxy@intel.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr>
 <YwiB/xQf6Z6ScU+Z@intel.com>
 <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
X-Patchwork-Hint: comment
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 04:01:44PM +0000, Simon Ser wrote:
> On Friday, August 26th, 2022 at 10:19, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Wed, Aug 24, 2022 at 03:08:55PM +0000, Simon Ser wrote:
> > > This new kernel capability indicates whether async page-flips are
> > > supported via the atomic uAPI. DRM clients can use it to check
> > > for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel.
> > 
> > I think we'd need to clarify the semantics of the async flag
> > for atomic commits.
> > 
> > Eg. on Intel hw only pure page flips are possible async, if you do
> > anything else (change plane size/pos/scaling/etc.) you will need
> > to do a sync update. Technically not even all page flips (from the
> > uapi POV) might be possible as the exact scanout source address
> > is specified via two registers, only one of which can be update
> > async. So technically the two framebuffers might be laid out
> > just slightly differently which could prevent an async flip.
> > Also only some subset of planes actually support async flips.
> 
> Also IIRC some format modifiers don't support async flip at all (CCS)?

Yeah, that too. Also planar YUV formats aren't allowed.

> 
> > And on hw where multiple planes support it on the same crtc, only one
> > plane can do it at a time. Well, more accurately we can only select
> > one plane at a time to give us the "flip done" interrupt. I guess
> > if the user wants to async flip multiple planes at the same time
> > we could do them serially as opposed to in parallel to make sure
> > all the flips actually happened before we signal completion of the
> > entire commit. Async flips of multiple planes probably won't
> > happen atomically anyway so doing them serially seems fine.
> > 
> > ATM in i915 we probably don't have sufficient state checks in
> > place to catch all the restrictions, and instead in part we rely
> > on the limited scope of the legacy async flip ioctl to make sure
> > the operation doesn't attempt something the hw can't do.
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
> 2. Make the kernel return EINVAL if async flip isn't possible. This adds more
>    complexity to user-space, but enables a more reliable and deterministic
>    uAPI. This is also more consistent with the rest of the existing atomic
>    uAPI.

The current behaviour is somewhat a combination of the two. We return
an error if async flip is not possible at all given the current state.

When async flip is possible we return success, but may still internally
fall back to a sync flip for the first flip. That is required on some
borked hardware that can't switch from sync flips to async flips without
doing an extra sync flip. Also on some other hardware we intentionally
fall back to a sync flip for the first async flip, so that we can
reprogram some display FIFO stuff (aimed to make the subsequent async
flips faster).

> 
> Note, current user-space would only need to opportunistically enable async
> flip. IOW, I think that for current user-space plans "async if possible,
> otherwise sync" is good enough. That behavior maps well to the Vulkan present
> modes as well (which says that "this mode *may* result in visible tearing", but
> doesn't guarantee it).

The current behaviour is to fall back to a blit if the async
flip fails. So you still get the same effective behaviour, just
not as efficient. I think that's a reasonable way to handle it.

> 
> Another possible shortcoming of the proposed new uAPI here is that user-space
> cannot submit a single atomic commit which updates multiple CRTCs, and
> individually select which CRTC does an async flip. This could be fixed with
> a "ASYNC_FLIP" CRTC prop which the kernel always resets to 0 on commit. I'm not
> sure we want/need to cross that bridge right now, it would be easy enough to
> add as a second step if some user-space would benefit from it.

Technically it should really be per-plane since that is what does
the flip. But I have a feeling that allowing a mix of async and
sync in the same commit is just going to make everything more
complicated without really helping anything (async flips won't
happen atomically anyway with anything else).

One (crazy?) idea I had for the atomic api is that we could even
reject most of the properties already on the uapi level before anyone
gets to examine the final state. Ie. as soon as the atomic ioctl sees
eg. a gamma LUT property change it would just immediately return
an error if async flip is also requested.

> 
> What do you think?
> 
> [1]: https://lore.kernel.org/dri-devel/ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr/

-- 
Ville Syrjälä
Intel
