Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F44798903
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8247310E8D5;
	Fri,  8 Sep 2023 14:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24CD10E8D5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 14:41:26 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-501bd7711e8so3704730e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694184085; x=1694788885; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mRUuttuv0CVqVe9EUWaqnLPZSZ3SEw2u/mQESFqLgpw=;
 b=l5sIJFqzo5v6WdqCQfk7pt4Zhr2TAIgfDzMq27ZT0T/NxhE++vPQimmYjZitgmKkbD
 XmUXfcqZPMEYkBtxouszCbGNVYZGE9bqgARTSr9eLqdPeF0RJHz3vjPmUpBoyy7v2suT
 r/KA4wu4zTMTr3OBcAh2jIuxNcXsf7MaO3D+9yi0Y8BKeHb/rfKFvcEEUY1iDuxK7SHP
 SqJgo5lw1pLHHc/yKL16T4wInkbrQTP3Wlm0Ixa4GRpZFuIz4yyNKsA4+3PMIF4calJS
 8UDr6EUbgnZ3hnMl6594zRUANFWsnCvkWUX+fKzNlNhBws3MBCXqAhgYDqBYZ9kHw1BW
 xF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694184085; x=1694788885;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mRUuttuv0CVqVe9EUWaqnLPZSZ3SEw2u/mQESFqLgpw=;
 b=fhAKxwFsivsJsX6uu3aqepodYLD7ZCn+6PkKtoaSBDf4Pg4upPUwnqPPJjTy+S/pcu
 C3WgTylYakZ5C67P7sPIdipXSVs9dgnSuuG4XoB/rTA/UQK4OyuKFGA4uXH/GpfZvk6C
 LlmP10mSXBUW0Aw9wt/gAvRxCw2WM1t9sULYR0yZxTipZnDIWo3ZNe8iXvOO4kBRaPXe
 uxAnnF92Xb8lXyM0gf5LCJ/K8IFB8SO4p9AnpVEvWEBxEmkobMrTwSzEX9Oxkmahgqd2
 TyV1zZKjaXeSv9PtCNeVYpIB+BcP1ObBVf+13cStFSdTZStnM9RUOdAt+P74NRZPY1/L
 cdTQ==
X-Gm-Message-State: AOJu0YxHzu/qUIrpQ4z7aUiKQBBGvS40CCw4VDZ/ibrhdBph5oP7aaQA
 Sn+Q7LWBKuJPN/ErnP+dEAA=
X-Google-Smtp-Source: AGHT+IEIruKAPWEkvle7moqUyBQVmqJQZYHiOeZxkFNUfJMRFrTu3xTkg73vutNi7nAHDMpdTmP9jA==
X-Received: by 2002:a05:6512:2211:b0:4fb:8939:d95c with SMTP id
 h17-20020a056512221100b004fb8939d95cmr2815784lfu.30.1694184084540; 
 Fri, 08 Sep 2023 07:41:24 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x9-20020ac259c9000000b00500a209ef5esm295139lfn.137.2023.09.08.07.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 07:41:24 -0700 (PDT)
Date: Fri, 8 Sep 2023 17:41:13 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Message-ID: <20230908174113.02b65f9c@eldfell>
In-Reply-To: <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5GI7QIw27jzorZz=Zhp0m4K";
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/5GI7QIw27jzorZz=Zhp0m4K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Sep 2023 15:56:51 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 08.09.23 um 13:16 schrieb Pekka Paalanen:
> > On Fri, 8 Sep 2023 11:21:51 +0200
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >  =20
> >> Hi
> >>
> >> Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
> >> [...] =20
> >>> + *
> >>> + *     But there are two exceptions only for dumb buffers:
> >>> + *     * To support XRGB8888 if it's not supported by the hardware. =
=20
> >>
> >> =20
> >>> + *     * Any driver is free to modify its internal representation of=
 the format,
> >>> + *       as long as it doesn't alter the visible content in any way,=
 and doesn't
> >>> + *       modify the user-provided buffer. An example would be to dro=
p the
> >>> + *       padding component from a format to save some memory bandwid=
th. =20
> >>
> >> I have strong objections to this point, _especially_ as you're
> >> apparently trying to sneak this in after our discussion. NAK on this
> >> part from my side.
> >>
> >> If you want userspace to be able to use a certain format, then export
> >> the corresponding 4cc code. Then let userspace decide what to do about
> >> it. If userspace pick a certain format, go with it. =20
> >=20
> > What is the reason for your objection, exactly?
> >  =20
> >> Hence, no implicit conversion from XRGB888 to RGB888, just because it's
> >> possible. =20
> >=20
> > For the particular driver in question though, the conversion allows
> > using a display resolution that is otherwise not possible. I also hear
> > it improves performance since 25% less data needs to travel across a
> > slow bus. There is also so little VRAM, than all dumb buffers need to
> > be allocated from sysram instead anyway, so a copy is always necessary.
> >=20
> > Since XRGB8888 is the one format that is recommended to be supported by
> > all drivers, I don't see a problem here. Did you test on your
> > incredibly slow g200 test rig if the conversion ends up hurting instead
> > of helping performance there?
> >=20
> > If it hurts, then I see that you have a good reason to NAK this.
> >=20
> > It's hard to imagine how it would hurt, since you always need a copy
> > from sysram dumb buffers to VRAM - or do you? =20
>=20
> I have a number of concerns. My point it not that we shouldn't optimize.=
=20
> I just don't want it in the kernel. Mgag200 can export DRM_FORMAT_RGB888=
=20
> for userspace to use.
>=20
> AFAICT the main argument against userspace is that Mesa doesn't like=20
> 3-byte pixels. But I don't see how this conversion cannot be a=20
> post-processing step within Mesa: do the rendering in RGB32 and then=20
> convert to a framebuffer in RGB24. Userspace can do that more=20
> efficiently than the kernel. This has all of the upsides of reduced=20
> bandwidth, but none of the downsides of kernel code. Applications and/or=
=20
> Mesa would be in control of the buffer format and apply the optimization=
=20
> where it makes sense. And it would be available for all drivers that are=
=20
> similar to mgag200.
>=20
> My main point is simplicity of the driver: I prefer the driver to be=20
> simple without unnecessary indirection or overhead. Optimizations like=20
> these my or may not work on a given system with a certain workload. I'd=20
> better leave this heuristic to userspace.
>=20
> Another point of concern is CPU consumption: Slow I/O buses may stall=20
> the display thread, but the CPU could do something else in the meantime.=
=20
> Doing format conversion on the CPU prevents that, hence affecting other=20
> parts of the system negatively. Of course, that's more of a gut feeling=20
> than hard data.
>=20
> Please note that the kernel's conversion code uses memory allocation of=20
> intermediate buffers. We even recently had a discussion about allocation=
=20
> overhead during display updates. Userspace can surely do a better job at=
=20
> keeping such buffers around.
>=20
> And finally a note the hardware itself: on low-end hardware like those=20
> Matrox chips, just switch to RGB16. That will be pretty and fast enough=20
> for these chips' server systems. Anyone who cares about fast and=20
> beautiful should buy a real graphics card.

Fair enough.

Did you consider that every frame will be copied twice: once in
userspace to get RGB888, then again by the driver into VRAM, since dumb
buffers reside in sysram?

RGB565 would probably go the same route I guess.

I suspect the intermediate buffers (dumb buffers in this case) need to
be full frame size rather than a scanline, too. I'm not sure why the
driver would need any scratch buffers beyond a couple dozen bytes while
doing a software conversion, just enough to have the lowest common
multiple of 3 bytes and optimal bus write width.


Thanks,
pq

>=20
> Best regards
> Thomas
>=20
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> >>> + *     On most hardware, VRAM read access are slow, so when doing th=
e software
> >>> + *     conversion, the dumb buffer should be allocated in system RAM=
 in order to
> >>> + *     have decent performance.
> >>> + *     Extra care should be taken when doing software conversion with
> >>> + *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed explanati=
ons here:
> >>> + *     https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@eld=
fell/
> >>>     */
> >>>   =20
> >>>    static unsigned int drm_num_planes(struct drm_device *dev)
> >>>
> >>> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781 =20
> >> =20
> >  =20
>=20


--Sig_/5GI7QIw27jzorZz=Zhp0m4K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT7MokACgkQI1/ltBGq
qqcZbBAAh2jCn6+0vwm+Bfl6rX33EniJI/KEqXldA8kTp/408OxEqMqXBgCozKag
zdsj3kqG7+Hdvt6RUzV3LBb5AAk6w3PRD06sn+JTDdbBsSqGgi6cqLqmbWPzwzTu
gvwqg9hHQ1Ja//1xqDCtbvzvMfFPgnKMUmh2zpmzbm79YW1ZuD1/JQHgzGC5IDwm
o9bp3F5xoAxXTiBgWj8jP5BchJ5nEzu9dGIQklzChSMYLH/eOqYUVM6sgNCS7n/S
GcsV/DzPi4egNtqMeV+lAy/0d+WpUyKNv+fx8nZrgGZpboS4wrp35fiukrivIbjR
vl845dabkcGI6kzGC6gyWbpnnV05G78BMEoWYYsoIVsrS/xK2JbWnLR0ZSl5U+2H
88q0jtsgF41Xh9cp1gO+r0uBSQwO7g8uLoYCpo6yPvJVmsT3pxymu2r0F36sBsf6
P5A3cs2i0Fo3DbuofAv4+oMrzi6EQf7rM4dnKTrG5V3Eil46ensqIZprh975fCmR
ulX5r6pXHU1csxzg4A0UGAtXrWc8VkfP/bn2nd/jK7VG62BYvZugA3T9svqapQpk
lORHiKxlZzJ8jPfVs+QaM44AToWSmkGYIX2mT1EKAxfPnUY6sz2OGr5V+8Z5iOL2
6MKAqtOyaYNDknNGC7hh/KPH9zrRJFZzcJuM414vutCQ3Kf7EhM=
=oFWi
-----END PGP SIGNATURE-----

--Sig_/5GI7QIw27jzorZz=Zhp0m4K--
