Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DCB19FDCE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0EF887DE;
	Mon,  6 Apr 2020 19:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D143887DE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:01:43 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id v2so504863oto.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0sNQqJahI9MIkHeoT62EAuzC60D2DtfNpk9mBNKSZ8=;
 b=j7YS+YOn17b1nFsdbdI0r/FEL9LuKUXyNS34d96MWC4s8rVOKumFljksPdQ+EFihnw
 0tTf9bkO7ShLQkipkDzFdQHcB4PVMkmXJMYZyG4kp6z6MeCtOrUkuPYYnVphQ60yVOGT
 CThTBx/2SyopIh7T56YwD+GaCN60JbYoCM5V9b4sTPnjUBSwchzeKZOE2uemMJACj3/r
 mME1hp8Grbf8TBU5j2H7EyG3+LY8J4rtXx0gyMV+mcUI9FylGkcLZGo4wcJxkXMtgRP1
 UgIOpc9z6Q0SOIu5XhkliTFqRf2lw7R8WE5NJOrqzA8Qq4wyXr7teiscDilLyIGw0QNW
 7IRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0sNQqJahI9MIkHeoT62EAuzC60D2DtfNpk9mBNKSZ8=;
 b=EeUHC6kOg8qpJA+SDN+Kc1Duyfhdr8KhGL/l08kxeKamLyvtix1fcQzEVy0nDk315S
 SV0Me1T9Dq9XWX8T3Wf5JxLdRdS18u+inGpU1728UIny3ZjXoHuR2yxvkKUoZsB6nWNU
 nKQFsmrb4Gn9fu+zITEzjwSQ62TXvFG9DMD/kRStysq90IU7WM8gzwyqm9okHw+Qp5Hd
 5MDzZIJViZC9wNbL8WCrKqPiDfzUo9vWR4ZMeIApiyDKipgsiajm/pM0ooao83743dUk
 tegqM2rAbtLOx0wSpfsdJWTzOtLDL4nYUySAVnMnGSddJDo2YL1VqU83SwxbqVagN4aH
 /G8Q==
X-Gm-Message-State: AGi0PubsNaOn2WuJKfGKDT2ty44B7v+sp+HKR7NCy4stAWVsnErckvin
 FQ1t2q1dqCqHBOhcWEDSTFSg7Muju0L5IO3r4SXn6g==
X-Google-Smtp-Source: APiQypIbr3vUuGlKw7GcTaxlnP6VALaLlfXTuEcQ2IPsWRMRI5qUdFhG1n/zbi3nfgqa3MDtsmlBHlyjxha+nGLhaDo=
X-Received: by 2002:a05:6830:1610:: with SMTP id
 g16mr18165621otr.358.1586199701648; 
 Mon, 06 Apr 2020 12:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
 <20200405112131.1b2c5fc0@ferris.localdomain>
In-Reply-To: <20200405112131.1b2c5fc0@ferris.localdomain>
From: Erik Jensen <rkjnsn@google.com>
Date: Mon, 6 Apr 2020 12:01:30 -0700
Message-ID: <CAN=K5G9kfQyDWJ1A+UXFtkNnZs3rryTRj2m-JaVAemJRD4CK+Q@mail.gmail.com>
Subject: Re: Curtaining API / Force blanking displays
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the reply! (And thanks Simon for the pointer to ffmpeg.)

> Screen scraping like that will have big problems trying to a)
> synchronize to the display updates correctly (was the screen
> updated, did you get old or new frame, and you have to poll rather
> than be notified), and b) synchronizing framebuffer reads vs.
> writes (is the display server re-using the buffer when you are
> still reading it). You also get to handle each KMS plane
> individually.

We're not too concerned with every frame being perfect, as long as
there aren't frequent annoying artifacts and the user receives
feedback to typing and mouse movement in a reasonable amount of time.
(Think browsing the web, not playing a video game.) I'll play around
with ffmpeg's kmsgrab and see what we might expect on that front.
Obviously we'd have to handle the hardware cursor in addition to the
primary plane at the very least. Not sure how common video overlays
are these days? It seems most players render via GL, now.

> You have to adapt to what the display server does and you have no
> way to negotiate better configurations. The framebuffers could be
> tiled and/or compressed, and quite likely are the kind of memory
> that is very slow to read by CPU, at least directly.

Yeah, I see ffmpeg has some examples of feeding frames through VAAPI
to handle situations where the buffer isn't CPU mapped. Maybe
EGL_EXT_image_dma_buf_import could also be useful here?

> It obviously needs elevated privileges, because you are stealing
> data behind the display server's back. Then you are feeding it
> through network.

Yes. It is expected that elevation would be required at the very least
to grab the dma_buf fds and activate the proposed curtaining mode.

> The curtaining goes against the policy that the current DRM master
> is in full control of the display. It also means the kernel has to
> lie to the DRM master to make the display server unaware of the
> funny business, and I don't like that at all.

The hope was that this could be done without interfering with the DRM
master at all. The DRM master could still control resolutions,
displays, determine which CRTCs go to what outputs, et cetera. It's
just that the content wouldn't actually be visible on the screen while
curtaining was enabled, conceptually similarly to if the physical
displays themselves were configured not to display anything (e.g.,
switched to a different input, or brightness set to zero), which also
wouldn't affect output and mode selection.

If this could be implemented in a relatively simple way (i.e.,
curtaining sets a flag that suppresses the actual scan out to the
display, but everything else stays the same), it seems like it could
be a worthwhile avenue to explore. On the other hand, if it requires
adding a lot of complexity (e.g., maintaining a completely separate
physical configuration for the graphics card and "shadow"
configuration to report to the DRM master), I would certainly concur
that it doesn't make sense to do. Which is closer to the truth is one
of the things I was hoping to find out from this e-mail.

> With uinput, you will be having fun issues trying to guess what
> keymaps the display server and apps might be using, since you need
> to know that to be able to manufacture the right evdev keycodes
> that will be translated into the keysyms you actually wanted.
> Keymaps can change dynamically, too.

This isn't a concern to us, as we plan to transmit keycodes and leave
the keyboard mapping to the remote machine.

> I believe it would much better to cooperate with display servers
> than trying to bypass and fool them. Maybe look towards Pipewire at
> least for the screen capturing API?

I agree that this could create a better experience for some use cases
if supported by all components. Unfortunately, the variety of
graphical login managers, display servers, and desktop environments
with different amounts of resources and priorities means that coming
up with a solution that works for all of them seems untenable. It
would also preclude being able to use the console remotely.

Chrome Remote Desktop currently spins up its own display server (Xvfb)
that's not attached to the local displays at all, but that has its own
issues: the user can't interact with programs running in their
existing local session, a number of programs don't support running
multiple instances simultaneously using the same profile (e.g. Chrome,
Firefox, IntelliJ), and in general things seem to be moving in the
direction of assuming there will only ever be at most one graphical
session at a time for each user. (E.g., DBUS using a single user bus
in place of a per-session bus on many distributions. Also see
https://gitlab.gnome.org/GNOME/gdm/-/issues/580, where GDM will fail
to log a user in locally at all if a graphical PAM session already
exists for the user, even if no programs are running in that session.)

Our hope is that interacting at the kernel level can avoid all of
these issues, especially given that frame grabbing (albeit imperfect)
and input injection are already supported by the kernel, with
curtaining being the only thing that does not already have an existing
interface.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
