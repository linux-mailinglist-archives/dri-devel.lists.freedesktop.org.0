Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D961776ED
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 14:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D726E8CB;
	Tue,  3 Mar 2020 13:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EE66E8CB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 13:25:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h18so3446183ljl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 05:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=LvhkOgXrb2OWkTpGBSsBoEw8KrqnEimtTkTstiOI43c=;
 b=hYJDMp6ZBiiCpZuyfa4Kz2PmSGYIgewTfo/Xg74GdOZeNH557gwFHz1Ux/J7L9VwW9
 tK2pqriZiq6Y8d0z5GrLxAqMTE93LoT6M4e4dUzy2YM5x1Yg/hc8f2UBdxBlOUMkNguF
 Lprsut29Afny2qKO6PdKwLtqt+TeOXttWQNubMom1wNcHQ7ufsr8VUc4a/7adBVh6/nt
 P62LLwNfZAXO68KuN9nEnxUnRcSYoQBH2Izt+1/PxAmi/44AATCGhflRAcWlXL4NaJv4
 qKYHN9AUT5zaoRcljLrUtX+VovwGVccxY6OU/XVzUpHQRnnOHQoPQHLGX1FMFCDmz3ae
 3Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=LvhkOgXrb2OWkTpGBSsBoEw8KrqnEimtTkTstiOI43c=;
 b=NypIFoXQnd3NDn89MMKh7c0sOifD04DunY6NJfLyWuGNHQPhsv3zN/fW/XJjd4CzIw
 /Q7eqqDY1NT0ahHTCiGlcA4jSThLS8FRD69lML10FSg66LhDn1IEvDqFtQQ2VyILLMKe
 /QvOauMOh/6LvDQ4Luq6pNHuuBwldbm+krisyTmgYTLWZK3BBKNqgQ2CyyLG8ShVnl1x
 lOdB/Cn0LSDq3JzA1XJArp/ZeOUqPvPqmhNi2hsY+8CGWip4+ntZwYqYVr7Gh3X8pKvK
 Fl50XybUNrcxZWUqlpgQjUQanO84dLxLUiSwuva+a/nRxK50puzVdVngKGBRscXc6jyA
 1LAg==
X-Gm-Message-State: ANhLgQ1i38xIFB0XtL+GNZ1ehj4Mz6xEMGlKrjFRUOOVS92qjpNMJior
 ohvUc7noPs2LnuCP4Gr/RwM=
X-Google-Smtp-Source: ADFU+vtPXg5XfV28+XzrSvE0RNfGX9/K/WgobUrhDLX7k3v3F4f7QxdZcQKIeJN8h74XuXLaZALphw==
X-Received: by 2002:a2e:b8d0:: with SMTP id s16mr2334158ljp.32.1583241951651; 
 Tue, 03 Mar 2020 05:25:51 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v15sm12066046lfg.51.2020.03.03.05.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 05:25:51 -0800 (PST)
Date: Tue, 3 Mar 2020 15:25:41 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Message-ID: <20200303152541.68ab6f3d@eldfell.localdomain>
In-Reply-To: <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
 <20200303121029.5532669d@eldfell.localdomain>
 <20200303105325.bn4sob6yrdf5mwrh@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org,
 nd <nd@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1929482490=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1929482490==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CbiMmpJgoWAxyEnELUudiQH"; protocol="application/pgp-signature"

--Sig_/CbiMmpJgoWAxyEnELUudiQH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Mar 2020 12:37:16 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Mar 3, 2020 at 11:53 AM Brian Starkey <brian.starkey@arm.com> wro=
te:
> >
> > Hi,
> >
> > On Tue, Mar 03, 2020 at 12:10:29PM +0200, Pekka Paalanen wrote: =20
> > > On Fri, 21 Feb 2020 10:08:42 +0100
> > > Neil Armstrong <narmstrong@baylibre.com> wrote:
> > > =20
> > > > Amlogic uses a proprietary lossless image compression protocol and =
format
> > > > for their hardware video codec accelerators, either video decoders =
or
> > > > video input encoders.
> > > >
> > > > It considerably reduces memory bandwidth while writing and reading
> > > > frames in memory.
> > > >
> > > > The underlying storage is considered to be 3 components, 8bit or 10=
-bit
> > > > per component, YCbCr 420, single plane :
> > > > - DRM_FORMAT_YUV420_8BIT
> > > > - DRM_FORMAT_YUV420_10BIT
> > > >
> > > > This modifier will be notably added to DMA-BUF frames imported from=
 the V4L2
> > > > Amlogic VDEC decoder.
> > > >
> > > > At least two options are supported :
> > > > - Scatter mode: the buffer is filled with a IOMMU scatter table ref=
erring
> > > >   to the encoder current memory layout. This mode if more efficient=
 in terms
> > > >   of memory allocation but frames are not dumpable and only valid d=
uring until
> > > >   the buffer is freed and back in control of the encoder
> > > > - Memory saving: when the pixel bpp is 8b, the size of the superblo=
ck can
> > > >   be reduced, thus saving memory.
> > > >
> > > > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > > > ---
> > > >  include/uapi/drm/drm_fourcc.h | 56 +++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 56 insertions(+)
> > > >
> > > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_f=
ourcc.h
> > > > index 8bc0b31597d8..8a6e87bacadb 100644
> > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > @@ -309,6 +309,7 @@ extern "C" {
> > > >  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
> > > >  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> > > >  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> > > > +#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> > > >
> > > >  /* add more to the end as needed */
> > > >
> > > > @@ -804,6 +805,61 @@ extern "C" {
> > > >   */
> > > >  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, =
1)
> > > >
> > > > +/*
> > > > + * Amlogic Video Framebuffer Compression modifiers
> > > > + *
> > > > + * Amlogic uses a proprietary lossless image compression protocol =
and format
> > > > + * for their hardware video codec accelerators, either video decod=
ers or
> > > > + * video input encoders.
> > > > + *
> > > > + * It considerably reduces memory bandwidth while writing and read=
ing
> > > > + * frames in memory.
> > > > + * Implementation details may be platform and SoC specific, and sh=
ared
> > > > + * between the producer and the decoder on the same platform. =20
> > >
> > > Hi,
> > >
> > > after a lengthy IRC discussion on #dri-devel, this "may be platform a=
nd
> > > SoC specific" is a problem.
> > >
> > > It can be an issue in two ways:
> > >
> > > - If something in the data acts like a sub-modifier, then advertising
> > >   support for one modifier does not really tell if the data layout is
> > >   supported or not.
> > >
> > > - If you need to know the platform and/or SoC to be able to interpret
> > >   the data, it means the modifier is ill-defined and cannot be used in
> > >   inter-machine communication (e.g. Pipewire).
> > > =20
> >
> > Playing devil's advocate, the comment sounds similar to
> > I915_FORMAT_MOD_{X,Y}_TILED:
> >
> >  * This format is highly platforms specific and not useful for cross-dr=
iver
> >  * sharing. It exists since on a given platform it does uniquely identi=
fy the
> >  * layout in a simple way for i915-specific userspace. =20
>=20
> Yeah which we regret now. We need to now roll out a new set of
> modifiers for at least some of the differences in these on the
> modern-ish chips (the old crap is pretty much lost cause anyway).
>=20
> This was kinda a nasty hack to smooth things over since we have epic
> amounts of userspace, but it's really not a great idea (and no one
> else really has epic amounts of existing userspace that uses tiling
> flags everywhere, this is all new code).
> -Daniel
>=20
> > Isn't the statement that this for sharing between producer and decoder
> > _on the same platform_ a similar clause with the same effect?
> >
> > What advantage is there to exposing the gory details? For Arm AFBC
> > it's necessary because IP on the SoC can be (likely to be) from
> > different vendors with different capabilities.
> >
> > If this is only for talking between Amlogic IP on the same SoC, and
> > those devices support all the same "flavours", I don't see what is
> > gained by making userspace care about internals. =20
>=20
> The trouble is if you mix&match IP cores, and one of them supports
> flavours A, B, C and the other C, D, E. But all you have is a single
> magic modifier for "whatever the flavour is that soc prefers". So
> someone gets to stuff this in DT.
>=20
> Also eventually, maybe, perhaps ARM does grow up into the
> client/server space with add-on pcie graphics, and at least for client
> you very often end up with integrated + add-in pcie gpu. At that point
> you really can't have magic per-soc modifiers anymore.

Hi,

I also heard that Pipewire will copy buffers and modifiers verbatim
from one machine to another when streaming across network, assuming
that the same modifier means the same thing on all machines.[Citation neede=
d]

If that is something that must not be done with DRM modifiers, then
please contact them and document that.


Thanks,
pq


> If people get confused I'm happy to add a "WARNING: This was a dumb
> idea for backwards compat with legacy code, no one with new stuff ever
> repeat it" to the i915 modifers.
> -Daniel
>=20
> >
> > Thanks,
> > -Brian
> > =20
> > > Neil mentioned the data contains a "header" that further specifies
> > > things, but there is no specification about the header itself.
> > > Therefore I don't think we can even know if the header contains
> > > something that acts like a sub-modifier or not.
> > >
> > > All this sounds like the modifier definitions here are not enough to
> > > fully interpret the data. At the very least I would expect a reference
> > > to a document explaining the "header", or even better, a kernel ReST
> > > doc.
> > >
> > > I wonder if this is at all suitable as a DRM format modifier as is. I
> > > have been assuming that a modifier together with all the usual FB
> > > parameters should be enough to interpret the stored data, but in this
> > > case I have doubt it actually is.
> > >
> > > I have no problem with proprietary data layouts as long as they are
> > > fully specified.
> > >
> > > I do feel like I would not be able to write a software decoder for th=
is
> > > set of modifiers given the details below.
> > >
> > >
> > > Thanks,
> > > pq
> > > =20

--Sig_/CbiMmpJgoWAxyEnELUudiQH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5eWtUACgkQI1/ltBGq
qqeB2g/+MGx1BzpiVLYUgsdkyAdrgVpRKL5tjnoVHgr7PbXDFZwRniEXxSYQAUt1
5jC/xpa95aN0nUZhZeGoHeMYzgEfXvUwCMcIvOEt4TcJgPeD4mp1bQI34cxFPpr1
qMkFLhgtkcJKD9X1QcmNqIB9baP+DXQWFSB9ljrVw001TLswjaT3PQyIFOWzFHjg
8XN6arfLYWYtL8Zz3wfrjN+yLMDGf06i6BquImC57KSSpwZpdIeQI81HdAi083Su
+NQcgFedEwA0LWytGjUh+auTbTxQvpadRHhlLUY3reuOIId63VpfMKBmrkvFbvzk
ziiLk9g+T+2N2Ioju3/ObIxNJIv/R5uQhyFCbsFsaYEcetXoe6HfUuehEtNOfYnP
R73TXf27d6w4FUUzBuQUitYReFY2QdVxh6xxYi0pNrIj/HAu2OJWbv+Owe9ONoB3
J1OTDBFPGE45LPqfGjkAoAvChT1Ma/C/AUrsHli0Vb6VlDre9jBc/EE3f14DKxUz
qTnPE5xxpXq0Fun2vULFBEHNfAZd4GQ6B94TG6LBVSHF9TLj4G2hMy90On5E1x4z
ehNZBCxBp0LuDXuuP9skuvXlLgKmnlAJKIKnuU11SNpRTUW9k5cq3158kI45rnhR
8Z3hWCzgPo4hp74DCggpMLR7svN2h8I6IOGNtf66Dj2N63xz2gk=
=QG9G
-----END PGP SIGNATURE-----

--Sig_/CbiMmpJgoWAxyEnELUudiQH--

--===============1929482490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1929482490==--
