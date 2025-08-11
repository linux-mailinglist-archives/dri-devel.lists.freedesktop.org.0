Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6775CB20856
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 14:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B666810E279;
	Mon, 11 Aug 2025 12:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O841u6M1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF1510E279
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 12:07:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55b85413019so5085801e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754914018; x=1755518818; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7XkeTVeR7AUVclSQxB89lgWFvzEFYt+AP7RBVupiRSs=;
 b=O841u6M1Nt5cn5qtxVMubiGALpZSZbibxmV+tv3Y+Nr8dF9VFlzCs4n9Jn9B5AB4gU
 5/SFC17kUpptCHapxMioDgnSm1iUFRB4PfWfqazhO4jqScidhd8CIuB0ARF/Q/N+Cgez
 KKuaY4dbJhP5GlmIxPfHzqTvZlaCew1YeeuSk2GPNauJiADEwejyRz9iL8dj6222fxNe
 iPbOHIoRJxD3awT+gXTd9A/ggADySguNvh+jo+BIgwn0irH3CsSrlXAZYraP2rPvic9P
 aHPEHKcAYQ8oEZb4URlHqGjhmqnUkOXUt338c3sCAdwJknMg9BrpohNUIVLCLkSUak5f
 kZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754914018; x=1755518818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XkeTVeR7AUVclSQxB89lgWFvzEFYt+AP7RBVupiRSs=;
 b=oECwp4L0vvJ8J+EYVAtcW/ZIloScZTN0vBGhvX5+NkQKTwR3Ly26NjApm0PlYc1xDp
 Ge9zeuZsKhskcYbP14vqYphyqK84UsTgQqUBoYzowMtGLaA4CNWScCbv8CRTYx1eYNSn
 eVuhtNJ95RaXzv/Cj8bJ7y8EZjv3AMW3UfZ2MvXh8MKP1Ylvar7vQiRlInXT5sK+vZMH
 vHgsT0xtw4bdKjWG2YkYfrE/T/Pc0AAAYvH1N5k/cUyqyseTHEOhGwq6OW5VW1a+INXw
 Yiw9aqDrveA2SKos5DFm2W/Qoykgvb/93LH4QdSISQ6tIYXB5eAIt6doujg9HeGZB+Nv
 OXfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6alWxqu96SCkPbQd7kd907zDizx3Tyhe+IdtfKqqrMWTHDcrPMNhKtkJaPd8jjva4Eg5YjkQK/oA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrfL3JW4YgDD95jtieyVqzHscoT4y63JgbMvMW6heArktgSKdX
 6YWv1FbTMy6lpqDWbwuPEEfvu0iAVj+TWEXV8w8VLrFREg4lcIxY4lZU/C0ramHK
X-Gm-Gg: ASbGncvo4ybUaQchyJX7avJp9cGxBNLbeRF17Bh7Fv3tO62n66Z/V3/NW9neVvkk1KQ
 gpzbzFZ50AIWJaYxcdvLlvNv11zZuPv4dvc/rRzLW2cYtrRm+i9pFS8Et1gVfg/W0wkYFKTppIC
 N1FKjg4xc7udZuWEMZ+khrUpgMe4imYna2QxPixxINMZ71zBUObM2Z5Zuctrkwq0Bdhv0w1Ryz+
 10i41Krh6pTHq2+nTUjbgHRUR4fqyv9NuK0SPZNMux1jv0S8uDki9UXnszdCt12o4yZ2iRd17sc
 Zaz6tCWjqp9RJdvt3ovQlV3PDDof/YyQW5hctr3BscADwLlm+W786srj/SiQzMFnOOJUUrtPYeY
 /gVPd8i0jdUYER+pXqcc8a4bsRgHtWDFoLfQGoVAeGKxu5gCr/CTgZOuC2w4apcmX
X-Google-Smtp-Source: AGHT+IE/GuxIoYIqqBjeZWYH/UUn6opwNIUilcCy9C1u/SwFZxJoBETzQorqokFMCXPJ/42zsdhbAg==
X-Received: by 2002:a2e:a007:0:b0:32e:525:5141 with SMTP id
 38308e7fff4ca-333a2191a95mr20143711fa.16.1754914018203; 
 Mon, 11 Aug 2025 05:06:58 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333bab6a92bsm9580081fa.45.2025.08.11.05.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 05:06:57 -0700 (PDT)
Date: Mon, 11 Aug 2025 14:06:55 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/format-helper: introduce
 drm_fb_xrgb8888_to_gray2()
Message-ID: <aJnc36ojqSb3-Ti2@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
 <20250721-st7571-format-v2-5-159f4134098c@gmail.com>
 <87y0sh947w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NeiL4LulPAn3q9/h"
Content-Disposition: inline
In-Reply-To: <87y0sh947w.fsf@minerva.mail-host-address-is-not-set>
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


--NeiL4LulPAn3q9/h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 01:24:19PM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> > Convert XRGB8888 to 2bit grayscale.
> >
> > It uses drm_fb_xrgb8888_to_gray8() to convert the pixels to gray8 as an
> > intermediate step before converting to gray2.
> >
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
>=20
> I would like Thomas to review it too, but for me the change looks good.

A friendly ping to Thomas.

--NeiL4LulPAn3q9/h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmiZ3NoACgkQiIBOb1ld
UjJOqA/9EFOMhbu0wbyYAVNPEb2bgZnVC50sjd0XuH36BRN6gOkc8bi4LvPwhcqt
8V52Ql7zUgXLREU/YsWHPHvPyz0l4lcGkAhyAcJK1rHjbttG7QeCbZIYfVB0P4kq
f9bzMPMz6rQ77GkGlGvSTYuWn5DtqIFP908ldJPF9pzz7GKH2GsIIpUz5uxPWpsQ
FQndGwLyX/NXf3dayJs+GQATHIV1M8RSCAxpAzUkaLrB2caXWi5lE49ycMtpq2AL
IG7bloPDUuq9oiX/i2h/CaqP9m9x28iSiKpsqTJyHnP755INqiHbnFCwMyqs5PpF
Nnx/x9gpYacu1LQ8EZm49cASVQPrDpgdZ0mzbwaWzSR9LzcjTqwDyvyFpbxkuPj8
oKJsdG8Q5SetI7p/fZeth9cd5EINmG3NQTgL2mDFfxdPl1L3Y7KWhNaSo1g3oXRQ
HEfqkRoiDtkq+b8W+/VgfAuzYpwW+In/GzGbFGD7+ma5TbiO7yiimnSHPW0ZIXyr
bhmubETE8d08OjoKPBZjWsGkSzO+1np5ugqVmxZZdcBC/9oUuagz6JLResG7NuqQ
Ie/ZDBC6Np/ZW262DMDfk0cFNaM6I6IYtdIBhiss34UxbpTsYCzetUnoDk9wgi5l
2a4kfjLmwQjQDyfxO46DJ9N6a/KUCAWm7Elzv1lbvWfRp27BNAI=
=cZqy
-----END PGP SIGNATURE-----

--NeiL4LulPAn3q9/h--
