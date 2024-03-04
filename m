Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18F870295
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 14:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E95112153;
	Mon,  4 Mar 2024 13:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c4kcCDoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFBB112153
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 13:24:46 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56682b85220so7197902a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 05:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709558684; x=1710163484; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZDGolps/rBe+Ix3AUVTQ7Pu/h2VP38OieQuvyzp7lYE=;
 b=c4kcCDoEQJPVhpZVyiVjsn4RceSH5NXRuFbImCqnd9oDU4DX9mHqTu4eqIFPHEviO7
 XsNQLkvrLoZ3ouRw+7BFKjE+EL6NMunXj9bNTwhJAyk462J6UErCmiwetwVy2YCGzXzQ
 70xofawyPUTuctfKcT08WngeexG7rm4VQDlJ/xbJZZdzwgUyvhq2EEjJRdhuNFuAA6LJ
 vBCDzxVZKL0ISThA92+ARCNHcz9aUGUvwIqSuECaDVQyXL5vQzU9SBToyJKgtdXn1THI
 oZo02ZU5acHSrGjKWgWMtcPYHn6GIUEUgKcH1/JhtKa/B19Dih43o+CkHtl/Pv+10SU/
 cxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709558684; x=1710163484;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZDGolps/rBe+Ix3AUVTQ7Pu/h2VP38OieQuvyzp7lYE=;
 b=CqZrOUAgDsH6iuz3eXVnce7K4c69aE3W7Nbtfk9GvF6x4wCb4+SouqT9QWCnZboI0W
 KWFslVsM+Lfj//mjlJ0oihUe3oL6/FJYtH7AzJ+mA4z5p03h821RmY2m81874p+fxP47
 tWaqRmsuDuffUdqXTh9E6/LgVN1CjKuoPB8LDoUgkiILlKmpkHzgb07v74uq3h8L7e8G
 v1G+Yaqzz+3rLKT5sYcSXQfAMZHxXOv90KbeuyhMKdYLQIXX1h6NE36oDgO9G8gyutCs
 xU0l4GCn6FqYHV78cAH57PMrMXE1X7Vm8dZAQ1rcsll3p4oKFbo9rCVO+4yj1fyP3cmf
 6cIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW50Kqe7UsRYaTYC611VSnQ6aEHgi84Lw0XORNrkmGxn47Pwlt3h1eIuouHZDk6HiuB+bhwzeFE6K6m3XGvsqyjcAfRrmhJuzTgD0Krpsed
X-Gm-Message-State: AOJu0YyyAqrsFboV9w9NwsYrhAgi34Di4Twfwl6+fu/AS0P/WwdlXRg8
 PqhQA/Dz+MH7CulQahDawOufOVGrRsEyZuWga4saNvAb7PiRwXA2
X-Google-Smtp-Source: AGHT+IGTFzZaAOkx49PczP3s79h93y2M46UqRDVgG21ZtKP9eanzSUVE1H/HeBSVThdLJlEEEq872A==
X-Received: by 2002:aa7:d597:0:b0:565:6df0:8712 with SMTP id
 r23-20020aa7d597000000b005656df08712mr6708179edq.22.1709558684113; 
 Mon, 04 Mar 2024 05:24:44 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47?
 (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de.
 [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
 by smtp.gmail.com with ESMTPSA id
 m13-20020aa7d34d000000b0056486eaa669sm4630020edr.50.2024.03.04.05.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 05:24:43 -0800 (PST)
Message-ID: <f40f018359d25c78abbeeb3ce02c5b761aabe900.camel@gmail.com>
Subject: Re: [PATCH v7 3/6] iio: core: Add new DMABUF interface infrastructure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Nuno Sa
 <nuno.sa@analog.com>, Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Paul Cercueil
 <paul@crapouillou.net>
Cc: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Mon, 04 Mar 2024 14:28:08 +0100
In-Reply-To: <85782edb-4876-4cbd-ac14-abcbcfb58770@amd.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240223-iio-dmabuf-v7-3-78cfaad117b9@analog.com>
 <85782edb-4876-4cbd-ac14-abcbcfb58770@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
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

On Mon, 2024-03-04 at 13:44 +0100, Christian K=C3=B6nig wrote:
> Am 23.02.24 um 13:14 schrieb Nuno Sa:
> > From: Paul Cercueil <paul@crapouillou.net>
> >=20
> > Add the necessary infrastructure to the IIO core to support a new
> > optional DMABUF based interface.
> >=20
> > With this new interface, DMABUF objects (externally created) can be
> > attached to a IIO buffer, and subsequently used for data transfer.
> >=20
> > A userspace application can then use this interface to share DMABUF
> > objects between several interfaces, allowing it to transfer data in a
> > zero-copy fashion, for instance between IIO and the USB stack.
> >=20
> > The userspace application can also memory-map the DMABUF objects, and
> > access the sample data directly. The advantage of doing this vs. the
> > read() interface is that it avoids an extra copy of the data between th=
e
> > kernel and userspace. This is particularly userful for high-speed
> > devices which produce several megabytes or even gigabytes of data per
> > second.
> >=20
> > As part of the interface, 3 new IOCTLs have been added:
> >=20
> > IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
> > =C2=A0 Attach the DMABUF object identified by the given file descriptor=
 to the
> > =C2=A0 buffer.
> >=20
> > IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
> > =C2=A0 Detach the DMABUF object identified by the given file descriptor=
 from
> > =C2=A0 the buffer. Note that closing the IIO buffer's file descriptor w=
ill
> > =C2=A0 automatically detach all previously attached DMABUF objects.
> >=20
> > IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
> > =C2=A0 Request a data transfer to/from the given DMABUF object. Its fil=
e
> > =C2=A0 descriptor, as well as the transfer size and flags are provided =
in the
> > =C2=A0 "iio_dmabuf" structure.
> >=20
> > These three IOCTLs have to be performed on the IIO buffer's file
> > descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
>=20
> A few nit picks and one bug below, apart from that looks good to me.

Hi Christian,

Thanks for looking at it. I'll just add some comment on the bug below and f=
or
the other stuff I hope Paul is already able to step in and reply to it. My
assumption (which seems to be wrong) is that the dmabuf bits should be alre=
ady
good to go as they should be pretty similar to the USB part of it.

...

>=20
> > +	if (dma_to_ram) {
> > +		/*
> > +		 * If we're writing to the DMABUF, make sure we don't have
> > +		 * readers
> > +		 */
> > +		retl =3D dma_resv_wait_timeout(dmabuf->resv,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_READ, true,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 timeout);
> > +		if (retl =3D=3D 0)
> > +			retl =3D -EBUSY;
> > +		if (retl < 0) {
> > +			ret =3D (int)retl;
> > +			goto err_resv_unlock;
> > +		}
> > +	}
> > +
> > +	if (buffer->access->lock_queue)
> > +		buffer->access->lock_queue(buffer);
> > +
> > +	ret =3D dma_resv_reserve_fences(dmabuf->resv, 1);
> > +	if (ret)
> > +		goto err_queue_unlock;
> > +
> > +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> > +			=C2=A0=C2=A0 dma_resv_usage_rw(dma_to_ram));
>=20
> That is incorrect use of the function dma_resv_usage_rw(). That function=
=20
> is for retrieving fences and not adding them.
>=20
> See the function implementation and comments, when you use it like this=
=20
> you get exactly what you don't want.
>=20

Does that mean that the USB stuff [1] is also wrong?

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/dr=
ivers/usb/gadget/function/f_fs.c?h=3Dusb-next#n1669

- Nuno S=C3=A1


