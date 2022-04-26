Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5C511222
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50410E3B0;
	Wed, 27 Apr 2022 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D074710E4DF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 15:39:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso827153wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cvlSVuXcRiw+6iepFL0TlfUcx282zkxl1raumY/nhds=;
 b=XqyHlWpjPB7Q+meLftRFxAA4/vut+Zg/jblwEOYeN2/9RrUClE1oRIa+itbJO86UsN
 a/n3w1u6tZNLdrTQKcX30CsQWV+uRP/bfIDP2Nzs4MMJ9O3fCY5WTKSkD5mr++zKzldA
 M7An9v2x8D0X+m5zpI4/PxRUTmUiS/whp8Zh45lPgfFzBciVnG3D1Eea1yphdR7qCecI
 OXVNjQC5tLvhjSNVWhfN9utIcUjqxlJBL7OSuxsvNDZDNhE05RZrQkTFEoLqtpsWXwmQ
 qwaHAihO0TV2QTholfA58F4rw/C0eOYG5IO/es/V3m7Bc854LxC7I1WKT4QRKeXFuj44
 3SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cvlSVuXcRiw+6iepFL0TlfUcx282zkxl1raumY/nhds=;
 b=qTsGQJkMfj/JDknKVVysCM6USSUWxmiISPpw6U79lwBFiLMPre6obpcjBtgXtbfHAm
 zo6DGh8X73oAD6vtki4kygxfLloFSTGvlYMYI+fAfT7Pk0ZibWfnuhsi+M4fNe96bKrL
 tprVrFGlXJOSR+eZEKuvmLO/TtjkxMW5DRZAf1PSldUNXocEjYKb0g0McMyQiG9H9Rjh
 X7szH8lMKQzjL6RIYSf4alxFyKTvWTUj04W5aT6cxxZ24rS51oxiHgmNnel+Xlvyb4j6
 hLuf+hVl5zo8aAU13Id+oW8DwxTmQMgVS+V9oVebtgOQg6ZG4YBV0M4SiwUIV1OYz0uE
 wTNg==
X-Gm-Message-State: AOAM531Y6/WG86sRDSpfD16QDHmOa/MNWAkOEqCtQNR1+6HX5b+vJwsV
 lp9hIWK5Ye09SqpXXefqWjgP+w==
X-Google-Smtp-Source: ABdhPJywdCr6tJ5pk7SryEdp3Tc08AQNoOkOAPLmI9COo8quqNDluSbMKyvMb7C29oOOOAKqNMrH4g==
X-Received: by 2002:a05:600c:3c86:b0:392:990b:ae29 with SMTP id
 bg6-20020a05600c3c8600b00392990bae29mr30830958wmb.105.1650987575370; 
 Tue, 26 Apr 2022 08:39:35 -0700 (PDT)
Received: from radium ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 204-20020a1c02d5000000b003928c42d02asm13873467wmc.23.2022.04.26.08.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 08:39:34 -0700 (PDT)
Date: Tue, 26 Apr 2022 17:39:31 +0200
From: Fabien Parent <fparent@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: ite-it6505: add missing Kconfig option select
Message-ID: <20220426153931.suiuc7o53dt6s2es@radium>
References: <20220426141536.274727-1-fparent@baylibre.com>
 <fd02a183-bcaa-86a8-8a13-52a9ddb374d5@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="273566twpnhexmyw"
Content-Disposition: inline
In-Reply-To: <fd02a183-bcaa-86a8-8a13-52a9ddb374d5@baylibre.com>
X-Mailman-Approved-At: Wed, 27 Apr 2022 07:12:23 +0000
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--273566twpnhexmyw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 05:29:31PM +0200, Neil Armstrong wrote:
> On 26/04/2022 16:15, Fabien Parent wrote:
> > The IT6505 is using functions provided by the DRM_DP_HELPER driver.
> > In order to avoid having the bridge enabled but the helper disabled,
> > let's add a select in order to be sure that the DP helper functions are
> > always available.
> >=20
> > Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >   drivers/gpu/drm/bridge/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index 007e5a282f67..2145b08f9534 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -78,6 +78,7 @@ config DRM_ITE_IT6505
> >           tristate "ITE IT6505 DisplayPort bridge"
> >           depends on OF
> >           select DRM_KMS_HELPER
> > +        select DRM_DP_HELPER
> >           select EXTCON
> >           help
> >             ITE IT6505 DisplayPort bridge chip driver.
>=20
> http://lore.kernel.org/r/20220403151637.15546-1-rdunlap@infradead.org als=
o select DRM_DP_AUX_BUS,
> can you check if this is really neaded ?

Oops, I didn't notice that patch.

Anyway I can successfully link with the following config:
CONFIG_DRM_ITE_IT6505=3Dy
CONFIG_DRM_DP_AUX_BUS=3Dm
CONFIG_DRM_DP_HELPER=3Dy

But I cannot with the following config:
CONFIG_DRM_ITE_IT6505=3Dy
CONFIG_DRM_DP_AUX_BUS=3Dm
CONFIG_DRM_DP_HELPER=3Dm

This suggest that DRM_DP_AUX_BUS is not required for that driver.

Fabien

>=20
> Neil

--273566twpnhexmyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQyJHfU3UNW7IG61XVJKc6g3CeAAFAmJoEjIACgkQVJKc6g3C
eABeHw/7Bt/VLgszCCzYH9pHOhqbs7jTipFBxg57jmdYMy+fhgNCwW6meNpvuZ5k
IvAQNMY4CvdwV44bk8KWjGOKgQwu4Y5Ck30Qmy+IARf2h2VaIfmu17/viczdOmkr
gbIRC99eX30uHQWRAXqyn4taRD2OR54eo7PgoqKx8AKD5rRWqlDUPUEDGXO8QE+Q
RYl/DVfv1/SyZHkxuMrsYcJrWfalX7ZuSn5kVu3iOllaDL77XtbXglrc5+Udhc4b
Q5JrgWsSfzQrdx7CYg+Jsg0YLfweE81QHqzztAYGzFg/v8BueApy8k4NKjqF2qTw
nlUmoLTHQCyicwOrDwd+auZcurokQNAaLbiCA8hDkzd9bUNDjz/1wyG0xatxCB5W
2rL1zyHIX1S+rugza5FwDQGCUHMDaF9gkNZ2gqVM9SOsnyK5J/kYHtSGoqtb8Afw
CqHLJ7qd8GinTpUIV0IpjL032Dw9rBA+CblzE4mOJx/DCuMBw9HremiI7oNJxkls
P4nFXS8CEo9mrKkYtG454ADgCYAmtJOBfIspG5LpaY2Z48sy1E0jM7W6HYa8sdBt
7aq1Ly0oNT3Il3k1qZrMsQDpSzKFI3cxeFH8eaaJiZ/YYklyFCa/cuk7QGw1HoBY
kgmyzgcEXck4nrxLD1ic3bcqWOg4acME1mp9UvuUB0Ify+1WOvA=
=FNMT
-----END PGP SIGNATURE-----

--273566twpnhexmyw--
