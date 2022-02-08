Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74824AD547
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDEF10E60C;
	Tue,  8 Feb 2022 10:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFDF10E5F1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J9ZLpWXboObspMaqWNpbdeffENDNVHxTA3PkytgsWb0=; b=N4wKRFIDS2p+1DmIEgZqST6vnk
 pI6PzAUiQoUzelN5a4NzYWWCBUJmdDDB1OnVQWvZ0x4rTog5/3Q0EoqCWzp46h2ziwZNPl0NotPqQ
 dO9kTgUDEq7tKOAq66y7zOWqte47YJzlx0yu0RvyEzgskAaNEnSD3r3SU00C3FH5VfBnE0PsBNyWW
 E16nZK/mD6RK6/zq9SN09aKVuJDca5MKi7QFjR1MU4DwVpwkdojNRn5iAzIa9Dw+rFliqhMccevun
 fb+sbxPjdU+MntO1PUHeBx69Wytlfrja4B4SnUZqXUsGP06bknGkG1faC7IfIIMKsBQyaq7zMllTI
 Emg7kxAg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nHNKj-0005OL-PS; Tue, 08 Feb 2022 11:02:49 +0100
Date: Tue, 8 Feb 2022 09:02:23 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 1/9] drm: vkms: Replace the deprecated
 drm_mode_config_init
Message-ID: <20220208100223.ft3aim2rgxhwkgn2@mail.igalia.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-2-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vqkmkpbl36h4e37l"
Content-Disposition: inline
In-Reply-To: <20220121213831.47229-2-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vqkmkpbl36h4e37l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/21, Igor Torrente wrote:
> `drm_mode_config_init` is deprecated since commit c3b790ea07a1 ("drm: Man=
age
> drm_mode_config_init with drmm_") in favor of `drmm_mode_config_init`. Up=
date
> the former to the latter.
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
> V2: Change the code style(Thomas Zimmermann).
>=20
> V4: Update the commit message(N=EDcolas F. R. A. Prado)
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 0ffe5f0e33f7..ee4d96dabe19 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -140,8 +140,12 @@ static const struct drm_mode_config_helper_funcs vkm=
s_mode_config_helpers =3D {
>  static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev =3D &vkmsdev->drm;
> +	int ret;
> +
> +	ret =3D drmm_mode_config_init(dev);
> +	if (ret < 0)
> +		return ret;
lgtm.

Reviewed-by: Melissa Wen <mwen@igalia.com>
> =20
> -	drm_mode_config_init(dev);
>  	dev->mode_config.funcs =3D &vkms_mode_funcs;
>  	dev->mode_config.min_width =3D XRES_MIN;
>  	dev->mode_config.min_height =3D YRES_MIN;
> --=20
> 2.30.2
>=20

--vqkmkpbl36h4e37l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmICP6kACgkQwqF3j0dL
ehx8lhAAwFkcxXNH6GKTfNprQs9oQhk/Y6Iz4MKf/MmFpuoyNExz93WJzh7dIFFr
uyfN4nLqlFuDxqVrYw/AWVAMDKSHzRUOk5mjm5ltI34kmdK/rU9kFVMdbFRhl9Yh
uN6H2TeKSqh+bCmI54y+/ttSe8N88Yt6RVJ2hBgohSEIcEfQzQ/SFyjSehKx84sg
W6h3f39W5y7aFtdhiE4NBTSHIFLoLFus/S9kuGynWsJglIbkmDGiDTdbtuQu4Sbf
HXDaEVmMDZQRKgb+4KaBlEPcdI5aLESzcHTRRwiHLCMB9qqwQK+OPmK5btsIHBpB
sao29OfYgWDuwMFdkxzc30iY39lFHC9LVlaU2xE7aRn66tVtosb3HgwHTFPVwjGo
zQAHeiehHsC4gvvNUim/k3pEwBxpQJpib2Q+4JIawMhou6NeC4oQf2La32DuIsY8
xtiZS+eG6ZBlz8YdqpwP9kawx4tz23p8KI2itnj+7J8KgwRhviOmaldwrRdc2Zs7
vF1ME22KbXYGYYD7mHFboxo/59xC6hcSAs3PJ7v3rSgZO6r7MaoEo9YF3QHrQI8u
sOMEF86RfGhveeKsZ7xfzfZaH+z22ZlnuFyDJ/CouhzVAUFcnpfF4JssNKa7CSvy
kGiVtZWnVSzd70qNXczerTYU3/dgpeoDT3XBW3Uc9LoYSxpRguE=
=Xsjv
-----END PGP SIGNATURE-----

--vqkmkpbl36h4e37l--
