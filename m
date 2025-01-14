Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E885A10ACE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C546010E3AE;
	Tue, 14 Jan 2025 15:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R9+LAwAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22AC10E3C3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:29:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E9985C4AD4;
 Tue, 14 Jan 2025 15:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F3DC4CEDD;
 Tue, 14 Jan 2025 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736868549;
 bh=YujoeKLtzNulBp1gJbyYPBd6Dn6Pd+3vsagHF6PjR6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R9+LAwAJ/1KKI0vdAcQf/rJfu/n2pAsMKGNz9guDyl4VRbngrsd/kthID9UB0fCCZ
 N51nWWCZO6d5eMLu9muzgw3P4K5+pLZCjhME3uCQvF1dhuQvImLpZGiOplvqPC4iEV
 YXQavUvXQtTr1OB/VA72rG1sC2wZRosYKekOmybyxcOwzU8Op2hk46khinR0OKuH3R
 7NmJ+kQFiuroKhrvJvwUpoX1HYRUb9BbIWSeXYpUrPCoV+cuInlDWN4oXS7gPdEIG6
 5P12fhENatfBefUNrsi6TJWWnAyN8eGEpl/pJsvtnsdTMRnl/6Yr9CibLxiH7e3PBl
 GAzMp7tqv/AdA==
Date: Tue, 14 Jan 2025 16:29:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v8 3/8] drm/managed: Add DRM-managed
 alloc_ordered_workqueue
Message-ID: <20250114-spectral-beetle-of-dignity-986943@houat>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
 <20250114-google-vkms-managed-v8-3-da4254aa3dd5@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gqrnpphgud2tjpoi"
Content-Disposition: inline
In-Reply-To: <20250114-google-vkms-managed-v8-3-da4254aa3dd5@bootlin.com>
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


--gqrnpphgud2tjpoi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 3/8] drm/managed: Add DRM-managed
 alloc_ordered_workqueue
MIME-Version: 1.0

On Tue, Jan 14, 2025 at 03:05:45PM +0100, Louis Chauvet wrote:
> Add drmm_alloc_ordered_workqueue(), a helper that provides managed ordered
> workqueue cleanup. The workqueue will be destroyed with the final
> reference of the DRM device.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>=20
> ---
>=20
> Hi Thomas,
>=20
> I noted that you wanted to mark this as Reviewed, but as this was not
> the complete patch, I prefered to have a confirmation before merging the
> patch.
>=20
> Thanks for your time,
> Louis Chauvet
> ---
>  drivers/gpu/drm/drm_managed.c |  8 ++++++++
>  include/drm/drm_managed.h     | 12 ++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 79ce86a5bd67a7201f5d60550a12364f2628e0ec..1589c28410f23b5a1e93dd163=
8420b3ae5c4b854 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -310,3 +310,11 @@ void __drmm_mutex_release(struct drm_device *dev, vo=
id *res)
>  	mutex_destroy(lock);
>  }
>  EXPORT_SYMBOL(__drmm_mutex_release);
> +
> +void __drmm_destroy_workqueue(struct drm_device *device, void *res)
> +{
> +	struct workqueue_struct *wq =3D res;
> +
> +	destroy_workqueue(wq);
> +}
> +EXPORT_SYMBOL(__drmm_destroy_workqueue);
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index f547b09ca0239dd7c4fb734038bae4438321395c..96d9b0e811675fe66d5d48f02=
b17bc7de2ac437e 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -127,4 +127,16 @@ void __drmm_mutex_release(struct drm_device *dev, vo=
id *res);
>  	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
>  })									     \
> =20
> +void __drmm_destroy_workqueue(struct drm_device *device, void *wq);
> +
> +#define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
> +	({											\
> +		struct workqueue_struct *wq =3D alloc_ordered_workqueue(fmt, flags, ##=
args);	\
> +		wq ? ({										\
> +			int ret =3D drmm_add_action_or_reset(dev, __drmm_destroy_workqueue, w=
q);	\
> +			ret ? ERR_PTR(ret) : wq;						\
> +		}) :										\
> +			wq;									\
> +	})
> +
>  #endif

Is there a reason to do a macro and not a proper function?

Maxime

--gqrnpphgud2tjpoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4aCwgAKCRAnX84Zoj2+
diWaAXsEs6N5J2t0JLcALGkYRsKKvUN3FDrThjLNM1Ba1tExT/nWVKd4II2c1+FI
xoF7FdMBewTlpVkf2LCL4kk0X4Cgn/5Psn4kIlB2s2hs6nM5Oauddpx4kafZwvtL
VOp8JeE5EA==
=FFrs
-----END PGP SIGNATURE-----

--gqrnpphgud2tjpoi--
