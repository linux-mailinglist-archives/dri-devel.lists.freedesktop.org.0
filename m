Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598406B2438
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 13:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98DB10E801;
	Thu,  9 Mar 2023 12:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C3710E7FF;
 Thu,  9 Mar 2023 12:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678365273; x=1709901273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1fJVDXEkwaMvtK85ONFUTT0TBGpr/t89w4ePePPKumw=;
 b=CX3/7NakYlGRBajcZL6B53RO8xOFMh+tzM0S2CzXakPyy7hQH+8OWwZh
 Omr3ovM/3MoOV/Q5GgNkoPA+IFXWXMxqPA2NeuX8aUDHPoLl/hjAOFLaq
 2v7P07l5q3A5V5CZ2JaAfrWQ/cvCvVgKAZNqhJxZhyWaIPqQ33Sy/CPc+
 eXO/04/ehUuE/5xEqUnBHLDQVI2tFSTig9tzNj7wxv9SgbQgG5pLiZcRt
 Gb7OQjXkG4kj8oO8fYFiqpYfENFSVzgsrCpRi60k6V6R2qyjLi8bPhN2X
 wpkAbskXSibvLF8+GHkdK9X3qd5NzVOO0dAC9Xdow7jQov2FcncJNeFiE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335136696"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="335136696"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820588773"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="820588773"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 09 Mar 2023 04:34:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Mar 2023 14:34:28 +0200
Date: Thu, 9 Mar 2023 14:34:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Message-ID: <ZAnSVOrUThPUSBes@intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
 <073f5ef3-523a-2997-c7e9-771cce8f4c24@linux.intel.com>
 <ZAZT6jJlsiTF1A5a@intel.com>
 <3dc66e2540e3dcf8c626d8fe79c6334b1f1066e9.camel@intel.com>
 <34de1995-7c27-c548-fbd0-00de11b5b346@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34de1995-7c27-c548-fbd0-00de11b5b346@linux.intel.com>
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 09, 2023 at 12:09:55PM +0100, Maarten Lankhorst wrote:
> 
> On 2023-03-09 12:04, Hogander, Jouni wrote:
> > On Mon, 2023-03-06 at 22:58 +0200, Ville Syrjälä wrote:
> >> On Mon, Mar 06, 2023 at 09:23:50PM +0100, Maarten Lankhorst wrote:
> >>> Hey,
> >>>
> >>> On 2023-03-06 16:23, Souza, Jose wrote:
> >>>> On Mon, 2023-03-06 at 15:16 +0100, Maarten Lankhorst wrote:
> >>>>> As a fallback if we decide not to merge the frontbuffer
> >>>>> tracking, allow
> >>>>> i915 to keep its own implementation, and do the right thing in
> >>>>> Xe.
> >>>>>
> >>>>> The frontbuffer tracking for Xe is still done per-fb, while
> >>>>> i915 can
> >>>>> keep doing the weird intel_frontbuffer + i915_active thing
> >>>>> without
> >>>>> blocking Xe.
> >>>> Please also disable PSR and FBC with this or at least add a way
> >>>> for users to disable those features.
> >>>> Without frontbuffer tracker those two features will break in some
> >>>> cases.
> >>> FBC and PSR work completely as expected. I don't remove frontbuffer
> >>> tracking; I only remove the GEM parts.
> >>>
> >>> Explicit invalidation using pageflip or CPU rendering + DirtyFB
> >>> continue
> >>> to work, as I validated on my laptop with FBC.
> >> Neither of which are relevant to the removal of the gem hooks.
> >>
> >> Like I already said ~10 times in the last meeting, we need a proper
> >> testcase. Here's a rough idea what it should do:
> >>
> >> prepare a batch with
> >> 1. spinner
> >> 2. something that clobbers the fb
> >>
> >> Then
> >> 1. grab reference crc
> >> 2. execbuffer
> >> 3. dirtyfb
> >> 4. wait long enough for fbc to recompress
> >> 5. terminate spinner
> >> 6. gem_sync
> >> 7. grab crc and compare with reference
> >>
> >> No idea what the current status of PSR+CRC is, so not sure
> >> whether we can actually test PSR or not.
> >>
> > CRC calculation doesn't work with PSR currently. PSR is disabled if CRC
> > capture is requested.
> >
> > Are we supposed to support frontbuffer rendering using GPU?
> 
> No other driver does that.

Every driver does that when you run X w/o a compositor. Assuming
there is an actual GPU in there.

> It's fine if DirtyFB hangs instead until the 
> job it waits on completes.

No one tried to make it just wait for the fence(s) w/o doing
a full blown atomic commit. It might work, but might also
still suck too much. I guess depends on how overloaded the GPU
is.

What we could do is do a frontbuffer invalidate on dirtyfb
invocation, and then once the fence(s) signal we do a frontbuffer
flush. That would most closely match the gem hook behaviour, except
the invalidate comes in a bit later. The alternative would be to
skip the invalidate, which should still guarantee correctness in
the end, just with possibly jankier interactivity.

-- 
Ville Syrjälä
Intel
