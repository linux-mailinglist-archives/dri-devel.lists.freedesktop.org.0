Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F95480A223
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95610EA7D;
	Fri,  8 Dec 2023 11:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D54810EA7C;
 Fri,  8 Dec 2023 11:27:28 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cb20b965dbso8463581fa.1; 
 Fri, 08 Dec 2023 03:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702034846; x=1702639646; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XxZr58bSnV7KWn9uUzycUqT5rmkJHyklLMrN4yrn2AE=;
 b=A6cqIMaUi7PISR+l2+EzJ+bTCvOuNPbo2PHX1eGmJq2JrCCLTM6yNsxsZ3oMJThRuo
 r9OW80dKwJyLzF12agBHsVMJcoAQjxyvOYLUop4UpXEFaJzwj0KjATz89e2ePiIjb+KL
 fkxCNCajNmtHlKn1R9sGv6PhdizjrYW4qebrlsfc56hfxw5XcHdV04BrqJflp9STcja/
 ToY/p+j1Kw5JAGlGrzzkK/Qm/pYg7rNstOuXA8q4B21jKaEy0qYfsYjGxKf7wbk0OSRv
 ASpbHMZnkolzbJyy0QpT6vR+ZAnacyPieLoUVw9nc7P0avHuWg91kFzC2uZH1l60jChU
 MZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034846; x=1702639646;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XxZr58bSnV7KWn9uUzycUqT5rmkJHyklLMrN4yrn2AE=;
 b=C/2yEAGbAXdZL33nSnznT0ilFIenbT/KajeP5AoBJTNlzwqHtCCRAHtkw+LjPubQuB
 vEzRefpl1zMXREcW71paxgNVVnWoITccAPS+N+CRR6CYc1irLuxOZLvU1ENlJjuuqOED
 fLIFZr6Jv+MJo5rlmgj9BOR3Tb2pByf0t8trJoimfyc/Ab3uhOUGDB/3SxmDKGBvTrnx
 hTFTK8Qgyi8TxHdooZEeGIiXRfQwIwNJR7XdW9nncOHMIzTOBUrKzvBwKbQetaEGa5Mx
 uIxHV52q4xg6Ii7HkIbgGDIQdlWsh96TuqMTAirpfKzu0bR4+3vAHfTHTHiEdyvnmu9x
 QCbQ==
X-Gm-Message-State: AOJu0YwE1x7X2ipaEvNvfAJT+1s2vNMPlwLUkYcQMnPgCiEffgJDk2/k
 dHMm6jAR+vjNKprPof0/2os=
X-Google-Smtp-Source: AGHT+IFonw8Fmr48eGlxM8b/3XzaKkOpRPpjjpQ36XAw7AMm8R9kwmeJnzUNirxB6P64enHo1td8Zw==
X-Received: by 2002:a2e:9b99:0:b0:2c9:f83c:5bc1 with SMTP id
 z25-20020a2e9b99000000b002c9f83c5bc1mr1344005lji.58.1702034845759; 
 Fri, 08 Dec 2023 03:27:25 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y13-20020a2ebb8d000000b002ca9e7a59e0sm202297lje.137.2023.12.08.03.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:27:25 -0800 (PST)
Date: Fri, 8 Dec 2023 13:27:21 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 07/23] drm/colorop: Introduce new drm_colorop
 mode object
Message-ID: <20231208132721.69b08df1@eldfell>
In-Reply-To: <20231108163647.106853-8-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-8-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UmcbXGTvGdrQQLyDmk1pW79";
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/UmcbXGTvGdrQQLyDmk1pW79
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:26 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This patches introduces a new drm_colorop mode object. This
> object represents color transformations and can be used to
> define color pipelines.
>=20
> We also introduce the drm_colorop_state here, as well as
> various helpers and state tracking bits.
>=20
> v3:
>  - Drop TODO for lock (it's handled in drm_modeset_drop_locks)
>    (Melissa)
>  - Don't get plane state when getting colorop state
>  - Make some functions static (kernel test robot)
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/Makefile            |   1 +
>  drivers/gpu/drm/drm_atomic.c        |  70 +++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c |  12 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  48 +++++++++
>  drivers/gpu/drm/drm_colorop.c       | 152 +++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c   |   7 ++
>  drivers/gpu/drm/drm_plane_helper.c  |   2 +-
>  include/drm/drm_atomic.h            |  82 +++++++++++++++
>  include/drm/drm_atomic_uapi.h       |   1 +
>  include/drm/drm_colorop.h           | 157 ++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h       |  18 ++++
>  include/drm/drm_plane.h             |   2 +
>  include/uapi/drm/drm.h              |   3 +
>  include/uapi/drm/drm_mode.h         |   1 +
>  14 files changed, 555 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>  create mode 100644 include/drm/drm_colorop.h

...

> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 8662b5aeea0c..841d393fb84e 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1238,6 +1238,9 @@ extern "C" {
>   */
>  #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
> =20
> +#define DRM_IOCTL_MODE_GETCOLOROPRESOURCES DRM_IOWR(0xD0, struct drm_mod=
e_get_colorop_res)
> +#define DRM_IOCTL_MODE_GETCOLOROP          DRM_IOWR(0xD1, struct drm_mod=
e_get_colorop)

Aren't these dead code now?


Thanks,
pq

--Sig_/UmcbXGTvGdrQQLyDmk1pW79
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVy/ZkACgkQI1/ltBGq
qqfVLhAAgu+Kk+g0hLsIRbp8OJRvYvY0hbY4GycqIwBtzuBt//4pqxA7DgZfEqCJ
f7B+TPh6umE+n4oEqYuog9PMuf4ejpjM6WV7t92YxyVPPdu3Hr47rS/o3+4Slk0+
vtr+Sg5LWIAHyLPaFY4hLdlt5BLsnM4q6u1nulOIc5hViGBK971/NEt8jFQfm6qp
OMsnZ6+JFZkYHr7tbKIh3xwcgHsU507jdft/ZfUl+uq0vlTpNWuAZ5JqjWHADWjO
YRCQnvdj+/MZjeAQU3Y7PBgK03DH3DiX0x9cuMVzcjfkD841S76SwMaw43ZOC9HB
Ch31gO/4UATevHKtkr9tqIWOa2QBVNZnahGUxCh4bjgqX9kr7U9bDTLZvSl+EDYA
wTG9Y/grwxb3cUc8tm3RwiZRRtfqB05BRPkLxcPc/FfOCVom4Xm6MTXd8IdIA3Ce
rzhjpcqew+oWfJZrZoqmjNzySmigX3eZQjEpC1aPR50d4UFWXCDFQdCeJq1iwTWI
/o5GrJ0C7jrRZrX6ZbuSvmU9aFeyrXwoDRm/hE37Qqmk47kSnnBr5kxUID6Pjwww
1Su2kS0hcOcAWsL5lQZ5HtZ7xGPJP0Pt/Cv9Wn0QGaGyf+o3h8AI016SxldEDXCQ
s5OCiiXvbj//XKX/zLL7QyEDSsnjz4hvdyUjQEQSyej1Vu7pCVI=
=e/mb
-----END PGP SIGNATURE-----

--Sig_/UmcbXGTvGdrQQLyDmk1pW79--
