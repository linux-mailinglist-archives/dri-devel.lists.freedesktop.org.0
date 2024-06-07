Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803478FFD66
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 09:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F2710E2BB;
	Fri,  7 Jun 2024 07:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="YPjDmDk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3E010E2BB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1717746243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jg6y42A8tuanMkc0qiGHDqRmsY6EuDBjOBYeQQggbQA=;
 b=YPjDmDk95H45K8usjyG/alYRZzUUfvo8CrQ3hxP2rTwW8bqre46UhwODogNPMxsNdhTeeb
 2eaxZPZ88z2mrLo/Ci3nZpjdYdSY0zYo7yoAO7sBKrHxyAPw3Uww5HwknAvmX1BUiO9k91
 s31N2OSNgeKKWr3CDXH0AOUmwI/B0bo=
Message-ID: <14d802e84cbb8d3c9610386908706f264af34726.camel@crapouillou.net>
Subject: Re: [PATCH v10 6/6] Documentation: iio: Document high-speed DMABUF
 based API
From: Paul Cercueil <paul@crapouillou.net>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
 <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>, 
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Fri, 07 Jun 2024 09:44:01 +0200
In-Reply-To: <5052adab-5b5e-4ac2-902c-bb373c00bbbb@infradead.org>
References: <20240605110845.86740-1-paul@crapouillou.net>
 <20240605110845.86740-7-paul@crapouillou.net>
 <5052adab-5b5e-4ac2-902c-bb373c00bbbb@infradead.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFC
 qaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IWYXnd
 JO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN70
 62DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOt
 X0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEA
 AYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/
 Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmc
 Gu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2z
 McLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/
 7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2c
 LUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Randy,

Le jeudi 06 juin 2024 =C3=A0 10:32 -0700, Randy Dunlap a =C3=A9crit=C2=A0:
> Hi,
>=20
> On 6/5/24 4:08 AM, Paul Cercueil wrote:
> > Document the new DMABUF based API.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> >=20
> > ---
> > v2: - Explicitly state that the new interface is optional and is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not implemented by all drivers.
> > =C2=A0=C2=A0=C2=A0 - The IOCTLs can now only be called on the buffer FD=
 returned
> > by
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IIO_BUFFER_GET_FD_IOCTL.
> > =C2=A0=C2=A0=C2=A0 - Move the page up a bit in the index since it is co=
re stuff
> > and not
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver-specific.
> >=20
> > v3: Update the documentation to reflect the new API.
> >=20
> > v5: Use description lists for the documentation of the three new
> > IOCTLs
> > =C2=A0=C2=A0=C2=A0 instead of abusing subsections.
> >=20
> > v8: Renamed dmabuf_api.rst -> iio_dmabuf_api.rst, and updated
> > index.rst
> > =C2=A0=C2=A0=C2=A0 whose format changed in iio/togreg.
> > ---
> > =C2=A0Documentation/iio/iio_dmabuf_api.rst | 54
> > ++++++++++++++++++++++++++++
> > =C2=A0Documentation/iio/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 55 insertions(+)
> > =C2=A0create mode 100644 Documentation/iio/iio_dmabuf_api.rst
> >=20
> > diff --git a/Documentation/iio/iio_dmabuf_api.rst
> > b/Documentation/iio/iio_dmabuf_api.rst
> > new file mode 100644
> > index 000000000000..1cd6cd51a582
> > --- /dev/null
> > +++ b/Documentation/iio/iio_dmabuf_api.rst
> > @@ -0,0 +1,54 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +High-speed DMABUF interface for IIO
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. Overview
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The Industrial I/O subsystem supports access to buffers through a
> > +file-based interface, with read() and write() access calls through
> > the
> > +IIO device's dev node.
> > +
> > +It additionally supports a DMABUF based interface, where the
> > userspace
> > +can attach DMABUF objects (externally created) to a IIO buffer,
> > and
>=20
> I would say/write:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to an IIO buffer,

Right.

> > +subsequently use them for data transfers.
> > +
> > +A userspace application can then use this interface to share
> > DMABUF
> > +objects between several interfaces, allowing it to transfer data
> > in a
> > +zero-copy fashion, for instance between IIO and the USB stack.
> > +
> > +The userspace application can also memory-map the DMABUF objects,
> > and
> > +access the sample data directly. The advantage of doing this vs.
> > the
> > +read() interface is that it avoids an extra copy of the data
> > between the
> > +kernel and userspace. This is particularly useful for high-speed
> > devices
> > +which produce several megabytes or even gigabytes of data per
> > second.
> > +It does however increase the userspace-kernelspace synchronization
> > +overhead, as the DMA_BUF_SYNC_START and DMA_BUF_SYNC_END IOCTLs
> > have to
> > +be used for data integrity.
> > +
> > +2. User API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +As part of this interface, three new IOCTLs have been added. These
> > three
> > +IOCTLs have to be performed on the IIO buffer's file descriptor,
> > +obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> > +
> > +=C2=A0 ``IIO_BUFFER_DMABUF_ATTACH_IOCTL(int)``
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (int =
fd)
> ?

Yes, I can change that. Although it's very obvious what the "int" is
for, given the text above.

>=20
> > +=C2=A0=C2=A0=C2=A0 Attach the DMABUF object, identified by its file de=
scriptor,
> > to the
> > +=C2=A0=C2=A0=C2=A0 IIO buffer. Returns zero on success, and a negative=
 errno
> > value on
> > +=C2=A0=C2=A0=C2=A0 error.
> > +
> > +=C2=A0 ``IIO_BUFFER_DMABUF_DETACH_IOCTL(int)``
>=20
> ditto.
>=20
> > +=C2=A0=C2=A0=C2=A0 Detach the given DMABUF object, identified by its f=
ile
> > descriptor,
> > +=C2=A0=C2=A0=C2=A0 from the IIO buffer. Returns zero on success, and a=
 negative
> > errno
> > +=C2=A0=C2=A0=C2=A0 value on error.
> > +
> > +=C2=A0=C2=A0=C2=A0 Note that closing the IIO buffer's file descriptor =
will
> > +=C2=A0=C2=A0=C2=A0 automatically detach all previously attached DMABUF=
 objects.
> > +
> > +=C2=A0 ``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf
> > *iio_dmabuf)``
> > +=C2=A0=C2=A0=C2=A0 Enqueue a previously attached DMABUF object to the =
buffer
> > queue.
> > +=C2=A0=C2=A0=C2=A0 Enqueued DMABUFs will be read from (if output buffe=
r) or
> > written to
> > +=C2=A0=C2=A0=C2=A0 (if input buffer) as long as the buffer is enabled.
>=20
> thanks.

Cheers,
-Paul
