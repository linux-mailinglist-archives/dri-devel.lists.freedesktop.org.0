Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95922754E0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 11:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDD26E2DC;
	Wed, 23 Sep 2020 09:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A746E25B;
 Wed, 23 Sep 2020 09:55:08 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w11so21392866lfn.2;
 Wed, 23 Sep 2020 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=rZX18Nb4B451H35fKxXNz+FOKZsolDgT7G8y6qr1qK8=;
 b=uLypUFcA0E5rVNI+RHeLjOrO4R8ls0qGgb1mQ4xXOjxL4P+SVeUDySQixtaLA2ndbU
 lKcSyW3bD8EfQEQePh+TxLXQHxTA5s9ePEm7DRnXLtO3CcHWhqZqJBUi7rmsPrqW1G3F
 aCE3b230KvbVW9TzmlxeIa/DQtape50xveN6eMW7kVr2rZsGQ4Gl8V8P3RCmkZHESKfu
 J2jVGJJQFNAYEwJGbTeSfY+Ze/HzUlJ6JtsJfqdBBk0OgU47cITD9UbcexFrXZGOmdao
 7vRp5+KY9kApwJ2iq+ikXE60TBTjqa6Ug80zU7x8A5ddtDqP94hAxuFZvPqGgSh7/zbY
 czVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=rZX18Nb4B451H35fKxXNz+FOKZsolDgT7G8y6qr1qK8=;
 b=Ar0wpUKhQbpTKs8+IgmFLk+Q8MYpQL2lZs8tN5PASB/rV7s8017z2xr73HRIVdBqpN
 PG+gQOoGPVGUMXWwA2sikxUT1YhpUo3StFQ9XV+9Vuy13Nc8dUsAYsUHYKQEu+tWIXZT
 o9uDA9MvPHVeDp9RIb+lxxu7A3hDhtnYhkPUNMEelWbgvTBBkfXgxKFgFmziZbSVXm2f
 T0am64IOQRMo+2FKUIr078rKNw2VzsR9/fZJx2iPgIqCVAKZ4K08TVgyJR2wS+kpSoyq
 iDHP4jQMC28EbwGxWhX6YIsmeDJaOwYDHPKoiYGUHuYJwQdyQlmaM1iMLCCKm7SR1Z+Y
 /JXw==
X-Gm-Message-State: AOAM531io4ByidVGPqTUE1cB8nYlgURdVvAOAibccvwrHANXT7/KNJwP
 N2UH70fsQqAEQvKjCdN+Nyw=
X-Google-Smtp-Source: ABdhPJyFeme2PzRuZLADYLxEONkLoODcIN2LPNtvFAqYLkEDt5nJjxLqw/RieypMiZXXaxpboW4iuA==
X-Received: by 2002:a05:6512:3606:: with SMTP id
 f6mr3398610lfs.282.1600854906538; 
 Wed, 23 Sep 2020 02:55:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 78sm4635269lfi.81.2020.09.23.02.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 02:55:06 -0700 (PDT)
Date: Wed, 23 Sep 2020 12:55:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: document and enforce rules around "spurious" EBUSY
 from atomic_commit
Message-ID: <20200923125502.4735f720@eldfell>
In-Reply-To: <CAKMK7uFvaMRK3Zh-s21OG=V3sPQZjn7Z_WQaNMcL=_R36enR2g@mail.gmail.com>
References: <20200922181834.2913552-1-daniel.vetter@ffwll.ch>
 <20200923111717.68d9eb51@eldfell>
 <CAKMK7uFvaMRK3Zh-s21OG=V3sPQZjn7Z_WQaNMcL=_R36enR2g@mail.gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0903763790=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0903763790==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HSKGjOiwSV7m_k8F45bc62z"; protocol="application/pgp-signature"

--Sig_/HSKGjOiwSV7m_k8F45bc62z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2020 11:26:39 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> I'm really not awake yet ...
>=20
> On Wed, Sep 23, 2020 at 10:17 AM Pekka Paalanen <ppaalanen@gmail.com> wro=
te:
> >
> > On Tue, 22 Sep 2020 20:18:34 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > =20
> > > When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > reconfiguring global resources).

> > If yes, and *if* userspace is single-threaded wrt. to KMS updates,
> > that might offer a way to work around it in userspace. But if userspace
> > is flipping other CRTCs from other threads, TEST_ONLY commit does not
> > help because another thread may cut in and make a CRTC busy. =20
>=20
> This is not a legit programming model for atomic. An atomic commit is
> always relative to the current state. If that state changes, then you
> need to re-run your TEST_ONLY commit. So multiple threads changing
> state in parallel isn't really a good idea anyway. Minimally we'd need
> some kind of TEST_ONLY pile-up, so you can validate a change assuming
> another commit has already happened. That's even harder than deep
> queues on the commit side, we'd probably need full rollback of
> commits.

Yes, very good point. I forgot that for a moment.


Thanks,
pq

--Sig_/HSKGjOiwSV7m_k8F45bc62z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9rG3YACgkQI1/ltBGq
qqeSUA//X6te+sf+nLiLiPV9iiFduKqr69eeaBnYPlJXqr1GWWR+3jQ16GV39RUT
E+kx2ZmlTm8eJ0lQFbrbvbEpyikbOv+gH4s4E1t7GHOBjEldzGD30xtylfSUDIJJ
YdJw3bxYFt3bPGshSWIub6p0ig3OuBe9jvonzNggWRqwBMY/zVvVwrpVBhZDy10T
jHZ0HQT2OwFoxqbF46WO87+Dc6i+HHvQPHMjfj7Otk10ZuGAiWUKq+ry58iDliGn
KNbc5QWaSMInsTDq/anoMaB36yFG/s1/eYc8mEjjSj6Xh+GGPfrT1vxZHjIOB0qd
JvW2wW9bTEKOjaNlj7KIipGbpnvjFyAxX7kF6xarTkgLUbNoRw7xSTUNPOEatW9R
/3b/k2voBaagpdVEnUyxxjQYkrO36SCSrUHn5wFnJUXCfO/FyijqWGg7EDdc2Apr
no9vATwKFSNPI4Ilr6pe0wLTw8ETDUAtu2XCkaWuAQDvPg4759/MBPZjZgWAEFX0
XaddqM8nOm2+zZzGkx7L5XGcFta09TbaMqKFIO5KlypU6tapZf7u44dw1az4ninm
aAoX4kGBNQAEaB1ryfA+1hGR8OWwzl2fluArXiSOP+7OZNXgLv/i0Uu44YE/uN68
FqvTbwEuwMIAtKd/kTyoh7AOYK5W8/D/l7U/dpfGt96xge17R4o=
=BdYf
-----END PGP SIGNATURE-----

--Sig_/HSKGjOiwSV7m_k8F45bc62z--

--===============0903763790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0903763790==--
