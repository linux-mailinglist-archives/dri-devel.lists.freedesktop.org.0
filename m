Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF826FA376
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 11:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8448210E1CA;
	Mon,  8 May 2023 09:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD9F10E1CA;
 Mon,  8 May 2023 09:37:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4eff50911bfso4713245e87.2; 
 Mon, 08 May 2023 02:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683538633; x=1686130633;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FdB9R4L+DV2gsOhlQ5EnNUMFvZX0B8rBWGwZkKTIVyo=;
 b=dGOVzbuAzxVSw+yb5CsQMKnc1AxrGFNX04sB1q/0AYLXb0nRxaK5h95lQiLIqjVHmq
 czMFtIuB9bMICHEDLdKeLEXWVb9NWQMxjN+U1mZkl2XjJG7s3FQfHTfG0uilWDp+yV/4
 dZLZ9nDvnBR8W3tO8/rhkvnezNAPYuqcg/oiACJVotoXSwB3gPXhoYFDhfAzJ8KRKccB
 XVJpVROiEIoogd3j3Ty1hE7/Tbnmw9C1ivrN3YTeKU+LEvS/441RdA+0hMdkqOAuDF2X
 JzDRbM3ySzxug7uQk+6cLeD6Y/wb2BEJbGCAEIfjHRVErw4aZXQWGIBHj+TBNoveINat
 AJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683538633; x=1686130633;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FdB9R4L+DV2gsOhlQ5EnNUMFvZX0B8rBWGwZkKTIVyo=;
 b=kaj4m7VDkpi1e28G6smhwU/ZGuioNr0Rh1I3uNhSpijAxSVvMIRIvOr53o+Q8SVrD4
 CXnvAYVEdNoN2B4WxkpKWEsL9PQBbM4aVZJHib4wTiK+yS/9IuR+c8JXeWWtsjCLdFDY
 aKncfUwuOwI9JvcvMmmmTwJIFjO6pCptHwdaOTNgkKxyojRbnLNmm9ZLDlWmgHnoDl2X
 hobgTtdjE0+DFmKP9Ftacaf2VhlMke0AlVBpT7uXbrFG7FZu/fL/XaC7KRRYhCvPNvXJ
 X/71YRm8jU3Q5ErTjcZrxETCZisnMuZ1eRdvoL3a/GBFdOmQxIFYxF7Qq+u0yh/q8K5j
 iqSQ==
X-Gm-Message-State: AC+VfDyWeO0j7o6wTat+oJ6xqu+cDMnX0UhUDnEV4ookwmkYtLUiZJgw
 wADwdFwTxoDgoBQhnbrl+lw=
X-Google-Smtp-Source: ACHHUZ4G1ZbK7KAs4GX5XoOlUWciSUwDrSgn6eQRnpl+gQ+zaeG9Kb+3/4EVXF7wruCFD05rT1nbtg==
X-Received: by 2002:ac2:425a:0:b0:4ed:b4f9:28c7 with SMTP id
 m26-20020ac2425a000000b004edb4f928c7mr2228826lfl.6.1683538633221; 
 Mon, 08 May 2023 02:37:13 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y5-20020ac24205000000b004efee46249fsm1228995lfh.243.2023.05.08.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 02:37:12 -0700 (PDT)
Date: Mon, 8 May 2023 12:37:09 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230508123709.4d6b0aa7@eldfell>
In-Reply-To: <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OwV+T6tI_WN6NY/j8TR8kXs";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/OwV+T6tI_WN6NY/j8TR8kXs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 8 May 2023 09:14:18 +1000
Dave Airlie <airlied@gmail.com> wrote:

> On Sat, 6 May 2023 at 08:21, Sebastian Wick <sebastian.wick@redhat.com> w=
rote:
> >
> > On Fri, May 5, 2023 at 10:40=E2=80=AFPM Dave Airlie <airlied@gmail.com>=
 wrote: =20
> > >
> > > On Fri, 5 May 2023 at 01:23, Simon Ser <contact@emersion.fr> wrote: =
=20
> > > >
> > > > Hi all,
> > > >
> > > > The goal of this RFC is to expose a generic KMS uAPI to configure t=
he color
> > > > pipeline before blending, ie. after a pixel is tapped from a plane's
> > > > framebuffer and before it's blended with other planes. With this ne=
w uAPI we
> > > > aim to reduce the battery life impact of color management and HDR o=
n mobile
> > > > devices, to improve performance and to decrease latency by skipping
> > > > composition on the 3D engine. This proposal is the result of discus=
sions at
> > > > the Red Hat HDR hackfest [1] which took place a few days ago. Engin=
eers
> > > > familiar with the AMD, Intel and NVIDIA hardware have participated =
in the
> > > > discussion.
> > > >
> > > > This proposal takes a prescriptive approach instead of a descriptiv=
e approach.
> > > > Drivers describe the available hardware blocks in terms of low-level
> > > > mathematical operations, then user-space configures each block. We =
decided
> > > > against a descriptive approach where user-space would provide a hig=
h-level
> > > > description of the colorspace and other parameters: we want to give=
 more
> > > > control and flexibility to user-space, e.g. to be able to replicate=
 exactly the
> > > > color pipeline with shaders and switch between shaders and KMS pipe=
lines
> > > > seamlessly, and to avoid forcing user-space into a particular color=
 management
> > > > policy. =20
> > >
> > > I'm not 100% sold on the prescriptive here, let's see if someone can
> > > get me over the line with some questions later.

Hi Dave,

generic userspace must always be able to fall back to GPU shaders or
something else, when a window suddenly stops being eligible for a KMS
plane. That can happen due to a simple window re-stacking operation for
example, maybe a notification pops up temporarily. Hence, it is highly
desirable to be able to implement the exact same algorithm in shaders
as the display hardware does, in order to not cause visible glitches
on screen.

One way to do that is to have a prescriptive UAPI design. Userspace
decides what algorithms to use for color processing, and the UAPI simply
offers a way to implement those well-defined mathematical operations.
An alternative could be that the UAPI gives userspace back shader
programs that implement the same as what the hardware does, but... ugh.

Choosing the algorithm is policy. Userspace must be in control of
policy, right? Therefore a descriptive UAPI is simply not possible.
There is no single correct algorithm for these things, there are many
flavors, more and less correct, different quality/performance
trade-offs, and even just matters of taste. Sometimes even end user
taste, that might need to be configurable. Applications have built-in
assumptions too, and they vary.

To clarify, a descriptive UAPI is a design where userspace tells the
kernel "my source 1 is sRGB, my source 2 is BT.2100/PQ YCbCr 4:2:0 with
blahblahblah metadata, do whatever to display those on KMS planes
simultaneously". As I mentioned, there is not just one answer to that,
and we should also allow for innovation in the algorithms by everyone,
not just hardware designers.

A prescriptive UAPI is where we communicate mathematical operations
without any semantics. It is inherently free of policy in the kernel.

> > >
> > > My feeling is color pipeline hw is not a done deal, and that hw
> > > vendors will be revising/evolving/churning the hw blocks for a while
> > > longer, as there is no real standards in the area to aim for, all the
> > > vendors are mostly just doing whatever gets Windows over the line and
> > > keeps hw engineers happy. So I have some concerns here around forwards
> > > compatibility and hence the API design.
> > >
> > > I guess my main concern is if you expose a bunch of hw blocks and
> > > someone comes up with a novel new thing, will all existing userspace
> > > work, without falling back to shaders?
> > > Do we have minimum guarantees on what hardware blocks have to be
> > > exposed to build a useable pipeline?
> > > If a hardware block goes away in a new silicon revision, do I have to
> > > rewrite my compositor? or will it be expected that the kernel will
> > > emulate the old pipelines on top of whatever new fancy thing exists. =
=20
> >
> > I think there are two answers to those questions. =20
>=20
> These aren't selling me much better :-)
> >
> > The first one is that right now KMS already doesn't guarantee that
> > every property is supported on all hardware. The guarantee we have is
> > that properties that are supported on a piece of hardware on a
> > specific kernel will be supported on the same hardware on later
> > kernels. The color pipeline is no different here. For a specific piece
> > of hardware a newer kernel might only change the pipelines in a
> > backwards compatible way and add new pipelines.
> >
> > So to answer your question: if some hardware with a novel pipeline
> > will show up it might not be supported and that's fine. We already
> > have cases where some hardware does not support the gamma lut property
> > but only the CSC property and that breaks night light because we never
> > bothered to write a shader fallback. KMS provides ways to offload work
> > but a generic user space always has to provide a fallback and this
> > doesn't change. Hardware specific user space on the other hand will
> > keep working with the forward compatibility guarantees we want to
> > provide. =20
>=20
> In my mind we've screwed up already, isn't a case to be made for
> continue down the same path.
>=20
> The kernel is meant to be a hardware abstraction layer, not just a
> hardware exposure layer. The kernel shouldn't set policy and there are
> cases where it can't act as an abstraction layer (like where you need
> a compiler), but I'm not sold that this case is one of those yet. I'm
> open to being educated here on why it would be.

If the display hardware cannot do an operation that userspace needs,
would you have the kernel internally have a GPU shader to achieve
that operation? It could be kernel-build-time compiled...

How would you implement all of CRTC properties DEGAMMA, CTM and GAMMA
in a kernel driver when the hardware simply does not have those
operations?

Why would it be a screw-up if an API cannot deliver what hardware
cannot do?

> >
> > The second answer is that we want to provide a user space library
> > which takes a description of a color pipeline and tries to map that to
> > the available KMS color pipelines. If there is a novel color
> > operation, adding support in this library would then make it possible
> > to offload compatible color pipelines on this new hardware for all
> > consumers of the library. Obviously there is no guarantee that
> > whatever color pipeline compositors come up with can actually be
> > realized on specific hardware but that's just an inherent hardware
> > issue.
> > =20
>=20
> Why does this library need to be in userspace though? If there's a
> library making device dependent decisions, why can't we just make
> those device dependent decisions in the kernel?

What happened to the idea "put it in the kernel only if it has to
be in the kernel"? Userspace is much easier to work with, faster to
release, faster to fix, easier to innovate, and so on.

Kernel UAPI cannot be deprecated, which means the kernel implementation
can never get simpler. A userspace library OTOH can be left in
maintenance mode and new incompatible major version can be started,
maybe as another project, with no burden of having to keep the old
stuff working, because the old stuff will not need to be touched and it
just keeps working same as ever. There can even be several differently
designed userspace libraries for projects to choose from.

We have much less an idea of what such library API should look like
than the kernel UAPI proposed here. There is no Khronos committee here.
I mean, Khronos tried, right? OpenWF?

The aim is to be able to take advantage of hardware to the fullest,
which excludes the possibility of hidden copies in the kernel, which
excludes GPU fallbacks in the kernel, so it's natural the kernel UAPI
design aims to expose hardware the way it is.

> This feels like we are trying to go down the Android HWC road, but we
> aren't in that business.
>=20
> My thoughts would be userspace has to have some way to describe what
> it wants anyways, otherwise it does sound like I need to update
> mutter, kwin, surfaceflinger, chromeos, gamescope, every time a new HW
> device comes out that operates slightly different to previously
> generations. This isn't the kernel doing hw abstraction at all, it's
> the kernel just opting out of designing interfaces and it isn't
> something I'm sold on.

Userspace, that does not want to be hardware-specific, always has a
fallback path, usually through Vulkan or OpenGL composition.

Even hardware-specific userspace will never regress due to a kernel
update. You have to swap out hardware in order to potentially "regress".

I never thought that swapping out hardware causing something to stop
working when it has never worked on that hardware ever, could be seen
as a kernel regression. Have the rules changed?


Thanks,
pq

--Sig_/OwV+T6tI_WN6NY/j8TR8kXs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRYwsUACgkQI1/ltBGq
qqcbbRAAkxeVXrUiuuAaf+H3ZaUwY2Xe9LWrWg/5fYxp2LGj4XvWhsYLxoe9rvnm
KNTDhc5pRzOD7hhWqBM3shQFsiw9QDWUpz0hjvGUuOzbfXcDkDYuqFK88o79S0Bt
WBhRDbqQhLf08zIDVvK70mUOeyweNQAV5fMwC4BonnWmaSE6KkUq5MpAiiDFkqpT
3MXREFTvhI/fN52Pi3qIkOR+lf8ivrkXHsUbACIbgKo6hPyRAE/5vivKYjUpz4/j
aBhnqeGixhv0tODu6UpVbUkPv/wUvQ+6fOzx1nHNhvU4D+CI4pktwJFCEN8h1X6k
FexBENi0nuIJj9JaLP7YdQdqb8e7zaTrpwCsgDTSgclrNCchJa5whxmJmIdAKrjl
qidtYBhDczJZMpt8s5YmicY3IjnLZ27JzKHtAELPDCT3vGC2aJcbQTFMfMt5GBLw
8+c+Q5kgVcSyy63FlKkXGlCWfx0xF0OGOePX7ov4Zfla25llFTVeZknL+Wj1wv0W
6ZitocJ7KGop+ZUV7gpZEJbuNOKu4W5cDeZObvC0bm05Fo/5Pnp3Ss8b0gfmKR/h
fFhqnvEj/akUIHVsB549gcL0j6MnHrMQEqfbCsbVPuT5dtn9kxlAAWjiIGwVJlQl
HNZkQZ1n1v1MegHGkBE0Vwf1rtT6jrh/AOiaZhnHGR71wNNd/TY=
=8UuN
-----END PGP SIGNATURE-----

--Sig_/OwV+T6tI_WN6NY/j8TR8kXs--
