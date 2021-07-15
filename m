Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C423C9A48
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CB26E58E;
	Thu, 15 Jul 2021 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E166E58E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:13:11 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45E1B228C2;
 Thu, 15 Jul 2021 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z2yvnvwmkz+TXRejTz6xIv6FvT7llrAkuSgTP0OyZGI=;
 b=06ZQIyHFCGY0wFeFC4EPSg8OAs2ZObnnf4/hS4pbupoOEi9hnvC04mpTyrfm0D8oFSF7HD
 hfIpY6WS6FXmLYNMMcujW3QpHFl/R/PmAOm8cK3OfPszbOLGhw7OggtIy/4E24uGewKRxO
 UDyHJz02YSHJF7HYPMk1Yj5xEyhalYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z2yvnvwmkz+TXRejTz6xIv6FvT7llrAkuSgTP0OyZGI=;
 b=sKpVzg8c4I21mdRD8GSNz5gH08AmHtDR3ts0sGc18ll93qwdJp6M99r0sHRdI+fkieCGgz
 ItEhHbdqZQFEsHAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2931313AB3;
 Thu, 15 Jul 2021 08:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id oHceCRbu72AyawAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 08:13:10 +0000
Subject: Re: [PATCH] drm/omapdrm: Remove outdated comment
To: tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch
References: <20210706073125.7689-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <695f4a61-ef43-c08d-41d2-992059791cb8@suse.de>
Date: Thu, 15 Jul 2021 10:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706073125.7689-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="96ZF5Ndsd5d3ZbnZQkk71fqktN5U8QCuU"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--96ZF5Ndsd5d3ZbnZQkk71fqktN5U8QCuU
Content-Type: multipart/mixed; boundary="cFRGOpWTvj8bFNb3zfAuAXxpSOBWCOQy8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <695f4a61-ef43-c08d-41d2-992059791cb8@suse.de>
Subject: Re: [PATCH] drm/omapdrm: Remove outdated comment
References: <20210706073125.7689-1-tzimmermann@suse.de>
In-Reply-To: <20210706073125.7689-1-tzimmermann@suse.de>

--cFRGOpWTvj8bFNb3zfAuAXxpSOBWCOQy8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for review

Am 06.07.21 um 09:31 schrieb Thomas Zimmermann:
> The comment refers to drm_irq_install() et al, which are not used by
> omapdrm. The functions are part of the DRM IRQ midlayer and shouldn't
> be used any longer. Remove the comment.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/omapdrm/omap_irq.c | 7 -------
>   1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapd=
rm/omap_irq.c
> index bb6e3fc18204..4aca14dab927 100644
> --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> @@ -253,13 +253,6 @@ static const u32 omap_underflow_irqs[] =3D {
>   	[OMAP_DSS_VIDEO3] =3D DISPC_IRQ_VID3_FIFO_UNDERFLOW,
>   };
>=20
> -/*
> - * We need a special version, instead of just using drm_irq_install(),=

> - * because we need to register the irq via omapdss.  Once omapdss and
> - * omapdrm are merged together we can assign the dispc hwmod data to
> - * ourselves and drop these and just use drm_irq_{install,uninstall}()=

> - */
> -
>   int omap_drm_irq_install(struct drm_device *dev)
>   {
>   	struct omap_drm_private *priv =3D dev->dev_private;
> --
> 2.32.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cFRGOpWTvj8bFNb3zfAuAXxpSOBWCOQy8--

--96ZF5Ndsd5d3ZbnZQkk71fqktN5U8QCuU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDv7hUFAwAAAAAACgkQlh/E3EQov+BP
nA//YAVO1kp9dCgf1tBG0Oi2u9PvQyYR6xLvc33pzHioATzVe6pICC/e61/c+CNgFqzHpepT+deg
jPlKqWOYWCqAY0uhvdm+iiMer4e6UvjQTN5ITQ5wTck7A2vfgR+eWlOAYlYf/z5jIZMmkF/T8oH/
ZR5X/yav1T2KEOCo711AYFYHo/BdBeEsAhwRiIXBLl3Nf+UjpIdjV0VuwWwBRh9pe/r/p2h4pr93
qJe3VkFvmJq5yzILVAt+kYGUBo+IZY+RfBpOhRa/FRYUkBX7EdVp08+2mhllYW7fn1ONh0Mm7L4N
d/ojWAvajbXjiMPfR27nKqFpjzLGEXH2Dn98vEKD6QfSeYCftTe9z8SU+tlVMF5Hr6+9NXYTQ1pN
YRER1rmJPvgPzwjiFxAFEck9Yh27oAowLaxhPO8MTcTKX9uQUmZfbDKAp2qdbtEZe5TmjoKa5rKM
+z50Tku0qG4k4QGnif615RLymYj9xg+ygPKsFgqIoNrqY9oZULl2CphW69tojTZa7HJ0YuqOquqz
t7nEzdZFM0z+4eISoXDhfN1Be+aJMuyTkwZ22U4wlZ+t2b/OE/JuCiORJTLUYj2xaRy2tqzKyfKB
hLbgj0FsuxinQrpli2+ixftYUUK3xL8hCwun+o+1VkFh7kCfjPc/5yZvB+XYTbvsO6CRkxWwGVed
x9U=
=+Z4o
-----END PGP SIGNATURE-----

--96ZF5Ndsd5d3ZbnZQkk71fqktN5U8QCuU--
