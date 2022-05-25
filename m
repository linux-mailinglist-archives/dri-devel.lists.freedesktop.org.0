Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897C533AB0
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 12:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDCE10FB76;
	Wed, 25 May 2022 10:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD4110FB76
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 10:36:59 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id r3so17116590ljd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 03:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=X9kleQuGG3YfJRaifqb8b5NBK81IxmNzDoDuCtuwQgg=;
 b=nkasU0seoOsGwGS9dUp2TtQtUvfKocnRQwmggSEnGDHDqN2BhZ/1BYHxM4iA4BjgbE
 fzyjY/xjcdDcPGeLILQ9smRD6uqffX11+GGMyRtN6+DCKJu0NH2Wh51zZMMPZIoGlZfo
 M6OpU9FwT2XIRuEZg55z8rIlyP25Uqd5xzVMqYS7bZHJox9p82B3F2Xy5F1NMSCLLhK4
 H/GObK2mLyYp5nSOUA5R+3ejcD1y8NXw6pHWcBNkK6gy6VQ8GehtQdtWF8vuRYK39Kw+
 Cnegz9Mo5HnueJeebsvUvOYdi1FWPJYXa18l+9l5P710jJmG0DRxf8wzWJQv4wOOq2Pk
 J7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=X9kleQuGG3YfJRaifqb8b5NBK81IxmNzDoDuCtuwQgg=;
 b=GREnozDBeQc7J+5gT42+JBSiRpFQq8qsEdNEYi948b02UOMsfGcE3cungNFpZtykrG
 fParztHbbsX/7eTqPu8Nn+qPX2tRUDleQBLlCGhdM7iTxcoQWoSO3uDa5aBdtf9gRhhD
 zcGJ97YpUgYiwIjC34dPUK8AA6Rh0yZjodbUWB8uuvnyYc4drSfidX2iwXCtgBNT+Ws5
 FkiUoFSgUu31VxvEwT4m0rWo8lOkOV0rrc83W3igAA6a4eX95HkxElnpaEMLbZiX0d4R
 hghQd4wzrx44de6XErd03hH0BLtcE7ap3XP609AOBsWfVHH1hDbWZI6iL/VmSP5cA6+V
 +PfA==
X-Gm-Message-State: AOAM531HQ4pTPaTnHJlFqO8PFTn9mDCNOlcV8LJw6KnwJEsT5//W41bK
 JhcVvdCLINEvwOBxXP/K1xI=
X-Google-Smtp-Source: ABdhPJwXQzY/tOfTeAKihRPpFpXLnouV+lzYp/39ziMmiZKuRvtC92KMBba0C0MsP0WFj/03bICriA==
X-Received: by 2002:a2e:5414:0:b0:253:de94:d9d2 with SMTP id
 i20-20020a2e5414000000b00253de94d9d2mr14433467ljb.8.1653475017354; 
 Wed, 25 May 2022 03:36:57 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 bf42-20020a05651225aa00b00478a8b7ab1csm202776lfb.150.2022.05.25.03.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 03:36:57 -0700 (PDT)
Date: Wed, 25 May 2022 13:36:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <20220525133647.052d09da@eldfell>
In-Reply-To: <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w10Xlg9r_YArPLSCmN+aoYx";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/w10Xlg9r_YArPLSCmN+aoYx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 25 May 2022 09:23:51 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, May 25th, 2022 at 10:35, Michel D=C3=A4nzer <michel.daenzer=
@mailbox.org> wrote:
>=20
> > > Mind that "max bpc" is always in auto. It's only an upper limit, with
> > > the assumption that the driver can choose less. =20
> >
> > It seems to me like the "max bpc" property is just kind of bad API,
> > and trying to tweak it to cater to more use cases as we discover them
> > will take us down a rabbit hole. It seems better to replace it with
> > new properties which allow user space to determine the current
> > effective bpc and to explicitly control it. =20
>=20
> +1, this sounds much more robust, and allows better control by user-space.
> User-space needs to have fallback logic for other state as well anyways.
> If the combinatorial explosion is too much, we should think about optimiz=
ing
> the KMS implementation, or improve the uAPI.

+1 as well, with some recommendations added and the running off to the
sunset:

Use two separate KMS properties for reporting current vs.
programming desired. The KMS property reporting the current value
must be read-only (immutable). This preserves the difference between
what userspace wanted and what it got, making it possible to read
back both without confusing them. It also allows preserving driver behaviour

It allows the desired value to include "auto" meaning the driver should
pick best/highest value that works. That helps with the combinatorial
explosion as userspace can leave details for the driver to choose when
it doesn't care. Then userspace can read back from "current" property
to see what actually happened.

Plymouth could read the "current" property first and explicitly set
that to keep the current setting instead of hitting "auto" or making
assumptions about firmware set state.

There could also be another special value "driver default", different
from "auto". While "auto" gets the best/highest possible, "driver
default" would be the default value and mean whatever the driver did
before it exposed this property. This should avoid regressions in
behaviour.

All this won't fix the "empty commit should not change anything"
problem, because userspace needs to explicitly set the properties it
does *not* want to change. That's backwards, but fixing that would mean
changing what existing userspace experiences - which might be ok or
not, I don't know.

Thinking even further, about the problem of TEST_ONLY commits not
telling you what "auto" settings would actually give you; there could
be a new/extended KMS ioctl that would be the same as commit now, but
allow the kernel to return another set of KMS state back with
TEST_ONLY. Like reading back all KMS state after commit was done for
real. The "current" KMS properties would be part of that set, and tell
userspace what would happen in a real commit.


Thanks,
pq

--Sig_/w10Xlg9r_YArPLSCmN+aoYx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKOBr8ACgkQI1/ltBGq
qqfWzA/9HRnCrMA6Ni1VLPM0QkXzcgeLYYu5Fyd7/OSvUZCLTE/drZIVOY1fhyNp
Gh21TwpCTaH03Cl1cIhILglRH2e9s3VO0DS88LScIrjX4SS3T/kN7J2SRy0T8U7r
gqUD1q9KQgsqRq0Cz32j9ICoWePHoZEUFjYjosJNmux6bgGUbsT/uTuum2m1W0LJ
GWih8Jrc4CoLEtaeHAaWmqJ5nRsk6UwvCQNQbMBG2VklzsggPjvEXaaUqH+CQk2f
sNFlFVsixBAFLX7gCVLBFMqCqCycv48IoyMxpd87lLIaBC31EW50UgNnHBs4Yrks
52eXZGk1wn0x/ea6YTuojTf/ZyIT1hn5o/m2S9MgaYxmi5vlnRsrqFJnEcR9Uyg8
ye+qvWrJjmTVtmGPa4mwjfnS7wC0cyAxlhQqbXMU6YAdHku6yBGyPHQ0Oj5MylF8
uAEy+brNrx7mvoYTETjrhuJ3o9SoZ5sZ1Cl6gj0hlJydFwZMsZ+7O/YNgQ/g4UUz
gyliPEGIKzmjTadOaSUmAsXlz/ArfjTx/oymF/15ynwtbf3jPJTR9n4SXM4axrXb
bD+T9fk3eK9eWgRQIah+4ygBmfYh04sCq+C0RshQXy4hRuKBqL/Jk5zc4wk6SJiQ
urlNydXIlzbnJAv3KvdnuHgAuJm66Arltebs3EL0OfW+ncXqJFk=
=j7tS
-----END PGP SIGNATURE-----

--Sig_/w10Xlg9r_YArPLSCmN+aoYx--
