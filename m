Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651356BBFCD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 23:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1B10E00F;
	Wed, 15 Mar 2023 22:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D3B10E00F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 22:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J8IlJOZzja4gjVYeF3pSjxtVezljt/5QL0ylLBbDcfY=; b=hLY5gIhzTle1GSPxIcrypQtnLO
 ppZAS4gX5dn+KRvw6ufkk88Ud79YYHSNpdgfBJUIUtn7yAPDROAzFohJQbJ5Orl7XIEFqGjh7Qf1O
 V78IocYtVVrOpt0RtFgq4l6LgtFpx/gM4bQmERaC0iinfvgd0SePfKFxoJyk8OwwglpJ9XNlfgzK/
 DmceV/QxgKiJ/haj/2VlX916QyeBbPzMrqSDhnChvmRWwBWTlOq+mODpk6hEJJWPkvN4i3swBHzLr
 k8aJkZSZoRoUvHyTiik+2i1NOFvj15Vef1yE5/FbAWZ7b+Sh6mUTnoeIezvFQhqZt5zs2B1dWL8v9
 u+wbx3Aw==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pcZei-00COR3-Ag; Wed, 15 Mar 2023 23:31:36 +0100
Date: Wed, 15 Mar 2023 21:31:27 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vgem: Drop struct drm_vgem_gem_object
Message-ID: <20230315223127.5donvtt75hnabj2p@mail.igalia.com>
References: <20230222160617.171429-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3k7wc3kolioosj2t"
Content-Disposition: inline
In-Reply-To: <20230222160617.171429-1-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3k7wc3kolioosj2t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/22, Ma=EDra Canal wrote:
> Commit 45d9c8dde4cd ("drm/vgem: use shmem helpers") introduced shmem
> helpers to vgem and with that, removed all uses of the struct
> drm_vgem_gem_object. So, as the struct is no longer used, delete it.
>=20
Thanks,

Reviewed-by: Melissa Wen <mwen@igalia.com>

> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.h | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.h b/drivers/gpu/drm/vgem/vgem_=
drv.h
> index 0ed300317f87..34cf63e6fb3d 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.h
> +++ b/drivers/gpu/drm/vgem/vgem_drv.h
> @@ -39,17 +39,6 @@ struct vgem_file {
>  	struct mutex fence_mutex;
>  };
> =20
> -#define to_vgem_bo(x) container_of(x, struct drm_vgem_gem_object, base)
> -struct drm_vgem_gem_object {
> -	struct drm_gem_object base;
> -
> -	struct page **pages;
> -	unsigned int pages_pin_count;
> -	struct mutex pages_lock;
> -
> -	struct sg_table *table;
> -};
> -
>  int vgem_fence_open(struct vgem_file *file);
>  int vgem_fence_attach_ioctl(struct drm_device *dev,
>  			    void *data,
> --=20
> 2.39.2
>=20

--3k7wc3kolioosj2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmQSRzkACgkQwqF3j0dL
ehzcHRAAqaG+q88ABzpDbms4o+vwa9GPSclLHx8pRQKQoKnDIYtcv3uBoVo0zNjU
ySTEYEw/FTMiarmN4YkPb2DGD62X21y+wor/RkaRsUxKEYvsqi/lvHbl3QW5VkIV
pfQEj/evoX2NZOf53WGIR/uu1lb48NxXUnO9NzcnlcZmLNy3lAK5T+m7aJyCxeS0
QbrDxkHkrgRh4yAu++JpvZ8n0aT7AbQPGJiCDQQstMM2nBs0gNmF7EIoaXwObHLl
T45khHbRy2gXNvzoTmyr8gkPr1lG86+TFxDsOefA+VXlfcgCT5PaLKnHehfF7eow
0Y8BzH8Dnw7Yl86qcixKs8sB4/dMCTwUAPAQNRr3/w9ej+5uOQ28rqblKwQlvm7e
DieKg1Q69Wx1XXZupjQ+DShxkozJP7ff9RMhgAGdtxA+88v0km+98MBiV4fjyxrE
rmLSX0Lb7C0r70wy2NanoPdzPrhgGZbe+wrPsiH8vd00GGMaO3GK82Zgl9nieC/g
QDEK+/MB9VNYSMK0wR3xKK7r0mEIwIpK0WliTfY2FngmqNeUtuhcwwCvkTxum3bs
/dDRQ/y0fhHYfB/qLlJYd/AYccpSdSHQIIlO5o58O3IRgfIdCcL/Jrknt6ZPdBlc
BiXJX3lVMc2FF734jeqVxxkvXw/IIJp7IPpXbYDdXpcwzqHYBqw=
=Y805
-----END PGP SIGNATURE-----

--3k7wc3kolioosj2t--
