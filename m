Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B8B147D3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 07:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0217310E1C8;
	Tue, 29 Jul 2025 05:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="naJrixqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207E510E1C3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 05:44:47 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4e80d19c7ebso3449879137.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 22:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753767886; x=1754372686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KViA9cK2jd0mcOlnHsktz8HBcxRyMOa5DH/RlB6yhTc=;
 b=naJrixqSh8g4jeP7Og1DIFpNpqAIwFWOCXkXUNKbBbp0hzRyFym01d4/93Sc/3mP+w
 X8pcrxZVUOGKUHb4mU0m+eDNw5/T1HTAjBfeuQajhU7X7tzXcgZ5EOaMMqweJPpKoR6s
 4zlqmDoZbNtQwcWlG3GCoiC0/+KcrMWpvF3iEOohaEj6d2vs45Q7jD6je5jr39XvZKxr
 Z6Mf0Hw6IjPfxIx4QaW/sXAppmnuh2iNRVVYlM8XX7hTsRiyDsC1YLgciCnTRNqOJNSN
 vRaf72c59vASp3H63afseMU5RiYkQBqrAXso7hSYQgUQSEQ1mQ0NRSOjs0z9NjB5xzBD
 YLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753767886; x=1754372686;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KViA9cK2jd0mcOlnHsktz8HBcxRyMOa5DH/RlB6yhTc=;
 b=SBF7huPp1axF3QjNWnH1S8f7FuR+m3/b9rjuYNWDR8kHwVkIF+NjYdL+XepedD72Pd
 VWxRSSN6jtlogr1HyoLM2aNa/J6e2eqAweo8d8VDREP9fCfjLurD/XPN0YktFsAVEcTt
 svnVcguTk2Sji//Qm+tC4xS5rsrTzGkpIXg5hAS2QUo20Yb/iNsO9MJfLnDefnQAbLpi
 oQBNsLYGXT9UE8busA1brciQ2ckgwiBesT1Q0y7eYOXVipbJuES0nf38P26yRuDInXSt
 L7M8Rw4UWl4ShpHdWQjLMvVGnMziNvA4wmO+BQ0No9fRVEUmo0C5AseEiGrdsbrMIAQK
 OHaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaG6fpZN4fMCKMO79Dxk9qQHV5r09ga8ld9aKb/dOY2aFmEODHXDYvQgtklpujzw/GRhm4DzSode8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNIWtVay6J+pn/gg4g2/4taFhbdOH5eUtCOg3JMgusDiKxHSQz
 aETDiK+se6UZvqtnpFqV4NvVdqeF1d+3cIfe3kBX4BhPfL1Gzk3YW4jN4O+aAkrQpwHtQ+/RpRX
 coWma9xat4uA+g0iJydPoOd1iimPRXKY=
X-Gm-Gg: ASbGncsQlbbop2/kd8TBE5lBFNeR91PeYPWqfVkyD7fUSotvFnLCHB7ZWU9zKGykiFO
 gRYk56d0PrfAYexo6uoHFASzSA5FhZjp8Q+wX/A2CGTKNr4CWWT/aUX6+P1h/vc0tJly6jmeYC9
 aDqqGy2FHZQhxjANfLlWibGWBWflhF3g5zGp03cBnEL/9vAxKa3BL+nGy1pB6WbkkgDrzZiESvt
 B6eOA==
X-Google-Smtp-Source: AGHT+IEsVgJXjoaJJQ1V37M9wx7CFXObKZWA/ky7jPfEPGlwsIppSymEDnwGfyFMHa/pUSY45t6bV5SHcp/btowCI3c=
X-Received: by 2002:a05:6102:648f:10b0:4fb:142:1ff5 with SMTP id
 ada2fe7eead31-4fb01422464mr654319137.26.1753767885910; Mon, 28 Jul 2025
 22:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 14:44:03 +0900
X-Gm-Features: Ac12FXzAP3fREaTsrBTi2grtepIb_8yjQOzO6O2L5XoQ97YnHsqpGgIB0mEB7O0
Message-ID: <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:28, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM requires more time to stabilize its PLL. The current
> timeout value, 1000, doesn't suffice. Increase the value to 3000, which
> is just about enough as observed experimentally.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9..4b49707730db76aa8fd3ab973=
b02507436750889 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -755,7 +755,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>
>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>
> -       timeout =3D 1000;
> +       timeout =3D 3000;

Relying on an implicit loop to wait for PLL stabilization is not an
ideal solution.
According to the datasheet, this can be addressed more explicitly by
using the DSIM_PLLTMR (PLL timer) register instead.

By configuring the pll timer field in DSIM_PLLTMR appropriately, we
can avoid arbitrary loops.
For example according to data sheet:
If the APB clock is 80 MHz and the desired delay is 20 =C2=B5s,
the pll timer field should be set to:
delay_time * apb_clock =3D 20 * 80 =3D 1600 (0x3E80)

Once this value is set and the MskPllStable field in the DSIM_INTMSK
register is unmasked,
the pll_stable field in the DSIM_INTSRC register will be set after the
specified delay (20 =C2=B5s in this example).
We can then check this field to determine whether the PLL has stabilized.

While the current patch relies on an implicit method, I=E2=80=99m fine with
merging it as-is for now.
However, since this patch series likely has sufficient time to
mainline, I believe this is a good opportunity to improve the related
logic.

Would you be open to trying the approach described above?

Thanks,
Inki Dae

>         do {
>                 if (timeout-- =3D=3D 0) {
>                         dev_err(dsi->dev, "PLL failed to stabilize\n");
>
> --
> 2.49.0
>
>
