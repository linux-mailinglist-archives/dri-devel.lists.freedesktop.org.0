Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407524026C2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 12:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5EF89D8A;
	Tue,  7 Sep 2021 10:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D689D8A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 10:08:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id q21so15623212ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=deOm7nwagWbgWVS+gmbjDW9682gUgU6uSoCTADA0d7g=;
 b=O6HE5P1YhoTgM0USg/jjtmjqxy5dLxUoJWADryRuNnLPcwRdsUlPrpRY9/5YtiPgzb
 M9WYhCvCF9uaEBSIoYTxFum0UQ34O6DcipRJTLYGT5nRA4P/vpW2163AWOIOeBc74PF2
 RSYJ//O1ZpRKxCBloNGMQqSFirITZ3bms4cMxFDG4MnqRA0uKIDCgW6aFi7Zu8U4eZCX
 KYQ2kI0rR4GPpD9cNwvhi8gMbEP3GwLgPubQqRG7L0xTjm7B0KKS/Q7GO3J3p3j2luVb
 tFzDF3vGrhd0MpYy/eVCE5GiRYvJ+J0yVtxtN6DOSbis2P4fW23stFQNBH4KuGDhFBct
 tm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=deOm7nwagWbgWVS+gmbjDW9682gUgU6uSoCTADA0d7g=;
 b=WU8QghQHYIt7+53RZtx2h35FZzpEwvslYpKwYA9l1mbTF7bj/CJ43kG47FAHDC1Cdx
 IobHW0JEZm+gEBe/DrfUNjIJCTXICepizMw+txMhNgV2XXnsBg8YQMOmV7nd+jw8gKrb
 Ngq/iEPXvqObDS9is76Rli6SV3qXfkuB26vBlHfjswMgoo6D/3VRLtyNaKkNCh93lefR
 +iRBBtEsLxfB/s2atdD6OzGQKkd8jyyFKxLSLQ+1T38q21oD7tcrK7HDRDZbRGapeWCG
 kJC3YC7llKiFW2NA31tWUvupTWYY2PTZ9OdPqYnLz2DHYd8SkywHzU6gIxLGqPZK3Reg
 q2sQ==
X-Gm-Message-State: AOAM533hV7hQdly41708Zx7xorTTdV5LeBiz0aZiOB9XzB7j16eDCiUe
 jxBGwpJsvzBrXA1cPTFiD04=
X-Google-Smtp-Source: ABdhPJzQhwino8PAeenYpXqFdHG0B3eoTRa+muKL5SpenFTltAtAjhwuZ9g91GlZOwsqw6PapK0hnA==
X-Received: by 2002:a2e:984e:: with SMTP id e14mr14141045ljj.134.1631009279581; 
 Tue, 07 Sep 2021 03:07:59 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a13sm1381276ljn.120.2021.09.07.03.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:07:56 -0700 (PDT)
Date: Tue, 7 Sep 2021 13:07:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Dennis Filder <d.filder@web.de>
Cc: dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210907130746.7b667dac@eldfell>
In-Reply-To: <YTJypepF1Hpc2YYT@reader>
References: <YTJypepF1Hpc2YYT@reader>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//nU5BE.ag0tTB/6zKQ3N23x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_//nU5BE.ag0tTB/6zKQ3N23x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Sep 2021 21:08:21 +0200
Dennis Filder <d.filder@web.de> wrote:

> Hans de Goede asked me to take a topic from a private discussion here.
> I must also preface that I'm not a graphics person and my knowledge of
> DRI/DRM is cursory at best.
>=20
> I initiated the conversation with de Goede after learning that the X
> server now supports being started with an open DRM file descriptor
> (this was added for Keith Packard's xlease project).  I wondered if
> that could be used to smoothen the Plymouth->X transition somehow and
> asked de Goede if there were any such plans.  He denied, but mentioned
> that a new ioctl is in the works to prevent the kernel from wiping the
> contents of a frame buffer after a device is closed, and that this
> would help to keep transitions smooth.

Hi,

I believe the kernel is not wiping anything on device close. If
something in the KMS state is wiped, it originates in userspace:

- Plymouth doing something (e.g. RmFB on an in-use FB will turn the
  output off, you need to be careful to "leak" your FB if you want a
  smooth hand-over)

- Xorg doing something (e.g. resetting instead of inheriting KMS state)

- Something missed in the hand-off sequence which allows fbcon to
  momentarily take over between Plymouth and Xorg. This would need to
  be fixed between Plymouth and Xorg.

- Maybe systemd-logind does something odd to the KMS device? It has
  pretty wild code there. Or maybe it causes fbcon to take over.

What is the new ioctl you referred to?

Being able to be started with an open DRM file descriptor is not
necessary for a smooth hand-over as far as I know. There are tons of
other details that are, though.

>=20
> I am a bit disappointed with this being considered a desirable way of
> handling that transfer of control over a shared DRM device as it shows
> a lack of ambition.  Sure, it's probably easy to implement, but it

Or more likely bigger fires and lack of time, like with everything.

> will also greatly limit how such transitions can be presented to the
> user.  In practice it would mean plymouthd closing the DRM device and
> exiting so that systemd can start the display manager which then
> starts an X server to present the login screen.  If for that several
> shared libraries have to first be loaded and relocated while the
> system is under heavy load then there will be a noticeable delay
> manifesting as a frozen screen.  After that the best you can hope for
> is blending the still-frame over into the login screen (or whatever
> comes then).  The VT-API-based switching mechanism currently en vogue
> suffers from similar limitations.

All that is already solvable purely in userspace in my opinion, today.
It's just a big project over several independent userspace software
projects.

> If the approach to transferring control were to be changed to a scheme
> that involves both donor and recipient process connecting to each
> other on a unix socket and actively coordinating the transfer
> (i.e. the calls to drmSetMaster and drmDropMaster) then this would
> open the door to a host of possibilities.  Not only could the
> transition be kept infinitesimally short since both processes are
> already up, but it could also involve e.g. the recipient continuing an
> animation the donor had going reusing state that is transferred as a
> memfd.  This way there wouldn't be any noticeable freezes on the
> display making for a far more polished, and thus impressive
> experience.  It would be a feat a program alone cannot achieve on its
> own.  Another option made possible would be implementing a watchdog.
> If the recipient transfers e.g. file descriptors for a pipe and a
> pidfd of itself, then the donor could monitor those for a
> heartbeat/process termination and take back control over the device if
> something goes awry (deadlock/crash) and initiate a recovery
> mechanism.  With the other approach implementing such features is
> simply not possible.

Nothing in the kernel stops userspace developers from doing exactly
that. Seems like you would be working on Plymouth and a display server
of your choice. Don't forget to count in systemd-logind as well, since
that is a popular component for managing sessions and is involved with
e.g. drmSetMaster.

It's a good goal.

It's also more or less necessary for a smooth hand-over of a KMS device
between any two processes also for other reasons I've discussed in the
past with DRM developers. This is the topic about any KMS client (a
program using KMS) needing to reach a guaranteed "clean" KMS state to
display correctly.

The kernel DRM subsystem never resets KMS state in any way, apart from
driver initialisation.

This means that when a new KMS client takes over, the KMS state could
be anything, whatever the previous KMS client left in. This is a
problem, because the KMS client may not know how to reset all the KMS
properties to clean, sane defaults. Currently there is also no reset
ioctl in the kernel either, and no userspace space solution for storing
a sane default state. The problem arises from KMS properties: each KMS
client may not know how to program all the KMS properties the kernel
supports on the device. For example, if one KMS client leaves the
output in HDR mode, and the next KMS client does not understand the HDR
property, then quite likely the latter KMS client will display an awful
image without knowing it.

There is also the convention of a KMS client not restoring the
inherited KMS state on exit or switch-out, because that could cause
unnecessary flicker on screen and delays. This amplifies the above
problem.

The only time the KMS state is at "sane" defaults is right after driver
initialisation. Presumably. So only the first KMS client after a reboot
can expect a sane KMS state.

Mind, also fbcon is a KMS client, it's just a kernel-internal one.
Letting fbcon take over momentarily can reset some KMS properties to
nice defaults, but not all, because when new KMS properties are added,
no-one usually remembers to patch fbcon/fbdev/whatever to reset it when
fbcon takes over. Switching temporarily to fbcon also causes flicker
and delays.

The above problems could perhaps be solved if there was a generic KMS
hand-over protocol in userspace. The two KMS clients could agree on
which KMS properties should be reset and by whom. Who understands and
programs which KMS properties. And perhaps, some system component in
early'ish boot could save the driver-initial KMS state which is
presumably the good default for any use case, on the properties any
particular KMS client does not know or bother to program by itself.

So yes, userspace protocol for KMS hand-off would be very welcome. But
who would have the time to develop it, when so far we can just limp
forward with the current undocumented conventions.

Such protocol, if widely used, might also make it unnecessary for KMS
clients to save and restore KMS properties they do not understand when
they switch out and later back in. When a KMS client has released
DRM master on the device, some other KMS client could have "messed up"
the KMS state, so restoring to what you used before is necessary. I
don't think anyone actually implements this save/restore yet for
unknown KMS properties, and it would be much easier to implement than
the hand-off protocol. Maybe switching is either not done, or it is
always done to/from a display manager process which sanitises the KMS
state or enforces that KMS clients do not leave random state behind. Or
maybe most KMS clients are just really good at agreeing on which KMS
properties everyone will use. If some stale KMS property causes a
problem on some KMS client (display server), it is pretty easy to just
add support for programming that property in the KMS client. Problem
solved and no hand-off protocol needed. Then the next KMS client hits
and does the same.

> Making processes talk to each other and work together like this would
> also be a far more accurate software representation of what is
> actually going on: different subsystems passing control over a shared
> device around to work towards the common goal of a good user
> experience.
>=20
> A bit of context: The idea underlying this came from my experience
> with accessibility technology under Linux where uncoordinated fighting
> over the audio device among all kinds of processes led to countless
> ways in which things would break with no hope of ever fixing anything.
> It instilled in me the conviction that user-facing programs are broken
> if they are not written to talk to each other to coordinate access to
> shared resources for the goal of rendering a good user experience, but
> instead leave it to the distro maintainer/user to set things up into a
> static, brittle working order.  Seeing a much-needed cultural shift
> begin somewhere would be nice.  The Plymouth->X transition would lend
> itself well as a starting point since many building blocks are already
> there.

I might recommend picking a Wayland display server instead of Xorg
first. The thing is, Xorg is only a middle-man and it is some X11
client that decides what and how will be displayed. Therefore with X11
architecture, it's not just two processes that need to communicate the
hand-off, it's three: Plymouth, Xorg, and the X11 client that will
actually draw stuff.

In Wayland architecture, you only need to communicate between Plymouth
and the Wayland compositor you picked. How that Wayland compositor
draws anything is an internal detail to it, so you can solve that
in-project.

You could also think that how Xorg gets the content is an internal
detail to the X11 desktop, but that might lead to needing some new X11
protocol extension to be able to control Xorg's actions on the KMS
device sufficiently. It may also be hard to get any new feature code
into Xorg and released.


Thanks,
pq

--Sig_//nU5BE.ag0tTB/6zKQ3N23x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmE3OfIACgkQI1/ltBGq
qqdg6A/6A+8d/vN6RLnNTFlGsgjzTiM1sRRFIdzw1La95Kr19HOg1q719UTwfSQo
Iuy82otwTeoCRQJN6SWcuwRiGuYTzvRPFaLMEvKxQjn7uRFztp4aULWWZNiljDwy
osugSbxVPfyNqbkPFg05GAaW0Q80luHk0DzYL1CX6N3t+w3VykihDp0K64kPfSCn
iNCv7xv2D7JIQ8IcGiG8aDbuYYCyfmrQuoMnLV0/Zc4ejRV4OMATB2yfF4NdRiQA
RVPHT9OGwa5OU56RWJRdhoFqHAOZxNp4A36ypotbob+IpRqkziRorkR4xaCZA2wV
gKr/H2CEHA+hajWkRCUEKyg8rPDjQwnTYgizhapr+zRgxgzx/abTbUWEUV+tVWbw
jqGh639JcMlQx54sXPeoX1waV8jJrsMtREGwVaWceZ2E+4arb0LkSdBQ3m3He7u+
VAMnCcXRi4DmJGo1fjTVr2dcRYDvYM/7LIyVPL0+GFYCb5CKlw2UsKUC/wiR4UBw
EYQpL5UKI5DZWCg2yRX9WKNO8j1IldvJ8OSlEzejbI1j8Q++ye7Yyk0PFJ5AeJwJ
6fKg8XNe8RNmLPsN7Pq906aJBJFa7IvereQNqwENu2Is72MKElcx/L1+gasfYgHp
HYc2BrVszx5xi0RX5YhR+m9z4+nAdVy1lVxc6NYuqakyGfuMQrc=
=d+2S
-----END PGP SIGNATURE-----

--Sig_//nU5BE.ag0tTB/6zKQ3N23x--
