Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039FA386C5D
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 23:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B4F6E3E3;
	Mon, 17 May 2021 21:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04F6E3E3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 21:36:16 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id k10so11308712ejj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C7tUbgzjgwHZu3SY+jH6AtxQ7COMJjm9OWbgWwWkkbA=;
 b=iuKW9D3nu1bsFV7gAZoDs/vdHxghnjyauPhfKPaE6Vs5yh895qoawtGtEUmX5/dd6W
 lI5hkE6TjbE48JCTMQxx56uZ10QYGpDtKkehca+h4kLHgWl9TpTxI1JRDT42QZiRUsTQ
 MEAbNO9I9Q8s+gRT6uJIlLUF+gP6WSrJw0Mc5XSp537fIr/a+wv105yQDj26wer42hhH
 h0tht+wJVqaYzJCUxc0Lznm5saHMELGdC7rOFgjgmlo+Xv7PlPpPgPNMvww4m8+8KcK3
 OLU8vS8RgxOGOyAQS6bwZILVyO/Z2e/QWnqIej0cc1Gd0TMTP0Kti5W80OetScXVo6zk
 n7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C7tUbgzjgwHZu3SY+jH6AtxQ7COMJjm9OWbgWwWkkbA=;
 b=eEigfBDL8nPCtbqD4vP2xrcBLqRxtuD9XbIHD2PxFo5HrqWkoAm/xbui+NqegfMnPd
 Dtmh+KpLeP9gFlM/kqavkkwvXkNG9pf5zsIoNYIaNSUsrXe04tv9gLkgfWCzCKEKoBHM
 qL10lnOIgDTXQWM69EKxx8dfJWhJQkrT55X+cLfQ8kUFz1nPG4eJT97U1n67PFQwz88D
 JN9EVY3a+ueV4PSSZF2Q1ZGDmUG5fzCzwJSzm/4h63hbxsjmTWUzAhyKYZtrkq8JgZ6z
 jpVdShAEljcjZX2pDPuABwpDW6x+Sb79DfIsv3YCkPPUpageMDQz9oKjlm67k1d026I6
 zb0A==
X-Gm-Message-State: AOAM531PZBfIFIzyS7I8AJcA+DDFUqvGQ58SF5z4+mmypmsjcJmmXZl2
 LlHGBF4O/LyO+noznXbzsQP0XJHBWprhYFbOD7E=
X-Google-Smtp-Source: ABdhPJzOom8/ce1HZErfkpCTLprK4xpBI1A/rCKW/sYjn9T5ApBOWS8EJDDS/dN3VuUHXZi51XNHNGNc19Rp1Fhcc+c=
X-Received: by 2002:a17:906:6b96:: with SMTP id
 l22mr2001804ejr.456.1621287375273; 
 Mon, 17 May 2021 14:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>
 <6e26562f-5ccf-9014-c0c4-00241659a95b@suse.de>
In-Reply-To: <6e26562f-5ccf-9014-c0c4-00241659a95b@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 18 May 2021 07:36:03 +1000
Message-ID: <CAPM=9ty3EWs8eUzyrFM_29nXZMCGJ5CO=H=gY+HVdBAR2Wg-Yw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 06:10, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 17.05.21 um 21:32 schrieb Daniel Stone:
> > Hi,
> >
> > On Mon, 17 May 2021 at 20:12, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> >>> We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> >>> think G as in General, not Graphisc.
> >>
> >> I hope this was a joke.
> >>
> >> Just some thoughts:
> >>
> >> AFAICT AI first came as an application of GPUs, but has now
> >> evolved/specialized into something of its own. I can imagine sharing
> >> some code among the various subsystems, say GEM/TTM internals for memory
> >> management. Besides that there's probably little that can be shared in
> >> the userspace interfaces. A GPU is device that puts an image onto the
> >> screen and an AI accelerator isn't.
> >
> > But it isn't. A GPU is a device that has a kernel-arbitrated MMU
> > hosting kernel-managed buffers, executes user-supplied compiled
> > programs with reference to those buffers and other jobs, and informs
> > the kernel about progress.
> >
> > KMS lies under the same third-level directory, but even when GPU and
> > display are on the same die, they're totally different IP blocks
> > developed on different schedules which are just periodically glued
> > together.
>
> I mentioned this elsewhere: it's not about the chip architecture, it's
> about the UAPI. In the end, the GPU is about displaying things on a
> screen. Even if the rendering and the scanout engines are on different
> IP blocks. (Or different devices.)
>
> The fact that one can do general purpose computing on a GPU is a
> byproduct of the evolution of graphics hardware. It never was the goal.

But then we would have a subsystem for AI accelerators excluding GPUs,
do we then start to layer that subsystem onto drivers/gpu? at which
point why bother.

The thing is UAPI and stack architecture are important, but what is
more important than any of that is that there is a place where the
people invested in the area can come together outside of company
boundaries and discuss ideas and bounce designs around each other to
come to an agreement without the overheads of company interactions.
dri-devel + mesa have managed this for graphics but it's taken years
and we are still fighting that battle within major companies who even
when they know it produces good results can't drag themselves to give
up control over anything unless given no other choice.

I expect the accel teams in these companies need to step outside their
productization timelines and powerpoints and start discussing uAPI
designs with the other companies in the area. Until that happens I
expect upstreaming any of these should be a default no.

Dave.
