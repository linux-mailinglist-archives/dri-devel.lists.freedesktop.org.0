Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916365ABAD
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 22:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E2710E173;
	Sun,  1 Jan 2023 21:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82F310E173
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 21:21:23 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CDCFD1C09F4; Sun,  1 Jan 2023 22:21:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1672608080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aq0v+DYHcUKp6Xj+Ok8b/poNMw5kQJV4suii1vowS2Y=;
 b=hp4FrWfGD9sf/WF/sIKeSJh2cWjkqGkhJgEbwyHMiXN7Xf4KewzwFCmD59UY7hXAraoIOq
 Exgfp8xbd9cPZL8Oy5UZ4IBa+EWGo967xtUlVWDyBC8oAATD5qC0UYN9yAdsWtHijeluIm
 6rGR62jAzP9MiMHQHk22l8L9lRoAu9g=
Date: Sun, 1 Jan 2023 22:21:20 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 0/4] Add PinePhone Pro display support
Message-ID: <Y7H5UJOz/zYuZn7j@duo.ucw.cz>
References: <20221230113155.3430142-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="RTMPi14+3aUpRgHm"
Content-Disposition: inline
In-Reply-To: <20221230113155.3430142-1-javierm@redhat.com>
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
Cc: Neal Gompa <ngompa13@gmail.com>, dri-devel@lists.freedesktop.org,
 Martijn Braam <martijn@brixit.nl>, Caleb Connolly <kc@postmarketos.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, linux-rockchip@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>, Peter Robinson <pbrobinson@gmail.com>,
 devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>, linux-kernel@vger.kernel.org,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--RTMPi14+3aUpRgHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series add support for the display present in the PinePhone Pro.
>=20
> Patch #1 adds a driver for panels using the Himax HX8394 panel controller,
> such as the HSD060BHW4 720x1440 TFT LCD panel present in the PinePhone Pr=
o.
>=20
> Patch #2 adds a devicetree binding schema for this driver and patch #3 ad=
ds
> an entry for the driver in the MAINTAINERS file.
>=20
> Finally patch #4 adds the needed devicetree nodes in the PinePhone Pro DT=
S,
> to enable both the display and the touchscreen. This makes the upstream D=
TS
> much more usable and will allow for example to enable support for the pho=
ne
> in the Fedora distribution.

Thanks for the series. Please cc: phone-devel@vger.kernel.org with
future patches.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--RTMPi14+3aUpRgHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY7H5UAAKCRAw5/Bqldv6
8umEAKCiiwwQLTUUm7OHMP64I5tMJAdxgACfQsIjJN7Qg6MhlcLpmicQs5rvGSs=
=0ZNJ
-----END PGP SIGNATURE-----

--RTMPi14+3aUpRgHm--
