Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33F4ADF98C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 00:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC0210E967;
	Wed, 18 Jun 2025 22:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RNGtVzYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A2C10E967
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1750286638;
 bh=zrZWc7TCSgFdGDcyuQjWRBO6ww3YQJUhI+GUCoMIOLk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RNGtVzYSpGK0voqSOB3zBZH5aPke3SlW2o88OuhfuLUOu3jFPLXiRRZUFttJ2a9Xs
 LzRGLr7CNpjVNtacL866Y947/ciOhjlrgKqMt4fepBJJdW/tBQ9765S1MvMz6dOIra
 FYmXWEez1HSjn3wN3CiQi7gOBkyIYsfqR/UyyAT0V+awW0YaR+OZZOTEcEwS1UQLuu
 kg7u4bCaW7zmB13YVupURmPHfcMbZCH08rJ8GhRAC+Pj4lcNC9+TZCCZhzuL/TyhSh
 tZpf0/5Gg4+4cvJdSgQrny2U+Cs/tfALyGLrM9kj0dNlI3uwW5EOn6vvz02Ps/jiiO
 cEPieos3qfYgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMzLP4MgZz4x8Z;
 Thu, 19 Jun 2025 08:43:57 +1000 (AEST)
Date: Thu, 19 Jun 2025 08:43:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH 1/2] drm/doc: Fix title underline for "Task information"
Message-ID: <20250619084356.788d482b@canb.auug.org.au>
In-Reply-To: <20250618142230.2407354-1-andrealmeid@igalia.com>
References: <20250618142230.2407354-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ho0r1+8o4ltYlHNrVd3a+Hk";
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

--Sig_/ho0r1+8o4ltYlHNrVd3a+Hk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 18 Jun 2025 11:22:29 -0300 Andr=C3=A9 Almeida <andrealmeid@igalia.c=
om> wrote:
>
> Fix the following warning:
>=20
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
>=20
> Task information
> --------------- [docutils]
>=20
> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for=
 the wedge API")
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Please add a Reported-by tag to this and the 2/2 patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/ho0r1+8o4ltYlHNrVd3a+Hk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhTQSwACgkQAVBC80lX
0GxdbQf+J1fV6cLtt7S4e2bLW/w1EjvGjZxthz9vEdqaijAZW4HUC/N1lDNH3MEo
HxsI6G0JHpOiYTqn42HWLlWW9tFrPtvBTmkHFgN7p7c9INhnetBzLxDNoXFp3t9E
v1uuOmz1E7/tt5/k4JW8OltPhP7cmh92r/xdhXTOYlXOfUU5aIXFpIztMO7a18mI
cUiauySoY41lGTPlY63sVqYG4O+/r7fLEXSv3pozJnZtFGdAw5SAQcGzuG+u+dLc
SX/R69s5hfF0c2EixuOYquDubOZIghauYi3O+yfdiVrq8G34vdcCtSnw+cvTY5ZJ
OGIp8l00HhYtfnbaaGBKP+BfVkIWsg==
=CxKK
-----END PGP SIGNATURE-----

--Sig_/ho0r1+8o4ltYlHNrVd3a+Hk--
