Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6264C56E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 10:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EA410E15B;
	Wed, 14 Dec 2022 09:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7CB10E15B;
 Wed, 14 Dec 2022 09:01:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b3so9352805lfv.2;
 Wed, 14 Dec 2022 01:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=axemcD0/ZzXi83xWF5go2Zfd1SFZy70eYQy/3mpCTb0=;
 b=a+2OimxkIUTvTo7ddGvGse2gSXlhrNT8fc02ehpO+WdWKfiCiBoifRN6YTfOhjvFYB
 D2UDmd226e66X92obp0loMnSQMj/z0f2b+4IQp4zpi+EZxdXDLVA9x1NW8TSoIJeEMQD
 g7iP/LMo8tt1jbDlJLUgXfr4l1vta+8ieFEU4pImRteLeWT4CXAGb9rhptuZuvtq3X+E
 5UOJB3XDu5NqGtjifl2OSu+9GNK2b8gE5zRl1OJJLym222vmvuvQe+oUnzauvdyyBwMb
 3QplK3aWTp5uzcsLQgy5oRowr17qKDtWRAWJ0u0+iRawvA63kBQQsBIHh54uzOb/YrEl
 KhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=axemcD0/ZzXi83xWF5go2Zfd1SFZy70eYQy/3mpCTb0=;
 b=WbavtcDdkRHfxkk11nvqJdKVRo7yMyV0DEeVcBpSZG0/WZw21FWXIMoj/KkhC6INFf
 7QrAuPopOzyMAfumtMZgwp4MsbAgPhPDEQaubxQUL5A6QpZNJahoRxvgyFTmk4WYF6c2
 48Far0J1Wi9ZPMWK2ay+orlL264fNLP9PHRP6grgJ4qdXxnUtclw9ok18uYX3iY3ElsA
 y3Q4+B/tk5aPGoZDqbrcVbVRlpnwStr+BrNxQphnHCbyRY/NKyzzaTgnUzyTq0mtMgae
 PfL8HQb1IYnFscLr6Y9yoJR/nZe9oj0Jo4cmBPO4D3AHP0AjlFO3vSHW0IrJAksorjva
 S3mA==
X-Gm-Message-State: ANoB5pkqDZipz7A9HVVkm53rAuHrQTsPajkPNmSj1lUwzJw/CUxSeD2p
 KA3ajOe1ya2eSkTJigBYDts=
X-Google-Smtp-Source: AA0mqf6QBYCZpobxzGNY3aMt6/yrQPJLJhq6J+7gdnUtbcCRSliR28isCCaS4zb+HORGlfVkSGh2LQ==
X-Received: by 2002:a05:6512:b81:b0:4a4:68b9:66bf with SMTP id
 b1-20020a0565120b8100b004a468b966bfmr8950772lfv.10.1671008493494; 
 Wed, 14 Dec 2022 01:01:33 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x14-20020ac25dce000000b004b5825fffb0sm726335lfq.88.2022.12.14.01.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 01:01:32 -0800 (PST)
Date: Wed, 14 Dec 2022 11:01:28 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Message-ID: <20221214110128.1cd58dea@eldfell>
In-Reply-To: <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XXRmJDE0L.gkhAtwppp4yLO";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/XXRmJDE0L.gkhAtwppp4yLO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Dec 2022 18:20:59 +0100
Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:

> On 12/12/22 19:21, Harry Wentland wrote:
> > This will let us pass kms_hdr.bpc_switch.
> >=20
> > I don't see any good reasons why we still need to
> > limit bpc to 8 bpc and doing so is problematic when
> > we enable HDR.
> >=20
> > If I remember correctly there might have been some
> > displays out there where the advertised link bandwidth
> > was not large enough to drive the default timing at
> > max bpc. This would leave to an atomic commit/check
> > failure which should really be handled in compositors
> > with some sort of fallback mechanism.
> >=20
> > If this somehow turns out to still be an issue I
> > suggest we add a module parameter to allow users to
> > limit the max_bpc to a desired value. =20
>=20
> While leaving the fallback for user space to handle makes some sense
> in theory, in practice most KMS display servers likely won't handle
> it.
>=20
> Another issue is that if mode validation is based on the maximum bpc
> value, it may reject modes which would work with lower bpc.
>=20
>=20
> What Ville (CC'd) suggested before instead (and what i915 seems to be
> doing already) is that the driver should do mode validation based on
> the *minimum* bpc, and automatically make the effective bpc lower
> than the maximum as needed to make the rest of the atomic state work.

A driver is always allowed to choose a bpc lower than max_bpc, so it
very well should do so when necessary due to *known* hardware etc.
limitations.

So things like mode validation cannot just look at a single max or min
bpc, but it needs to figure out if there is any usable bpc value that
makes the mode work.

The max_bpc knob exists only for the cases where the sink undetectably
malfunctions unless the bpc is artificially limited more than seems
necessary. That malfunction requires a human to detect, and reconfigure
their system as we don't have a quirk database for this I think.

The question of userspace wanting a specific bpc is a different matter
and an unsolved one. It also ties to userspace wanting to use the
current mode to avoid a mode switch between e.g. hand-off from firmware
boot splash to proper userspace. That's also unsolved AFAIK.

OTOH, we have the discussion that concluded as
https://gitlab.freedesktop.org/wayland/weston/-/issues/612#note_1359898
which really puts userspace in charge of max_bpc, so the driver-chosen
default value does not have much impact as long as it makes the
firmware-chosen video mode to continue, as requested in
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/995
given that userspace cannot know what the actual bpc currently is nor
set the exact bpc to keep it the same.


Thanks,
pq

--Sig_/XXRmJDE0L.gkhAtwppp4yLO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOZkOgACgkQI1/ltBGq
qqfH7Q//TVzfxBlcj2GhxbPlLOxC5I2y03D2UkWZdGwJ5I06LBwByYWG7iPDo608
e5wUK5dtUmvAYQVR5e2TmtJLLAGKyrMUd/3prA+ADgljvCgYisAuUHwVR0moxSef
2QAGED0ug64EgQ9rf5SE9FCHkZnWP7EJt/K3OQLXFqc9epeejKn5OEALQheas3os
dtg/eRN3bsHgpKF2j7XSSc4fuMsLlUPybiCMPEg3mPqmipya1JNK74DK6sIJlDZH
cekJZP+fS8RoehZU9IEoZNQpeLjfdvC27MRag/GASJkqzi06dJrzBJ0wV44Kqu2w
tPAx0VDf9xn2rvyxr9jAR48cpcmuuLLYrCZxNor3pJcAUsawD9iKdyQiTttO86SF
fMbGJUtm0bov3zCqAE+1YMojIKIPwkCdzh0b2T/djhEe1yPtmudkx+TEhISMzvZY
nf4rv8r5Ug25HUwoS92UfMDmMV/qqXsA3JNJacwwAL5jcC5wOm0SgDug2tJ3vKuc
Wpu8EvGHY7gPupXUl/vmFRVcDx1tJwvsaKSYpZmjAkzaG+kTi41fZTBIa4DPCdsD
HeiXcj5lhXZqom3715QuE8J6u956jbN4e5ycPUlcAQ5X5Y4SVIxY+ET51P5C4aXE
/U8kLzHTDkh8wITJj5akzvFruWVgBSjhtnRwE1SvAbwsgerKIIg=
=1C7k
-----END PGP SIGNATURE-----

--Sig_/XXRmJDE0L.gkhAtwppp4yLO--
