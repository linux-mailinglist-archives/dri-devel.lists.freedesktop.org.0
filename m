Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA4264406
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850B6E905;
	Thu, 10 Sep 2020 10:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669766E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:28:16 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id b19so7418650lji.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=0RgSQbN19xjfL3QI0LBulInn61sw8UKt1sepVn6UWjs=;
 b=LpbqLm2fbjVf8DIdQwdnfkaojo+Xez0AnEhRx75kDAgW3HrKAc5lQEwl6O3OfD6PhV
 ifwO51rY+vGbYHu+8eY5/5Sd3nlkbhysZIvTf5kKtRCT2ew+S2kGdV9VqOGbqJncMN8e
 aYyDRVApBoJ+MxZYooLWhjEcUgH0vPifRvzwDw0ewkcRK7T+OdfcbMKq0xid9YouPOzp
 4hAHt+Gnvt1PWmoVJ7BhdkgNF6pcC7ju86UAWnvm6wBwKJTbC58u6yWqJvT2JXoEDGBd
 pjLNUneJbpDBqZ4ruWWAYjYZQiAWujbY3Bwt9g2/0p3o6qS4AtYlle9fzYpftLp+yAVC
 aV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0RgSQbN19xjfL3QI0LBulInn61sw8UKt1sepVn6UWjs=;
 b=mRH2XYYSpMIKBBki3vRvPZZV3guVbMLUfbSQofYXi7RaCD709LzS3VoSD3u1Ph16So
 q3Z6mPvZcIzSSSAX5RRIhdnH/31NAdnN3Kkz8IS5ZhSkU/Ljz34LSQpqJ7gLrOKpRPrl
 2pjx3KaT4qmiGdbVwFyg3fd+j52FaFRMSSZc9a6indgeawmnipHS4X8yCKRNfgIbSSJQ
 CmHT9O7dNAQxCnvOu0VSYEIkDdhGP86YJkeXOypLEu9jCD25eOaENn7xn7h2GQf5/YSB
 WosTqfOlFAjTqm2xmqFHH8bor4PoMvhnXOWw9/OxbhJiwt3YmDnGuLIjTErveUESQvql
 g4UQ==
X-Gm-Message-State: AOAM530ERfNJdXL7YYPU0w/TXZqX1NT/p7TuDwLG1pKFfL97xad8cejI
 C94CSjChnccYb4aiUcqX2kA=
X-Google-Smtp-Source: ABdhPJxWE91mIDQ7TxwMV5fLS0iXOcBGf/VikfAggWcxXC2L/Ure1usETXxxv6cuTY+d731ueEYipw==
X-Received: by 2002:a2e:854c:: with SMTP id u12mr4027360ljj.120.1599733694818; 
 Thu, 10 Sep 2020 03:28:14 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f26sm1468518ljo.57.2020.09.10.03.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:28:14 -0700 (PDT)
Date: Thu, 10 Sep 2020 13:28:03 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910132803.14dc028d@eldfell>
In-Reply-To: <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
 <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
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
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>, dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1895493917=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1895493917==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SZxu4SW8HQwU11Nov8.uQyg"; protocol="application/pgp-signature"

--Sig_/SZxu4SW8HQwU11Nov8.uQyg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2020 12:30:09 +0300
Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:

> Hi Pekka,
>=20
> On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
> > On Thu, 10 Sep 2020 09:52:26 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote: =20
> > > > On Wed, 9 Sep 2020 13:57:28 +0300
> > > > Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> > > >    =20
> > > > > Hi all,
> > > > >=20
> > > > > I was wondering whether you could give me an advise on how to pro=
ceed further
> > > > > with the following issue as I'm preparing to upstream the next se=
t of patches
> > > > > for the iMX8MQ display controller(DCSS). The display controller h=
as 3 planes,
> > > > > each with 2 CSCs and one degamma LUT. The CSCs are in front and a=
fter the LUT
> > > > > respectively. Then the output from those 3 pipes is blended toget=
her and then
> > > > > gamma correction is applied using a linear-to-nonlinear LUT and a=
nother CSC, if
> > > > > needed. =20
> >=20
> > Hi,
> >=20
> > hmm, so FB -> CSC -> LUT -> CSC -> blending?
> >=20
> > Is it then
> > 	blending -> LUT -> CSC -> encoder
> > or
> > 	blending -> CSC -> LUT -> encoder? =20
>=20
> The DCSS pipeline topology is this:
>=20
> FB1->CSC_A->LUT->CSC_B-\
> FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
> FB3->CSC_A->LUT->CSC_B-/
>=20
> Basically, CSC_A is used to convert to a common colorspace if needed
> (YUV->RGB) as well as to perform pixel range conversions: limited->full.
> CSC_B is for gamut conversions(like 709->2020). The CSC_O is used to
> convert to the colorspace used by the output (like RGB->YUV).

I didn't realize that it would be correct to do RGB-YUV conversion in
non-linear space, but yeah, that's what most software do too I guess.

> >=20
> > Are all these LUTs per-channel 1D LUTs or something else? =20
>=20
> LUTs are 3D, per pixel component.

Sorry, which one?

An example of a 3D LUT is 32x32x32 entries with each entry being a
triplet, while a 1D LUT could be 1024 entries with each entry being a
scalar. 1D LUTs are used per-channel so you need three of them, 3D LUTs
you need just one for the color value triplet mapping.

A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do the
channel mixing that a CTM can.

So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
blocks exist...


Thanks,
pq

--Sig_/SZxu4SW8HQwU11Nov8.uQyg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9Z/7MACgkQI1/ltBGq
qqejZg//eNg3PrLUXw3PhciF1h2V8xp+i8ltjYeJGNa72GXQfHC79bP4VPh173aQ
VamxdguGlt66LOmCbV7WAkCcUVBQYYLPYr6zC4cv9JofAS8+6FaXsGXk0YI7NHAB
EZulu+TmLvD7zB1ooXftMigLoZEXuw+emo4rAJ2ViczCXZZOUf6CEzP2SvSCyvge
I5piCD3OOsb1N2+ypKcozBcuC6bFPcAmpIcEvEeplwqcK2fuOlozOXdglUhNm1oH
rx6G2JpnVPPOkL9Y/HcbSVDHZKgsOA7dKNz+FhRydBYMwll2fDMr8rYJMetPRavs
KRo1UZFscQsy71XkyLRsKs53KbzznOVqgj0Fyo7q9/Ef/CVusfx9mJBEDQZBVbkE
t1/GeK9hntSyhZykP4jNdY4nec68kF9wIbVmzz1A8ix8ok8HK6BLr13gNb/+QEj5
A9hQForC1I7VMrbAJOB3chWPpWi//XdvHFKm4pxLMFCRSFox3lX1duuWBG7ozwbF
St/w/eV91QifrmcicSRSO2XPKeB8LnVZpC1WJjj6BG8+7+Fcvs4L2GJoQTkgwwV6
5QnVFCYavHoLQraDu8oMEJXqyUH8scRB8TIBbC+9GQ82uTMwfvwR6g7VwD7dojfN
/JF7JkEMC05cZzge3FxEctlRmqnDw+5eLBWVge9l90Y/iQjJaJ8=
=MuuL
-----END PGP SIGNATURE-----

--Sig_/SZxu4SW8HQwU11Nov8.uQyg--

--===============1895493917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1895493917==--
