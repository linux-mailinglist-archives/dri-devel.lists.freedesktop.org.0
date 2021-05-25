Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DAC390599
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC7B6EA65;
	Tue, 25 May 2021 15:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82C76EA5E;
 Tue, 25 May 2021 15:37:47 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so29050840oto.0; 
 Tue, 25 May 2021 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oFwlKBLmOo5RD+mIEmsTRANuaetUQlbupTTyU1yWuFQ=;
 b=g+Ai5SB8YKeStwspWjKHN6cfeCl2wi5RnGMDOjKUtZrgkWsQz7CWYENsgDQrK/btvn
 PrglpVvb+DDWNYHwAdTlO25y2ZEcm+xMiX65r1kaXfg+YfA2K51MrgPc0ompKoFz3zHQ
 xiaDmTQMvID0UQvSyzY+MrSefIcQs2OW8Aw8u9Gm36H50GTyJ8ZWsnVPyxUxu+J5DaXO
 Y6Lnv/KCACDU2H7LXpNkDPly8qxidpItSSvztAk72d1H1XKIymKIe74XEL1OOflZvSdG
 iwAMeMpdHXRqdF1dCrkCvrq+Qe/TSAu0SvWGv+58f5VwhmN0SbHQ/TccnE9Lau8Vez+2
 SUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oFwlKBLmOo5RD+mIEmsTRANuaetUQlbupTTyU1yWuFQ=;
 b=reyWUyzfpX+8XM02EoufTPLVUyz34t0LowGvw9bCC2+m+xFX4wdnIb8/ECdGHmvFG5
 RmYx8/SXjBRn63ZIFAGBe7ZXdCwZEeAZqNwHhnfjepWXRr3bXj4oX/ab6s8uMQWjFcyK
 Ce6GHBc5yxp+DxHLAld02TsZV76cnG4kdgDycBb0fDXzDjSqQ0hd7ZAbMdhCMepyYhFS
 PnJeX7AxmUMwhtNtaxrbZL/a8g94CdIfz2ZrZwseLbdJCkpHn2n4WFaUVXVXG3bq6ofl
 B/I4gumqEePBvu33ut7PAU9QbwY5yAn9qzblmy6HMW2RM737wwXoXOaG+UKTuH5tszSA
 AtOA==
X-Gm-Message-State: AOAM530Tf6sYjuiF8r4SEKX8gHsJVOn+ec7Q+VGnrRgE+gOcbf+hpomS
 k+7eRmulMzNl460DdaSB0d2rXbeEvGp28Vz1pV48d7eg
X-Google-Smtp-Source: ABdhPJyjcngvjxW9AYsb0mFErgK/WPCkfH3El+fcY/E+mYK8Gmzz2Xu02QoKjnV6GU0BkLxqC8RKC6FNHfn4Gf2oRYc=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr23392857oti.23.1621957067193; 
 Tue, 25 May 2021 08:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
 <17953669798.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <546e4ee4-9aa4-1967-cdcb-a561cac582ef@free.fr>
 <CAKMK7uETcM38sjPYJLdxpGcZcx=tHdGUPe0WTgnGoZfPQvEJFQ@mail.gmail.com>
 <08c22bc8-aa35-43d2-ad4c-7f489dfc585b@free.fr>
 <d382a41cacbc44ee96b9602f3473b5c0@intel.com>
 <20210511163930.GA28794@sdutt-i7>
 <bb701cab-a68e-08ed-80e3-61be160bdc02@free.fr>
 <CAOFGe95Ku0FiUfPzEo2xM7Uu9Xi7GJn_rNR9ToRfESRmPdCW_Q@mail.gmail.com>
In-Reply-To: <CAOFGe95Ku0FiUfPzEo2xM7Uu9Xi7GJn_rNR9ToRfESRmPdCW_Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 May 2021 11:37:35 -0400
Message-ID: <CADnq5_Ns9kHWzruKiS-kedcfOaSs2y45ek3YgZ9wMGo22W3FpA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/97] Basic GuC submission support in the i915
To: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Matthew Brost <matthew.brost@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Ekstrand,
 Jason" <jason.ekstrand@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "Bloomfield,
 Jon" <jon.bloomfield@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 12:31 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Pulling a few threads together...
>
> On Mon, May 10, 2021 at 1:39 PM Francisco Jerez <currojerez@riseup.net> wrote:
> >
> > I agree with Martin on this.  Given that using GuC currently involves
> > making your open-source graphics stack rely on a closed-source
> > cryptographically-protected blob in order to submit commands to the GPU,
> > and given that it is /still/ possible to use the GPU without it, I'd
> > expect some strong material justification for making the switch (like,
> > it improves performance of test-case X and Y by Z%, or, we're truly
> > sorry but we cannot program your GPU anymore with a purely open-source
> > software stack).  Any argument based on the apparent direction of the
> > wind doesn't sound like a material engineering reason to me, and runs
> > the risk of being self-fulfilling if it leads us to do the worse thing
> > for our users just because we have the vague feeling that it is the
> > general trend, even though we may have had the means to obtain a better
> > compromise for them.
>
> I think it's important to distinguish between landing code to support
> GuC submission and requiring it in order to use the GPU.  We've got
> the execlist back-end and it's not going anywhere, at least not for
> older hardware, and it will likely keep working as long as execlists
> remain in the hardware.  What's being proposed here is a new back-end
> which, yes, depends on firmware and can be used for more features.
>
> I'm well aware of the slippery slope argument that's implicitly being
> used here even if no one is actually saying it:  If we land GuC
> support in i915 in any form then Intel HW engineers will say "See,
> Linux supports GuC now; we can rip out execlists" and we'll end up in
> the dystopia of closed-source firmware.  If upstream continues to push
> back on GuC in any form then they'll be forced to keep execlists.
> I'll freely admit that there is probably some truth to this.  However,
> I really doubt that it's going to work long-term.  If the HW
> architects are determined enough to rip it out, they will.

You want to stay on the same interfaces as Windows does, like it or
not.  The market is bigger and there is a lot more validation effort.
Even if support for the old way doesn't go away, it won't be as well
tested.  For AMD, we tried to stay on some of the older interfaces on
a number products in the past and ran into lots of subtle issues,
especially around power management related things like clock and power
gating.  There are just too many handshakes and stuff required to make
all of that work smoothly.  It can be especially challenging when the
issues show up well after launch and the firmware and hardware teams
have already moved on to the next projects and have to page the older
projects back into their minds.

Alex


>
> If GuC is really inevitable, then it's in our best interests to land
> at least beta support earlier.  There are a lot of questions that
> people have brought up around back-ports, dealing with stable kernels,
> stability concerns, etc.  The best way to sort those out is to land
> the code and start dealing with the issues.  We can't front-load
> solving every possible issue or the code will never land.  But maybe
> that's people's actual objective?
>
>
> On Wed, May 12, 2021 at 1:26 AM Martin Peres <martin.peres@free.fr> wrote:
> >
> > On 11/05/2021 19:39, Matthew Brost wrote:
> > > On Tue, May 11, 2021 at 08:26:59AM -0700, Bloomfield, Jon wrote:
> > >>> On 10/05/2021 19:33, Daniel Vetter wrote:
> > >>>> On Mon, May 10, 2021 at 3:55 PM Martin Peres <martin.peres@free.fr>
> > >>> wrote:
> > >>>
> > >>> However, if the GuC is actually helping i915, then why not open source
> > >>> it and drop all the issues related to its stability? Wouldn't it be the
> > >>> perfect solution, as it would allow dropping execlist support for newer
> > >>> HW, and it would eliminate the concerns about maintenance of stable
> > >>> releases of Linux?
>
> I would like to see that happen.  I know there was some chatter about
> it for a while and then the discussions got killed.  I'm not sure what
> happened, to be honest.  However, I don't think we can make any
> guarantees or assumptions there, I'm afraid. :-(
>
> > >> That the major version of the FW is high is not due to bugs - Bugs don't trigger major version bumps anyway.
> >
> > Of course, where did I say they would?
>
> I think the concern here is that old kernels will require old major
> GuC versions because interfaces won't be backwards-compatible and then
> those kernels won't get bug fixes.  That's a legitimate concern.
> Given the Linux usage model, I think it's fair to require either
> backwards-compatibility with GuC interfaces and validation of that
> backwards-compatibility or stable releases with bug fixes for a good
> long while.  I honestly can't say whether or not we've really scoped
> that.  Jon?
>
> > >> We have been using GuC as the sole mechanism for submission on Windows since Gen8, and it has proven very reliable. This is in large part because it is simple, and designed from day 1 as a cohesive solution alongside the hardware.
>
> There are going to be differences in the usage patterns that i915 and
> Windows will hit when it comes to the subtle details of how we bang on
> the GuC rings.  Those will likely lead to bugs on Linux that don't
> show up on Windows so "it works on Windows" doesn't mean we're headed
> for a bug-free future.  It means we have an existence proof that
> firmware-based submission can be very reliable.  However, I don't
> think anyone on this thread is really questioning that.
>
> > Exactly, the GuC was designed with Windows' GPU model... which is not
> > directly applicable to Linux. Also, Windows does not care as much about
> > submission latency, whereas most Linux users still depend on glamor for
> > 2D acceleration which is pretty much the biggest stress test for command
> > submission latency. Also, features not used by the Windows driver or
> > used in a different way are/will get broken (see the semaphore patch
> > that works around it).
>
> I'm not nearly as deep into benchmarking the delta as you are so I
> won't contradict anything said directly.  However, I think it's worth
> pointing out a few things:
>
> There isn't really a Windows GPU model.  There's a different
> submission model with Win10 vs. Win7 and Linux looks a lot more like
> Win7.  I really want Linux to start looking like Win10 at which point
> they'll be using roughly the same "GPU model".  There are other OS
> differences that matter here such as Windows' substantially higher
> interrupt handling latency which GuC theoretically works around.
> However, I don't think it's fair to say that the way Linux wants to
> program the GPU for command submission is substantially different from
> Windows due to userspace software differences.
>
> There are significant differences in terms of dma_fence handling and
> implicit synchronization.  However, as has already been mentioned,
> those will be handled by drm/scheduler with GuC as a back-end that
> manages load-balancing.  And, yes, there will be Linux-specific bugs
> (see above) but they're not because of a fundamentally different
> model.
>
> One other thing worth mentioning, which doesn't seem to fit anywhere:
> If we really care about keeping execlists working for the upcoming
> use-cases, it needs major work.  It's currently way too deeply tied
> with i915_sw_fence so it can't handle long-running compute batches
> without breaking dma-fence rules.  The way it handles bonded submit is
> a bolt-on that doesn't actually provide the guarantees that userspace
> needs.  It should also probably be re-architected to use drm/scheduler
> for dma_fence and look a lot more like GuC on the inside.
>
> The point of bringing this up is that I'm seeing a lot more execlist
> love than I think it deserves. :-)  It may be free software but that
> doesn't mean it's good software. :-P  To be clear, I don't mean to
> unduly insult Chris or any of the other people who have worked on it.
> It works and it's perfectly functional for supporting all the good ol'
> use-cases us desktop Linux people are used to.  But the ways in which
> it would have to change in order to handle the future are substantial.
>
> --Jason
