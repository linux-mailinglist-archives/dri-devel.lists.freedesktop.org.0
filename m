Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84134EE263
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501AB10E13B;
	Thu, 31 Mar 2022 20:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1706F10E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648757478; x=1680293478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6FSUhXWHeTmhsQiYv8LR1T0P9fCp5kqXY7NGpeKWnqo=;
 b=JYfxVyTANePT9CZ/KLiAUJuOJ5SIPfHDbSML22f11Gn/m0ZF8PylxEUg
 odmvbNOfDYG5c2d2R65BooCXfTSgXLwjGOXyBSVqoAQemH76rWiTOF8pL
 cJfmCmzUYpvEuOEJZaC3QforHUCBoca8OtSaH9Rt2ANSFbvntssogNd/2
 MqZB7Fyv2KBjRT16IS+cenhyJTT42ejVmqPSQTR1QL3Fcaa2iwiDf+zUi
 6ioI7AZ0rPuqZDtCeh7MBLHgdbPaBLTxxXS/8f8KFTUhJRe0DdqDeuUhI
 6Jmd/lGVzU8DZ2S2FPNqJ4KueEBWh5Jyrsiq+M9gpHPznSU5UHOYNK6xO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257530394"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="257530394"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 13:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="695617698"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga001.fm.intel.com with SMTP; 31 Mar 2022 13:11:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Mar 2022 23:11:00 +0300
Date: Thu, 31 Mar 2022 23:11:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <YkYK1O7ETTxGCslm@intel.com>
References: <20220331130545.625721-1-maxime@cerno.tech>
 <YkWruSRsrKv+cQIB@intel.com> <YkXFVdjlPQKZumLp@phenom.ffwll.local>
 <YkXNWxjbAd5ymfcn@intel.com> <YkX84QXOXwF0BbI8@phenom.ffwll.local>
 <YkYGlugdcYOZhDwE@intel.com> <YkYI7QBobW0EQC16@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkYI7QBobW0EQC16@phenom.ffwll.local>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 10:02:53PM +0200, Daniel Vetter wrote:
> On Thu, Mar 31, 2022 at 10:52:54PM +0300, Ville Syrjälä wrote:
> > On Thu, Mar 31, 2022 at 09:11:29PM +0200, Daniel Vetter wrote:
> > > On Thu, Mar 31, 2022 at 06:48:43PM +0300, Ville Syrjälä wrote:
> > > > On Thu, Mar 31, 2022 at 05:14:29PM +0200, Daniel Vetter wrote:
> > > > > On Thu, Mar 31, 2022 at 04:25:13PM +0300, Ville Syrjälä wrote:
> > > > > > On Thu, Mar 31, 2022 at 03:05:45PM +0200, Maxime Ripard wrote:
> > > > > > > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > > > 
> > > > > > > The stuff never really worked, and leads to lots of fun because it
> > > > > > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > > > > > things.
> > > > > > > 
> > > > > > > For async updates we now have a more solid solution with the
> > > > > > > ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> > > > > > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > > > > > routines, doing something similar.
> > > > > > > 
> > > > > > > For everyone else it's probably better to remove the use-after-free
> > > > > > > bug, and encourage folks to use the async support instead. The
> > > > > > > affected drivers which register a legacy cursor plane and don't either
> > > > > > > use the new async stuff or their own commit routine are: amdgpu,
> > > > > > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
> > > > > > > 
> > > > > > > Inspired by an amdgpu bug report.
> > > > > > > 
> > > > > > > v2: Drop RFC, I think with amdgpu converted over to use
> > > > > > > atomic_async_check/commit done in
> > > > > > > 
> > > > > > > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > > > > > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > > > > > Date:   Wed Dec 5 14:59:07 2018 -0500
> > > > > > > 
> > > > > > >     drm/amd/display: Add fast path for cursor plane updates
> > > > > > > 
> > > > > > > we don't have any driver anymore where we have userspace expecting
> > > > > > > solid legacy cursor support _and_ they are using the atomic helpers in
> > > > > > > their fully glory. So we can retire this.
> > > > > > > 
> > > > > > > v3: Paper over msm and i915 regression. The complete_all is the only
> > > > > > > thing missing afaict.
> > > > > > > 
> > > > > > > v4: Rebased on recent kernel, added extra link for vc4 bug.
> > > > > > > 
> > > > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> > > > > > > Link: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
> > > > > > > Cc: mikita.lipski@amd.com
> > > > > > > Cc: Michel Dänzer <michel@daenzer.net>
> > > > > > > Cc: harry.wentland@amd.com
> > > > > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > > > > Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> > > > > > > Tested-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
> > > > > > >  drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
> > > > > > >  drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
> > > > > > >  3 files changed, 15 insertions(+), 13 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > index 9603193d2fa1..a2899af82b4a 100644
> > > > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
> > > > > > >  	int i, ret;
> > > > > > >  	unsigned int crtc_mask = 0;
> > > > > > >  
> > > > > > > -	 /*
> > > > > > > -	  * Legacy cursor ioctls are completely unsynced, and userspace
> > > > > > > -	  * relies on that (by doing tons of cursor updates).
> > > > > > > -	  */
> > > > > > > -	if (old_state->legacy_cursor_update)
> > > > > > > -		return;
> > > > > > > -
> > > > > > >  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> > > > > > >  		if (!new_crtc_state->active)
> > > > > > >  			continue;
> > > > > > > @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
> > > > > > >  			continue;
> > > > > > >  		}
> > > > > > >  
> > > > > > > -		/* Legacy cursor updates are fully unsynced. */
> > > > > > > -		if (state->legacy_cursor_update) {
> > > > > > > -			complete_all(&commit->flip_done);
> > > > > > > -			continue;
> > > > > > > -		}
> > > > > > > -
> > > > > > >  		if (!new_crtc_state->event) {
> > > > > > >  			commit->event = kzalloc(sizeof(*commit->event),
> > > > > > >  						GFP_KERNEL);
> > > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > index bf7ce684dd8e..bde32f5a33cb 100644
> > > > > > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > @@ -8855,6 +8855,19 @@ static int intel_atomic_commit(struct drm_device *dev,
> > > > > > >  				state->base.legacy_cursor_update = false;
> > > > > > >  	}
> > > > > > >  
> > > > > > > +	/*
> > > > > > > +	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
> > > > > > > +	 * everything.
> > > > > > > +	 */
> > > > > > 
> > > > > > Intel cursors can't even do async updates so this is rather
> > > > > > nonsensical. What we need is some kind of reasonable mailbox
> > > > > > support.
> > > > > 
> > > > > This is not the async plane update you're thinking of. i915 really should
> > > > > switch over more to atomic helpers.
> > > > 
> > > > The comment should be clarified then. As is I have no real idea
> > > > what it's trying to say.
> > > 
> > > Use drm_atomic_commit and only overwrite atomic_commit_tail.
> > 
> > You mean drm_atomic_helper_commit() I suppose?
> > 
> > > But I'm not
> > > really clear why the comment isn't clear - i915 is the only driver not
> > > using them, maybe should start to take a look when they're so unfamiliar
> > > :-P
> > 
> > There are a lot of problems with that:
> > - no uapi/hw state split so if there's anything that looks
> >   at the state it's very likely going to get things wrong
> > - it doesn't know anything about i915's own state objects
> > - uses wrong workqueues
> > 
> > Those are the ones that immediately came to mind when I looked
> > at it. Probably I missed some others as well.
> 
> Yeah and we could have fixed them in the shared code, and 5+ years ago I
> even had patches, but i915 gem team had the idea they know better. That
> part really needs to be fixed, and if that means redoing a bunch of
> display work because display team didn't push back on gem team reinventing
> all the wheels ... tough luck.
> 
> I suggest you get started.

I offered to do the hw/uapi split in the core. You refused it.

I raised my objection to the introduction of the single lock
scheme for private state objects. No one was interested.

I don't think this situation is on me.

-- 
Ville Syrjälä
Intel
