Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E82D76A2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DB76EDEE;
	Fri, 11 Dec 2020 13:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FEA6EDEE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:34:02 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r24so13318365lfm.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=R90rH7EedmrNq5O63ECBK3Sn6WdFl+K2w2/MUuz1Tx8=;
 b=DiFam0s/V/t3eakUAXhh19E6EUqYx9F2Hhp8cdWIaNf/FiEFg9lJwdZEvZWhv347hs
 uPnvdxCWvDk5omprmh7Wx6UCOinjnPgtX8lpjivtvilWxAUbYTBpWndWRqnX0bekh5nT
 8oJlciKANjmwwUBV5tZpSDmBAhl/8I5WY25VP0/vSkTawEQ3PfpTfLFHa3+U2Ug1r10/
 l2B29FWEDlZM3x+Y3GcMFiOdYu2a1HVajNaLxTbS+big+6F88yOBwq4W/EvG5XWbTQOP
 h/c+Exzhzr3z5AX1D4FybvJknuF9PbsB/riJ65E01wQmUJ0qUPPeMolo+nNcs3i6R6aV
 PruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=R90rH7EedmrNq5O63ECBK3Sn6WdFl+K2w2/MUuz1Tx8=;
 b=d6+/ZJjJAMJ+c5UbPtNjMtclWY2q6bTe8wvTmWcpq0BqVdOS+M6B/5BnO6p6qjoMEB
 24pXQbDswpki2ofTV5jn7BZFDAHG/43+GaYUspENLUTLnUP01IpDiwAED0/AOEO9NBiv
 ovNCcpcOX6ZRWGkEtvEVfZtldI46+wpFCmfGL/JxXLolbL1jfq+y6o1SaQKp8db1n2yi
 z7AqgdJwkxTAciBRvbrnwGl1zdBc9Lfw2jyAq6fGxq9QH6eDE6wqvh4vfy/VidySo0vs
 8wpkl9tk8iysSELlC2GTVV//sgQPa1AMDTOqbfYAoPbjsY9QcKWSR5blSYHLoNXJ7sMi
 MCqg==
X-Gm-Message-State: AOAM530VN6Ok+8keqiVopA4u1AMiR+ZZIwCH25/GeENzopyTygp7ppt9
 XIO2xv3Oe9sulWE3YayTgls=
X-Google-Smtp-Source: ABdhPJza9w7ZEqwqu7iurPHF/I+OOiV1H1x36sJ1rzKANP+v4qdaP1jwxrhKsjkyYObseKm7gAtXeA==
X-Received: by 2002:ac2:42d7:: with SMTP id n23mr2170159lfl.56.1607693640692; 
 Fri, 11 Dec 2020 05:34:00 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n10sm1002379ljg.139.2020.12.11.05.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 05:34:00 -0800 (PST)
Date: Fri, 11 Dec 2020 15:33:57 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 3/4] drm: require a non_NULL drm_crtc.primary
Message-ID: <20201211153357.71cf9078@eldfell>
In-Reply-To: <58PfXYcauKFOHng9tchsfVjjt4XptOkdImbAxKpDwD8@cp7-web-041.plabs.ch>
References: <58PfXYcauKFOHng9tchsfVjjt4XptOkdImbAxKpDwD8@cp7-web-041.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1414450976=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1414450976==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1UD_OYkw/3H96Fb/ZYb3nRA"; protocol="application/pgp-signature"

--Sig_/1UD_OYkw/3H96Fb/ZYb3nRA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 13:06:17 +0000
Simon Ser <contact@emersion.fr> wrote:

> If a CRTC is missing a legacy primary plane pointer, a lot of things
> will be broken for user-space: fbdev stops working and the entire legacy
> uAPI stops working.
>=20
> Require all drivers to populate drm_crtc.primary to prevent these
> issues. Warn if it's NULL.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 3 +++
>  drivers/gpu/drm/drm_plane.c       | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 2c73a60e8765..fbe680035129 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -639,6 +639,9 @@ void drm_mode_config_validate(struct drm_device *dev)
>  	}
> =20
>  	drm_for_each_crtc(crtc, dev) {
> +		WARN(!crtc->primary, "Missing primary plane on [CRTC:%d:%s]\n",
> +		     crtc->base.id, crtc->name);
> +
>  		if (crtc->primary) {
>  			WARN(!(crtc->primary->possible_crtcs & BIT(crtc->index)),
>  			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compa=
tible with [CRTC:%d:%s]\n",
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 5d33ca9f0032..49b0a8b9ac02 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -57,7 +57,7 @@
>   * Legacy uAPI doesn't expose the primary and cursor planes directly. DR=
M core
>   * relies on the driver to set the primary and optionally the cursor pla=
ne used
>   * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(=
). All
> - * drivers should provide one primary plane per CRTC to avoid surprising=
 legacy
> + * drivers must provide one primary plane per CRTC to avoid surprising l=
egacy
>   * userspace too much.
>   */
> =20


--Sig_/1UD_OYkw/3H96Fb/ZYb3nRA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/TdUUACgkQI1/ltBGq
qqc8KQ/9E/k5Uh5Yk0obC/j/77EBV2+zKw41g4vT1IpczReYMkea0bURdfwXZV/N
jjUzFmWLsWP7+KD9VzcnsFQyCPexXWWefGgb7FhVLLdj0dNOyHkA/8wUH0sXCGZQ
24ob1EqNPGERSoFpCt2xq+jttFs0+EW/JhNc1TEL7hWldQCr3ernvSlXRP45zN4W
tRBSNUkHcN0eDGKTV6gIUvnZu/wq1sqa59fti+puas21aL/FSlgXAX/UgsnXpBKT
7g+NI30kAJ+PQMFT6sIxt6c4X1ct9l/fwrcbLBrVQUhi3YAhQssR3iSPu+gRUCm3
g59b9XIGgREqv0DqzvIz2xQIDO/kMEYQCc5PuOwp6GBIINg3UAKd/+ym6HKutFzs
W/oLCnxJxWd9TBBcVRBZRdwnueIzfRzxpw1DxuW6MXlirET/zuAw3tMDb7r2hEMp
meQkQJCMy2dyhUfVwUkuWhj7Qx+DgmnUM9yvf9yPtJt2X7cOROxwjEh0snPEOhZa
w6ZhTQdFbTdjn24PsIiR5VSfWP5ql5BxLyZkU7KnJUikMley01Drwia4+ahpg4Ao
oqE1Wnq/lPqja0cT5Xppcv0g/TZdB5Z5Jp+e59LdncUAG578Mj7NazjTTsbaDZZV
uWqAmBnxnTKfPC6KDwyWTPgA3GUGXVN36VlYPhsC6byfCAUAMKg=
=mDN5
-----END PGP SIGNATURE-----

--Sig_/1UD_OYkw/3H96Fb/ZYb3nRA--

--===============1414450976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1414450976==--
