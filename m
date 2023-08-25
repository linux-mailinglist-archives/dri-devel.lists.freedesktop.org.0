Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1B78811E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4779810E61F;
	Fri, 25 Aug 2023 07:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353BC10E61F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:41:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so922578e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692949262; x=1693554062;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=cD13ysQDEQtzb5T0cN2AXWX04XbhHtbq7MEMXvl+zpc=;
 b=lpaSxu9+AoeFcXRJubCQgiCFvuwIC/UG08j5gvliv6xU9l7yyI8H5aMt4xtxV+n6+a
 nX+7bewIcWiDjeK/RU2MWEiSreXHSmu6QmO1z1PAlbE9d0tvRwhldEuocBV8IPYy4ScF
 NekfDVBUsyFuGYn6AH2BSd1q3aWoQxB+oSyJNY4eiKer7gUKXPHn1lgwKhU3cuS+omZY
 lGV8oJp+osIeTfQseMbC7OXTXcPlHR5QgG37EyNgSgcR2M1Fb/BZ+/xubwfv3iwT/2Sq
 GMqEtftANpv6gHvA7MLLdqHvEQPRyuFhabLj8TTCHl9peIrxSh9FRwBbB7Wwu1avjjoD
 IXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692949262; x=1693554062;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cD13ysQDEQtzb5T0cN2AXWX04XbhHtbq7MEMXvl+zpc=;
 b=kXp7My/1ycM7uISk9MsEThlcJLbndzvm4d1GoFPBLqBYG99oaAy7+IsYWNpiuN4vPQ
 WEkYYQKzIV7uO6LzZNLjUpdgxcI94qYNn0VD9SaSaBECgiYafwoGI//45oaKvel/FIVc
 lA1paSVRZoXAcXofZCxbHjuJ5uImvavH0pplQzmyM89LSR5J3RMkZOkI3jjyMqlBvz3O
 kujIYcBTIleFkYZ09Bfr9VK5kriSuA7sng18K42ypdyArH2O0dim5jl1TsziIAuRKD+l
 McJwfZXFWVyJ8pTbWu3Xp6aAVwV4/XTJ+gF8lgB7T/lCBunbc/sqAcLrguprT3LX/QOG
 /tSA==
X-Gm-Message-State: AOJu0YzrrBZmWdsbhYB5L5tqk8MJC23KDp9dpuj2jF8vsymKjLdk4MV5
 WTb+sUr70OUoBViODP/6E1w=
X-Google-Smtp-Source: AGHT+IFvGvdYfaeklvvi8PSuRrP1W2qgMZ+uhx+OlDPaQEgCfmRr8SndcURTCbcOJOfVXTV7LbzswQ==
X-Received: by 2002:a05:6512:2092:b0:500:9a15:9054 with SMTP id
 t18-20020a056512209200b005009a159054mr4301903lfr.20.1692949261841; 
 Fri, 25 Aug 2023 00:41:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 b2-20020ac247e2000000b00500a0f163a7sm187268lfp.120.2023.08.25.00.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 00:41:01 -0700 (PDT)
Date: Fri, 25 Aug 2023 10:40:52 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hsia-Jun Li <Randy.Li@synaptics.com>
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
Message-ID: <20230825104052.4573ab7b@eldfell>
In-Reply-To: <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
 <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tr7WWQIDlF4Ol+gu09=9THA";
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, akpm@linux-foundation.org,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Tr7WWQIDlF4Ol+gu09=9THA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Aug 2023 15:11:23 +0800
Hsia-Jun Li <Randy.Li@synaptics.com> wrote:

> On 8/23/23 12:46, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >=20
> >=20
> > Hi Hsia-Jun,
> >=20
> > On Tue, Aug 22, 2023 at 8:14=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics=
.com> wrote: =20
> >>
> >> Hello
> >>
> >> I would like to introduce a usage of SHMEM slimier to DMA-buf, the maj=
or
> >> purpose of that is sharing metadata or just a pure container for cross
> >> drivers.
> >>
> >> We need to exchange some sort of metadata between drivers, likes dynam=
ic
> >> HDR data between video4linux2 and DRM. =20
> >=20
> > If the metadata isn't too big, would it be enough to just have the
> > kernel copy_from_user() to a kernel buffer in the ioctl code?
> >  =20
> >> Or the graphics frame buffer is
> >> too complex to be described with plain plane's DMA-buf fd.
> >> An issue between DRM and V4L2 is that DRM could only support 4 planes
> >> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
> >> interface to support that 4 more planes which would lead to revision of
> >> many standard likes Vulkan, EGL. =20
> >=20
> > Could you explain how a shmem buffer could be used to support frame
> > buffers with more than 4 planes?
> > If you are asking why we need this: =20
> 1. metadata likes dynamic HDR tone data
> 2. DRM also challenges with this problem, let me quote what sima said:
> "another trick that we iirc used for afbc is that sometimes the planes=20
> have a fixed layout
> like nv12
> and so logically it's multiple planes, but you only need one plane slot=20
> to describe the buffer
> since I think afbc had the "we need more than 4 planes" issue too"
>=20
> Unfortunately, there are vendor pixel formats are not fixed layout.
>=20
> 3. Secure(REE, trusted video piepline) info.
>=20
> For how to assign such metadata data.
> In case with a drm fb_id, it is simple, we just add a drm plane property=
=20
> for it. The V4L2 interface is not flexible, we could only leave into=20
> CAPTURE request_fd as a control.
> >>
> >> Also, there is no reason to consume a device's memory for the content
> >> that device can't read it, or wasting an entry of IOMMU for such data.=
 =20
> >=20
> > That's right, but DMA-buf doesn't really imply any of those. DMA-buf
> > is just a kernel object with some backing memory. It's up to the
> > allocator to decide how the backing memory is allocated and up to the
> > importer on whether it would be mapped into an IOMMU.
> >  =20
> I just want to say it can't be allocated at the same place which was for=
=20
> those DMA bufs(graphics or compressed bitstream).
> This also could be answer for your first question, if we place this kind=
=20
> of buffer in a plane for DMABUF(importing) in V4L2, V4L2 core would try=20
> to prepare it, which could map it into IOMMU.
>=20
> >> Usually, such a metadata would be the value should be written to a
> >> hardware's registers, a 4KiB page would be 1024 items of 32 bits regis=
ters.
> >>
> >> Still, I have some problems with SHMEM:
> >> 1. I don't want the userspace modify the context of the SHMEM allocated
> >> by the kernel, is there a way to do so? =20
> >=20
> > This is generally impossible without doing any of the two:
> > 1) copying the contents to an internal buffer not accessible to the
> > userspace, OR
> > 2) modifying any of the buffer mappings to read-only
> >=20
> > 2) can actually be more costly than 1) (depending on the architecture,
> > data size, etc.), so we shouldn't just discard the option of a simple
> > copy_from_user() in the ioctl.
> >  =20
> I don't want the userspace access it at all. So that won't be a problem.

Hi,

if userspace cannot access things like an image's HDR metadata, then it
will be impossible for userspace to program KMS to have the correct
color pipeline, or to send intended HDR metadata to a video sink.

You cannot leave userspace out of HDR metadata handling, because quite
probably the V4L2 buffer is not the only thing on screen. That means
there must composition of multiple sources with different image
properties and metadata, which means it is no longer obvious what HDR
metadata should be sent to the video sink.

Even if it is a TV-like application rather than a windowed desktop, you
will still have other contents to composite: OSD (volume indicators,
channels indicators, program guide, ...), sub-titles, channel logos,
notifications... These components ideally should not change their
appearance arbitrarily with the main program content and metadata
changes. Either the metadata sent to the video sink is kept static and
the main program adapted on the fly, or main program metadata is sent
to the video sink and the additional content is adapted on the fly.

There is only one set of HDR metadata and one composited image that can
be sent to a video sink, so both must be chosen and produced correctly
at the source side. This cannot be done automatically inside KMS kernel
drivers.


Thanks,
pq

> >> 2. Should I create a helper function for installing the SHMEM file as =
a fd? =20
> >=20
> > We already have the udmabuf device [1] to turn a memfd into a DMA-buf,
> > so maybe that would be enough?
> >=20
> > [1] https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/dma-buf/ud=
mabuf.c
> >  =20
> It is the kernel driver that allocate this buffer. For example, v4l2=20
> CAPTURE allocate a buffer for metadata when VIDIOC_REQBUFS.
> Or GBM give you a fd which is assigned with a surface.
>=20
> So we need a kernel interface.
> > Best,
> > Tomasz
> >  =20
> >>
> >> --
> >> Hsia-Jun(Randy) Li =20
>=20


--Sig_/Tr7WWQIDlF4Ol+gu09=9THA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmToWwQACgkQI1/ltBGq
qqc8UBAAl+tmLwSPKlEfjdRbRUc1xsnTYdX1aKbm6AxjS12FOwdKrlzHMUm8Veb0
x+zToYJK8vyUwG5G8bp/+uh4+xRhhNBKuuKY7Mt/UxymLi3YL/z/0miIc7/G8ksP
OfVVW+CaziWX7XigN9c3jzDL2LeN225a/vtYEITqL2ftNsLgfLKMGsZ1XG6GGDn4
J+tlAp5oAXibGcgBysDbhvQv5OunayHI79lmR5C+nKk+YeGeePT4zorNSP1T8CBM
wzjTFiXNwWD5Y7f+dKZHtl3a2xzTJBHDmMWOTpdZzPvvUUQuyvpP0xz90iqOUgj8
pVZ+6tA1QfQdm61gPz+DbgeJblDLyqYA93z8ugPIWFn4o5rUFOJI/ODCfre0z3G/
wgUzprnlWRo2hKCAvkLDO7NSHzjaJTlmE/PglPGcEFYW/1HiUkw92bQ7ZGrfInJt
PFSwe0+d/3jxaORegmUbnpqdRhiF30Ab8GlFuklnY0y7B+A4SkbVU3WTV9L8ZiGQ
mUgLH1tbtRfQZBboNa1A4Kf7HDokZO8YlhP8md3YIyYFmyDzRXibBHo9ZCjcghuN
HH+TE7Hd8NYIHxw4KRy8KbeZ88LhfwKEpBLFgcvrzsHCBJO+SuBjZcV4GWAcVciw
P9D9DDlMy13bPFcsMy8ZJ4v6gMA3sJZHnIInOIqwN1fQnFaYM7A=
=YMvY
-----END PGP SIGNATURE-----

--Sig_/Tr7WWQIDlF4Ol+gu09=9THA--
