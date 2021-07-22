Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0C33D25BF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 16:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133EB6E882;
	Thu, 22 Jul 2021 14:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C25D6E882
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:29:53 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AD7862267C;
 Thu, 22 Jul 2021 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626964191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U4o+OvC4gPtYdeUG+CR2lruh1TcUIiRrjNqvgpSWIVk=;
 b=Qj0GQZvIIwROYtp0cgK6xRc85xUR1PpiIIJyoCiSNsqowMbRH9pRZYMHwt0wxj1soEptpU
 84IcZSivqooeFHlPFOolfAqB+0fUzudQbG8V7eNBMuqq5IPtNXqh3eJVBpDge6eddouodE
 Z+hV2HeswxgoYz2hiKcrACzGt1KzM2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626964191;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U4o+OvC4gPtYdeUG+CR2lruh1TcUIiRrjNqvgpSWIVk=;
 b=zviaRZXkIXpEYlLfutcBHw98JbAYqZDcClL/K6iZhpV2vHFc30iUEBu9Fz8wrxjgvDAimU
 hpTEg8AGua6qZ8Aw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 77A1413C20;
 Thu, 22 Jul 2021 14:29:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Xa+2G9+A+WAGDAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Jul 2021 14:29:51 +0000
Subject: Re: [PATCH v3] drm/shmobile: Convert to Linux IRQ interfaces
To: laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, geert@linux-m68k.org, sergei.shtylyov@gmail.com
References: <20210720080941.23646-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d23b21bb-b4fd-1924-1d38-e9c55cfe3de3@suse.de>
Date: Thu, 22 Jul 2021 16:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720080941.23646-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TRCisgeqQlhB576myJWFjXI1ojGn2EdBN"
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TRCisgeqQlhB576myJWFjXI1ojGn2EdBN
Content-Type: multipart/mixed; boundary="q03qcOXK296VSQukyJFpbOncG3V0KutUd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, geert@linux-m68k.org, sergei.shtylyov@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <d23b21bb-b4fd-1924-1d38-e9c55cfe3de3@suse.de>
Subject: Re: [PATCH v3] drm/shmobile: Convert to Linux IRQ interfaces
References: <20210720080941.23646-1-tzimmermann@suse.de>
In-Reply-To: <20210720080941.23646-1-tzimmermann@suse.de>

--q03qcOXK296VSQukyJFpbOncG3V0KutUd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi, if there are no further comments on this patch, I'd like to merge it =

soon.

Am 20.07.21 um 10:09 schrieb Thomas Zimmermann:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>=20
> v3:
> 	* return error if (ret < 0) (Geert)
> 	* remove duplicate error message (Geert)
> v2:
> 	* handle errors in platform_get_irq() (Geert, Sergei)
> 	* store IRQ number in struct shmob_drm_device (Laurent)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/gpu/drm/shmobile/shmob_drm_drv.c | 14 +++++++++-----
>   drivers/gpu/drm/shmobile/shmob_drm_drv.h |  1 +
>   2 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm=
/shmobile/shmob_drm_drv.c
> index 0a02b7092c04..7db01904d18d 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -18,7 +18,6 @@
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_irq.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_vblank.h>
>  =20
> @@ -130,7 +129,6 @@ DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
>  =20
>   static const struct drm_driver shmob_drm_driver =3D {
>   	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET,
> -	.irq_handler		=3D shmob_drm_irq,
>   	DRM_GEM_CMA_DRIVER_OPS,
>   	.fops			=3D &shmob_drm_fops,
>   	.name			=3D "shmob-drm",
> @@ -183,7 +181,7 @@ static int shmob_drm_remove(struct platform_device =
*pdev)
>  =20
>   	drm_dev_unregister(ddev);
>   	drm_kms_helper_poll_fini(ddev);
> -	drm_irq_uninstall(ddev);
> +	free_irq(sdev->irq, ddev);
>   	drm_dev_put(ddev);
>  =20
>   	return 0;
> @@ -258,7 +256,13 @@ static int shmob_drm_probe(struct platform_device =
*pdev)
>   		goto err_modeset_cleanup;
>   	}
>  =20
> -	ret =3D drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +	ret =3D platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		goto err_modeset_cleanup;
> +	sdev->irq =3D ret;
> +
> +	ret =3D request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
> +			  ddev);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to install IRQ handler\n");
>   		goto err_modeset_cleanup;
> @@ -275,7 +279,7 @@ static int shmob_drm_probe(struct platform_device *=
pdev)
>   	return 0;
>  =20
>   err_irq_uninstall:
> -	drm_irq_uninstall(ddev);
> +	free_irq(sdev->irq, ddev);
>   err_modeset_cleanup:
>   	drm_kms_helper_poll_fini(ddev);
>   err_free_drm_dev:
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.h b/drivers/gpu/drm=
/shmobile/shmob_drm_drv.h
> index 80dc4b1020aa..4964ddd5ab74 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.h
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.h
> @@ -29,6 +29,7 @@ struct shmob_drm_device {
>   	u32 lddckr;
>   	u32 ldmt1r;
>  =20
> +	unsigned int irq;
>   	spinlock_t irq_lock;		/* Protects hardware LDINTR register */
>  =20
>   	struct drm_device *ddev;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--q03qcOXK296VSQukyJFpbOncG3V0KutUd--

--TRCisgeqQlhB576myJWFjXI1ojGn2EdBN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD5gN4FAwAAAAAACgkQlh/E3EQov+AB
IxAAuQZ8eg3j41osqgTIUzwubOeS4v/g2r/KTkvspHRSRkIx3QfjuteA7puX68vvLsxymR1gCzwj
PNyFoCjtpclYAFkpoNDYIfPmKD7PNeCaMgTj8ONuBBYsbwgV+m+IV1Zhgb3uXaM2pXf3RSetvMrU
/nB3PIGvtNM9VIPvRDxigD3yrnii80JNao88ZyoGdSRLP2XRKL4dMI0B2o2y3/oqPlmYs+58K/He
FCL9oOz3Fcj3SaGJxD2lswcCkgkFUphmxb6cO4+9jvvukl20V3OkE1x+T2/0fNLKNPAZVYHtVISz
vhmpy5gW0yHRUT1Zz7LL3ZupWM+3NQx7VEyMDu1cgWM+FXPEEB6wXW8NolbcYBjwUMNyUiOmBy+C
3CJzePIybfoL/zkCJefDvqJw1yyX+ow8xZhFnvzbjHwBf9876ep2q9fdQ8l1Ibye3BnY18EVg8lx
cxwDeIiu7c7lDCDXRGjSGCCQUaCHc3kVey1s2SLYJKTgQOTsJR85yhy90qq1zIRzXTVMJENr7AX0
CzqPchCFjbv04X8YFehS/5F9R2DIa46kO90TXjAt3sCCM6rmZEw4c0gmOcck2M8R4iNrKKW9Yinc
9eR0HEGZzRZ7gj6snEHbxGc3kuTQnRRo9J5nxwofCpcdaYUR/r/jDYua0JyczMv4jZMSZ8EAnas9
QF4=
=U+uM
-----END PGP SIGNATURE-----

--TRCisgeqQlhB576myJWFjXI1ojGn2EdBN--
