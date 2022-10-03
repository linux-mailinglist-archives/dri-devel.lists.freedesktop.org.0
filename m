Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C5B5F2CBE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 11:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA8810E28F;
	Mon,  3 Oct 2022 09:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA62310E28B;
 Mon,  3 Oct 2022 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664787875; x=1696323875;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=M+H6FCqmNsTak5exqUK5lVk7z/3fhyka/oNeFhEaO48=;
 b=hVvTIUjijxQDJGOvE0DsigV1x/sb6x61yjPM0MLqSnTHv5UJyDKdZ1zZ
 /WBMH1sLqmrEMd3inEp7srMXRBmjhRXU7RJ8OVI3duWdxx55QmEn9ij5C
 1DZRtrD6KXwwG3zihPzVvghZvOrSPT/lvubalFX0hhQlIXTn2hj8n2AKx
 80kAbkHK3k5Q1xwmiiRyX5krQBO6hQhLjRSPYa7LLzvFQjttllbe9Uf2/
 3t9S5En8FSu+gBR/GtebBEPNZKchLorarnLH/cX/UcSwgGZBUyM5tP9L1
 IG93PFgUlrg4N3ALPXBEwgzK643uXTW4N8cuWmMFDQAVn1CV8melciJgp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="328978148"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="328978148"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 02:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="712517556"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="712517556"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 03 Oct 2022 02:04:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Oct 2022 12:04:29 +0300
Date: Mon, 3 Oct 2022 12:04:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: KMS atomic state sets, full vs. minimal (Re: [PATCH v3 0/6] Add
 support for atomic async page-flips)
Message-ID: <YzqlnYrg+yAZ/SNt@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com> <20220930183700.6cf64900@eldfell>
 <YzcPBfLBNzfbHG5W@intel.com> <20221003114849.09265089@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221003114849.09265089@eldfell>
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
Cc: andrealmeid@igalia.com, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 03, 2022 at 11:48:49AM +0300, Pekka Paalanen wrote:
> On Fri, 30 Sep 2022 18:45:09 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Fri, Sep 30, 2022 at 06:37:00PM +0300, Pekka Paalanen wrote:
> > > On Fri, 30 Sep 2022 18:09:55 +0300
> > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >   
> > > > That would actively discourage people from even attempting the
> > > > "just dump all the state into the ioctl" approach with async flips
> > > > since even the props whose value isn't even changing would be rejected.  
> > > 
> > > About that.
> > > 
> > > To me it looks like just a classic case of broken communication.
> > > 
> > > The kernel developers assume that of course userspace will minimize the
> > > state set to only those properties that change, because...?
> > > 
> > > Userspace developers think that of course the kernel will optimize the
> > > state set into minimal changes, because the kernel actually has the
> > > authoritative knowledge of what the current state is, and the driver
> > > actually knows which properties are costly and need to be optimized and
> > > which ones don't matter. It has never even occurred to me that the
> > > kernel would not compare next state to current state.
> > > 
> > > No-one ever documented any expectations, did they?  
> > 
> > Do you really want that for async flips? Async flips can't be
> > done atomically with anything else, so why are you even asking
> > the kernel to do that?
> 
> I'm not talking about async flips only.
> 
> I'm talking about atomic commits in general. I don't think it's a good
> idea to make async atomic commits behave fundamentally different from
> sync atomic commits wrt. what non-changing state you are allowed to
> list in your state set or not.
> 
> Isn't there common DRM code to convert an atomic commit state set into
> state objects? It probably starts by copying the current state, and
> then playing through the commit state set, setting all listed
> properties to their new values? Why wouldn't that loop maintain the
> knowledge of what actually changed?

Any such book keeping is entirely ad-hoc atm. It's also not super
obvious how much of it is actually useful.

You have to do a real commit on the crtc anyway if the crtc (or
on any of its associated objects) is listed in the commit, so
there's not necessarily much to be gained by tracking chages in
all properties.

And that behaviour again enters very muddy waters when combined
with the async flip flag for the entire commit. The current approach
being proposed seems to suggest that we can instead short circuit
async commits when nothing has changed. That is not at all how
sync atomic commits work.

> When you copy the current data, reset all changed-flags to false. When
> you apply each property from the commit set, compare the value and set
> the changed-flag only if the value changes.
> 
> This manufacturing of the new tentative state set happens at atomic
> commit ioctl time before the ioctl returns, right? So the current state
> is well-defined: any previous atomic sync or async commit can be assumed to
> have succeeded even if it hasn't applied in hardware yet if the commit
> ioctl for it succeeded, right?

Yes. We could certainly try to fully track all changes in
properties, but no has measured if there's any real benefit
of doing so.

-- 
Ville Syrjälä
Intel
