Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7714D96A2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 09:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59A10E7B7;
	Tue, 15 Mar 2022 08:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4AC10E7B6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 08:46:00 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id o6so25455570ljp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=haMOXrxpicM2XmywP7XAKAqLFk8f/h56BBMGPfa8QHM=;
 b=GfQ0osm33Fhk/Cx3Bo54rjfxBi31DXQiWfVJXfemEVmWXIy+OGuL6itb0hLogRlMAY
 LHmJVtlhBAMlfo4br4H4sBBFJuBTLDIkoBuOKQBqxVcIgYHd1q9dsfykFt4tGFfkguoU
 V1vrfvRZpaYxe8GziNzunKXilP8e6LzsyQ+lPtVkl9LPf5kT2AJlU1u78rU+6Dc8uqzl
 b52G9KIPxqabpZlmJOivlPfZXNiTd5LusUMXeTyonP3ngwQfQAyeKxkuhd8dNzaAkgpU
 6BJAfCPoJobLbpBzsMDKrebQUvY7PqayHG/ImnCDP2WX0vQIAo2KMYlbv2aMPkmuuXFk
 HIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=haMOXrxpicM2XmywP7XAKAqLFk8f/h56BBMGPfa8QHM=;
 b=66Br/4hfi9EU9iBK1kWRazglqI86dlG8uuNjBsKBOPmXV/iNRym4t7bwPwAebR4Hea
 Dhke1CGwcUx0uN19as1DD3KsoKYbqZLBtbXsNQ0i4sKBT+Og2Qbg3pE/PSRsxRRNC+EH
 0eGOhOC1yINSdV0E6zE6AqJgFV62CfLYtAnY1xhgUmiCfelIcwvTJlDM1Mjn9TNjt8Zk
 HjJq6as/HKXEBPHZrYvLBRKN0eg/68BHdLah07h/XsNuO50X9IpUKY582+ePej4BtoYO
 IcCc3wqI427LQc+QOJDJRamO0BmQI7FATWXBDpBuKtdOijiahN5pBXOSctl2H23UborR
 2ksA==
X-Gm-Message-State: AOAM531faSk6EqG/AszZ5wvXqfCjmHBXzvyX/AMfg6KZriKhUXba1bR3
 2tr5+k4q9UkWBApjSVYrNNM=
X-Google-Smtp-Source: ABdhPJywuJfvLLsJ44JxQXxbZa3h6gCxipa9ZaOhmL8JvcDOVtNBkDXRsq67EappedqH2vPI4Fa9cA==
X-Received: by 2002:a2e:8403:0:b0:248:31d:3e35 with SMTP id
 z3-20020a2e8403000000b00248031d3e35mr16107402ljg.445.1647333958051; 
 Tue, 15 Mar 2022 01:45:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 d26-20020a056512321a00b0044867936e9csm2898972lfe.18.2022.03.15.01.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:45:57 -0700 (PDT)
Date: Tue, 15 Mar 2022 10:45:54 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
Message-ID: <20220315104554.1961d62d@eldfell>
In-Reply-To: <CAMuHMdVU=JKwEn-=Wf3CYObtaLt2T7NmWrXUwdPHdvNsbgge=g@mail.gmail.com>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
 <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
 <20220314170539.17400f93@eldfell>
 <CAMuHMdVj8wxAVbcov1wFsgt_knMkcySBH8nMoKjyr=G+mLQmjQ@mail.gmail.com>
 <1f915fcc-1d95-99d1-c7b7-dc4e3b49e09f@linux-m68k.org>
 <20220315093250.71352a56@eldfell>
 <CAMuHMdVU=JKwEn-=Wf3CYObtaLt2T7NmWrXUwdPHdvNsbgge=g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vI_Pac=RFEkBtKEOIWIsjeU";
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

--Sig_/vI_Pac=RFEkBtKEOIWIsjeU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Mar 2022 08:51:31 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Pekka,
>=20
> On Tue, Mar 15, 2022 at 8:33 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> > On Tue, 15 Mar 2022 09:15:08 +1100 (AEDT)
> > Finn Thain <fthain@linux-m68k.org> wrote: =20
> > > On Mon, 14 Mar 2022, Geert Uytterhoeven wrote: =20
> > > > On Mon, Mar 14, 2022 at 4:05 PM Pekka Paalanen <ppaalanen@gmail.com=
> wrote: =20
> > > > > On Mon, 14 Mar 2022 14:30:18 +0100
> > > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote: =20
> > > > > > On Mon, Mar 7, 2022 at 9:53 PM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote: =20
> > > > > > > Introduce fourcc codes for color-indexed frame buffer formats=
 with
> > > > > > > two, four, and sixteen colors, and provide a mapping from bit=
 per
> > > > > > > pixel and depth to fourcc codes.
> > > > > > >
> > > > > > > As the number of bits per pixel is less than eight, these rel=
y on
> > > > > > > proper block handling for the calculation of bits per pixel a=
nd
> > > > > > > pitch.
> > > > > > >
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org> =20
> > > > > > =20
> > > > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > > @@ -99,7 +99,10 @@ extern "C" {
> > > > > > >  #define DRM_FORMAT_INVALID     0
> > > > > > >
> > > > > > >  /* color index */
> > > > > > > -#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' =
') /* [7:0] C */
> > > > > > > +#define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' =
') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> > > > > > > +#define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' =
') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
> > > > > > > +#define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' =
') /* [7:0] C0:C1 4:4 two pixels/byte */
> > > > > > > +#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' =
') /* [7:0] C 8 one pixel/byte */
> > > > > > >
> > > > > > >  /* 8 bpp Red */
> > > > > > >  #define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' =
') /* [7:0] R */ =20
> > > > > >
> > > > > > After replying to Ilia's comment[1], I realized the CFB drawing
> > > > > > operations use native byte and bit ordering, unless
> > > > > > FBINFO_FOREIGN_ENDIAN is set.
> > > > > > While Amiga, Atari, and Sun-3 use big-endian bit ordering,
> > > > > > e.g. Acorn VIDC[2] uses little endian, and SH7760[3] is configu=
rable
> > > > > > (sh7760fb configures ordering to match host order).
> > > > > > BTW, ssd130{7fb,x}_update_rect() both assume little-endian, so I
> > > > > > guess they are broken on big-endian.
> > > > > > Fbtest uses big-endian bit ordering, so < 8 bpp is probably bro=
ken
> > > > > > on little-endian.
> > > > > >
> > > > > > Hence the above should become:
> > > > > >
> > > > > >     #define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', '=
 ') /*
> > > > > > [7:0] C7:C6:C5:C4:C3:C2:C1:C0 1:1:1:1:1:1:1:1 eight pixels/byte=
 */
> > > > > >     #define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', '=
 ') /*
> > > > > > [7:0] C3:C2:C1:C0 2:2:2:2 four pixels/byte */
> > > > > >     #define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', '=
 ') /*
> > > > > > [7:0] C1:C0 4:4 two pixels/byte */
> > > > > >
> > > > > > The same changes should be made for DRM_FORMAT_[RD][124].
> > > > > >
> > > > > > The fbdev emulation code should gain support for these with and=
 without
> > > > > > DRM_FORMAT_BIG_ENDIAN, the latter perhaps only on big-endian pl=
atforms?
> > > > > >
> > > > > > [1] https://lore.kernel.org/r/CAKb7UvgEdm9U=3D+RyRwL0TGRfA_Qc7N=
bhCWoZOft2DKdXggtKYw@mail.gmail.com/
> > > > > > [2] See p.30 of the VIDC datasheet
> > > > > >     http://chrisacorns.computinghistory.org.uk/docs/Acorn/Misc/=
Acorn_VIDC_Datasheet.pdf
> > > > > > [3] See p.1178 of the SH7660 datasheet
> > > > > >     https://datasheet.octopart.com/HD6417760BL200AV-Renesas-dat=
asheet-14105759.pdf =20
> > > > >
> > > > > why would CPU endianess affect the order of bits in a byte? =20
> > > >
> > > > It doesn't, but see below.
> > > > =20
> > > > > Do you mean that bit 0 one machine is (1 << 0), and on another ma=
chine
> > > > > bit 0 is (1 << 7)? =20
> > > >
> > > > No, I mean that in case of multiple pixels per byte, the display
> > > > hardware pumps out pixels to the CRTC starting from either the MSB
> > > > or the LSB of the first display byte.  Which order depends on the
> > > > display hardware, not on the CPU.
> > > > =20
> > > > > In C, we have only one way to address bits of a byte and that is =
with
> > > > > arithmetic. You cannot take the address of a bit any other way, c=
an you?
> > > > >
> > > > > Can we standardise on "bit n of a byte is addressed as (1 << n)"?=
 =20
> > > >
> > > > BIT(n) in Linux works the same for little- and big-endian CPUs.
> > > > But display hardware may use a different bit order. =20
> > >
> > > Perhaps some of this confusion could be avoided if you describe the
> > > problem in terms of the sequence of scan-out of pixels, rather than in
> > > terms of the serialization of bits. The significance of bits within e=
ach
> > > pixel and the ordering of pixels within each memory word are independ=
ent,
> > > right? =20
> >
> > Yes, that might help. =20
>=20
> Display:
>=20
>      P0  P1  P2  P3  P4  P5  P6  P7  P8  P9 P10 P11 P12 P13 P14 P15
>=20
>     P15 P14 P13 P12 P11 P10  P9  P8  P7  P6  P5  P4  P3  P2  P1  P0

Hi Geert,

does this mean the display hardware emits even rows from left to right
and odd rows from right to left?

I suppose that would practically eliminate the horizontal blanking
period in CRT timings. If so, I think that might be best represented as
a new format modifier.

I'm guessing P stands for "pixel".

>=20
> Memory:
>=20
>   1 bpp (MSB first):
>=20
>               bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
>               ---- ---- ---- ---- ---- ---- ---- ----
>       byte 0:   P0   P1   P2   P3   P4   P5   P6   P7
>       byte 1:   P8   P9  P10  P11  P12  P13  P14  P15
>=20
>   1 bpp (LSB first):
>=20
>               bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0
>               ---- ---- ---- ---- ---- ---- ---- ----
>       byte 0:   P7   P6   P5   P4   P3   P2   P1   P0
>       byte 1:  P15  P14  P13  P12  P11  P10   P9   P8
>=20
>   2 bpp (MSB first):
>=20
>               bits7-6 bits5-4 bits3-2 bits1-0
>               ------- ------- ------- -------
>       byte 0:    P0      P1      P2      P3
>       byte 1:    P4      P5      P6      P7
>       byte 2:    P8      P9     P10     P11
>       byte 3:   P12     P13     P14     P15
>=20
>   2 bpp (LSB first):
>=20
>               bits7-6 bits5-4 bits3-2 bits1-0
>               ------- ------- ------- -------
>       byte 0:    P3      P2      P1      P0
>       byte 1:    P7      P6      P5      P4
>       byte 2:   P11     P10      P9      P8
>       byte 3:   P15     P14     P13     P12
>=20
>   4 bpp (MSB first):
>=20
>               bits7-4 bits3-0
>               ------- -------
>       byte 0:    P0      P1
>       byte 1:    P2      P3
>       byte 2:    P4      P5
>       byte 3:    P6      P7
>       byte 4:    P8      P9
>       byte 5:   P10     P11
>       byte 6:   P12     P13
>       byte 7:   P14     P15
>=20
>   4 bpp (LSB first):
>=20
>               bits7-4 bits3-0
>               ------- -------
>       byte 0:    P1      P0
>       byte 1:    P3      P2
>       byte 2:    P5      P4
>       byte 3:    P7      P6
>       byte 4:    P9      P8
>       byte 5:   P11     P10
>       byte 6:   P13     P12
>       byte 7:   P15     P14

I think I can guess what you meant there, and it looks understandable
to me. These tables are actually very clear, and leave only one thing
undefined: when multiple bits form a pixel, in which order do the bits
form the value. I recall you said fbdev allows for both orderings but
only one order is ever used if I understood right.

> > Also, when drm_fourcc.h is describing pixel formats, it needs to
> > consider only how a little-endian CPU accesses them. That's how pixel
> > data in memory is described. Display hardware plays no part in that.
> > It is the driver's job to expose the pixel formats that match display
> > hardware behaviour. =20
>=20
> But if the "CPU format" does not match the "display support",
> all pixel data must be converted?

Of course. If the driver author does not want to convert pixel data in
flight, then the author should not let the driver expose a format that
needs conversion.


Thanks,
pq

--Sig_/vI_Pac=RFEkBtKEOIWIsjeU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIwUkIACgkQI1/ltBGq
qqcfFg//RyTkAJFiAFknFvNsFj/AoVl7Oztr2cIdV3P1Iy5TMXkGUFgF6Lkf4ibM
7VdTy2OIK0euqBmJgFE6T2h88d0ZuU5YvekNgeUtJiVJstkO5UwVD3RBUEfKWjyA
+J8Ux6XUbuK7QhgQ9Cn4LTp6mq1Y035mrOz4NKSTUb2+HSIUCMorB7NthkMINhKB
Qna87k0bPEBnwVBPmZsOgbPDRWdPDy9OSXnVTBTfk/x4K1utOo8g/Ttu8brJdfpI
mWZxH8C9dtnmsGVRpngrLwHHGOY+/DcxQdHGWQRu+vCNuwG0cUsZE2e7p9KHuAeB
W7e9GfkgRgFzzuKX2WyrtCNDOQAkveWgstvRqKXsy3l/eUGhOehFvX1LbbLngKwl
P0a2mcZpg4exEcyu88z9k8QqK0hKzY+A4ekxMUYk7MfDDi3csiEkibJpOda7Tyz9
C2N/G67qB01yFW7HFjmsDmqPg07Gd3LYQYtaHFekBGf1KU4DYOIZ9aDowCSZa4b+
Yr6AQew586xUw4HiZpyfZk2++kwFux64+FaiScN/jL6X71E1wIa7y4IqfKRQb11V
KwNh2smSFQC9ArdCmrJLjWIygkzE1uslonvrehqvl9g+qx8+fg2FJQJwUUYXnEsv
VYNmrVPxje4Ngo8R8hwGGmlGHoMVi1AN3eBoctuu1CDnw3gQ5o8=
=k+m2
-----END PGP SIGNATURE-----

--Sig_/vI_Pac=RFEkBtKEOIWIsjeU--
