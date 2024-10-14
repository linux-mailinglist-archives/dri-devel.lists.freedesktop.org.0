Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85099C26F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B81510E3B4;
	Mon, 14 Oct 2024 08:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vhSmL3Ge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4645910E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:02:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so1749690f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728892960; x=1729497760;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4RlZOlgSupAxgWagLLro/53S7NCRTENxGSsZn/UbRdU=;
 b=vhSmL3GePeLMO6eZ9SsGTQLjp360qzBPJmYSv80cycGWGkA8YKp3TurzRxYutPGY1H
 1JXXWJxdW/uukjWdf9cTw1/UOhcWp5V3tloRqQQKDcpvkVWm7c7A4j3lPab2uCKELRnW
 8JAFLDM7tdH+yrcbd8eyZTq/j4Vudf/KHhqbvw/iDjfOxfKCj5gw8VyVYtXtCZ7/vZgb
 9ThzW1kwjCTIGspVLzjEUfCRdqONC6kY88l4wWZmtLihFGOsrdnIW+IVwQzWkecKYwch
 aa/pgZQhXs8lK26ZXmRNOy19fVPLvN9/VCdZTMPsnZSBDdiddBH85smgLpPMsoWwMmgT
 9wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728892960; x=1729497760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RlZOlgSupAxgWagLLro/53S7NCRTENxGSsZn/UbRdU=;
 b=EyMLyUYOawBJowRUycfQodUmzPiULujw9hUZuz40UPYeIzIt94OFeDIl0M6ybD6Rix
 8AL1+HlJSX59l+F3vXzqpYkoJcZS4Px7Hrad7mao+6y8DhgnQAXbGIsnTpZiPItxK0br
 8slsgL5ihFRXKr5yXxZJdRy9n98TnbuSQwQjjY0cf0jjWxfzNIETBP00KG2w4whDhSeP
 p0Cuo7vjH0cFUvd3jmta82RVpfclKJqKib0LCV9gHyYYnxeSSamQngK/4PgQ/TPvZxdC
 I0Yk8pzCQu05gBg+3fZ02lAtFkxTjY0Q9w39iTCNZIel4WLqxdQ0lNXj2/82uadqA/3z
 4nTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUZSdQVpM2FPGUgClO1PD1cVS1dblgOtzZ44qtOhJNrFg6bLKXwYXQZhie5NckFNiOK9qiJQ09cRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/c0y8P6FF113Fx0mUUrRrNc6POIN6/RCJFVafzMbhwM7bmPxf
 2z7yOVCs2NfDQNYIaleqyuiPJS73ond8XE3u8FKS/VS1qtG050Oa5R+Mss2apJI=
X-Google-Smtp-Source: AGHT+IGHI1oWFXV9DcSfHKsT0K9KY6FX9DQ9bVpIzkaaGAOafugiZ3ojqGus5aCjg1CPitlaHNm9Qg==
X-Received: by 2002:a5d:688b:0:b0:37d:462a:9bc6 with SMTP id
 ffacd0b85a97d-37d552fd82dmr7764949f8f.36.1728892959854; 
 Mon, 14 Oct 2024 01:02:39 -0700 (PDT)
Received: from localhost (p509151f9.dip0.t-ipconnect.de. [80.145.81.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b79fe7csm10751841f8f.70.2024.10.14.01.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:02:39 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:02:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <zlgxam2ph67gbxaf64tznc6gaediik5vzfus3kgbanu6ke4vxs@6emuicykaike>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
 <20241008030341.329241-3-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nfdjdy6igf2fhtdw"
Content-Disposition: inline
In-Reply-To: <20241008030341.329241-3-lanzano.alex@gmail.com>
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


--nfdjdy6igf2fhtdw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 2/2] drm/tiny: Add driver for Sharp Memory LCD
MIME-Version: 1.0

Hello,

On Mon, Oct 07, 2024 at 11:03:11PM -0400, Alex Lanzano wrote:
> Add support for the monochrome Sharp Memory LCDs.
>=20
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The pwm bits look ok now.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--nfdjdy6igf2fhtdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcM0BsACgkQj4D7WH0S
/k5wWQf9FfmMItjVRgRZH9tOPUX8zANyqph7Rsnz7icv4muLFmBRJDz3p4s02Ifw
vnjzp3F3ONPAom9POqZn5akcxHl+98+LD9D/fX4eKwdQVxYZsPlFi72VcoQ1Bree
tIfmZxTDoP0HWpqDB4zDyVbvRlnYgtPHteFddN4vCa81Ua0K5zOqgl1lqTyen/FX
XfhKS3GGBml9wTgjQ31Us0EXkQaELjXwURwCRobwCRiEm5j5bJ5o7juVymoKwLSc
c07MB/X1DR7G0Z2CegTx88SCcpBq/wd68vzn5bn8fbf+JoMvJ3YGp1j9pdjyJpQK
RRVObhQN7P7/nIVqvo8XhmUk3Rf2Yg==
=IozP
-----END PGP SIGNATURE-----

--nfdjdy6igf2fhtdw--
