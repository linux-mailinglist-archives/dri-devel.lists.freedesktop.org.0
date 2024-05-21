Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2B8CAA34
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 10:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC10010E03F;
	Tue, 21 May 2024 08:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G5/6+Hku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4058F10E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716281019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x8k5q7R1XQcUXB4Szn34j6F6QdxRYsMfl6BtJBFY45A=;
 b=G5/6+HkuZkMA0LREFOl44E1vQqCKwZxc/0dNOctFfTYQltmdA/2OXeRuftz1YeGUwat8XD
 u9QnRj71Uy4Abbh3MuDgR+Ex7AXsbHDqmDlEGbmPNQWPi11pcY2kWSDckS4Z6vBW2a9cuY
 8Ql4QL3H4sO8jrdfmp9ONknyGjblgMk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-ffz6BE1YMIGG543ddQz62A-1; Tue, 21 May 2024 04:43:37 -0400
X-MC-Unique: ffz6BE1YMIGG543ddQz62A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-351bd229b88so6529613f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 01:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716281016; x=1716885816;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8k5q7R1XQcUXB4Szn34j6F6QdxRYsMfl6BtJBFY45A=;
 b=wP14qzOO4Odzmg0nYzRRE1cGKaJscp2bO8DTOOchAZx5OFAyRM2wwUQgHnvDDgbNBS
 0uGJY+/T0KHCwDges37x+qYAjRtKWA9+EDuveTHBeER/MVhm2IskoKuzp8HfcLAi3v6z
 F3alt+Z50sqJH0Hd6JyYanloqPW9o2hy005LOg52F9FVRfxW8pmp4PUQvQFeBORjBhau
 vBG5j/eBzVml8ND8F6wzLH+K2ZTUZBaie9PO9/2hhzgiD3MQWpsDPTMH/dRiZCxDIjEG
 XNIFmoM6JlGi9+sI9029OPzOj6l6iDihgcipFGy2aDsUozxzslyizZyZlD2K3Zk/0NbU
 wYtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSZsSLNNNQ1GMyetLHXeYvZnuC5SLWyh3FvqDTc8Tfsh4udNa4EGAumV1H6iAxazt2tvTYu+Rpe0lnVo0ekO7JwiKj/YoWTz9NoJgxemzm
X-Gm-Message-State: AOJu0Yww9vzTq+GUy+HZKON0oFeDEg7rygBTQUqjfUJ8VKCDaAQtv40M
 VO/2q6MuKt4HKsuwb0UddRapGRYPVCHZLApMJUQKwOX6omjKZS/+wvuHX3o9eGZuoeS2PozORsc
 WfVLf7GxE+GFpsypIq1gMzSs7EPRUz6UyxelJ1a6zvTA4VkrR05XuK3+q0KG1A1nKSw==
X-Received: by 2002:a5d:4537:0:b0:351:cb0a:5da9 with SMTP id
 ffacd0b85a97d-351cb0a5e27mr13610771f8f.54.1716281015800; 
 Tue, 21 May 2024 01:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGViPbX2DDsBlX4k8bygNk8RERf9FOVVEI+UM+O9otWpAASEUQBvdHR9iUQt2Q/LtMHcgtmzA==
X-Received: by 2002:a5d:4537:0:b0:351:cb0a:5da9 with SMTP id
 ffacd0b85a97d-351cb0a5e27mr13610740f8f.54.1716281015294; 
 Tue, 21 May 2024 01:43:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bd4fsm31573798f8f.7.2024.05.21.01.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 01:43:34 -0700 (PDT)
Date: Tue, 21 May 2024 10:43:34 +0200
From: Maxime Ripard <mripard@redhat.com>
To: nicolas.dufresne@collabora.corp-partner.google.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>, 
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240521-thick-messy-lemur-c8cebe@houat>
References: <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
 <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
 <20240516112720.GA12714@pendragon.ideasonboard.com>
 <08b882dd036367c4d78a5b33f5d11cdb347823bb.camel@collabora.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3ur3lppetxpfcjb6"
Content-Disposition: inline
In-Reply-To: <08b882dd036367c4d78a5b33f5d11cdb347823bb.camel@collabora.corp-partner.google.com>
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


--3ur3lppetxpfcjb6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 01:11:51PM GMT, nicolas.dufresne@collabora.corp-par=
tner.google.com wrote:
> Le jeudi 16 mai 2024 =E0 14:27 +0300, Laurent Pinchart a =E9crit=A0:
> > Hi Nicolas,
> >=20
> > On Wed, May 15, 2024 at 01:43:58PM -0400, nicolas.dufresne@collabora.co=
rp-partner.google.com wrote:
> > > Le mardi 14 mai 2024 =E0 23:42 +0300, Laurent Pinchart a =E9crit=A0:
> > > > > You'll hit the same limitation as we hit in GStreamer, which is t=
hat KMS driver
> > > > > only offer allocation for render buffers and most of them are mis=
sing allocators
> > > > > for YUV buffers, even though they can import in these formats. (k=
ms allocators,
> > > > > except dumb, which has other issues, are format aware).
> > > >=20
> > > > My experience on Arm platforms is that the KMS drivers offer alloca=
tion
> > > > for scanout buffers, not render buffers, and mostly using the dumb
> > > > allocator API. If the KMS device can scan out YUV natively, YUV buf=
fer
> > > > allocation should be supported. Am I missing something here ?
> > >=20
> > > There is two APIs, Dumb is the legacy allocation API, only used by di=
splay
> >=20
> > Is it legacy only ? I understand the dumb buffers API to be officially
> > supported, to allocate scanout buffers suitable for software rendering.
> >=20
> > > drivers indeed, and the API does not include a pixel format or a modi=
fier. The
> > > allocation of YUV buffer has been made through a small hack,=20
> > >=20
> > >   bpp =3D number of bits per component (of luma plane if multiple pla=
nes)
> > >   width =3D width
> > >   height =3D height * X
> > >=20
> > > Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422 a=
nd "3" for
> > > 444. It is far from idea, requires deep knowledge of each formats in =
the
> > > application
> >=20
> > I'm not sure I see that as an issue, but our experiences and uses cases
> > may vary :-)
>=20
> Its extra burden, and does not scale to all available pixel formats. My r=
eply
> was for readers education as I feel like a lot of linux-media dev don't h=
ave a
> clue of what is going on at the rendering side. This ensure a minimum kno=
wledge
> to everyone commenting.
>=20
> And yes, within the GFX community, Dumb allocation is to be killed and
> replacement completely in the future, it simply does not have a complete
> replacement yet.
>=20
> >=20
> > > and cannot allocate each planes seperatly.
> >=20
> > For semi-planar or planar formats, unless I'm mistaken, you can either
> > allocate a single buffer and use it with appropriate offsets when
> > constructing your framebuffer (with DRM_IOCTL_MODE_ADDFB2), or allocate
> > one buffer per plane.
>=20
> We have use cases were single allocation is undesirable, but I don't real=
ly feel
> like this is important enough for me to type this explanation. Ping me if=
 you
> care.
> >=20
> > > The second is to use the driver specific allocation API. This is then=
 abstracted
> > > by GBM. This allows allocating render buffers with notably modifiers =
and/or use
> > > cases. But no support for YUV formats or multi-planar formats.
> >=20
> > GBM is the way to go for render buffers indeed. It has been designed
> > with only graphics buffer management use cases in mind, so it's
> > unfortunately not an option as a generic allocator, at least in its
> > current form.
> >=20
>=20
> What I perhaps should have highlighted that is that all these allocators =
in the
> GFX (called DRM, but meh) subsystem abstract away some deep knowledge of =
the HW
> requirements. Heaps are lower level APIs that assume that userspace have =
this
> knowledge. The Android and ChromeOS solution is to take the implementatio=
n from
> the kernel and move it into userspace, see minigbm from chromeos, or gral=
loc
> from Android. As these two projects are device centric, they are not usab=
le on
> generic Linux. Heaps might have some future, but not without other piece =
of the
> puzzle.
>=20
> To come back to you wanting heaps in libcamera, because it makes them bet=
ter for
> rendered or display. Well today this is a lie you make to yourself, becau=
se this
> is just a tiny bit of the puzzle, it is pure luck if you allocate dmabuf =
is
> usable but a foreign device. At the end of the day, this is just a fallba=
ck to
> satisfy that application are not forced to allocate that memory in libcam=
era.

I mean, it's pure luck, but can you point to any platform supported
upstream where it wouldn't work?

> Thus, I strongly recommend the udmabuf in the short term. Finally, moving=
 to
> heaps when the reported issue is resolved, as then it gives more options =
and
> reduce the number of layers.

udmabuf wouldn't work with any platform without an IOMMU. We have plenty
of those.

All things considered, while I agree that it isn't the ideal solution,
we really don't have a better (ie, works on a larger set of platforms)
solution at the moment or in the next 5 years.

Maxime

--3ur3lppetxpfcjb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkxetgAKCRAnX84Zoj2+
dowVAYD+pixkM6lIhnLksc0THKJNXz5j3y7vVB903apxbhINtgV4AYh1nkv/zhcQ
iVGGJq8BgKzX+k9pfyDC1fMIarAnVyKH2XjGA5SJ8N18wPOrO6zuNN89CbWbOv7e
QtoE2jvRCg==
=vQjI
-----END PGP SIGNATURE-----

--3ur3lppetxpfcjb6--

