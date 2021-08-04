Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC78F3E074F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E726E24D;
	Wed,  4 Aug 2021 18:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A307B6E24D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:13:29 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29BEF2226B;
 Wed,  4 Aug 2021 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628100808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gla+nX82yk21jSOfqT+cOK4p+kS5swTRmlPP6nJuYgc=;
 b=HKHwDtHo/0lwEXDova/iXM8jJl+540JTzWmogv7aecBxRUpVVQVV+LVbGOdYiv3faJ9M6y
 ijvXTCOmUhD3bg6wO+S70Al8pIXAmU+ZcXZjNZoGVUGeDFoUJgG1ADlJyVrOkuiaPCn91c
 VXtex88lZsZTtelZ0n7ygI8K1SAlQic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628100808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gla+nX82yk21jSOfqT+cOK4p+kS5swTRmlPP6nJuYgc=;
 b=r/+qS4mhII9MPpiGRtlOsttPDsuQqS/P5vRWhczbWWTb3v21DMkMLuAetDHMLsvsnZvO7Z
 50uSULBfLDhhcoBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 050FA139B5;
 Wed,  4 Aug 2021 18:13:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id bB47O8fYCmEHEAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Aug 2021 18:13:27 +0000
Subject: Re: [PATCH 02/14] drm/kmb: Define driver date and major/minor version
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-2-anitha.chrisanthus@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <eced0f97-06c1-9af3-29ca-8b92b31f2370@suse.de>
Date: Wed, 4 Aug 2021 20:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728003126.1425028-2-anitha.chrisanthus@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BAXW2GiiRWi1Copjaf3QzkDCu2juK97vU"
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
--BAXW2GiiRWi1Copjaf3QzkDCu2juK97vU
Content-Type: multipart/mixed; boundary="HnowNHrFxKeauIF3qwIZdrz1CtoYeYpru";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com
Message-ID: <eced0f97-06c1-9af3-29ca-8b92b31f2370@suse.de>
Subject: Re: [PATCH 02/14] drm/kmb: Define driver date and major/minor version
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-2-anitha.chrisanthus@intel.com>
In-Reply-To: <20210728003126.1425028-2-anitha.chrisanthus@intel.com>

--HnowNHrFxKeauIF3qwIZdrz1CtoYeYpru
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

just a friendly reminder that branches that end with -fixes are for=20
fixes that are required in upstream ASAP. I found this patch in=20
drm-misc-fixes. It's not important, so it should have gone into=20
drm-misc-next instead.

Best regards
Thomas

Am 28.07.21 um 02:31 schrieb Anitha Chrisanthus:
> From: Edmund Dea <edmund.j.dea@intel.com>
>=20
> Added macros for date and version
>=20
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
> ---
>   drivers/gpu/drm/kmb/kmb_drv.c | 8 ++++----
>   drivers/gpu/drm/kmb/kmb_drv.h | 5 +++++
>   2 files changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_dr=
v.c
> index c0b1c6f99249..f54392ec4fab 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -425,10 +425,10 @@ static const struct drm_driver kmb_driver =3D {
>   	.fops =3D &fops,
>   	DRM_GEM_CMA_DRIVER_OPS_VMAP,
>   	.name =3D "kmb-drm",
> -	.desc =3D "KEEMBAY DISPLAY DRIVER ",
> -	.date =3D "20201008",
> -	.major =3D 1,
> -	.minor =3D 0,
> +	.desc =3D "KEEMBAY DISPLAY DRIVER",
> +	.date =3D DRIVER_DATE,
> +	.major =3D DRIVER_MAJOR,
> +	.minor =3D DRIVER_MINOR,
>   };
>  =20
>   static int kmb_remove(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_dr=
v.h
> index 02e806712a64..ebbaa5f422d5 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.h
> +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> @@ -15,6 +15,11 @@
>   #define KMB_MAX_HEIGHT			1080 /*Max height in pixels */
>   #define KMB_MIN_WIDTH                   1920 /*Max width in pixels */=

>   #define KMB_MIN_HEIGHT                  1080 /*Max height in pixels *=
/
> +
> +#define DRIVER_DATE			"20210223"
> +#define DRIVER_MAJOR			1
> +#define DRIVER_MINOR			1
> +
>   #define KMB_LCD_DEFAULT_CLK		200000000
>   #define KMB_SYS_CLK_MHZ			500
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--HnowNHrFxKeauIF3qwIZdrz1CtoYeYpru--

--BAXW2GiiRWi1Copjaf3QzkDCu2juK97vU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEK2McFAwAAAAAACgkQlh/E3EQov+Az
8g//Z5xthnr+jplBZQX8B/GPDz1Riuvoyfym0inDXL+P/69MXrsbs0ibSmKepcqH2wO0DfXUTyoH
D49DxT6pouev6qUaAPRb5n4ssfM1nGw5r88tHxNowl3STFEthlaOLByqPMb2tyTBHPXvWOnWwWAM
6Q1gwPb0jjfOh8m8xPP1hG/H5wbAeRHhefor7Q3t3LzOw8kO5QAdUAw/D/DdMne5wbjfZ+LLvler
Vl9XiQdOkvMq4Vxn9J54xsn8Mj18obTO6FSFwHCDC6ZkL5jtSgGXMaKXPOPruRBVpQDnsupCebFG
gswPMPuBA87YeI2QizVtHxXpMdvlvepPkCzgy0deGlyTRKsRDU+nhLf0zbYbTZZHWOQdPG4AM8SE
cw03s2gjcPahdy1BPm4m61U422LKbWz8B8avnoWkc9twg+bPSdIG2Nn7yTpzwZ9LwwlcaFi1Zp+u
xaDkuqKdQkTKRtf/GB61RiB8ZPEdiJH6abnXPyBV2Hs33tqTMdJNtqsrxQo+QKoWiHe3Y4q4SaXK
skIqWUUn9E4ZhXjqj9SkUZtJcvJIn/i3SdKqGAltwo/U04DK3P7xu2CWndMyStlDrWm5aHFxVaPl
BGxzRKxKYNWVmQtqeCZnDKny3Bc7EBKDX+9Z0ew9/xBrmn62vmi6YyWnfIkLAszvLGhDXdvGvVYP
Nk0=
=Mt3r
-----END PGP SIGNATURE-----

--BAXW2GiiRWi1Copjaf3QzkDCu2juK97vU--
