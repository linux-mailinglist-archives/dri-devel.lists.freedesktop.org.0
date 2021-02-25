Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B796D3253EE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1DD6ECE0;
	Thu, 25 Feb 2021 16:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A376ECDE;
 Thu, 25 Feb 2021 16:48:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 03E5CC14;
 Thu, 25 Feb 2021 11:48:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Feb 2021 11:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Y3hoH88CyEc/bTgovTyqhddPMY+
 hAlfNLDKyW5TrDiQ=; b=THTWJoc5L6gBPA+viM7CL74/04ej7sq3ejfOFK/TWVN
 W631gO06gQdPNKo4P7ojsZ+VcDi5UdcBEVeikUMZ0/R1802MxPMGGY+3ylf4bzBu
 e+z6wryhINo75dYQTIdxAa83d4bXOvx5L4LJ1MOV+Ojo5GtbQIuqA1i+xW0wadZJ
 QD70AvyUszC8qeHBtFn4RWMZlnEha1VEMmwgbe1R/cP6MiLyjjStpDEeXzpU23p5
 STFKB9X7MrO+lvn3TrmLhFrhKztRJD5pCnllTZPlv2BFAiwjV9k/wKwgP5OEPkQ/
 iYd4a1ViEtdP1uotg6xxIa30y5e7D++azIgFB080ABw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y3hoH8
 8CyEc/bTgovTyqhddPMY+hAlfNLDKyW5TrDiQ=; b=nnGx/CJ6asxsrLgk8h3cnu
 ca4CqSk9qVMdvanGGxKR1UOdurvo2kGIxVomNVGpoCkjgy+r2sW0kR3Xu+53xnA/
 edjNje6F58Q0qHXhWnhiHMCaMiK/RROUNjxKh6T6opqYKzbKqAhxuQuvQT+2HiPb
 jd/BA8FIkWugQQI2MY50YxBsFxuYgTbMagMykQsSgqFShsNoVHzMcF3HbbmmFbCn
 I9583C8UUVXWTFxflAj9++jKy3ncvMXMEwdJkuWYGRUUsWjyKgo6XEtkYdrRWMPa
 ZzU/QijjKDt6JOgjvtUOwE8yjxO4v3yoMbOOcFbKPZTVR5bF4jfBTaj/JpK5GOLA
 ==
X-ME-Sender: <xms:9NQ3YLtDcdE6JVUB_5uDMsi9NSo7vT6NUENUNcOx6sQxeF8HPQ4Y0A>
 <xme:9NQ3YMf0bdJeT_qngUO2_YHvroYPXUPg7kzl5MUnNeSrp3TvSCnl0aIea1E54Z6UF
 i3kO0ihYaskzbi4upI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejuddvhfekkefhtdegiefhledutdevtdfhkedtleefjefgleduhfetudevjeeh
 hfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9NQ3YOxakJM6oeiByz41JeO1-OydPydmHfGZ5VHqcP0H9IiJfAuWDw>
 <xmx:9NQ3YKMqmkRy4Fs9IsHUQGPpL1tlALpEsV1KfeRohFer696wy3BjaQ>
 <xmx:9NQ3YL9depwR7tPcUCb-v1eqeNVz3BHN7FlF-tZYTUhRmiGAF2PQyQ>
 <xmx:9dQ3YFnHQBoV5M_AmABg-emw6OL0N759EMNnd8ZmsolOASH3Ej14hQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A12F3240068;
 Thu, 25 Feb 2021 11:48:52 -0500 (EST)
Date: Thu, 25 Feb 2021 17:48:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/compat: more dummy implementations
Message-ID: <20210225164850.krydtwq4xewf3ecs@gilmour>
References: <20210222100608.400730-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20210222100608.400730-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1198341563=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1198341563==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nk6syc3ul474pqxe"
Content-Disposition: inline


--nk6syc3ul474pqxe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 11:06:08AM +0100, Daniel Vetter wrote:
> drm_noop really doesnt do much, and who cares about the permission checks.

                  ^ doesn't

> So let's delete some code.

With the typo fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_ioc32.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index dc734d4828a1..33390f02f5eb 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -302,12 +302,8 @@ static int compat_drm_getstats(struct file *file, un=
signed int cmd,
>  			       unsigned long arg)
>  {
>  	drm_stats32_t __user *argp =3D (void __user *)arg;
> -	int err;
> -
> -	err =3D drm_ioctl_kernel(file, drm_noop, NULL, 0);
> -	if (err)
> -		return err;
> =20
> +	/* getstats is defunct, just clear */
>  	if (clear_user(argp, sizeof(drm_stats32_t)))
>  		return -EFAULT;
>  	return 0;
> @@ -820,13 +816,8 @@ typedef struct drm_update_draw32 {
>  static int compat_drm_update_draw(struct file *file, unsigned int cmd,
>  				  unsigned long arg)
>  {
> -	drm_update_draw32_t update32;
> -
> -	if (copy_from_user(&update32, (void __user *)arg, sizeof(update32)))
> -		return -EFAULT;
> -
> -	return drm_ioctl_kernel(file, drm_noop, NULL,
> -				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
> +	/* update_draw is defunct */
> +	return 0;
>  }
>  #endif
> =20
> --=20
> 2.30.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--nk6syc3ul474pqxe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYDfU8gAKCRDj7w1vZxhR
xRvsAP9LvXYPqGDL4j0jvWmFYVzyPSB3uvqLMg4ldXcT2x0l3QEAva9Vf8gP+Xs3
cRAjm92zMN+m4r3llgEH/UFJTd7aEQc=
=13Gn
-----END PGP SIGNATURE-----

--nk6syc3ul474pqxe--

--===============1198341563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1198341563==--
