Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E37804D5A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E0C10E116;
	Tue,  5 Dec 2023 09:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A4A10E116
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:15:34 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CBFB66602F41;
 Tue,  5 Dec 2023 09:15:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701767733;
 bh=t/OAM5LfDjKUVMHeKGWpXKTasStUJpMdDQfTkwkUd4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ef0t2cS3br5Sh5EFP66V3rXF3qhS2Jn85lNdjiF9Pn/Ut5kfjUqftUBJd39qE+vIu
 mqvPwo90jtgZRMm6ZIETj00/f6ym1AoUyGVZ7ohBSf+ChZ/XwylIGRuwlG6CWGC7ka
 qL4W/tC3zAIbKXrOGJpbnJlkYEtdCKK0aX7F/v8EGWoecWRXtk19gawVWhg+pJa5du
 XqULqJlKfTV6LLD8PYevIAgOu7tqYNTCcDgAgTx8PK7ab9v69ov3B4y1hmKvKAtHnU
 d2i5BH6M61gUyAc02cahBNBWIibDOYYKHmKctHDU8Vq7X92Aw+XLwFYGhmVRWZxbQc
 Cli+ntdqB70rQ==
Date: Tue, 5 Dec 2023 11:15:29 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <20231205111529.3b75bff2.pekka.paalanen@collabora.com>
In-Reply-To: <20231205105106.06a34b81.pekka.paalanen@collabora.com>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IbWNM5/+mzEZltS2OlHHbB+";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/IbWNM5/+mzEZltS2OlHHbB+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Dec 2023 10:51:06 +0200
Pekka Paalanen <pekka.paalanen@collabora.com> wrote:

> On Mon,  4 Dec 2023 13:17:06 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > The current documentation of drm_atomic_state says that it's the "global
> > state object". This is confusing since, while it does contain all the
> > objects affected by an update and their respective states, if an object
> > isn't affected by this update it won't be part of it.
> >=20
> > Thus, it's not truly a "global state", unlike object state structures
> > that do contain the entire state of a given object.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>

Hi Maxime,

could you figure out how your email got the linux.ie address for Dave
Airlie?

I got a bounce from skynet.ie when replying to all. Maybe there is a
leftover email address for Dave still somewhere?


Thanks,
pq

--Sig_/IbWNM5/+mzEZltS2OlHHbB+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVu6jEACgkQI1/ltBGq
qqfM4w/+KYsIbsC8SX8NiTZnibVCDrpyZIe4T+7t5vhey97nklXiXs0DCswc7hs+
ZZcqdI0Eq+zwBCKBoYcaHDFyU71Lng/UJc0BtnTEi4wFFTxRyQK/N9j8ly7tvSen
IaC+fBcw1eamVtHChGwdbv+o623uwwkzBDIsrYEuDnTlA4V7CsnWIwCMK4qqNobs
xYWLwaM7X2fEX3ZfoO1wq11g+0dRp49alX6HN4R0tdTc+dCqmVz/7Is3Iltu4B7Y
UCNOllaSv3BzcH3BalawAaEXlEglGMViYgFk7C8snecCvmeM4iAyqtxlQaHLuqGt
yyL2cZepekrmK1hRkC+klSlbWPdkKysdjmbUSjcDH1Q6n3XK+i8NitNdV5M82R+D
ahdeS3HmNA6aVQlt2sQQut0RwUQuB53R6bI6zRCRIuntM6Tq1vZP5E9g+FQWDjyc
o4Mz2mhvl6MNe+FNvrIoxs67KxQVJQWvsqXFL+GcUVPxi6PyJV8LZ78EOmsvDQpj
LSesNgV8lYC4ksP1aV2kmzBPkWaxItuIMGQL+gaIgGRdZ3ZilulsYnW9caKkwbvz
ncMpzPvwnXcluIAB+Nb1AnX8R5E/x+WSIu1iF/KuRVRjuBfViE0C3JgC2O52lWFe
x77WG/uSYhaTiZwDOAx0FNgv6n7DgGLCgXa9wXqt/HTtesso2kU=
=gjMR
-----END PGP SIGNATURE-----

--Sig_/IbWNM5/+mzEZltS2OlHHbB+--
