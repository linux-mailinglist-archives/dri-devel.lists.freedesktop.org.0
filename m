Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D563B304B16
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 22:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D29689DFC;
	Tue, 26 Jan 2021 21:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF3E89DFC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 21:15:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3979322B3B;
 Tue, 26 Jan 2021 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611695745;
 bh=ReYcTUHdjIZlSg1evEWL96VccN8+t7kQN0XQHxu8Sjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ep9OJDuqv8a4bgQFCDjlq2iI5RB4LPmJdk2+zbmvpftZZs5D695AbwewbaJCc3JMj
 dL9ah6VjErZKjDWlPhiRROOXCjhWGwv8ee0E3jMcU9D+bsKo9dRbTCh7E1/I/ksJ+W
 D5aMANUUHtAJMmOZzJoqkhUOETJyli7sbbolWUXjjn7SLWcwp35YDD5Sc4X6bQwB4t
 KNQ28ubpeT02sMgKKZi1yOW3qIW1xs9s1G3rp0O9U1ZgnA8uDs3zzXCVe2CYAcWZRI
 xSf48pCAjs7pYetBMI6YImpNnBC/EtiREGdnd+/KP+X+cGPrcbUeJIoiK7y8oHFA4s
 39OCOtyKSKR/A==
Received: by earth.universe (Postfix, from userid 1000)
 id 4CEF53C0C97; Tue, 26 Jan 2021 22:15:43 +0100 (CET)
Date: Tue, 26 Jan 2021 22:15:43 +0100
From: Sebastian Reichel <sre@kernel.org>
To: menglong8.dong@gmail.com
Subject: Re: [PATCH] drm/omap: dsi: fix unreachable code in dsi_vc_send_short()
Message-ID: <20210126211543.jb6lmcg6jedzruc3@earth.universe>
References: <20210126135511.10989-1-dong.menglong@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20210126135511.10989-1-dong.menglong@zte.com.cn>
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
Cc: Menglong Dong <dong.menglong@zte.com.cn>, tomba@kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============1941180357=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1941180357==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tditrmhsvf34pfox"
Content-Disposition: inline


--tditrmhsvf34pfox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 26, 2021 at 05:55:11AM -0800, menglong8.dong@gmail.com wrote:
> From: Menglong Dong <dong.menglong@zte.com.cn>
>=20
> The 'r' in dsi_vc_send_short() is of type 'unsigned int', so the
> 'r < 0' can't be true.
>=20
> Fix this by introducing a 'err' insteaded.
>=20
> Fixes: 1ed6253856cb
> ("drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg")

Documentation/process/submitting-patches.rst:

If your patch fixes a bug in a specific commit, e.g. you found an
issue using ``git bisect``, please use the 'Fixes:' tag with the
first 12 characters of the SHA-1 ID, and the one line summary. Do
not split the tag across multiple lines, tags are exempt from the
"wrap at 75 columns" rule in order to simplify parsing scripts.

Otherwise:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 8e11612f5fe1..febcc87ddfe1 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2149,11 +2149,12 @@ static int dsi_vc_send_short(struct dsi_data *dsi=
, int vc,
>  			     const struct mipi_dsi_msg *msg)
>  {
>  	struct mipi_dsi_packet pkt;
> +	int err;
>  	u32 r;
> =20
> -	r =3D mipi_dsi_create_packet(&pkt, msg);
> -	if (r < 0)
> -		return r;
> +	err =3D mipi_dsi_create_packet(&pkt, msg);
> +	if (err)
> +		return err;
> =20
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> --=20
> 2.25.1
>=20

--tditrmhsvf34pfox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmAQhnkACgkQ2O7X88g7
+pqFEg//QN2GZc4dUy1QEuJCGbtpasVmQnWCnWQvqIhKChdfhmCxNBYdA1nstbCa
7S7PghJwgvff0Qc3xEIA/L3ZxkV7GEEMxh5fk9KR5v1gDQlaEblMSQUOmHv5Kkp5
QOEcP/i9n9uKv+6SiQguByZiVWwKA9TP1tDe0NYUnUkrMMPAH0alhoq9sQ9pmHNe
qEezOHvi0mLGWO9I/S6B9+x0J5r9MT1oEPKYvPDpieqAbMYazIRvS8BlI76Q0FI6
y57RudghYriuSIKy72dVTk71cs6uDHk+vsLbkJgEqsQmPO5fpFv4jwMTCfIobW8v
507kiKbmO7Ew4ORfgir6gu4tC/0Vxn6ek+0KRjvXjqbM/udKSU1fscC1LBoMpkg3
8ZogXhvESITOB6a3Bb7tYu3CLC0upx1C+5/fkHKDkVxusBwiDiPU5To7mFiSsz80
u+13ATAkpwapp91VvIb7Qdej5XsXgcUF7i3zSLqa2MNoqsJAM/Im/5IVGp0iA054
ObF7/oLbHDMY36wjjxsdUxHGs/dwL2v2ClE53FilqrdkXeTUgGLtpJXmO9nnK/MS
x2GaogGqAxk/lfqTsIgciUCMvqrKQ1bBzv7tu9ZtEGIfPsWUSKK+BbgzbezIUEaK
+RjNOQUOvPbdH8lUDErMKsA0k3IT64lGlewLW1Qe336MiKooA+k=
=z59Q
-----END PGP SIGNATURE-----

--tditrmhsvf34pfox--

--===============1941180357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1941180357==--
