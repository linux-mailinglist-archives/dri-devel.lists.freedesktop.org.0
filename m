Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F31AD5375
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0525E10E625;
	Wed, 11 Jun 2025 11:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jisHzG8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC8A10E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:15:43 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso7727410e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 04:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749640542; x=1750245342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rs/HPsGwpc0dA/4wWlqPgOrji+1iMcQ1YoQx7yS8T7E=;
 b=jisHzG8YOo8bcezq0fQyuB3nZGli2RYZldoD+YCWxGwejD/EJJdaB0ivCetUqOYdOW
 M/6eWdcA8z7LANfcqQRevxjPWguey1lNMGqa3D/6UxiX0VkH6JWyLORdKNnBtHHPHFur
 sDzpHvGGnE890kzaCRk2MpezMZp2TilmlWdDpRxYGQJ/dFyrsVjLoQXUBfX4p/FxiKp4
 jQY/ebCfmGePpRZ4Wkmj181mF1PfoslYk5rLEIvtuVGYuYn2maMpBVwQ99CpgfTNGiDT
 1FSOb6WlWcQB15n3wnZMNMOAD8NhZTn4cb5TkdcB1Np5u/JTDftIq/MR1En0NXcwyfLe
 b9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749640542; x=1750245342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rs/HPsGwpc0dA/4wWlqPgOrji+1iMcQ1YoQx7yS8T7E=;
 b=a+nAX0pAOYPLryCWiHtjsIwsl3P2sjUBTeWfwDFti8MQn2dEsqDb3iS0tnvATHMU3F
 Jzhi0sYGRq9Pi9v9m8k408LzaGONpwEj6wrHCq8duuzkSSJtDix2lwg0dGgb6zS2p2b8
 mRNa+qgzikBf+fJDWDXghu6cLPaqlMGXIeDmzvIzOO7QDBHFkPBZtij6MiZfo7VHsAVk
 QZamcfDm8GMAG2CTRbM+Ud3Xhs8C/IP56RyuPk+C9H7F6Y1e1WtPmYqFrQpbh+1G2k02
 zqdYaHXvsFxFfEvI5aca7i9Nc7XOy1j+W52ZK5Fb2myHDwJE71NWyJu7gGxtZypfu5+I
 JKYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaiDhXU0z3ePZ5IK5YWd0WdafGmkPoJXzMCuDkPYJElZWJ/hZwUhH7Uw5hHme4rr3gKsN8Q2vglrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFzUq7OtWEL1oukUkbb4xqejV8ii6ZM0cj7o1oDWWizXu0vN9h
 sAdmmWyF5ldXo5FgeqEEVv/q4sqbRlkM6yrXksKOjX/xCnAWyoRKp6q+
X-Gm-Gg: ASbGncskp4V2Y2R9JyHOVXx2it7KqzO1HlLxgN7TIEhduWsgvEtN3ob2fs3P5Uutdx+
 7bcofCpL2WCMi5dr3yDnDGVimYcoW+608VVqv3Soo8koKve5UsQmW9cDUn/BqU5VaG3e9ytjtuT
 0bt5qgHHMDE1Vnr4XJ5tMmtoLjCCyk5fXdqeBFSGRtn0DZQs+CUdTb/ViXDCiRimEHbqusVc8cU
 fa3bSLY+MzohTediEn49om38ARgihECBAqUuzwo+sJqLmkZGFxXQG49Lp9ITo57dVLiH+uUY5wI
 7riZZRc60ifll3LrpIc4vz2u6r+BL5Z3+polaHgOOqN3/S17fILjfKXBb5sDSvhhwPYt5zJC5V1
 H3GtcdDT52BXXyZkPiwHBJmQ=
X-Google-Smtp-Source: AGHT+IErqyHxgS61ZnGwEnYEo1TU+/To0abLwZsZtdHapcw6ayI/mTmD3hIw1qdzV+w9pTDB/J1EDQ==
X-Received: by 2002:a05:6512:1196:b0:553:2eff:8d74 with SMTP id
 2adb3069b0e04-5539c18ef14mr793813e87.42.1749640541553; 
 Wed, 11 Jun 2025 04:15:41 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367731785sm1912622e87.216.2025.06.11.04.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:15:40 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:15:39 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Subject: Re: [PATCH drm-misc-fixes] drm/sitronix: st7571-i2c: Select
 VIDEOMODE_HELPERS
Message-ID: <aEllW20OnCDZhUhB@gmail.com>
References: <20250610-drm-st7571-i2c-select-videomode-helpers-v1-1-d30b50ff6e64@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HzZoh/TuFQilwAtH"
Content-Disposition: inline
In-Reply-To: <20250610-drm-st7571-i2c-select-videomode-helpers-v1-1-d30b50ff6e64@kernel.org>
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


--HzZoh/TuFQilwAtH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 10, 2025 at 12:40:38PM -0700, Nathan Chancellor wrote:
> This driver requires of_get_display_timing() from
> CONFIG_VIDEOMODE_HELPERS but does not select it. If no other driver
> selects it, there will be a failure from the linker if the driver is
> built in or modpost if it is a module.
>=20
>   ERROR: modpost: "of_get_display_timing" [drivers/gpu/drm/sitronix/st757=
1-i2c.ko] undefined!
>=20
> Select CONFIG_VIDEOMODE_HELPERS to resolve the build failure.
>=20
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD=
 controller")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/sitronix/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/=
Kconfig
> index c069d0d41775..741d1bb4b83f 100644
> --- a/drivers/gpu/drm/sitronix/Kconfig
> +++ b/drivers/gpu/drm/sitronix/Kconfig
> @@ -5,6 +5,7 @@ config DRM_ST7571_I2C
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KMS_HELPER
>  	select REGMAP_I2C
> +	select VIDEOMODE_HELPERS
>  	help
>  	  DRM driver for Sitronix ST7571 panels controlled over I2C.


Good catch, it looks like this driver is missing the dependency.

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--HzZoh/TuFQilwAtH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmhJZVUACgkQiIBOb1ld
UjLv5g//TNfcrIgOAm95L/YzLzv9QBbABNKU/BLE6UBZhW+r45/dPViDLqNhympx
6XK01B4Og1qopiqqKSR3RHMtytxS+2E2xQhz1A2XbjBd1VMcSmJ+Aim/Y/BDuaAX
k/fiZ+pCjj56Serl+TcQABC8KwjK5gj401XOIYStFUlcoUxhYBSQKckoq3wSaSZA
o5WJOGHl9+y7P8pzxcthKnoYnCTPqRhk+9nWEz66jRUu8lUrvWuEfCzeCwJjcqjF
o525Iv/k97wsqdI7HOlgrn6lcb5RWy+Kv7esO2P93GqOVcJab10PB2VbGXCSkn9X
P+c2+HwOgNR9FO2dhu6+O7axRieS6HB9CqE++AWYd0uQPPNBYVEvKE7kUHl/pZ44
rqlOmGZnZnPg4SzVn8OYTPSvyOltx9GzYe6pfnL4XS9tibvy9nX3tptiyuQssf3y
711LlIgQHFWP7voydfyhAyCktG3axa6NbUs0vTxthOYiJgYfFi+DvdmIRALmpaNC
nxlZZhIaOywBtU+Rd0TEiDQ+CiWO/TdGxLjPIVLsQgY45vy18Qxq+cmJL1ybl64d
5JqItawiSUvUE4Y/bl6YUZD8blZS4SsVPD60Ce1XSiN0JYpf9MSSLg5dM4Sqoz/y
Qoc/ckkgIN+TB+L6sM2dyhD5Mvsydl26Py0dHMpDzVj8rv45HvU=
=jzzG
-----END PGP SIGNATURE-----

--HzZoh/TuFQilwAtH--
