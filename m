Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DCC8C7AE4
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 19:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6887310E1F6;
	Thu, 16 May 2024 17:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora-corp-partner-google-com.20230601.gappssmtp.com header.i=@collabora-corp-partner-google-com.20230601.gappssmtp.com header.b="2auwT0BZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AFF10E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 17:12:15 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7e1cdde66c1so64567439f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collabora-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715879534; x=1716484334; darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u0/17t6X++w0QQtZwByQd3jr8SxZORqEY89sVsKz7mM=;
 b=2auwT0BZ8tyjKLjXsgQ1+jhfoXXDs99iubeKP+OfbeJ9gZGaUNWRtaMNYenaiOEWKQ
 Xn1XcsujnfVFGRZEmd7UURxjrsFBT86cMXGVO/XOqksm1+DLtg3w3Qz0DtItyg1u7+Un
 hQ3G5htoFyCw6hqZ21zkl9+esuGVocJgh7wWmd3GSQ4sa24+wJXQp81+mBYmDofPVrhF
 OSggoCy6Px8vWUa9YtxwHIXhHTevX9gGHKRoD6LXtOnaSxcTzzc3ScNZi0yEcwdoLRbk
 4gik9oerKDO0CrAiMwK0biDqNSQKAs3MzYpWUEM6bNqqZ0a4k496Y25QWvgX7LpcYtnc
 OdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715879534; x=1716484334;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u0/17t6X++w0QQtZwByQd3jr8SxZORqEY89sVsKz7mM=;
 b=R3CafAXs2xGVVUeguQC4ksWL1p9tKUJ3YmZIYxQ1UEaVr+Qm06Rmmho3NNNmrM/o7I
 OZYjKQ8VB6swhH7MouqbGyEET37Y6OO4qEWAs/67VaRdv1FOueLyj3cOJixXTPVUwo9a
 mkhWL7BM9JCLjR0naskFx2Y/y0egB9A3gBObZ9QYFhBLa2WBigXBEvgsGQ1bzcar7GZ9
 8g9AdvEU26AO19GVp7u2DFScj5/oxxebqv3Is4gFfzJcNblaKkVToK3dD/mNsob8UdDu
 LY4k+fsfd9wNAXUhAdKnbk3rr9lC9j/Uiqo8pkeL3hE9lIYCv1/UiKs4y3zm3rwG8jaw
 RVYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLoXIDf2dr5Vyu3JkNdC1J2k5nuRnPtylq/PoRGH96MSZIevEwAYrUd0wE47f/tM7L1c4fBvBx2m1bLyV6qDruHMJkDozsZwsTy2B05XUT
X-Gm-Message-State: AOJu0Yx2Bv4AwZAnGP4qzS7qyC8z8bLwb4eoD2hJsqLsCRlEFBBS0aKT
 G/k8u2GIJv0nl0ctknLgMbSXvCKJVoxMcfUcw1BeqSlHdlzE4xprdMNn84hlitjkOF5joJtru1n
 4dn4=
X-Google-Smtp-Source: AGHT+IFGjNt7vUmAZ1Mmz/lw0I88EJ6f5Y9sGe9Wk+60l3/QM4OyhE9pBL3S1dbNkZo8w+6coX8nXA==
X-Received: by 2002:a05:622a:5c8b:b0:43a:4b3c:3a2e with SMTP id
 d75a77b69052e-43dfdb63e98mr232125181cf.37.1715879513869; 
 Thu, 16 May 2024 10:11:53 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::580])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e1fdefc89sm49532381cf.61.2024.05.16.10.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 10:11:53 -0700 (PDT)
Message-ID: <08b882dd036367c4d78a5b33f5d11cdb347823bb.camel@collabora.corp-partner.google.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: nicolas.dufresne@collabora.corp-partner.google.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@redhat.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Date: Thu, 16 May 2024 13:11:51 -0400
In-Reply-To: <20240516112720.GA12714@pendragon.ideasonboard.com>
References: <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
 <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
 <20240516112720.GA12714@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
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

Le jeudi 16 mai 2024 =C3=A0 14:27 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On Wed, May 15, 2024 at 01:43:58PM -0400, nicolas.dufresne@collabora.corp=
-partner.google.com wrote:
> > Le mardi 14 mai 2024 =C3=A0 23:42 +0300, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> > > > You'll hit the same limitation as we hit in GStreamer, which is tha=
t KMS driver
> > > > only offer allocation for render buffers and most of them are missi=
ng allocators
> > > > for YUV buffers, even though they can import in these formats. (kms=
 allocators,
> > > > except dumb, which has other issues, are format aware).
> > >=20
> > > My experience on Arm platforms is that the KMS drivers offer allocati=
on
> > > for scanout buffers, not render buffers, and mostly using the dumb
> > > allocator API. If the KMS device can scan out YUV natively, YUV buffe=
r
> > > allocation should be supported. Am I missing something here ?
> >=20
> > There is two APIs, Dumb is the legacy allocation API, only used by disp=
lay
>=20
> Is it legacy only ? I understand the dumb buffers API to be officially
> supported, to allocate scanout buffers suitable for software rendering.
>=20
> > drivers indeed, and the API does not include a pixel format or a modifi=
er. The
> > allocation of YUV buffer has been made through a small hack,=20
> >=20
> >   bpp =3D number of bits per component (of luma plane if multiple plane=
s)
> >   width =3D width
> >   height =3D height * X
> >=20
> > Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422 and=
 "3" for
> > 444. It is far from idea, requires deep knowledge of each formats in th=
e
> > application
>=20
> I'm not sure I see that as an issue, but our experiences and uses cases
> may vary :-)

Its extra burden, and does not scale to all available pixel formats. My rep=
ly
was for readers education as I feel like a lot of linux-media dev don't hav=
e a
clue of what is going on at the rendering side. This ensure a minimum knowl=
edge
to everyone commenting.

And yes, within the GFX community, Dumb allocation is to be killed and
replacement completely in the future, it simply does not have a complete
replacement yet.

>=20
> > and cannot allocate each planes seperatly.
>=20
> For semi-planar or planar formats, unless I'm mistaken, you can either
> allocate a single buffer and use it with appropriate offsets when
> constructing your framebuffer (with DRM_IOCTL_MODE_ADDFB2), or allocate
> one buffer per plane.

We have use cases were single allocation is undesirable, but I don't really=
 feel
like this is important enough for me to type this explanation. Ping me if y=
ou
care.
>=20
> > The second is to use the driver specific allocation API. This is then a=
bstracted
> > by GBM. This allows allocating render buffers with notably modifiers an=
d/or use
> > cases. But no support for YUV formats or multi-planar formats.
>=20
> GBM is the way to go for render buffers indeed. It has been designed
> with only graphics buffer management use cases in mind, so it's
> unfortunately not an option as a generic allocator, at least in its
> current form.
>=20

What I perhaps should have highlighted that is that all these allocators in=
 the
GFX (called DRM, but meh) subsystem abstract away some deep knowledge of th=
e HW
requirements. Heaps are lower level APIs that assume that userspace have th=
is
knowledge. The Android and ChromeOS solution is to take the implementation =
from
the kernel and move it into userspace, see minigbm from chromeos, or grallo=
c
from Android. As these two projects are device centric, they are not usable=
 on
generic Linux. Heaps might have some future, but not without other piece of=
 the
puzzle.

To come back to you wanting heaps in libcamera, because it makes them bette=
r for
rendered or display. Well today this is a lie you make to yourself, because=
 this
is just a tiny bit of the puzzle, it is pure luck if you allocate dmabuf is
usable but a foreign device. At the end of the day, this is just a fallback=
 to
satisfy that application are not forced to allocate that memory in libcamer=
a.

Thus, I strongly recommend the udmabuf in the short term. Finally, moving t=
o
heaps when the reported issue is resolved, as then it gives more options an=
d
reduce the number of layers.

Nicolas
