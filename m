Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C18C2F64
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 05:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16F410E025;
	Sat, 11 May 2024 03:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G5FVzjJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC6210E025;
 Sat, 11 May 2024 03:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1715398640;
 bh=VkQXKmkcPYcKmt+aOv9Iq2QLQXE9ZaHd1bA+Ui2dDT4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G5FVzjJmYeASPwMG8m5twB9QDR7cUqHQs/iqMmPYaJyYceylZwH7GaLzsh043/qZx
 7MDzlrKVfgCJRWDq5VGjpdNGiJhRncC/xHlCtZGO2a5sbsuRkvpJ/k8P9s9bWNmfmI
 IqHud8wiU0ctVS07H2DEFfHE+AHrSlCyh7KntIwFabHq84f2FaLud/gV9sy/9yr+ht
 13IbNaYJlkM60/NxYi1u7jdHAIqYVRAvrS4B+3rLUHdpKRaMCtW3q5pQ+ZeF37g+Jp
 Byatg5gThJTUCocmp76Jy0qRdhMAsFkOM3y/PN9Ns9VIpJVXZJLQoH0ESATrmTeWln
 BDK7EB7BOp6mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbrzM2Jg1z4wyj;
 Sat, 11 May 2024 13:37:19 +1000 (AEST)
Date: Sat, 11 May 2024 13:37:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/amd/display: fix documentation warnings for mpc.h
Message-ID: <20240511133717.23263f55@canb.auug.org.au>
In-Reply-To: <20240511000203.28505-1-marcelomspessoto@gmail.com>
References: <20240511000203.28505-1-marcelomspessoto@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cxQyXxvYi.6MWkCA=xapA1g";
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

--Sig_/cxQyXxvYi.6MWkCA=xapA1g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marcelo,

Thanks for doing this.

I haven't tested it, but just a couple of little things:

On Fri, 10 May 2024 21:02:02 -0300 Marcelo Mendes Spessoto Junior <marcelom=
spessoto@gmail.com> wrote:
>
> Fix most of the display documentation compile warnings by
> documenting struct mpc_funcs functions in dc/inc/hw/mpc.h file.
>=20
	.
	.
	.
>=20
> Fixes:
> b8c1c3a82e75 ("Documentation/gpu: Add kernel doc entry for MPC")

Please don't split the Fixes tag line and also don't add blank lines
between tags.

I also appreciate being credited for reporting (unless you got a report
from somewhere else as well, then maybe credit both).

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

>=20
> Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
> ---
--=20
Cheers,
Stephen Rothwell

--Sig_/cxQyXxvYi.6MWkCA=xapA1g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY+5+0ACgkQAVBC80lX
0GwRNAf/Shu3g5im8SxG7O3Wl86WzvKQ/HH3Ns+H7jWSfbbM9OKAOD/XxuWc8sdA
ED7NtYX7y8kinZslx3dWd5fIOcZGzRhXZ2qhX5BHPWdrdblzuBKovlP9ZQKFQNDS
n0IdU8Vl2tCIrU7nbH+sJLL82j/9mqodH1JNDwmYeuge6SZ3FcPUbNWGP3gP9chC
b/GWmjkDGmUFY1tm3bhAnFP6CBfCDTshaHF8Madnqb5kQo6WODYHTvIi62H+WApR
msFX2I8hK5XUEx/pxRIXGliPp7oTGX0qUrbCOvYXGCnRFioKsvOVrDWEDbi+VFvb
n6os6+WHmAa3kW6/duiz1il2qFkjwg==
=6p7u
-----END PGP SIGNATURE-----

--Sig_/cxQyXxvYi.6MWkCA=xapA1g--
