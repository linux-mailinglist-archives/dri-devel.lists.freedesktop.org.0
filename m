Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF438A31CF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 17:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24D410F6BB;
	Fri, 12 Apr 2024 15:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J6bk5vfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5848410F6BB;
 Fri, 12 Apr 2024 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712934471;
 bh=IW6AQvznYrnhRPvTFuJqYmQOTv7jMaxpPwrtDKRdbZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J6bk5vfYipmTuRYM08fDsRVTuJ/2EcUJpoqSaYQKgI9r6AkKcnWo4YfJzPBCWkJ+7
 NC572ifCvMqbBaSxGp/q7cBTkeHwdBl0qAUG7yPUCtVXLUMnwLOuTvgRQt07HIVIU8
 8KSBAb7dn2QgnZKhCRY31AuJZ+1U18wqBUu+VuFnkeyGKrTW1hlCWneMqnKX+YjmPZ
 snzlplLvdHTXtkNp8zY2vQWyvCCvreSA0P8NRTo/Hm/7WfLXL/6D7w0vfOiJHIVeru
 yzKhlouTefOZAKN39R8rDzGZjcLcnwNdu0nOH3qkzQJyANZ5iKocsCqrl07i+iVQkx
 qfndRQjBE656Q==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A7F483781182;
 Fri, 12 Apr 2024 15:07:50 +0000 (UTC)
Date: Fri, 12 Apr 2024 18:07:41 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>, Michel
 =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>, Chao Guo
 <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>, Vikas Korjani
 <Vikas.Korjani@amd.com>, Robert Mader <robert.mader@posteo.de>, Sean Paul
 <sean@poorly.run>, Simon Ser <contact@emersion.fr>, Shashank Sharma
 <shashank.sharma@amd.com>, Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
Message-ID: <20240412180741.360d8c2b.pekka.paalanen@collabora.com>
In-Reply-To: <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com>
 <Zg63qvnHgutUARrh@xpredator>
 <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
 <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
 <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o_e/7KQK5s/kg6/LwH+g+/s";
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

--Sig_/o_e/7KQK5s/kg6/LwH+g+/s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Apr 2024 10:28:52 -0400
Leo Li <sunpeng.li@amd.com> wrote:

> On 2024-04-12 04:03, Pekka Paalanen wrote:
> > On Thu, 11 Apr 2024 16:33:57 -0400
> > Leo Li <sunpeng.li@amd.com> wrote:
> >  =20

...

> >> That begs the question of what can be nailed down and what can left to
> >> independent implementation. I guess things like which plane should be =
enabled
> >> first (PRIMARY), and how zpos should be interpreted (overlay, underlay=
, mixed)
> >> can be defined. How to handle atomic test failures could be as well. =
=20
> >=20
> > What room is there for the interpretation of zpos values?
> >=20
> > I thought they are unambiguous already: only the relative numerical
> > order matters, and that uniquely defines the KMS plane ordering. =20
>=20
> The zpos value of the PRIMARY plane relative to OVERLAYS, for example, as=
 a way
> for vendors to communicate overlay, underlay, or mixed-arrangement suppor=
t. I
> don't think allowing OVERLAYs to be placed under the PRIMARY is currently
> documented as a way to support underlay.

I always thought it's obvious that the zpos numbers dictate the plane
order without any other rules. After all, we have the universal planes
concept, where the plane type is only informational to aid heuristics
rather than defining anything.

Only if the zpos property does not exist, the plane types would come
into play.

Of course, if there actually exists userspace that fails if zpos allows
an overlay type plane to be placed below primary, or fails if primary
zpos is not zero, then DRM needs a new client cap.

> libliftoff for example, assumes that the PRIMARY has the lowest zpos. So
> underlay arrangements will use an OVERLAY for the scanout plane, and the =
PRIMARY
> for the underlay view.

That's totally ok. It works, right? Plane type does not matter if the
KMS driver accepts the configuration.

What is a "scanout plane"? Aren't all KMS planes by definition scanout
planes?

IOW, if the KMS client understands zpos and can do a proper KMS
configuration search, and all planes have zpos property, then there is
no need to look at the plane type at all. That is the goal of the
universal planes feature.


Thanks,
pq

--Sig_/o_e/7KQK5s/kg6/LwH+g+/s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYZTj0ACgkQI1/ltBGq
qqddaQ/+Jp49giz91ctWjXIY60zOJN6SP/zBlsC/nSu3xml2plN6mJa9GmOZR86K
L86vln3DplokPaJ/MssKd0dPz1qKf6qKXGHfN+yW/S+THe7lTBB0YMtd16W+mtLt
+xuLCkT/G0EAbxr3tVTU4Mq8OKrGXzpIofJnRNwYV23gXqrL9/uNARUh3X0Fo5yU
1ucBbayEExlz3Y3KSev0kWJY1NWY3GEOSPlgjXG1iB2PI90PsAJujtdMJs7Owm7b
4NK3si6U6+9wcgQwZPQ19m/IofhRBKj9BucTQyic6AuTfClrWZ4gi24IJSwXEKru
p89Iy0TDAObE3ecqOh8ywThh6NwKk3jsA6PVpa/8CUGF53/exgWgSGrm2uAIhghh
lMCULTPFp8NZVb+8hl3A7Ig+EhcDcFhmncb895VIUSad4bXyvcfgTxS76Pv06btB
Ba+lacl5M9QNLqbfvxqQnxPr4L7IVVIubuQ8oe/7IShuHo4Shh2UrOUoFwbRMEjn
g3Ki6hWcGJ7ProzwzgIF3KmwG2ta/spVEZ6BrGuBCCU6XlP7qtDQsRTER4CsClaS
0sUqvYNrmH38M7qq2mWBBX225uhPNM6w4rVitM2jOc0j9s5Uq3hfHm0NesFDU0Gb
hTBOEwVjYCqmiAwR5HVjR8ox1Y1kG7KmQ3xrM4ZL+m2NyQlzPXs=
=E2zH
-----END PGP SIGNATURE-----

--Sig_/o_e/7KQK5s/kg6/LwH+g+/s--
