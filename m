Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED908D1FAD1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63E410E342;
	Wed, 14 Jan 2026 15:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63D310E342
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:17:15 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5ec8781f5c9so4206463137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768403835; x=1769008635;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKv1ovepy8byUAHhXrIcegwAZXFuolP4bDoWHXlYmv4=;
 b=jJhcSw9jnVOSt4GTJHq4m5JNIL9+PimUwXe3mKRK1bbjHRBoHXDuO1tNcFCKskyoAF
 kQ9GNyuhdllVMxZAk8x/FSLtrkr2sW0r+ro3Pr8wQl/R53V71H8DKWXv9YvpRi02R3+5
 uO9AThdHIGTXLwUoX4WnZYaMCj+YgzhJMZpYmSk+XlsKoH6DB7cCbmq2Y5Gqrk0HQTX0
 Q8vrIZ0o64Y9I7nAZ80iIwAD4Oa8VIK5MvDUyzWUog5rUQ3MZg1EZne09wCWCKXZREtN
 XjbVkgI7d2ghCGSm1GqvuM/eQrEJnssgUqd/PQtrfuVmlH28xJgp73IkAkeYqCz39rCG
 /ETg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7tQyp62l4E2DDJ1qiSYT+A0DNb5DVXiy99xYL97G+3phg+RIyVciLme5+882fvfNtMqRdywSBipY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz4IHzyGDt9ohWB4pqrhs7YjsVp3WXNr3mrdfws3H17E65fhBE
 4n60rNsA/bPIsVzCa0dGGUdwNtVeBDgkYNIoMfLWd6/XTnk1FQEJiYIwE/U0+aAL
X-Gm-Gg: AY/fxX7TQyWrw9Ux893o8UdQg0b0zLj/aFzgJPqIQUjW+ix3x3+JLDcPoyaIL2OW1+C
 mjR5cDx1XgjycqMUSGrrHE2CiBDtNttmAPsjnEI3uzapd+hXAScpj2ySLtB6GFE4HAbLi10gKVJ
 XmjTiURwiA6kZhzqZTrF2LuTPuvwb/qsDMu8gXeFAw8RF6xCNk3pJVrknzPYhyd0atWVcFdv+lP
 S73scRCoW9IOxUxiGhXBCcreZxIseCsjmAtMkWleYG0HnMIZp/W5v37umgPJbT9pMThgubiSvgL
 nBJZb3rRoU26WqUvBzOoVha1gaYMoEK9c0b9oCLapnx/znrI3DfOlB9+jKgO+QuD7EXW4mCMU+G
 0g0xACpZW0IUKmb7mAnU9iackAdUX7WZj1iQJVJhcfAidXupzMa07Ig56sHwzjePcfeq0guJzAw
 Ws5ogjc4ZtUISrvWSjVbgiui0Fin9ESviC8lCuM+2k1tMzaR4D6iFZ
X-Received: by 2002:a05:6102:5cc7:b0:5dd:b61a:a9c5 with SMTP id
 ada2fe7eead31-5f1833ab5demr985980137.0.1768403834747; 
 Wed, 14 Jan 2026 07:17:14 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec772af325sm23868883137.10.2026.01.14.07.17.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:17:14 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-56373f07265so3893481e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:17:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWmSf0Ou7F//eL9VGQiRQ2f+BEHD6V+mtO+Soj28SE/5eygvkXZzXSUV1UcTtX61Iw9vsSgSq6/E/A=@lists.freedesktop.org
X-Received: by 2002:a05:6122:130c:b0:55a:be72:7588 with SMTP id
 71dfb90a1353d-563a21caaf3mr947121e0c.11.1768403830849; Wed, 14 Jan 2026
 07:17:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <554850e7cc0ed99ea2a0d47840fbd249d17faf6d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <554850e7cc0ed99ea2a0d47840fbd249d17faf6d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:16:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW6rsfeYjdqnxZxFrPe22aboPMwgzDVMtrfso5D3m4GhQ@mail.gmail.com>
X-Gm-Features: AZwV_QglkbidH76AuWe3Sfdqyn2BD0tJQEne_GsvUMV72nBp7iQEpygHJH5KiHg
Message-ID: <CAMuHMdW6rsfeYjdqnxZxFrPe22aboPMwgzDVMtrfso5D3m4GhQ@mail.gmail.com>
Subject: Re: [PATCH 20/22] arm64: dts: renesas: r9a09g047: Add vspd1 node
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
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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
> Add vspd1 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

Please merge this with "[PATCH 18/22] arm64: dts: renesas: r9a09g047:
Add vspd0 node", i.e. add all VSPD instances in one shot.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1219,6 +1219,20 @@ fcpvd1: fcp@164a0000 {
>                         resets = <&cpg 0x11e>;
>                         power-domains = <&cpg>;
>                 };
> +
> +               vspd1: vsp@164b0000 {

Please move this just below vsp@16480000, to preserve sort order
(by unit address, grouped per device type).

> +                       compatible = "renesas,r9a09g047-vsp2",
> +                                    "renesas,r9a07g044-vsp2";
> +                       reg = <0 0x164b0000 0 0x10000>;
> +                       interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       resets = <&cpg 0x11e>;
> +                       power-domains = <&cpg>;
> +                       renesas,fcp = <&fcpvd1>;
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
