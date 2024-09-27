Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66D987F9A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 09:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFB910EC34;
	Fri, 27 Sep 2024 07:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bQmr+z7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3210EC34
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:42:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A783A452B1;
 Fri, 27 Sep 2024 07:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0100C4CEC4;
 Fri, 27 Sep 2024 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727422931;
 bh=4cSEU+BlVShce+rMJkVIHeDVoDj4iOY0cw4EX60EB5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQmr+z7zQfw2VbGaGMOxNMR0OiXqugTiaoK5lxrgVyQu4V6+aKmbZmq+RWmBTBPEg
 tVWrvVFkqJNhcT6wUbjufeJQmxjCam1Sij/SX8RduKx8/ihui92hUyyW06m7IoT4nP
 qute0SrSDhEa6Zbpy8iYhRTxsvA1TOiCc2KZQgsddQnu+9bCRVzv25/LPAjD3hWFEv
 /zvyeNR/WNH0CV9ivvs4HtjCsES9zM7oo+urhBOBgEILG35StRr6WGCN/04BhxOyWx
 it0+zak0kpoN/ZyE1oQcKQ7wC9lz8ikt+s0Znpo8+F7b/odz8elhdV1ZI6+67ADBjg
 JY0um6KCRCi5Q==
Date: Fri, 27 Sep 2024 09:42:08 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina <jikos@kernel.org>, 
 "bentiss@kernel.org" <bentiss@kernel.org>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars in
 x86 Macs
Message-ID: <rq3gcr7y2eygp7gifzivxvrj3tzd7ouexz36aeluxjoufs6k6c@kulq7plg52vi>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <3C9E8938-32EC-44AC-A783-3BFDE2F01290@live.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="brmuv7eam2ubwxdk"
Content-Disposition: inline
In-Reply-To: <3C9E8938-32EC-44AC-A783-3BFDE2F01290@live.com>
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


--brmuv7eam2ubwxdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 11:52:22AM GMT, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
>=20
> The Touch Bars found on x86 Macs support two USB configurations: one
> where the device presents itself as a HID keyboard and can display
> predefined sets of keys, and one where the operating system has full
> control over what is displayed. This commit adds support for the display
> functionality of the second configuration.
>=20
> Note that this driver has only been tested on T2 Macs, and only includes
> the USB device ID for these devices. Testing on T1 Macs would be
> appreciated.
>=20
> Credit goes to @imbushuo on GitHub for reverse engineering most of the
> protocol.
>=20
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  MAINTAINERS                       |   6 +
>  drivers/gpu/drm/tiny/Kconfig      |  12 +
>  drivers/gpu/drm/tiny/Makefile     |   1 +
>  drivers/gpu/drm/tiny/appletbdrm.c | 624 ++++++++++++++++++++++++++++++
>  4 files changed, 643 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8766f3e5e..2665e6c57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6889,6 +6889,12 @@ S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/sun4i/sun8i*
> =20
> +DRM DRIVER FOR APPLE TOUCH BARS
> +M:	Kerem Karabay <kekrby@gmail.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	drivers/gpu/drm/tiny/appletbdrm.c

How do you plan on maintaining it? If you want to do so through drm-misc
(and you should), you need to list the gitlab repo here.

Also, I haven't seen Kerem take part of the discussion at all. Are they
ok with taking on the maintainer's role?

It's really clear to me either why this needs to be going through hid at
all. Is it not standalone?

Maxime

--brmuv7eam2ubwxdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvZhywAKCRAnX84Zoj2+
drZEAYDXfSQwdEQELLZAn1fDt8kp1AMKxh7uc4HvWdsgncx92uVquXnyrV8Ajx9r
GVDiuS4BgIheSxUqmByNX7Zrziwg7oHJQyWpydRiSVvchCzYRsdOpJURa8xY3mJy
s+Yr7sQ4mA==
=TV0a
-----END PGP SIGNATURE-----

--brmuv7eam2ubwxdk--
