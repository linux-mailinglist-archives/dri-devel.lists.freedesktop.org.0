Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2C184502
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 11:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB77D6EBBB;
	Fri, 13 Mar 2020 10:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D956EBB7;
 Fri, 13 Mar 2020 10:35:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a10so9900673ljp.11;
 Fri, 13 Mar 2020 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Yu1F07KiJM4zIMHBA/pTlCdX8C+5JeBe8NdK0WwqpMw=;
 b=t+DAYhG7qZya+mMgPgPjsh25iLsJVCgbs+G4lIpa+jQ/t+gwC0XyKU9111l5Ud5ggW
 lvM8s2jbJGjk+4kF4IidIE84LiwApQuL/y3Mt3d/vLpyaO7TLfdWOXMbdpOe71sPUd9y
 6o3HiXTc4TAINGsjZebsAug10a591bEG17xVACJQsnjeS/t9F79rtps6uM2mJyHBE/CL
 7PEqOwW6lJw0X3sAGl/nqDKHVctgdGPStxW2OERM1jfrn/22y03rtXtRs0b3ZNd2VQB3
 chXAYtm/hmjt9DZbVaIzBLEFEh1uA03LTSISDBrTijxybRbLwXzt+PEMCpZMptQkcdXi
 CEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Yu1F07KiJM4zIMHBA/pTlCdX8C+5JeBe8NdK0WwqpMw=;
 b=iqJJIFGFfMAnCEIkJskFkGL0ylWYHrW0GHL8JDXHNLn417yHicOEgn0fynb8sUEpoN
 FEDtmOs/G775LdxXuxP5831Cr7OXppAwt1LpkcvBCHYyRN7zA5f5rmNjJTL5d+7YF1oz
 /rzC8RLEIho7MA5nyS3t+N3jNi673kVH6EpBETHJVLmr68IRqNVcXjDAaSH1JVu+C5hy
 lPI/rbgFYBgFYnl9L0WwsIjxoJ+CIFwqXsbubhjceH1VundWsy3aCC9J79uiAVinwaLf
 xLKrISeBJ0PTcHBKtJs5rDjwCHA6f9UvxLi6kb7JFp9Cr20MrY8CrAVcdKBUS9F35cf8
 qWUQ==
X-Gm-Message-State: ANhLgQ07f3DpYdnD9ho5SXy/rKq0pZmZZRnGsoQ5fr9zrX7WymC+9Z7A
 WHivH0HSuyhAiU0FhMfm/5w=
X-Google-Smtp-Source: ADFU+vto44cpoVqc4nWPUxh+obdJN6ABIsMjrXCuH3BwP5Yhu+r3lWqTufRf5vf4Olqo4LnXNcLrjg==
X-Received: by 2002:a2e:860e:: with SMTP id a14mr5458220lji.218.1584095733534; 
 Fri, 13 Mar 2020 03:35:33 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m15sm2389533ljo.8.2020.03.13.03.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 03:35:33 -0700 (PDT)
Date: Fri, 13 Mar 2020 12:35:21 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC][PATCH 0/5] Introduce drm scaling filter property
Message-ID: <20200313123521.6de3ce48@eldfell.localdomain>
In-Reply-To: <20200312160112.GH13686@intel.com>
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200312140434.GG13686@intel.com>
 <E92BA18FDE0A5B43B7B3DA7FCA031286057B3798@BGSMSX107.gar.corp.intel.com>
 <20200312160112.GH13686@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "Laxminarayan Bharadiya,
 Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kunche,
 Kishore" <kishore.kunche@intel.com>, "Lattannavar,
 Sameer" <sameer.lattannavar@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>
Content-Type: multipart/mixed; boundary="===============2114456493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2114456493==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vMWhQLKRKGPaem0p/lu3FKo"; protocol="application/pgp-signature"

--Sig_/vMWhQLKRKGPaem0p/lu3FKo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Mar 2020 18:01:12 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Mar 12, 2020 at 03:37:03PM +0000, Laxminarayan Bharadiya, Pankaj =
wrote:
> >=20
> >  =20
> > > -----Original Message-----
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Sent: 12 March 2020 19:35
> > > To: Laxminarayan Bharadiya, Pankaj
> > > <pankaj.laxminarayan.bharadiya@intel.com>
> > > Cc: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-
> > > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; airlied@l=
inux.ie;
> > > maarten.lankhorst@linux.intel.com; tzimmermann@suse.de;
> > > mripard@kernel.org; mihail.atanassov@arm.com; linux-
> > > kernel@vger.kernel.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> > > Subject: Re: [RFC][PATCH 0/5] Introduce drm scaling filter property
> > >=20
> > > On Tue, Feb 25, 2020 at 12:35:40PM +0530, Pankaj Bharadiya wrote: =20
> > > > Integer scaling (IS) is a nearest-neighbor upscaling technique that
> > > > simply scales up the existing pixels by an integer (i.e., whole
> > > > number) multiplier. Nearest-neighbor (NN) interpolation works by
> > > > filling in the missing color values in the upscaled image with that=
 of
> > > > the coordinate-mapped nearest source pixel value.
> > > >
> > > > Both IS and NN preserve the clarity of the original image. In
> > > > contrast, traditional upscaling algorithms, such as bilinear or
> > > > bicubic interpolation, result in blurry upscaled images because they
> > > > employ interpolation techniques that smooth out the transition from
> > > > one pixel to another.  Therefore, integer scaling is particularly
> > > > useful for pixel art games that rely on sharp, blocky images to
> > > > deliver their distinctive look.
> > > >
> > > > Many gaming communities have been asking for integer-mode scaling
> > > > support, some links and background:
> > > >
> > > > https://software.intel.com/en-us/articles/integer-scaling-support-o=
n-i
> > > > ntel-graphics http://tanalin.com/en/articles/lossless-scaling/
> > > > https://community.amd.com/thread/209107
> > > > https://www.nvidia.com/en-us/geforce/forums/game-ready-drivers/13/1=
002
> > > > /feature-request-nonblurry-upscaling-at-integer-rat/
> > > >
> > > > This patch series -
> > > >   - Introduces new scaling filter property to allow userspace to
> > > >     select  the driver's default scaling filter or Nearest-neighbor=
(NN)
> > > >     filter for scaling operations on crtc/plane.
> > > >   - Implements and enable integer scaling for i915
> > > >
> > > > Userspace patch series link: TBD. =20
> > >=20
> > > That needs to be done or this will go nowhere. =20
> >=20
> > Yes, Sameer is working on enabling this feature in Kodi.=20
> > Sameer, please share link here once you post patches. =20
>=20
> And who is doing it for other stuff? I think this would be most useful
> for games/emulators and such so IMO we should find a way to get it to
> the hands of users doing those things.
>=20

Hi,

FWIW, being able to tell KMS to use nearest-neighbor filtering could be
useful for
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/394
as a follow-up.


Thanks,
pq

--Sig_/vMWhQLKRKGPaem0p/lu3FKo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5rYekACgkQI1/ltBGq
qqfTpQ//W/9o7NNQ0qIjJ0FzcNtolpUfAaokRetxnFtvjd2lG4v3D5wrTvXVfctR
Dtl709DyxtciqtUnE527NbCbW4qbAVhbhamgMHkweMRhw2WyxtzUmLTAbIRd63Z8
0Wd/RpHUaZrlqnzPkuOJC61cK/8vzWO1+p++1pzCI6EnvQvx38QGFaQRq5MEEICp
RQC+zBx8A+n1dbWorM4Fc31ZD4AUL2IFFIztLWSd2XMrZfFUH3QwqPM9HYnjpjDy
Qm/tKnFUp7WsfBnK92xG8y3kSNFu4fumU1U/EMybspbhU1L1w3AtkadWExDU6xmS
i5w237YKaaYZxNvMMwmzMSXKpDrfIQLWAlNg1RLU+GVjwXWxUZsCOsU9IQD9fGxC
wKp2yVUJnCh7h/5XdlEEjBcnmUz2weusORX+yp00MLc9ujgleZxm1qqnUPR04AWD
LHV7wP9qmaNYW+1qxEZyAfBRszqhDIvzkRv4zWynqGrRvOfyvb2kgt7MoHpfK+EY
OuDPJtSSPhMvYuJFlFTM6P88WrFdOMF2quhKHLfoNpAbJYp7dHFAZty9D4ouf+Rn
0vdMsOkPm9Cp/4T4N49An9jguyozTaqax1tFlbkuRwBK47V6KGUWhiSir0x/OYYK
XIJjZ6PY3+MDKpfVT1RlnVcSJfO8rt++VnNymrJBO/vHZnt2Uuo=
=3GVp
-----END PGP SIGNATURE-----

--Sig_/vMWhQLKRKGPaem0p/lu3FKo--

--===============2114456493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2114456493==--
