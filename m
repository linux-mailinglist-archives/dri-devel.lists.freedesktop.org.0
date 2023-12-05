Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE2804CB8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A783410E488;
	Tue,  5 Dec 2023 08:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE5610E46C;
 Tue,  5 Dec 2023 08:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 219D9CE0B03;
 Tue,  5 Dec 2023 08:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A11AC433C7;
 Tue,  5 Dec 2023 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701765545;
 bh=dSJniFJvuhlzGffz0+9vfpug0bjv1vvAyeb5/+VYCOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DR8HiwhCT4uVoisMTrY7TjEF6d+wbbY3TM32TLF9nkS7i1zvGTTLo+J19B8IZQWwM
 nXhXOGJitnsCBae8OIW5q736VWtgHM+hzt4hinl9YWcJdss0khNR3dD1Jq9JT7zZdv
 OUkhVUMuSHejw+4e63+8JyWkrbUXYrBMywJhMfSCY+xUiSxCiWh6XOGaJB+2wrfjfD
 lErQQ5qbDNIB+ULAJ5QSbeOJUjzjaSLC0XyjgdV5qaE5jH8enXpr5L9Cn2a6t5hrcY
 3hVk2Xm25/cJuk5eeTH15Fqy57e7qBZPE6fCCPKNG8hEu1kW4+8yNDdlyCKDLrFUWy
 Uj/hvBOSVOK/g==
Date: Tue, 5 Dec 2023 09:39:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v7 07/10] drm/atomic: Loosen FB atomic checks
Message-ID: <nxxuloh65mlajjwvu5tazxraolrhvpz3kcsjji4alda76xgctv@ua6zwrrgucml>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vg2ogmm6wxqd5eta"
Content-Disposition: inline
In-Reply-To: <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
 ppaalanen@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vg2ogmm6wxqd5eta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 27, 2023 at 03:32:57PM -0700, Jessica Zhang wrote:
> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source !=3D FB, the commit can still go through.
>=20
> This includes adding framebuffer NULL checks in other areas to account for
> FB being NULL when non-FB pixel sources are enabled.
>=20
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source =3D=3D FB.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

This breaks some plane kunit tests we have:

See https://lore.kernel.org/dri-devel/20231204173536.51003-1-naresh.kamboju=
@linaro.org/

Maxime

--vg2ogmm6wxqd5eta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW7hpgAKCRDj7w1vZxhR
xRaSAP4ozFoBHnSVpdZs8a5pPi+lP4+/seXLresmMqgkjyFRNQD/ZVWVZ6F9ldOa
j7LNrKY0oxu+rklJhK3G1KPgR+rzyg4=
=3ESI
-----END PGP SIGNATURE-----

--vg2ogmm6wxqd5eta--
