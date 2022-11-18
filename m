Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D962F24D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 11:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CD210E21E;
	Fri, 18 Nov 2022 10:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5455410E21C;
 Fri, 18 Nov 2022 10:15:37 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u11so6184083ljk.6;
 Fri, 18 Nov 2022 02:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/bE+UQuOqsqViZiyknOf88HY6KNxj6TSr8L058CR0Yk=;
 b=cHUXAr6Wp08tvjyzIhglik4QtJJAMkiFpxpf5xG6kFItFKh2orZjynRE7pmIQOTAi9
 2GAJ2pioURkSdWYwrwhCxltjOqvR6a0cTIDtauNN1zIJuh5PyQAy5eejwXRLcMCOAnu8
 ZCRtqEqOYeiK5BEQU/ShJCZHm/J1/bzRkP1EaAiEC2DUL219RPV5hxHZdik6n93SWkZq
 //nOXWvaJ3oqPnT2S8aNn9L9+JBJJHJO8B6V6dZRI618FNY6JFF9VG94FV1J36cK2DIC
 cPisBnOtLYqa+M5kWUk/ABwZhnwzDyfDwis5QFnMueidf57dYXwO6N81S0I32vixkr+V
 8UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/bE+UQuOqsqViZiyknOf88HY6KNxj6TSr8L058CR0Yk=;
 b=mi7SA5donz5FN160ILrYDh9Yqlj+VSrF02o9u0Yb3eElmZCWiaIAsyRH0X0MXPUA6X
 NXpYce5KsaxyKOF036WqhAHlRG8PPoNLLaO44YD2++7RMeTjMa7PBlV/lAmdah7/NIFr
 +q45L+yL3qlHfr51Jk6yIEVk7w+3zZ/bqX2yyyXYcW+TL40tZ8sMtTZibsWAUknxFPlN
 8L70oFBgBwJckv+tE7B4YNReWwU1EpovzwEPjUL3IsCVY0Ez55EP4oRi/+bhTzlUPVYF
 a5UvL3GFH3UnUACSs35Rn0dqAAt8k6oOgFnaRI2mrWH+bGC0+2M6/2IIej0Hf8bhIVx0
 qgcQ==
X-Gm-Message-State: ANoB5pkcAh8iY/UOSPd9rswKlLQQa6wi27NUIvlNqu3XU9tLmR5ZlETO
 7mXpmKCe0gqgcbhMbaPITrc=
X-Google-Smtp-Source: AA0mqf7PNboodqMp6alOClheePOiUvdkzdNhY1TW7cf6F6mr+AM7kHNAAfHcN9US6DO7FoLrvg5RZA==
X-Received: by 2002:a2e:9d0b:0:b0:279:f7d:15cf with SMTP id
 t11-20020a2e9d0b000000b002790f7d15cfmr2088206lji.468.1668766535309; 
 Fri, 18 Nov 2022 02:15:35 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 l15-20020a2ea80f000000b002776eb5b1ccsm602351ljq.4.2022.11.18.02.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 02:15:34 -0800 (PST)
Date: Fri, 18 Nov 2022 12:15:30 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: Re: The state of Quantization Range handling
Message-ID: <20221118121530.23c7c3ee@eldfell>
In-Reply-To: <CA+hFU4x0PGs-8oUBSXQa9uTNvvW80ZPFnheoBWO0SZnxJ=FKXA@mail.gmail.com>
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <CAPY8ntCnAjGy0e55raxV=2bgi1YPSringrKdRmJHeS+Li=3yeg@mail.gmail.com>
 <CA+hFU4x0PGs-8oUBSXQa9uTNvvW80ZPFnheoBWO0SZnxJ=FKXA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LkrlR7aaSqE6/Vbb7n7kr0u";
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/LkrlR7aaSqE6/Vbb7n7kr0u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Nov 2022 22:13:26 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> Hi Dave,
>=20
> I noticed that I didn't get the Broadcast RGB property thanks to you
> (more below)
>=20
> On Tue, Nov 15, 2022 at 2:16 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Sebastian
> >
> > Thanks for starting the conversation - it's stalled a number of times
> > previously.
> >
> > On Mon, 14 Nov 2022 at 23:12, Sebastian Wick <sebastian.wick@redhat.com=
> wrote: =20
> > >
> > > There are still regular bug reports about monitors (sinks) and sources
> > > disagreeing about the quantization range of the pixel data. In
> > > particular sources sending full range data when the sink expects
> > > limited range. From a user space perspective, this is all hidden in
> > > the kernel. We send full range data to the kernel and then hope it
> > > does the right thing but as the bug reports show: some combinations of
> > > displays and drivers result in problems. =20
> >
> > I'll agree that we as Raspberry Pi also get a number of bug reports
> > where sinks don't always look at the infoframes and misinterpret the
> > data.
> > =20
> > > In general the whole handling of the quantization range on linux is
> > > not defined or documented at all. User space sends full range data
> > > because that's what seems to work most of the time but technically
> > > this is all undefined and user space can not fix those issues. Some
> > > compositors have resorted to giving users the option to choose the
> > > quantization range but this really should only be necessary for
> > > straight up broken hardware. =20
> >
> > Wowsers! Making userspace worry about limited range data would be a
> > very weird decision in my view, so compositors should always deal in
> > full range data. =20
>=20
> Making this a user space problem is IMO the ideal way to deal with it
> but that's a bit harder to do (I'll answer that in the reply to
> Pekka). So let's just assume we all agree that user space only deals
> with full range data.

Limited range was invented for some reason, so it must have some use
somewhere, at least in the past. Maybe it was needed to calibrate mixed
digital/analog video processing chains with test images that needed to
contain sub-blacks and super-whites, to make sure that sub-blacks come
out as the nominal black etc. Just because desktop computers do not
seem to have any need for limited range, I personally wouldn't be as
arrogant as to say it's never useful. Maybe there are professional
video/broadcasting needs that currently can only be realized with
proprietary OS/hardware, because Linux just can't do it today?

Why would TVs support limited range, if it was never useful? Why would
video sources produce limited range if it was always strictly inferior
to full range?

Even digital image processing algorithms might make use of
out-of-unit-range values, not just analog circuitry for overshoot.

But no, I can't give a real example, just speculation. Hence it's fine
by me to discard limited range processing for now. Still, what I
explain below would allow limited range processing without any extra
complexity by making the KMS color pipeline better defined and less
limiting for userspace.

> > How would composition of multiple DRM planes work if some are limited
> > range and some are full but you want limited range output? Your
> > hardware needs to have CSC matrices to convert full range down to
> > limited range, and know that you want to use them to effectively
> > compose to limited range.
> > In fact you can't currently tell DRM that an RGB plane is limited
> > range - the values in enum drm_color_range are
> > DRM_COLOR_YCBCR_LIMITED_RANGE and DRM_COLOR_YCBCR_FULL_RANGE [1].

Yeah, that's because range conversion has been conflated with
YUV-to-RGB conversion, and the result is always full-range RGB in
practise, AFAIU. There is no way to feed limited range color into the
further color pipeline in KMS, but that's actually a good thing.(*)

The following is my opinion of the future, as someone who has been
thinking about how to make HDR work on Wayland while allowing the
display quality and hardware optimizations that Wayland was designed
for:


Userspace should not tell KMS about a plane being limited range at all.
The reason is the same why userspace should not tell KMS about what
colorspace a plane is in.

Instead, userspace wants to program specific mathematical operations
into KMS hardware without any associated or implied semantics. It's
just math. The actual semantics have been worked out by userspace
before-hand. This allows to use the KMS hardware to its fullest effect,
even for things the hardware or KMS UAPI designers did not anticipate.

IMO, framebuffers and KMS planes should ultimately be in undefined
quantization range, undefined color space, and undefined dynamic range.
The correct processing of the pixel values is programmed by per-plane
KMS properties like CTM, LUT, and more specialized components like
quantization range converter or YUV-to-RGB converter (which is just
another CTM at a different point, really) where userspace explicitly
programs the *operation*, and not the input and output types hoping the
driver and hardware does something sensible.

In that design, there is no problem at all to blend multiple planes of
differing quantization ranges together. Userspace first chooses the
blending space, a radiometrically linear RGB limited range BT.709 space
for example, and then programs each plane to produce exactly that. Then
CRTC properties are programmed to produce the desired type of output
signal. Finally, connector properties are programmed to send the
appropriate metadata to the sink. Of course, userspace takes the sink
capabilities into account before deciding all this.

The thing KMS UAPI is missing are the per-plane properties.

(*) The reason it is a good thing that one cannot have limited range
framebuffers is that it would raise problems on how to handle pixel
values outside of the nominal range, that is, the sub-black and
super-white channel values. The immediate problem is that LUT stages
need normalized input and they cannot extrapolate. So if nominal
quantization range is normalized to 0.0-1.0 for LUT input, sub-black
would be negative values and super-white would be greater than 1.0
values, which a LUT cannot sensibly handle. That makes the whole
concept of limited range problematic in the color pipeline. But, if the
color pipeline elements like LUTs are defined *as if* the data was
always full range, it becomes well-defined and useful how the elements
work, and userspace can produce a proper programming that is guaranteed
to work.

By completely removing the concept of quantization range and its
"automatic" handling from the KMS color pipeline and adding processing
elements to do scaling+offset at suitable stages, we gain the ability
to accept, process, blend, and produce pixels in any quantization
range, color space or dynamic range at will.

Another thing such an approach solves is how to interpret
floating-point pixel data which can naturally represent
out-of-unit-range values.


Thanks,
pq

> > Cheers.
> >   Dave
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_colo=
r_mgmt.h#L84
> > [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_=
edid.c#L6756
> > [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_=
edid.c#L5642
> > =20
>=20


--Sig_/LkrlR7aaSqE6/Vbb7n7kr0u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmN3W0IACgkQI1/ltBGq
qqdLmA//Xpln15Y4LBw2YlfsFlPFzTptfCzy8UBKpbOcrUrDJUL8KlA04ntcrAjd
yvgJlr6Hufj5lBs8ujj/xFexWwK4C4xdYUviGVVdFx5h3rAJ01CAe9FJrTRp3fGu
g7K0E1hbv52mqB0PxfwnaQshEv2ziIzwPZ2ZpGFngWE1WW/o9loXaZdJZsrQlSY8
RPmA/bd1pqwe343vRg7vj73DwD0c3KOPefDQSSP3qQk94ZBYA6EkO+qCCj6TVO7Y
Il/81gXJtkmxz+qLqeV8UmreaOQxEMdwOMRbxSEWpkZlcJpsaeQv2ENIxIomQYWq
RsKNoa6HY7fOAxRl+mGUYYum/8H+dMxac5NXb8P64BwWCMXvzTv950Z/aoBuwHXf
Kjz1MIysVYAD6YY3bDdfSWz6oW3CEKhFHXMrh74RIJolCU6O+NPhTvAiuYjUF6zp
w3uXqnSAdlYDaw/P2NXcgKxVvpBYdy5/qygMvcFPp27P0SV0WkVkuXhNlnr+lvEB
WWrGN8K9jzVmXcomgz5g96/sRQD2gStShp/bVqFx87x8bpCnpw5NF6J9a6pWshK1
2GaVRA7Bf2DuOG0TwBlv7HyubEqkU/SQaiLDRlrvrIWbrMI2bwtGM9BU/U8YeP6C
oDRjuZkSKwlE26cObKAVTc3YdDsRIamoQ0XBeTxhH0ssY4lj+vA=
=Muww
-----END PGP SIGNATURE-----

--Sig_/LkrlR7aaSqE6/Vbb7n7kr0u--
