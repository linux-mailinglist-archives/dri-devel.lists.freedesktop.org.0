Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E071E100F
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5211089B0D;
	Mon, 25 May 2020 14:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D05189B0D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:02:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w10so20931385ljo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=PY960s7lB0N8KSNBizUxLXe//6z+UVwONUEjVw2feOo=;
 b=q/SYKJPOFjXkD5fLaI6WuzfccjgwSllZndKbERSkqz22LHepoD3gPY7ukQE55gtX2J
 qUv+pJT4vuo+J04IpbN4tBV2Tq3jLthwNGSge6TDGEal5U0xSuidhfrGoaNKNhaIZbJA
 ngysYjgl5+zDLC/GSk/EUBdB/EDPT7cjXhLperJGA9VWVqpzvHJSds0aKpkG3LeeXftN
 621XldP2IGCDjhIOXlb65pxjEYtibalPZZLW4jXlYDRqCz3yQ9fjKwmXvYsYXiNvqfB/
 fwNW2XIjw3kVgqcezO/68DZgQ4Rj3NdgLX1u2V22wHRFRwLqGHc3yDq+aSnMwM6Btimd
 PcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=PY960s7lB0N8KSNBizUxLXe//6z+UVwONUEjVw2feOo=;
 b=R7ZQ1l5QAJaCDVQcqg/3SLaKtE5n0+wA1ab+Fr1J19g1bxcDBFzk4Z3pksONdLHBum
 uTaVcN4+I8pmpOV0XtAaqIR14r80jcKUnZdQzH9/zh06I1kDm2isY+kjR7muQwufDpIn
 hLE1lVlJo8QeM4CGwNomclkEFdePC2RZPHnLFIS4dlzhw9w8NLexnVNRiAf9pAXgQ5oN
 Hs2qkgWfSg4DHKaS2ozCyoxzNKqD9U8Prh8hQ2rrgOgPD7FBJRFQWxPSqe3yyul/IMFK
 PdpiNI1hi79zPa7keJ3w/qTOeblMZ+WB6rWErDFi9rJbpPZ8kRETD5V9TRZNu3QHYoSs
 jKLw==
X-Gm-Message-State: AOAM5300AZFp7FAUdXsaZdIml1rj2ADuweOsjLIeMSvNFPXfrjjhlV2k
 RNL7B1TGmqxZrgMBllPhR+s=
X-Google-Smtp-Source: ABdhPJzrSdSGmTn3HgVmI0IDLDMLgxapqiy6bOCTZmkE3OZqXt3L7s+SbGQfBJ3Hbi09zy5FKrlhXg==
X-Received: by 2002:a05:651c:1132:: with SMTP id
 e18mr12543638ljo.73.1590415336577; 
 Mon, 25 May 2020 07:02:16 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f12sm4954606lfp.8.2020.05.25.07.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:02:16 -0700 (PDT)
Date: Mon, 25 May 2020 17:02:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: add docs for standard CRTC properties
Message-ID: <20200525170206.2c1baf11@eldfell.localdomain>
In-Reply-To: <k52vYFBQ5ZO18TgZl3W8MgP6f4qu5Ncir7w-On8Dm0V2KTAcVkUoS7-IGPcvDJAXLsyJAUsD0QFJts3Dy0yWyHXVh85axrZkybh3MGGFhQc=@emersion.fr>
References: <FFaYYfloz0zbXJxx2uxoPluNTicf8VUdrLHL7DBuruShcow3aqIQUZui6VL3RNhFu6HlXvm-1jxmw1N3mKX-K9dr73osz_XQ77CaJ9W5zKI=@emersion.fr>
 <k52vYFBQ5ZO18TgZl3W8MgP6f4qu5Ncir7w-On8Dm0V2KTAcVkUoS7-IGPcvDJAXLsyJAUsD0QFJts3Dy0yWyHXVh85axrZkybh3MGGFhQc=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1074882505=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1074882505==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tOn0wQrwzQ+I0uqPjXOL6T1"; protocol="application/pgp-signature"

--Sig_/tOn0wQrwzQ+I0uqPjXOL6T1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 May 2020 11:09:31 +0000
Simon Ser <contact@emersion.fr> wrote:

> This patch adds docs for the ACTIVE and MODE_ID CRTC properties.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: Daniel Stone <daniel@fooishbar.org>
> ---
>=20
> Thanks for the review Daniel! I rejiggered your suggestions a little to
> move some ACTIVE bits into the ACTIVE description.
>=20
>  Documentation/gpu/drm-kms.rst |  6 ++++++
>  drivers/gpu/drm/drm_crtc.c    | 27 +++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 397314d08f77..975cfeb8a353 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -460,6 +460,12 @@ HDMI Specific Connector Properties
>  .. kernel-doc:: drivers/gpu/drm/drm_connector.c
>     :doc: HDMI connector properties
> =20
> +Standard CRTC Properties
> +------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_crtc.c
> +   :doc: standard CRTC properties
> +
>  Plane Composition Properties
>  ----------------------------
> =20
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 4936e1080e41..fafb8d3c3235 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -204,6 +204,33 @@ struct dma_fence *drm_crtc_create_fence(struct drm_c=
rtc *crtc)
>  	return fence;
>  }
> =20
> +/**
> + * DOC: standard CRTC properties
> + *
> + * DRM CRTCs have a few standardized properties:
> + *
> + * ACTIVE:
> + * 	Atomic property for setting the power state of the CRTC. When set to=
 1 the
> + * 	CRTC will actively display content. When set to 0 the CRTC will be p=
owered
> + * 	off. There is no expectation that user-space will reset CRTC resourc=
es like
> + * 	the mode and planes when setting ACTIVE to 0.
> + *
> + * 	User-space can rely on an ACTIVE change to 1 to never fail an atomic=
 test
> + * 	as long as no other property has changed. If a change to ACTIVE fail=
s an
> + * 	atomic test, this is a driver bug. For this reason setting ACTIVE to=
 0 must
> + * 	not release internal resources (like reserved memory bandwidth or cl=
ock
> + * 	generators).
> + *
> + * 	Note that the legacy DPMS property on connectors is internally route=
d to
> + * 	control this property for atomic drivers.
> + * MODE_ID:
> + * 	Atomic property for setting the CRTC display timings. The value is t=
he ID
> + * 	of a blob containing the DRM mode info. To disable the CRTC, user-sp=
ace
> + * 	must set this property to 0.
> + *
> + * 	Setting MODE_ID to 0 will release reserved resources for the CRTC.
> + */
> +
>  /**
>   * drm_crtc_init_with_planes - Initialise a new CRTC object with
>   *    specified primary and cursor planes.

Really nice.

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

And the patch 1/2 R-b as well.

FWIW, as I cannot really check the kernel code is like this, but it
totally makes sense from userspace side. I didn't even know these
little details before.


Thanks,
pq

--Sig_/tOn0wQrwzQ+I0uqPjXOL6T1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7Lz94ACgkQI1/ltBGq
qqc9gg//RCIRp3S3EdLWHA6b6L3vPbygIxlDV4Tbh9eicrbKkyUNyMeNFrnYpSnR
5SadkXvylv24wgzQoMYgW0gdln31qyjGVujFz6aYPG/ZwbBHuw/YY17lxcdHiz3p
H+jWH+58HETrJKpB/DGv5K9ISIU343bBxdZsBMh6wIQ/oz5/i6Vv1HtMYnp4zH+f
/apV/GNznWM/2xEapXyo+HqHfEqkjiTp6G9oJNbrPHRsqm4J+U01kWpmiSrxM1gZ
AHs9Q8boV2W3As4haVtqo9HOe8Vh4J4rqieLm++eeQ4jQmpSjBpJQArEXWwqXq2p
KrrXvf2LNTn7ni1HP75i6E6of+mOrycWiNRQB6K2Eled7pK0Qn9jdlWssux7Wc/v
caSuNKXGguBOAoxJfeylbLwQ/slLdOv0pTEHY+fPlwPmSdhF0of9AyYPvQSqz0tl
d0qoOlNidNOgdNiLcRb7uCOBL3eHg1mwpIoSMEIArG4S/69mfVmiuAj3SyJenfCt
A679uUWIsm8IRuetCgVJ+aLiwcUOLoPjpLo0tYlc6M29sSkzPrnjcR4QdTKRFD/M
tYBnifbK599vJZQPz5dfArwxt4rqAgEnSeeEdxf1Do7bmR5Iuxe3xI9b69ESy1G1
WraTztUEWbhta31qYEyK913KoTU78nRqgNd+fZr3LNbHZts94Gc=
=mTFF
-----END PGP SIGNATURE-----

--Sig_/tOn0wQrwzQ+I0uqPjXOL6T1--

--===============1074882505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1074882505==--
