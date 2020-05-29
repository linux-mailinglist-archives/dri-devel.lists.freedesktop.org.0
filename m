Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6711E7257
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 04:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FED76E851;
	Fri, 29 May 2020 02:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782A46E851
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 02:02:58 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id n24so504659ejd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zR58kZNkDITa3zkTRVIi9Vv+iIxtpv5vYAhOcit9LUI=;
 b=S7nH/71Vpr+3SyllwwS7tZsIiGVMAwRxpn8tZQtlVVfv/+0pwrXniGDAQvL1xS3QGh
 j6N9ySgl9oxTOxSVpeny4vGIA6onFpb515ACrcnkxQTqc1dqXG8z9eaOvZHmoWh0akmB
 5U4Atvj08baUPGMWPrBO1BEvWLBUaVvbH0c1TeogyPJOl4K19F1bbpp1lQqcbTK0BYp/
 Oh+u3eLTF8/bxle3ZJeAhloD3xA8CtaoFsz0QXeCFsyPlMH0XNAqAi3E4rEz6T8uqVYF
 vDYPeTu4h1FukdrMd5O9hL8GDb10nzpEqwpXYBgmK2mm6HQ5YQTn2szUINiCvgaYbB0X
 r4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zR58kZNkDITa3zkTRVIi9Vv+iIxtpv5vYAhOcit9LUI=;
 b=DDzOUer5CK0Re2RPKTs/3WyBXgcQr49wwdfxtEg0SYvPEgkm0kXtXNg9wEsvtS+F1t
 Spz0yoLy5iz87FrZfZASCD5ONKYohDAtdhh7CpJiHWcHAOPEipKNE2X/pL1XN7Xxma8X
 D4TJI5EmSmCamu8T7ben2aX4anSBijlbAHrGm4tw0xqTqo3k/pB90EVwmU1/EK4m420/
 nnT2LxSbiSSQ5WXxsH2iiMrtALKx6ecF9leJ5gdDiVcZct9doZS1jnISorkB45AQ9G+I
 kj1XKk4uUoGqnO2qCp+TzaOPtRrtRSEymf+u/yuCMZMMg1e6woLOp+FFyJf6aT/OI8u2
 q4Lw==
X-Gm-Message-State: AOAM531XqBoVD0aGaj3DoJfu6WntnjPRr9v8VA7r044zMJfdJe5oiFof
 jvVrv7rl9H2m++P2i7gNCLd3Gh1aulJA0vP8iew=
X-Google-Smtp-Source: ABdhPJwCHqfRwTsoKAcO4U64g1rHpI/UOlZrfwrpHlnqUK2gBOvZPVU1dHxRLKJPnEFuqYpl9g4tjOjUiq/dxLRQpJA=
X-Received: by 2002:a17:906:fb0e:: with SMTP id
 lz14mr5481366ejb.237.1590717777003; 
 Thu, 28 May 2020 19:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty+Vyn8aSxNqWY+_KEnqj8nGZbp2PRJTvQLcV1iPhG7dA@mail.gmail.com>
 <CAHk-=wgo1HUhSj-kGO8u+iUCxp+QS+rNenbM8gywbF3pdQ_DQA@mail.gmail.com>
In-Reply-To: <CAHk-=wgo1HUhSj-kGO8u+iUCxp+QS+rNenbM8gywbF3pdQ_DQA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 May 2020 12:02:45 +1000
Message-ID: <CAPM=9ty5ce2mm7Di6qvRKy2Jg2Tw-Cd8U6ypN=Abc2NCGmQWWQ@mail.gmail.com>
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

On Fri, 29 May 2020 at 11:49, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, May 28, 2020 at 5:21 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Seems to have wound down nicely, a couple of i915 fixes, amdgpu fixes
> > and minor ingenic fixes.
>
> Dave, this doesn't even build. WTF?
>
> In drivers/gpu/drm/i915/gt/selftest_lrc.c, there's a
> engine_heartbeat_disable() function that takes two arguments, but the
> new "live_timeslice_nopreempt()" gives it only one.
>
> I'd blame a merge problem, since the failure is in new code, but the
> problem exists in your top-of-tree, not just my merge.
>
> In fact, it's not even your merge of the i915 tree that is the source
> of the problem (although the fact that you clearly didn't _test_ the
> end result most definitely is _part_ of the problem!).
>
> Because the problem exists in the commit that introduced that thing:
> commit 1f65efb624c4 ("drm/i915/gt: Prevent timeslicing into
> unpreemptable requests").
>
> It's garbage, and never compiled.

I thought I'd dropped the ball completely. but I see it's a selftest
failure, I must not have selftests built in my config here, I don't do
exhaustive builds randconfig

This has also been built by Intel, but I'm assuming they missed their
selftest bits as well.

I'll revert that and resend.

Sorry for the noise. I'll add self tests to my builds here for future ones.
Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
