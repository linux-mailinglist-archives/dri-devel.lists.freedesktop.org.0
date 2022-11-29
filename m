Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5AC63BF15
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E75B10E3BA;
	Tue, 29 Nov 2022 11:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7CB10E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4tf8z7dZOeYN4xnU8T66K5Az7kxKz8Z892po7P0TE3Y=; b=VvKseI3H6CgGUYZKuZZstWXAM0
 rgBBfo5q+NtZsTNOLQW56afXhLxxDXdau82t1R0o/M6V6e3Hx/ZWM8EmqXt4OogvUK92zDlHMpfRm
 cofZqm+dRUJrTjWHZjAMeFpEY3E/T6Z8YoFNbBDo6Uu6/0ez2kx61LNMsF56xow2+SOgcBoAMLqa9
 xXmFOOQCE0r+JFNbt55KNYG4CbscPM9ILg+BCCaFx72+BCe9h7FaQxG99EiPfOihaIRjDyM9djecL
 5UKqgir+EKCzR52UrGGxIRvsK9TnTC21VSNl0s2fmcSQ+s+s/+CL8sG9AgLD/CjiRNd5NQM+7szot
 wIyIb/Ng==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ozyri-00Awmn-Ox; Tue, 29 Nov 2022 12:33:30 +0100
Date: Tue, 29 Nov 2022 10:33:27 -0100
From: Melissa Wen <mwen@igalia.com>
To: Alaa Emad <aemad@igalia.com>
Subject: Re: [PATCH] drm/vkms: change min cursor size to accept smaller values
Message-ID: <20221129113327.ljnzdwt42okpvwmg@mail.igalia.com>
References: <20221109113945.20938-1-aemad@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lxoznv72gmjsdsza"
Content-Disposition: inline
In-Reply-To: <20221109113945.20938-1-aemad@igalia.com>
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
Cc: hamohammed.sa@gmail.com, andrealmeid@igalia.com,
 rodrigosiqueiramelo@gmail.com, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lxoznv72gmjsdsza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/09, Alaa Emad wrote:
> change min cursor size of vkms driver from 20 to 10, to increase the IGT =
test
> coverage of vkms by enabling 32x10 cursor size subtests in kms_cursor_crc
>=20
> Signed-off-by: Alaa Emad <aemad@igalia.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 0a67b8073f7e..4a248567efb2 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -12,8 +12,8 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_writeback.h>
> =20
> -#define XRES_MIN    20
> -#define YRES_MIN    20
> +#define XRES_MIN    10
> +#define YRES_MIN    10

LGTM

Thanks,

Reviewed-by: Melissa Wen <mwen@igalia.com>

> =20
>  #define XRES_DEF  1024
>  #define YRES_DEF   768
> --=20
> 2.34.1
>=20

--lxoznv72gmjsdsza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOF7gcACgkQwqF3j0dL
ehzH3g/9Hdvz5pcKPFh9r3GaP4chKnDS8X/01kMSmO2QagKrBkwuAqAwqXURFEeK
sQ+i4MocU+bZj2ImjbY1kDu/h9G8INXpy3qjXcP2INJw1qwAKJxPK04AL9DhtBfc
KF9ly+003wgnhtRYd+nOxSXbfFGYM1YPdxWueh0tWE1TX8igqK4OGN3dilGQus7X
dDaNI9Atam8+O/DKgDzkwlkBhdI6kGaZQPd0a6DvJDitHlYlerFNufhKgIYu0K8X
l7LD6xcqgpZKYBIkLn9OxX2poEpN1bl0mzAgClssHbTrVudMbkWq3/rHgI1OtfE1
lzkhc//nT2/iZ22otF7gEMEq5AvUqn4iipRrarWAXUeDTMqUQ+th06hfZ9i6RffD
/P0/irS3hNy4RpG4i7k9TeSUykArZ9FXvLm+Pgt5rMKRfzywFA6SJ2VLoXdsp2Gi
3Of96mB5W6Mn0l46Xlp8Mx5am5UJU73zJD06litptD+hpoNldNa2YDcnHiC+CLQx
KaptTQ2wR293Z2/i9mLQo/hAv9LmwofdSlWMI5GHcwh5urYCdmGmotyDXjh6hJWV
QhLcRbzYdk4ZyCE4EYwH7gLv8DDEn9mYzCxzhrL3XXjNIXbUhyXSnkcplhrv2uS+
byojzt0M4SeQKtezyi6axUv23VkGbFCpah4n1nE64SJolLWHKhk=
=zXJQ
-----END PGP SIGNATURE-----

--lxoznv72gmjsdsza--
