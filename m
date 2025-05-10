Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319CAB2333
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 11:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A20210E20D;
	Sat, 10 May 2025 09:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rXWpAKMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3075710E20D
 for <dri-devel@lists.freedesktop.org>; Sat, 10 May 2025 09:59:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 07248A4A467;
 Sat, 10 May 2025 09:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37174C4CEE2;
 Sat, 10 May 2025 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746871161;
 bh=3DEDo/oT2mSMSaFNL9SAV8nObn2xvcl2tILbp4CvHJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXWpAKMNzeCNUPQsBH4RKKdK7l89yw0b+2lxhE6Az1XtHzs5gDI8lrCdav9ZbFlY7
 fCgQm4MZFA39hJ/owlgQZAUCLqKQ0BXi4fIWheg/x5Vlj5TrHLvq3j2MosBEewj60c
 itmdtszyhedIyELm76r/dC+GDOfDGoC5LjPAfgGVE234GPxcZxYHlvguA6gdI2UYFL
 iLfyHAp4jNjaBuGnZzmAeNJffZx7xp8ApgpGKHhxfRsaEmEHDTEe7YaqJLdG7IAWjf
 D2EmK44ParOoe43q1mi1zkpJ/Bi52RWyNrfkveGzRcljdprHCjuLLvGUKG7OXW5jTY
 T70o6qew3fsJg==
Date: Sat, 10 May 2025 11:59:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux.dev>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: implement virtio_gpu_shutdown
Message-ID: <urpxto3fgvwoe4hob2aukggeop4bcsyb7m5wflgru4c3otd6rq@aktopqufgxom>
References: <20250507082821.2710706-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="heio2mtmzyxze2l7"
Content-Disposition: inline
In-Reply-To: <20250507082821.2710706-1-kraxel@redhat.com>
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


--heio2mtmzyxze2l7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/virtio: implement virtio_gpu_shutdown
MIME-Version: 1.0

Hi,

On Wed, May 07, 2025 at 10:28:21AM +0200, Gerd Hoffmann wrote:
> Calling drm_dev_unplug() is the drm way to say the device
> is gone and can not be accessed any more.
>=20
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index e32e680c7197..71c6ccad4b99 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device =
*vdev)
> =20
>  static void virtio_gpu_shutdown(struct virtio_device *vdev)
>  {
> -	/*
> -	 * drm does its own synchronization on shutdown.
> -	 * Do nothing here, opt out of device reset.
> -	 */
> +	struct drm_device *dev =3D vdev->priv;
> +
> +	/* stop talking to the device */
> +	drm_dev_unplug(dev);

I'm not necessarily opposed to using drm_dev_unplug() here, but it's
still pretty surprising to me. It's typically used in remove, not
shutdown. The typical helper to use at shutdown is
drm_atomic_helper_shutdown.

So if the latter isn't enough or wrong, we should at least document why.

Maxime

--heio2mtmzyxze2l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB8jcAAKCRAnX84Zoj2+
duddAYDhtj3E5iLvtJE0ExfR3YSefUln3girrNWJDNmuwHDv700fcFh2eNBGOWJy
94rqjtoBfRpekvvA/QLKNQlgDgV2cxs7yw1z4vpWWmJ/RQAgNfXyMUxiepy/DCAJ
GQrxfPQIlw==
=QWHu
-----END PGP SIGNATURE-----

--heio2mtmzyxze2l7--
