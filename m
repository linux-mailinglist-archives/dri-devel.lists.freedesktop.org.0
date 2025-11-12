Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C01C53191
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1276810E75B;
	Wed, 12 Nov 2025 15:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X+FJMhqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2056E10E75B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 15:39:52 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59578e38613so888168e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762961990; x=1763566790; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AQMGHeuVetKMPR9AyI2Wocgl9opG9fOrKP3UuI7HdsU=;
 b=X+FJMhqmPuVd+UmJcBVhgGERfkUKFqvbnpBC/cBgD3ahP284NwbjAfjkd/bZAwI299
 Kb09/eQTCwffC/48V7zQa382cy6GfW24084LUAaT8Oo1nRmWPji9NXLer4UCzuTeiV/H
 MwHCwUgiRXzc9aMA5JNPOr4wNt29YokUYfdyTV4McpJ0TSOD6sHOgtNb2n9yN9/wQCZN
 UfUap6PqgSRAZYagysLpYcJmz5jSaqlJtP4X1xG/71cKpoa6ETdqJZsINUO1KtTFjjSz
 Np9EqqbEs4OoV6r7cO0FHEjtUObV36RtlKSesmnQHkeBogXowc8JVe6qPQxq4bB0nGeF
 vO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762961990; x=1763566790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQMGHeuVetKMPR9AyI2Wocgl9opG9fOrKP3UuI7HdsU=;
 b=BMAlx0gvGHBsjnMYz54LkedleF5apoBJPs7vzeQ/lcQFeGdgtspVLk7cGvhXCe3SVm
 UdoVoL76g/CdsywWpXWU9WCrCJqUlK/UpJ671dda6ohuM5AYYcmUGs9HG8Cze5oOihoc
 7P5Nk82wo93jRQivOl8EDJb80OLv+hqst/7UQdOmVUNyLfu4k18bFbS5pGbFFF6eKYVJ
 +L2uMHrZwhuMS+dlTAyQm7NpoiS5LJIy2GEfUNSLn3kQ1n1KbvHD+UEu/rbWOn4voTsS
 MYGyd1rCXaeyra59LMG/iVujCASLfKG30xz6XCuJx54uUtO7WchhwHgi8/de+zamLA57
 kB0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWV9AbtxwtEmJ4lGGiLlWZh3k5pMMUpyjcijNSW2cBWRFQAoYfx/ma6z5fBvE39c5ViORAeKtAWXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFPGOmwyDEJkKHmLm7qCX8w8lbfbI692cQ7PnubZhapEoW/v1u
 cZ+f+n3EayvVR/UtS4LEUSuCqx14/n/lKA+gzsJgMIuta60grP1lYUnW
X-Gm-Gg: ASbGncv+gN3ehBmg6JSTzzI8dBe1H71pMPOd3GL5cPr8moBXRX2n/b5gFg9JmB/ibio
 Whb+4iJMqSiJ2OSH4CmDvXJh0Q6ydhOJ0tSxpHfeExLgspbsXdFc5W4qT90bH/3QVynK3viVqDF
 xl7E2yZ8bQGFeUgZPLk93w2X/vj7nIek6VjzglXeWrT/kLFuNlYou5qZjHS0SHMOC6UNNRi2MIQ
 gmNVva/Y6p4PZ/G7+HO08MnzqGDQ+uStpeQvG+jDH3lXZY4lJzf75cjGqc9AtJeTeDWsVyAZmWN
 tyCZK8/Wo3l1kFR31y73rU9kqK241rmIyUO5o0P4LZtGWHzGEfDfCOh3W6fLKyCPBVG6Dqhmw/v
 be8SODMyoKyvNGjugdycPf+npyw7Tlh1j1ADbWBmgwdyRdYPJz5EPmfsN1gtPTbayBa+SEpBZdv
 RRL34N4/7yAMduhvkTM4NTVrXcjQ/vXTp8IN7E
X-Google-Smtp-Source: AGHT+IG6fxfn9Ejevg+kHxxkHAI8+e+Pp8yzrvtVeAeXPBB99bQNtGL7z+dS6UndPXzRJTWN+ZedwA==
X-Received: by 2002:a05:6512:2390:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-59576df324dmr1311109e87.10.1762961989929; 
 Wed, 12 Nov 2025 07:39:49 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a5a0b7esm5951757e87.109.2025.11.12.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 07:39:49 -0800 (PST)
Date: Wed, 12 Nov 2025 16:39:47 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Lars Rask <Lars.Rask@axis.com>
Cc: "david@lechnology.com" <david@lechnology.com>,
 "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
 "agx@sigxcpu.org" <agx@sigxcpu.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kernel <Kernel@axis.com>, Amir Dawd Seid <Amir.Seid@axis.com>,
 Johan Adolfsson <Johan.Adolfsson@axis.com>,
 Daniel Larsson Persson <Daniel.Larsson.Persson@axis.com>
Subject: Re: [RFC] What to base new driver for Raystar RDX0063 display panel
 using Sitronix ST75156 chip on?
Message-ID: <aRSqQ8AFWhUFlOyT@gmail.com>
References: <AS2PR02MB89157A26C4CFF62811208A739FCCA@AS2PR02MB8915.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ijoNkkVX71GLNuQ2"
Content-Disposition: inline
In-Reply-To: <AS2PR02MB89157A26C4CFF62811208A739FCCA@AS2PR02MB8915.eurprd02.prod.outlook.com>
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


--ijoNkkVX71GLNuQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lars,

On Wed, Nov 12, 2025 at 03:08:08PM +0000, Lars Rask wrote:
> Hi,
> I'm trying to create a driver for a small lcd display called Raystar RDX0=
063 that is using the
> Sitronix ST75156 chip. The display is used in SPI 4 wire mode similar to =
many other tiny MIPI
> DBI displays, but the register set and framebuffer format is not MIPI DBI=
 compliant, since each
> byte sent is actually 1 column of 8 rows.
>=20
> The datasheets for the Raystar RDX0063 display and the Sitronix ST75156 c=
hip are unfortunately
> not publicly available, but you can find the datasheet for Sitronix ST756=
7 (which is similar to=20
> ST75156) here: https://www.topwaydisplay.com/sites/default/files/2020-05/=
ST7567.pdf

Support for ST7567 is mainlined (st7571 driver), and once this [1] series
is applied, it should also support the SPI interface.

Hard to tell without seeing the datasheet for ST75156, but if it's
similar to ST7567, you might be able to just add an entry in the st7571
driver for it.

>=20
> The main difference seems to be that ST75156 supports a higher resolution=
 than ST7567,
> as can be seen here:=20
> https://www.sitronix.com.tw/en/products/industrial-display-driver-ic/mono=
-stn-lcd-driver-ic

This is how st7567 is defined:

const struct st7571_panel_data st7567_config =3D {
	.init =3D st7567_lcd_init,
	.parse_dt =3D st7567_parse_dt,
	.constraints =3D {
		.min_nlines =3D 1,
		.max_nlines =3D 64,
		.min_ncols =3D 128,
		.max_ncols =3D 128,
		.support_grayscale =3D false,
	},
};

I think a similar structure for ST75156 with is enough.

>=20
> As a first attempt to create the driver, the panel-mipi-dbi driver was ex=
tended with "tweaks"
> to support non MIPI DBI panels. This seems to work. However, after some d=
iscussion with the
> maintainer that is no longer active (https://github.com/notro/panel-mipi-=
dbi/discussions/14)
> the conclusion was that these "tweaks" were not upstreamable, and that I =
need to create a new
> driver specifically for the Raystar RDX0063 display panel using the Sitro=
nix st75156 chip
> instead.
>=20
> In order to make my driver upstreamable, which driver should I be "inspir=
ed" by (i.e copy and modify)
> and base my work on? The drivers in drivers/gpu/drm/sitronix/ and drivers=
/gpu/drm/tiny/ usually uses
> struct mipi_dbi_dev and mipi_db_command() helpers, but drivers/gpu/drm/pa=
nel/panel-sitronix-st7789v.c
> does not.
>=20
> Should I create my new driver as /gpu/drm/sitronix/st75156.c and use mipi=
_dbi helpers where applicable?
> If it is preferable to avoid using the mipi dbi helpers, is there another=
 set of helper functions that
> I should use instead?
>=20
> Best regards
> /Lars Rask

[1] https://lists.freedesktop.org/archives/dri-devel/2025-October/532431.ht=
ml

Best regards,
Marcus Folkesson

--ijoNkkVX71GLNuQ2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmkUqj4ACgkQiIBOb1ld
UjIwBRAAyVBRr+dj9P84ET1/ILprKUFBu+JfI+tKodLXmLdii2HbxF0cmHeA1RAt
RRZKnPiJ57IWFI7dolRE4shsRvW026F9aRRIcKRP+cB+p+szTZryhbm6Hc61Uj1J
nPYsAOSh6ynFsAFGJypFd1irqhTMIfhTrACZ7DXrd8jwKHJR1diyv4LT7QdLm0R5
Hx73yvI5x19IkEEoIc+TR1BqSVSxgo860YdClgfsWubLLRV9GBV+FKz6BCD4fwXk
mxgUtwcAh0iwKz7GVNs8wFiHVbYsaLtwmFElVlfKAhpN2O3mI3ubrwR14yUw9gGk
7BbCQKoOh/cFBhE+5e19BBuXILZ9nJm4q/YqZgC3l8YeC2j0pwJprCV6PvhtHJly
D6pjfcnyMnNXu3oZEolxNOcRwwc/XQp0ANDPQ2+G4dTwslKrpxN7n857/anRMKg1
GdsHaTnMzwVARh2rBDfPbaPHYrY4a/GwHIBPYnVldehAVkIclcS/XCD824lAhhh/
rx2Sxsv+zYN3qgZ1/ztZagkyyGe2jUECiEWdrxzptUeviPOtG5FNPaOTSFi0xpZS
MJVFSD80ZCkUyT9vDgvp4ovxwmd8yKFTuyiow5RDzY2jqivNajHlKfmcJt6GPHQh
Hgs2L5Pi+pj4fWuNk/4EMPFiRcUhVjH9aEH0ML7ZeRFTw6FtTyQ=
=ZOZV
-----END PGP SIGNATURE-----

--ijoNkkVX71GLNuQ2--
