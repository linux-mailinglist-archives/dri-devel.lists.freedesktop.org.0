Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355C57D3B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D206E815;
	Thu, 27 Jun 2019 07:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2A76E811;
 Thu, 27 Jun 2019 07:36:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 131so1282367ljf.4;
 Thu, 27 Jun 2019 00:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HEi2fpVTFwJEiLRLLQyi012bkoNHALIBMdoqRrJqmqc=;
 b=Ji9wkJBxAO3cHcrsd32ihPj7WPBHE1zuwki6dP90nT1pDMAJZJPKfAS/kVSpilOE9U
 9+atrcydJ992GaVGEivB7fEpsw0Pm4p/k+n57NSkcsyYU3BjFMe0qEnIMBW94Ci7H5rI
 ewF/dW9GIwt82r6HtXbSrzJUYNj+1Gfv1Yv2xIugAf5IsvAJbueb9Wa2QmjfGiRWFvdp
 jdpALuMmHZ+valpc/twblSzBG7T3bI7X2481wTAgDgt4gzRlZWn5f2XGZEsThOhfCwUM
 Z8uKODKC3BD3ZUMjzTqqs5ii43v/fNLFpSebwhis1Bk9PzT/+GelBivuVYJJ6jFvuGgI
 8c3A==
X-Gm-Message-State: APjAAAWW54oPQMK0BlBGKajhrCYN+R0jk4/L46y6RKVxuiCiXf6b0CG6
 R7UdXxwAdSfWlzelUdIvrjw=
X-Google-Smtp-Source: APXvYqxv14eq5yKd+jfGYQEuseS9it3DoVZQLKetzae2LKU/qmOxhrsoki3uz70BA29GNWFEnqS8KQ==
X-Received: by 2002:a2e:8741:: with SMTP id q1mr1659960ljj.144.1561621015700; 
 Thu, 27 Jun 2019 00:36:55 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 2sm213790lji.94.2019.06.27.00.36.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 00:36:55 -0700 (PDT)
Date: Thu, 27 Jun 2019 10:36:51 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [RFC][PATCH 1/2] drm: Improve PATH prop docs
Message-ID: <20190627103651.1683e3f2@eldfell.localdomain>
In-Reply-To: <20190613184335.7970-2-ville.syrjala@linux.intel.com>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
 <20190613184335.7970-2-ville.syrjala@linux.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=HEi2fpVTFwJEiLRLLQyi012bkoNHALIBMdoqRrJqmqc=;
 b=t03TgFN15Jvxp74Fj7cxdSeHK0DQzoSFEpLQWyLR66SfjlKSPGmiNy1q0pIAlwlORf
 JtlxnuA1X4ZRghd6jIi7RkKy9vtxJpS25ewDp9v+p7/y4weTOFqfAd/A3mnDPlLRmi46
 UW7FGadLaDoQf8Fes4oi1a9a1JVFQ6Ua3+wq/vLXgWP6JBqlTQ3RJ4ufB0YkB4EsyAdr
 BKbyoLVy+Z61E9GSsM1HN2aSP0lrN4QbB27zcBSURwIQdIA2G8sXHSP2l114vG982fLC
 WazdHncDmWW3UQIpkbbkw1Sr5E7W0boChJEfJyRO71TOozdq6evMNWBN+PZCy56OR/ys
 rWdQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0120089913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0120089913==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nAQXwzCRVEDMW=0s/4izYYe"; protocol="application/pgp-signature"

--Sig_/nAQXwzCRVEDMW=0s/4izYYe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2019 21:43:34 +0300
Ville Syrjala <ville.syrjala@linux.intel.com> wrote:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> The PATH blob is already being parsed by userspace for MST connectors
> so the layout of the blob is now uabi. Let's document what it should
> look like.
>=20
> Also add a clear note saying non-MST connectors can have a PATH prop
> too.
>=20
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index e17586aaa80f..ce3926e9ad11 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -899,7 +899,16 @@ static const struct drm_prop_enum_list hdmi_colorspa=
ces[] =3D {
>   * 	connected. Used by DP MST. This should be set by calling
>   * 	drm_connector_set_path_property(), in the case of DP MST with the
>   * 	path property the MST manager created. Userspace cannot change this
> - * 	property.
> + * 	property. The value must be an ASCII string.
> + *
> + * 	For DP MST connectors the path string follows the pattern
> + * 	"mst:<base connector ID>[-<mst port>]...", where the base connector =
ID
> + * 	identifies the DP connector on the source device, and the mst ports
> + * 	are the port numbers in the DP MST topology.

Hi,

what exactly is the connector ID as already used here for MST? Is it
not persistent?

I assume the MST port numbers are persistent as long as the physical
topology does not change.

> + *
> + * 	For non-DP MST connectors the format is freeform, as long as it
> + * 	uniquely identifies the physical path, remains stable across
> + * 	kernel releases, and does not start with "mst:".

Maybe the requirements for "persistent name" should be clarified more:
- remains stable across kernel releases
- is immune to driver loading/initialisation order changes
- is immune to adding or removing other hardware (e.g. graphics cards)

Maybe also some explicit words about what to do with dynamic non-MST
connectors?


Thanks,
pq

--Sig_/nAQXwzCRVEDMW=0s/4izYYe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0UchMACgkQI1/ltBGq
qqfA9w//ZEhfCvv5BoYQ9CZkRRRaTJmCtYNeUPpnJH3TnGXxVI8PAaKM7YXlJDsd
K/zZDrjxlVwV9U9jFsg3fqcN52GYWRbRGMHX3hhFboQln1j6Q5pbGltfyRRo2yvM
1Wx7Enx2gE9jj+1M0WYsxTkRW7iPkQu6+NMJn1qyaSi1S9ysUg67xrbHrLjybSNE
xKJLwGhfhU6IiY2bMDs/0NthC8+3Oi0c0lu7XdL2wDUOFrnZ6RbSy2JySYHoFw3c
rBZhekCToiko/PcPuFLvoH09b9fdrsVBjiNInElqRR5juD+MKerMsLv5tb5kCrzp
6EM+6Igq2vRo8LyGTstZUDBwCLZUSpmHNtZN7JqGOZaC1Caeu821WYTFdB15nktr
dgGcjRap/OTYnFUzHr2I5w8y/oF9nqIK0B9GLPYZgvhO/3b28s6H80LzcDG5FcEe
AeFYmvdYwZ3f5ld3qlnjoq7c7/bxfy/fMdHOtvMZ/9BjAbc0nhnYrugscibImI/O
cS7yU41zu8q0WrH+a546Mzwnt/gFXPutvR0W0fX+q9fYRZUKf6Bo4APhXAOQ7dpc
F3f9dxqkpd2FXDfutNoxImw1biSQ3bqQcE5hr2cPuMhbMcN6P5GP8cOEZrWv5wW8
P1pvE6SNTxiuJkAROoWhbogR6hrLt/QgnUqFtQVfccwiZh5KR3s=
=jq+1
-----END PGP SIGNATURE-----

--Sig_/nAQXwzCRVEDMW=0s/4izYYe--

--===============0120089913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0120089913==--
