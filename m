Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1A3455845
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E946E916;
	Thu, 18 Nov 2021 09:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554CF6E916;
 Thu, 18 Nov 2021 09:50:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id n12so23255947lfe.1;
 Thu, 18 Nov 2021 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=gq6degwBZPs1ArloybyTVPtiSsZJBAGT8zBXJgqTiIw=;
 b=kisjHdwB5zLMtmFjbef2KYKSkmzQWvOiqOdKhPL7adczBhS6XCPpdawwbHYHlUbMIn
 ytRBAwa/XPa1y2T1WXTVOXXODsKnJyKja1mZScYEqXk+BPGwD8lnSngnG0sS53sCY/Dz
 HIw/QRTPAI0J4iV87G/sob4Un028aJXTWfgi73ajbi0TAkCLMXSJ9fbeLNprm9r5l/vA
 KA/adqUp1LXk7oXr58fzAhyTCtjD9To5QqdFktpNg9/tGBTEzAEIDsJ5NwxHkbyy5tXc
 ouwS6EdtGW5RcfgJCNey9pFbiWHseQgZYC2W+5b89wn0qV4JH4jBqzrrUf4URYHj92QE
 3vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=gq6degwBZPs1ArloybyTVPtiSsZJBAGT8zBXJgqTiIw=;
 b=a1Nph3CZ3Q/VcNoiNFs/ZjxmPg0+nofRJuITTNWJTbHUeodS/legT8VS0SSznAv+GV
 m+KYkQXTpn+X1+Elnrnxj+C4zCeil3sPYqGclLR0LwEuwXATejOYwTowRy4UtYoaXk2q
 7R7mN1BTFMrtdRJbcFo938lt3RLGQ1NylAHuDKJWOyrFgmmfL+x/TxJbzBIGyqU428/w
 FHhUSc0QisgLXX0EZPokAw7AftI6galpo3VCzPRharJSPrk0VtH6ThNWPSsht/MhamTO
 h1EPguVgtqtsXtykDd9n1KNunVYEYbY5Q/3SESQDZjzvdcEQtMb5D39rVKTubRbHsK94
 2QDQ==
X-Gm-Message-State: AOAM533BwojS9V0nlRAKTLVXa5hREPVt5RIoVxSRHvjD5tYGrMKFY89Z
 UFTzKoTZvh0T9bB28aCmai0=
X-Google-Smtp-Source: ABdhPJx5ZMxAK9dhZddDATayvhOJjyoOWuerZ29+XnrMz7pFGkO1Yuc9WvmEnxi4Gw6Hj8Kg0Z0XFw==
X-Received: by 2002:a05:6512:3763:: with SMTP id
 z3mr22105206lft.315.1637229005655; 
 Thu, 18 Nov 2021 01:50:05 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v7sm267847ljj.45.2021.11.18.01.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:50:05 -0800 (PST)
Date: Thu, 18 Nov 2021 11:50:02 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [i-g-t 00/14] Add IGT support for plane color management
Message-ID: <20211118115002.14003184@eldfell>
In-Reply-To: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7pYQw2hfzjuE2r=j._k=rHe";
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
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7pYQw2hfzjuE2r=j._k=rHe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:45 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> From the Plane Color Management feature design, userspace can
> take the smart blending decisions based on hardware supported
> plane color features to obtain an accurate color profile.
>=20
> These IGT patches extend the existing pipe color management
> tests to the plane level.
>=20
> Kernel implementation:
> https://patchwork.freedesktop.org/series/90825/

Hi,

it's really good to get these, but I am worried that the tests here may
be too easy to pass when trying to ensure the KMS features work
correctly and in the way real userspace is going to be using them.

I also found some things that looked hardware-specific in this code
that to my understanding is supposed to be generic, and some concerns
about UAPI as well.


Thanks,
pq

> Bhanuprakash Modem (11):
>   HAX: Get uapi headers to compile the IGT
>   lib/igt_kms: Add plane color mgmt properties
>   kms_color_helper: Add helper functions for plane color mgmt
>   tests/kms_color: New subtests for Plane gamma
>   tests/kms_color: New subtests for Plane degamma
>   tests/kms_color: New subtests for Plane CTM
>   tests/kms_color: New negative tests for plane level color mgmt
>   tests/kms_color_chamelium: New subtests for Plane gamma
>   tests/kms_color_chamelium: New subtests for Plane degamma
>   tests/kms_color_chamelium: New subtests for Plane CTM
>   tests/kms_color_chamelium: Extended IGT tests to support logarithmic
>     gamma mode
>=20
> Mukunda Pramodh Kumar (3):
>   lib/igt_kms: Add pipe color mgmt properties
>   kms_color_helper: Add helper functions to support logarithmic gamma
>     mode
>   tests/kms_color: Extended IGT tests to support logarithmic gamma mode
>=20
>  include/drm-uapi/drm.h      |  10 +
>  include/drm-uapi/drm_mode.h |  28 ++
>  lib/igt_kms.c               |   6 +
>  lib/igt_kms.h               |   6 +
>  tests/kms_color.c           | 674 +++++++++++++++++++++++++++++++++++-
>  tests/kms_color_chamelium.c | 588 ++++++++++++++++++++++++++++++-
>  tests/kms_color_helper.c    | 300 ++++++++++++++++
>  tests/kms_color_helper.h    |  45 +++
>  8 files changed, 1648 insertions(+), 9 deletions(-)
>=20
> --
> 2.32.0
>=20


--Sig_/7pYQw2hfzjuE2r=j._k=rHe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWIcoACgkQI1/ltBGq
qqcjkw//QMxPvkyLCrL3oCmAXL5QHBnQlWuyikpXjYjaD8EF63rvspR+9kk0LG9p
xmuCZw1CRbA9Z45Duqvea1i2wkwPVGeQFg5HFJ5eKDUdT0r3Khy1OHvwyLW5ucEG
hgsJPyMM8THW7Gu6PKCK2yN4+mIbfHcL5TlCjgetpENPuNHch0wsURl1OY255Ywx
k0i68l+Gmkc0pg8KdaR3pHFZOYxoN58rKtlUJHiSF18fZr3smqw9sEZz4Eak1soK
zjIj0Bi2iW/cEsnDcXVof4F/uPwlvWWIc5hbEVJfVlcDGhyslsyqbAnlhx+c00v8
HMJecg9CdowT7+/puPJOEdeWUub7E8Fg3Y3UmuLYJmBy/mR1RfoM8joBt7U3h/at
U9l5Ord6uVN1iv/Ik5FdlezlDygmsojQdXCa/Xd1T6jm4JCkzRi7ugkfsvkV8117
NmEWLQG8Tt4FPLVbwfBpbqc9Os7ydgbyYqRFusCuicZCZBSUzIK1aZSykkJ7D78p
UwZXotCI2GZv58oPkTBi3HBQUSHixpITJtI2ChoREQr0WvhShqCma1QatuuVL3NU
j1pnwzl/QM8vsWOX8w30iMcGxRn8UEizMZyOkAgnB1cw5Hid0wW+bDAauN2L/fkg
xrIeknFzt5NrU5iZH0HvCLys5MvxrGxpVscfUpHCLk3ixgTuuv0=
=PYbO
-----END PGP SIGNATURE-----

--Sig_/7pYQw2hfzjuE2r=j._k=rHe--
