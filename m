Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4C88D833
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 08:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D7910F905;
	Wed, 27 Mar 2024 07:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Di0d0Yt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5910F905;
 Wed, 27 Mar 2024 07:59:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 446C1CE253F;
 Wed, 27 Mar 2024 07:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0C3C433C7;
 Wed, 27 Mar 2024 07:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711526345;
 bh=3Vch1QVVKz9oQdQipI2bgreZmQt1j9KfA9zuNaGttL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Di0d0Yt+kulV0SFZXj34A8yHfdbrIl/RQIlgdOWmOgu0vU93q7/uZcKNfJbM19Owo
 +BZ42uXnvBbs2aNMWX2zEVxEyEJJPMwojzQAd/oOuGc6hsuzo9sjEfue92kS5s1+tL
 +X0T/IGlGpYESHZQDwjrSGM0goF1hyFWvEyWXrPg1ad4hI7cP4+ovYoM/hTgx8fCb/
 EZkqiKMKRqfh12FvgojNrxLdXU0BvomFMfwgXagDQybevdkNVgP/cLwVpzGTfko6us
 yqkf2Kn+Jp3UowrzesRfAiXd+8e3L1KqUh1f6QDNw2jNEHTy88aStfZfM1dI3aIme8
 Qz+9AY3eVnZ4w==
Date: Wed, 27 Mar 2024 08:59:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set
 but not used
Message-ID: <20240327-magnetic-nonchalant-hare-bbe8d2@houat>
References: <CANiq72mbsAYmR_dRPpQQ=9-NWhTtp0TWiOz0v=V-0AvwYbWw4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6rt63sq2kbvenrzj"
Content-Disposition: inline
In-Reply-To: <CANiq72mbsAYmR_dRPpQQ=9-NWhTtp0TWiOz0v=V-0AvwYbWw4A@mail.gmail.com>
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


--6rt63sq2kbvenrzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, Mar 26, 2024 at 07:04:34PM +0100, Miguel Ojeda wrote:
> Hi,
>=20
> In today's next, I got:
>=20
>     drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set
> but not used [-Werror,-Wunused-but-set-variable]
>=20
> `count` seems to be there since commit f64122c1f6ad ("drm: add new QXL
> driver. (v1.4)").
>=20
> Untested diff below -- if you want a formal patch, please let me know.
>=20
> Cheers,
> Miguel
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
> index 281edab518cd..d6ea01f3797b 100644
> --- a/drivers/gpu/drm/qxl/qxl_cmd.c
> +++ b/drivers/gpu/drm/qxl/qxl_cmd.c
> @@ -421,7 +421,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
>  {
>         uint32_t handle;
>         int idr_ret;
> -       int count =3D 0;
>  again:
>         idr_preload(GFP_ATOMIC);
>         spin_lock(&qdev->surf_id_idr_lock);
> @@ -433,7 +432,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
>         handle =3D idr_ret;
>=20
>         if (handle >=3D qdev->rom->n_surfaces) {
> -               count++;
>                 spin_lock(&qdev->surf_id_idr_lock);
>                 idr_remove(&qdev->surf_id_idr, handle);
>                 spin_unlock(&qdev->surf_id_idr_lock);
>=20

It looks reasonable to me, can you send a formal patch?

Thanks!
Maxime

--6rt63sq2kbvenrzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZgPRxgAKCRAnX84Zoj2+
duBCAYCkWAxADritRMIdxuo60bi8gMXg3ORzEQ+Re/8bjBZRbnoR6xSqWL/e9li6
7QpWXHEBewR48AANqEfzQxPcmpLpFROyX8u8HAbDv9hKJuo8mvAnbhPYLB2LBIbR
B2ivQmRB1A==
=ZxYE
-----END PGP SIGNATURE-----

--6rt63sq2kbvenrzj--
