Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F41E727B
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 04:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92506E854;
	Fri, 29 May 2020 02:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF51C6E854
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 02:15:39 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id f7so493070ejq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PoRZPQciUjW0VCWgrvWzNEBESY0jfZ3/WBQnF/AySco=;
 b=rhdpJDQQejWKnSlXPmeIE88URsUfXVm0a7+esvI8MRip1/sAbPXHD12VkPtq8exsUN
 Pk6dsRxsQSJ0V4BgyN9neaqH0/epkDX1VQwsfhvCSAPRxQC7TYMQLau0nfev15sHUsht
 vuhVpYwXiHwqN3ejc81Q/trn4wirmZvlagVbK2A349sGibnr4JpRh3o/SV2FGoVYQdHJ
 xuAC5WvvqyLLc/Hhwxr7OxWDashXsPKofGJ1J0WTBpB/lZ7hqiOhpvladh5e3L3fbmNQ
 papT9qREaDH1jUAcKHWcTAHaE9d5uV3B3ZrijCZPqLpdFmfIY4GTsKXzPr0VmbAlN1QD
 hrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PoRZPQciUjW0VCWgrvWzNEBESY0jfZ3/WBQnF/AySco=;
 b=AmQeckCb50n47xVTMqoRMwWFAuEURFJTl98Pmvp2ln5u8QzCrqaAzlayNq8h0X5jxP
 vDrck3blttbid8oGOAdsq131sZNeCRGpoHYsWMHQ0cXji0JIRIUZyBfcUU82NX2/7cFA
 RRbVNNgEMCu426MfJLFWgxmssQHQZxrX+owrHAE5gbNS+foQjFzgcf0f3uP8nua5qIS+
 n94OAb53nEOEkaaodc6UBoDnvKo1lo5UqbZJR/ojNSEUl81qgbWlUbduHB387tlpoyJl
 4J8L/RYN5wVFLSNWsFnZA1Ih93gCyc8TdOZCtk6X8BiKWwnwYhpaGZYuUEJEeYDETaN6
 ZoAw==
X-Gm-Message-State: AOAM5302GoCUCfIRcNDjUt7J1YxVz0oJ3lZqxWMHjRSCQc5/HZmXYa8n
 558T3j/mulPC8fgJdmAzHY3+UhzVqKtZLeDJtuo=
X-Google-Smtp-Source: ABdhPJw1xLHrMLHiUyZNFBHXB7bZmFXA7631wc1GNiTSKobEUFpMwo9k7uw0mmtHkMVjK+9TfVJe5Zy/uGKwSvQI/dw=
X-Received: by 2002:a17:906:c9d6:: with SMTP id
 hk22mr5608919ejb.101.1590718538464; 
 Thu, 28 May 2020 19:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty+Vyn8aSxNqWY+_KEnqj8nGZbp2PRJTvQLcV1iPhG7dA@mail.gmail.com>
 <CAHk-=wgo1HUhSj-kGO8u+iUCxp+QS+rNenbM8gywbF3pdQ_DQA@mail.gmail.com>
 <CAPM=9ty5ce2mm7Di6qvRKy2Jg2Tw-Cd8U6ypN=Abc2NCGmQWWQ@mail.gmail.com>
In-Reply-To: <CAPM=9ty5ce2mm7Di6qvRKy2Jg2Tw-Cd8U6ypN=Abc2NCGmQWWQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 May 2020 12:15:27 +1000
Message-ID: <CAPM=9tza6oC3tBHaYq+nLGh0fwwZAKR3U-HVvn8jzN9myMz0dA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.7-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 May 2020 at 12:02, Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 29 May 2020 at 11:49, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Thu, May 28, 2020 at 5:21 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > Seems to have wound down nicely, a couple of i915 fixes, amdgpu fixes
> > > and minor ingenic fixes.
> >
> > Dave, this doesn't even build. WTF?
> >
> > In drivers/gpu/drm/i915/gt/selftest_lrc.c, there's a
> > engine_heartbeat_disable() function that takes two arguments, but the
> > new "live_timeslice_nopreempt()" gives it only one.
> >
> > I'd blame a merge problem, since the failure is in new code, but the
> > problem exists in your top-of-tree, not just my merge.
> >
> > In fact, it's not even your merge of the i915 tree that is the source
> > of the problem (although the fact that you clearly didn't _test_ the
> > end result most definitely is _part_ of the problem!).
> >
> > Because the problem exists in the commit that introduced that thing:
> > commit 1f65efb624c4 ("drm/i915/gt: Prevent timeslicing into
> > unpreemptable requests").
> >
> > It's garbage, and never compiled.
>
> I thought I'd dropped the ball completely. but I see it's a selftest
> failure, I must not have selftests built in my config here, I don't do
> exhaustive builds randconfig
>
> This has also been built by Intel, but I'm assuming they missed their
> selftest bits as well.
>
> I'll revert that and resend.

I did drop the ball in one way, I see sfr reported it broken this morning

I normally expect stuff coming from Intel has been through their CI,
even their fixes tree generally gets pushed through that system before
I get it, and it usually catches these things.

I might have to push back on intel fixes this late in the day, as
maybe the land on next and cherry-pick to fixes model has made them a
bit lax on how much stuff goes through CI.

I've just drop the whole i915 fixes from the tree and will resend with
it removed.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
