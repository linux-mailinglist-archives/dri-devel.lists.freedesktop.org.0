Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF38AC232
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 01:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43B21125D7;
	Sun, 21 Apr 2024 23:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pPiS7Oed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A607E1125D7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 23:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1713743804;
 bh=SLIE0ixNJA92WnFsxrYMQLdV5RXpE1MlC7mhjXAwMnY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pPiS7OedvYIrsD9U8GIHLXZiqUqIbiy4RaR9i6FOznrR4RMrPVG/6VFCHTNaG9Kj9
 XbdFyXZwJsYVrze830s8Bp6xM0LiqWv5lrlRwut04BnAW2hz9/CBojZvvEELEuQVYP
 lwm1zjM/OWdpgN2WfHcW8uv7lhDHcHcohMxm0fHqNRFmV0TvoyDFH7WQZ4/D/xILlS
 FYsXIbd2gn91vbZR82EScrxjzhTMQOSuSMsfbBuK4CIll9oX8qsbw8nYAnwH7uFIF1
 mZxW8Y6qx6E3dKV5IyT/AjSpliHrBFTK50pW9de/9mMeuTsHmLBYlPZSsWRrG0LzBD
 GSgOhqHOvFVaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VN4zc02dcz4wck;
 Mon, 22 Apr 2024 09:56:43 +1000 (AEST)
Date: Mon, 22 Apr 2024 09:56:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240422095642.41892152@canb.auug.org.au>
In-Reply-To: <20240130135626.312c7ebd@canb.auug.org.au>
References: <20240130135626.312c7ebd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ckVYBvYa+bJim8U_ITjmvx9";
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

--Sig_/ckVYBvYa+bJim8U_ITjmvx9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Jan 2024 13:56:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no s=
tructured comments found
> drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no s=
tructured comments found
>=20
> Introduced by commit
>=20
>   d79833f34bdc ("Documentation/gpu: Add entry for the DIO component")

I am still seeing these warnings (as of last Friday) but the above
commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ckVYBvYa+bJim8U_ITjmvx9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYlp7sACgkQAVBC80lX
0GyeMwf/c6mJqYJWVfTdR2FODcWDg3b9586D4We8UklpbyQBQgEdDMf0zYAAoQBg
0JA+h+MTbOlSgnoQ5s3DQ5m3/arBPR3cFv62qVqKliLoshWJgfJSjAnabbZOH3gM
lc9k6E4XAS/MppzHoDoWnkm0KKhpBjYjgmiOgIXU+KZI/QGzEZyR9lfMMLVODoDL
ER7qLfbKcQ4O2C7utcaeO09Z16CInRXc/qeZIunL+T3KBtOYyV/CEPBqMN9oMstu
w/w83oXSx6aueZBIGplo8yUwMlUMSjVbkUmJHTAkFmWVgu+u37Q+Ad6McvVaNdib
spEAQOPqSLbI2ayTZ0snFOPiArZYeg==
=bwSC
-----END PGP SIGNATURE-----

--Sig_/ckVYBvYa+bJim8U_ITjmvx9--
