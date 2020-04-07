Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD51A0942
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3326E591;
	Tue,  7 Apr 2020 08:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6B56E591
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 08:23:28 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id s13so1648262lfb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ucmr3oTLVhB6drkM0U7K+S1Sf7OvSSHn2jwmfwJVpCU=;
 b=QpMwJVYGag3wNScuFU4lxQfShFSiJtWTZpEa2erRnTh32y5Q7RStL5C0NebZ+FpV/g
 TkXkCoY+PwNsyPMV6GBc2oObd3MEmAhp0TvKwvaz93O8ajMNaoS+Ben1GZAOogMh/d1D
 YEVFavFgqSDch2JDAbpFd69zJyK0Uce74Hgm3WN3HVj6D56R0jVZUGsXt6LGwkNVQBrl
 xzk5roPMGHFWMkzqhoQi2JtlTx6MDpDc/FkddCKaMrvihUJa4xxv2noh5bjNeObU1BJy
 rPizpENqR8k6JG2/yLFSJgzLlblJXD2rbIsHSbq9XvngjfCgK8wpDzz1EeG8SIm986/W
 h6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ucmr3oTLVhB6drkM0U7K+S1Sf7OvSSHn2jwmfwJVpCU=;
 b=VtBUlXs7zmeL7C/uwWAEW+SCarja0snYTXgRg2X1ZFyPNEE/Or1P9IwQFFuuV3A2lK
 rPIKBAw7/xsUvf2nv79/U1DXBPYZb8U+73Cb690lZEskSBv7hWcKcMxnhFSwmNkcMV/d
 5ODi8K/GF5EsFqTD0vI7iQGp3VPWvrYai2DwA1Si+yecTRhy6BoZptKK/o4MqmE1YfR5
 /FOMJHqvDg/9CvicQNET5vSlSCqlSl4J+WGudHIoNrUyXmpCEjN4tKx7SYl5Q2SaNqGr
 2UvV0eUwMTs6Y8NoykYpQ8A6mo6WDQD7zLXx+ZS4Pg9k69w0pkuo5giITNCqnquGGLPg
 eErA==
X-Gm-Message-State: AGi0PuaACa/0ypAP9czVo9unaXAudFEC8IlPt9QXFOHZ08xfUJX6ttR2
 LjPwZW4NVfdMj0Dir2itkbY=
X-Google-Smtp-Source: APiQypLS8xMnz8c1McSwOAMzqbYc36gBScLiEF4HngEyK156pgT2cqudCal87FqjqP0FIab0DUwcHA==
X-Received: by 2002:a19:4a03:: with SMTP id x3mr808687lfa.159.1586247806878;
 Tue, 07 Apr 2020 01:23:26 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k3sm11406713lji.43.2020.04.07.01.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 01:23:26 -0700 (PDT)
Date: Tue, 7 Apr 2020 11:23:17 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Erik Jensen <rkjnsn@google.com>
Subject: Re: Curtaining API / Force blanking displays
Message-ID: <20200407112317.0d531278@eldfell.localdomain>
In-Reply-To: <CAN=K5G9kfQyDWJ1A+UXFtkNnZs3rryTRj2m-JaVAemJRD4CK+Q@mail.gmail.com>
References: <CAN=K5G92HHwFqH4FPeqfJkD-hj8HJBy+7dTWEg55BP_HnHFjKw@mail.gmail.com>
 <20200405112131.1b2c5fc0@ferris.localdomain>
 <CAN=K5G9kfQyDWJ1A+UXFtkNnZs3rryTRj2m-JaVAemJRD4CK+Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0714413356=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0714413356==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Id6qYkoTH0ai.1s/NEZJKNz"; protocol="application/pgp-signature"

--Sig_/Id6qYkoTH0ai.1s/NEZJKNz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Apr 2020 12:01:30 -0700
Erik Jensen <rkjnsn@google.com> wrote:

> Thanks for the reply! (And thanks Simon for the pointer to ffmpeg.)
>=20
> > Screen scraping like that will have big problems trying to a)
> > synchronize to the display updates correctly (was the screen
> > updated, did you get old or new frame, and you have to poll rather
> > than be notified), and b) synchronizing framebuffer reads vs.
> > writes (is the display server re-using the buffer when you are
> > still reading it). You also get to handle each KMS plane
> > individually. =20
>=20
> We're not too concerned with every frame being perfect, as long as
> there aren't frequent annoying artifacts and the user receives
> feedback to typing and mouse movement in a reasonable amount of time.
> (Think browsing the web, not playing a video game.) I'll play around
> with ffmpeg's kmsgrab and see what we might expect on that front.
> Obviously we'd have to handle the hardware cursor in addition to the
> primary plane at the very least. Not sure how common video overlays
> are these days? It seems most players render via GL, now.

Hi,

any kind of animation, while running, is a potential source of
continuous fullscreen glitching, depending on how the display server
works. Every key press etc. updating the screen could result in a
temporary black screen in the worst case. Or it could be just fine. Or
anything in between. It all depends on what the display server does and
what you do and how (un)lucky you are.

Wayland compositors may and will attempt to use all hardware (including
overlay) planes to present windows, regardless of window content. Some
have it implemented already, some are still working towards it. The use
of hardware planes is completely automatic, applications do not need to
specifically ask for it.

Applications do have shortcuts they can take if they do specific things
with Wayland, and these shortcuts are recommended because it has
potential of making better use of the display hardware. These shortcuts
are engineered to automatically take advantage of hardware overlay
planes when available. With them, players can avoid using GL themselves.

> > You have to adapt to what the display server does and you have no
> > way to negotiate better configurations. The framebuffers could be
> > tiled and/or compressed, and quite likely are the kind of memory
> > that is very slow to read by CPU, at least directly. =20
>=20
> Yeah, I see ffmpeg has some examples of feeding frames through VAAPI
> to handle situations where the buffer isn't CPU mapped. Maybe
> EGL_EXT_image_dma_buf_import could also be useful here?

You can try, yes. Make sure to use the new GetFB2 KMS ioctl to get the
modifiers.

Maybe I should underline the read/write race:

You do not get notified when a display server updates the screen, so
you poll. When your poll returns a new FB id, you don't know how long
it has already been up, IOW you don't know how many milliseconds you
have grace time before the display server can replace it with another
FB. After the display server has replaced the FB again, it is free to
render again into the FB you just got. When and what the display server
renders, makes all the difference in what you get if you read the FB
too late.

E.g. the first thing a display server does could be to clear the FB to
black. If you get your timings exactly wrong by accident, you will see
nothing but black as long as anything is animating. Maybe even
indefinitely if you don't, in addition to polling KMS state, also poll
the contents of the FB you got.

Timings are something you cannot test for in general. You can test on a
specific machine with a specific display server and specific apps, but
whether that generalises to any other machine or most other machines
will be hard to tell without testing them. Simply some system load
could push you to the "wrong timings" region. A different video mode
will invalidate all your testing.

This design cannot ever be reliable.

> > The curtaining goes against the policy that the current DRM master
> > is in full control of the display. It also means the kernel has to
> > lie to the DRM master to make the display server unaware of the
> > funny business, and I don't like that at all. =20
>=20
> The hope was that this could be done without interfering with the DRM
> master at all. The DRM master could still control resolutions,
> displays, determine which CRTCs go to what outputs, et cetera. It's
> just that the content wouldn't actually be visible on the screen while
> curtaining was enabled, conceptually similarly to if the physical
> displays themselves were configured not to display anything (e.g.,
> switched to a different input, or brightness set to zero), which also
> wouldn't affect output and mode selection.

It does affect things. Not displaying an image can free up e.g. memory
bandwidth, causing the DRM master to succeed in output configurations
it cannot succeed if it was really driving the hardware. So the DRM
master ends up in a state that cannot work, but it looks like it works
because it's not actually done. When your curtaining then stops, who
knows if the display server can recover, since the configuration in the
kernel is something that cannot work.

To get around that, the kernel itself could allocate a placeholder FB
and show that instead of the FB from the display server, but then you
need all that faking complexity in the kernel. Using a different FB
from what the display server programs may also change hardware state
enough, that the consequences can leak: e.g. different pixel formats
and modifiers consume different amounts of memory bandwidth.

> If this could be implemented in a relatively simple way (i.e.,
> curtaining sets a flag that suppresses the actual scan out to the
> display, but everything else stays the same), it seems like it could
> be a worthwhile avenue to explore. On the other hand, if it requires
> adding a lot of complexity (e.g., maintaining a completely separate
> physical configuration for the graphics card and "shadow"
> configuration to report to the DRM master), I would certainly concur
> that it doesn't make sense to do. Which is closer to the truth is one
> of the things I was hoping to find out from this e-mail.

I am very much trying to scare you with the worst case theoretical
scenarios, because I think this is a really bad idea.

> > With uinput, you will be having fun issues trying to guess what
> > keymaps the display server and apps might be using, since you need
> > to know that to be able to manufacture the right evdev keycodes
> > that will be translated into the keysyms you actually wanted.
> > Keymaps can change dynamically, too. =20
>=20
> This isn't a concern to us, as we plan to transmit keycodes and leave
> the keyboard mapping to the remote machine.

Why would that not have exactly the problem I mentioned?

Do you expect your users to figure out what keymap is in effect in the
server, and manually configure the same in your remote client, then hope
it doesn't change?

Keymaps can be user customised as well, so maybe your client does not
even have a matching one.

Or maybe you require users to reconfigure their desktop keymap to match
the remote viewer?

> > I believe it would much better to cooperate with display servers
> > than trying to bypass and fool them. Maybe look towards Pipewire at
> > least for the screen capturing API? =20
>=20
> I agree that this could create a better experience for some use cases
> if supported by all components. Unfortunately, the variety of
> graphical login managers, display servers, and desktop environments
> with different amounts of resources and priorities means that coming
> up with a solution that works for all of them seems untenable. It
> would also preclude being able to use the console remotely.

Unfortunate, but it's the reality today.

If you wanted to do the capture properly, there are alternatives:

- a virtual DRM driver like VKMS (upstream) or EVDI (not upstream),
  which the display servers need to use explicitly

- running the desktop in a VM, let the VM handle the grabbing

- create your own Wayland compositor designed for your remoting and
  hosting a session Wayland compositor (nested compositor architecture)

None meet your exact requirements though.

> Chrome Remote Desktop currently spins up its own display server (Xvfb)
> that's not attached to the local displays at all, but that has its own
> issues: the user can't interact with programs running in their
> existing local session, a number of programs don't support running
> multiple instances simultaneously using the same profile (e.g. Chrome,
> Firefox, IntelliJ), and in general things seem to be moving in the
> direction of assuming there will only ever be at most one graphical
> session at a time for each user. (E.g., DBUS using a single user bus
> in place of a per-session bus on many distributions. Also see
> https://gitlab.gnome.org/GNOME/gdm/-/issues/580, where GDM will fail
> to log a user in locally at all if a graphical PAM session already
> exists for the user, even if no programs are running in that session.)

Indeed.

> Our hope is that interacting at the kernel level can avoid all of
> these issues, especially given that frame grabbing (albeit imperfect)
> and input injection are already supported by the kernel, with
> curtaining being the only thing that does not already have an existing
> interface.

I'm very pessimistic about that. I worry it creates issues for everyone
else, while your scheme won't work properly anyway.


Thanks,
pq

--Sig_/Id6qYkoTH0ai.1s/NEZJKNz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6MOHYACgkQI1/ltBGq
qqdsyg//TtHmpBysLaisqkxtdREQ+D2rIJEGgdXQhFqrAgFBymzMgLmFEDgxxAkn
PTvW5upJhKjucmpIkum1pO+mMe41G2clUvu/9wJO+P5uXVVkqRSPhq+WzsBfhEBd
b7M6NFBlvzdzsJkHO2POvqkWQBYqmUaugbVx1cz5owRxQU8sd1tSQoujA/+4qEAN
q8IaELVAsi6i/aDGU+8EXlBrDmnvMDSPi/bwB02lDKzsimy1Dgk3adG6PbnHlI+8
l7B22x2NYujRDqRdAZnsRoLiokk+hjReTLL/Wik+yAfjJEqZ5FlkJeviPSYO4z3x
puIS4LHBagxQ/FPsjdiFatm8CPovxcUMB6sccj9dyGi+jkEDeVlVscCoXF3IAH/1
Ysiy4M0w2kGR89ni1dR1Gakfo8gqxISyAsTGtmow+Gfc0HZRxcvSIdfj+sI0WiCS
3ZzWU97Plli3roQHYwByLrSPHXuNWT7p3FZEEGuxiUaE5jdoOEuz34c5bvFO7Y20
0eXh5+u1GMBU8DqHA0bLaqCyk/RrriytosCTvIoq1zadapssKT48DYPAI6UMhW+j
uY8o6MOvEt8DPLRaW4Z7tohuGWNQWYOHlPa3uqYz5IWUYvDo2W8fMonA93rN3o8m
cLCFmwmpUz39sW2dcqzTT/PGUopWcRMPjDmA8pFQucvDEkR4IR4=
=ICuD
-----END PGP SIGNATURE-----

--Sig_/Id6qYkoTH0ai.1s/NEZJKNz--

--===============0714413356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0714413356==--
