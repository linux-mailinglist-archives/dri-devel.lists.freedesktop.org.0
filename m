Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5379A613
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A52210E048;
	Mon, 11 Sep 2023 08:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873DD10E048
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:38:32 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so7009125e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694421511; x=1695026311; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PAywelCk6rUmAXsdMEMjnB7YN/whli0QfrnYhrfIynw=;
 b=ZQ40v/PRsSPQoZpWKo2TQkX90ukHhb8l/uYPENZ3Ok4/MS9D08uHKaiDAeV1AyxUuK
 VAmhgl4vYisFN7QhjO7ym+Hv+DpHzGV+TGUOdPFajIM1zCOW8Xok6nbhLbCuWcC5LMO5
 /JZA3GTugSf5HyaiiBBqHg0Shr7IW3UcI5Io8kdaUvdYuc+9roK8p1yy+r8IxfeRRFNr
 zqB4sViRwD3OuZFDsK3OOckEU5CHRfRmS3AY3qOIOlotKRb0m8/pjHvPLF6WfnV6fGsy
 JJzCgwUKY7v9+87+zx/Or6mDfdC6aqTo8cVrwbB5H0T0rQhxrxWgJJ4t2RfTDHugfOLo
 ecwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694421511; x=1695026311;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAywelCk6rUmAXsdMEMjnB7YN/whli0QfrnYhrfIynw=;
 b=CYtjVStEEmgwZce91PPPjYEz1ui+AdSO/B/fyvsXMHdDfhZT8idaTWxquiEqzH7CWe
 eVl8OB9gnFR8nW+o+8u7w3ERHlW45R0wYFw84pwoXeqwkB6lqz9sPf/GdpFFVDfJb+Nd
 EBIQcSAmCgijbT69hxQ+fUnpIVjf0BDdTwiQBXTkleRfJMQIbDV7V+IYhr9EV9ZiW171
 0AuiJ5ZMu9Z/xh7BdeNP5WT5BYhjGAEldzwVo1RJAQI29j2zg91txmnjXMsFY7meuLZp
 serUhbaQ2s67CXuOUckpsbsE/3HTlrBLKg9ISDEhdvQPO7lQzULolSxGDBFAqPCsb1RR
 RajA==
X-Gm-Message-State: AOJu0YyrSha1tno98g+sZvkvvrRjTHLxqQqU3daFAa5sLkvCSSiHa6YA
 HRDQV+VfzaPj6pXkam/EEEQ=
X-Google-Smtp-Source: AGHT+IFYoW2NYvFuQ7ZBMwzqVfK2fv480Dq4rAz4EqzDuLe3z3hnkhZS8pA0h5UTtjmqO/bINR0d1g==
X-Received: by 2002:ac2:5052:0:b0:502:9fce:b6d4 with SMTP id
 a18-20020ac25052000000b005029fceb6d4mr5484788lfm.25.1694421510308; 
 Mon, 11 Sep 2023 01:38:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 r3-20020ac25a43000000b005008c11ca78sm1250461lfn.142.2023.09.11.01.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 01:38:30 -0700 (PDT)
Date: Mon, 11 Sep 2023 11:38:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Message-ID: <20230911113827.67ed6c7d@eldfell>
In-Reply-To: <6d506fe7-3c23-3b50-2d29-549ccb4dbe87@suse.de>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <20230908174113.02b65f9c@eldfell>
 <6d506fe7-3c23-3b50-2d29-549ccb4dbe87@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4B8rXP4PJgt+aPoQsKsEHqd";
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
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com,
 Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/4B8rXP4PJgt+aPoQsKsEHqd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Sep 2023 17:10:46 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 08.09.23 um 16:41 schrieb Pekka Paalanen:
> > On Fri, 8 Sep 2023 15:56:51 +0200
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >  =20
> >> Hi
> >>
> >> Am 08.09.23 um 13:16 schrieb Pekka Paalanen: =20
> >>> On Fri, 8 Sep 2023 11:21:51 +0200
> >>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>     =20
> >>>> Hi
> >>>>
> >>>> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
> >>>> [...] =20
> >>>>> + *
> >>>>> + *     But there are two exceptions only for dumb buffers:
> >>>>> + *     * To support XRGB8888 if it's not supported by the hardware=
. =20
> >>>>
> >>>>    =20
> >>>>> + *     * Any driver is free to modify its internal representation =
of the format,
> >>>>> + *       as long as it doesn't alter the visible content in any wa=
y, and doesn't
> >>>>> + *       modify the user-provided buffer. An example would be to d=
rop the
> >>>>> + *       padding component from a format to save some memory bandw=
idth. =20
> >>>>
> >>>> I have strong objections to this point, _especially_ as you're
> >>>> apparently trying to sneak this in after our discussion. NAK on this
> >>>> part from my side.
> >>>>
> >>>> If you want userspace to be able to use a certain format, then export
> >>>> the corresponding 4cc code. Then let userspace decide what to do abo=
ut
> >>>> it. If userspace pick a certain format, go with it. =20
> >>>
> >>> What is the reason for your objection, exactly?
> >>>     =20
> >>>> Hence, no implicit conversion from XRGB888 to RGB888, just because i=
t's
> >>>> possible. =20
> >>>
> >>> For the particular driver in question though, the conversion allows
> >>> using a display resolution that is otherwise not possible. I also hear
> >>> it improves performance since 25% less data needs to travel across a
> >>> slow bus. There is also so little VRAM, than all dumb buffers need to
> >>> be allocated from sysram instead anyway, so a copy is always necessar=
y.
> >>>
> >>> Since XRGB8888 is the one format that is recommended to be supported =
by
> >>> all drivers, I don't see a problem here. Did you test on your
> >>> incredibly slow g200 test rig if the conversion ends up hurting inste=
ad
> >>> of helping performance there?
> >>>
> >>> If it hurts, then I see that you have a good reason to NAK this.
> >>>
> >>> It's hard to imagine how it would hurt, since you always need a copy
> >>> from sysram dumb buffers to VRAM - or do you? =20
> >>
> >> I have a number of concerns. My point it not that we shouldn't optimiz=
e.
> >> I just don't want it in the kernel. Mgag200 can export DRM_FORMAT_RGB8=
88
> >> for userspace to use.
> >>
> >> AFAICT the main argument against userspace is that Mesa doesn't like
> >> 3-byte pixels. But I don't see how this conversion cannot be a
> >> post-processing step within Mesa: do the rendering in RGB32 and then
> >> convert to a framebuffer in RGB24. Userspace can do that more
> >> efficiently than the kernel. This has all of the upsides of reduced
> >> bandwidth, but none of the downsides of kernel code. Applications and/=
or
> >> Mesa would be in control of the buffer format and apply the optimizati=
on
> >> where it makes sense. And it would be available for all drivers that a=
re
> >> similar to mgag200.
> >>
> >> My main point is simplicity of the driver: I prefer the driver to be
> >> simple without unnecessary indirection or overhead. Optimizations like
> >> these my or may not work on a given system with a certain workload. I'd
> >> better leave this heuristic to userspace.
> >>
> >> Another point of concern is CPU consumption: Slow I/O buses may stall
> >> the display thread, but the CPU could do something else in the meantim=
e.
> >> Doing format conversion on the CPU prevents that, hence affecting other
> >> parts of the system negatively. Of course, that's more of a gut feeling
> >> than hard data.
> >>
> >> Please note that the kernel's conversion code uses memory allocation of
> >> intermediate buffers. We even recently had a discussion about allocati=
on
> >> overhead during display updates. Userspace can surely do a better job =
at
> >> keeping such buffers around.
> >>
> >> And finally a note the hardware itself: on low-end hardware like those
> >> Matrox chips, just switch to RGB16. That will be pretty and fast enough
> >> for these chips' server systems. Anyone who cares about fast and
> >> beautiful should buy a real graphics card. =20
> >=20
> > Fair enough.
> >=20
> > Did you consider that every frame will be copied twice: once in
> > userspace to get RGB888, then again by the driver into VRAM, since dumb
> > buffers reside in sysram? =20
>=20
> In the kernel, we reduce the copying to the changed parts, if we have=20
> damage information from userspace. IDK Mesa's software renderer, but it=20
> could certainly apply a similar optimization.

I have already assumed that everything uses damage information to
optimize the regions to copy. It's still two copies instead of one.
Actually, it's slightly more than two copies.

Due to damage tracking and the driver needing to flip between two VRAM
buffers, it is always copying current + previous damage, not only
current damage.

> > I suspect the intermediate buffers (dumb buffers in this case) need to
> > be full frame size rather than a scanline, too. I'm not sure why the
> > driver would need any scratch buffers beyond a couple dozen bytes while
> > doing a software conversion, just enough to have the lowest common
> > multiple of 3 bytes and optimal bus write width. =20
>=20
> For the conversion in the kernel we allocate enough temporary memory to=20
> hold the part of each scanline that changed. Then we go over dirty=20
> scanlines, convert each into the output format and store it in that=20
> temporary buffer. Then copy the temporary buffer to VRAM. The buffer can=
=20
> be reused for the scanlines of a single conversion. But the nature of=20
> the framebuffer (buffers are possibly shared with concurrent access from=
=20
> multiple planes) makes it hard to keep that temporary memory around.=20
> Hence it's freed after each conversion. The code is at [1].

Yes, that's the conversion in the kernel. However, before the kernel
can run that conversion, userspace must have already allocated full
sized dumb buffers to convert its full sized internal framebuffer into.
Since KMS is modernly used with double-buffering, there must always be
two dumb buffers, which means updating a dumb buffer needs to copy not
just current damage but also previous damage. Userspace has no way to
know that single-buffering would be equally good in this case for this
particular driver.

If userspace gave its internal framebuffer to the kernel without doing
the conversion to RGB888, then that internal buffer would be the dumb
buffer, and there would be no need to allocate a second full size
buffer (third, because double-buffering towards KMS).

The driver allocating even full scanlines would be a lot less memory
touched if userspace didn't convert to RGB888, and if the driver used a
tailored conversion function (it literally needs to handle only a single
combination of input and output conditions), it wouldn't need even that
nor to allocate and free on every conversion. I understand you do not
want to pay the cost having such special-case code, and that's ok. It
would just be even further optimization after getting rid of a static
full sized buffer allocation.


> I assume that a userspace software renderer could do a much better job=20
> at keeping the temporary memory allocated.

I'm not sure why the kernel can't keep the temporary scanline buffer
allocated with the CRTC. It only needs to be reallocated if it's too
small. Sure, people probably don't want to spend time on such code.

All the above discussion is based on the assumption that dumb buffers
are allocated in sysram.

It's fine to say you don't want to optimize, but I want to be clear on
the exact trade-off.

The trade-offs vary greatly depending on each particular use case,
which is why I wouldn't make a hard rule of no in-kernel conversions,
just a rule of thumb since it's *usually* not useful or is actively
hurting. Here we are talking about XRGB8888 which is already exempt
from the rule of thumb, with two more special conditions: dumb buffers
in sysram, and the performance traits of RGB888 on the specific
hardware.


Thanks,
pq

>=20
> Best regards
> Thomas
>=20
> [1]=20
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/drm_format_h=
elper.c#L88
>=20
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >>
> >> Best regards
> >> Thomas
> >> =20
> >>>
> >>>
> >>> Thanks,
> >>> pq
> >>>     =20
> >>>>> + *     On most hardware, VRAM read access are slow, so when doing =
the software
> >>>>> + *     conversion, the dumb buffer should be allocated in system R=
AM in order to
> >>>>> + *     have decent performance.
> >>>>> + *     Extra care should be taken when doing software conversion w=
ith
> >>>>> + *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed explana=
tions here:
> >>>>> + *     https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@e=
ldfell/
> >>>>>      */
> >>>>>    =20
> >>>>>     static unsigned int drm_num_planes(struct drm_device *dev)
> >>>>>
> >>>>> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781 =20
> >>>>    =20
> >>>     =20
> >> =20
> >  =20
>=20


--Sig_/4B8rXP4PJgt+aPoQsKsEHqd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT+0gMACgkQI1/ltBGq
qqfZkw//c3NtbP6RC8kmL6mBKUmJya+2HvxjtVrKSkxwrcMRt8EzFYbJREAsdlKE
Aq3Eaw1pFueZIyaZ4SVn59wHgHAh+5ft/P02gv1DOk/GvJd9CRC342ZRTZZxvrGd
c4uGyaBRTDuO+AOgDIPgJet/1qiRQJE3jtcXKAv+oo5prD3r1jV5jM/Hn2SBJdfY
plbn3MqOr0VJRAQDuBnFV7936qsyxvV4aUgvgNpAqkcT1nYLQ7KRs4OEuyv7tEOz
1Z84UnPtEH8Se7IrvgskZPSBiZSH0y0OjjI81pncpZHNs1HlDz2C2SevYvuPfikj
hlRmejQ7zy90IyD/4ZZWKVgSF9cupQrWCI7XTeejuQgSVCo/yxMJ0y8fQ455USj6
J4z/Sh1RVxAQk3zjN7d73v5eFhkdaeSNvlMCRuQq1kmcoCw6etbo6DEkyemiEhqf
dtyfjkZzOrlATkoyIoCayCdDzgUanq6wkP6iomYCYHrHVXl1dUNJw9KtBNl2oi0V
BYZ2KxYZ72U9XrlyiiV36uHlPpr3u5ZIf1RfBF5uY5B5PtRieuVndKWDOKOPfApf
6ImUsvfEyvLquKsWoYIb39QyxkMClXF1QYXAjYtvH4DnOz8bDfAo3+7NOF/Ym1WQ
0hRvfPb7aZLhknlPKziwR5Jj8I9AnmeFN8KPCZYXoGQhpO4l44M=
=mcqF
-----END PGP SIGNATURE-----

--Sig_/4B8rXP4PJgt+aPoQsKsEHqd--
