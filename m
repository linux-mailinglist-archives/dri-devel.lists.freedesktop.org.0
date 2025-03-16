Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661AA63463
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 08:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B102D10E0EC;
	Sun, 16 Mar 2025 07:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bl6PgEg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F0410E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=7Bt3
 Htz0T76ixuFa8Y3obzN5yDeY9iYAd3T2eHYBIhA=; b=bl6PgEg1c98UjVJtsvcP
 /x8ofZ+DlGOMMPDVKXTiVYxcBd4ypoBrpKo+2MKkMqge7vAl/ctGxzpCnI2Divkq
 P74QxptuFfhnhEUXydXeax0/RJsAqbIyUAJjy8J/aG70yb1P+cgJ5yEQavwhm+yz
 8bGY0XYFIe2SAmz2Fc9bjfoP34ugWR6aTuYMmKv+Fp9qK9gnL1kvwlCKwl7zWKId
 CKPhBlkptuUcRUW62e6PFzsjGCM5B19oVna0BSznYBN9zKm6QaqWTn3Av9Z1OemW
 I2H67N1QsviIjCSRj6HMC0zQ01j3R9ZlSl6iI0WGRUKa5HhpBiMXiYaxZ/p7nh18
 Tw==
Received: (qmail 2607532 invoked from network); 16 Mar 2025 08:10:03 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 16 Mar 2025 08:10:03 +0100
X-UD-Smtp-Session: l3s3148p1@v/9KXHAwqrQujnuL
Date: Sun, 16 Mar 2025 08:10:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <Z9Z5S7ES8d7mjTsJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
 <Z9ZuMzPS8dmQWe8D@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WIH0dino7qmZ6RwK"
Content-Disposition: inline
In-Reply-To: <Z9ZuMzPS8dmQWe8D@shikoro>
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


--WIH0dino7qmZ6RwK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We don't have a practice yet. Keeping dev_name() was Doug's suggestion.
> But I like your idea better, so I will change to it. Thank you for it!

Just to make sure: there can only be one bridge, right? Because the
suggested name is not unique.


--WIH0dino7qmZ6RwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfWeUcACgkQFA3kzBSg
Kba9AQ//XXCR8sK2z5UihUZZQS7uQDKev1Bx6x2O5Cu/iJkLndc5nTsbehxb38E9
ZvpQM3Kk+TgPpXZE+wbVfbZ/fOS/cgQttQhiDzPngStkOPeiBo2a80ZOD6kgf7Pa
iahUxOtWzGlYewbXboOYoV9EeeihAHSARkV0spDzCcjGk7+HcDFk5zgHfh00Wbnz
m2f1d71EtDOzu0H6FRzwOYmsyz9FBk2JdVNTgqog9gY08g2gr7LqDsMS1qi5kYL8
2SF847BxiBsUieJmpceuJb7NBS7Foetiwz0dpwfWEksVqad3xlSBpn11kvl2AJFv
FgOASHDVysEh4fV+Mp3EN7aUlxP7NtfVTqlR+QGirP7xfA8W6fB7qoLSmSu0on9k
ygaDeZrJVVzPHw2foALf9Da3OTdPl+IPA59Bh5n9OvdCqWiLQOGhhzoo7g2Hvf+/
6DSX4VqdmI6yLKMI5yJRFfGi15zYzL0vq8zyRd3QM6SvjuUHRZAKwAgFPpY/neYD
l144p/VBU7EXuH0pndhIQI2Nxp6tlJDH1QQ5cs8tHHafiT+aYzYBWdvjOTPiX1pt
4gsTLUB3Ja3bpWpO+mYDaHSKga4UJ4Dg0pWuxyPaw4p/3M/6UQ9HFb9mm3VhwKCQ
pLzEUcN4ttbv1J5qdGT6W8qRvHvHz/plsD09ht3w5UIwfp0rrmw=
=NG77
-----END PGP SIGNATURE-----

--WIH0dino7qmZ6RwK--
