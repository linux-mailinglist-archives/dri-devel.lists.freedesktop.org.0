Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201C808410
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA5210E825;
	Thu,  7 Dec 2023 09:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC33510E825
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1701940600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=A6B6SQdEGihvdACw2JOjX599xCdZMbfkt+OCZNCmzZo=;
 b=kv1CVK1BaxewKQIljM85WnQLkFx4xQ60+Y66II8iBPwAzvx++TIayGYDf+o1dDvQR/d/OL
 zTDQDF5pi9lk9jsQgwu6EmqDfDXEzKSEFRsTJsY/Cr9zPWXwHx+JPF+BP92rLgshT5lPmY
 bq9oZl1CcFo+nEuDNw6fjQ7x8ZPSvgw=
Message-ID: <61393c2e941515612f7c4a7d66cd19f00e88ea9d.camel@crapouillou.net>
Subject: Re: [PATCH RESEND] drm/exynos: dpi: Change connector type to DPI
From: Paul Cercueil <paul@crapouillou.net>
To: =?UTF-8?Q?=EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen?= Platform
 =?UTF-8?Q?Lab=28SR=29/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90?=
 <inki.dae@samsung.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Kyungmin
 Park' <kyungmin.park@samsung.com>, 'Krzysztof Kozlowski'
 <krzysztof.kozlowski@linaro.org>,  'Alim Akhtar' <alim.akhtar@samsung.com>
Date: Thu, 07 Dec 2023 10:16:38 +0100
In-Reply-To: <048a01da28b6$f84c2670$e8e47350$@samsung.com>
References: <CGME20231206221903epcas1p2e9d90110b0f2901e3e7db86f748026f1@epcas1p2.samsung.com>
 <20231206221841.15685-1-paul@crapouillou.net>
 <048a01da28b6$f84c2670$e8e47350$@samsung.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeudi 07 d=C3=A9cembre 2023 =C3=A0 11:42 +0900, =EB=8C=80=EC=9D=B8=EA=B8=
=B0/Tizen Platform
Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90 a =C3=A9crit=C2=A0:
> Hi Paul,
>=20
> > -----Original Message-----
> > From: Paul Cercueil <paul@crapouillou.net>
> > Sent: Thursday, December 7, 2023 7:19 AM
> > To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> > <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>;
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Alim Akhtar
> > <alim.akhtar@samsung.com>
> > Cc: David Airlie <airlied@gmail.com>; Daniel Vetter
> > <daniel@ffwll.ch>;
> > dri-devel@lists.freedesktop.org;
> > linux-arm-kernel@lists.infradead.org;
> > linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Paul
> > Cercueil <paul@crapouillou.net>
> > Subject: [PATCH RESEND] drm/exynos: dpi: Change connector type to
> > DPI
> >=20
> > When exynos_drm_dpi.c was written, DRM_MODE_CONNECTOR_DPI did not
> > exist
> > yet and I guess that's the reason why DRM_MODE_CONNECTOR_VGA was
> > used as
> > the connector type.
> >=20
> > However, now it makes more sense to use DRM_MODE_CONNECTOR_DPI as
> > the
> > connector type.
>=20
> Sorry for late. Merged.

No problem. Thank you!

Cheers,
-Paul

>=20
> Thanks,
> Inki Dae
>=20
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> > =C2=A0drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> > b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> > index 378e5381978f..0dc36df6ada3 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> > @@ -101,7 +101,7 @@ static int exynos_dpi_create_connector(struct
> > drm_encoder *encoder)
> >=20
> > =C2=A0	ret =3D drm_connector_init(encoder->dev, connector,
> > =C2=A0				 &exynos_dpi_connector_funcs,
> > -				 DRM_MODE_CONNECTOR_VGA);
> > +				 DRM_MODE_CONNECTOR_DPI);
> > =C2=A0	if (ret) {
> > =C2=A0		DRM_DEV_ERROR(ctx->dev,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to initialize connector=
 with
> > drm\n");
> > --
> > 2.42.0
> >=20
>=20
>=20

