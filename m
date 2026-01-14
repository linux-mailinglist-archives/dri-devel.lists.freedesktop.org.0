Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAEED1FA7F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F42F10E2AC;
	Wed, 14 Jan 2026 15:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94F410E2C8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:15:04 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-5636274b338so841976e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768403704; x=1769008504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIOeuRlphqUpkbTygl+t2fPPcrL2rPHxBDUM21Fb5rs=;
 b=icI+G8q815D9HshRPmmG5BA0cXHlUw6W3XP6TRe2bya05Cu0KNyLDuFDpxkiiomHSp
 Y0uH3Cr9RXEVSch4ktMiIuIX8mcBiF1WNVtY5idACuJpggY+704zGx+AvnluSbsLLex2
 VIyrn+wrsORkKzW1uFUNlHsVa2/PqvZ7AgJ5C2qZorXFpJH1OA4hH1A1wU+byVgVVLvE
 mUVsYoiBl5ylRM9sEq8Agrk2lucVQs1sxkLWpWkKz4PrRVlTNErjXkMaLE//Nrfh0Whq
 JMMpaQC880nDkS69G8nspam2ftfVG6q4jO69/1xgI+7usl/EK8n1w/PERKixjSjZT2Fa
 deZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Epx1BfKnwE6Mz38OySxg9Ua6z655qGy0FD7kkiiWERO+bLcnF1Dq0VBipaIYKi6sdCR6qRuk914=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjnUNAqVbLSpmza05ReDoBqmKYmMHXHPfhd1vymwhggNVsmoRT
 wzlDLjVge3mM2v4FQUFTt1t+viQ5sBuu82L+EMIheubtVoN71wVwbdtwDTC6uD0J
X-Gm-Gg: AY/fxX7ICLEjBUVcdZ0wc34+DHVKXwrrsLWxB4KFQ0sDdUy3FSj0jZixMr638e6d1ds
 UXTFf+oZI6tuYrF5+oTZPTYi2/sc4rmnV7xIEwqDxBsXwG/hmnT4W9ONwlntf+OI87z0yKtEbyC
 FTX6DZtRz9pSr2W81CZN01is2tZml0sSWHJkTri+RaBQ4QWCpJF9kenvmB1brhyRKczXshxQc+J
 0dTv4rrI8A3CJQjnSWzQ4Yhq4D0V33j7xhjV0+2Y67uRJ/CjHiwRzeBPanqP6CwO9wq8VkozenT
 xKWzV1xnWBKyJ7CvF37tmwWgbwqgSqWvIhPDWjlL3zFz++SqhCWu1tXlJBQi0LFYItvN+J2qHKN
 ecD6hlohau/X2jY5jH2lEfcj6WWU2crantUrmkW0V1N64fkG1nIJ4kYznpJzvYEGYatTp0V9SsP
 feyuiv6JLWrxr3sHQmkFotQB6iniX6PZNfdqHErSeL6U70NQakZ8ny
X-Received: by 2002:a05:6122:650b:b0:563:74af:9cb1 with SMTP id
 71dfb90a1353d-563959a1112mr1966649e0c.2.1768403703781; 
 Wed, 14 Jan 2026 07:15:03 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5636106e953sm17427005e0c.8.2026.01.14.07.15.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:15:02 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-56367b39e3eso682706e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:15:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVyOlwD5cUr/Km5m8C5I0LMTGHNb7Vu2tHAupm6ikCx1a4bT0C1fO/YgDkxwEJzM/pzjHxzyCWN6yE=@lists.freedesktop.org
X-Received: by 2002:a05:6122:4896:b0:563:466c:2 with SMTP id
 71dfb90a1353d-56395c42437mr2778733e0c.5.1768403701354; Wed, 14 Jan 2026
 07:15:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fd7df433130d6955983bd7187f350946e947d1c1.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <fd7df433130d6955983bd7187f350946e947d1c1.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:14:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPGwrudTcYrkpCM2y8cuL3-4eDaeensKUDDZNhKGcEwQ@mail.gmail.com>
X-Gm-Features: AZwV_Qg6hyecIyDwZwQOALkySZLKoQ1lcKWx34cwqlLRfGv4_0uRnV7x2Fxw08k
Message-ID: <CAMuHMdXPGwrudTcYrkpCM2y8cuL3-4eDaeensKUDDZNhKGcEwQ@mail.gmail.com>
Subject: Re: [PATCH 19/22] arm64: dts: renesas: r9a09g047: Add fcpvd1 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add fcpvd1 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

Please merge this with "[PATCH 17/22] arm64: dts: renesas: r9a09g047:
Add fcpvd0 node", i.e. add all FCPV instances in one shot.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1207,6 +1207,18 @@ vspd0: vsp@16480000 {
>                         power-domains = <&cpg>;
>                         renesas,fcp = <&fcpvd0>;
>                 };
> +
> +               fcpvd1: fcp@164a0000 {

Please move this just below fcp@16470000, to preserve sort order
(by unit address, grouped per device type).

> +                       compatible = "renesas,r9a09g047-fcpvd",
> +                                    "renesas,fcpv";
> +                       reg = <0 0x164a0000 0 0x10000>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       resets = <&cpg 0x11e>;
> +                       power-domains = <&cpg>;
> +               };
>         };
>
>         stmmac_axi_setup: stmmac-axi-config {

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
