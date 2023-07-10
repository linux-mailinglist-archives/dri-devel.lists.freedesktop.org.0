Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2C74CFEE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9795310E221;
	Mon, 10 Jul 2023 08:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C7910E22E;
 Mon, 10 Jul 2023 08:31:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso63278621fa.0; 
 Mon, 10 Jul 2023 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688977858; x=1691569858;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=U+wwP6BZLzF4aBD+iXkaOcxcJALLks32tIeZUMT3jig=;
 b=LUI5nhWNqI9r+4yE8lFZyyJsSVi0Bao3yiv/RMb6OBnuPaUXqKLz2xA14FApN2TndE
 +2a379MRuZAGcVBAnWhchUXI/8qEWlAAmTcFhbED9GrOZ3o2OtYokGICA42KLx6A+pgD
 6Coze1rBwsd0EF6R1iVBGha4vqgvRbu6+6mzrFVJA3Louc66HVHKZTurrJHtUNIuG3Iy
 g2xvwAb68boZmKgOBfBInM65ZB19LfjeblgpEXw8kVyRJZ8e5pKODI6IU7g9rKo9B1ug
 Rcrm66K3+urS1CRYhZe4841jjpL7/PE0/IY2dLv8Pkhzagii7Mx4K54uQ/x/TKXhMpIt
 23BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688977858; x=1691569858;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+wwP6BZLzF4aBD+iXkaOcxcJALLks32tIeZUMT3jig=;
 b=XLwr3XGxfJfmAuc2iE2Qr7+AUdPY+bJ1LzO9zPWudOIozJznd+ZY2s/lGu6iT4Gnqn
 CpWROzfZWrue+ehO/AfLj5TsCceMqEepYb0o540gbpDiedV/gbgdRUodAsqBY9zhckmC
 +1IaUTgDeAhezhvTy4Eya7ypliiHcTgbt5YBtUlw3g5FXSaQXhH0+AUfzXxCvzBXMOZ4
 a1LfsGDBqjQ3IL9OkS7eJ28GF/b/lYxshbds4808ySgoLy2ROab30TwQ8gDFgqLMdHy6
 RLCxAVWKaoEos9swlnY3doZj1gwiQtRQ9zhOmiDqPkmBd2uwe99EHdFSyha7PwH8Tbmj
 LHrw==
X-Gm-Message-State: ABy/qLZdiuTzv9sKeUzueKABEZGNlkU+o7vEzyaDmoKzV917D8fFEDYH
 oBITZpZBNzwBzF/xcyG2Am0=
X-Google-Smtp-Source: APBJJlFNweCwSbQM+3RSfPGHeoFrTm2G6HK8bCTnODC5rLeGIzrVrtgh6QGcgh1+yObWGKnGBjZ+mw==
X-Received: by 2002:a2e:88cf:0:b0:2b6:a804:4cc with SMTP id
 a15-20020a2e88cf000000b002b6a80404ccmr8805171ljk.53.1688977857370; 
 Mon, 10 Jul 2023 01:30:57 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c24-20020a05651c015800b002b6fed37b18sm1843654ljd.101.2023.07.10.01.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 01:30:57 -0700 (PDT)
Date: Mon, 10 Jul 2023 11:30:54 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v5 6/6] drm/doc: Define KMS atomic state set
Message-ID: <20230710113054.316a9f31@eldfell>
In-Reply-To: <20230707224059.305474-7-andrealmeid@igalia.com>
References: <20230707224059.305474-1-andrealmeid@igalia.com>
 <20230707224059.305474-7-andrealmeid@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_cBaQ_yD9IwDg/Rsy2Dl+2I";
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 hwentlan@amd.com, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_cBaQ_yD9IwDg/Rsy2Dl+2I
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  7 Jul 2023 19:40:59 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>=20
> Specify how the atomic state is maintained between userspace and
> kernel, plus the special case for async flips.
>=20
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> v4: total rework by Pekka
> ---
>  Documentation/gpu/drm-uapi.rst | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

Thank you for polishing that email into a proper patch!

For patches 1 and 2:
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 65fb3036a580..6a1662c08901 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -486,3 +486,44 @@ and the CRTC index is its position in this array.
> =20
>  .. kernel-doc:: include/uapi/drm/drm_mode.h
>     :internal:
> +
> +KMS atomic state
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion,
> +without ever applying intermediate or partial state changes.  Either the=
 whole
> +commit succeeds or fails, and it will never be applied partially. This i=
s the
> +fundamental improvement of the atomic API over the older non-atomic API =
which is
> +referred to as the "legacy API".  Applying intermediate state could unex=
pectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which me=
ans the
> +complete state change is validated but not applied.  Userspace should us=
e this
> +flag to validate any state change before asking to apply it. If validati=
on fails
> +for any reason, userspace should attempt to fall back to another, perhaps
> +simpler, final state.  This allows userspace to probe for various config=
urations
> +without causing visible glitches on screen and without the need to undo a
> +probing change.
> +
> +The changes recorded in an atomic commit apply on top the current KMS st=
ate in
> +the kernel. Hence, the complete new KMS state is the complete old KMS st=
ate with
> +the committed property settings done on top. The kernel will automatical=
ly avoid
> +no-operation changes, so it is safe and even expected for userspace to s=
end
> +redundant property settings.  No-operation changes do not count towards =
actually
> +needed changes, e.g.  setting MODE_ID to a different blob with identical
> +contents as the current KMS state shall not be a modeset on its own.
> +
> +A "modeset" is a change in KMS state that might enable, disable, or temp=
orarily
> +disrupt the emitted video signal, possibly causing visible glitches on s=
creen. A
> +modeset may also take considerably more time to complete than other kind=
s of
> +changes, and the video sink might also need time to adapt to the new sig=
nal
> +properties. Therefore a modeset must be explicitly allowed with the flag
> +DRM_MODE_ATOMIC_ALLOW_MODESET.  This in combination with
> +DRM_MODE_ATOMIC_TEST_ONLY allows userspace to determine if a state chang=
e is
> +likely to cause visible disruption on screen and avoid such changes when=
 end
> +users do not expect them.
> +
> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
> +effectively change only the FB_ID property on any planes. No-operation c=
hanges
> +are ignored as always. Changing any other property will cause the commit=
 to be
> +rejected.


--Sig_/_cBaQ_yD9IwDg/Rsy2Dl+2I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSrwb4ACgkQI1/ltBGq
qqcBAg//RoZa8NlDML/orFXTdrRJYvLDZ4R3Cek3ssDoj7yBDQy6HnXaLJwHwkf9
WhkN28UTOu00/CsmgAVT2P3Cuz5ebS7zJsLkBqS7OzLqWx+8+WodZW8BswZvRilo
EhrDGDDd+/8LFd57y2XFyuIMiwfDkK3ME17zl0s0fiGXtOixe4O3Q/vHajdBTp84
JpLJ+fxnD2T4/R7mva7YxPPNbSxX/rTwkmcedf16MEfk6KX3LIVrGWQ+6jIyXMKQ
ztC+R9R9SQ17WKMVck70nq82NwfF+VaFf78szBGnBkVTIn7jTRoyCPLn5mtLxzxT
AS9/5y4JUbtb8d7Q/pG6eOdr25oUhJjSqhGBz83qicAn2U+dcwi9QzehyD9Kqd9S
9NUjc8WN8mZSzt+8Pef528m3Ts7JrF57HJ4BTehuFhqXl/taJSJVGF8uBj4ZHiMk
JUT4d/VUfsUnfWv59S8I9AyupcpvEFQnMW7r/RGJL3M9vNV3YVo4SEAlllmtTnA0
l9Gi9o78iAc8vCdu5s+BWLyOe0rGkER1yAHJq+5LYWRpB+FWVIjcwS24JoBs9P15
6Ba2dhHeN2/mljk/QD8HQrGrvWJPj+x9jY/YyZYETnwRQaFZnCtZeldoFh2WIvZb
4YVxdUuDvOSuzYwIXWWaV+t17+iWBkk6yTyWzC1hO4vDosoMtQw=
=LMkp
-----END PGP SIGNATURE-----

--Sig_/_cBaQ_yD9IwDg/Rsy2Dl+2I--
