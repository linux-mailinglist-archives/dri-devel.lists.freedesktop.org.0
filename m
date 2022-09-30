Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557BD5F0F63
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF3110ED6A;
	Fri, 30 Sep 2022 15:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1BE10ED6A;
 Fri, 30 Sep 2022 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664553519; x=1696089519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=838xKXjt/+IyYhwUe/5fHVmfQa3bXikqs9RfFej62Rg=;
 b=gh+PGoo+sLCnSD+4NypLoWumB3+7ldl3GMBEY4I0sNqsvUEZfoWBuQuD
 6v5j/4MsWri300oD/tR0Szaa8jOT4s8zPEdUK4RGQILO8Ew0sSEOwwnaz
 eAhQJOOVoQ0F9zVRzHT36jsydF7YYB8T+SjVMPVQ/eT1TWp+A4pv52sjN
 +/DZs76CLy29e0FRzptsOpuzmWEXmRFJDulDMFpUWYJVXZ3Ei8NfUNME9
 Y+HksKlqO0LQAPvBPGz1DnYzCZTZ6uzEz4UkET6TnWhC3Wvgd/tvnwLRE
 w+bimDwn3E1tBdwfzU7m4R3QTj5zCzH45Sz7akpB8dpGtIIKS6E/z+145 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="282586831"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="282586831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 08:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="600455842"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="600455842"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga006.jf.intel.com with SMTP; 30 Sep 2022 08:58:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 18:58:32 +0300
Date: Fri, 30 Sep 2022 18:58:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: KMS atomic state sets, full vs. minimal (Re: [PATCH v3 0/6] Add
 support for atomic async page-flips)
Message-ID: <YzcSKN+3MS0Dg3mF@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com> <20220930183700.6cf64900@eldfell>
 <YzcPBfLBNzfbHG5W@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzcPBfLBNzfbHG5W@intel.com>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 06:45:09PM +0300, Ville Syrjälä wrote:
> On Fri, Sep 30, 2022 at 06:37:00PM +0300, Pekka Paalanen wrote:
> > On Fri, 30 Sep 2022 18:09:55 +0300
> > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > 
> > > That would actively discourage people from even attempting the
> > > "just dump all the state into the ioctl" approach with async flips
> > > since even the props whose value isn't even changing would be rejected.
> > 
> > About that.
> > 
> > To me it looks like just a classic case of broken communication.
> > 
> > The kernel developers assume that of course userspace will minimize the
> > state set to only those properties that change, because...?
> > 
> > Userspace developers think that of course the kernel will optimize the
> > state set into minimal changes, because the kernel actually has the
> > authoritative knowledge of what the current state is, and the driver
> > actually knows which properties are costly and need to be optimized and
> > which ones don't matter. It has never even occurred to me that the
> > kernel would not compare next state to current state.
> > 
> > No-one ever documented any expectations, did they?
> 
> Do you really want that for async flips? Async flips can't be
> done atomically with anything else, so why are you even asking
> the kernel to do that?

Also what if you want plane 1 to do an async flip, and plane 2 to do
a sync flip? With the single async flag per commit you will end up
with one of the following results:

plane 1      plane 2      outcome
can async    can async    async flip on both planes (totally not what you wanted)
can async    can't async  -EINVAL (what you actually wanted but got unfairly rejected)
can't async  can async    -EINVAL
can't async  can't async  -EINVAL

Those last two are actually reasonable outcomes since the plane
where you did want to async flip didn't support it. But the
first two are just nonsense results.

-- 
Ville Syrjälä
Intel
