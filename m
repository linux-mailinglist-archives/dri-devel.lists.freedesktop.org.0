Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1957D48AA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 09:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0818710E2E4;
	Tue, 24 Oct 2023 07:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810E410E2E4;
 Tue, 24 Oct 2023 07:36:18 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2c594196344so5650021fa.3; 
 Tue, 24 Oct 2023 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698132977; x=1698737777; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vNXLRTQD2rhYpRLHS1vdxpMTD+M/1xXcTTodDZ8Gpi4=;
 b=YuqlukNL80Ytq38y3jcfFWSDlvyGLyDJtgDH4D6Yn8/d+KRZf0xtpSpdH4P5UXK6PP
 9v6QG0QoEGyltGiOt3LW8T8yedRJlwZ7IwuemW3aBA/TO9Q9PZRyuadzX/1JKobqGqSQ
 t/pPd5nMFREz7vliUB9oSnAwCZJelFfzvx72lbj2rmduPGSIbLmwGY5kQW3Qq+WALRBW
 S8NJ+PWL1HfH8M/foNxIdysstVFPFZl+YcquoLJPyrcV1YvkhgTDiTYrYAnLRFT+IgFM
 6sb59HtxwdiyYh5wuTWFb0a4TCn3A1rQqGHhoaotUo+niHjOginVwd7MagO0TGL+4XMS
 T6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698132977; x=1698737777;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNXLRTQD2rhYpRLHS1vdxpMTD+M/1xXcTTodDZ8Gpi4=;
 b=nMIQWXjEqpeO1okg8VXPIE7nxHsj6Zs6hb6wfmhRV0V6xM/YywMWgIR1rzh08lhec1
 m6Rpn8/k4FW8/YGotWMkAn/+g9xcxNjmc9CERhzgRdBDY1s64Ie1gnIF4lw4BFGVP4aR
 8my/ox+xKW0trZ528MLq4Ng8/kXBUXyvXo9xIBa/DNJeO0EG0jjnH/U0Uh5uzjf2lmNP
 7VqvtFAnjWz+p3SQuxYWPvGejcFrFnL/qTLEBgQVOKJ7xJrdBoyv1TiclWGSQfLIm6aK
 7g+PeGIVOs0CuyQCpVmV/82QUG02UgGJ55y97RBE+3soy1IJaBpPxLRXEVKmF/7hKu/k
 6JPg==
X-Gm-Message-State: AOJu0YwsBUvlBVMZxEuPOM96dIImxWm5Ip6EWx+YvxIJjjHGyAXjrSzA
 NXDT3yV0EL1SKGUNkAhaUqg=
X-Google-Smtp-Source: AGHT+IHdmQv8NUYkJyvMm9UscwHe4urgCazEpqMtGpDUBUdb+3FOmJOQdgf921jh0Z9c/zw7Sntcwg==
X-Received: by 2002:a2e:bea3:0:b0:2c5:d52:a08e with SMTP id
 a35-20020a2ebea3000000b002c50d52a08emr9625574ljr.20.1698132976246; 
 Tue, 24 Oct 2023 00:36:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 z24-20020a2e8858000000b002b9e9a8532dsm1936004ljj.138.2023.10.24.00.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 00:36:15 -0700 (PDT)
Date: Tue, 24 Oct 2023 10:36:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: describe PATH format for DP MST
Message-ID: <20231024103604.6dd7f6d5@eldfell>
In-Reply-To: <20231023203629.198109-1-contact@emersion.fr>
References: <20231023203629.198109-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qoRgGo0IEGzaEm2..UeouYJ";
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qoRgGo0IEGzaEm2..UeouYJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Oct 2023 20:36:39 +0000
Simon Ser <contact@emersion.fr> wrote:

> This is already uAPI, xserver parses it. It's useful to document
> since user-space might want to lookup the parent connector.
>=20
> Additionally, people (me included) have misunderstood the PATH
> property for being stable across reboots, but since a KMS object
> ID is baked in there that's not the case. So PATH shouldn't be
> used as-is in config files and such.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_connector.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index c3725086f413..392bec1355a3 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1198,6 +1198,11 @@ static const u32 dp_colorspaces =3D
>   * 	drm_connector_set_path_property(), in the case of DP MST with the
>   * 	path property the MST manager created. Userspace cannot change this
>   * 	property.
> + *
> + * 	In the case of DP MST, the property has the format
> + * 	``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of =
the
> + * 	parent connector and ``<ports>`` is a hyphen-separated list of DP MST
> + * 	port numbers. Note, KMS object IDs are not stable across reboots.
>   * TILE:
>   * 	Connector tile group property to indicate how a set of DRM connector
>   * 	compose together into one logical screen. This is used by both high-=
res

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

with or without the suggested "guaranteed" wording.

Are DP MST port numbers guaranteed to be tied to the physical hardware
configuration (e.g. how cables are connected) and therefore stable
across reboots? What about stable across kernel upgrades?

If I knew that, I could perhaps manufacture a stable identifier in
userspace by replacing the parent connector ID with a stable connector
designator.


Thanks,
pq

--Sig_/qoRgGo0IEGzaEm2..UeouYJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmU3c+QACgkQI1/ltBGq
qqcITBAAia4FN4VKYBGOjjoFp1OYDRZVJjNDDl1G/q1AMhkOiJDHL9mT00gz2HLZ
P9vLKWun7iOMQG1OG4GJU/K+PV/sInTwbomplq7dRMs+vXRejvti8bqXNwhFy7mC
3O9aBy8cW+DiyeO2NJdX1RghOTEY4EmVv+7OAm2hLi6GR2w1rf/o8gFGdaYgyFOh
tVuw3Pj+PRnjjEEpgQokLo9HCfcnZWAYjFFMy/Hrgxt8uIMlO+h+vzjYLtXjt4J/
BRe+h8uMkeUh04Il1mHtzZ4dWI4O+XIiugoPw6tt7p6rdSG49NgCTRTyUXBmBJa/
wzLD0ceF+e5y4kMAKuv7+Dk5s7xggOlqJ2ARXoX/j9JXvSbcHHDAkvMhPW9YxWm7
5CtPD/UviDTccoyOR+rHeQDoo3Wz4kIsz7TOjKlFLTQN+leX1FAoZYgHEIW00yzT
v5+Be7mDYz8mXr83ZLVndblsBVfJC3SgZFHkyXDSLADvikoUUPogJ+RHdwRl1b2J
ciL+lkuoOJ8Ay2vsZnkgUfa+R8ZlSNSExI4yePSv3n909I/UACcmwQ3iPJPH4+UO
mdkq8jhME1LMwcGS3zrUFlRqBhc96IgZedzQ5BTab731sUXzJNeRAAunOyeNm51K
dLt7svfRgTaLIhsh+6fu5p8oj2NKUXMK/GAygnXy/QEZ8Nb+9W0=
=z7pB
-----END PGP SIGNATURE-----

--Sig_/qoRgGo0IEGzaEm2..UeouYJ--
