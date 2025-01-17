Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D318FA14F89
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 13:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D8E10E03C;
	Fri, 17 Jan 2025 12:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3oOEayr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF71410E03C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737117936; x=1768653936;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7qzdGLU/zvxkBP2/teCl1MFFOLwcFIg/uaUb0hEhy8g=;
 b=L3oOEayrbi4ayvJGMiE3MBJDcYJWhIm2paO0mO6xY9ciTO3dLSM8W0T+
 SL8FHMgD+KBwhHqHeOQMbgWrz8PT2LY1pEyhQSzyYoRPJOz/NCX9JyKHA
 MKF9F3bIggNvgwOuqH4fG6uGV6R7Q7XA+MKVszSaMWjCRhXqOEQkZA5OD
 COlWTgtCv6XOqbfIrbgMedTPqgCZ9G/6RWDls9k/lR+au5bC9c75K8/+d
 zpt9HLnlD3TDpe+9fJQtXSLtRpm4Ktli7gKKPTg0+HgfQ+1+Dx+1fHmDD
 iEgbIZgIXixNsbF1sIirfp2tFhtLKpMBRBxNayJAMq+2QplrsjYtzrBdL A==;
X-CSE-ConnectionGUID: XyqxuJshTYKh0ibU2gSqtQ==
X-CSE-MsgGUID: ydkBZvKyR4i8DajvSk84Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37458639"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37458639"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 04:45:35 -0800
X-CSE-ConnectionGUID: YfU01E7kQAup+FABSIpGYw==
X-CSE-MsgGUID: 9HVBNhXQQBaeiwVrmWYSjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="105979091"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 17 Jan 2025 04:45:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Jan 2025 14:45:31 +0200
Date: Fri, 17 Jan 2025 14:45:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>
Subject: Re: [PATCH] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with
 atomic
Message-ID: <Z4pQ6916_hVJq71x@intel.com>
References: <20250116162528.2235991-1-contact@emersion.fr>
 <Z4o_zteNVH6gqn2h@intel.com>
 <bJlwXyrHx2dVR07f-XR1pvRbKIYBNPCXNptvmU81YxnaCJ2nCfxBNinnpasJdXStjbGzJ0pCY9TlzOdWqWqdDYpaWYjGepN6DDXVhBwpNHM=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bJlwXyrHx2dVR07f-XR1pvRbKIYBNPCXNptvmU81YxnaCJ2nCfxBNinnpasJdXStjbGzJ0pCY9TlzOdWqWqdDYpaWYjGepN6DDXVhBwpNHM=@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2025 at 11:40:15AM +0000, Simon Ser wrote:
> On Friday, January 17th, 2025 at 12:32, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > > + * When used with atomic uAPI, one event will be delivered per CRTC included in
> > > + * the atomic commit. A CRTC is included in an atomic commit if one of its
> > > + * properties is set, or if a property is set on a connector or plane linked
> > > + * via the CRTC_ID property to the CRTC. At least one CRTC must be included,
> > > + * and all pulled in CRTCs must be either previously or newly powered on (in
> > > + * other words, a powered off CRTC which stays off cannot be included in the
> > > + * atomic commit).
> > 
> > I don't understand all this stuff about powered off crtcs? If
> > someone sucks in a powered off thing then things will generally
> > work just fine.
> 
> Not with the page-flip event flag:
> 
> 	/*
> 	 * Reject event generation for when a CRTC is off and stays off.
> 	 * It wouldn't be hard to implement this, but userspace has a track
> 	 * record of happily burning through 100% cpu (or worse, crash) when the
> 	 * display pipe is suspended. To avoid all that fun just reject updates
> 	 * that ask for events since likely that indicates a bug in the
> 	 * compositor's drawing loop. This is consistent with the vblank IOCTL
> 	 * and legacy page_flip IOCTL which also reject service on a disabled
> 	 * pipe.
> 	 */
> 	if (new_crtc_state->event &&
> 	    !new_crtc_state->active && !old_crtc_state->active) {
> 		drm_dbg_atomic(crtc->dev,
> 			       "[CRTC:%d:%s] requesting event but off\n",
> 			       crtc->base.id, crtc->name);
> 		return -EINVAL;
> 	}

OK, so we're only talking about userspace stuff here. The kernel
can still pull stuff in without too many issues (apart from the
one mentined below).

> 
> > There is a bit of corner case with the way we internally complete
> > the commits for disabled things (not just crtcs, but also planes
> > and connectors) and that can apparently happen a bit later than
> > the commit completion for the enabled things. That seems to be
> > causing a bit of grief for sway which insists on adding all kinds
> > of disabled planes to every commit:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13410
> 
> Hm, interesting. So including an already-disabled cursor plane in a
> commit may fail the next commit with EBUY? I expect a lot of user-space
> to do this as well, e.g. Weston.

We may need to think if we could move that internal fake commit
completion earlier a bit. But I don't actually remeber the
specifics why it was added (presumably some commit ordering
vs. cleanup problem) so not sure if that's easily doable or not.

-- 
Ville Syrjälä
Intel
