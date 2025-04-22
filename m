Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D66A966E8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 13:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A56010E1CB;
	Tue, 22 Apr 2025 11:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bNNBlJMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96A710E1CB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745319940;
 bh=VxxX8NlE/4r9oZioT/r13/w1+uZkTSBbqTqf2hq6XMo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bNNBlJMj49JjaMMo9n/CQUCPIu/+57oqj96Z6iUtySnwGM73XJwHdLbexUsGwlIMR
 +s6TPFIPwKCxZJIdHNFgopeZARefxFV7kJDz6cr/o4XPK1l0UnK75h7ozEJK6gnn6k
 8SDXPZDfNHC+3ZeElgB3hGUdO+Bn2LH/6Pu9DoB5FUG2CT9j/z5BXrt0/2OO1D4vJy
 6JxBsA+huPVDrcqCWQh6tsNGJHuQv3B6r/enc0reHwPIwMVMUFOBvD74q7cMlPoi3X
 1DtFR9bb5RUVm8hjbqGX2+xGiwOnVM28dzHxNwtvPING7rvssIC3Wf22/i18vr08pH
 +9ZIN9wnyC1Gg==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C1BF17E0CAB;
 Tue, 22 Apr 2025 13:05:40 +0200 (CEST)
Date: Tue, 22 Apr 2025 14:05:34 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <20250422140534.0e190952@eldfell>
In-Reply-To: <q0ezd1X8PHW2dfDHoBBZWxXpLIljcrPxQhYOB8p_N0lL0KTvolylcEJUAFlvlNn_S0gKtlkkp4dKfTOdx-O5Q84oX65BwNYMgNpHzXhKRQk=@emersion.fr>
References: <20250414085652.43904-1-contact@emersion.fr>
 <20250414140638.49fa3f08@eldfell>
 <q0ezd1X8PHW2dfDHoBBZWxXpLIljcrPxQhYOB8p_N0lL0KTvolylcEJUAFlvlNn_S0gKtlkkp4dKfTOdx-O5Q84oX65BwNYMgNpHzXhKRQk=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m+xOmSnHwl+2mQPYaUyVTck";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/m+xOmSnHwl+2mQPYaUyVTck
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Apr 2025 15:19:45 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Monday, April 14th, 2025 at 13:06, Pekka Paalanen <pekka.paalanen@coll=
abora.com> wrote:
>=20
> > Looking good, but given the new wording is 100% mine, not sure I can
> > give reviewed-by?
> >=20
> > Co-authored-by maybe? =20
>=20
> Since it's 100% yours, probably you should be the commit author? Would
> you mind giving a S-o-b as well?
>=20
> But I wonder, would I be able to drop a R-b tag, meaning I agree with
> your new wording?

Sure,

Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>

If I was Author, then I think your R-b would be good. I'm fine with
that.


Thanks,
pq

--Sig_/m+xOmSnHwl+2mQPYaUyVTck
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgHd/4ACgkQI1/ltBGq
qqdDvg/+MLd7n6VesMEO7KAIB9sONKT0gVNTJXHrXQKIG7nblS6mBbjcdIusIY4c
K87mPbiFpUFXY7uq/2sDXgvufCbOzqMSHsfJoeTvKOMsbYL+iBKxDMwCLLzV5zjc
Of0PpPiqdHsXeGq9kOf7kaU9XowqdBlIos79+umZvG9OnUMNAUjh6m9LX8Ke3Kr8
lcGkp24rxirkywA6UyKPEMXQSD5MMPpPBzn2dDFTimh3PosWw2VIxuyeNGj1GIDS
3CNxycnIjlap2B+Sx8vIDmEskAi2ONlmueMDXkrtjx7zk3hhBviPFV+4ySVLpnmG
Y2ZxlokgH3JfYNltwtn51CTXyTMUpgJV2PBlCAdemlOjqRYUM6jLBaVOWj5xKGmb
hfWhoE0gTfTeFo/M4+2fis+OH8e16xrA/5PGS1pAOFJp6WOAUIjwJ4jzFuzEFBBP
E+qNKDXdPHXYISFre4VsLyPUKI4eCY7KU9ytrWQ/6A8F1mseBrMilnOcBJWTq7as
2xxPD2vPL94tKlmDpF/6VeM+DuCuZXHFJ9iEmxQVJkMNb+8CWPUWyCJCQjFwTZL+
4hKwRj6VjpJPDH4KBIEUmQzVFmMbZbU/eS9HBnsBYkiL+/iUqLIczcyDV3yf7p68
pUNWRvR/7NRJWCtPwM8QWYrgaurBpFqVm0y6D3hPff22tc4k9+k=
=Fj4a
-----END PGP SIGNATURE-----

--Sig_/m+xOmSnHwl+2mQPYaUyVTck--
