Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7893E3C3F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 20:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBA689A1E;
	Sun,  8 Aug 2021 18:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4489A1E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 18:42:56 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B37A21E6E;
 Sun,  8 Aug 2021 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628448174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yAneBX2ifa9idv2tzCtk4vc7R0rq+I/WwkTNonukM5I=;
 b=WtXPsrFwg1uNS3MEZq5G6STWwwgUg6j0XXScuHndr4Jh5nISmlpNzlmaicGguJyICsWCMi
 NQ8DLEzE1i2+TvmMAQyXpZNzC9WMflM+DarYRL1CNjJYgRIFZaBwQ1mjs8p4snjk6meyvn
 rXu6NOYBZeHkJX3NDCMCDPxXz/5oh0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628448174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yAneBX2ifa9idv2tzCtk4vc7R0rq+I/WwkTNonukM5I=;
 b=Rxq2PvJ8UcrzquuKxywoWajaAeA4JWsxP35ixHlKozD/+dFKiMzTZ7Yd7W3K6mz/3HotZU
 y5iEHTuQ6t79fcDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4C023133DE;
 Sun,  8 Aug 2021 18:42:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id HGOHEK4lEGEZNwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Sun, 08 Aug 2021 18:42:54 +0000
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-3-paul@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/8] drm/ingenic: Simplify code by using hwdescs array
Message-ID: <d6db6de0-dcc8-b0f0-439d-7a5f69ac4c62@suse.de>
Date: Sun, 8 Aug 2021 20:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210808134526.119198-3-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UHDex8pElFNk3d29OTwSKiYKAG7Pk9sBO"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UHDex8pElFNk3d29OTwSKiYKAG7Pk9sBO
Content-Type: multipart/mixed; boundary="aRtmIhlJ56y8QEkJga1Yt8VG0iCIJngB0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <d6db6de0-dcc8-b0f0-439d-7a5f69ac4c62@suse.de>
Subject: Re: [PATCH 2/8] drm/ingenic: Simplify code by using hwdescs array
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-3-paul@crapouillou.net>
In-Reply-To: <20210808134526.119198-3-paul@crapouillou.net>

--aRtmIhlJ56y8QEkJga1Yt8VG0iCIJngB0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.08.21 um 15:45 schrieb Paul Cercueil:
> Instead of having one 'hwdesc' variable for the plane #0 and one for th=
e
> plane #1, use a 'hwdesc[2]' array, where the DMA hardware descriptors
> are indexed by the plane's number.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 38 ++++++++++++----------=
-
>   1 file changed, 20 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index e42eb43d8020..bc71ba44ccf4 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -49,8 +49,7 @@ struct ingenic_dma_hwdesc {
>   } __aligned(16);
>  =20
>   struct ingenic_dma_hwdescs {
> -	struct ingenic_dma_hwdesc hwdesc_f0;
> -	struct ingenic_dma_hwdesc hwdesc_f1;
> +	struct ingenic_dma_hwdesc hwdesc[2];
>   	struct ingenic_dma_hwdesc hwdesc_pal;
>   	u16 palette[256] __aligned(16);
>   };
> @@ -141,6 +140,13 @@ static inline struct ingenic_drm *drm_nb_get_priv(=
struct notifier_block *nb)
>   	return container_of(nb, struct ingenic_drm, clock_nb);
>   }
>  =20
> +static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *pri=
v, bool use_f1)

Using the plane index instead of a boolean would be more aligned to the=20
way this function is being used.

> +{
> +	u32 offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc[use_f1]);

use_f1 is a function parameter. Is offsetof guaranteed to be evaluated=20
at runtime?

> +
> +	return priv->dma_hwdescs_phys + offset;
> +}
> +
>   static int ingenic_drm_update_pixclk(struct notifier_block *nb,
>   				     unsigned long action,
>   				     void *data)
> @@ -562,6 +568,7 @@ static void ingenic_drm_plane_atomic_update(struct =
drm_plane *plane,
>   	struct ingenic_dma_hwdesc *hwdesc;
>   	unsigned int width, height, cpp, offset;
>   	dma_addr_t addr;
> +	bool use_f1;
>   	u32 fourcc;
>  =20
>   	if (newstate && newstate->fb) {
> @@ -569,16 +576,14 @@ static void ingenic_drm_plane_atomic_update(struc=
t drm_plane *plane,
>   			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
>  =20
>   		crtc_state =3D newstate->crtc->state;
> +		use_f1 =3D priv->soc_info->has_osd && plane !=3D &priv->f0;
>  =20
>   		addr =3D drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
>   		width =3D newstate->src_w >> 16;
>   		height =3D newstate->src_h >> 16;
>   		cpp =3D newstate->fb->format->cpp[0];
>  =20
> -		if (!priv->soc_info->has_osd || plane =3D=3D &priv->f0)
> -			hwdesc =3D &priv->dma_hwdescs->hwdesc_f0;
> -		else
> -			hwdesc =3D &priv->dma_hwdescs->hwdesc_f1;
> +		hwdesc =3D &priv->dma_hwdescs->hwdesc[use_f1];

Maybe add a helper that looks up the hwdesc field for a given plane?

>  =20
>   		hwdesc->addr =3D addr;
>   		hwdesc->cmd =3D JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
> @@ -591,9 +596,9 @@ static void ingenic_drm_plane_atomic_update(struct =
drm_plane *plane,
>   			if (fourcc =3D=3D DRM_FORMAT_C8)
>   				offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc_pal);
>   			else
> -				offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
> +				offset =3D offsetof(struct ingenic_dma_hwdescs, hwdesc[0]);
>  =20
> -			priv->dma_hwdescs->hwdesc_f0.next =3D priv->dma_hwdescs_phys + offs=
et;
> +			priv->dma_hwdescs->hwdesc[0].next =3D priv->dma_hwdescs_phys + offs=
et;

Maybe priv->dma_hwdescs_phys + offset could be computed in a more=20
flexible helper than dma_hwdesc_addr().

>  =20
>   			crtc_state->color_mgmt_changed =3D fourcc =3D=3D DRM_FORMAT_C8;
>   		}
> @@ -964,20 +969,17 @@ static int ingenic_drm_bind(struct device *dev, b=
ool has_components)
>  =20
>  =20
>   	/* Configure DMA hwdesc for foreground0 plane */
> -	dma_hwdesc_phys_f0 =3D priv->dma_hwdescs_phys
> -		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
> -	priv->dma_hwdescs->hwdesc_f0.next =3D dma_hwdesc_phys_f0;
> -	priv->dma_hwdescs->hwdesc_f0.id =3D 0xf0;
> +	dma_hwdesc_phys_f0 =3D dma_hwdesc_addr(priv, 0);
> +	priv->dma_hwdescs->hwdesc[0].next =3D dma_hwdesc_phys_f0;
> +	priv->dma_hwdescs->hwdesc[0].id =3D 0xf0;
>  =20
>   	/* Configure DMA hwdesc for foreground1 plane */
> -	dma_hwdesc_phys_f1 =3D priv->dma_hwdescs_phys
> -		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f1);
> -	priv->dma_hwdescs->hwdesc_f1.next =3D dma_hwdesc_phys_f1;
> -	priv->dma_hwdescs->hwdesc_f1.id =3D 0xf1;
> +	dma_hwdesc_phys_f1 =3D dma_hwdesc_addr(priv, 1);
> +	priv->dma_hwdescs->hwdesc[1].next =3D dma_hwdesc_phys_f1;
> +	priv->dma_hwdescs->hwdesc[1].id =3D 0xf1;
>  =20
>   	/* Configure DMA hwdesc for palette */
> -	priv->dma_hwdescs->hwdesc_pal.next =3D priv->dma_hwdescs_phys
> -		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
> +	priv->dma_hwdescs->hwdesc_pal.next =3D dma_hwdesc_phys_f0;
>   	priv->dma_hwdescs->hwdesc_pal.id =3D 0xc0;
>   	priv->dma_hwdescs->hwdesc_pal.addr =3D priv->dma_hwdescs_phys
>   		+ offsetof(struct ingenic_dma_hwdescs, palette);
>=20

Could the setup in these three blocks be moved into a common helper?

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aRtmIhlJ56y8QEkJga1Yt8VG0iCIJngB0--

--UHDex8pElFNk3d29OTwSKiYKAG7Pk9sBO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEQJa0FAwAAAAAACgkQlh/E3EQov+Bn
1g//cmuBfyoOkW9mB/G31JxjqITPFPE1X94zMOBWNarfs20Y1P1cf8LLhMLRbiGpxsPw0D4MY01r
VMtb7dL+Br+YE4snWlxe+Ll/mMK1qgqgkIrOJPBU1vK9Blkn3GSKu1pLkOvVf7QswL8awAbDGaOR
Q9wpxulumhXuEjKYBs98/tzMREYnC6zRsguo8xsCRHesD4FMtDsKdKHKiQFibZVbJ7fa+ndbbSHe
wqDazoU+cPGudtknE3vy/CIlsjHVxLYbZlbgVbRsL+qVX+NbD6cwG2EEC/c4cfICnBzc+hSv+I7b
pj6ZaihHBqm6AqD0APpKKeq02S1nnOK2w9s52arcMUgQE26W+pl4kgHRldDCE6e3oeN1NnMesxUk
9/WxYOBVFLrW9pSaC77+baZa/kDWRxhXI70+tOejSPnOfSIEf6luGKAFLPp59FuemSVNOxbACIlz
BVTOp52c05HzY3evhwBWdJlOiP3HpIDIC01GZ55lR2k4n+xM2B0+7WNIhuk5zB+MEwFbR5sj3a9j
uB0AXIHUrDmLoPD+7ziecDV/xTlGnGHkF19ZXC4Bgjx9bd8zTcr6uouJiiHIKZPPielYCPkrqNvR
hRmMfs2JFYIPd1xk44lXMbyvwXY3IFoJzgI4/uiI0ntud3h9a17fI6K5fiI3DxjDfnk0T/wQpAMW
Z3w=
=sxUw
-----END PGP SIGNATURE-----

--UHDex8pElFNk3d29OTwSKiYKAG7Pk9sBO--
