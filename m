Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE034D87B9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 16:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FE110E96C;
	Mon, 14 Mar 2022 15:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FAF10E969
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 15:05:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id n19so27656075lfh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=CxKS4vf3LBZ0P9NuD5cqIWteJHioyMZPeyVmyPljpRw=;
 b=oa3EGNgEUsDhIWXUBLOAY449V2R/hTnXlm8IUsWlSGouPyQo3Jjgb8U11sEl8tbPKU
 CS0W/TVZFNk9ow7xMvEcGIM9OfjQ/urSTMGQHmK/PcEnJX/Kgqr5Xqx3tv6HRoGBy+vW
 Vtqpuvw+wc5VwQc6covh8nFsrDpUiXctRmGfBF7s6oDMHuAy+h7TFJYbuZc6vlvxQc8U
 ImaCGvY7emJ0ijc3xtjqVgqvzOH8FXm61hLqILjlteIxSPm0VwQfqIVkeijVqca3y7uu
 7LIIOXJPwUfw4JtC8RNEX2XSGzjTGPBKUy8rYp3TguX6Shn7+6WnG52/OUUHz7KYJV1U
 29JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=CxKS4vf3LBZ0P9NuD5cqIWteJHioyMZPeyVmyPljpRw=;
 b=OCOwlml+JGJyxDCOPsVh7AdvZ2gO6FoTCpb3x/aquTISEgCxDW7DvD85mVX3C50p/0
 bp40hr3DfhQ15+sHOK7FFjq3lkZJjJwTdgnFl3HeLQFXqR5FfQnMi7RvNg5oLtcarJDG
 AwTf+q9A445Izv5PbbMdk+gjKtbCZi3CRbNJMg0PvRvwLzDbPj9vfAhP0Tzx2kuPHUEL
 W/rOUirlHzPU+rZrsAxFQd/P4j7t0iW4dZYAQ0wO8zCQ8G1M03QfbuTER373q/oa+XhE
 w1mZyOt/eCl0Q3o7kVVANdce35psbvku/L4PWqVRJuRvux6K8Iheg2hI65L8Xc9jrRw6
 oYdA==
X-Gm-Message-State: AOAM530ewJ5zbolukmnTFXB0Gvd4GMuWirDmtKD3AZgSwRapicVoGhRy
 GnKGp96De92ergiF/Mo6+y8=
X-Google-Smtp-Source: ABdhPJympt8IztXzbSAF44xWmW5WNMlPlHXRGdCNPqrccwiPz0YDLyvQ93ZECixu5gb0lAn94tT46Q==
X-Received: by 2002:a19:430a:0:b0:445:b7f5:de35 with SMTP id
 q10-20020a19430a000000b00445b7f5de35mr13423435lfa.41.1647270350388; 
 Mon, 14 Mar 2022 08:05:50 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t2-20020a2e2d02000000b00244dc8ba5absm4017773ljt.117.2022.03.14.08.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 08:05:50 -0700 (PDT)
Date: Mon, 14 Mar 2022 17:05:39 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
Message-ID: <20220314170539.17400f93@eldfell>
In-Reply-To: <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
 <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m.YG_1yyujXTxoe21w.WtAn";
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/m.YG_1yyujXTxoe21w.WtAn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Mar 2022 14:30:18 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Mon, Mar 7, 2022 at 9:53 PM Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > Introduce fourcc codes for color-indexed frame buffer formats with two,
> > four, and sixteen colors, and provide a mapping from bit per pixel and
> > depth to fourcc codes.
> >
> > As the number of bits per pixel is less than eight, these rely on proper
> > block handling for the calculation of bits per pixel and pitch.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org> =20
>=20
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -99,7 +99,10 @@ extern "C" {
> >  #define DRM_FORMAT_INVALID     0
> >
> >  /* color index */
> > -#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0=
] C */
> > +#define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /* [7:0=
] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> > +#define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /* [7:0=
] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
> > +#define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /* [7:0=
] C0:C1 4:4 two pixels/byte */
> > +#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0=
] C 8 one pixel/byte */
> >
> >  /* 8 bpp Red */
> >  #define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' ') /* [7:0=
] R */ =20
>=20
> After replying to Ilia's comment[1], I realized the CFB drawing
> operations use native byte and bit ordering, unless
> FBINFO_FOREIGN_ENDIAN is set.
> While Amiga, Atari, and Sun-3 use big-endian bit ordering,
> e.g. Acorn VIDC[2] uses little endian, and SH7760[3] is configurable
> (sh7760fb configures ordering to match host order).
> BTW, ssd130{7fb,x}_update_rect() both assume little-endian, so I
> guess they are broken on big-endian.
> Fbtest uses big-endian bit ordering, so < 8 bpp is probably broken
> on little-endian.
>=20
> Hence the above should become:
>=20
>     #define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /*
> [7:0] C7:C6:C5:C4:C3:C2:C1:C0 1:1:1:1:1:1:1:1 eight pixels/byte */
>     #define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /*
> [7:0] C3:C2:C1:C0 2:2:2:2 four pixels/byte */
>     #define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /*
> [7:0] C1:C0 4:4 two pixels/byte */
>=20
> The same changes should be made for DRM_FORMAT_[RD][124].
>=20
> The fbdev emulation code should gain support for these with and without
> DRM_FORMAT_BIG_ENDIAN, the latter perhaps only on big-endian platforms?
>=20
> [1] https://lore.kernel.org/r/CAKb7UvgEdm9U=3D+RyRwL0TGRfA_Qc7NbhCWoZOft2=
DKdXggtKYw@mail.gmail.com/
> [2] See p.30 of the VIDC datasheet
>     http://chrisacorns.computinghistory.org.uk/docs/Acorn/Misc/Acorn_VIDC=
_Datasheet.pdf
> [3] See p.1178 of the SH7660 datasheet
>     https://datasheet.octopart.com/HD6417760BL200AV-Renesas-datasheet-141=
05759.pdf

Hi Geert,

why would CPU endianess affect the order of bits in a byte?

Do you mean that bit 0 one machine is (1 << 0), and on another machine
bit 0 is (1 << 7)?

In C, we have only one way to address bits of a byte and that is with
arithmetic. You cannot take the address of a bit any other way, can you?

Can we standardise on "bit n of a byte is addressed as (1 << n)"?

I don't mind in which order the pixels are inside a byte, as long as it
doesn't change by CPU endianess. If you need both directions, then use
two different drm_fourcc codes that do not change their meaning by CPU
endianess. Just like we have XRGB and BGRX formats.

I would not like to see DRM_FORMAT_BIG_ENDIAN used for this, it would
conflate a whole new concept into the mess that is little- vs.
big-endian.


Thanks,
pq

--Sig_/m.YG_1yyujXTxoe21w.WtAn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIvWcMACgkQI1/ltBGq
qqfXcQ//YRyfURp9d78SsBIIc7E+JMTInSnBi+DsN5ajonw6bUXBpcyhbo8aJG+p
68tYcUrLaoizXdL318OYH3bVjAfWEhuIjjsGPJ/iUptXmv1D+zEaIRI+h+aYcDcs
V310ZEYnBkEmG6aKSzwIjCFM8KoB+2oydLhDldQta8oAoIJ4gCED2ARFbpyS8k7H
kNPY9/lU1uUJdjLDcGChmmwwv1sAL8aXUUmmqYfEg4Dv7XzEi71FRYKJlYq7TuNC
lGbXZOoyha64DYQbuNiNL/eGSkporUlOdRQrOGMCWIPqNzm8/DrSRtPtNu5h+2Mv
4LJ/Y/Q57Seur9+Lu3HkXkkq11ET1F64a7FHPplj87XzwM0y3Kn/f+6Y2jJy9DEM
fcXZdv29ofEeXL1o43Pvka0UziTOALJLxLgNAhS47mNnIklBeihSlbIU3nez15oV
t3icfb6qdJ5Bkt9sG3vbcjuFf8+dPDMTUqruM7CoF4zrC+e22YVdxX7dXmNlsAzc
hhlmZAM+dCNN6w2lQoZIgl5rqTBGK8ruCtOl5G/lOjqOXxg/EBfHsSiSGvUsZWAz
WiO0jLJy/XdijASav+n5dRFQWSgrp8vjwzZbkRcwlb57sxlKd6BGN5/wmAMiCyu1
5V35MiBAGi45uGU+mVx0Y74j+HIag65ZaWMkN27VtjsCtYMf/xc=
=cv7k
-----END PGP SIGNATURE-----

--Sig_/m.YG_1yyujXTxoe21w.WtAn--
