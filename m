Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95F456CCF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 10:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174CC6ED8D;
	Fri, 19 Nov 2021 09:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD0D6ED7C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 09:54:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id c32so40935464lfv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=cCmbb3DeLLP09ki4kuTJnLQtb2WYrPD5nXeA3cU7GHA=;
 b=CBkTq6ESHlhgDp68NHzmdZpbcEmNLLnQWp1+ZPSbbqH0lNdBvmM9mKgBhKUg2BwNZP
 lQ8Sle9W/OpUk/RPmfqTfYK0+1s4Ci3uZZvnV4AG7/snRoZS7NZZc/nNkFMXaIoPdP+5
 29hoODFIbGpE77eRmKctbKZ5WhVgMTMJM9cB+SFEOxSDKqrQG45G1rehYYJNW8TgRRpA
 MVM3dWAd5/++pqjAs8qdq94k8RojhP2yE/gT4sdlFT67qYlcr8QBXlCEmTjYQE68q0gL
 AfA7aBmDqMt2/rsY9F2XhUDcmFxczzt1A5Cb8yevWLWXo4nYDsgUs0vXA54KlznNm7WS
 8utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=cCmbb3DeLLP09ki4kuTJnLQtb2WYrPD5nXeA3cU7GHA=;
 b=YN9GOHRc8lDIikpYMuF7Q5D/Qt5hxWtjdpnnKt/aCjoM/1MiCEwAWCZk8mcgMiypAB
 uOt9TCTbdnFe3tr0VQnyxXSf4v8mMZ7pb1hmmGgJpP4oXQPgvso272uZo5fcm33K21Ci
 Sjb4+or69/KtOab8DEaoF14XpmJWhB9y5O/tkX/W1lyN/F7L4PSeGkFTAVDVFV/yIkb7
 JQiWXrfD8vFa6UCUbgftXLccAYoqxpf759PDn90fhUXG9IPKJrsX4nxmCn66/6g8b5dS
 t6fBb41F0BdgophK5P2e0BvXxoRuUNJ2X07Dbq+k9xeilllTgm4c0TbF3s0SOCySqo2e
 wTZg==
X-Gm-Message-State: AOAM533+zdNQHWoK3Nb4BanVDAwNntyi1mEEAQC1q0CyfrsvPQRo+NHh
 0pBzBWdHbC0neXzd5bEg450=
X-Google-Smtp-Source: ABdhPJyMAsdZM1wTFviXfnVXe1xpTGDJW5bHj20TI7D62Huwj4l4m4Q0rLsX2tTFp2ikjlKXTD9LCQ==
X-Received: by 2002:a05:6512:1154:: with SMTP id
 m20mr30708122lfg.600.1637315663309; 
 Fri, 19 Nov 2021 01:54:23 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v24sm240363lji.120.2021.11.19.01.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:54:23 -0800 (PST)
Date: Fri, 19 Nov 2021 11:54:19 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <20211119115419.505155b5@eldfell>
In-Reply-To: <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell>
 <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GCMqU3cCDFY4+95vMjiPI4b";
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

--Sig_/GCMqU3cCDFY4+95vMjiPI4b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Nov 2021 15:30:38 -0800
Rob Clark <robdclark@gmail.com> wrote:

> On Thu, Nov 18, 2021 at 2:39 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Wed, 17 Nov 2021 14:48:40 -0800
> > Brian Norris <briannorris@chromium.org> wrote:
> > =20
> > > A variety of applications have found it useful to listen to
> > > user-initiated input events to make decisions within a DRM driver, gi=
ven
> > > that input events are often the first sign that we're going to start
> > > doing latency-sensitive activities:
> > >
> > >  * Panel self-refresh: software-directed self-refresh (e.g., with
> > >    Rockchip eDP) is especially latency sensitive. In some cases, it c=
an
> > >    take 10s of milliseconds for a panel to exit self-refresh, which c=
an
> > >    be noticeable. Rockchip RK3399 Chrome OS systems have always shipp=
ed
> > >    with an input_handler boost, that preemptively exits self-refresh
> > >    whenever there is input activity.
> > >
> > >  * GPU drivers: on GPU-accelerated desktop systems, we may need to
> > >    render new frames immediately after user activity. Powering up the
> > >    GPU can take enough time that it is worthwhile to start this proce=
ss
> > >    as soon as there is input activity. Many Chrome OS systems also sh=
ip
> > >    with an input_handler boost that powers up the GPU.
> > >
> > > This patch provides a small helper library that abstracts some of the
> > > input-subsystem details around picking which devices to listen to, and
> > > some other boilerplate. This will be used in the next patch to implem=
ent
> > > the first bullet: preemptive exit for panel self-refresh.
> > >
> > > Bits of this are adapted from code the Android and/or Chrome OS kerne=
ls
> > > have been carrying for a while.
> > >
> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > --- =20
> >
> > Thanks Simon for the CC.
> >
> > Hi Brian,
> >
> > while this feature in general makes sense and sounds good, to start
> > warming up display hardware early when something might start to happen,
> > this particular proposal has many problems from UAPI perspective (as it
> > has none). Comments below.
> >
> > Btw. if PSR is that slow to wake up from, how much do you actually gain
> > from this input event watching? I would imagine the improvement to not
> > be noticeable.
> >
> > I think some numbers about how much this feature helps would be really
> > good, even if they are quite specific use cases. You also need to
> > identify the userspace components, because I think different display
> > servers are very different in their reaction speed.
> >
> > If KMS gets a pageflip or modeset in no time after an input event, then
> > what's the gain. OTOH, if the display server is locking on to vblank,
> > there might be a delay worth avoiding. But then, is it worth
> > short-circuiting the wake-up in kernel vs. adding a new ioctl that
> > userspace could hit to start the warming up process? =20
>=20
> In my measurements, it takes userspace a frame or two to respond and
> get to the point of starting to build cmdstream (before eventually
> doing atomic/pageflip ioctl).. possibly longer if you don't also have
> a similar boost mechanism to spool up cpufreq
>=20
> But the important thing, IMO, is that atomic/pageflip ioctl is the
> cumulation of a long sequence of events.. input-boost is letting
> whatever it may be (PSR exit, GPU resume, etc) happen in parallel with
> that long sequence.

Right, exactly. That is why I was musing about a *new* ioctl that
userspace could hit as soon as any input device fd (or network fd!)
shows signs of life. Would that be enough, avoiding all the annoying
questions about which input and DRM devices should participate here
(and what about non-input devices that still want to trigger the
warm-up, like network traffic, e.g. remote control?), or does it really
need to be kernel internal to be fast enough?

As Brian wrote about his quick hack to test that via debugfs, sounds
like the userspace solution would be totally sufficient.


Thanks,
pq

--Sig_/GCMqU3cCDFY4+95vMjiPI4b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGXdEsACgkQI1/ltBGq
qqcdOBAAl9X47lu2lO66cWGjSsacbgjGDy+MldM0YFq5JF8ooCZXNGL176wqkChG
yz9SMJGDApoJ04/NsIE73coxTYU3xKBYTbAeuFxM5IklcXEqKc/4VXDCcim7Lwlg
VzUxOxb1XfNfZNyn4uMANyGpk0uO4dnIpd5u1uaWXhKajn9RTZKwQ2SBbbEt4Dcl
hcDBpGXGU9evx5ZBvUHTNUPcfEsAYWyHKMDGhVZwH5YUYAgwG2P5IHFstX5PUori
O/6SBot5hj7JfCOpV6wZcASeonCeescV2Nq4muPF6yHGI9mbgppaaYi2ezcx6Os+
udxpoovlLoYU54foZaqjsJvy1nlLZLHi4pPIfHmAn8+hJ2IvU5yQoB+7QZe6FhQN
tKhkoqUpUYCSUTMy1v/0mJJ0+zBBChNV3Y5uT/Q8c7TJPPORtAMjU8bP0xgL1SpA
6CB2CPZy+QyCGeQJpR+lAlMGtgZPPzsx9zgS3SM/sItEl+yNDDvkoJMPfYlKjvqH
ZI9KUtZ1BIfYzeU3F2B5vztJRIpG4sDS4nRa+WXHLTQi0eit4ZFqaRU+5oU1HQP8
OmOu+bAlP45l8QiunzbwvCFmq/Kq5PY61ly+iN08+26EXLxeCmVLGi3UGkcIMulI
WeqfT8f3422boYyBp9ftzCnEakQHcU2Sl4gZnXnonw+7SpNNSYY=
=g0x0
-----END PGP SIGNATURE-----

--Sig_/GCMqU3cCDFY4+95vMjiPI4b--
