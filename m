Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4391E780C78
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B110E50C;
	Fri, 18 Aug 2023 13:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D308A10E50B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:24:30 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id
 2adb3069b0e04-4fe4762173bso1324397e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692365069; x=1692969869;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vozYBUuolsCe8XCgi0Ug/KQkJ1+PSIDO7wFVe6lcodk=;
 b=WWRpT36Pcswwy5dkib/DqzYqpQLUm6Twd3x9oSuyxpN+zcefPjGvj5vGIaDTdEVIqd
 pZqB2Kop4DE27hOG8KRO/WGKqnLSJFS16dFJGoEw8WpwHixpO33T+2O7Olcd0yHepHjH
 jvP4emsqYvIGWSyV79LSaSW6w5yxN+as0zl9jPnnxEOzYKRPLhssrmvoccQZwM+YImT8
 b+xxBRdV2QkjtcwSrRsTQzDRIyLTvD5nmoe3WjHo50oYAyzM6PO/6FkoQNfwiTcfPX9/
 OmlxTxyp6ojmEq4UlfeYcE/ZBwI+2I1NCb7bX+hkiqPzAcZ+2GL6Ci1KC3spVaThNPIW
 UOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692365069; x=1692969869;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vozYBUuolsCe8XCgi0Ug/KQkJ1+PSIDO7wFVe6lcodk=;
 b=Yy021pQKXWXj3Og+F0pvclXJhD7fwxo9X2MSiKdXUNOHLi4+eA6uohRMSXedHoKY2S
 57gZ429tloNn0QXbM/T0dRE5Vz2VfFV8FEbCxd4GV4Arwch9PI/4q7BB4vxurHbuxTlp
 fgAkLNGJnRkNV3uz7awZ59c+NN0VWOkVkvbb8E9zbl5Q4DzpBZSWS3iOYBqf3vteSjsN
 dUSfHRE4p05BmqnEYi1AjHym7h5AZk98dupwgQh8iPI/nMzOpW1gvm87ULGlkd9GS+ra
 cexQ7sCw3u3HgUt2NM8ZH7/xTdx1bzt9/An4ZM45d/g/ENt0R5leg1Hn7pl3+MJZMwyW
 ZFrA==
X-Gm-Message-State: AOJu0Ywg57ZfHTATnGUNyqKWmAhoj8nv3KdaFg/w6Y9sw0zfLpnz4waH
 h1qip7eT9fUt8LQKZVr5xY0=
X-Google-Smtp-Source: AGHT+IEMZJDw+h/fZ4mRf4hylPRGfp9kgnzqZzcqJfjkC9NgUNY9I65ZKtb7QB5xVn0Yx9XUVxE5vw==
X-Received: by 2002:a05:6512:1108:b0:4fb:94fd:645f with SMTP id
 l8-20020a056512110800b004fb94fd645fmr2184521lfg.68.1692365068365; 
 Fri, 18 Aug 2023 06:24:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 16-20020ac24830000000b004ff1b5c8df3sm334915lft.211.2023.08.18.06.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 06:24:28 -0700 (PDT)
Date: Fri, 18 Aug 2023 16:24:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
Message-ID: <20230818162415.2185f8e3@eldfell>
In-Reply-To: <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.OEbE7Pj=Cx+xTv+u5JeFW5";
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.OEbE7Pj=Cx+xTv+u5JeFW5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Aug 2023 09:45:27 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi
>=20
> On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote:
> > After discussions on IRC, the consensus is that the DRM drivers should
> > not do software color conversion, and only advertise the supported form=
ats.
> > Update the doc accordingly so that the rule and exceptions are clear for
> > everyone.
> >=20
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index 8db7fd3f743e..00a29152da9f 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -38,6 +38,13 @@ extern "C" {
> >   * fourcc code, a Format Modifier may optionally be provided, in order=
 to
> >   * further describe the buffer's format - for example tiling or compre=
ssion.
> >   *
> > + * DRM drivers should not do software color conversion, and only adver=
tise the
> > + * format they support in hardware. But there are two exceptions: =20
>=20
> I would do a bullet list here:
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#l=
ists-and-quote-like-blocks
>=20
> > + * The first is to support XRGB8888 if the hardware doesn't support it=
, because
> > + * it's the de facto standard for userspace applications. =20
>=20
> We can also provide a bit more context here, something like:
>=20
> All drivers must support XRGB8888, even if the hardware cannot support
> it. This has become the de-facto standard and a lot of user-space assume
> it will be present.
>=20
> > + * The second is to drop the unused bits when sending the data to the =
hardware,
> > + * to improve the bandwidth, like dropping the "X" in XRGB8888. =20
>=20
> I think it can be made a bit more generic, with something like:
>=20
> Any driver is free to modify its internal representation of the format,
> as long as it doesn't alter the visible content in any way. An example
> would be to drop the padding component from a format to save some memory
> bandwidth.

Hi,

to my understanding and desire, the rule to not "fake" pixel format
support is strictly related to performance. When a KMS client does a
page flip, it usually does not expect a massive amount of CPU or GPU
work to occur just because of the flip. A name for such work is "copy",
referring to any kind of copying of large amounts of pixel data,
including a format conversion or not.

This is especially important with GPU rendering and hardware video
playback systems, where any such copy could destroy the usability of
the whole system. This is the main reason why KMS must not do any
expensive processing unexpectedly (as in, not documented in UAPI).
Doing any kind of copy could cause a vblank to be missed, ruining
display timings.

I believe the above is the spirit of the rule. Then there will be
exceptions. I'd like to think that everything below (except for
XRGB8888) can be derived from the above with common sense - that's what
I did.

XRGB8888 support is the prime exception. I suspect it originates from
the legacy KMS UAPI, and the practise that XRGB8888 has been widely
supported always. This makes it plausible for userspace to exist that
cannot produce any other format. Hence, it is good to support XRGB8888
through a conversion (copy) in the kernel for dumb buffers (that is,
for software rendered framebuffers). I would be very hesitant to extend
this exception to GPU rendered buffers, but OTOH if you have a GPU,
presumably you also have a display controller capable of scanning out
what the GPU renders, so you wouldn't even consider copying under the
hood.

DRM devices that cannot directly scan out buffers at all are a whole
category of exceptions. They include USB display adapters (literal USB,
not USB-C alt mode), perhaps networked and wireless displays, VKMS
which does everything in software, and so on. They simply have to
process the bulk pixel data with a CPU one way or another, and
hopefully they make use of damage rectangles to minimise the work.

Old-school special cursor planes may have been using special pixel
formats that may not be supported by userspace. Cursors are usually
small images and they can make a huge performance impact, so it makes
sense to support ARGB8888 even with a CPU conversion.

Then we have display controllers without GPUs. Everything is
software-rendered. If it so happens that software rendering into sysram
and then copying (with conversion) into VRAM is more performant than
rendering into VRAM, then the copy is well justified.

Software-rendering into sysram and then copying into VRAM is actually
so commonly preferred, that KMS has a special flag to suggest userspace
does it: DRM_CAP_DUMB_PREFER_SHADOW [1]. A well-behaved
software-rendering KMS client checks this flag and honours it. If a
driver both sets the flag, and copies itself, then that's two copies
for each flip. The driver's copy is unexpected, but is there a good
reason for the driver to do it?

I can only think one reason: hardware scanout pixel format being one
that userspace cannot reasonably be expected to produce. I think
nowadays RGB888 (the literally 3 bytes per pixel) format counts as one.

If hardware requires RGB888 to e.g. reach a specific resolution, should
the driver set DRM_CAP_DUMB_PREFER_SHADOW or not? If the driver always
allocates sysram as dumb buffers because there simply is not enough
VRAM to give out, then definitely not. That is a very good reason for
the driver to do a copy/conversion with damage under the hood. It
sucks, but it's the only way it can work.

But if the dumb buffers are allocated in VRAM, then
DRM_CAP_DUMB_PREFER_SHADOW should likely be set because direct VRAM
access tends to be slow, and the driver should not copy - unless maybe
for XRGB8888 and cursors. A CPU copy from VRAM into VRAM is the worst.

For RGB888 hardware and software rendering, it would be best if:

- Dumb buffers are allocated from VRAM, making them directly
  scanout-able for RGB888.

- DRM_CAP_DUMB_PREFER_SHADOW is set, telling userspace to render into a
  shadow and then copy into a dumb buffer.

- Userspace's copy into a dumb buffer produces RGB888, while the shadow
  buffer can be of any format userspace likes.

This minimises the amount of work done, and page flips are literal
flips without a hidden copy in the driver.

If userspace does not support RGB888, things get hairy. If XRGB8888 is
faked via a driver copy, then you would not want to be copying from
VRAM into VRAM. Create-dumb ioctl passes in bpp, so the driver could
special-case 24 vs. 32 I guess, allocating 24 from VRAM and 32 from
sysram. But do you set DRM_CAP_DUMB_PREFER_SHADOW? It would always be
wrong for the other format.

Ideally, XRGB8888 would be supported without artificially crippling
more optimal pixel formats by lack of DRM_CAP_DUMB_PREFER_SHADOW, even
if XRGB8888 support is fake and hurt by DRM_CAP_DUMB_PREFER_SHADOW. But
that also depends on the expected userspace, which format does it use.


[1] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#c.DRM_CAP_DUMB_P=
REFER_SHADOW


Thanks,
pq

--Sig_/.OEbE7Pj=Cx+xTv+u5JeFW5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTfcP8ACgkQI1/ltBGq
qqeqJxAAlnrH1PlZbvYJL706DV93B9Wj8Mv74m/Eww2VqAoAxiEALq2Skijct64U
RMslMro9m5uV78ReIjlv+O0IqxeyKrxbxhB1fOCnH7MjEtyi6RRzufyVmQIDvi3b
74IsoxtNmMmYHMLVpou/TExZYS8LMhkSnDRVF13wgUkuA/a7MJeXXxLXVlAKqj9L
WIf7+Sl4CpFHAWje0lMYFESNDPsxl4VDune6RkD+psvALJSXoui6ppRiU6RAzsRS
zhgYKE+U3PexlJ8NfONeJrU7Ctl1XQs7MUDvLkIwRSmei+IwRCHbmQs2PdRkctFr
RuJaMGF1i93GRDosyDPlnyLDyE1HL5LztAghIQXuCsIVk6w7kWgggLf/QfsyPBVc
AbfNVfHSKuX1Ya6ytRibKqqOi2kBTVx1dsmOPo3ol6rr0J5xI8ixVCElqpmpYwST
DTmkXRYQn3sh12mzZJ4xA8ZFk5/p5ubV/Ae5RFnECHVTdpc3ITIwlpyl0zAPAxaQ
wj8upB27PYahobF3lTCRSM+qqMloniK6qnPcF2O5oJUxXvnJECHtB8PhpHzN8WJx
B1+esypcmHhZQCn9ROo4g15fRfCXrC3htHs5wN+9oXJGBb1lRT5+CSTfBj2Qg1Kg
Uc0wjBCRUCkeZvk91vHS7ZgfWL+jCOK2sgGeE7E1pY1OxqNxA0M=
=BFbi
-----END PGP SIGNATURE-----

--Sig_/.OEbE7Pj=Cx+xTv+u5JeFW5--
