Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A9A87BAD3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 11:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E635010FA0B;
	Thu, 14 Mar 2024 10:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TdlY9saL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C089A10FA0B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1710410435;
 bh=qTUSe00wy7swqxvIMkJ/BMa2N9lVsORNASuFfYjpEDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TdlY9saLJh+pTI2x6CT45wZNK3eMu3DNCS/6mX62puma0BfWpNgZf9OHMZvxghSeV
 eg5CYTciQM0uGVgH6KlJcLBb85LeQsIXx8pvOTylvuaDfl5u9NKubaZS+9+QtXJNJS
 75l6ObHCpjLW6Tl2g3cFKuB8X08ZiceF8HUurpo5KnXUJUcFvCZ3AxtVvuMFLG++nv
 8AzcW8b3/dPfDrLAnSH+YK1RwFEpUyl2ZNKEY36kWpEEDIFZeHlvUYMmP9niBXTql9
 gxhp6P8ivyse1cRS53e5BVQPpw6CmW64mlFs2yR4ifdQhiHp6o9fO5EiqMDp5TPO3W
 r5BWMuE5xArlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TwNDK6Cbtz4wd7;
 Thu, 14 Mar 2024 21:00:33 +1100 (AEDT)
Date: Thu, 14 Mar 2024 21:00:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <20240314210032.2c08ffbd@canb.auug.org.au>
In-Reply-To: <20240314-heavy-polite-mantis-bfbb84@houat>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
 <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
 <20240221094643.4496313a@canb.auug.org.au>
 <20240314-heavy-polite-mantis-bfbb84@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cJjLF7w7UPvX_hLY7m=FDKJ";
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

--Sig_/cJjLF7w7UPvX_hLY7m=FDKJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, 14 Mar 2024 09:39:24 +0100 Maxime Ripard <mripard@kernel.org> wrote:
>
> We've migrated the drm-misc repo to:
> https://gitlab.freedesktop.org/drm/misc/kernel.git
>=20
> The branch names are the same

I have switched over for tomorrow and test fetches work fine.

--=20
Cheers,
Stephen Rothwell

--Sig_/cJjLF7w7UPvX_hLY7m=FDKJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXyysAACgkQAVBC80lX
0GxVcQf/V1P8Md6aALDn1OGwAYV6WB0U0hOe91Qk4JSVeXGwSMEpWHhvSePr6+Ew
0eXM4rfA5hQaob11ca95FHWM7KCJ6/H3P3myVaBATEh3bBWahtsyFQu97mjOv1uR
hUX5bjN1H6fpO5LJVW684bGtuIYHFSi7f8fA09qOZZOl0A9DVtT0AIBNL2GObJhs
Z6+YM7vO6zGPsPUHw3cXnnx/RlS936fyuV8cQO7ontwLsmLBTRMGKOnMaXvNc+Er
xVw3Gl93Krjc46RMrcyeTcFXXTsjpeGdL+srPOPF5Ot0g1myknMHWPOLIFzJLJKt
05bkG9LyJ51UwSTFK4l5Fi/rNweZ+A==
=4v0j
-----END PGP SIGNATURE-----

--Sig_/cJjLF7w7UPvX_hLY7m=FDKJ--
