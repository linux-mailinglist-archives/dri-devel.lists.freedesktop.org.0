Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A5263E82
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B011C6E215;
	Thu, 10 Sep 2020 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635846E343
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 14:13:43 +0000 (UTC)
Received: from kevin (unknown [IPv6:2607:fea8:55f:a950::68f4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C3EE929AF39;
 Wed,  9 Sep 2020 15:13:33 +0100 (BST)
Date: Wed, 9 Sep 2020 10:13:28 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Ensure GPU quirks are always initialised
Message-ID: <20200909141328.GA1853@kevin>
References: <20200909122957.51667-1-steven.price@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200909122957.51667-1-steven.price@arm.com>
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Marty E. Plummer" <hanetzer@startmail.com>
Content-Type: multipart/mixed; boundary="===============2131108417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2131108417==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.c
> index e0f190e43813..6d17d3cbd1df 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -305,6 +305,8 @@ void panfrost_gpu_power_on(struct panfrost_device *pf=
dev)
>  	int ret;
>  	u32 val;
> =20
> +	panfrost_gpu_init_quirks(pfdev);
> +
>  	/* Just turn on everything for now */
>  	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
>  	ret =3D readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
> @@ -356,7 +358,6 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  		return err;
>  	}
> =20
> -	panfrost_gpu_init_quirks(pfdev);
>  	panfrost_gpu_power_on(pfdev);
> =20
>  	return 0;
> --=20
> 2.20.1
>=20

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9Y4wIACgkQ/v5QWgr1
WA1OOQ//bzBrqIhh/+djm4twwCWb3xS/NeuDiMnFzp4N0y8zm9yu9XY7IaQ5lZwB
pcpSLKMBrHjg2yKcmYwssGdAZROMn9+veiCmk9LC/DsZOo5RMpGXskM76l9xwDDW
u/gng9rp0917VhpE2G+1gb4oRxBWmEgyHIM6Loe5PI+QG2796mB/LcCabKzU2jSr
E6NRQcKu6CwATbQpN4uA8BLdS8RYFsCbDVkZTNEr7GcufF6iQZI7QhYil4EHHzYH
pm1X3nfpWM53iZ87Qr01gQEhYQdJD+sssdgaSaiUiWthkKmC+/CW3WFKi2g7IP7X
feaawkjOjJO6/5JpKSrJaa78JFR2g/rnRwHHFUtltp8k7cvh5KFY7tFFVbmv24Ga
xy9ZCro2MCUrjbwEX1QO0IY3oVrTn5iWuWGcGzklDHubZOi3Etsokr4eKKuAtzeY
AtHFfXYL/iAUUAVnC1tOdOU9IsFjubTnNxfJn8Lu4iExoeHBpSNjvlBb4byCjUzc
+z38V69Db60/SYn1ieK+odf4DgEdyiD5tNKqyYWmaYnnkQn0tj49Ilkw5MR2/W0C
rLov5bUObCEs0mGEsOKrnEmBaLWI3PvAc/gRO01YiRkQQSQkZpQAiTX2sHNZJMx4
B+7ATfTeersP+ELtmrRRYgOqs233S8p7FnpAgvctyFlywPlIcvU=
=xiuj
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--

--===============2131108417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2131108417==--
