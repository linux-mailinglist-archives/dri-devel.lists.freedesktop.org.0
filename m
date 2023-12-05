Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D99804C88
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD9510E49C;
	Tue,  5 Dec 2023 08:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923710E49C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:36:02 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 07E4A6602030;
 Tue,  5 Dec 2023 08:35:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701765361;
 bh=8TdCP7pQFoNlcwVYdlSyrN/w2A0Op/hrTEVYOXA+Iw4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LkSk1UGtPGjufAME3Mo5tAbgHVeBIOwBZ5PZu3G7wj7t4DZlvsTBvBIzMenraa1FC
 1Q8AIWZKMlhxDog7y3tv/QQylclu+6ZUb00FRevwFD5NHUWtAze/53aPhyBvfsezR0
 SXPw5YjWlwn4nXbkDgzCMD2iAn/IT+pXs0DHqQqBAF2HMuvg0+V+kbvoeQe1IsUzO7
 6pOqCw3N55TaWjnmDye7n5y73tL/qdosgLJzwP7Rn2oDdNBGsLpMbZVFrhze1+cCqo
 NR+qf7CJXaPZa73hj+mZkD0aIZdDHjeb5OA2CMMOmuogPGcTq1QEvXu+GGQON8d8HN
 BgwotuxI2wBKw==
Date: Tue, 5 Dec 2023 10:35:40 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <20231205103540.6b2583c8.pekka.paalanen@collabora.com>
In-Reply-To: <dybgeyjqoh2rjjrvbb5nrnallx63tano2drmxgsgde6n5w6wza@23cfserg7mui>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
 <x6cqert2tadgc46w3u2rfgcfaw6evxdeerl2mxvh2peycr4i7q@qf6oqymcti4j>
 <20231201110616.30ad1468.pekka.paalanen@collabora.com>
 <bry3w6w32uy2jlmbkcmbtthw6w6nwux7dwlcju5iuxac2wphku@md6njxjtsbvm>
 <20231201120648.2ba706e1.pekka.paalanen@collabora.com>
 <bgd5xuszaujdjg7lt24dpofvhx2v6gyxfjxnqfo7nmaecmn6om@fejhsggdlffo>
 <20231201180348.4a42025b.pekka.paalanen@collabora.com>
 <dybgeyjqoh2rjjrvbb5nrnallx63tano2drmxgsgde6n5w6wza@23cfserg7mui>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jC+ar+rxILck14dQcx1m77s";
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jC+ar+rxILck14dQcx1m77s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Dec 2023 10:21:03 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi
>=20
> On Fri, Dec 01, 2023 at 06:03:48PM +0200, Pekka Paalanen wrote:
> > On Fri, 1 Dec 2023 14:20:55 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> > > On Fri, Dec 01, 2023 at 12:06:48PM +0200, Pekka Paalanen wrote: =20

...

> > Is it really "global" too? Or is it device-wide? Or is it just the bits
> > that userspace bothered to mention in an atomic commit? =20
>=20
> As far as I'm concerned, global =3D=3D "device-wide", so I'm not entirely
> sure what is the distinction you want to raise here, so I might be off.
>=20
> But to answer the latter part of your question, drm_atomic_state
> contains the changes of all the objects affected by the commit userspace
> mentioned to bother. Which is is why I found the "global" to be
> confusing, because it's not a device-wide-global state, it's a
> commit-global state.

I think the word "global" should be simply avoided. Nothing here is
truly global (machine wide? kernel instance wide? worldwide like
UUID?), and its meaning varies by speaker and context.


Thanks,
pq

--Sig_/jC+ar+rxILck14dQcx1m77s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVu4NwACgkQI1/ltBGq
qqc3sw//bb9K65vkjrrJcpssVskZDbYksuveo42G5DC4huqcxDAyiz7rEEFWeIzv
5hlZBDaHpODNsw4ncPtdfOp6eVF1uDC5dpAvItCDwu6OVQqOz3hRnKeYcJ5Fby8H
erDqmAKl8lzaA4A8kcPMCFHJ2PbkJV3MuJhK9BeL3noqe1m6KzQ9tD36+/XR2kCy
6ZxexJlEOxqxfTJY64fDS/tez4uyQ7Gy4p2QG1yCW3etSx29UCzkC6K78G1RdpRe
RDHqefOoIBX6oo3mKWPEvnZ2olYubqocL6vdEAkcLukcsYSdLBfNl3SjxztPByNA
K/2LekKvs4l/xKiwRQxFD6HxpN6NF8Btq1Au2bs2q3ZZ9L6Sz2vhkGJwWQAuFOML
EQqk7WoiLz6LSGylnNF7uqxAi8rk5B0QrqSm3zleMMFOhL6emQXs4tT+86CgcMDF
DDQ3nSZ/PiuCB0zf9SAFY+RkaUGmJoarMoQPud+by4qpXIdILtOctXH57TmJgHmQ
LhrTD6Ox3nK0hshvqDYaJeQR973pXcEnsbqXWZipNiCp+OGcK7Bo95nhhLdPjDWE
wFOQWQkTIJzqwoHBcKuN2TYa+65sOnGpDeTwYkUG2VTzZz1iF4XzEcRlkCpjSHCD
kLyxM6LK5JPjbijJjXyuznLtxpbXtV5KUiYPBca7zLlEEF1jtQ0=
=suh4
-----END PGP SIGNATURE-----

--Sig_/jC+ar+rxILck14dQcx1m77s--
