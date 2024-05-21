Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC738CB035
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C231610EC87;
	Tue, 21 May 2024 14:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora-corp-partner-google-com.20230601.gappssmtp.com header.i=@collabora-corp-partner-google-com.20230601.gappssmtp.com header.b="uDyYaWG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD00410EC08
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 14:18:56 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-43de92e234dso38761481cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collabora-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1716301136; x=1716905936; darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/grV1OF2tkqSVpiWd99UzFJtL1VFoxAYH5Zqv+kbk/8=;
 b=uDyYaWG3uAZhMDQc6OyiIeKd+TAViwON/HwhwrZJHovjSYxPDkFgSHd97qEdMxLyJ6
 vbLwbjhlBgbLR8+/RBiX6bHQNxXCnU/qPmeL4MlTWBobCstfCBH9WdwCAHDAEJWSeTQh
 4L2KRQgu9w2/oDhza2eOtpekp1Qj9B4F3DJV9N/HifOdyUutGEd3XiFGN2aqTWodZgIg
 ll94mH30hRnTUfHWBR1vGqTD02EIBOkTnq/yElgznoLG/OKhf0PYwyxFtf1fmTKbh1eh
 PXYHVS32Pidw/PDLM7mt/ty9G7xL8rnk14wkjAE5EKeYMKZ0SurSBhsvAyHGPAH53P7w
 e5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716301136; x=1716905936;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/grV1OF2tkqSVpiWd99UzFJtL1VFoxAYH5Zqv+kbk/8=;
 b=cbqGF4HZ7dueW0A9dugaxdkh5Gu2uBfsZUxxmzrmKY2zqXP0vi1+lSvzjMPBgn5LTj
 bp0tUUXlg4Lhxml8FZ69ZyqwQDZFM7FL+mlgRyUFPaMT2vzVuYKsV/j+SElghuPxlmJm
 w/uXhjtej284ejTREuaxJOVWKhbcou2e2e9iyiZ+OW+fNYuZtcYaivKt4v8Opcsd5/TA
 AxvLneuSXN1JgVLg/agj29d/Ni2DjqM0Q56h+OmZJXPZjeCjDVmprY4auQSkYKGbpJhw
 zrrTs+JGOqCbKloIwjn4h0dmZlpvFCULTuZQ/1MsBPypclbcUJzhsPnjp1gfxDEm2/sn
 LKHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS2MuBg7qnRqBOuwthfGA0bpNfWth02KRgJgHsAZM8WGKm5DG3VoDmQ6Ul9lROpfS8ZQ8bo5DF4TnKe6xElbsEYF58oKLz8PU2ZMvNEBh/
X-Gm-Message-State: AOJu0Yw9HL4yu/kLu4CO3vQGLcn5LSSApr7Do6Pe6kNqrz2QrMVMPBAJ
 /5piU2fUkr9DiMIUddmbd2notFfu8D35w0aQ4oce+N5eFj/9cgThT7AcTUjUc3g=
X-Google-Smtp-Source: AGHT+IH7DUWuvkmlYTyeHpsmKHeWKkfIDi7ddT8p57U2WnoisqjWydmnWCAmBhK0r+UU5ijE8x5iJA==
X-Received: by 2002:ac8:58cf:0:b0:43e:1039:8ce8 with SMTP id
 d75a77b69052e-43f7a2a4ab7mr151321121cf.14.1716301135602; 
 Tue, 21 May 2024 07:18:55 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::580])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1798f4sm123402526d6.1.2024.05.21.07.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 07:18:54 -0700 (PDT)
Message-ID: <44f7f49922c9ed0a1543ec98535a20469b14ac4e.camel@collabora.corp-partner.google.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: nicolas.dufresne@collabora.corp-partner.google.com
To: Maxime Ripard <mripard@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bryan O'Donoghue
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
Date: Tue, 21 May 2024 10:18:53 -0400
In-Reply-To: <20240521-thick-messy-lemur-c8cebe@houat>
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
 <20240521-thick-messy-lemur-c8cebe@houat>
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

Le mardi 21 mai 2024 =C3=A0 10:43 +0200, Maxime Ripard a =C3=A9crit=C2=A0:
> On Thu, May 16, 2024 at 01:11:51PM GMT, nicolas.dufresne@collabora.corp-p=
artner.google.com wrote:
> > Le jeudi 16 mai 2024 =C3=A0 14:27 +0300, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> > > Hi Nicolas,
> > >=20
> > > On Wed, May 15, 2024 at 01:43:58PM -0400, nicolas.dufresne@collabora.=
corp-partner.google.com wrote:
> > > > Le mardi 14 mai 2024 =C3=A0 23:42 +0300, Laurent Pinchart a =C3=A9c=
rit=C2=A0:
> > > > > > You'll hit the same limitation as we hit in GStreamer, which is=
 that KMS driver
> > > > > > only offer allocation for render buffers and most of them are m=
issing allocators
> > > > > > for YUV buffers, even though they can import in these formats. =
(kms allocators,
> > > > > > except dumb, which has other issues, are format aware).
> > > > >=20
> > > > > My experience on Arm platforms is that the KMS drivers offer allo=
cation
> > > > > for scanout buffers, not render buffers, and mostly using the dum=
b
> > > > > allocator API. If the KMS device can scan out YUV natively, YUV b=
uffer
> > > > > allocation should be supported. Am I missing something here ?
> > > >=20
> > > > There is two APIs, Dumb is the legacy allocation API, only used by =
display
> > >=20
> > > Is it legacy only ? I understand the dumb buffers API to be officiall=
y
> > > supported, to allocate scanout buffers suitable for software renderin=
g.
> > >=20
> > > > drivers indeed, and the API does not include a pixel format or a mo=
difier. The
> > > > allocation of YUV buffer has been made through a small hack,=20
> > > >=20
> > > >   bpp =3D number of bits per component (of luma plane if multiple p=
lanes)
> > > >   width =3D width
> > > >   height =3D height * X
> > > >=20
> > > > Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422=
 and "3" for
> > > > 444. It is far from idea, requires deep knowledge of each formats i=
n the
> > > > application
> > >=20
> > > I'm not sure I see that as an issue, but our experiences and uses cas=
es
> > > may vary :-)
> >=20
> > Its extra burden, and does not scale to all available pixel formats. My=
 reply
> > was for readers education as I feel like a lot of linux-media dev don't=
 have a
> > clue of what is going on at the rendering side. This ensure a minimum k=
nowledge
> > to everyone commenting.
> >=20
> > And yes, within the GFX community, Dumb allocation is to be killed and
> > replacement completely in the future, it simply does not have a complet=
e
> > replacement yet.
> >=20
> > >=20
> > > > and cannot allocate each planes seperatly.
> > >=20
> > > For semi-planar or planar formats, unless I'm mistaken, you can eithe=
r
> > > allocate a single buffer and use it with appropriate offsets when
> > > constructing your framebuffer (with DRM_IOCTL_MODE_ADDFB2), or alloca=
te
> > > one buffer per plane.
> >=20
> > We have use cases were single allocation is undesirable, but I don't re=
ally feel
> > like this is important enough for me to type this explanation. Ping me =
if you
> > care.
> > >=20
> > > > The second is to use the driver specific allocation API. This is th=
en abstracted
> > > > by GBM. This allows allocating render buffers with notably modifier=
s and/or use
> > > > cases. But no support for YUV formats or multi-planar formats.
> > >=20
> > > GBM is the way to go for render buffers indeed. It has been designed
> > > with only graphics buffer management use cases in mind, so it's
> > > unfortunately not an option as a generic allocator, at least in its
> > > current form.
> > >=20
> >=20
> > What I perhaps should have highlighted that is that all these allocator=
s in the
> > GFX (called DRM, but meh) subsystem abstract away some deep knowledge o=
f the HW
> > requirements. Heaps are lower level APIs that assume that userspace hav=
e this
> > knowledge. The Android and ChromeOS solution is to take the implementat=
ion from
> > the kernel and move it into userspace, see minigbm from chromeos, or gr=
alloc
> > from Android. As these two projects are device centric, they are not us=
able on
> > generic Linux. Heaps might have some future, but not without other piec=
e of the
> > puzzle.
> >=20
> > To come back to you wanting heaps in libcamera, because it makes them b=
etter for
> > rendered or display. Well today this is a lie you make to yourself, bec=
ause this
> > is just a tiny bit of the puzzle, it is pure luck if you allocate dmabu=
f is
> > usable but a foreign device. At the end of the day, this is just a fall=
back to
> > satisfy that application are not forced to allocate that memory in libc=
amera.
>=20
> I mean, it's pure luck, but can you point to any platform supported
> upstream where it wouldn't work?

Most AMD GPUs needs 256 bytes aligned strides. So unless you have that hard=
coded
in libcamera its one case that often fail to import. There is no kernel API=
 to
know anyway, so hardcoding is becoming common with the popularity of the GP=
Us.
Mali have a 64 bytes alignment required, except  for some YUV formats on ve=
ry
recent Mesa. If you hardcode for AMD, it works for Mali too.

Intel display driver is an interesting one. Most of software dmabuf exporte=
r
will enable cpu cache (UVC driver included). That driver fails to reject th=
ese
dmabuf assuming the exporter will always flush the cache. UVC driver as exp=
orted
does not, its not so clear to me if dmaheap+softISP (assuming softISP do th=
e
dmabuf sync calls) will work or not. UVC to display artifacts were still vi=
sible
on 6.8 (last time I tested).

>=20
> > Thus, I strongly recommend the udmabuf in the short term. Finally, movi=
ng to
> > heaps when the reported issue is resolved, as then it gives more option=
s and
> > reduce the number of layers.
>=20
> udmabuf wouldn't work with any platform without an IOMMU. We have plenty
> of those.

Its up to userspace to decide to allocate scattered or not, but again,
generically there is no API to let the application (softISP) know. Many of =
our
real-life tests concluded that using malloc data in software video processi=
ng to
finally do a memcpy() into final "device" memory is faster then using "cohe=
rent"
allocation or doing the cache handling.

>=20
> All things considered, while I agree that it isn't the ideal solution,
> we really don't have a better (ie, works on a larger set of platforms)
> solution at the moment or in the next 5 years.

Indeed. In the short term, I like the idea that we'll first make it safe to
expose the heaps at all time, so at least we have a choice. Today, on most =
major
distributions none of the solution mentioned are available. I have no idea =
how
much work this is.

Nicolas

