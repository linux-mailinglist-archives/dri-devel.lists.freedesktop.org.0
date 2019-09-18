Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307FEB5DAF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 08:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59736EE0A;
	Wed, 18 Sep 2019 06:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67626EE01;
 Wed, 18 Sep 2019 06:57:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q11so4794442lfc.11;
 Tue, 17 Sep 2019 23:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2SCjPk6PuqdRWJK8MoF2xZuMrxoKhkl/Qv2bMrB+MIc=;
 b=imKxC4Jx9srrqpT+MzEIySUrPlhg8VYiMmcjKj7Q06uLxxWVKhz2NrENb1OOrX+AXG
 /tTyuWXMxWnQtQ1tvkb55oVPX5iM8ZXZNRLKJxymH82d3G85MvaRCOIwNcACEan8/eRw
 lawWVIJtSuxKnMfI5kkZ4BB4X/G+9RJnpAmTQ4qzabvqlfXhwzEp/gjB0iZsgrDpGytZ
 1GGAr8myqnfB94PUC4hxqyyagRoLpiIHahEPQwfEjD/3UI8MqjgeLc8WO+AoVRSBNnDB
 aSbgQBlulVsWf/9ZDJkWd8DCX2JW6wTngqhPocryBJudulylVpWVIhxueatFJcoPPGbF
 pi0w==
X-Gm-Message-State: APjAAAUkwXtUqN/IbYbsc6C4c8PNmyslAO60bu1rieR/ah3rF7vL2VF2
 MhK6rTd/n50+rl2yy86ZyIU=
X-Google-Smtp-Source: APXvYqz9kyHTkSL5LugR6y+0YvR7QNLDQTq9v/nFG8ufqiLXRRDusmfJGR1K3IIOh+7Nxx+WQ9qItA==
X-Received: by 2002:ac2:5090:: with SMTP id f16mr1306174lfm.66.1568789863817; 
 Tue, 17 Sep 2019 23:57:43 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e29sm841456ljb.105.2019.09.17.23.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 23:57:43 -0700 (PDT)
Date: Wed, 18 Sep 2019 09:57:39 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: add drm device name
Message-ID: <20190918095739.727a9db4@eldfell.localdomain>
In-Reply-To: <CAKMK7uG54Fa__KR3ytM0h5FTesp=t-eo5Z+E9d5YnFJyjLGaPA@mail.gmail.com>
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com>
 <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
 <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
 <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
 <CAKMK7uG54Fa__KR3ytM0h5FTesp=t-eo5Z+E9d5YnFJyjLGaPA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=2SCjPk6PuqdRWJK8MoF2xZuMrxoKhkl/Qv2bMrB+MIc=;
 b=AutvxaUdHagaLXIK6SHVed2MWzeZj4j1iCtR121j7dspJGmQ49WhFt1cvz1a1RqbVg
 TjwNecCUzMCwrFLm+hMFEVE4cmt1skCUOZtZr9C8W4x4LPThV4zVSk2JyB/YAx20KyX1
 56T+R+uKTx8LvJRAhhzvwoy2/jws/BQQHwZsVH1lrYG7qfr+paWuESqsv36ESpAv3036
 4ftVmDdmr6RS5XTPz50GlcTvmGyzESP1XqvvTR9LCCQo+SB7QnRkpAfMGNMniKSRBSbP
 2oE7umfVXLBsdFlldkfzYa+1WN0NIwoWIpHfWPc54fIWoG/YVbsQdeAggAbvMid1V69e
 X68A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1942276745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1942276745==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cS6.qu00aBr=DuDBDgIGueK"; protocol="application/pgp-signature"

--Sig_/cS6.qu00aBr=DuDBDgIGueK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Sep 2019 13:32:05 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Sep 17, 2019 at 11:27 AM Michel D=C3=A4nzer <michel@daenzer.net> =
wrote:
> >
> > On 2019-09-17 11:23 a.m., Michel D=C3=A4nzer wrote: =20
> > > On 2019-09-17 10:23 a.m., Koenig, Christian wrote: =20
> > >> Am 17.09.19 um 10:17 schrieb Daniel Vetter: =20
> > >>> On Tue, Sep 17, 2019 at 10:12 AM Christian K=C3=B6nig
> > >>> <ckoenig.leichtzumerken@gmail.com> wrote: =20
> > >>>> Am 17.09.19 um 07:47 schrieb Jani Nikula: =20
> > >>>>> On Mon, 16 Sep 2019, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wro=
te: =20
> > >>>>>> The purpose is to get rid of all PCI ID tables for all drivers in
> > >>>>>> userspace. (or at least stop updating them)
> > >>>>>>
> > >>>>>> Mesa common code and modesetting will use this. =20
> > >>>>> I'd think this would warrant a high level description of what you=
 want
> > >>>>> to achieve in the commit message. =20
> > >>>> And maybe explicitly call it uapi_name or even uapi_driver_name. =
=20
> > >>> If it's uapi_name, then why do we need a new one for every generati=
on?
> > >>> Userspace drivers tend to span a lot more than just 1 generation. A=
nd
> > >>> if you want to have per-generation data from the kernel to userspac=
e,
> > >>> then imo that's much better suited in some amdgpu ioctl, instead of
> > >>> trying to encode that into the driver name. =20
> > >>
> > >> Well we already have an IOCTL for that, but I thought the intention =
here
> > >> was to get rid of the PCI-ID tables in userspace to figure out which
> > >> driver to load. =20
> > >
> > > That's just unrealistic in general, I'm afraid. See e.g. the ongoing
> > > transition from i965 to iris for recent Intel hardware. How is the
> > > kernel supposed to know which driver is to be used?
> > >
> > >
> > > For the Xorg modesetting driver, there's a simple solution, see
> > > https://gitlab.freedesktop.org/xorg/xserver/merge_requests/278 .
> > > Something similar can probably be done in Mesa as well. =20
> >
> > Another possibility might be for Xorg to use
> > https://www.khronos.org/registry/EGL/extensions/MESA/EGL_MESA_query_dri=
ver.txt
> > to determine the driver name. Then only Mesa might need any HW specific
> > code. =20
>=20
> How are other compositors solving this? I don't expect they have a
> pciid table like modesetting copied to all of them ...

Hi,

other compositors have no driver-specific code at all, so they do not
need to know what the driver in kernel or Mesa is, or what chip they
are running. They may report chip name and stuff in logs for the users'
amusement, but nothing more.

Even the NVIDIA proprietary driver detection happens through EGL
extension search: no-one else exposes EGLStreams.

Unless maybe if someone needs to quirk around driver bugs.


Thanks,
pq

--Sig_/cS6.qu00aBr=DuDBDgIGueK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2B1WMACgkQI1/ltBGq
qqe9sw/+PxcTpvv0BIYclDwWDRPEqHl1DKJCHJFRkRS7+hn/clw2KYmwAPfmmsDV
Amr696lcOrYcaeGL1E8C4AFbYVD8Vw5d34IUtCkEN9VXnXEQonR4VSgCcMZR7k4p
fLSZkT2Gr7DtthwdGUhqkvtbX5NarvW0icHKvLQBYwZKEwqElZ46xsaNIyXJKGT6
MLzYNVL1yCuBN3pKA4fdtKJ75sJW1VLQzHaRpfZc2Cr7uAymPKKZmZeDntTmUUMT
padHZDaopV95LCaKKQGLb9aBxSz60YJVRncVd0jg1yAB2qz0OUhb311D5eXxyD02
N38vYEyFL+9joiRwD3bGfNiSDCyRtSNzHAIsgBNV67xFFU1aJQ5y180fdrkjsunq
eSec3hDTiMZlKZFG6ITd9HREckWVUL+Jdmy5AOwlu8EXl2PcyxVR3FZoxJ5TxrqH
wdIDpQZ1PYvUaVKkglPaqLWvA+gJOIqbJxMzUTKruFEvmIeylsTqqPiT5gqc0GZg
RtshyWzzXqIItRprrLoNNevPhk+0x2t6kEUWFyCZ3O2NdDgoZpMWLH4X92aLvwqo
Ehm+FBKIL1+3RGtK1y6xZX8ARC2+7rVHZ7ZC3R+5sHk+FApUAFBkPa1wvKL4UnB6
DgaeV7hbVXzmAgMMtPTd3svP8pqmCbXpluGwITltfQNaMtX/5KY=
=75T+
-----END PGP SIGNATURE-----

--Sig_/cS6.qu00aBr=DuDBDgIGueK--

--===============1942276745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1942276745==--
