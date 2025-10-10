Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470CBCD47F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 15:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EAB10EC04;
	Fri, 10 Oct 2025 13:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HY/RVGu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2642210EBFF;
 Fri, 10 Oct 2025 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760103203; x=1791639203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gabgu1h6d2AUTWUQ0DHufZMY6+w96TLhyOqz/yCr75Q=;
 b=HY/RVGu6cqDtypJXqXzB6Cx0tzAQhdTIJ1GC3R18lnI5mYSUHuA0xBgs
 71E1zcCiRpBIvJtL4HdvBfHigVtEGXBSlg9cKCkKaXjeGJ5XosKXpjQoH
 SNV2EJgf+r5K/65EbujK2a9/Sq1hU+J0nnE+n/hNN55+y28nrrkvm6Qfq
 +zzUx/aOrdXUz93ckhZYENXcKxZ+ofY2a7yUthT2P7tUcxx5okW9DPzJY
 4R3NHwuL4ErnPl04Vh7NE9eNh+Pms32vrg3yaOrbPYK7pamxi36Rrv+zD
 lmg7jgm4fvkdLpEUKhGne4rpTMreDZUmmoW9qn1tEhjQ7x3hRzwPWuijr Q==;
X-CSE-ConnectionGUID: vLDgu2McSSqXYIYFr18Xkw==
X-CSE-MsgGUID: vf0B8MAcRVqU5xm9zDxHgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="66177864"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="66177864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 06:33:22 -0700
X-CSE-ConnectionGUID: nS74s3cTTeePfbIpkGXkCg==
X-CSE-MsgGUID: /4bIL38BQjaalaHz0p3ycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="180230404"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.174])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 06:32:30 -0700
Date: Fri, 10 Oct 2025 16:32:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 jani.nikula@intel.com, ville.syrjala@intel.com,
 uma.shankar@intel.com, xaver.hugl@kde.org, andrealmeid@igalia.com,
 naveen1.kumar@intel.com, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 0/2] Async Flip in Atomic ioctl corrections
Message-ID: <aOkK6wzKaLQbOvuV@intel.com>
References: <20251010-async-v2-0-50c6b7a9b654@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251010-async-v2-0-50c6b7a9b654@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Oct 10, 2025 at 02:15:57PM +0530, Arun R Murthy wrote:
> struct drm_crtc_state {
>          /**
>           * @async_flip:
>           *
>           * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
>           * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
> itself yet.
>           */
>          bool async_flip;
> 
> In the existing code the flag async_flip was intended for the legacy
> PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
> As per the hardware feature is concerned, async flip is a plane feature
> and is to be treated per plane basis and not per pipe basis.

You can't treat is as a purely per plane thing. The real problem that
neesd solving is that commit completion happens on a per-crtc basis,
and userspace is dumb enough to try to shove both sync and async stuff
into the same commit. That simply cannot work (unless we downgrade
all such async commits into sync commits).

The sort of compromise that people seem to have agreed on is that we
can allow objects and properties in the async commit that would normally
require a sync commit, but only if their value isn't changing. And
then someone is supposed to filter those out so they don't end up
requiring a real sync commit on the hardware.

I think the only sane way forward is to make the drm core do said
filtering, so that in the end the driver will only see the things
in the commit that are actually supposed to take part in the async
commit. I think in practice it would just involve removing all the
planes with zero property changes from the atomic state before
handing it over to the driver. But so far no one has volunteered
to write that code.

There is of course still the remaining problem of what happens when
there are multiple async flips for different planes in the same commit.
The hardware will complete those at different times, so the driver will
still need to make sure it doesn't signal full commit completion until
all the async flips have finished. Maybe we could eventually add
something to the common commit machinery to help with this, but I
guess we should first implement it in a few drivers.

-- 
Ville Syrjälä
Intel
