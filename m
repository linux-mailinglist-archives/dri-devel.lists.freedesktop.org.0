Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022D1E7233
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 03:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03D26E852;
	Fri, 29 May 2020 01:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CE76E852
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 01:49:33 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c11so617372ljn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 18:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkwZFdug2ibfipHp51Hdh/MIpXAxoqnCWV3ptE8ypxM=;
 b=OQI7g/LZthfupWZGTaaD31P84Kb9G8XBQLwp0DDsDWA2HzBFoyGDMu31FtMKA9ET7J
 dDPGe9+x7OgAmQSeGW4sGXMu3sEUp7l35dkDgmSjURvllTM1xUIqeoN9hVSBQG1UpRgQ
 ta7w4tJ7XCis8TtVKRq2VSK4+I12I3r45wSLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkwZFdug2ibfipHp51Hdh/MIpXAxoqnCWV3ptE8ypxM=;
 b=KOS+XoaKm2QaEZGSeOEbPKhFLs4Enyw9MpyyhI2kDHuUQMCBcEHYnD66ZbsZJvGaH7
 o0tXjl+O90mPG1l4fwvvBPs29FkMZBPw1ycJ/KEQJmScX60JJdMW798Djf+BY2zt5qnK
 WoLiMN6ewezTaMroy3+Y4ihVuTlRYr4UKtHrBbWYC5oGsAQpY7YQb19bG3wt+0LtKkD+
 Jtl1JrIT763HT1ujoaXf9pd7CvCIyG8s9kGHMtRVfrj/7ejAd95m8CwDn9/SFQC7Ee2P
 nXy2xGe8WT+iiHdlWA6mzpF0K/x17f6OWiqvScbGn6yFSqwhu/RvD/uLz5jeVqs0w2Nl
 Bsug==
X-Gm-Message-State: AOAM533Z/M7iTxGslPWWaOQKZV0BhznW9jPvfvitp4tEtY+DD0b7iMVJ
 G6ZhbPZ4lKpwUI2afyGOgmxWKQQOxrE=
X-Google-Smtp-Source: ABdhPJzBQxo43NBTYKe2zBtADRnlh7yNPfOlZJeMChTalyLJIbmIKTiHBqiJzwWEFpvf6Y+UHG3Nbg==
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr3115187ljk.444.1590716971198; 
 Thu, 28 May 2020 18:49:31 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id w144sm1950643lff.67.2020.05.28.18.49.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 18:49:30 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id d7so307598lfi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 18:49:30 -0700 (PDT)
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr3133948lfn.10.1590716969967; 
 Thu, 28 May 2020 18:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty+Vyn8aSxNqWY+_KEnqj8nGZbp2PRJTvQLcV1iPhG7dA@mail.gmail.com>
In-Reply-To: <CAPM=9ty+Vyn8aSxNqWY+_KEnqj8nGZbp2PRJTvQLcV1iPhG7dA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 May 2020 18:49:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgo1HUhSj-kGO8u+iUCxp+QS+rNenbM8gywbF3pdQ_DQA@mail.gmail.com>
Message-ID: <CAHk-=wgo1HUhSj-kGO8u+iUCxp+QS+rNenbM8gywbF3pdQ_DQA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.7-rc8/final
To: Dave Airlie <airlied@gmail.com>, Chris Wilson <chris@chris-wilson.co.uk>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 5:21 PM Dave Airlie <airlied@gmail.com> wrote:
>
> Seems to have wound down nicely, a couple of i915 fixes, amdgpu fixes
> and minor ingenic fixes.

Dave, this doesn't even build. WTF?

In drivers/gpu/drm/i915/gt/selftest_lrc.c, there's a
engine_heartbeat_disable() function that takes two arguments, but the
new "live_timeslice_nopreempt()" gives it only one.

I'd blame a merge problem, since the failure is in new code, but the
problem exists in your top-of-tree, not just my merge.

In fact, it's not even your merge of the i915 tree that is the source
of the problem (although the fact that you clearly didn't _test_ the
end result most definitely is _part_ of the problem!).

Because the problem exists in the commit that introduced that thing:
commit 1f65efb624c4 ("drm/i915/gt: Prevent timeslicing into
unpreemptable requests").

It's garbage, and never compiled.

See here:

  git grep -1wh engine_heartbeat_disable 1f65efb62 \
        drivers/gpu/drm/i915/gt/selftest_lrc.c

and you'll see how the definition of that function looks like this:

  static void engine_heartbeat_disable(struct intel_engine_cs *engine,
                                       unsigned long *saved)

but then in the middle of that grep, you'll find

                engine_heartbeat_disable(engine);

WTF?

That commit seems to be a cherry-pick of another commit, and maybe it
worked in that other context (which I don't see), but it sure doesn't
work in the context it was then cherry-picked into.

So people took that thing, and it went through at least two different
people WHO NEVER EVEN BOTHERED TO TEST IF IT BUILDS!

Christ, people.

This is why I absolutely DO NOT WANT TO SEE random rebases or
cherry-picks and then sending the resulting untested crap on to me.

Because it's exactly that: untested crap.

It doesn't matter *how* well you have tested a commit in some original
context: the moment you rebase it (or cherry-pick it, which is just
another form of rebasing), it's a completely new commit in a
completely new environment, and all your old testing is null and void.

Guys, get your act together! I should not be getting these kinds of
shit pull requests days before a release!

And how the hell did this not get any build testing at any point
before asking me to pull?

                Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
