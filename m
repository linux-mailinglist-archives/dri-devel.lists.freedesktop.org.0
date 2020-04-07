Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C0B1A08C4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BC96E580;
	Tue,  7 Apr 2020 07:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F416E580
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 07:58:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id y20so766943wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ao+hHvVYfYUqLaSo5Ws90a4qVwGY8uUNfXRKe8RQMFM=;
 b=LP1oOTamsxNuUTEGI+MgdyKMFlJP8I0ywUIoxc6TGHXYHCHsYzui7AzTIHyp69xBZ/
 N6Cs2uTIXWzwTI89jtKQ/qRaJAmi/ZuVFOXnXQMPdHilkb6ChdkRFZrJ4DDa5azS7Zrk
 Dibf7xmNlBvflNpIz13tyqSmwEFLLmw9FJteCfs7zxmCA1jRdsvMX1Nq8x4ZQJrb2XGI
 MiqmSnGeXnwwyvcwW7V9LQlvMqtEddHmJEqy0lMbVrZpwVZeCYtV8crGFK1LPeazoWJj
 d1FIhJoB2OVNHA5cqZ3Ncl6LZ1NEj540StQoB1n5LzokAVJ9bBB+C55bN3kNv2Z4l29R
 J2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ao+hHvVYfYUqLaSo5Ws90a4qVwGY8uUNfXRKe8RQMFM=;
 b=Qn8jwF/COrSLoKnzroQ1Z/bwSpSmjnCug6gAJnDcb/fIJuEvbs5hsT8LdeETvWrErh
 w/ucCMpX9TcLCanLwW8ua1A1jSXJT5G3r3uDDZYCDs4g2QX8toigRPOoIJjYBZgFgt7X
 opsbrh7tDi+6o380bDbJ9BxJ2CnAetdwyzlC0YiXakmsUgCVovdOk0lgAlTMAapN0I7r
 Nf7BdgUgHgie4xo2f/dA6jeN9KAfG7Xp/51bE970NB1W5r9XXMdk3Zh74O13hXgl1SFK
 NsDGgq3n7utfFX2vXoRbWKBI42VlSOrzq1ORIuOX6iY7pgIDwGWVrGoefBSbxfkMNKmG
 1MPg==
X-Gm-Message-State: AGi0Pua02Q4STfaQxw3onUxDs0lnFXSchnyyNZc8z6NtkSVPNEwdFpme
 SbBTyDY8NB2uTmv77DeCSAKrtZ9ALOouwZWD4ZinCcsn
X-Google-Smtp-Source: APiQypLA3zE9yXe8V6EDhnRn/3IcsYkoXx6JQ9ZmMupfRDhtT1KvLqvGxvPY+RzOC/zfgizOqsXMZ6+2v8CY8P6+lyk=
X-Received: by 2002:a05:600c:2a42:: with SMTP id
 x2mr1043509wme.52.1586246292933; 
 Tue, 07 Apr 2020 00:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
 <20200405112131.1b2c5fc0@ferris.localdomain>
 <CAN=K5G9kfQyDWJ1A+UXFtkNnZs3rryTRj2m-JaVAemJRD4CK+Q@mail.gmail.com>
In-Reply-To: <CAN=K5G9kfQyDWJ1A+UXFtkNnZs3rryTRj2m-JaVAemJRD4CK+Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 7 Apr 2020 08:57:03 +0100
Message-ID: <CAPj87rOPcNpc=2iz-_ZH9ppjkDVNmjHgDyKuYpkUO8Y7Q+x55g@mail.gmail.com>
Subject: Re: Curtaining API / Force blanking displays
To: Erik Jensen <rkjnsn@google.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Erik,

On Mon, 6 Apr 2020 at 20:01, Erik Jensen <rkjnsn@google.com> wrote:
> > Screen scraping like that will have big problems trying to a)
> > synchronize to the display updates correctly (was the screen
> > updated, did you get old or new frame, and you have to poll rather
> > than be notified), and b) synchronizing framebuffer reads vs.
> > writes (is the display server re-using the buffer when you are
> > still reading it). You also get to handle each KMS plane
> > individually.
>
> We're not too concerned with every frame being perfect, as long as
> there aren't frequent annoying artifacts and the user receives
> feedback to typing and mouse movement in a reasonable amount of time.
> (Think browsing the web, not playing a video game.) I'll play around
> with ffmpeg's kmsgrab and see what we might expect on that front.
> Obviously we'd have to handle the hardware cursor in addition to the
> primary plane at the very least. Not sure how common video overlays
> are these days? It seems most players render via GL, now.

A lot, but not all. X11 makes that the only reasonable choice thanks
to its compositing design, but Wayland makes it possible to handle
video externally, and that is what is encouraged.

> > You have to adapt to what the display server does and you have no
> > way to negotiate better configurations. The framebuffers could be
> > tiled and/or compressed, and quite likely are the kind of memory
> > that is very slow to read by CPU, at least directly.
>
> Yeah, I see ffmpeg has some examples of feeding frames through VAAPI
> to handle situations where the buffer isn't CPU mapped. Maybe
> EGL_EXT_image_dma_buf_import could also be useful here?

Don't forget modifiers!

> > The curtaining goes against the policy that the current DRM master
> > is in full control of the display. It also means the kernel has to
> > lie to the DRM master to make the display server unaware of the
> > funny business, and I don't like that at all.
>
> The hope was that this could be done without interfering with the DRM
> master at all. The DRM master could still control resolutions,
> displays, determine which CRTCs go to what outputs, et cetera. It's
> just that the content wouldn't actually be visible on the screen while
> curtaining was enabled, conceptually similarly to if the physical
> displays themselves were configured not to display anything (e.g.,
> switched to a different input, or brightness set to zero), which also
> wouldn't affect output and mode selection.
>
> If this could be implemented in a relatively simple way (i.e.,
> curtaining sets a flag that suppresses the actual scan out to the
> display, but everything else stays the same), it seems like it could
> be a worthwhile avenue to explore. On the other hand, if it requires
> adding a lot of complexity (e.g., maintaining a completely separate
> physical configuration for the graphics card and "shadow"
> configuration to report to the DRM master), I would certainly concur
> that it doesn't make sense to do. Which is closer to the truth is one
> of the things I was hoping to find out from this e-mail.

I think you just end up inventing too much fake hardware in the
kernel. If you handle curtaining by requiring the screen to be on and
showing a black buffer, you have to allocate and show that (not as
trivial as you might hope), and then keep a whole set of shadow state.
If you handle it by having the CRTC be off, you have to spin a fake
vblank loop in a shadow CRTC. I don't think this is something we would
really want to keep.

> > I believe it would much better to cooperate with display servers
> > than trying to bypass and fool them. Maybe look towards Pipewire at
> > least for the screen capturing API?
>
> I agree that this could create a better experience for some use cases
> if supported by all components. Unfortunately, the variety of
> graphical login managers, display servers, and desktop environments
> with different amounts of resources and priorities means that coming
> up with a solution that works for all of them seems untenable. It
> would also preclude being able to use the console remotely.
>
> [... separate sessions aren't viable ...]
>
> Our hope is that interacting at the kernel level can avoid all of
> these issues, especially given that frame grabbing (albeit imperfect)
> and input injection are already supported by the kernel, with
> curtaining being the only thing that does not already have an existing
> interface.

Well, it solves the issue of needing to fix userspace, but it
definitely leaves you with a worse experience.

Userspace has largely standardised on PipeWire for remote streaming,
which also handles things like hardware encoding for you, if desired.
This is used in the xdg-desktop-portal (as used by GNOME, Flatpak,
Chromium, Firefox, others) in particular, and implemented by many
desktop environments. I think continuing to push the userspace
side-channel is a far more viable long-term path. I would suggest
starting with a single target desktop environment to design exemplary
use and semantics, and then pushing that out into other environments
as you come to rely on them.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
