Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12823DA35B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 14:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A546ED9C;
	Thu, 29 Jul 2021 12:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC846ED9F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:49:23 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id l17so7424669ljn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=JAtHftGoZIdRbF793MQZdenytVvOhuR2w2p0vI4TqvM=;
 b=gv6kGJWtJKBIqXlbvyNK7uWuBftheIpRp3xDYV5ckti/h7vfzj81cRq6Aa9zYrVdOW
 zzOP/8yUJZda/HwiEMxSJVRzQs/DSXVryUOOwqCDC+fSacgY0AMWJNrIvPdBe0ZPsCr/
 32Kd39XqkahyolurVLlPKZl9/niXGVqdOSd0xebPR5jf7B+VOrzs9KOqs5xPW9RCHz+4
 YOimtOXWIxc6+TOejzPdO0LhW2CzB8HARVakzMGDCZ2+7Ng8VMZdpsumFwBT6vRLOSPA
 LO27iRMcOp6j+kd7KmN7X+peuVgfrLFo5shlmX3ZYjEoaDzw1Gl1vctwz1XaGww/X5uX
 /8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=JAtHftGoZIdRbF793MQZdenytVvOhuR2w2p0vI4TqvM=;
 b=D9IiulEQfskiicvFxuN7tluqV/zq3HvYE1F0fOcSesAvXXzb0XgM6k6QYlwUbb9AvS
 g1hydEolIm0zaDDoa3xvVk51veFTNi9O/b0yVyOWfodaar+s5XXFb87Ed++Aq/fq8iUL
 BF01MmaqCQapKudGRLahHZQKjkjRbfTCOMdQP+56MU6xIZIh0obzCDjcOAzCMWzCYNbL
 hUVFxPE41nc66MPjHhvrY6FrVaOYLxdvtwb2dWvX55FOqmj0kDGXDyf3thcnJl2l4Z95
 Zj3kNPf2K234uBBx81Gph4AKmMnvHtdivHavLHGePBRPYjINhcQ2TCKlZCy9dPJW6Nd9
 gI/Q==
X-Gm-Message-State: AOAM533awP78HM7USY4R5c3b003yHfCmf+wXrj628THBjhCyZHs67m4H
 WucKcCKSqSa2Z48NSbZ1ics=
X-Google-Smtp-Source: ABdhPJwraUG/2uBD9aqWWMmEuwtqFaNhCm+dR0DEMuG51jR6bQeGz3v82T70lQwbmrOXmwP03a6eiA==
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr2805238ljk.117.1627562961302; 
 Thu, 29 Jul 2021 05:49:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f26sm151265ljp.137.2021.07.29.05.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:49:21 -0700 (PDT)
Date: Thu, 29 Jul 2021 15:49:17 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210729154917.5e664b24@eldfell>
In-Reply-To: <c090d320-7f2c-3858-d978-7a6f6e8001c0@amd.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
 <20210729121542.27d9b1cc@eldfell>
 <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
 <20210729140024.6a635be4@eldfell>
 <c090d320-7f2c-3858-d978-7a6f6e8001c0@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WaQfg5HXPPUK15wpoUB4n.D";
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/WaQfg5HXPPUK15wpoUB4n.D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2021 13:43:20 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 29.07.21 um 13:00 schrieb Pekka Paalanen:
> > On Thu, 29 Jul 2021 12:14:18 +0200
> > Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:
> > =20
> >> Am 29.07.21 um 11:15 schrieb Pekka Paalanen: =20
> >>> If the app happens to be frozen (e.g. some weird bug in fence handling
> >>> to make it never ready, or maybe it's just bugged itself and never
> >>> drawing again), then the app is frozen, and all the rest of the deskt=
op
> >>> continues running normally without a glitch. =20
> >> But that is in contradict to what you told me before.
> >>
> >> See when the window should move but fails to draw it's new content what
> >> happens?
> >>
> >> Are the other windows which would be affected by the move not drawn as=
 well? =20
> > No, all the other windows will continue behaving normally just like
> > they always did. It's just that one frozen window there that won't
> > update; it won't resize, so there is no reason to move that other
> > window either.
> >
> > Everything continues as if the frozen window never even sent anything
> > to the compositor after its last good update.
> >
> > We have a principle in Wayland: the compositor cannot afford to wait
> > for clients, the desktop as a whole must remain responsive. So there is
> > always a backup plan even for cases where the compositor expects the
> > client to change something. For resizes, in a floating-window manager
> > it's easy: just let things continue as they are; in a tiling window
> > manager they may have a timeout after which... whatever is appropriate.
> >
> > Another example: If a compositor decides to make a window maximized, it
> > tells the client the new size and state it must have. Until the client
> > acks that specific state change, the compositor will continue managing
> > that window as if nothing changed. Given the asynchronous nature of
> > Wayland, the client might even continue submitting updates
> > non-maximized for a while, and that will go through as if the
> > compositor didn't ask for maximized. But at some point the client acks
> > the window state change, and from that point on if it doesn't behave
> > like maximized state requires, it will get a protocol error and be
> > disconnected. =20
>=20
> Yeah and all of this totally makes sense.
>=20
> The problem is that not forwarding the state changes to the hardware=20
> adds a CPU round trip which is rather bad for the driver design,=20
> especially power management.
>=20
> E.g. when you submit the work only after everybody becomes available the=
=20
> GPU becomes idle in between and might think it is a good idea to reduce=20
> clocks etc...

Everybody does not need to be available. The compositor can submit its
work anyway, it just uses old state for some of the windows.

But if everybody happens to be ready before the compositor repaints,
then the GPU will be idle anyway, whether the compositor looked at the
buffer readyness at all or not.

Given that Wayland clients are not expected (but can if they want) to
draw again until the frame callback which ensures that their previous
frame is definitely going to be used on screen, this idling of GPU
might happen regularly with well-behaved clients I guess?

The aim is that co-operative clients never draw a frame that will only
get discarded.

> How about doing this instead:
>=20
> 1. As soon as at least one window has new committed state you submit the=
=20
> rendering.
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 As far as I understand it that is =
already the case anyway.

At least Weston does not work like that. Doing that means that the
first client to send a new frame will lock all other client updates out
of that update cycle.

Hence, a compositor usually waits until some point before the target
vblank before it starts the repaint, which locks the window state in
place for the frame.

Any client update could contain window state changes that prevents the
GPU from choosing the content buffer to use.

> 2. Before starting rendering the hardware driver waits with a timeout=20
> for all the window content to become ready.
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 The timeout is picked in a way so =
that we at least reach a=20
> reasonable fps. Making that depending on the maximum refresh rate of the=
=20
> display device sounds reasonable to me.
>=20
> 3a. If all windows become ready on time we draw the frame as expected.
> 3b. If a timeout occurs the compositor is noted of this and goes on a=20
> fallback path rendering only the content known to be ready.

Sounds like the fallback path, where the compositor's rendering is
already late, would need to re-do all the rendering with an extremely
tight schedule just before the KMS submission deadline. IOW, when
you're not going to make it in time, you have to do even more work and
ping-pong even more between CPU and GPU after being a bit late already.
Is that really a good idea?

It also means the compositor cannot submit the KMS atomic commit until
the GPU is done or timed out the compositing job, which is another
GPU-CPU ping-pong.

> 4. Repeat.
>=20
> This way we should be able to handle all use cases gracefully, e.g. the=20
> hanging client won't cause the server to block and when everything=20
> becomes ready on time we just render as expected.


Thanks,
pq

--Sig_/WaQfg5HXPPUK15wpoUB4n.D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmECo80ACgkQI1/ltBGq
qqfi1Q//a4JPRnTYoY+g0PYnWzCOHAl26Ry/2vEcIRMJ5MBPEGT17ZftQMTOzy8V
EsQW5TPVcz8mii7Hu8nhTlThPTtjn3ZnHIsX6KRndLf5FU0Psi70P3mdixwjd9Gs
dFg1oCQp2wZv+ua4B18AOklRxwiXv+tPtd+fB1+H0x9Lrue3hIulKJY9mI4nZW/l
3NiMuGGVV/lNA+GzI0legtUMM4hE7Rjt0syh9vLcCvP3cOnMkL/IzZAwXbEx9JW7
9pw/QNwrJBMMiQ4n9sbQ1bnq3Fiy6dmyUHoTclXg/VbcnyNe3cHFxaLBcuuvU0c2
srtDm5Pdh0N1BOQw0kc8bLzSmoNwqTkSQUQz6WUSVTeRiyYb/7D6At3GRYu5r1X8
XntGtj2VQ7TLGkc39qwcnyhw2VTQlOQsZH1YhYTGG6VL5bwLmwv0rX8BghxKEaM5
jVCRFQXIJ/DpbG/Tw67qTXlPvxhcTeo63ZJ7+z5198ZEAk9x73gpKpxrbi0t/s8f
Q6JALe0iMS605cZRF4fBv1VhHBO902fPg4nU0WsubBmWeK4DVBdL+t7x9HZQ9BDp
/gFAAYnQM8KHfLPomY2o7L4hve0ZMgp/cKuSOD3ZkSn9t/OV1wa31Vgoy+VKBdEu
5VH1e7N0awBNuhWrgB3f2hbV+EvEIYdd1iCuuIGZ14VWJgdNV/M=
=Rwea
-----END PGP SIGNATURE-----

--Sig_/WaQfg5HXPPUK15wpoUB4n.D--
