Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723C5613769
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 14:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0382110E28E;
	Mon, 31 Oct 2022 13:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D2010E28E;
 Mon, 31 Oct 2022 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667221697; x=1698757697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+6grI54YyHwnooy5K/Se5RAGbjZAcCC4g4XU08B+FhM=;
 b=FYURRbJaHUURbgtm18gNwGvxg8tqfsgMMgbG9N5vJ40CLHaidxtKeucH
 qVfTIdvI4vChsxS4LNoAxzv0rTi5y07JFp5BBh0xTkwHsJM2aKN6e94Le
 6dGXKUHL76y0OIrij16Rd9IpEaQnNZl0QPAGlcqk2qPKJsNSqiYZJLDva
 kVZX7+Af0NdSgDd0qgOqAVqaGblZQKU85agABHgFfBUln6CF39Vsa3f9W
 pqKVCUkyUG5qz+KRNLZ7tOkofDcYp+7eqCxlnfozPcQitBc2GF1vLwfnF
 nJSQQ1Okf9ox2rdYdpra1sAFzjdJ3soeimwVxgYCTlpZcAEQrlo+4+Uls Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="310591408"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="310591408"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 06:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="628235362"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="628235362"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 31 Oct 2022 06:07:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 15:07:43 +0200
Date: Mon, 31 Oct 2022 15:07:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: jim.cromie@gmail.com
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
Message-ID: <Y1/In+ZBzNguVNoy@intel.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
 <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
 <Y1rllFeOnT9/PQVA@intel.com>
 <CAJfuBxw_YFvCtHMwVE0K0fa5GJbrZy4hTOSS9FebeDs6fxUUCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJfuBxw_YFvCtHMwVE0K0fa5GJbrZy4hTOSS9FebeDs6fxUUCA@mail.gmail.com>
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

On Sun, Oct 30, 2022 at 08:42:52AM -0600, jim.cromie@gmail.com wrote:
> On Thu, Oct 27, 2022 at 2:10 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Thu, Oct 27, 2022 at 01:55:39PM -0600, jim.cromie@gmail.com wrote:
> > > On Thu, Oct 27, 2022 at 9:59 AM Ville Syrjälä
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wrote:
> > > > > On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 10/21/22 05:18, Jani Nikula wrote:
> > > > > > > On Thu, 20 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > > > >> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> > > > > > >>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> > > > > > >>>> hi Greg, Dan, Jason, DRM-folk,
> > > > > > >>>>
> > > > > > >>>> heres follow-up to V6:
> > > > > > >>>>   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
> > > > > > >>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > > > > > >>>>
> > > > > > >>>> It excludes:
> > > > > > >>>>   nouveau parts (immature)
> > > > > > >>>>   tracefs parts (I missed --to=Steve on v6)
> > > > > > >>>>   split _ddebug_site and de-duplicate experiment (way unready)
> > > > > > >>>>
> > > > > > >>>> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
> > > > > > >>>>
> > > > > > >>>> If these are good to apply, I'll rebase and repost the rest separately.
> > > > > > >>>
> > > > > > >>> All now queued up, thanks.
> > > > > > >>
> > > > > > >> This stuff broke i915 debugs. When I first load i915 no debug prints are
> > > > > > >> produced. If I then go fiddle around in /sys/module/drm/parameters/debug
> > > > > > >> the debug prints start to suddenly work.
> > > > > > >
> > > > > > > Wait what? I always assumed the default behaviour would stay the same,
> > > > > > > which is usually how we roll. It's a regression in my books. We've got a
> > > > > > > CI farm that's not very helpful in terms of dmesg logging right now
> > > > > > > because of this.
> > > > > > >
> > > > > > > BR,
> > > > > > > Jani.
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > That doesn't sound good - so you are saying that prior to this change some
> > > > > > of the drm debugs were default enabled. But now you have to manually enable
> > > > > > them?
> > > > > >
> > > > > > Thanks,
> > > > > >
> > > > > > -Jason
> > > > >
> > > > >
> > > > > Im just seeing this now.
> > > > > Any new details ?
> > > >
> > > > No. We just disabled it as BROKEN for now. I was just today thinking
> > > > about sending that patch out if no solutin is forthcoming soon since
> > > > we need this working before 6.1 is released.
> > > >
> > > > Pretty sure you should see the problem immediately with any driver
> > > > (at least if it's built as a module, didn't try builtin). Or at least
> > > > can't think what would make i915 any more special.
> > > >
> > >
> > > So, I should note -
> > > 99% of my time & energy on this dyndbg + drm patchset
> > > has been done using virtme,
> > > so my world-view (and dev-hack-test env) has been smaller, simpler
> > > maybe its been fatally simplistic.
> > >
> > > ive just rebuilt v6.0  (before the trouble)
> > > and run it thru my virtual home box,
> > > I didnt see any unfamiliar drm-debug output
> > > that I might have inadvertently altered somehow
> > >
> > > I have some real HW I can put a reference kernel on,0
> > > to look for the missing output, but its all gonna take some time,
> > > esp to tighten up my dev-test-env
> > >
> > > in the meantime, there is:
> > >
> > > config DRM_USE_DYNAMIC_DEBUG
> > > bool "use dynamic debug to implement drm.debug"
> > > default y
> > > depends on DRM
> > > depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> > > depends on JUMP_LABEL
> > > help
> > >   Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
> > >   Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
> > >   bytes per callsite, the .data costs can be substantial, and
> > >   are therefore configurable.
> > >
> > > Does changing the default fix things for i915 dmesg ?
> >
> > I think we want to mark it BROKEN in addition to make sure no one
> 
> Ok, I get the distinction now.
> youre spelling that
>   depends on BROKEN
> 
> I have a notional explanation, and a conflating commit:
> 
> can you eliminate
> git log -p ccc2b496324c13e917ef05f563626f4e7826bef1
> 
> as the cause ?

Reverting that doesn't help.

> 
> 
> 
> commit ccc2b496324c13e917ef05f563626f4e7826bef1
> Author: Jim Cromie <jim.cromie@gmail.com>
> Date:   Sun Sep 11 23:28:51 2022 -0600
> 
>     drm_print: prefer bare printk KERN_DEBUG on generic fn
> 
>     drm_print.c calls pr_debug() just once, from __drm_printfn_debug(),
>     which is a generic/service fn.  The callsite is compile-time enabled
>     by DEBUG in both DYNAMIC_DEBUG=y/n builds.
> 
>     For dyndbg builds, reverting this callsite back to bare printk is
>     correcting a few anti-features:
> 
>     1- callsite is generic, serves multiple drm users.
>        it is soft-wired on currently by #define DEBUG
>        could accidentally: #> echo -p > /proc/dynamic_debug/control
> 
>     2- optional "decorations" by dyndbg are unhelpful/misleading here,
>        they describe only the generic site, not end users
> 
>     IOW, 1,2 are unhelpful at best, and possibly confusing.
> 
> 
> This shouldnt have turned off any debug of any kind
> (drm.debug nor plain pr_debug)
> 
> but that former callsite no longer does the modname:func:line prefixing
> that could have been in effect and relied upon (tested for) by your CI
> 
> 
> I do need to clarify, I dont know exactly what debug/logging output
> is missing such that CI is failing

CI isn't failing. But any logs it produces are 100% useless,
as are any user reported logs.

The debugs that are missing are anything not coming directly
from drm.ko.

The stuff that I see being printed by i915.ko are drm_info()
and the drm_printer stuff from i915_welcome_messages(). That
also implies that drm_debug_enabled(DRM_UT_DRIVER) does at
least still work correctly.

I suspect that the problem is just that the debug calls
aren't getting patched in when a module loads. And fiddling
with the modparam after the fact does trigger that somehow.

-- 
Ville Syrjälä
Intel
