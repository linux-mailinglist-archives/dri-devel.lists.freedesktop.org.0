Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26857C689B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57BC10E468;
	Thu, 12 Oct 2023 08:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2365710E468;
 Thu, 12 Oct 2023 08:55:56 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c038a1e2e6so8447111fa.2; 
 Thu, 12 Oct 2023 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697100954; x=1697705754; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=j+4wftdPCRze2GpHmlyjzCqZh3APF/15k4sxfk/ja1g=;
 b=T2IhiSSJvbSoJDJB2BoQ5PLmJGA02Ek5V7tnaSVqFYD+2ob5TiamO3PUEWOXyElDDT
 jipzkQsHJb8yJmvyWuyq2RvK/SFej/LHIwAZ9378QEe6EgFP41VoV9J7f35/rMdyEDUs
 4X5ESbtJWuZxw4LzS59CMKVxSdJ6vMWuwBQvU4wVUKzYg1elWFxyQRjdLhkYTD9abFd6
 hlxRFnwLddhVutuFcPCPuRIehbEn07MEmR1JsgxUy72FywRHtE5aOg2OSUPItZdKK58K
 isAUl42rFwXFQKNj156LfhKOux1xSXuK/x1a1AOsV0qxEyeg2RvkjB88trJ+dVWJlhRg
 OY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697100954; x=1697705754;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j+4wftdPCRze2GpHmlyjzCqZh3APF/15k4sxfk/ja1g=;
 b=Kx/VXjuMDJ2c4KXiTLJJBPs9ympuMU9mj+aM6XvL3PY74pNmvTdbS3Gw8F/HTlLFzf
 H489sbHoCSlo7paiNLRv46lCOc1Ed0JrwrbqrCoFxY3EY2pire9Hs+JX1YPhEVEWzRk6
 +DqQyeA3DkJbDmWx+Nf6vVxyM8s9EjPx0FZLftiJwTimDVBJ4aSEGXG/dCUh2i4H0OvG
 hn7es+EtYFblbvWOZpSUR51K8ogdEZkoXIYFA5R1Ng8J0+qdkE6rkzlC59KgkgBqruX+
 iFZNS3ktFxgnBh/gJ/VShOYoaxkEdhuGDV0RV2+OawWOiT1yKTwNAkeVcHqH+PGB2cvx
 vwWA==
X-Gm-Message-State: AOJu0YwfV5nCu0+jZwLdZWOuzMRKycQNyyOzU6KfktNKzrq06CC4/amR
 UyQfFhCVreGr4j9rTeD1Xp8=
X-Google-Smtp-Source: AGHT+IFw4RVPUZ+GHqL7aruEHPjWXklm4drvFyZXoXwwL8NpW4NG4vhHQaOXH+crv4nMoge5vuQNog==
X-Received: by 2002:a2e:b784:0:b0:2bb:a123:2db7 with SMTP id
 n4-20020a2eb784000000b002bba1232db7mr20078552ljo.51.1697100953257; 
 Thu, 12 Oct 2023 01:55:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q6-20020a2e2a06000000b002c3c60e86a6sm2866579ljq.124.2023.10.12.01.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 01:55:52 -0700 (PDT)
Date: Thu, 12 Oct 2023 11:55:48 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
Message-ID: <20231012115548.292fa0bb@eldfell>
In-Reply-To: <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
References: <CAK8ByeJBrPEQSgUc91LQO9Krzjh2pauhMTjEC82M8ozayE76Yg@mail.gmail.com>
 <CAJfuBxxmL-GtBgt=033F9UNeLCreFbJh3HrQQN2nYKwR_0uTbg@mail.gmail.com>
 <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell>
 <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hc.s9O5m0Pcos=5MuauxwdY";
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

--Sig_/Hc.s9O5m0Pcos=5MuauxwdY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Oct 2023 11:42:24 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Oct 11, 2023 at 11:48:16AM +0300, Pekka Paalanen wrote:
> > On Tue, 10 Oct 2023 10:06:02 -0600
> > jim.cromie@gmail.com wrote:
> >  =20
> > > since I name-dropped you all, =20
> >=20
> > Hi everyone,
> >=20
> > I'm really happy to see this topic being developed! I've practically
> > forgot about it myself, but the need for it has not diminished at all.
> >=20
> > I didn't understand much of the conversation, so I'll just reiterate
> > what I would use it for, as a Wayland compositor developer.
> >=20
> > I added a few more cc's to get better coverage of DRM and Wayland
> > compositor developers.
> >  =20
> > > On Tue, Oct 10, 2023 at 10:01=E2=80=AFAM <jim.cromie@gmail.com> wrote=
: =20
> > > >
> > > > On Mon, Oct 9, 2023 at 4:47=E2=80=AFPM =C5=81ukasz Bartosik <lb@sem=
ihalf.com> wrote:   =20
> >=20
> > ...
> >  =20
> > > > > I don't have a real life use case to configure different trace
> > > > > instance for each callsite.
> > > > > I just tried to be as much flexible as possible.
> > > > >   =20
> > > >
> > > > Ive come around to agree - I looked back at some old threads
> > > > (that I was a part of, and barely remembered :-}
> > > >
> > > > At least Sean Paul, Lyude, Simon Ser, Pekka Paalanen
> > > > have expressed a desire for a "flight-recorder"
> > > > it'd be hard to say now that 2-3 such buffers would always be enoug=
h,
> > > > esp as theres a performance reason for having your own. =20
> >=20
> > A Wayland compositor has roughly three important things where the kernel
> > debugs might come in handy:
> > - input
> > - DRM KMS
> > - DRM GPU rendering
> >=20
> > DRM KMS is the one I've been thinking of in the flight recorder context
> > the most, because KMS hardware varies a lot, and there is plenty of
> > room for both KMS drivers and KMS userspace to go wrong. The usual
> > result is your display doesn't work, so the system is practically
> > unusable to the end user. In the wild, the simplest or maybe the only
> > way out of that may be a reboot, maybe an automated one (e.g. digital
> > signage). In order to debug such problems, we would need both
> > compositor logs and the relevant kernel debug messages.
> >=20
> > For example, Weston already has a flight recorder framework of its own,
> > so we have the compositor debug logs. It would be useful to get the
> > selected kernel debug logs in the same place. It could be used for
> > automated or semi-manual bug reporting, for example, making the
> > administrator or end user life much easier reporting issues.
> >=20
> > Since this is usually a production environment, and the Wayland
> > compositor runs without root privileges, we need something that works
> > with that. We would likely want the kernel debug messages in the
> > compositor to combine and order them properly with the compositor debug
> > messages.
> >=20
> > It's quite likely that developers would like to pick and choose which
> > kernel debug messages might be interesting enough to record, to avoid
> > excessive log flooding. The flight recorder in Weston is fixed size to
> > avoid running out of memory or disk space. I can also see that Weston
> > could have debugging options that affect which kernel debug messages it
> > subscribes to. We can have a reasonable default setup that allows us to
> > pinpoint the problem area and figure out most problems, and if needed,
> > we could ask the administrator pass another debug option to Weston. It
> > helps if there is just one place to configure everything about the
> > compositor.
> >=20
> > This implies that it would be really nice to have userspace subscriber
> > specific debug message streams from the kernel, or a good way to filter
> > the messages we want. A Wayland compositor would not be interested in
> > file system or wireless debugs for example, but another system
> > component might be. There is also a security aspect of which component =
is
> > allowed to see which messages in case they could contain anything
> > sensitive (input debug could contain typed passwords).
> >=20
> > Configuring the kernel debug message selection for our debug message
> > stream can and probably should require elevated privileges, and we can
> > likely solve that in userspace with a daemon or such, to allow the
> > Wayland compositor to run as a regular user.
> >=20
> > Thinking of desktop systems, and especially physically multi-seat syste=
ms:
> > - there can be multiple different Wayland compositors running simultane=
ously
> > - each of them may want debug messages only from a specific DRM KMS
> >   device instance, and not from others
> > - each of them may have a different idea of which debug messages are im=
portant
> > - because DRM KMS leasing is a thing, different compositor instances
> >   could be using the same DRM KMS device instance simultaneously; since
> >   this is specific to DRM KMS, and it should be harmless to get a
> >   little too much DRM KMS debug (that is, from the whole device instead
> >   of just the leased parts), it may not be worth to consider splitting
> >   debug message streams this far.
> >=20
> > If userspace is offered some standardised fields in kernel debug
> > structures, then userspace could do some filtering on its own too, but I
> > guess it would be better to filter at the source and not need that.
> >=20
> > There is also an anti-goal. The kernel debug message contents are
> > specifically not machine-parsable. I very much do not want to impose
> > debug strings as ABI, they are for human (and AI?) readers only.
> >=20
> >=20
> > As a summary, here are the most important requirements first:
> > - usable in production as a normal thing to enable always by default
> > - final delivery to unprivileged userspace process =20
>=20
> I think this is the one that's trickiest, and I don't fully understand why
> you need it.

It's not an arbitrary unprivileged userspace process. It is an
unprivileged userspace process configured by the system administrator
to receive the information.

I would simply like it to be so that you don't need to have a userspace
process running as root shovelling the bulk debug message data
manually, but that the target process can read it directly e.g. by
getting passed an appropriate fd to it.


> The issues I'm seeing:
>=20
> - logs tend to leak a lot of kernel internal state that's useful for
>   attacks. There's measures for the worst (like obfuscating kernel
>   pointers by hashing them), so there's always going to be a difference
>   here between what full sysadmin can get and what unpriviledged userspace
>   can get. And there's always a risk we miss something that we should
>   obfuscate but didn't.
>=20
> - handing this to userspace increases the risks it becomes uapi. Who's
>   going to stop compositors from sussing out the reason an atomic commit
>   failed from the logs if they can get them easily, and these logs contain
>   very interesting information about why something failed?

That problem exists regardless of where in userspace the data goes to.
Compositors could as well get it from journald if they need it. Or from
the same place where 'dmesg' gets its stuff from, with a tiny helper
with the needed access.

>   Much better if journald or a crash handler assemebles all the different
>   flight recorder logs and packages it into a bug report so that the
>   compositor cannot ever get at these directly. Yeah this needs some OS
>   support with a dbus request or similar so that the compositor can ask
>   for a crash dump with everything relevant to its session.

Ok.

> - the idea of an in-kernel flight recorder is that it's really fast. The
>   entire tracing infra is built such that recording an event is really
>   quick, but printing it is not - the entire string formatting is delayed
>   to when userspace reads the buffers. If you constantly push the log
>   messages to userspace we toss the advantage of the low-overhead
>   in-kernel flight recorder. If you push logs to dmesg there's a
>   substantial measureable overhead which you don't really want in
>   production, and your requirement would impose the same.

Right.

> - I'm not sure how this is supposed to mesh with userspace log aggregators
>   like journald when every compositor has it's own flight recorder on top.
>   Feels a bit like a solution that ignores the entire os stack and assumes
>   that the only pieces we can touch are the kernel and the compositor to
>   get to such a flight recorder.
>=20
>   You might object that events will get out-of-order if you merge multiple
>   logs after the fact, but that's the case anyway if we use the tracing
>   framework since that's always a ringbuffer within the kernel and not
>   synchronous. The only thing we could do is allow userspace to push
>   markers into that ringbuffer, which is easily done by adding more debug
>   output lines (heck we could even add a logging cookie to certain ioctl
>   when userspace really cares about knowing exact ordering of it's
>   requests with the stuff the kernel does).

That's a good point. So we need to agree on the clock to timestamp all
messages in all components, both kernel and userspace, and then use a
log aggregator to interleave logs by timestamp. Is that clock already
defined as UABI?

The compositor flight recorder is a ring buffer too, because it would
be far too much volume to send it all to another process all the time.

>=20
> - If you really want direct deliver to userspace I guess we could do
>   something where sessiond opens the flight recorder fd for you, sets it
>   all up and passes it to the compositor. But I'm really not a big fan of
>   sending the full kms dbg spam to compositors to freely digest in real
>   time.

Well, something has to get the logs in userspace, be that a compositor,
systemd-journald, or another aggregator. And that needs to be available
in production, so not via debugfs. If it does not need too run as root,
even better.

It doesn't need to be real-time all the time, it is enough if it can be
triggered when needed.

> > - per debug-print selection of messages (finer or coarser, categories
> >   within a kernel sub-system could be enough)
> > - per originating device (driver instance) selection of messages =20
>=20
> The dyndbg stuff can do all that already, which is why I'm so much in
> favour of relying on that framework.

Cool. I have no idea of any frameworks, and no opinion of which one
should be used, anyway.

> > - all selections tailored separately for each userspace subscriber
> > (- per open device file description selection of messages) =20
>=20
> Again this feels like a userspace problem. Sessions could register what
> kind of info they need for their session, and something like journald can
> figure out how to record it all.

Only if the kernel actually attaches all the required information to
the debug messages *in machine readable form* so that userspace
actually can do the filtering. And that makes *that* information UABI.
Maybe that's fine? I wouldn't know.

> If you want the kernel to keep separate flight recorders I guess we could
> add that, but I don't think it currently exists for the dyndbg stuff at
> least. Maybe a flight recorder v2 feature, once the basics are in.

Maybe, maybe not necessary, I'm not sure. The thing is, ring buffers
are of fixed size for a reason, they always overwrite oldest messages,
so the volume of messages with ring buffer size determines how long
into the past you can get the messages. Different message sources can
have widely different bandwidth (volume), and different use cases need
logs for different past time periods.

It's really cool if there is no need to copy the same data into
multiple ring buffers, but it is bad to not be able to get logs far
enough back when some unrelated thing is spamming the same ring buffer.

You said that turning the kernel ring buffer contents into strings is a
very heavy operation, so it is not possible to push this scope
separation to userspace, right?

> > That's my idea of it. It is interesting to see how far the requirements
> > can be reasonably realised. =20
>=20
> I think aside from the "make it available directly to unpriviledged
> userspace" everything sounds reasonable and doable.

I never said "free for all". I meant specifically chosen unprivileged
(not running as root or with caps) processes.

> More on the process side of things, I think Jim is very much looking for
> acks and tested-by by people who are interested in better drm logging
> infra. That should help that things are moving in a direction that's
> actually useful, even when it's not yet entirely complete.

I'd love to help with that, but I can barely afford to send this email.

Do let me know if my comments are not helping, so I can do other things
instead.


Thanks,
pq

--Sig_/Hc.s9O5m0Pcos=5MuauxwdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUntJQACgkQI1/ltBGq
qqcpZBAAiKQUS6YwaMfbNnaNZRN5OJTxEjiNK3Q9aQ/4Kxfin0fRc7HNMKSAmwwG
HlO5tPbiJUep0PJrmMxqQ06Fgttr4sHpvvY437uKGY4zXFjZYl+4QLRIOEV2HCV0
EPj2tgkRy9dIqOo0uYgZW1e5AlLlhlb51KlgZg9rfSA2k548DmtcOd548hyoRVbZ
nfZpUY9xJZrjFtn7pazKbQUcMG6ZfGRSGoxUVkc9SVEoKGeMBwm4rutjS9y0PenL
CXnjykuwc6ZdivPcSN7eOVJ7Irkj8irqrloO6n24mW53Y9/wsrAW1il6LG/ZJ1pt
mTdF/yLHNHGVTAsoEsLry8wkKicwL9TT9bsKz6CCnCwqEcGVjlNWA1FThWI/XLT4
Q/C0ul4YhZDXJVkyQeLFjvCJA3LLxIJZqJmQp9hIDZuNIfjyWjZis7ob/ShO7ouN
Ic3LxUtUS6htp09Sb8YQitm59BeVPYx5d5PU0yL1h9KW/cXPNvV0bB7QnY56646i
IXs4+SEd34oL2bVgotx+axE9Rqgg274lRjRaPB5P+ocZAz9hxUXLqJP1YUyrDFjN
LfK1RagFTNL/ZpAXHRWj1pv7qqVflEw9XvIoeffsIr82ei9T8A1EjXKTouQHoelM
D8kXc0J0WUc/X89QdX+lHGBBzf7pEvlZGAajceawlsrwg5RIZu0=
=uoe0
-----END PGP SIGNATURE-----

--Sig_/Hc.s9O5m0Pcos=5MuauxwdY--
