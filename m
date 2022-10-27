Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F91610260
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 22:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740A310E6F3;
	Thu, 27 Oct 2022 20:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DB010E00D;
 Thu, 27 Oct 2022 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666901402; x=1698437402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GK/6U/TTsQEF8BHYrBSjmqLyj5BXfQ4NU4SaklzPeHg=;
 b=gWLdERzCsZ6SPIC4QZ3AQyN+8ZOHrSDot0SU+Y3S04fGNQk3E6stUcu2
 awMnHFWioADJMdLLKGNIWUQjJxfLI1grHNIsKjBUoaVAaWiIUpT5XY0wI
 fc8O3qlIglkyQvihc9XEjeVBiNNRN1VhcRijyRwO7FIS8vms4OLnIffHN
 QpEYctQSzpkamUJuALyvIQ3Cz7Z3Q9HzmQgGziSgr97p1aQI2mbvANsCv
 sr3E/JsIl19oKF4P1OiK0XQi7n+xz0PmpTtJTbsYmy+BmilciYW6tgjj2
 Z+lyMA3zWhClAbt0Q+si5rGi6so2lxoNHo1GDSi9BRdkQwv1Gk0ndwxrx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="372541480"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="372541480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 13:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="695951649"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="695951649"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 27 Oct 2022 13:09:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Oct 2022 23:09:56 +0300
Date: Thu, 27 Oct 2022 23:09:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: jim.cromie@gmail.com
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
Message-ID: <Y1rllFeOnT9/PQVA@intel.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
 <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, Jason Baron <jbaron@akamai.com>,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 joe@perches.com, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 01:55:39PM -0600, jim.cromie@gmail.com wrote:
> On Thu, Oct 27, 2022 at 9:59 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wrote:
> > > On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wrote:
> > > >
> > > >
> > > >
> > > > On 10/21/22 05:18, Jani Nikula wrote:
> > > > > On Thu, 20 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > >> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> > > > >>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> > > > >>>> hi Greg, Dan, Jason, DRM-folk,
> > > > >>>>
> > > > >>>> heres follow-up to V6:
> > > > >>>>   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
> > > > >>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > > > >>>>
> > > > >>>> It excludes:
> > > > >>>>   nouveau parts (immature)
> > > > >>>>   tracefs parts (I missed --to=Steve on v6)
> > > > >>>>   split _ddebug_site and de-duplicate experiment (way unready)
> > > > >>>>
> > > > >>>> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
> > > > >>>>
> > > > >>>> If these are good to apply, I'll rebase and repost the rest separately.
> > > > >>>
> > > > >>> All now queued up, thanks.
> > > > >>
> > > > >> This stuff broke i915 debugs. When I first load i915 no debug prints are
> > > > >> produced. If I then go fiddle around in /sys/module/drm/parameters/debug
> > > > >> the debug prints start to suddenly work.
> > > > >
> > > > > Wait what? I always assumed the default behaviour would stay the same,
> > > > > which is usually how we roll. It's a regression in my books. We've got a
> > > > > CI farm that's not very helpful in terms of dmesg logging right now
> > > > > because of this.
> > > > >
> > > > > BR,
> > > > > Jani.
> > > > >
> > > > >
> > > >
> > > > That doesn't sound good - so you are saying that prior to this change some
> > > > of the drm debugs were default enabled. But now you have to manually enable
> > > > them?
> > > >
> > > > Thanks,
> > > >
> > > > -Jason
> > >
> > >
> > > Im just seeing this now.
> > > Any new details ?
> >
> > No. We just disabled it as BROKEN for now. I was just today thinking
> > about sending that patch out if no solutin is forthcoming soon since
> > we need this working before 6.1 is released.
> >
> > Pretty sure you should see the problem immediately with any driver
> > (at least if it's built as a module, didn't try builtin). Or at least
> > can't think what would make i915 any more special.
> >
> 
> So, I should note -
> 99% of my time & energy on this dyndbg + drm patchset
> has been done using virtme,
> so my world-view (and dev-hack-test env) has been smaller, simpler
> maybe its been fatally simplistic.
> 
> ive just rebuilt v6.0  (before the trouble)
> and run it thru my virtual home box,
> I didnt see any unfamiliar drm-debug output
> that I might have inadvertently altered somehow
> 
> I have some real HW I can put a reference kernel on,0
> to look for the missing output, but its all gonna take some time,
> esp to tighten up my dev-test-env
> 
> in the meantime, there is:
> 
> config DRM_USE_DYNAMIC_DEBUG
> bool "use dynamic debug to implement drm.debug"
> default y
> depends on DRM
> depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> depends on JUMP_LABEL
> help
>   Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
>   Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
>   bytes per callsite, the .data costs can be substantial, and
>   are therefore configurable.
> 
> Does changing the default fix things for i915 dmesg ?

I think we want to mark it BROKEN in addition to make sure no one
enables it by accident. We already got one bug report where I had to
ask the reporter to rebuild their kernel since this had gotten
enabled and we didn't get any debugs from the driver probe.

> or is the problem deeper ?
> 
> theres also this Makefile addition, which I might have oversimplified
> 
> CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += -DDYNAMIC_DEBUG_MODULE

-- 
Ville Syrjälä
Intel
