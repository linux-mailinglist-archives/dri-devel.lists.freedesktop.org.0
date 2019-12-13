Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C0611F230
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28676E397;
	Sat, 14 Dec 2019 14:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CEE6E8EE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 14:32:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 69C68292AC4
Date: Fri, 13 Dec 2019 09:32:25 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/panfrost: Prefix interrupt handlers' names
Message-ID: <20191213143225.GB3640@kevin>
References: <20191213123942.22891-1-ezequiel@collabora.com>
 <26b59d91-f974-de29-5ca8-6fbc2db29a11@baylibre.com>
 <31fd8f77-99b3-9edf-a23b-1484d9dcf48f@arm.com>
MIME-Version: 1.0
In-Reply-To: <31fd8f77-99b3-9edf-a23b-1484d9dcf48f@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: multipart/mixed; boundary="===============2010351141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2010351141==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> TBH it would probably be sufficient to save the bother of allocating
> strings and just settle on "panfrost-{gpu,job,mmu}", since upstream
> users are unlikely to ever come across a system with more than one
> Mali in it ;)

Agreed.

----Wait, you said *upstream*? Are there .... oh no

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl3zoPkACgkQ/v5QWgr1
WA2x2g//f+F/783GSOYaS+R2Bm9kchB1ubFq4UciC1RHDRQc9h55ZYvdd09fXKa9
trSnbzu7EysPF/rbTDwop28L4piWT8cIybfUQfW2nKSvp/9yVDXvEHNt1yH/OoTE
0iMJ6dG203xD9yNy5DD1TsqL5c+wKQQW8/bYTXxGevLwxNACPMmSIMorkBl1Ue/C
gqiNLHDArfRue2qO/5Wayh+IpUvjhr+qLLVSzQI4FAD/8SMFmkFstJl63xDRW9VI
2XOknoiGJSvDXhGa+qlPs2pSpmPRaz5kkRlLpm1+KYa7TMmmpLeONfQOBbUv7+nu
yfYMjfawKQSn6LHq/h/spgNfMQwmaJcgUqloQwiENTRC825wiFEGjNt/d/yoAGGJ
G47OoJmHtGcJbNo4IUJ375/BK07Ohe7jyUmY8bNjzJbkm0wfn3kT/R9Bq9at/UMr
LRwsiNtAuCnCQUVCPRYqyoqeIS2dncu+IBnEG8aKsMQ5LB44jovbE7ixcgbakmEL
jd4sagbp5JyJLYUA/ue15iGvSSBz1m4m5ZNHr4m6+Dc5oXSBbFpDGOdIopPCG04Q
AHEIyVbkJY85hGHwkrgphhqzinzK9HLWEUxfyjpTN7o4PWGfVKKdR1DqM0NLoIoj
yq/D47k6oJwqUEUo6BMGBAWgEAf+QRpEBCQcIVbN01EZBfzrdBE=
=En5z
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--

--===============2010351141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2010351141==--
