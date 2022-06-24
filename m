Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24412559D3C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 17:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AED510E271;
	Fri, 24 Jun 2022 15:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9F510E271
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 15:25:20 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5678C60009;
 Fri, 24 Jun 2022 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656084319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1pMABWa+zPPRVl6Qi+pNlU6l2qR6DVXwHDlmIuzYR44=;
 b=LA48ZxjsstYTAjAZMCMwewt9RZ8ZZDOk5Nf7+zYeRInkCwnj7fecKJIvaXxrMAMKPeEXzi
 OhDxil1VNRC4Yv9gAgI/h7yBYCa+bFQfEeUGO/eK46fWDXF0UMfmA0u4f1rV84KjklPk1L
 ql9E87oAFZP/1bP0avpca9LJVv8g3TxwKn/HLqpkMgm4hQkkuslVnxvEEBY/nTryaBNKbu
 UHQv1HJWV6FFehUxhPs5I5nCcAonUj+t4aMDLh6AL6aCMSXPxLL3DNR8QYpSTiGIVYE/ks
 mKUWauhxCazZz2rPlLajG217RMwyu76/cWM37wyEfl1y/MLeh6XfWSab9c/GNQ==
Date: Fri, 24 Jun 2022 17:25:17 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: logicvc: fix error code in logicvc_layer_init()
Message-ID: <YrXXXZm+APaC5Yft@aptenodytes>
References: <Yqh6VdNiDvJYMOQ+@kili>
 <YrXLx8AXRObZEbVi@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UOxW2upOTegRg8lv"
Content-Disposition: inline
In-Reply-To: <YrXLx8AXRObZEbVi@aptenodytes>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UOxW2upOTegRg8lv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 24 Jun 22, 16:35, Paul Kocialkowski wrote:
> Hi,
>=20
> On Tue 14 Jun 22, 15:08, Dan Carpenter wrote:
> > Return -EINVAL if logicvc_layer_formats_lookup() fails.  Don't return
> > success.
> >=20
> > Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controll=
er")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Thanks for the fix!
>=20
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Pushed to drm-misc-next, thanks!

Paul

> > ---
> >  drivers/gpu/drm/logicvc/logicvc_layer.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/=
logicvc/logicvc_layer.c
> > index bae1c7f99569..9c94b67afbed 100644
> > --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> > +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> > @@ -489,6 +489,7 @@ static int logicvc_layer_init(struct logicvc_drm *l=
ogicvc,
> >  	if (!formats) {
> >  		drm_err(drm_dev, "Failed to lookup formats for layer #%d\n",
> >  			index);
> > +		ret =3D -EINVAL;
> >  		goto error;
> >  	}
> > =20
> > --=20
> > 2.35.1
> >=20
>=20
> --=20
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--UOxW2upOTegRg8lv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1110ACgkQ3cLmz3+f
v9HQVAf+KQfb6VYY4dJshF7ABbAzIWcSlYgRSQFtE3ivJCNiNUPESDUIh2LknAdb
Tk/VAg1x/yeCO/vKAyGflvKH3Fke1HagmN7aN3mfJZG5My4cZ9dX5m5jweYYK4H3
/+HCZpUhjd2ohTkCoe/LOxFdMH5MvpYK4Da76rgX94dO3XrVf4DjQDvtSOaZ95Q8
0Qaf60pMmFY8ZfTXXXCbuENUt6Yk+snuAaGOYwxdUIcWB1nmzxhC9TaVKc6Xe4iM
5bCE//xCo7yTeAVAtaTKHeZNG6vLHi7tbvDxFDexHm8KcTxc0K5i7KRjlnKQiYSM
V/Ooiqnxjoewxv5camQeENU+q4l3fA==
=v5by
-----END PGP SIGNATURE-----

--UOxW2upOTegRg8lv--
