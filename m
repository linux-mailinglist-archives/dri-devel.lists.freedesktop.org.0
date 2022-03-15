Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8084D995C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 11:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE5589D2E;
	Tue, 15 Mar 2022 10:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BD389D2E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 10:48:41 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h11so25861958ljb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 03:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=lfhD24riJelDK87kEEewPQwSaRCOfck54Hh4KuX734w=;
 b=LH+9OAesTwYd+2J9jrenLHUklMfKpsyF3SuvXKhcd5cHgDx4b4wutozI+uPQbgNkis
 tBZmeM4CJBhaC/2KcyBVQ02grFWgq/lHms25ort9jk/Qmdf5PiCeV+ofKt6nLcNExfaP
 5DVev7BS8zuBFthw1yjtPcPX7EHRabgY8GfhN4oEtPKgFGRVQuZGd1WIC6b4aPdiLH53
 7GM0Mty9DVwbbvRLqQ/X/KN5NhglAkY3RUdYt/E3JajhpO1wvN2QBuAUsiC4a4PKHRxB
 h0qTXTztCCKtw4zA6mXxXtkxunZlrgFLkA8AHOinIx56dWntFAFf72S1x2ZqZ9K7/XZr
 Cx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lfhD24riJelDK87kEEewPQwSaRCOfck54Hh4KuX734w=;
 b=TpUR6ulUAnFuh63jMKIdfTFTymyu5QurmI3GrVOdGhh6Rn6LvrQ0LPGrV6SFC7Bw0i
 au5bjnqB2MOzkCUYBLmOqlq9A2CV1WXm+v8zKNLxNBKLASjtQaCPUePgvEpqB3aImk1m
 pQ0kCSbAUKQjriHUF17VCxNvcceuaw0Ls4LV2welq0AxNyu+PtRX+bRPqVrQ4xlfq0qw
 DsY0WYAehMBg83MJrwuqPJlE3k2LImR7SPKGBhRNr8QJvyP+vRmMOQUBTNjXZ0tMh5IS
 sb5R5Qh++g5je+nmnDeodr3qKVmKWqg/QY1hBqik10pXlY5xkbaE1wCCRWTvAZGmS6W0
 b96Q==
X-Gm-Message-State: AOAM533ujZKjzsE+lf4UVfhJCcG1Zhrz5ijCJyw2AbsbFF7on1eYgXF3
 PeKKEWTRKvUY/GSWW5YZqcs=
X-Google-Smtp-Source: ABdhPJyV/CAqvia+aNM9NJ5A/e43Oy7D/pF/3+sV8/lcaMYd28pTn95six5tnKU3eC+6xfpzrae9Jg==
X-Received: by 2002:a2e:aa14:0:b0:245:fd1d:4eba with SMTP id
 bf20-20020a2eaa14000000b00245fd1d4ebamr16703819ljb.425.1647341319638; 
 Tue, 15 Mar 2022 03:48:39 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 p41-20020a05651213a900b00443fac7d6ffsm3610457lfa.108.2022.03.15.03.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 03:48:39 -0700 (PDT)
Date: Tue, 15 Mar 2022 12:48:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
Message-ID: <20220315124823.2500efe2@eldfell>
In-Reply-To: <CAMuHMdUK2T4HzN6+ShVgbBUjh6S6oTFD_G79k-QMUwo32COJjQ@mail.gmail.com>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
 <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
 <20220314170539.17400f93@eldfell>
 <CAMuHMdVj8wxAVbcov1wFsgt_knMkcySBH8nMoKjyr=G+mLQmjQ@mail.gmail.com>
 <1f915fcc-1d95-99d1-c7b7-dc4e3b49e09f@linux-m68k.org>
 <20220315093250.71352a56@eldfell>
 <CAMuHMdVU=JKwEn-=Wf3CYObtaLt2T7NmWrXUwdPHdvNsbgge=g@mail.gmail.com>
 <20220315104554.1961d62d@eldfell>
 <CAMuHMdUK2T4HzN6+ShVgbBUjh6S6oTFD_G79k-QMUwo32COJjQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SFzjUrs7yMIudHjHrw1WOsK";
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Finn Thain <fthain@linux-m68k.org>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/SFzjUrs7yMIudHjHrw1WOsK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Mar 2022 09:57:23 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Pekka,
>=20
> On Tue, Mar 15, 2022 at 9:46 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> > On Tue, 15 Mar 2022 08:51:31 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote: =20
> > > On Tue, Mar 15, 2022 at 8:33 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > > On Tue, 15 Mar 2022 09:15:08 +1100 (AEDT)
> > > > Finn Thain <fthain@linux-m68k.org> wrote: =20
> > > > > On Mon, 14 Mar 2022, Geert Uytterhoeven wrote: =20
> > > > > > On Mon, Mar 14, 2022 at 4:05 PM Pekka Paalanen <ppaalanen@gmail=
.com> wrote: =20
> > > > > > > On Mon, 14 Mar 2022 14:30:18 +0100
> > > > > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote: =20
> > > > > > > > On Mon, Mar 7, 2022 at 9:53 PM Geert Uytterhoeven <geert@li=
nux-m68k.org> wrote: =20
> > > > > > > > > Introduce fourcc codes for color-indexed frame buffer for=
mats with
> > > > > > > > > two, four, and sixteen colors, and provide a mapping from=
 bit per
> > > > > > > > > pixel and depth to fourcc codes.
> > > > > > > > >
> > > > > > > > > As the number of bits per pixel is less than eight, these=
 rely on
> > > > > > > > > proper block handling for the calculation of bits per pix=
el and
> > > > > > > > > pitch.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org> =
=20
> > > > > > > > =20
> > > > > > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > > > > @@ -99,7 +99,10 @@ extern "C" {
> > > > > > > > >  #define DRM_FORMAT_INVALID     0
> > > > > > > > >
> > > > > > > > >  /* color index */
> > > > > > > > > -#define DRM_FORMAT_C8          fourcc_code('C', '8', ' '=
, ' ') /* [7:0] C */
> > > > > > > > > +#define DRM_FORMAT_C1          fourcc_code('C', '1', ' '=
, ' ') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> > > > > > > > > +#define DRM_FORMAT_C2          fourcc_code('C', '2', ' '=
, ' ') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
> > > > > > > > > +#define DRM_FORMAT_C4          fourcc_code('C', '4', ' '=
, ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
> > > > > > > > > +#define DRM_FORMAT_C8          fourcc_code('C', '8', ' '=
, ' ') /* [7:0] C 8 one pixel/byte */
> > > > > > > > >
> > > > > > > > >  /* 8 bpp Red */
> > > > > > > > >  #define DRM_FORMAT_R8          fourcc_code('R', '8', ' '=
, ' ') /* [7:0] R */ =20
> > > > > > > >
> > > > > > > > After replying to Ilia's comment[1], I realized the CFB dra=
wing
> > > > > > > > operations use native byte and bit ordering, unless
> > > > > > > > FBINFO_FOREIGN_ENDIAN is set.
> > > > > > > > While Amiga, Atari, and Sun-3 use big-endian bit ordering,
> > > > > > > > e.g. Acorn VIDC[2] uses little endian, and SH7760[3] is con=
figurable
> > > > > > > > (sh7760fb configures ordering to match host order).
> > > > > > > > BTW, ssd130{7fb,x}_update_rect() both assume little-endian,=
 so I
> > > > > > > > guess they are broken on big-endian.
> > > > > > > > Fbtest uses big-endian bit ordering, so < 8 bpp is probably=
 broken
> > > > > > > > on little-endian.
> > > > > > > >
> > > > > > > > Hence the above should become:
> > > > > > > >
> > > > > > > >     #define DRM_FORMAT_C1          fourcc_code('C', '1', ' =
', ' ') /*
> > > > > > > > [7:0] C7:C6:C5:C4:C3:C2:C1:C0 1:1:1:1:1:1:1:1 eight pixels/=
byte */
> > > > > > > >     #define DRM_FORMAT_C2          fourcc_code('C', '2', ' =
', ' ') /*
> > > > > > > > [7:0] C3:C2:C1:C0 2:2:2:2 four pixels/byte */
> > > > > > > >     #define DRM_FORMAT_C4          fourcc_code('C', '4', ' =
', ' ') /*
> > > > > > > > [7:0] C1:C0 4:4 two pixels/byte */
> > > > > > > >
> > > > > > > > The same changes should be made for DRM_FORMAT_[RD][124].
> > > > > > > >
> > > > > > > > The fbdev emulation code should gain support for these with=
 and without
> > > > > > > > DRM_FORMAT_BIG_ENDIAN, the latter perhaps only on big-endia=
n platforms?
> > > > > > > >
> > > > > > > > [1] https://lore.kernel.org/r/CAKb7UvgEdm9U=3D+RyRwL0TGRfA_=
Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com/
> > > > > > > > [2] See p.30 of the VIDC datasheet
> > > > > > > >     http://chrisacorns.computinghistory.org.uk/docs/Acorn/M=
isc/Acorn_VIDC_Datasheet.pdf
> > > > > > > > [3] See p.1178 of the SH7660 datasheet
> > > > > > > >     https://datasheet.octopart.com/HD6417760BL200AV-Renesas=
-datasheet-14105759.pdf =20
> > > > > > >
> > > > > > > why would CPU endianess affect the order of bits in a byte? =
=20
> > > > > >
> > > > > > It doesn't, but see below.
> > > > > > =20
> > > > > > > Do you mean that bit 0 one machine is (1 << 0), and on anothe=
r machine
> > > > > > > bit 0 is (1 << 7)? =20
> > > > > >
> > > > > > No, I mean that in case of multiple pixels per byte, the display
> > > > > > hardware pumps out pixels to the CRTC starting from either the =
MSB
> > > > > > or the LSB of the first display byte.  Which order depends on t=
he
> > > > > > display hardware, not on the CPU.
> > > > > > =20
> > > > > > > In C, we have only one way to address bits of a byte and that=
 is with
> > > > > > > arithmetic. You cannot take the address of a bit any other wa=
y, can you?
> > > > > > >
> > > > > > > Can we standardise on "bit n of a byte is addressed as (1 << =
n)"? =20
> > > > > >
> > > > > > BIT(n) in Linux works the same for little- and big-endian CPUs.
> > > > > > But display hardware may use a different bit order. =20
> > > > >
> > > > > Perhaps some of this confusion could be avoided if you describe t=
he
> > > > > problem in terms of the sequence of scan-out of pixels, rather th=
an in
> > > > > terms of the serialization of bits. The significance of bits with=
in each
> > > > > pixel and the ordering of pixels within each memory word are inde=
pendent,
> > > > > right? =20
> > > >
> > > > Yes, that might help. =20
> > >
> > > Display:
> > >
> > >      P0  P1  P2  P3  P4  P5  P6  P7  P8  P9 P10 P11 P12 P13 P14 P15
> > >
> > >     P15 P14 P13 P12 P11 P10  P9  P8  P7  P6  P5  P4  P3  P2  P1  P0 =
=20
> >
> > Hi Geert,
> >
> > does this mean the display hardware emits even rows from left to right
> > and odd rows from right to left? =20
>=20
> No, it means I should have my morning coffee first, and remove all
> temporary cruft before pressing send :-(
>=20
> The above paragraph should have read:
>=20
>     Display (16 pixels):
>=20
>         P0  P1  P2  P3  P4  P5  P6  P7  P8  P9 P10 P11 P12 P13 P14 P15
>=20
> > I'm guessing P stands for "pixel". =20
>=20
> Exactly.
>=20
> > > Memory:
> > >
> > >   1 bpp (MSB first):
> > >
> > >               bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
> > >               ---- ---- ---- ---- ---- ---- ---- ----
> > >       byte 0:   P0   P1   P2   P3   P4   P5   P6   P7
> > >       byte 1:   P8   P9  P10  P11  P12  P13  P14  P15
> > >
> > >   1 bpp (LSB first):
> > >
> > >               bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
> > >               ---- ---- ---- ---- ---- ---- ---- ----
> > >       byte 0:   P7   P6   P5   P4   P3   P2   P1   P0
> > >       byte 1:  P15  P14  P13  P12  P11  P10   P9   P8
> > >
> > >   2 bpp (MSB first):
> > >
> > >               bits7-6 bits5-4 bits3-2 bits1-0
> > >               ------- ------- ------- -------
> > >       byte 0:    P0      P1      P2      P3
> > >       byte 1:    P4      P5      P6      P7
> > >       byte 2:    P8      P9     P10     P11
> > >       byte 3:   P12     P13     P14     P15
> > >
> > >   2 bpp (LSB first):
> > >
> > >               bits7-6 bits5-4 bits3-2 bits1-0
> > >               ------- ------- ------- -------
> > >       byte 0:    P3      P2      P1      P0
> > >       byte 1:    P7      P6      P5      P4
> > >       byte 2:   P11     P10      P9      P8
> > >       byte 3:   P15     P14     P13     P12
> > >
> > >   4 bpp (MSB first):
> > >
> > >               bits7-4 bits3-0
> > >               ------- -------
> > >       byte 0:    P0      P1
> > >       byte 1:    P2      P3
> > >       byte 2:    P4      P5
> > >       byte 3:    P6      P7
> > >       byte 4:    P8      P9
> > >       byte 5:   P10     P11
> > >       byte 6:   P12     P13
> > >       byte 7:   P14     P15
> > >
> > >   4 bpp (LSB first):
> > >
> > >               bits7-4 bits3-0
> > >               ------- -------
> > >       byte 0:    P1      P0
> > >       byte 1:    P3      P2
> > >       byte 2:    P5      P4
> > >       byte 3:    P7      P6
> > >       byte 4:    P9      P8
> > >       byte 5:   P11     P10
> > >       byte 6:   P13     P12
> > >       byte 7:   P15     P14 =20
> >
> > I think I can guess what you meant there, and it looks understandable
> > to me. These tables are actually very clear, and leave only one thing
> > undefined: when multiple bits form a pixel, in which order do the bits
> > form the value. I recall you said fbdev allows for both orderings but
> > only one order is ever used if I understood right. =20
>=20
> Indeed.  The third ordering is the ordering of the bits in a pixel.
> As fb_bitfield.msb_right is always false, no hardware ever supported by
> fbdev used the other ordering, so we only have to care about:
>=20
>    1 bpp: P =3D [ bitN ]
>    2 bpp: P =3D [ bitN bitN-1 ]
>    4 bpp: P =3D [ bitN bitN-1 bitN-2 bitN-3 ]

Excellent!

> > > > Also, when drm_fourcc.h is describing pixel formats, it needs to
> > > > consider only how a little-endian CPU accesses them. That's how pix=
el
> > > > data in memory is described. Display hardware plays no part in that.
> > > > It is the driver's job to expose the pixel formats that match displ=
ay
> > > > hardware behaviour. =20
> > >
> > > But if the "CPU format" does not match the "display support",
> > > all pixel data must be converted? =20
> >
> > Of course. If the driver author does not want to convert pixel data in
> > flight, then the author should not let the driver expose a format that
> > needs conversion. =20
>=20
> ... in which case we need a DRM fourcc code for the format?

Yes. You can define any new formats you need as long as the format
definition does not depend on (is not affected/modified by) CPU
endianess or any other CPU or display hardware property. I believe this
is the convention used with drm_fourcc.

If the format wanted by display hardware depends on something, then you
need all relevant pixel formats defined and choose at build or driver
initialisation time which ones to expose.

> BTW, Atari and Amiga use bitplanes for bpp <=3D 8, so they need
> conversion anyway.

Right, that's probably the most reasonable approach. If you really
wanted to expose bitplanes, I could imagine that some new format
modifiers could achieve that.


Thanks,
pq

--Sig_/SFzjUrs7yMIudHjHrw1WOsK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIwbvcACgkQI1/ltBGq
qqfAhg/8DQHUJDndPyiDXRxGH58HuwSov2bZfYkofTV1pu9CimZO4M13RoulDiDf
tviAxh0T5zeMavytqQFRyfFskNkcuom/TVGIiZrXaIh4rFpTM1G8tL+bxfkO1/Cc
jnmZy8KV8mDUc/GRCx+QkTNHZL5Ke47b/P357z2kSWYhU9pc+kUSDawvxJdiP/K7
iqFPU0jodTISZdsXgN0D4R7ramOxstPU+UVXI1lXvJrvRR6draXcEcn2Ou573ylU
nHNLky3DRGOApW8gTy6ghUu1xW7zGwAzYIcfUK+bVnY7kBDgvflrQAwg9Rxt9MFF
rdMMKZwfXqL9OL2k7VxT2smLjojVsKM4KJYcapettYqfvGTu13BMW2ot4jOwH2iM
XGa/7bX5B6KOrcrsTULym+bbG4RqiDkpEcpFrNNWXbBRSn+ALG+KOESKfCy2GPIu
IZ9hb/sQDZQSy/YT+mnD7/XZ8WbK13+htMTedDX9LsHOwlIhjK5HsfLqbVMMTQX+
+ENshXPFDDLd79At+Zb9HEUrXyER/2Sb96rgfwjUPy8BoTMLHzdLwC+dHJwGbrI9
0HyJevyLA8h+DnhFJEIWRp4kN5CgEtC03SmHccSYAjY0wWaCYsE6XgWBKdP8A2tN
QTEbByH3u+KjDDeQQZHhfCGqMfl9KPn+l8N2DhTE310nwXj4VaY=
=PJQN
-----END PGP SIGNATURE-----

--Sig_/SFzjUrs7yMIudHjHrw1WOsK--
