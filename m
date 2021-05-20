Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E7389F52
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3189B6F381;
	Thu, 20 May 2021 07:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502D36F380;
 Thu, 20 May 2021 07:58:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x19so23134515lfa.2;
 Thu, 20 May 2021 00:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Ztf4fG3go4pm6O5hMpKy38HSIWUlz9iqc0r333NE9fQ=;
 b=slC88OHO4mwnrW9AfLCA9z1uEPWGQC/5yLI3DmMl84kIA5awpqjSN91gtkU9K4f/H+
 TIDfAAaPl0LuzYwPQV6YadmfnqVWIAjuPPs4snUfGG9dI3/g+EsmO71bJ/jh80kF0sJ0
 kQcX1Hetvn85F4suC5Oe6UCRJw4uleoMbUwAucUmIMK9iqh2cCRLco1GHwvKMxiP9hbL
 hcq2WcyPG55YX6PSHx0fyMcaH4hh0gVSkaf+Cu3z1RU45zsHDzCJc4/Ij0O6uel4LLRX
 d94Ldi1amEGatqlxbaQuHdOp5LHZaz2pjH1BewTLkDNcIIti7BJHS/exOCspu6/eSfX9
 CBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Ztf4fG3go4pm6O5hMpKy38HSIWUlz9iqc0r333NE9fQ=;
 b=snuAJvQ3O7RJTD1K6KEHl2R1M8oM1Kzh2gmiNN3y0Oz+Rla3Pw2kYRIA1cLVQjv/Ly
 7mXyaHiLHRYJFg7pMofU4/1emuaph2U1FmyOqxXuHh27eXpkR2UHpZ3GG8MSXRn9DcAK
 KDfRJ2AmP8Zq5Av4+M6cvfSTmbFMC64NJQFcI42jGi45xjG79PXjEBlj/uWO9mdHu7ED
 S4PVQk7zVBvVe3FMxWkR4iMS9mClv1j5oUXrvd54p4qdab7tQ4CpnOb7T0ZfuoAGcVn/
 Dp2zmJHJMwrSVPgx2nRH4nif0A/WPhwipsMBWS8iWibXfosgIwJJ7/b7wByOI60yPJZ5
 8PWQ==
X-Gm-Message-State: AOAM530TyXg+rkN/ODMZZnU/OsqbOjLb93W2PHiBT/xua2kOPsJYMANO
 HzjToRpEdCQEA66Bu+A6XAg=
X-Google-Smtp-Source: ABdhPJyv2TtDkGTqIrn4pkdWXB+nVoCr/LdpTXAOp/BvuSfa+3PDB8zlGhTGgi3WU1LX2RPm/h3p4Q==
X-Received: by 2002:ac2:544f:: with SMTP id d15mr2505747lfn.465.1621497509657; 
 Thu, 20 May 2021 00:58:29 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y24sm197087lfg.232.2021.05.20.00.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 00:58:29 -0700 (PDT)
Date: Thu, 20 May 2021 10:58:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Werner
 Sembach <wse@tuxedocomputers.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <20210520105826.7659a49a@eldfell>
In-Reply-To: <YKUXbwkUIwvO/OqK@intel.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <YJvSUCCPvWz7y/r7@intel.com> <20210519123405.4d3218a7@eldfell>
 <YKUXbwkUIwvO/OqK@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JM4T.u/0gZTQJI0lx_jyo8a"; protocol="application/pgp-signature"
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/JM4T.u/0gZTQJI0lx_jyo8a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 19 May 2021 16:49:35 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, May 19, 2021 at 12:34:05PM +0300, Pekka Paalanen wrote:
> > On Wed, 12 May 2021 16:04:16 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote: =20
> > > > Hello,
> > > >=20
> > > > In addition to the existing "max bpc", and "Broadcast RGB/output_cs=
c" drm properties I propose 4 new properties:
> > > > "preferred pixel encoding", "active color depth", "active color ran=
ge", and "active pixel encoding"
> > > >=20
> > > >=20
> > > > Motivation:
> > > >=20
> > > > Current monitors have a variety pixel encodings available: RGB, YCb=
Cr 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
> > > >=20
> > > > In addition they might be full or limited RGB range and the monitor=
s accept different bit depths.
> > > >=20
> > > > Currently the kernel driver for AMD and Intel GPUs automatically co=
nfigure the color settings automatically with little
> > > > to no influence of the user. However there are several real world s=
cenarios where the user might disagree with the
> > > > default chosen by the drivers and wants to set his or her own prefe=
rence.
> > > >=20
> > > > Some examples:
> > > >=20
> > > > 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of col=
or information, some screens might look better on one
> > > > than the other because of bad internal conversion. The driver curre=
ntly however has a fixed default that is chosen if
> > > > available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to =
change this currently is by editing and overloading
> > > > the edid reported by the monitor to the kernel.
> > > >=20
> > > > 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. S=
ome hardware might report that it supports the higher
> > > > port clock, but because of bad shielding on the PC, the cable, or t=
he monitor the screen cuts out every few seconds when
> > > > RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just w=
ork fine without changing hardware. The drivers
> > > > currently however always default to the "best available" option eve=
n if it might be broken.
> > > >=20
> > > > 3. Some screens natively only supporting 8-bit color, simulate 10-B=
it color by rapidly switching between 2 adjacent
> > > > colors. They advertise themselves to the kernel as 10-bit monitors =
but the user might not like the "fake" 10-bit effect
> > > > and prefer running at the native 8-bit per color.
> > > >=20
> > > > 4. Some screens are falsely classified as full RGB range wile they =
actually use limited RGB range. This results in
> > > > washed out colors in dark and bright scenes. A user override can be=
 helpful to manually fix this issue when it occurs.
> > > >=20
> > > > There already exist several requests, discussion, and patches regar=
ding the thematic:
> > > >=20
> > > > - https://gitlab.freedesktop.org/drm/amd/-/issues/476
> > > >=20
> > > > - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
> > > >=20
> > > > - https://lkml.org/lkml/2021/5/7/695
> > > >=20
> > > > - https://lkml.org/lkml/2021/5/11/416
> > > >  =20
> >=20
> > ...
> >  =20
> > > > Adoption:
> > > >=20
> > > > A KDE dev wants to implement the settings in the KDE settings GUI:
> > > > https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
> > > >=20
> > > > Tuxedo Computers (my employer) wants to implement the settings desk=
top environment agnostic in Tuxedo Control Center. I
> > > > will start work on this in parallel to implementing the new kernel =
code.   =20
> > >=20
> > > I suspect everyone would be happier to accept new uapi if we had
> > > multiple compositors signed up to implement it. =20
> >=20
> > I think having Weston support for these would be good, but for now it
> > won't be much of an UI: just weston.ini to set, and the log to see what
> > happened.
> >=20
> > However, knowing what happened is going to be important for color
> > calibration auditing:
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> >=20
> > Yes, please, very much for read-only properties for the feedback part.
> > Properties that both userspace and kernel will write are hard to deal
> > with in general.
> >=20
> > Btw. "max bpc" I can kind of guess that conversion from framebuffer
> > format to the wire bpc happens automatically and only as the final
> > step, =20
>=20
> Well, there could be dithering and whatnot also involved. So it's
> not super well specified atm either.

I tend to forget that dithering is a thing. I guess it could be
temporal and/or spatial depending on hardware?

> > but "Broadcast RGB" is more complicated: is the output from the
> > abstract pixel pipeline sent as-is and "Broadcast RGB" is just another
> > inforframe bit to the monitor, or does "Broadcast RGB" setting actually
> > change what happens in the pixel pipeline *and* set infoframe bits? =20
>=20
> It does indeed compress the actual pixel data. There was once a patch
> porposed to introduce a new enum value that only sets the infoframe and
> thus would allow userspace to pass through already limited range data.
> Shouldn't be hard to resurrect that if needed.

Right, thanks for confirming. I mentioned this mostly for Werner to
point out that existing properties might do surprising things.
Especially if one has looked at HDR related properties which only set
infoframe bits and nothing more.

> > My vague recollection is that framebuffer was always assumed to be in
> > full range, and then if "Broadcast RGB" was set to limited range, the
> > driver would mangle the pixel pipeline to convert from full to limited
> > range. This means that it would be impossible to have limited range
> > data in a framebuffer, or there might be a double-conversion by
> > userspace programming a LUT for limited->full and then the driver
> > adding full->limited. I'm also confused how full/limited works when
> > framebuffer is in RGB/YCbCr and the monitor wire format is in RGB/YCbCr
> > and there may be RGB->YCbCR or YCbCR->RGB conversions going on - or
> > maybe even FB YCbCR -> RGB -> DEGAMMA -> CTM -> GAMMA -> YCbCR.
> >=20
> > I wish someone drew a picture of the KMS abstract pixel pipeline with
> > all the existing KMS properties in it. :-) =20
>=20
> Here's an ugly one for i915:
>=20
>     (input RGB vs. YCbCr?)
> [FB] -> [YCbCr?] -> [YCbCr->RGB conversion     ] -> [plane blending] -> .=
..
>       |             [YCbCr color range/encoding] |
>       \ [RGB?] ----------------------------------/
>=20
>                                            (output RGB limited vs. RGB fu=
ll vs. YCbCr?)
> ... -> [DEGAMMA_LUT] -> [CTM] -> [GAMMA_LUT] -> [YCbCr?] -> [RGB->YCbCr c=
onversion      ] -> [to port]
>                                               |             [always BT.70=
9/limited range]
>                                               \ [RGB?] -> ...
>=20
> ... -> [RGB passthrough             ] -> [to port]
>      | [Broadcast RGB=3Dfull or       ]
>      | [Broadcast RGB=3Dauto + IT mode]
>      |
>      \ [RGB full->limited conversion] -> [to port]
>        [Broadcast RGB=3Dlimited or    ]
>        [Broadcast RGB=3Dauto + CE mode]
>=20
> I guess having something like that in the docs would be nice. Not sure
> if there's a way to make something that looks decent for html/etc.

It would be super useful indeed.


Thanks,
pq

--Sig_/JM4T.u/0gZTQJI0lx_jyo8a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCmFqIACgkQI1/ltBGq
qqfN4g//VzHs7kX1GmLPY7Ou3CRJaj0CyDzpwLN0djwSFXNvbQgSCDttMy+rz+UT
e/pk3lLTY79o8dWPcbFTM/QM6BQXLTS7OtiJfLhv4eNIU5t6Edl1w2QcTh9A6MKS
bRjC4Ju3uzSL3nczmYr55Gwy1Jodt2iM0bV80Dcbi724x6v18dXbiyvP7O/vzFOJ
Km12/kE8TgNUqURVmbX6u7SubqTAZx7hbzKTQB0OOofC6F0K1brH9c/jHIr4V4cB
jkqJCMttJ+iwXo6PeqRxMw2gyu4L/9qQay+uPDonzhpQlY51v77JftCsNBO0Yrex
VVDRRbpRTFPMt+lTvzTxWy8XwR8rXy2KHVH6w02EsplbV/62Fz9VbO1NmGYiUlYb
B4gZDgUOj1UnghRiCbW5DYta66h3o+w6sDJmJLNFwXUdqw2nvYAK8fSEtqWhV9zQ
I3U12y6GsoFyruVfoFSas5zYe3kcxArwYZVq/8DUTFvGBoqLyzLU10bpQcMtoVAH
2b1FeldcRzMZCvwGxCgO2ShucTiJZ/0ZNdeSKkfMy4u9WWUuPRcGIqwqPrs0Mx3y
Nf71Pyvj8Q5Cz3LhtyCLWi5ldN+DSO5YS6hxiskwv/VLIgR4rDuRwwYWimnm/D5g
VeF159yw20v6wQ75cNIJZfSwI5QVcnWu+l1y2FOH173meXJEk38=
=KBhL
-----END PGP SIGNATURE-----

--Sig_/JM4T.u/0gZTQJI0lx_jyo8a--
