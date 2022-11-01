Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0261561460B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BA910E32A;
	Tue,  1 Nov 2022 08:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B2A10E323;
 Tue,  1 Nov 2022 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667292752; x=1698828752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j0y/gU0N76hksTyR6uOy3Ksq4bC7H9H77jI0W5EJonU=;
 b=CWZyakall1Y2C935FeUvkWU4FOzlvvGP2QjgG18d91enk7hfnmxCJE0h
 ZAt0LgeIaTre/TKQ5j+InwkMITlgYHP1oKe0HOT3fineHjSxfvkvvpXsr
 eX15Y5FcuYs8CDC2dN+Klx2AG9ly0aoEC7frOA7gjaigk+JvV3FZlpU/v
 isCt8/1AQRtXZo6Hh5GKnwdHr3K5kOBeN2le9eeM3qfhhuiA573NJMgAQ
 x+ZUeVuKJtNUyBNGZaE1OF9Vqio0+yS7caA6Bs4w1IiJturfSq6LllQiS
 iXkXtDiKPR+Tyg1Y4+lwmJfWiWOm+CyM08KECTpBJSMKs4ReuzvudbgyB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="307821406"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="307821406"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 01:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="667127094"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="667127094"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 01 Nov 2022 01:52:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Nov 2022 10:52:26 +0200
Date: Tue, 1 Nov 2022 10:52:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason Baron <jbaron@akamai.com>
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
Message-ID: <Y2DeSlGI38fvzvED@intel.com>
References: <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
 <Y1qqurH/lG0u+3ky@intel.com>
 <CAJfuBxzpG+C1ARLs3c_znXECEU7Ldg8RhruLMUXA67w+DwcrOQ@mail.gmail.com>
 <Y1rllFeOnT9/PQVA@intel.com>
 <CAJfuBxw_YFvCtHMwVE0K0fa5GJbrZy4hTOSS9FebeDs6fxUUCA@mail.gmail.com>
 <Y1/In+ZBzNguVNoy@intel.com>
 <CAJfuBxxHNXHEWCEPXnPTh64dq4igaddnrU27NT=OHASmnxgudA@mail.gmail.com>
 <9ff84a99-e500-625e-ba9d-20cd752d7ff4@akamai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ff84a99-e500-625e-ba9d-20cd752d7ff4@akamai.com>
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
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 08:20:54PM -0400, Jason Baron wrote:
> 
> 
> On 10/31/22 6:11 PM, jim.cromie@gmail.com wrote:
> > On Mon, Oct 31, 2022 at 7:07 AM Ville Syrjälä
> > <ville.syrjala@linux.intel.com> wrote:
> >> On Sun, Oct 30, 2022 at 08:42:52AM -0600, jim.cromie@gmail.com wrote:
> >>> On Thu, Oct 27, 2022 at 2:10 PM Ville Syrjälä
> >>> <ville.syrjala@linux.intel.com> wrote:
> >>>> On Thu, Oct 27, 2022 at 01:55:39PM -0600, jim.cromie@gmail.com wrote:
> >>>>> On Thu, Oct 27, 2022 at 9:59 AM Ville Syrjälä
> >>>>> <ville.syrjala@linux.intel.com> wrote:
> >>>>>> On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wrote:
> >>>>>>> On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 10/21/22 05:18, Jani Nikula wrote:
> >>>>>>>>> On Thu, 20 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> >>>>>>>>>> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> >>>>>>>>>>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> >>>>>>>>>>>> hi Greg, Dan, Jason, DRM-folk,
> >>>>>>>>>>>>
> >>>>>>>>>>>> heres follow-up to V6:
> >>>>>>>>>>>>    rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
> >>>>>>>>>>>>    rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> >>>>>>>>>>>>
> >>>>>>>>>>>> It excludes:
> >>>>>>>>>>>>    nouveau parts (immature)
> >>>>>>>>>>>>    tracefs parts (I missed --to=Steve on v6)
> >>>>>>>>>>>>    split _ddebug_site and de-duplicate experiment (way unready)
> >>>>>>>>>>>>
> >>>>>>>>>>>> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
> >>>>>>>>>>>>
> >>>>>>>>>>>> If these are good to apply, I'll rebase and repost the rest separately.
> >>>>>>>>>>> All now queued up, thanks.
> >>>>>>>>>> This stuff broke i915 debugs. When I first load i915 no debug prints are
> >>>>>>>>>> produced. If I then go fiddle around in /sys/module/drm/parameters/debug
> >>>>>>>>>> the debug prints start to suddenly work.
> >>>>>>>>> Wait what? I always assumed the default behaviour would stay the same,
> >>>>>>>>> which is usually how we roll. It's a regression in my books. We've got a
> >>>>>>>>> CI farm that's not very helpful in terms of dmesg logging right now
> >>>>>>>>> because of this.
> >>>>>>>>>
> >>>>>>>>> BR,
> >>>>>>>>> Jani.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>> That doesn't sound good - so you are saying that prior to this change some
> >>>>>>>> of the drm debugs were default enabled. But now you have to manually enable
> >>>>>>>> them?
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>>
> >>>>>>>> -Jason
> >>>>>>>
> >>>>>>> Im just seeing this now.
> >>>>>>> Any new details ?
> >>>>>> No. We just disabled it as BROKEN for now. I was just today thinking
> >>>>>> about sending that patch out if no solutin is forthcoming soon since
> >>>>>> we need this working before 6.1 is released.
> >>>>>>
> >>>>>> Pretty sure you should see the problem immediately with any driver
> >>>>>> (at least if it's built as a module, didn't try builtin). Or at least
> >>>>>> can't think what would make i915 any more special.
> >>>>>>
> >>>>> So, I should note -
> >>>>> 99% of my time & energy on this dyndbg + drm patchset
> >>>>> has been done using virtme,
> >>>>> so my world-view (and dev-hack-test env) has been smaller, simpler
> >>>>> maybe its been fatally simplistic.
> >>>>>
> >>>>> ive just rebuilt v6.0  (before the trouble)
> >>>>> and run it thru my virtual home box,
> >>>>> I didnt see any unfamiliar drm-debug output
> >>>>> that I might have inadvertently altered somehow
> >>>>>
> >>>>> I have some real HW I can put a reference kernel on,0
> >>>>> to look for the missing output, but its all gonna take some time,
> >>>>> esp to tighten up my dev-test-env
> >>>>>
> >>>>> in the meantime, there is:
> >>>>>
> >>>>> config DRM_USE_DYNAMIC_DEBUG
> >>>>> bool "use dynamic debug to implement drm.debug"
> >>>>> default y
> >>>>> depends on DRM
> >>>>> depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> >>>>> depends on JUMP_LABEL
> >>>>> help
> >>>>>    Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
> >>>>>    Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
> >>>>>    bytes per callsite, the .data costs can be substantial, and
> >>>>>    are therefore configurable.
> >>>>>
> >>>>> Does changing the default fix things for i915 dmesg ?
> >>>> I think we want to mark it BROKEN in addition to make sure no one
> >>> Ok, I get the distinction now.
> >>> youre spelling that
> >>>    depends on BROKEN
> >>>
> >>> I have a notional explanation, and a conflating commit:
> >>>
> >>> can you eliminate
> >>> git log -p ccc2b496324c13e917ef05f563626f4e7826bef1
> >>>
> >>> as the cause ?
> >> Reverting that doesn't help.
> >>
> > thanks for eliminating it.
> >
> >>> I do need to clarify, I dont know exactly what debug/logging output
> >>> is missing such that CI is failing
> >> CI isn't failing. But any logs it produces are 100% useless,
> >> as are any user reported logs.
> >>
> >> The debugs that are missing are anything not coming directly
> >> from drm.ko.
> >>
> >> The stuff that I see being printed by i915.ko are drm_info()
> >> and the drm_printer stuff from i915_welcome_messages(). That
> >> also implies that drm_debug_enabled(DRM_UT_DRIVER) does at
> >> least still work correctly.
> >>
> >> I suspect that the problem is just that the debug calls
> >> aren't getting patched in when a module loads. And fiddling
> >> with the modparam after the fact does trigger that somehow.
> >>
> > ok, heres the 'tape' of a virtme boot,
> > then modprobe going wrong.
> >
> > [    1.785873] dyndbg:   2 debug prints in module intel_rapl_msr
> > [    2.040598] virtme-init: udev is done
> > virtme-init: console is ttyS0
> >
> >> load drm driver
> > bash-5.2# modprobe i915
> >
> >> drm module is loaded 1st
> > [    6.549451] dyndbg: add-module: drm.302 sites
> > [    6.549991] dyndbg: class[0]: module:drm base:0 len:10 ty:0
> > [    6.550647] dyndbg:  0: 0 DRM_UT_CORE
> > [    6.551097] dyndbg:  1: 1 DRM_UT_DRIVER
> > [    6.551531] dyndbg:  2: 2 DRM_UT_KMS
> > [    6.551931] dyndbg:  3: 3 DRM_UT_PRIME
> > [    6.552402] dyndbg:  4: 4 DRM_UT_ATOMIC
> > [    6.552799] dyndbg:  5: 5 DRM_UT_VBL
> > [    6.553270] dyndbg:  6: 6 DRM_UT_STATE
> > [    6.553634] dyndbg:  7: 7 DRM_UT_LEASE
> > [    6.554043] dyndbg:  8: 8 DRM_UT_DP
> > [    6.554392] dyndbg:  9: 9 DRM_UT_DRMRES
> > [    6.554776] dyndbg: module:drm attached 1 classes
> > [    6.555241] dyndbg: 302 debug prints in module drm
> >
> >> here modprobe reads /etc/modprobe.d/drm-test.conf:
> > options drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_DRIVER +p"
> > and dyndbg applies it
> 
> Hi,
> 
> I'm a bit confused with this. My understanding is that there
> is a 'regression' here from how this used to work. But the
> 'class' keyword is new - are we sure this is the command-line
> we are trying to fix?

The thing we need fixed is just the bog standard drm.debug=0xe etc.

-- 
Ville Syrjälä
Intel
