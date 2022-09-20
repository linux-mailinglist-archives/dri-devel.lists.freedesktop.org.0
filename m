Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05DB5BDE4D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AD110E378;
	Tue, 20 Sep 2022 07:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C3C10E360;
 Tue, 20 Sep 2022 07:34:27 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x29so1963563ljq.2;
 Tue, 20 Sep 2022 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=/iJfrWoB5SYcliHey/w57Qf2YD0ZYbiuB6zodpkie5M=;
 b=QYfHnqLZ3+cY9QvwvDvSE0TsJQqnmyWX3Zc5MQfxeWfCGPR/nzIfxQBqVtWyyQKfYs
 32kkF4EEW8vgPnahiABwSth1iYVmG9aIrOyTWCb56VI1AwKVmZJhJSJwQjojRkU1Dyd/
 di7dz8mRnZYKfo4/fxEPrJWD0WtEfGZLVrVH//27B0F5XJaMm+2+z0VIErA52z5kZZKP
 Rk6EHei0wLdWPxsOGbrLt77h8ZM1vZvDtzi0lXhSIl72eyQHL8bAKbzEkZEDhf+F1SZE
 13IzlG4slPbQQwLv73lBsS0PzuEpu2hji6p/m5/a6SpWFAskKOA7ambelysYgOIqNqGT
 YUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=/iJfrWoB5SYcliHey/w57Qf2YD0ZYbiuB6zodpkie5M=;
 b=Ov+V3BHw3cpgpRVp3RBDxf9oLS0QFXvw7Bezd4B24MxRYHGOsS8KEMYVTPCxzQAd2g
 YCb9/Hlr9kt8vdjQ0ExNvlulRrfvP6MC6MnRUgIvNmaqvee9olbYK95zrK5QAbU7SvSq
 PfJvEVfc4ZXtIgmK2BCRLvi4aJowzjUHD+AtoBl5I8rFW5OaRDwenuOflkbQCyXTsMj9
 TaenLtjiHIwh84xU0uSt+WKoBskF7wzdEvyfVx9rnKoNAK9XfdT6EMP4wXV90JTU/UgU
 1XX5mjJPl4fiQUoUaz0hED6ycyW8lbVQaj9Ts9intwnRuMujCTlUyC0xD1rneFUqRnZK
 QJ1w==
X-Gm-Message-State: ACrzQf3d75Ox+Q+pMfv4MgyG83Y5ThwKsStPEazJ3JKY5jAVZveAMcOo
 Vt1UlO82qozN4A38/THm3iQ=
X-Google-Smtp-Source: AMsMyM7XHYWawK+6UwXeK6nVMBFAbypt7akRR2p3oN+H84CZiRJXKTSPAopnMXnuCMYcaICFGEuKYw==
X-Received: by 2002:a05:651c:17a7:b0:261:c0b1:574b with SMTP id
 bn39-20020a05651c17a700b00261c0b1574bmr6713919ljb.40.1663659265702; 
 Tue, 20 Sep 2022 00:34:25 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 b7-20020a056512218700b00499cf3e3edcsm168289lft.296.2022.09.20.00.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 00:34:25 -0700 (PDT)
Date: Tue, 20 Sep 2022 10:34:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 0/4] drm/atomic: Lockless blocking commits
Message-ID: <20220920103415.369d3ef4@eldfell>
In-Reply-To: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
References: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AmJH2Y7kFIQoOAKGif7jYSM";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/AmJH2Y7kFIQoOAKGif7jYSM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Sep 2022 19:33:27 +0300
Ville Syrjala <ville.syrjala@linux.intel.com> wrote:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> I've talked about making blocking commits lockless a few
> times in the past, so here's finally an attempt at it.
> The main benefit I see from this is that TEST_ONLY commits
> no longer getting blocked on the mutexes by parallel blocking
> commits.
>=20
> I have a small test here that spools up two threads,
> one does just TEST_ONLY commits in a loop, the other
> does either blocking or non-blocking page flips. Results
> came out as follows on a snb machine here:
>=20
> test-only-vs-non-blocking:
> -85319 TEST_ONLY commits in 2000000 usecs, 23 usecs / commit
> +87144 TEST_ONLY commits in 2000006 usecs, 22 usecs / commit
>=20
> test-only-vs-blocking:
> -219 TEST_ONLY commits in 2001768 usecs, 9140 usecs / commit
> +82442 TEST_ONLY commits in 2000011 usecs, 24 usecs / commit
>=20
> Now, I have no idea if anyone actually cares about lack
> of parallelism due to locked blocking commits or not. Hence
> Cc'd some compositor folks as well. I guess this is more of
> an RFC at this point.
>=20
> Also curious to see if CI goes up in smoke or not...

Hi Ville,

thanks for thinking about this. If I understand correctly, the issue
you are solving here happens only when a blocking commit is underway
while TEST_ONLY commits are done. This can only happen if userspace
does the blocking commits from one thread, while another thread is
doing TEST_ONLY probing on the same DRM device. It is inconsequential
whether the two threads target distinct CRTCs or same CRTCs.

If so, this is not a problem for Weston for two reasons:

- Weston is fundamentally single-threaded, so if it does use a blocking
  commit, it's not going to do anything else at the same time.

- Weston practically always uses non-blocking commits.

I cannot imagine those two facts to change.

Ah, but there is a case: KMS leasing!

With leasing you have two processes poking distinct CRTCs on the same
device at the same time. Even if Weston never blocks, an arbitrary
leasing client might, and I presume that would then stall Weston's
TEST_ONLY commits.

I believe working on optimising this could be useful for KMS leasing use
cases, assuming lessees do blocking commits. I don't know if any do.


Thanks,
pq



>=20
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Jonas =C3=85dahl <jadahl@gmail.com>
>=20
> Ville Syrj=C3=A4l=C3=A4 (4):
>   drm/atomic: Treat a nonblocking commit following a blocking commit as
>     blocking commit
>   drm/i915: Don't reuse commit_work for the cleanup
>   drm/atomic: Allow lockless blocking commits
>   drm/i915: Make blocking commits lockless
>=20
>  drivers/gpu/drm/drm_atomic.c                  | 32 +++++++++++++++++--
>  drivers/gpu/drm/drm_atomic_helper.c           | 19 +++++++----
>  drivers/gpu/drm/drm_atomic_uapi.c             | 11 +++++--
>  drivers/gpu/drm/i915/display/intel_display.c  | 15 +++------
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  include/drm/drm_atomic.h                      |  8 +++++
>  6 files changed, 64 insertions(+), 22 deletions(-)
>=20


--Sig_/AmJH2Y7kFIQoOAKGif7jYSM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMpbPcACgkQI1/ltBGq
qqcsrA/+IhFUD6M4sQadalesOOpuMP4D/N+iVK9RGJzX6t40qEbU/O/NE5LfuqWL
/ZbGhSAPpxR/OZrmtBg5wJhqDR2nVE/IkBKvSY0OGCKjQHFeL5S18JyAfGqwfh72
58C3iGXa8fvzzOJiqC/yLKTskkiE1gU2WYAA/TcIGTMowBcFnqJljlHS1m9EC7mh
J9YaUjY09R/xYVQjGkzJI+KvZ/wTx/G2W+EBl7cPnHI70AzUhUnCn+u7MMYMMkN1
8Wd/bkgmgGAeKMfMSiNSovjqmTIaimlVyy5EPV73ppRUGMriWkv5VE027vSsi91b
ob9miM/q2Rbt4BTwKySxti3Rcs2Phu9Sg5BKIuYxPwzUA1vewPJjWmU1P7fAQAN3
MmEIPQ3fwoTwX+7lvBztHx3l8pO6vpG+V0PTkB2mHZKC9EAwdkv8FPZhPBVSRFNm
pEC9qlWOdenROOMYdBl+rKE9Oc+BwQ6gMQ7oaWv/J89FYUpw5j1qTUOuoFTnR9VW
2F/0K8jjaL5NIWvAWL+YCKm1PDqs6IkySdkt/7QUgyU3OjSkwQqUJ1kXHyhjxcre
NbL1W5IDbii+r6HMxVmO2LYDjNoxxcg6IytB/EOYRaLb3a0k6Ov0YMjKfyGOSBbF
EK1bYC1JWWFzdp53Z4aH27aPGzO8mcvmmTVESO2jVdequX0s4sk=
=snr3
-----END PGP SIGNATURE-----

--Sig_/AmJH2Y7kFIQoOAKGif7jYSM--
