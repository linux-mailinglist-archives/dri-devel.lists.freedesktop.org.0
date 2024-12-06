Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5769A9E6F6C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 14:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAEC10E1A3;
	Fri,  6 Dec 2024 13:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A86E10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 13:43:46 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-515fc9fc5dcso265755e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 05:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733492623; x=1734097423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/8NncUiLlBJXWiu+rkQNo8aljW5FrHLP4iwjw0aFZc=;
 b=O8NBKT+bDTiTuJv6MCezFJE7yZRDqyiqmzpvSlH3rHIWAMgJuroeOuJObGlZM/UUZt
 gZ8FFHsHpgG6Xnn+VggUQUk3Ud+HA4MhNhXJ8/ZJmF3VCN0LVeTvdDtPCDk1abTZZ6uy
 o8k8JCXuT0NGOE5nEbnlYO2yap2PdZLdocwT0th3f80oZ65O9f0p4PWA/75zl8YmHnz0
 +O1K4t5p0rEYaHSRhvrBM2gSGAXz6y2tK88GBEcTHuRWM6bMIOv8BqC4bCQO1/Ltvd5D
 1vBL6uslbegRCK7eK2R3ux7u+xeKRnINC0Jv+P9XAqArzK2LXxUqYj1Ni5+clQW6KXK5
 bHuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUESS1/v6frtRwG4X/juwBZidE91/saSTZR8CPeJfXL7elU2p+WTbWGHTbqHyzXeD7jrllJai1/Nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeFIMbcTTSn0mEyKt6+fSM127c8yTXpH+LEfUN3cP8RvluWqY/
 4h3IGviKkqE8H4cvfVt3lm1+K3y/ETGfm2kZvhNl6lmwkBjHPwORRNkbNYgJ
X-Gm-Gg: ASbGncu1yFRzNbOghEmB1VN5+TmbLWFwKfE9+Gmv+Il21GkYIKXje/l7Lyir0aPkuFm
 lIMNMJMYuEBeIRfN8qDaTIrGbsRT3QiIV4KOnDSLvccFmPs71A7azXVzssY6uK18R4D7VutZyuw
 xjzLPGKuPty8jWm/f9tMmtM2/jvl6Y7cXaeH3o2RcpDfimQwhoB7ZV5jhdDc+mrK6rwF/WD9Jhd
 Ss/RWy0zw8dFPFpSaF9M6YiI8hFdx7r6Ow+XI4Dv6cf1+O5RD8Xe7TliEoAMs25GED+iwdy0sxc
 8UbTehnpJ/ZT
X-Google-Smtp-Source: AGHT+IEU3n7NDMBHCLgvZ9YUzwRnUHv3ZDX5CosWlYwbS/qD8f9UrlQvGy8b/wvn1hgRpb/arFf0NQ==
X-Received: by 2002:a05:6122:3a0f:b0:515:4fab:301a with SMTP id
 71dfb90a1353d-515fca1dbf3mr3292814e0c.5.1733492622931; 
 Fri, 06 Dec 2024 05:43:42 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-515eaf61567sm326051e0c.47.2024.12.06.05.43.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 05:43:41 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-4afd4b5b3f6so136664137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 05:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWcu5nHj+Ele8NS9JBmqiGLKYBSDcBdeYezbgI1LGdgKkpisoQ3awZC/1nVOxDZ6YVJ4YXaGz9g3xo=@lists.freedesktop.org
X-Received: by 2002:a05:6102:4689:b0:4af:cbf7:99d4 with SMTP id
 ada2fe7eead31-4afcbf79c13mr1996237137.10.1733492621216; Fri, 06 Dec 2024
 05:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:43:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
Message-ID: <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] clk: renesas: r8a779h0: Add display clocks
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

Hi Tomi,

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Add display related clocks for DU, DSI, FCPVD, and VSPD.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
__initconst =3D {
>         DEF_MOD("canfd0",       328,    R8A779H0_CLK_SASYNCPERD2),
>         DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
>         DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
> +       DEF_MOD("dis0",         411,    R8A779H0_CLK_S0D3),
> +       DEF_MOD("dsitxlink0",   415,    R8A779H0_CLK_DSIREF),
> +       DEF_MOD("fcpvd0",       508,    R8A779H0_CLK_S0D3),
>         DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),
> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
__initconst =3D {
>         DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D4_VIO),
>         DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D4_VIO),
>         DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D4_VIO),
> +       DEF_MOD("vspd0",        830,    R8A779H0_CLK_S0D1_VIO),
>         DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
>         DEF_MOD("cmt0",         910,    R8A779H0_CLK_R),
>         DEF_MOD("cmt1",         911,    R8A779H0_CLK_R),

As mentioned by Laurent during his review on v1, all clock parents
should probably be some form of R8A779H0_CLK_S0Dx_VIO.
So I'm inclined to replace all of them by R8A779H0_CLK_VIOBUSD2 while
applying, which would match R-Car V4H.

Are you OK with that?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
