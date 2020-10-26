Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0545B298DAD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 14:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4766E9BB;
	Mon, 26 Oct 2020 13:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523AD6E9BB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 13:21:22 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c21so10056411ljj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=a7oNFJWFNuhEAtESkg795axJ6cQ6r36IKdbSgjZ77YQ=;
 b=r0uGOCLKFd97LhtSy1+hfXLgQXmQqXGdxL35fy300OzXKcUpyOz/l71liUlQ7RQqpO
 n439YfJS5PQFaIPUsjxTs1Tndlm1UnMBumljSfGg9S43OujIXFHQ+NYF/i1JO/viHkB+
 A5m90BktTMCBdQiGDfWZGt5iVI2Gckv5KrX4/50cFIYrJNOk86wAGY8BWDinLScvIjCE
 3s59mccQ3vbiDhohKAPz58F3PGrbs0bhenQ8t6xsiHtzI9VeQYhH6vBPcqRFI2i+82b2
 0dkl9R8WwODFvGALBfLeWjvw8kRnF2hmHcXDiCYM4TxRsGWs+N+/N942B5SGHlVxGeio
 J2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=a7oNFJWFNuhEAtESkg795axJ6cQ6r36IKdbSgjZ77YQ=;
 b=cX+o1T+4XDcmh2YLEbDAwJAHUH4Fh5Qv2y6d562H8z9c3QySdJCldwol58O5dc1Bvi
 4BJATwTj5tK2vqp0A+LZQ7X2pUN3AHASoibh0Asy/j4g48fR4MgOWvgPv2zHh0zQxwFN
 WUOIMshl3rhKgUaMaDboadYe/NEIBMkRiJX66G5TtFFWoI19YJlp2NwzFemNxCrPO8W8
 uROdLBFzNcrrxfm/T497USxvbiPKIJ6znWvh2t43cQUXE3b/eHnrvMJYvcH9vJoRbZcz
 n181i6pGKtTVvdyH5XUAiZHbNamhG9PD7x8flDTOTu63+BJ7K9ccRmqXdpf5rS0Q8w2D
 PMJw==
X-Gm-Message-State: AOAM5318flrjOw142EVJtmpBfokNPwGZrry7KqRv+5Qe8wmYXPAID8nW
 XLuSMfQW0YPtUVZrdscBoko=
X-Google-Smtp-Source: ABdhPJwf3kuFjII57+NmRblpqdlNrjzPFGy/S3d/mtVGDxVnN/E9OZlaFymJpmTnrKIMtikTlcH/fw==
X-Received: by 2002:a2e:97d0:: with SMTP id m16mr6134990ljj.88.1603718479278; 
 Mon, 26 Oct 2020 06:21:19 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y22sm1173069ljm.25.2020.10.26.06.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:21:18 -0700 (PDT)
Date: Mon, 26 Oct 2020 15:21:07 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: deprecate DRM_FORMAT_MOD_NONE
Message-ID: <20201026152107.5fcb2ecb@eldfell>
In-Reply-To: <a2j8KTgc26k5QniSAhDSTgCw4XWZhmsNHwG8UVa6U@cp4-web-014.plabs.ch>
References: <a2j8KTgc26k5QniSAhDSTgCw4XWZhmsNHwG8UVa6U@cp4-web-014.plabs.ch>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1251039650=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1251039650==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gT2dzgj6P6+zZtQ7F=umSKZ"; protocol="application/pgp-signature"

--Sig_/gT2dzgj6P6+zZtQ7F=umSKZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2020 13:17:02 +0000
Simon Ser <contact@emersion.fr> wrote:

> DRM_FORMAT_MOD_NONE is in the list of vendors, which is pretty
> confusing. We already have DRM_FORMAT_MOD_VENDOR_NONE. Move it down in
> the list of format modifiers.
>=20
> DRM_FORMAT_MOD_NONE is an alias for DRM_FORMAT_MOD_LINEAR, however the
> name is confusing: NONE doesn't mean that the modifier is implicit,
> instead it means that the layout is linear. Deprecate it.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index d720f1e8ae5e..ca1d5587b5fc 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -350,7 +350,6 @@ extern "C" {
>   */
> =20
>  /* Vendor Ids: */
> -#define DRM_FORMAT_MOD_NONE           0
>  #define DRM_FORMAT_MOD_VENDOR_NONE    0
>  #define DRM_FORMAT_MOD_VENDOR_INTEL   0x01
>  #define DRM_FORMAT_MOD_VENDOR_AMD     0x02
> @@ -422,6 +421,14 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_LINEAR	fourcc_mod_code(NONE, 0)
> =20
> +/*
> + * Deprecated: use DRM_FORMAT_MOD_LINEAR instead
> + *
> + * The "none" format modifier doesn't actually mean that the modifier is
> + * implicit, instead it means that the layout is linear.
> + */
> +#define DRM_FORMAT_MOD_NONE	0
> +
>  /* Intel framebuffer modifiers */
> =20
>  /*

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/gT2dzgj6P6+zZtQ7F=umSKZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+WzUMACgkQI1/ltBGq
qqfVJBAAsN8ibl2+6bgthqQZVXye7vK4VGvtZkqnAnmFtHJ+IiLuCp36JkP4bekc
4JgL4gzkTZILG9VWjCr8zFxb8KM53N1T92ZsifLhxuJ7mIGRMywLo2IQOySZL8PF
F3MFVVisNawUd+zawj7ZDRvfNwP44xixTyavPPq/ORUNSFiLwFkjq4oBAwDxXZQI
v5rhKa9wGIIwwP/bVoSzimqsrDHTc3kY4/FFKlC02CqTE1aTwYiuePWpHpzkDWog
NNU2/pQvjzRzjyITf+xmGr103Wm/9Lm8ceZoFysV6IYJ6W14Ipocay4nNT36f0zu
LQHWJtR5jvvL7L304N/I7MVEH1Q7KorAcbC9ctocWRL1A+aA45gEfcnPH/mU8CT5
N04TOla/3vUsk8E1kSCJYtVDYUM10YVZune+4NmYnKB/GRyP3SLbK5VyhjKsCWYG
Z1+VG/0zAjR5laUDPEFIe3lluZFr0OV0PJuuwTwwa9Qe87ReS9+5JbdudfZKxvFV
IPl0sdd7YzoPLrjazfR3Jxx/Brn4Y/2aE1AMyDQZpYqJrXuNmSdHXVYgfTCQRRhG
JeDHD2XEpJH220hvtfihrFoIygtvb9livRu8Ozvd58tZF0qZwEvVHfXuxSK6BzYf
eq4J26Pyh94iLvTDbpzXFhZDi6pcBGDm2n7ctdfANnrOtjvXn9g=
=o38U
-----END PGP SIGNATURE-----

--Sig_/gT2dzgj6P6+zZtQ7F=umSKZ--

--===============1251039650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1251039650==--
