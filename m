Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2976C3B149A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 09:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293D86E342;
	Wed, 23 Jun 2021 07:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D6B6E311;
 Wed, 23 Jun 2021 07:29:28 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p7so2491809lfg.4;
 Wed, 23 Jun 2021 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zB174TbizwNy5wMj+f9ETvsYEbvxjlvz6bIrqQ/dn4U=;
 b=TTkisLKxhasbjCeoTzqORU+mYDzBBo1XJuMD02oYkOzXuN2Ci2piV2Jm87BK8z0uwG
 WdtPlceumm02pZ+lzL74XjMV4aos2eDfX6MeM5huCSwPWXtVNIfiHF9YDgu0H+zv6XUD
 NIYHvqqtL0NYMoQba7fTeEiftrdepcxxIHQG8q1ozQrbG9r02kLlS42AkGrmbLwBiVGQ
 MLQnz4WjIwdX8iSLr3zDsgM5MZYTlWyjV+nnZ3DxPINmMB0tMEO/It4xMq7bNQndg6qF
 Uh6px7bP2LJY2jMgcQHgysrq3j57xOt7P7thj+5lPuxS6qcDKNOmKDiVUDM+wvB9wFIP
 CHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zB174TbizwNy5wMj+f9ETvsYEbvxjlvz6bIrqQ/dn4U=;
 b=m2jRk2qGL4JC5/Nmi2+TsQ8ieBf+AWmfdhy1+tX0AYejhhf4sPBANXLAKkflFZasuv
 Wcr+WXFmahhOOkHJUvB8xGFXa59ykyO51tUpcu+VEJ9wZYAPBh50yrhhVdF8kKlESIkQ
 rdqrruP2PAz98JwPWJ232GXXE8MKnC+LyCNO+nLw/CatmSVvDyAs403YMf6FNFQgZfMJ
 HUbxdLDZtqV8DGSIWF/MYWHB/f5vQR1ToEyVzMCC989tIUlmB2qB6JMU+DAxeXfgfLp/
 ffjZ9kaRzhfUb6WbXrv+lvQZQBVNfTNnkH15DKQ/lurvSJjWrWPeLx7tdebiXN6VxZFz
 i2PQ==
X-Gm-Message-State: AOAM530+25ShJ0f0ZnvppQyCJw1pPrlKoFrJ3Bqe+WOvq6+GYQiyPbhW
 0rNzKfHmH3Fr1APp3jMDwDk=
X-Google-Smtp-Source: ABdhPJwXRqNRLbe/b8KNqDgA6DHoFVJL+mi7x6hxgcMAICfmhm5Q9GKJ/j+60+XZEfRu7zw9ZBUOxQ==
X-Received: by 2002:a05:6512:36d8:: with SMTP id
 e24mr6000442lfs.8.1624433367298; 
 Wed, 23 Jun 2021 00:29:27 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c20sm224089ljn.29.2021.06.23.00.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 00:29:26 -0700 (PDT)
Date: Wed, 23 Jun 2021 10:29:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <20210623102923.70877c1a@eldfell>
In-Reply-To: <faf25c43-656d-bbb3-d2f2-8205353e19f6@tuxedocomputers.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <YJvSUCCPvWz7y/r7@intel.com> <20210519123405.4d3218a7@eldfell>
 <faf25c43-656d-bbb3-d2f2-8205353e19f6@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N=zhQF8suGGKy8v4UV.n13w";
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/N=zhQF8suGGKy8v4UV.n13w
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jun 2021 19:06:43 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 19.05.21 um 11:34 schrieb Pekka Paalanen:
> > On Wed, 12 May 2021 16:04:16 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > =20
> >> On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote: =20
> >>> Hello,
> >>>
> >>> In addition to the existing "max bpc", and "Broadcast RGB/output_csc"=
 drm properties I propose 4 new properties:
> >>> "preferred pixel encoding", "active color depth", "active color range=
", and "active pixel encoding"
> >>>
> >>>
> >>> Motivation:
> >>>
> >>> Current monitors have a variety pixel encodings available: RGB, YCbCr=
 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
> >>>
> >>> In addition they might be full or limited RGB range and the monitors =
accept different bit depths.
> >>>
> >>> Currently the kernel driver for AMD and Intel GPUs automatically conf=
igure the color settings automatically with little
> >>> to no influence of the user. However there are several real world sce=
narios where the user might disagree with the
> >>> default chosen by the drivers and wants to set his or her own prefere=
nce.
> >>>
> >>> Some examples:
> >>>
> >>> 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color=
 information, some screens might look better on one
> >>> than the other because of bad internal conversion. The driver current=
ly however has a fixed default that is chosen if
> >>> available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to ch=
ange this currently is by editing and overloading
> >>> the edid reported by the monitor to the kernel.
> >>>
> >>> 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Som=
e hardware might report that it supports the higher
> >>> port clock, but because of bad shielding on the PC, the cable, or the=
 monitor the screen cuts out every few seconds when
> >>> RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just wor=
k fine without changing hardware. The drivers
> >>> currently however always default to the "best available" option even =
if it might be broken.
> >>>
> >>> 3. Some screens natively only supporting 8-bit color, simulate 10-Bit=
 color by rapidly switching between 2 adjacent
> >>> colors. They advertise themselves to the kernel as 10-bit monitors bu=
t the user might not like the "fake" 10-bit effect
> >>> and prefer running at the native 8-bit per color.
> >>>
> >>> 4. Some screens are falsely classified as full RGB range wile they ac=
tually use limited RGB range. This results in
> >>> washed out colors in dark and bright scenes. A user override can be h=
elpful to manually fix this issue when it occurs.
> >>>
> >>> There already exist several requests, discussion, and patches regardi=
ng the thematic:
> >>>
> >>> - https://gitlab.freedesktop.org/drm/amd/-/issues/476
> >>>
> >>> - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
> >>>
> >>> - https://lkml.org/lkml/2021/5/7/695
> >>>
> >>> - https://lkml.org/lkml/2021/5/11/416
> >>> =20
> > ...
> > =20
> >>> Adoption:
> >>>
> >>> A KDE dev wants to implement the settings in the KDE settings GUI:
> >>> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
> >>>
> >>> Tuxedo Computers (my employer) wants to implement the settings deskto=
p environment agnostic in Tuxedo Control Center. I
> >>> will start work on this in parallel to implementing the new kernel co=
de.   =20
> >> I suspect everyone would be happier to accept new uapi if we had
> >> multiple compositors signed up to implement it. =20
> > I think having Weston support for these would be good, but for now it
> > won't be much of an UI: just weston.ini to set, and the log to see what
> > happened. =20
>=20
> Since a first version of the patch set is now feature complete,
> please let me know if a MR regarding this is started.

I'll try to remember that if I see someone else do it, but I'm also
pretty sure I won't be writing it any time soon. Still a long way until
it would be used with the color management work.


Thanks,
pq

--Sig_/N=zhQF8suGGKy8v4UV.n13w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDS4tMACgkQI1/ltBGq
qqcx6A/9Gts1PFvQoe3GF+a7OiQWUftE/PQDlh7+3dIMz4UEvdibVkFrM1Grstvx
VupmRCkrpF3HitXO82Hdu2L5DsPAhGSdImfoa4+lDyqcFHaYFwSY02bvdDbItVc5
K1r8pbZEPCjfuctbHYcsDK1Ia7JHdGktP6Gi8Glp8uKrDAP0n15Trfp3Lx5sqmEq
rronltamM4LWFsU6MIV2SDhYCauVm2cDvm8AtXPBP3WsUDIjjJMPiLqMvpZ/FL42
HThxxWx1FjZjSSOPvQCwPDp/XPstOnctUnnYOtQmFRrkXJe3YuS75sUhRmc+tVvi
ECwhnPR9vgv8qgP+R2g8Uy33AU07l3nN8PBlTzRnEU1dpETJDpBFosPJfJuLdEtC
LngQVhTuel2wjxfHoafEzP53JoLTAiNVM2N7jSkiams7cRLLzYdZUsESvtNRYIO+
f6Y5gh8VIRMMmVMm31keRRIRbJT/p7VCtncSs5MjsYqdbV8Ub4HFG+rWK9pIIrC0
wF//vNO1IMy50RU6Y27LX7uB25tX69o8t/6Ps6jb64iWCnUn1R1lrGZhnXV1/Zhf
4XwyINC39JXQZY1WG45W9gJaWrb3+s8XlIRIRgjJKujOsFF8h1UsNt9LL1VBPecW
qdqoSYQQ8B9k0vtO4rYegPPdaoiJmyaSEZ/HHH2I79tXILebFR0=
=cst6
-----END PGP SIGNATURE-----

--Sig_/N=zhQF8suGGKy8v4UV.n13w--
