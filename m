Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC0783BA3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF8F10E18A;
	Tue, 22 Aug 2023 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A945D10E18A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:20:09 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-5007abb15e9so3386302e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692692408; x=1693297208;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=57BOFi0EOFfHA2vuFbXxmLN3eDERK2LhAAh1Ku5PiCM=;
 b=MudJWh3Y53+Byv3WFsd6Ji5avQtG200PeC49luMhU4111ggGf/+zS8NVh3+fe1FMkV
 ChbShXfDgBqyIAKZbNhoZJptE8Ab763fqfBH1Q3yF/4dci0fO0l5ya5McRj+bNazq3K3
 RxJHRmVOgcsVPh6tb8ov9MON5G9opNRiwRUoXv05vbav2otp7afXQLxflPI05KvPqYEE
 vj0dXmL1ANwpWDExOtOYJdo0nC5PfjziAiDp42TM4y0VIv2BUPiBKOR6uZTp3kRv/3OJ
 EwNY2V3jQ9xTXviOWbw9K9gvrXs0H1/ZwU5AHqgNPHO2oNn0YuvH07ouJsIAYhmfXm5C
 hfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692692408; x=1693297208;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57BOFi0EOFfHA2vuFbXxmLN3eDERK2LhAAh1Ku5PiCM=;
 b=LX1FurtNi4sPgOonj9Opb0HPl/PPqz44bCA58VijS9StGfuK5H4Euqjm1zlVE62uVH
 dTp4vDUt/jYztV3JSI2SmHzq6gXlIr8i0UYYaYQBUrsczBvRaDddLosCcG9V2N+NsO4O
 ew6M5DHJkxsKfe1EqCa64XONPNaO/5/YYPdmhBr+LFBfCRPkxXwLETXsZstZTeK5NpIk
 ZWyRQ5ExNB1JfOWjYbjuX3anReVZtpf8OJ3XvFK94C3A8LE76X4u8Z7VNXKgRXSPuW0A
 xUH7BKQ2xFKuMLF9ECxPdy0U+tPdq8U9+n1Y3PPCmgO66lT/rO10N5B4sYR2XifBYm/g
 5new==
X-Gm-Message-State: AOJu0Yx6xKqjxS7jwwtRDpEJFy56MUq7qLwWT0lTRWFrYBpMOIBPi7n7
 5FkhLSY69B09z5P/zHGasDM=
X-Google-Smtp-Source: AGHT+IE3vb/VoaUGlCoZX4omP7f4Q7hxcEqab4OC/+P5Ss88vZLb2aG1DwYvvmBNRbVDmmBjQb/9Yg==
X-Received: by 2002:a05:6512:2247:b0:500:83d0:a0ee with SMTP id
 i7-20020a056512224700b0050083d0a0eemr4039569lfu.69.1692692407208; 
 Tue, 22 Aug 2023 01:20:07 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 r22-20020ac24d16000000b004fb745fd22fsm2085280lfi.32.2023.08.22.01.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 01:20:07 -0700 (PDT)
Date: Tue, 22 Aug 2023 11:20:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
Message-ID: <20230822112004.3599df53@eldfell>
In-Reply-To: <36prxupvl72tmamorquaunss27kckoq5zegmrwxdr3v3ynqz4s@xiypdbs4pbga>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
 <20230818162415.2185f8e3@eldfell>
 <36prxupvl72tmamorquaunss27kckoq5zegmrwxdr3v3ynqz4s@xiypdbs4pbga>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p+Y7PW/u+bY1tcVaRnxAZa2";
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

--Sig_/p+Y7PW/u+bY1tcVaRnxAZa2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Aug 2023 17:55:33 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi Pekka,
>=20
> Thanks for answering
>=20
> On Fri, Aug 18, 2023 at 04:24:15PM +0300, Pekka Paalanen wrote:
> > On Thu, 10 Aug 2023 09:45:27 +0200
> > Maxime Ripard <mripard@kernel.org> wrote: =20
> > > On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote: =20
> > > > After discussions on IRC, the consensus is that the DRM drivers sho=
uld
> > > > not do software color conversion, and only advertise the supported =
formats.
> > > > Update the doc accordingly so that the rule and exceptions are clea=
r for
> > > > everyone.
> > > >=20
> > > > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > > > ---
> > > >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >=20
> > > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_f=
ourcc.h
> > > > index 8db7fd3f743e..00a29152da9f 100644
> > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > @@ -38,6 +38,13 @@ extern "C" {
> > > >   * fourcc code, a Format Modifier may optionally be provided, in o=
rder to
> > > >   * further describe the buffer's format - for example tiling or co=
mpression.
> > > >   *
> > > > + * DRM drivers should not do software color conversion, and only a=
dvertise the
> > > > + * format they support in hardware. But there are two exceptions: =
  =20
> > >=20
> > > I would do a bullet list here:
> > > https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.ht=
ml#lists-and-quote-like-blocks
> > >  =20
> > > > + * The first is to support XRGB8888 if the hardware doesn't suppor=
t it, because
> > > > + * it's the de facto standard for userspace applications.   =20
> > >=20
> > > We can also provide a bit more context here, something like:
> > >=20
> > > All drivers must support XRGB8888, even if the hardware cannot support
> > > it. This has become the de-facto standard and a lot of user-space ass=
ume
> > > it will be present.
> > >  =20
> > > > + * The second is to drop the unused bits when sending the data to =
the hardware,
> > > > + * to improve the bandwidth, like dropping the "X" in XRGB8888.   =
=20
> > >=20
> > > I think it can be made a bit more generic, with something like:
> > >=20
> > > Any driver is free to modify its internal representation of the forma=
t,
> > > as long as it doesn't alter the visible content in any way. An example
> > > would be to drop the padding component from a format to save some mem=
ory
> > > bandwidth. =20
> >
> > to my understanding and desire, the rule to not "fake" pixel format
> > support is strictly related to performance. When a KMS client does a
> > page flip, it usually does not expect a massive amount of CPU or GPU
> > work to occur just because of the flip. A name for such work is "copy",
> > referring to any kind of copying of large amounts of pixel data,
> > including a format conversion or not. =20
>=20
> Should we add that to the suggested documentation that it shouldn't
> degrade performance and shouldn't be something that the userspace can
> notice?

I would let Sima (or Simon Ser) answer that, and verify my
understanding too.

> > This is especially important with GPU rendering and hardware video
> > playback systems, where any such copy could destroy the usability of
> > the whole system. This is the main reason why KMS must not do any
> > expensive processing unexpectedly (as in, not documented in UAPI).
> > Doing any kind of copy could cause a vblank to be missed, ruining
> > display timings.
> >=20
> > I believe the above is the spirit of the rule. =20
>=20
> That's totally reasonable to me :)
>=20
> > Then there will be exceptions. I'd like to think that everything below
> > (except for XRGB8888) can be derived from the above with common sense
> > - that's what I did.
> >=20
> > XRGB8888 support is the prime exception. I suspect it originates from
> > the legacy KMS UAPI, and the practise that XRGB8888 has been widely
> > supported always. This makes it plausible for userspace to exist that
> > cannot produce any other format. Hence, it is good to support XRGB8888
> > through a conversion (copy) in the kernel for dumb buffers (that is,
> > for software rendered framebuffers). I would be very hesitant to extend
> > this exception to GPU rendered buffers, but OTOH if you have a GPU,
> > presumably you also have a display controller capable of scanning out
> > what the GPU renders, so you wouldn't even consider copying under the
> > hood.
> >=20
> > DRM devices that cannot directly scan out buffers at all are a whole
> > category of exceptions. They include USB display adapters (literal USB,
> > not USB-C alt mode), perhaps networked and wireless displays, VKMS
> > which does everything in software, and so on. They simply have to
> > process the bulk pixel data with a CPU one way or another, and
> > hopefully they make use of damage rectangles to minimise the work.
> >=20
> > Old-school special cursor planes may have been using special pixel
> > formats that may not be supported by userspace. Cursors are usually
> > small images and they can make a huge performance impact, so it makes
> > sense to support ARGB8888 even with a CPU conversion.
> >=20
> > Then we have display controllers without GPUs. Everything is
> > software-rendered. If it so happens that software rendering into sysram
> > and then copying (with conversion) into VRAM is more performant than
> > rendering into VRAM, then the copy is well justified.
> >=20
> > Software-rendering into sysram and then copying into VRAM is actually
> > so commonly preferred, that KMS has a special flag to suggest userspace
> > does it: DRM_CAP_DUMB_PREFER_SHADOW [1]. A well-behaved
> > software-rendering KMS client checks this flag and honours it. If a
> > driver both sets the flag, and copies itself, then that's two copies
> > for each flip. The driver's copy is unexpected, but is there a good
> > reason for the driver to do it?
> >=20
> > I can only think one reason: hardware scanout pixel format being one
> > that userspace cannot reasonably be expected to produce. I think
> > nowadays RGB888 (the literally 3 bytes per pixel) format counts as one.=
 =20
>=20
> I guess any tiled format would count there too, right?

Only if the display controller is unable to read a linear format, or
some other extremely pressing reason that makes the use of a linear
format infeasible, e.g. hardware bugs or prohibitive memory bandwidth
usage. That would be very surprising though, given that all video
signal formats I know about scan in a linear fashion, meaning that any
other framebuffer layout would cause complications like needing lots of
CRTC pixel buffer memory.

In short, I think not.

Sub-sampled YUV is another matter, but I assume you meant non-linear
DRM format modifiers rather than just YUV layouts.

Again, there could be exceptions in ancient hardware. I recall hearing
that some hardware might have stored pixels as "bit planes", meaning
that in memory you have a bit plane after a bit plane, and each bit
plane contains one specific bit of all pixels in the image. We do not
have DRM format codes nor modifiers to express such layout that I know
of, so under-the-hood driver conversion would be appropriate since I
don't think any software would want to produce such images today.

> > If hardware requires RGB888 to e.g. reach a specific resolution, should
> > the driver set DRM_CAP_DUMB_PREFER_SHADOW or not? If the driver always
> > allocates sysram as dumb buffers because there simply is not enough
> > VRAM to give out, then definitely not. That is a very good reason for
> > the driver to do a copy/conversion with damage under the hood. It
> > sucks, but it's the only way it can work.
> >=20
> > But if the dumb buffers are allocated in VRAM, then
> > DRM_CAP_DUMB_PREFER_SHADOW should likely be set because direct VRAM
> > access tends to be slow, and the driver should not copy - unless maybe
> > for XRGB8888 and cursors. A CPU copy from VRAM into VRAM is the worst.
> >=20
> > For RGB888 hardware and software rendering, it would be best if:
> >=20
> > - Dumb buffers are allocated from VRAM, making them directly
> >   scanout-able for RGB888.
> >=20
> > - DRM_CAP_DUMB_PREFER_SHADOW is set, telling userspace to render into a
> >   shadow and then copy into a dumb buffer.
> >=20
> > - Userspace's copy into a dumb buffer produces RGB888, while the shadow
> >   buffer can be of any format userspace likes.
> >=20
> > This minimises the amount of work done, and page flips are literal
> > flips without a hidden copy in the driver.
> >=20
> > If userspace does not support RGB888, things get hairy. If XRGB8888 is
> > faked via a driver copy, then you would not want to be copying from
> > VRAM into VRAM. Create-dumb ioctl passes in bpp, so the driver could
> > special-case 24 vs. 32 I guess, allocating 24 from VRAM and 32 from
> > sysram. But do you set DRM_CAP_DUMB_PREFER_SHADOW? It would always be
> > wrong for the other format.
> >=20
> > Ideally, XRGB8888 would be supported without artificially crippling
> > more optimal pixel formats by lack of DRM_CAP_DUMB_PREFER_SHADOW, even
> > if XRGB8888 support is fake and hurt by DRM_CAP_DUMB_PREFER_SHADOW. But
> > that also depends on the expected userspace, which format does it use. =
=20
>=20
> Jocelyn, I think we should have a link to that mail too in the doc
> you've written.
>=20
> Pekka, it's not clear to me though if what you wrote here are changes
> you would like on the original patch, or if it's just general thoughts?

It is my understanding of the matter and of the background. Take from it
what you feel is important. The proposed patch is not wrong, but it is
perhaps a bit too simple description, like not limiting CPU conversions
to dumb buffers, and ignoring the worst case: dumb buffers in VRAM +
CPU conversion which would have utterly horrible performance. I feel
the interaction with DRM_CAP_DUMB_PREFER_SHADOW is important to note.

I'm not sure what should be documented of it.

Also, things like the Pixman library support conversions between tons
of pixel formats, and is able to use hand-tuned SSE, vector and whatnot
instructions in order to optimise conversions. I doubt you could reach
that level of flexibility and performance in-kernel.

In the XRGB8888 to RGB888 case, the kernel doing the conversion may
allow for higher resolutions, but it may also hurt framerate more than
userspace doing conversion, theoretically. For lower resolution where
XRGB8888 could be scanned out directly from VRAM, the conversion would
be strictly hurting.


Thanks,
pq

--Sig_/p+Y7PW/u+bY1tcVaRnxAZa2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTkb7QACgkQI1/ltBGq
qqe4rxAAj80lTKUQvuU5VfTg02Zlr98xyM4PM4Hnts5DDXlDzDeAocC1Js8TD5iH
HaFZdgRu8h+tpB3eJNlLk5y/CbCFIdAe0zmfkcYIJWQ50i8/qr0DYQAIp9fxNd5q
FdRPwf/axgCUMSIFwVbGe66YeHwiVMhKgCGTMnNb73LtWvcTfPiyHLWsfOlL497k
xh1I0W8/MBIkRpGPE11aTm8vcRD1ZkS/c2EdUSa6OohYZ89P6Pj6iQ+yu1nIjvDC
ELBmD6SCzywxkKa/RfobqfgE0FD1XGT9Cyc2uODsyyem96Ym+yhklvErNwO9tGcx
OC9v6ESyzPHLVcqxCZpeCfsVfsT46ZXqek1DIjrFB8juXPywG48KAS3cqrweBsC1
HQPjZOiX81HJjB9DSbynvtjWQrIisv89dZhH8SaqoJkbaClxbhn15RDDFSOyBnAc
yKLjiLr59PzI5rqF4TUUFrNILGEfOTrbInr60jvXpbtsyOSfk0vtA+SS1amDbcoD
cv8EiXYlfYaYKet+gFrUTuzSiBH7VTPcb35eKKcBGjSBelcOC2BJdoVutsuWI1Ro
georRF5QKaVymVQMOwxFUk5Q0lhSxt1YoQ94j/DIsQ1fqWRh0wxPzQ6QvXXiAyF4
QINmkrzrXn1613t7K7yqQPeCEnftNDI7NTfXQq5msko7RcO+Jvg=
=ef1V
-----END PGP SIGNATURE-----

--Sig_/p+Y7PW/u+bY1tcVaRnxAZa2--
