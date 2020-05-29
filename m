Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5AC1E7ED6
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 15:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0046E8F5;
	Fri, 29 May 2020 13:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDAF6E8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 13:34:37 +0000 (UTC)
IronPort-SDR: CCrE036dYjQ9hn6oaeejJLh8X9w1ikWlxjZ5WWg6aSyyVF5a4QegOfjRShPtnaFjD4JkMKs42o
 OOSyd6OmJltw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 06:34:37 -0700
IronPort-SDR: tX3CfnNg48WxoJdOkXM+fYqy1MpVQrNOP0H7hntqGKQ1vly0LGowYZ79mz+5AG7gOQbt6g612A
 5l72LSds/vxA==
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="285533383"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 06:34:36 -0700
Date: Fri, 29 May 2020 06:32:58 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm fixes for 5.7-rc8/final
Message-ID: <20200529133258.GA701871@intel.com>
References: <CAPM=9ty+Vyn8aSxNqWY+_KEnqj8nGZbp2PRJTvQLcV1iPhG7dA@mail.gmail.com>
 <CAHk-=wgo1HUhSj-kGO8u+iUCxp+QS+rNenbM8gywbF3pdQ_DQA@mail.gmail.com>
 <CAPM=9ty5ce2mm7Di6qvRKy2Jg2Tw-Cd8U6ypN=Abc2NCGmQWWQ@mail.gmail.com>
 <CAPM=9tza6oC3tBHaYq+nLGh0fwwZAKR3U-HVvn8jzN9myMz0dA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tza6oC3tBHaYq+nLGh0fwwZAKR3U-HVvn8jzN9myMz0dA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 12:15:27PM +1000, Dave Airlie wrote:
> On Fri, 29 May 2020 at 12:02, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Fri, 29 May 2020 at 11:49, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Thu, May 28, 2020 at 5:21 PM Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > Seems to have wound down nicely, a couple of i915 fixes, amdgpu fixes
> > > > and minor ingenic fixes.
> > >
> > > Dave, this doesn't even build. WTF?
> > >
> > > In drivers/gpu/drm/i915/gt/selftest_lrc.c, there's a
> > > engine_heartbeat_disable() function that takes two arguments, but the
> > > new "live_timeslice_nopreempt()" gives it only one.
> > >
> > > I'd blame a merge problem, since the failure is in new code, but the
> > > problem exists in your top-of-tree, not just my merge.
> > >
> > > In fact, it's not even your merge of the i915 tree that is the source
> > > of the problem (although the fact that you clearly didn't _test_ the
> > > end result most definitely is _part_ of the problem!).
> > >
> > > Because the problem exists in the commit that introduced that thing:
> > > commit 1f65efb624c4 ("drm/i915/gt: Prevent timeslicing into
> > > unpreemptable requests").
> > >
> > > It's garbage, and never compiled.
> >
> > I thought I'd dropped the ball completely. but I see it's a selftest
> > failure, I must not have selftests built in my config here, I don't do
> > exhaustive builds randconfig
> >
> > This has also been built by Intel, but I'm assuming they missed their
> > selftest bits as well.
> >
> > I'll revert that and resend.
> 
> I did drop the ball in one way, I see sfr reported it broken this morning
> 
> I normally expect stuff coming from Intel has been through their CI,
> even their fixes tree generally gets pushed through that system before
> I get it, and it usually catches these things.
> 
> I might have to push back on intel fixes this late in the day, as
> maybe the land on next and cherry-pick to fixes model has made them a
> bit lax on how much stuff goes through CI.
> 
> I've just drop the whole i915 fixes from the tree and will resend with
> it removed.

Yes, that was my fault. I also didn't have the selftest on my drm-intel-fixes
build and I confused the build run numbers when checking the
https://intel-gfx-ci.01.org/tree/drm-intel-fixes/index.html?
before sending...

If we have another round next week I will make sure CI runs well before
sending another pull request.

Sorry,
Rodrigo.


> 
> Dave.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
