Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8989E3B7138
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E2A6E85A;
	Tue, 29 Jun 2021 11:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A53F6E85A;
 Tue, 29 Jun 2021 11:17:26 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q16so24632755lfr.4;
 Tue, 29 Jun 2021 04:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=co2MnmhqTunRm8w19zQP35XSCvF/jJ76gA/W9GlIUz0=;
 b=JBet+L1/xGCXdWUkOprU0gLpjHcspyWMX41k11zgcAWXmzhI9gm3YIixLkNTJlqVB/
 XcWiFb1eTuuQ0kZPvEkUrb3UuAcYdsKHD/D12Eaov5Lzyd9QnJCwNNchJ8ukHTIasmKs
 SFGy7bdYdELyUi/4Cs4D+h5baTLqNvlmps9/xqsI+9OHQKc8Rq13MEKERP9VFoa5IgQG
 W+ULAaQCMLpup1hbsAmWwrAshrxJwNGepLcM9rge/JvfV2nG6weCZl5M0tIBdw+xf5i9
 7vS+4WIflZLG5RqKPfZoLlErqKzj99hms0mYKEi1B3mu0Gv99P1J6P91mtxFB1BPzUWQ
 zw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=co2MnmhqTunRm8w19zQP35XSCvF/jJ76gA/W9GlIUz0=;
 b=dEx9qcmRv6VLhuUB+ukXR4jsHosz5pZRRhN58ixCm3giLXOWBST6RccPM/u+Q/VsKt
 Crhc7Z6FLHr5BiSbAUWCWfG+X72qopg9PxcGm5ZrNerEMz7ILHkAY4biZTv+PZTIAa4V
 lJYCqtDBtPc1PWDUUoXmxqOX198nJoPA3AftDeOFPck5Hr66WwfZYh/QSiKwrxLYlrnq
 VgfSgp35xX8Do1C3mYFm43uZbAo4hqOes/4bCkJCCAXLaM+GXRXtgyrqpJSAmdjstvxc
 FTNjOd5KsyF8b4RDcuDWkRA1GJjgiAG4P9XNq73UFQNHJaVTqREXS6OJukxJX3Vb8b/1
 GUBw==
X-Gm-Message-State: AOAM533d6S1HtuCF50oBbwKsijc2OPMyh1W6T4iogns5K1sGwhYkBFTt
 V2C/a2ch7HaqZ+y94BAOvqU=
X-Google-Smtp-Source: ABdhPJyGUNfsY7ynhRA9iabVuy2UenX5kT6gcct7E/4hF5q63/J3+g9SwmUC5LFXj4H6uuIg3SuXrQ==
X-Received: by 2002:a05:6512:3305:: with SMTP id
 k5mr22335683lfe.132.1624965444978; 
 Tue, 29 Jun 2021 04:17:24 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v19sm1848185ljh.118.2021.06.29.04.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 04:17:24 -0700 (PDT)
Date: Tue, 29 Jun 2021 14:17:12 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
Message-ID: <20210629141712.21f00c38@eldfell>
In-Reply-To: <jIDQ2rRRMWlhDDPf08Z8xZlEE8HTBx7fHsylFdK0joSSFVyES8D444Giyiji9zbIm7dU4QpbsXZLvIDTbGW0wEoUWKsMEI4evizn0UdGMvM=@emersion.fr>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-13-wse@tuxedocomputers.com>
 <20210622101516.6a53831c@eldfell>
 <jIDQ2rRRMWlhDDPf08Z8xZlEE8HTBx7fHsylFdK0joSSFVyES8D444Giyiji9zbIm7dU4QpbsXZLvIDTbGW0wEoUWKsMEI4evizn0UdGMvM=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LAj=Yh72UIUuJMQi5B=dyga";
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
Cc: Werner Sembach <wse@tuxedocomputers.com>, sunpeng.li@amd.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 amd-gfx@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/LAj=Yh72UIUuJMQi5B=dyga
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jun 2021 08:12:54 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, June 22nd, 2021 at 09:15, Pekka Paalanen <ppaalanen@gmail.com=
> wrote:
>=20
> > yes, I think this makes sense, even if it is a property that one can't
> > tell for sure what it does before hand.
> >
> > Using a pair of properties, preference and active, to ask for something
> > and then check what actually worked is good for reducing the
> > combinatorial explosion caused by needing to "atomic TEST_ONLY commit"
> > test different KMS configurations. Userspace has a better chance of
> > finding a configuration that is possible.
> >
> > OTOH, this has the problem than in UI one cannot tell the user in
> > advance which options are truly possible. Given that KMS properties are
> > rarely completely independent, and in this case known to depend on
> > several other KMS properties, I think it is good enough to know after
> > the fact.
> >
> > If a driver does not use what userspace prefers, there is no way to
> > understand why, or what else to change to make it happen. That problem
> > exists anyway, because TEST_ONLY commits do not give useful feedback
> > but only a yes/no. =20
>=20
> By submitting incremental atomic reqs with TEST_ONLY (i.e. only changing =
one
> property at a time), user-space can discover which property makes the ato=
mic
> commit fail.

That works if the properties are independent of each other. Color
range, color format, bpc and more may all be interconnected,
allowing only certain combinations to work.

If all these properties have "auto" setting too, then it would be
possible to probe each property individually, but that still does not
tell which combinations are valid.

If you probe towards a certain configuration by setting the properties
one by one, then depending on the order you pick the properties, you
may come to a different conclusion on which property breaks the
configuration.

> I'm not a fan of this "preference" property approach. The only way to fin=
d out
> whether it's possible to change the color format is to perform a user-vis=
ible
> change (with a regular atomic commit) and check whether it worked
> after-the-fact. This is unlike all other existing KMS properties.

I agree. FWIW, "max bpc" exists already.

> I'd much rather see a more general approach to fix this combinatorial exp=
losion
> than to add special-cases like this.

What would you suggest?

Maybe all properties should have an "auto" value in addition to the
explicit no-negotiation values where at all possible?

That might help probing each property individually with TEST_ONLY
commits, but it says nothing about combinations.

A feedback list perhaps? TEST_ONLY commit somehow returning a list of
property/value tuples indicating what value the "auto" valued
properties actually get?

What should a kernel driver optimize for when determining "auto" values?


Thanks,
pq

--Sig_/LAj=Yh72UIUuJMQi5B=dyga
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDbATgACgkQI1/ltBGq
qqcYExAAkwmMC2LyEGzVad5N3ja6Gax0qc3Wpe2Cw40DuxFKcr1j6wJ7AHT4Rmli
R334a3TJ+3OPRzjeDnw28S4Ycx3ZEDVgPQ7g0pVBCGfSGze1gCaJRGd3sUFQDQxn
OVdgRoP/sSHbOKylhXb74+UPYcw3MJfUed0EiPAZC9XE2gnxiv8tprcGkm6N0Xm3
WYzu6Ssr7VGzKGmVDGg0cyjHHVZ6aOwmk9vxgI2KAoqeIr4rxycR07qxGARik5XP
6GlZZ0s+zysJSPCwLu6gfDK//BhCGIdEXZ7wFp1k7Di5mPbygR/KJIa9rWmLLW7k
RUi+QFcdfnJj7JNOq3Zx99ksh3RTjBzl0PQVa7YyTl0uZbBCR0JKb7BXntqhCKRL
PY5ELnIRjezTDJ/9+gYQcnwASN7iyshKTXQAcg9aAmUz5u0pD8QcW/xC7+gq1MNQ
v06S4Is633ONw5MAti7FsdqT42FxwoNdaDXgZKnnJV9UW2s81yUUkKftw2d1krXR
EeWumEOlIIFqo95FCs9PW5PiAYMODq3tukBkaJyZnTf1rX7bqfuf4Z9rxI+dFIsc
CKiql+ZpWTaJmp9sAGeaUcVtW52kiq4spGHRKct36Ahc1QeKsNzhmrmebHhAPMcB
Klt909YOQ1LqqP0SiDmTZQVvQ8qYeS2wViXZE0e8ezLgLUe97pA=
=9IoA
-----END PGP SIGNATURE-----

--Sig_/LAj=Yh72UIUuJMQi5B=dyga--
