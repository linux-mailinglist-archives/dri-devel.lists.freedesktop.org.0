Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E00893591
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 21:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF7510E7EB;
	Sun, 31 Mar 2024 19:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=natalenko.name header.i=@natalenko.name header.b="EWburBWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 595 seconds by postgrey-1.36 at gabe;
 Sun, 31 Mar 2024 19:20:25 UTC
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A8C10E7EB
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 19:20:25 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by prime.voidband.net (Postfix) with ESMTPSA id A577C62FD5E0;
 Sun, 31 Mar 2024 21:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1711912226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/EtX0OVt3ih5dbQ01+pyMTmXRKnYiOfgjTF+4SBncoQ=;
 b=EWburBWB7TKQXoda3pMGIi/jRURXx0cTJ+HY3XiIq22mxZTtnQZ+lrGDyD3k/0+PtJMW9R
 51WB8jFLu3p+3YSqm7c1p8hMaJiW8M9I5c6SsMkyWw1sJ1C8AkiuFodk6EICKOlLRbKSEf
 N1PJFoUblLPUF8RiE1hD38Ue8gBh3Wk=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/display: fix typo
Date: Sun, 31 Mar 2024 21:10:13 +0200
Message-ID: <2740172.mvXUDI8C0e@natalenko.name>
In-Reply-To: <a7c8ec21-adf5-4dcc-af7d-33662f864596@infradead.org>
References: <20240119102215.201474-1-oleksandr@natalenko.name>
 <a7c8ec21-adf5-4dcc-af7d-33662f864596@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12423692.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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

--nextPart12423692.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm/display: fix typo
Date: Sun, 31 Mar 2024 21:10:13 +0200
Message-ID: <2740172.mvXUDI8C0e@natalenko.name>
In-Reply-To: <a7c8ec21-adf5-4dcc-af7d-33662f864596@infradead.org>
MIME-Version: 1.0

On sobota 20. ledna 2024 7:44:45, CEST Randy Dunlap wrote:
> 
> On 1/19/24 02:22, Oleksandr Natalenko wrote:
> > While studying the code I've bumped into a small typo within the
> > kernel-doc for two functions, apparently, due to copy-paste.
> > 
> > This commit fixes "sizo" word to be "size".
> > 
> > Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.
> 
> > ---
> >  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > index bd61e20770a5b..14a2a8473682b 100644
> > --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> > @@ -52,7 +52,7 @@
> >   * @adapter: I2C adapter for the DDC bus
> >   * @offset: register offset
> >   * @buffer: buffer for return data
> > - * @size: sizo of the buffer
> > + * @size: size of the buffer
> >   *
> >   * Reads @size bytes from the DP dual mode adaptor registers
> >   * starting at @offset.
> > @@ -116,7 +116,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_read);
> >   * @adapter: I2C adapter for the DDC bus
> >   * @offset: register offset
> >   * @buffer: buffer for write data
> > - * @size: sizo of the buffer
> > + * @size: size of the buffer
> >   *
> >   * Writes @size bytes to the DP dual mode adaptor registers
> >   * starting at @offset.
> 
> 

Gentle ping. I don't see this change in linux-next, so probably it got lost.

-- 
Oleksandr Natalenko (post-factum)
--nextPart12423692.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmYJtRUACgkQil/iNcg8
M0s4gRAA5iLebl3ys6Ahv0UbaSkAVM2x4sVViWzB8xhhyJ5uzt//1482rTXM/fuk
griAEfUtxGcoeU+WHSpBNbd6vNfQPgPJU826ZoUkWp7lpebHYSYfGofZjU9226jW
aAugwhPVnAU5yM/i3d2UnqJXs9iBRyfjFHoBxKOXYJxR+0bbSKvSemRRh0IZQrNd
EnZ6Q0LSsiin98uFZ7asf+9P1RkXMT/ZSWjg03VNUmMDxC7NVLBCx6erTb6+KN95
xGxqi7wmQizlYtO9zvVTzYyRt5HCWKzv6SpY6C4fYYFEzjZXncAa+G9DCGnhCR4u
IIfJUEnp1uW2+AEyflXH4rdv0835yLq+vxeImpo7zjIpgoqUXu0/3HnASmVI3pay
vMrQC/pWKF+5hz9L154wDsHzYUJvKPAeYIbdDak6QQEppRL6slOqy2dyeK8rsizT
po4TPtqba2d5QZ3P0p0BOdEjMKCzjRD1nFxbMRi+UkA0EIE9XI3A90WUpcgI1G+A
0UPCR04RKEgyafXnbLJ0z2Tdan0Inwa64URtkOpVhz11SeYa61JBcQz0wie4v/1k
aGaHS77AP1s/3NkX4FyrL4SIb3p+pr6DzFGI/MeRRsTGCLzSmdu9X5gdQh5AYpuh
+5bt2Kny7bvfnCjOOidCvLY4iQvgOysdxgSUTZVDn3Ztwg2FizY=
=3A4y
-----END PGP SIGNATURE-----

--nextPart12423692.O9o76ZdvQC--



