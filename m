Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55391D0BA1
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2936E9D6;
	Wed, 13 May 2020 09:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A106D6E938
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=grGHXFzOcmEOgtnGT2wFrXPObedM
 YHJ1N6mTKPHghV8=; b=oFF0FyQ64cCW4KDTZ9lJhJmZZEBFpMDOfD8ng8nOW5NK
 q99P2TOIQJuPcOPzQyMahnVX1iStTrBtAmFUM0liQbekANIvuE+oZFxe7nigrrY+
 byv5Z2O0SxLyyCepu2ZFbgvVUrDZxazbqkriknF2P0zs3PNp2Td/7w/1S8fqUMs=
Received: (qmail 3010121 invoked from network); 12 May 2020 18:28:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 12 May 2020 18:28:37 +0200
X-UD-Smtp-Session: l3s3148p1@LSWk9HWlaMggAwDPXw2aAE67cgFBY+HL
Date: Tue, 12 May 2020 18:28:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm: encoder_slave: some updates
Message-ID: <20200512162837.GJ13516@ninjato>
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0056130972=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0056130972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBdJBemW82xJqIAr"
Content-Disposition: inline


--gBdJBemW82xJqIAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 05:39:05PM +0100, Wolfram Sang wrote:
> While converting I2C users to new APIs, I found a refcounting problem in
> the encoder_slave implementation. This series fixes it and converts to
> the new API.
>=20
> Based on linux-next and only build tested.
>=20
> Wolfram Sang (2):
>   drm: encoder_slave: fix refcouting error for modules
>   drm: encoder_slave: use new I2C API
>=20
>  drivers/gpu/drm/drm_encoder_slave.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Is there someone I should add to the CC list maybe?


--gBdJBemW82xJqIAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66zrUACgkQFA3kzBSg
KbZflg//bG7+tCVZUTjQPn9mXVd8/23ASplOru+lCiIulPme15NvvkFPG6ru6f0E
cAjSQSYH31kFeAcC+bFqayCyQg59jX5g13tGY0mYSE7DSnxHUGQHULkpmEZg07SM
SAHWFWjp69DJJDYUvQ+JGQiljyQutAlp3VeJC4u3jLMnjjp0sOXANSHbo2Dv+as4
PQIYyXVwPM1cfuxNrZZaBuEBHSwsxsrlDFe3aJvgVkV5YzASJQuhM31ifqoMbLyw
xaywOs3z4b/ROGpeRzieOXJDwMyrfQX9ox5N4xmzkF6EhrQGvj7yMTvztNyiknBz
RpT0SsMjIOWpZiNOHU+FydOolTHX6dv78AYWbpoePZCp+hZgCjaghXI34+ka2IpC
qpkrivq9FzRLlNFNU599brLVCh0XEJyiSGXH5HyzcLWFeM7FWYh90tuj72qyLELI
6ttM9ym+WU/OFnmSp1NchQo5vLu2aGsCfNUbfesKIFV2bRrElARAJ88va8rLUPky
69PnQKQsR/Rwvo9WK8grDqAPYxZytP+KpYOLCHeF25GqtuqcSwXLiwjHgYmashd/
R7p055sjueYPos7dKA7sYNMFSQBvWa74b1T4yYj046K3gCviuDa7bf2V+hne6tJx
9za/nuMUOtZoDoHDN6vArwUsVPuUjcdm5nEACuAegaNcWvK4EaE=
=7/dX
-----END PGP SIGNATURE-----

--gBdJBemW82xJqIAr--

--===============0056130972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0056130972==--
