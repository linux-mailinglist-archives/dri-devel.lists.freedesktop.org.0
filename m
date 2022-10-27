Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197C60FC8D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586C10E691;
	Thu, 27 Oct 2022 15:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7110E0BF;
 Thu, 27 Oct 2022 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666886336; x=1698422336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0kjG/brUOnWwwDLYzkCfqaQKWYg0i41CBDbErJIKe7w=;
 b=UraA4nfODz1LTL3a9VP6coUJPQeHwcIXckgGpvj+KxXCBsX2ro1zux6/
 bgSrhO98kB6MP/RzwX9raGEbnKTJaUhr4toz/MTw/Cr6Y5qMn9tFhgMV6
 s5aWwb08JmZg284STVn3J9Phj0U3QhIiGMTfpCpSlo1J84s8MemI8CaIW
 z1rA6DHUBtDpxDw65i9GuXHBqf4T8puspf2zN0gPoBKVisXhNaFVuurv6
 GyIVNU2VMhutroj6yhqaH9poOn4Jqj/5+vXbxtxySE4cmPVjec/I4UBHk
 2L51Rgfnvk1NXiNiXd2PSEKkVsvavlNCOHeOylRqZjPr9nVQx+7So+pzX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="370329448"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="370329448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 08:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="663668418"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="663668418"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 27 Oct 2022 08:58:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Oct 2022 18:58:50 +0300
Date: Thu, 27 Oct 2022 18:58:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: jim.cromie@gmail.com
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
Message-ID: <Y1qqurH/lG0u+3ky@intel.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
 <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
 <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJfuBxxWVBxL29sXS3XoE5Es9HTbVyFUi9bQFYNupJAERffAew@mail.gmail.com>
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

On Thu, Oct 27, 2022 at 09:37:52AM -0600, jim.cromie@gmail.com wrote:
> On Thu, Oct 27, 2022 at 9:08 AM Jason Baron <jbaron@akamai.com> wrote:
> >
> >
> >
> > On 10/21/22 05:18, Jani Nikula wrote:
> > > On Thu, 20 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> > >>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> > >>>> hi Greg, Dan, Jason, DRM-folk,
> > >>>>
> > >>>> heres follow-up to V6:
> > >>>>   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
> > >>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > >>>>
> > >>>> It excludes:
> > >>>>   nouveau parts (immature)
> > >>>>   tracefs parts (I missed --to=Steve on v6)
> > >>>>   split _ddebug_site and de-duplicate experiment (way unready)
> > >>>>
> > >>>> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
> > >>>>
> > >>>> If these are good to apply, I'll rebase and repost the rest separately.
> > >>>
> > >>> All now queued up, thanks.
> > >>
> > >> This stuff broke i915 debugs. When I first load i915 no debug prints are
> > >> produced. If I then go fiddle around in /sys/module/drm/parameters/debug
> > >> the debug prints start to suddenly work.
> > >
> > > Wait what? I always assumed the default behaviour would stay the same,
> > > which is usually how we roll. It's a regression in my books. We've got a
> > > CI farm that's not very helpful in terms of dmesg logging right now
> > > because of this.
> > >
> > > BR,
> > > Jani.
> > >
> > >
> >
> > That doesn't sound good - so you are saying that prior to this change some
> > of the drm debugs were default enabled. But now you have to manually enable
> > them?
> >
> > Thanks,
> >
> > -Jason
> 
> 
> Im just seeing this now.
> Any new details ?

No. We just disabled it as BROKEN for now. I was just today thinking
about sending that patch out if no solutin is forthcoming soon since
we need this working before 6.1 is released.

Pretty sure you should see the problem immediately with any driver 
(at least if it's built as a module, didn't try builtin). Or at least
can't think what would make i915 any more special.

> 
> I didnt knowingly change something, but since its apparently happening,
> heres a 1st WAG at a possible cause
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
>     reverting yields a nominal data and text shrink:
> 
>        text    data     bss     dec     hex filename
>      462583   36604   54592 553779   87333 /kernel/drivers/gpu/drm/drm.ko
>      462515   36532   54592 553639   872a7 -dirty/kernel/drivers/gpu/drm/drm.ko
> 
>     Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>     Link: https://lore.kernel.org/r/20220912052852.1123868-9-jim.cromie@gmail.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
Ville Syrjälä
Intel
