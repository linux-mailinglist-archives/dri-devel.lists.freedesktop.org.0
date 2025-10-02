Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1EBB3D15
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 13:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0743510E7B5;
	Thu,  2 Oct 2025 11:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXYmSuXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB1F10E7B5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759405828; x=1790941828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e846lI4GUrRlmCzbfuyIUQ64r0HkpKJE0dmNFRoRhMc=;
 b=UXYmSuXwoxFQcY/poeyKn2qUudIP+QcQhyCEp2TZnI4jgV902ygr7CMH
 k8DVaNewqsPA07zWAGauY4k4d3lE9B1mXevjqaA1jAfHDVJWOhWkKTXqP
 +Xbvv+22QCA0opU+0YGIEsmy5B+boutkcIDltJq5CwcjlOS7itCRSVhU2
 KVRgezIpHx1WS6IGwDGMfXVKdbLu533JmZvhYfKYMcftvtyZUq93gPmfs
 zfduELqFbxzDPm+4LVTka5h0Y6V5549UG7THEqkPIwZ0J7S8Zay9XYn4B
 qzA9rSW4WoxG5zn/t/9CA1zk7HsVsnP75N1r1o1GcWzC798VrQTIaDGXi A==;
X-CSE-ConnectionGUID: 0tQ8yHP+QyCYr3/EuNnZQg==
X-CSE-MsgGUID: qohdpbpqT7CAUvGAulUvwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61647197"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61647197"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 04:50:27 -0700
X-CSE-ConnectionGUID: F7aCYr0aT1S2RHwOL2OtJA==
X-CSE-MsgGUID: GZomKRL3QIyXGFUn6kMYqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="183434127"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 04:50:24 -0700
Date: Thu, 2 Oct 2025 14:50:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] drm/vblank: downgrade vblank wait timeout from WARN
 to debug
Message-ID: <aN5m_TRNsWSQVtnD@intel.com>
References: <20251002025723.9430-1-chintanlike@gmail.com>
 <aN5klZdl2MZdPSpU@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN5klZdl2MZdPSpU@intel.com>
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

On Thu, Oct 02, 2025 at 02:40:05PM +0300, Ville Syrjälä wrote:
> On Wed, Oct 01, 2025 at 07:57:23PM -0700, Chintan Patel wrote:
> > When wait_event_timeout() in drm_wait_one_vblank() times out, the
> > current WARN can cause unnecessary kernel panics in environments
> > with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
> > under scheduler pressure or from invalid userspace calls, so they are
> > not always a kernel bug.
> 
> "invalid userspace calls" should never reach this far.
> That would be a kernel bug.

I was also wondering how you could get this due to some scheduler
screwup, but I suppose that could theoretically happen with threaded 
irqs, or whatever work/etc is used to update the vblank count on
drivers that don't have hardware interrupts for it. 100+ msec
hw interrupt latency sounds excessive to me though.

But since you reference some syzbot reports below, are you
actually trying to hide real kernel bugs that syzbot found?

> 
> > 
> > Replace the WARN with drm_dbg_kms() messages that provide useful
> > context (last and current vblank counters) without crashing the
> > system. Developers can still enable drm.debug to diagnose genuine
> > problems.
> > 
> > Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
> > Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> > 
> > Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> > 
> > v2:
> >  - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
> >  - Remove else branch, only log timeout case
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 46f59883183d..a94570668cba 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -1289,7 +1289,7 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
> >  {
> >  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
> >  	int ret;
> > -	u64 last;
> > +	u64 last, curr;
> >  
> >  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
> >  		return;
> > @@ -1305,7 +1305,12 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
> >  				 last != drm_vblank_count(dev, pipe),
> >  				 msecs_to_jiffies(100));
> >  
> > -	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
> > +	curr = drm_vblank_count(dev, pipe);
> > +
> > +	if (ret == 0) {
> > +		drm_dbg_kms(dev, "WAIT_VBLANK: timeout crtc=%d, last=%llu, curr=%llu\n",
> > +			pipe, last, curr);
> 
> It should at the very least be a drm_err(). Though the backtrace can
> be useful in figuring out where the problem is coming from, so not
> too happy about this change.
> 
> > +	}
> >  
> >  	drm_vblank_put(dev, pipe);
> >  }
> > -- 
> > 2.43.0
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
