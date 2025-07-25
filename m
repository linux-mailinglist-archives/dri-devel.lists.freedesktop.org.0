Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C5B11CD7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D913310E1B2;
	Fri, 25 Jul 2025 10:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aEUlp4jg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FF510E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 10:51:22 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-5314b486207so650120e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753440681; x=1754045481;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
 b=aEUlp4jgmBgw4B6rESOBhu5IKGMcZqJoJZwyhP3pZcPuaGLnimS5xq8loVKLhFJXh9
 wUp+e615T42wb8iTVfmFy/D+he1Oi8TyWQJxHVC6fAqO6HQWswmslkcua+gQoLHzYplL
 WLLdCdZQoAVKfledlfP0kmsfsVjQnLu93dOUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753440681; x=1754045481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj71s94DBO5ChtWnhYstkEV7QIcBC/2WSymKueRnDS4=;
 b=B9x2D3Yi9ELUFkMLQwso40l2d0kDHsFtgX7xF5KXPwtHFnXT07F9+Mlf55Bz1eS2NO
 w3A7tYZUXJDI86EArMzG7Jrlm8vwC6/h7zKmRwxMgAAB4+F/9YUdWDLxFpTGAPWb8n2K
 7n59OFya3ihHgsdR516nMUcv1HuCuCqauBuuKTfrVdiAwoRRrjX4QZbu0X39izfZaMxQ
 AINTFthZWbcPyf6Kn8Iy/PxqGzcAMLEmjLjh3gCyaHu/s1f+gNo5YMOtPIo5PYd/M6el
 T9PcFDrJmwCU0VuVnA5OJf0VS2Ny1nIC5sSYDBfGVqsnS9r3EC2aSB+suci1Zb1riOXe
 R24w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6GIDpEGzuxPHGcji/tnQpm7IfdVFFzWRW26pzv8TLKxBv8PpQI2O6loiJkmVYQQz7UIU2dog9Rz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmtvF8nqd9h8AKyNYeNrAtC2fqb21x9DHmPjHpnxFOOuv/zaiy
 KACIRt6u+GB7YWdX9bid0FkgsfKS2fer/H8kv+gsRt4qYR6nPC7VjhoTGNPq9BE8Zequzl9J8GH
 gEEKXYQ==
X-Gm-Gg: ASbGnctNppLm+AN8ArY35czz/Y7NThaae51qYvl0Nkqarharu3QoTDJiil/bUbIzbeh
 9tDZZuuKe6weDZVxzRBPZZVEwrIahYaDOZzxAtBiXjQRzIuJalsBcVKLFZXe8aA0niUVBw1WqRe
 /Juy1DWGn2NfzeoXFoGOOrFWfj0lIDM4iJmRi+pONhzSJIbFgMqAiuKGWDHawcf3FsSJq1ma06W
 AHTD/MuYnV1HAcDNYCXlZukQtAGOk8Y48VNfTC7nj7DX2xbsDB9jZy8dnEzSuB1oQdbieEzP1K9
 m9yLp/mcAs0YhrnSzIvI45jvOa0H9ipw6tzzHg6inYCLFcknoiyZYcg4Nfe9v3Q86Xj5a3w+w0w
 k4aR0u2dBaJ+4tvYVS4tRN7C46aSiNVcpDY5r4J0UhKZoT1ZGY1jAp30cHgHbRw==
X-Google-Smtp-Source: AGHT+IEiJlDw7437Mhvt4eUP0f4kBxbmB4v0Y1SQgb8oN2XUf3ONqRoSbCdZtTVQvTI2rcuLES2kzA==
X-Received: by 2002:a05:6122:1e16:b0:531:188b:c19e with SMTP id
 71dfb90a1353d-538db4a45a5mr351938e0c.2.1753440680833; 
 Fri, 25 Jul 2025 03:51:20 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-537bf605d88sm896537e0c.5.2025.07.25.03.51.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 03:51:20 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5314b486207so650094e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 03:51:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoYO76TZNRN0mssaMb8Uexd/cc80TTB0jTckPSwAcZsBUlnIple0VAPkMQPAIy8Wp+KUs1xBVWrc0=@lists.freedesktop.org
X-Received: by 2002:a05:6102:358d:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-4fa3f8f1683mr313640137.0.1753440679035; Fri, 25 Jul 2025
 03:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Jul 2025 18:50:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
X-Gm-Features: Ac12FXxJVbrVgIPSlm6u4--DKBHxaHRjM_36IT45XEIgpl9bR5PM8dE-s5Wt-28
Message-ID: <CAC=S1nhS8yY6iWNDfv4Lwz8zUJEy0nMxC5MVZGb983hDsg7bhA@mail.gmail.com>
Subject: Re: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, 
 linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, 
 herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, 
 andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, 
 chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, 
 p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, 
 tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, 
 broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, 
 matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, 
 linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, 
 sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, 
 andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, 
 tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, 
 linux-media@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 24, 2025 at 5:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The binding wants the node to be named "i2c-number", alternatively
> "i2c@address", but those are named "i2c-gpio-number" instead.
>
> Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
> dtbs_check warnings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

It'd be nice to mention in v2 (if needed) that this patch also drops
redundant #address-cells and #size-cells, but it's minor.

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/a=
rch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..6d2762866a1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -64,23 +64,19 @@ wps-key {
>         };
>
>         /* i2c of the left SFP cage (wan) */
> -       i2c_sfp1: i2c-gpio-0 {
> +       i2c_sfp1: i2c-0 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         /* i2c of the right SFP cage (lan) */
> -       i2c_sfp2: i2c-gpio-1 {
> +       i2c_sfp2: i2c-1 {
>                 compatible =3D "i2c-gpio";
>                 sda-gpios =3D <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 scl-gpios =3D <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAI=
N)>;
>                 i2c-gpio,delay-us =3D <2>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
>         };
>
>         leds {
> --
> 2.50.1
>
>
