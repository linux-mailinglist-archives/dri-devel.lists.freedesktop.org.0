Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C494213E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 22:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D217010E43F;
	Tue, 30 Jul 2024 20:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="T6Q8KReA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA3810E55D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 17:33:14 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so7405197e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1722360792; x=1722965592;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h00l0sE2Da7uVyg6wZl2Hj/cGiCuPnqAm74p2xGEgL0=;
 b=T6Q8KReAtjrulCGIhOiegvFKqQ/PwlVthokxJwAlwGM6DXQh8oxCdfBJQTubLnjKBk
 9okt1n6DBZ4HkkbDXas9BdEWlgOnOdf4BImWKi7bt7vHbwfYFZA9lxtY9X+g9OnNN1z5
 XIM3mj1M16r3MAvBeLOj0qr+aPc3Hgv7jc1gGFQRIelVIJ8T9xfME0WQPwQZX4tcyxVJ
 0QRU9oZ93uASIwJR3dmNLDCW54TgKd3nQLk5Y3UtXVS9XMew73IrgK9fU3SrBRp/ik1m
 nSQvF+ejwkqLNgduIAm33YpxGeI7ThNjT51EBVPAeL6FCd4WEiriYtJkLhMkwmxad2A6
 W5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722360792; x=1722965592;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h00l0sE2Da7uVyg6wZl2Hj/cGiCuPnqAm74p2xGEgL0=;
 b=o7wTSeXVHvYKXXuoGs9XooOYrUYbp4Vk4wLzmVGfXVyj2ypZFtIl++lm4Y/YlZYKQl
 WlPRtxDGwb4c0IfxFO8K2Ue4D6JR1heNyYFuFgEktyPtGRJoGmkjr7qCPKQPGPwCUta/
 Frzsdq+XfNI1BvmythGPE+pgR1T7E3haUW+8Jaovw0J0r+lOgvfbp9Zx1GdTeNP5VU9o
 oh+IHsMreM969AUZA1IPvEotoUSxbLPpzFY99M+qOyg9gaD/tkTlFHILdmiRKSWY4LuO
 S38MUkaW0wPxDz0azKI0yUIqxIl4NU0HtSC+8ca3be1o8UrIBZVc9926yCpE9gr/1W55
 9hfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaLp86D8cFkd1u1q2zNY2zvlivGSLxhMosqX3LMeIa9BH2e8q9uRWinRjeAwak1zVdwsrS4YSJ1x4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsO/Ost0dXh6nSRvBxjAH0C43DYpynrRDGgI9r6CJ3YXbEs1pg
 ga5428h1WarGSKTR7aBYZCG2OQI9Ga8nBweclbvDWY/o+D+OLi4L
X-Google-Smtp-Source: AGHT+IGeXvMvdZ8y+4r8f5puBzaKVBDHw4yE1urlgsdCM8+TKoaJYHDNWhOa8elJTV37IUpKf5ji+A==
X-Received: by 2002:ac2:51ce:0:b0:52c:de29:9ff with SMTP id
 2adb3069b0e04-5309b259c05mr9804677e87.2.1722360791652; 
 Tue, 30 Jul 2024 10:33:11 -0700 (PDT)
Received: from [192.168.208.87] (ip-109-43-178-158.web.vodafone.de.
 [109.43.178.158]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb8072sm666870866b.196.2024.07.30.10.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 10:33:10 -0700 (PDT)
Message-ID: <c7e9c6f462b02b18a2cd2320058ec6dec1fa572e.camel@googlemail.com>
Subject: Re: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by default
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 NeilArmstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Nicolas Boichat
 <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>
Date: Tue, 30 Jul 2024 19:33:09 +0200
In-Reply-To: <6a7293bd06942131161c5a7b7878c51cfbbb807e.camel@googlemail.com>
References: <6a7293bd06942131161c5a7b7878c51cfbbb807e.camel@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jul 2024 20:02:54 +0000
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

On Fri, 2024-07-05 at 11:38 +0200, Christoph Fritz wrote:
> Enable the transmission of an EoTp (end of transmission packet) by
> default. EoTp should be enabled anyway because it is a Linux
> necessity
> that can be disabled by a dsi mod_flag if needed.
>=20
> EoTp signals the end of an HS transmission, this adds overall
> robustness
> at protocol level at the expense of an increased overhead.
>=20
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
> =C2=A0drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index c4e9d96933dce..0fb02e4e7f4e5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -722,7 +722,12 @@ static void dw_mipi_dsi_dpi_config(struct
> dw_mipi_dsi *dsi,
> =C2=A0
> =C2=A0static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi
> *dsi)
> =C2=A0{
> -	dsi_write(dsi, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN |
> BTA_EN);
> +	u32 val =3D CRC_RX_EN | ECC_RX_EN | BTA_EN | EOTP_TX_EN;
> +
> +	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> +		val &=3D ~EOTP_TX_EN;
> +
> +	dsi_write(dsi, DSI_PCKHDL_CFG, val);
> =C2=A0}
> =C2=A0
> =C2=A0static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi=
,

*ping*
