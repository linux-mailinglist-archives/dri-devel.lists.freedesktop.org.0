Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43745733F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 17:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E986E12E;
	Fri, 19 Nov 2021 16:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73206E12E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 16:39:42 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t30so19087883wra.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WWxvb18J2OY31IOdF8stiBLalQgXLoh0/wK/1Bc450I=;
 b=G/0sZg/TTmfGtyUBtoN7qKLoLhMKvoJ+uHbBFtA+vUeA4c8l/a4gvR/KvwdM5GgdeG
 K5aGLhWroUkdVAKoyOy9XSCgOlka18S9LVxC4hEtS4m4ZcIjqzIt4C398fELpvAkBUGp
 kAGIO0R+WKD0F7cs70CDOsgmPk907XfZuEH2TFWQWMJFVVvBt6fhuOcVE1VhUNQrMz/2
 gfd7zVIdQsyQkNG4ybBUzMmdaB1YV2Daeeie5XKJWliXPsmVm1GQimSuJyTIxGBT8STd
 HkAQkveIny04C9zN6ddwK532QR+/Fm9y3SRYaHOWk8z/fIbx7RL87GP3mWFYDPUyKWxC
 3piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WWxvb18J2OY31IOdF8stiBLalQgXLoh0/wK/1Bc450I=;
 b=KCPDcs0+xXJlAUv+ay1rXee7gQdrudwcQs7YDjIeVReNWg1m8PzX7EKs8egkAwqclF
 qnCqMguENbGAkF/9GGZTQi0lqesLGwq7LyaOycYaItLBwWm3dUiLXtWL/wFIeS4cqZ6S
 ZYsDFXomMyu8TbH4LTxoiR2SQ7mbgOBXafbnRmHAvk+RO+6fnA5TQwpHldSPnz8HC7Ch
 s4p3oSpwd3WXXYGiYZS1ppHfwzpwahtJsdLG86UfyXoxCfqDZD9M6Ap+ux8fkE5+91wr
 i4YTvg8XEoPabJf4nXg0D2DyUUxLPEyFBvLSMtbWg+coUhGGkUNbncZkIBurF5P7wqdG
 NdvA==
X-Gm-Message-State: AOAM531v9cAb5HFdle6Rx9PWhlqc0n54cVxZLDQNVO+rjPSzcgWb2fdN
 EFnM1Uq31LxELycY0PuiFPL2de+Wu1lTSKj93AE=
X-Google-Smtp-Source: ABdhPJxfl7O5ix42iKo6OVNO1pcXl3m9LKgUvG/qGjMcTbNPkTvvG4O8hTy0Lvlihamj11q+V2U2n8BSL8Km1tAxcyc=
X-Received: by 2002:a5d:6351:: with SMTP id b17mr8718687wrw.151.1637339981245; 
 Fri, 19 Nov 2021 08:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell>
 <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
 <20211119115419.505155b5@eldfell>
In-Reply-To: <20211119115419.505155b5@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Nov 2021 08:44:45 -0800
Message-ID: <CAF6AEGus9CtgjvpJRX-YPkrrNeE+--9KeGxKBN_U=aOzzRE8FA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 1:54 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 18 Nov 2021 15:30:38 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > On Thu, Nov 18, 2021 at 2:39 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Wed, 17 Nov 2021 14:48:40 -0800
> > > Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > > A variety of applications have found it useful to listen to
> > > > user-initiated input events to make decisions within a DRM driver, given
> > > > that input events are often the first sign that we're going to start
> > > > doing latency-sensitive activities:
> > > >
> > > >  * Panel self-refresh: software-directed self-refresh (e.g., with
> > > >    Rockchip eDP) is especially latency sensitive. In some cases, it can
> > > >    take 10s of milliseconds for a panel to exit self-refresh, which can
> > > >    be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
> > > >    with an input_handler boost, that preemptively exits self-refresh
> > > >    whenever there is input activity.
> > > >
> > > >  * GPU drivers: on GPU-accelerated desktop systems, we may need to
> > > >    render new frames immediately after user activity. Powering up the
> > > >    GPU can take enough time that it is worthwhile to start this process
> > > >    as soon as there is input activity. Many Chrome OS systems also ship
> > > >    with an input_handler boost that powers up the GPU.
> > > >
> > > > This patch provides a small helper library that abstracts some of the
> > > > input-subsystem details around picking which devices to listen to, and
> > > > some other boilerplate. This will be used in the next patch to implement
> > > > the first bullet: preemptive exit for panel self-refresh.
> > > >
> > > > Bits of this are adapted from code the Android and/or Chrome OS kernels
> > > > have been carrying for a while.
> > > >
> > > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > > ---
> > >
> > > Thanks Simon for the CC.
> > >
> > > Hi Brian,
> > >
> > > while this feature in general makes sense and sounds good, to start
> > > warming up display hardware early when something might start to happen,
> > > this particular proposal has many problems from UAPI perspective (as it
> > > has none). Comments below.
> > >
> > > Btw. if PSR is that slow to wake up from, how much do you actually gain
> > > from this input event watching? I would imagine the improvement to not
> > > be noticeable.
> > >
> > > I think some numbers about how much this feature helps would be really
> > > good, even if they are quite specific use cases. You also need to
> > > identify the userspace components, because I think different display
> > > servers are very different in their reaction speed.
> > >
> > > If KMS gets a pageflip or modeset in no time after an input event, then
> > > what's the gain. OTOH, if the display server is locking on to vblank,
> > > there might be a delay worth avoiding. But then, is it worth
> > > short-circuiting the wake-up in kernel vs. adding a new ioctl that
> > > userspace could hit to start the warming up process?
> >
> > In my measurements, it takes userspace a frame or two to respond and
> > get to the point of starting to build cmdstream (before eventually
> > doing atomic/pageflip ioctl).. possibly longer if you don't also have
> > a similar boost mechanism to spool up cpufreq
> >
> > But the important thing, IMO, is that atomic/pageflip ioctl is the
> > cumulation of a long sequence of events.. input-boost is letting
> > whatever it may be (PSR exit, GPU resume, etc) happen in parallel with
> > that long sequence.
>
> Right, exactly. That is why I was musing about a *new* ioctl that
> userspace could hit as soon as any input device fd (or network fd!)
> shows signs of life. Would that be enough, avoiding all the annoying
> questions about which input and DRM devices should participate here
> (and what about non-input devices that still want to trigger the
> warm-up, like network traffic, e.g. remote control?), or does it really
> need to be kernel internal to be fast enough?
>
> As Brian wrote about his quick hack to test that via debugfs, sounds
> like the userspace solution would be totally sufficient.
>

The question is, I think we want to use this for at least a couple
different things.. PSR exit, and/or early GPU wakeup/boost.  So I'm
not quite sure where/what this ioctl should be.  Different drivers may
have different uses.  Also, because of the CrOS userspace sandbox
architecture, the place that could do a kms ioctl isn't really the
place that would know when to call the ioctl.

But if we want to move the policy out of the kernel, one approach
would just be to have some sysfs where userspace could configure the
input_device_id[] filter..

BR,
-R
