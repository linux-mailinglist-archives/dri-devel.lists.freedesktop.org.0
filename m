Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05FE7C4D89
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6610E4D5;
	Wed, 11 Oct 2023 08:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7615E10E4CD;
 Wed, 11 Oct 2023 08:48:30 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5041335fb9cso8361973e87.0; 
 Wed, 11 Oct 2023 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697014108; x=1697618908; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6fZvy+rm9WgWz+lQE0FUmkJyOUMU3uv40D8dD89laLU=;
 b=Tky/BQcVt+W6TXbxvrA957z5jZEVRbV6UhkvnOnjcW/LJhEeOHq356hDeDxYmqrDyb
 RU0Vf4kU0jRnHMqVMVof+AN25/+OfeELWPETobDLLLebp4hCgv7nIndat/Z8PofBvWX/
 DwDOhH8tWWehL8J1pqY0x5NnVwtGdTswfR1NZ1ex0cRIbO89xYWPskLWrqmhbts9KYPe
 vBy16K6fkf/sHTF52f7SnPPndkGYnEe2DBzGlBN0KmHmSlJUUeEHmHIm4Gp0wlRN5gjN
 cav+PLOB8nH+cPozxxW8J12d+qqRp7tWszobB/xLtLL/D85F7OIRiN6kVPNlharB3tuT
 L3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697014108; x=1697618908;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6fZvy+rm9WgWz+lQE0FUmkJyOUMU3uv40D8dD89laLU=;
 b=xDEViuxpwLRqaWv/Z7OzQZm+mw/tAoz+nlj1BDKSEZ5UDGiBXhiSSZgUL5SonLfu0L
 jkywEOS66LSVFiEwwWCPtkEJ5JY0njxi2c5PkZWTFQr8WUM/AZHjgByh3JDpKChe4q1I
 wlVO/YgpjsKA2TC8J7fRtPp/OJJWhhG3kmDanhz28AvPigtHGl/xzvrYwFKu/HlzYD32
 xsq8FOv8q+3vVmgtwjrFkQiUn76oRaLUjdyYNaxxxKefIxS7ECKfEI6Dvpyaz2RA+VQ8
 EbdDAXygtm/Nsdhibhj7iMLskolfm6nTK88z1mwhmsd5Jk+zHU7M/Q2wVz2O8USRoR9s
 Ashg==
X-Gm-Message-State: AOJu0YxpMnbbTB0mJ6rzaz4LwTN4hsNhUMl31A9cKL8qnG14n2vQHjU8
 xuYQs367xB1hGm7wyruwGBs=
X-Google-Smtp-Source: AGHT+IGXFxph1WwFXua8hzZ9Z4EvsBgKoz0RTPEJgTj8aaYzaJk7It0iKtUaOjpy9MnPibNIs5mDpQ==
X-Received: by 2002:a05:6512:794:b0:502:cc8d:f1fc with SMTP id
 x20-20020a056512079400b00502cc8df1fcmr15517150lfr.37.1697014108114; 
 Wed, 11 Oct 2023 01:48:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h26-20020ac2597a000000b00502df04c0basm2180080lfp.183.2023.10.11.01.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 01:48:27 -0700 (PDT)
Date: Wed, 11 Oct 2023 11:48:16 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: jim.cromie@gmail.com
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
Message-ID: <20231011114816.19d79f43@eldfell>
In-Reply-To: <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
References: <20230915154856.1896062-1-lb@semihalf.com>
 <CAJfuBxyFYyGCtr5i=P7N=1oX3J=jmdp1VLGLt+z1fAnuvGK2aA@mail.gmail.com>
 <CAK8ByeJBrPEQSgUc91LQO9Krzjh2pauhMTjEC82M8ozayE76Yg@mail.gmail.com>
 <CAJfuBxxmL-GtBgt=033F9UNeLCreFbJh3HrQQN2nYKwR_0uTbg@mail.gmail.com>
 <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sFNdrTfSJHhZs5qlySTOtr=";
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
Cc: =?UTF-8?B?xYF1a2Fzeg==?= Bartosik <lb@semihalf.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/sFNdrTfSJHhZs5qlySTOtr=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Oct 2023 10:06:02 -0600
jim.cromie@gmail.com wrote:

> since I name-dropped you all,

Hi everyone,

I'm really happy to see this topic being developed! I've practically
forgot about it myself, but the need for it has not diminished at all.

I didn't understand much of the conversation, so I'll just reiterate
what I would use it for, as a Wayland compositor developer.

I added a few more cc's to get better coverage of DRM and Wayland
compositor developers.

> On Tue, Oct 10, 2023 at 10:01=E2=80=AFAM <jim.cromie@gmail.com> wrote:
> >
> > On Mon, Oct 9, 2023 at 4:47=E2=80=AFPM =C5=81ukasz Bartosik <lb@semihal=
f.com> wrote: =20

...

> > > I don't have a real life use case to configure different trace
> > > instance for each callsite.
> > > I just tried to be as much flexible as possible.
> > > =20
> >
> > Ive come around to agree - I looked back at some old threads
> > (that I was a part of, and barely remembered :-}
> >
> > At least Sean Paul, Lyude, Simon Ser, Pekka Paalanen
> > have expressed a desire for a "flight-recorder"
> > it'd be hard to say now that 2-3 such buffers would always be enough,
> > esp as theres a performance reason for having your own.

A Wayland compositor has roughly three important things where the kernel
debugs might come in handy:
- input
- DRM KMS
- DRM GPU rendering

DRM KMS is the one I've been thinking of in the flight recorder context
the most, because KMS hardware varies a lot, and there is plenty of
room for both KMS drivers and KMS userspace to go wrong. The usual
result is your display doesn't work, so the system is practically
unusable to the end user. In the wild, the simplest or maybe the only
way out of that may be a reboot, maybe an automated one (e.g. digital
signage). In order to debug such problems, we would need both
compositor logs and the relevant kernel debug messages.

For example, Weston already has a flight recorder framework of its own,
so we have the compositor debug logs. It would be useful to get the
selected kernel debug logs in the same place. It could be used for
automated or semi-manual bug reporting, for example, making the
administrator or end user life much easier reporting issues.

Since this is usually a production environment, and the Wayland
compositor runs without root privileges, we need something that works
with that. We would likely want the kernel debug messages in the
compositor to combine and order them properly with the compositor debug
messages.

It's quite likely that developers would like to pick and choose which
kernel debug messages might be interesting enough to record, to avoid
excessive log flooding. The flight recorder in Weston is fixed size to
avoid running out of memory or disk space. I can also see that Weston
could have debugging options that affect which kernel debug messages it
subscribes to. We can have a reasonable default setup that allows us to
pinpoint the problem area and figure out most problems, and if needed,
we could ask the administrator pass another debug option to Weston. It
helps if there is just one place to configure everything about the
compositor.

This implies that it would be really nice to have userspace subscriber
specific debug message streams from the kernel, or a good way to filter
the messages we want. A Wayland compositor would not be interested in
file system or wireless debugs for example, but another system
component might be. There is also a security aspect of which component is
allowed to see which messages in case they could contain anything
sensitive (input debug could contain typed passwords).

Configuring the kernel debug message selection for our debug message
stream can and probably should require elevated privileges, and we can
likely solve that in userspace with a daemon or such, to allow the
Wayland compositor to run as a regular user.

Thinking of desktop systems, and especially physically multi-seat systems:
- there can be multiple different Wayland compositors running simultaneously
- each of them may want debug messages only from a specific DRM KMS
  device instance, and not from others
- each of them may have a different idea of which debug messages are import=
ant
- because DRM KMS leasing is a thing, different compositor instances
  could be using the same DRM KMS device instance simultaneously; since
  this is specific to DRM KMS, and it should be harmless to get a
  little too much DRM KMS debug (that is, from the whole device instead
  of just the leased parts), it may not be worth to consider splitting
  debug message streams this far.

If userspace is offered some standardised fields in kernel debug
structures, then userspace could do some filtering on its own too, but I
guess it would be better to filter at the source and not need that.

There is also an anti-goal. The kernel debug message contents are
specifically not machine-parsable. I very much do not want to impose
debug strings as ABI, they are for human (and AI?) readers only.


As a summary, here are the most important requirements first:
- usable in production as a normal thing to enable always by default
- final delivery to unprivileged userspace process
- per debug-print selection of messages (finer or coarser, categories
  within a kernel sub-system could be enough)
- per originating device (driver instance) selection of messages
- all selections tailored separately for each userspace subscriber
(- per open device file description selection of messages)

That's my idea of it. It is interesting to see how far the requirements
can be reasonably realised.


Thanks,
pq

--Sig_/sFNdrTfSJHhZs5qlySTOtr=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUmYVAACgkQI1/ltBGq
qqcyqhAApBL3WJoBlku10S+0QQhW2qQ9N3fDnNYQ2QQMkmITou8otpAjqrqga0eh
RvzjhyXF8gehi6bbPPtsksJGWrimBqf5fS2loGEtpX/g7uXAs/9q28ddYEcelAJw
HLqOpj/+qI+cUzywt2FBRkdlsfSti/rEESkTYlLPIhwD9Bf7XZyulhrgc2iCL5AA
exeD/bQ/D3aiBft8q1dDNv36YeEAJuQsaGsFKu72kJlRXb1zvKVLiD1aZ+M1rDJz
04018vbjXqNeTXpKMsR97KFl4GCOyBeaso2UgTB0yclSEZzwIu2xdgV7IjC/3mmA
wdMTeowTe7/MKqM5EeF3VnMrA96daciVrbkhY1HnNau60cGH+Z+dSxAfB9X+08WS
/vJ4pLvd1LL35QXJkq0uIr0fPqkTb3RjeCYR1fXu/Ro8dOyWrUGxzKokVUz0SgMm
gYNQJ1BJ5+IpSyhr9f0tMtZo4/mBurYRt0ZNuLi/A3LIXx+6Lj1ZqgGVzkRGnSIG
njh1pt4OswGmDgvPVeHek+1Tkg9JWX+FS5WKPiISbUHZXjpvN0+qUY5llx9Gd1L1
X0H/QGAuFUCg+NQNeSx3RId8rnvnTHUK/xwqGcRlCydm38CrFig3PIV1kjdGwyRa
RDavZMp8tvI2Qi7CM9jIa0v/yls+6+tZUJjuuaFuNx/jUvlu15Y=
=hP0+
-----END PGP SIGNATURE-----

--Sig_/sFNdrTfSJHhZs5qlySTOtr=--
