Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A397DD0BDA9
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F5A10E91D;
	Fri,  9 Jan 2026 18:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709F610E91D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:35:56 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-55b219b2242so1924822e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983755; x=1768588555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kI7MDthQA3ktqoj3LLmvl8KmAEBVvsPZr76uV+u11SI=;
 b=G+mjyi9CpH+3qobhnhyYyr3M7DkN6XwURbLGXC51vDCqmKVRlCwoXtJYKshpeZ62yO
 82aNkcupWzX50SD0fyHZMz/LQpqO/r2pzrw/Iwv2bRb9jtkJFKc83ElOlbOJugypGmUl
 +OU5i6+0OEeww1uoc0iqH0bdV+9OuUpBDtVmUrvm3o5Ka2YSHnvHzyU5KI/51HpUjfdH
 v5qjXnpvHbAvPbJUwsdOAEjq+5H/NHzcQC89+1Xa07OugHVpKk+jtL0QGlFgBMuSijNr
 wO7taJdk7h/aiSHq+7DOpDXlDdTXRS31v2DR5Fk/ci88zhZd1jHAB7tVPXIffpNsp7JN
 SRHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTSXCwkgI/WygwMFNChsp00+6WdctBXt1jUY1ysZdc+NXHaC3sQnduOaAznAiVf2mzXaH7+mWSkuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj5r8dWi2xDUIemB2Gnn7U8RiaE+WbsEHt4l6gNt1U2ZE68s4e
 zdrD2FXVeZPPNy4PHuL6J1/QemZeP19+4XSR38QR6PTXfQDd0QNytydknzXd2l7E
X-Gm-Gg: AY/fxX4fpBjYt6LEbrbgmdfb5C1x2X3+H7wrN6aHe+GwoSo3XbTUqp0gz89HEI4luwB
 b0j0aNgkAygsSkJ4Y+x+WMBcz6bYZ+UG5J5tm7NNHGLK+f2ztz5BGr/bidfJJTBOuaaHM3PNnKo
 tcuV7PKKdGkQit28JMNHj/7V9m6HfCQ5mHPgbciihVcyi9oBpiGvNreqdpp061sZHgQEV7PrfhH
 HBUzUHXTF2uzPVU2qCFU0nIR7zieTdOlvxf9/2jQVzx0zhoykDWoIYs1RG88mCuaT5CgLvnPQSa
 C6D9N0srS3aIvV6ry5mM7poRZuDKMkvsNDP8tUCgEzdDfZ4W7S/x0MwlS1PRajkBPPk8sDy91XH
 nI+hcll6kaBDVHx+GNR6dWTrnr2kUI1LHnctvXFea9lupHFBsY9FokAoIkmBwQ7cTOimFzDFMZy
 AnS1YYES9X8oKuEoqKmO89tRMDJ3Tnm1usC9nfN912whDtOqIT1vueFObyqR8=
X-Google-Smtp-Source: AGHT+IE5hY9fNpqr/OSwRxJ3ItvQsOzHwvafalzyl00Mgod9Fmy5kgzsond1LPHekzJih6rMnU8KeA==
X-Received: by 2002:a05:6122:3383:b0:55e:82c3:e1fb with SMTP id
 71dfb90a1353d-563466b1471mr4029041e0c.10.1767983755228; 
 Fri, 09 Jan 2026 10:35:55 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5633a43fe52sm10201603e0c.20.2026.01.09.10.35.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:35:55 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-93f63c8592cso2222579241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:35:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9rsdhrOmbQ4+gihhXDFzP3mzWCpKSODPcKwCJ0uI0TpKPA60qhBazBplDHvpBv13fA78tD9LqVKM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:50ab:b0:5e5:6396:48e2 with SMTP id
 ada2fe7eead31-5ec7573b1dfmr6430422137.16.1767983754869; Fri, 09 Jan 2026
 10:35:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1d7a6c1380a80d82680e606a8523c76e0000390a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <1d7a6c1380a80d82680e606a8523c76e0000390a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:35:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-CSVVDHXEXA5GwjERKaUHO4xxd9HCX0nez0vtCT18PA@mail.gmail.com>
X-Gm-Features: AZwV_Qhl0ZCxFQW4Tw2z2j1hLTuejm9SEcPf1C0HVyWLKtwLrOiE5-4aIHJu94g
Message-ID: <CAMuHMdW-CSVVDHXEXA5GwjERKaUHO4xxd9HCX0nez0vtCT18PA@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0, 1} clocks
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

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.
>
> Introduce CLK_PLLDSI{0,1} also, introduce the
> rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
> constraints specific to the RZ/G3E SoC.
>
> On Renesas RZ/G3E:
>
>  - PLLDSI0 maximum output frequency: 1218 MHz
>  - PLLDSI1 maximum output frequency: 609 MHz
>
> These limits are enforced through the newly added
> RZG3E_CPG_PLL_DSI{0,1}_LIMITS().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -153,6 +153,26 @@ struct rzv2h_pll_div_pars {
>                 .k = { .min = -32768, .max = 32767 },                   \
>         }                                                               \
>
> +#define RZG3E_CPG_PLL_DSI0_LIMITS(name)                                        \
> +       static const struct rzv2h_pll_limits (name) = {                 \
> +               .fout = { .min = 25 * MEGA, .max = 1218 * MEGA },       \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +       }                                                               \
> +
> +#define RZG3E_CPG_PLL_DSI1_LIMITS(name)                                        \
> +       static const struct rzv2h_pll_limits (name) = {                 \
> +               .fout = { .min = 25 * MEGA, .max = 609 * MEGA },        \
> +               .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
> +               .m = { .min = 64, .max = 533 },                         \
> +               .p = { .min = 1, .max = 4 },                            \
> +               .s = { .min = 0, .max = 6 },                            \
> +               .k = { .min = -32768, .max = 32767 },                   \
> +       }                                                               \
> +
>  #ifdef CONFIG_CLK_RZV2H
>  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
>                         struct rzv2h_pll_pars *pars, u64 freq_millihz);

So these definitions are shared with the DRM driver, and thus are a
hard dependency from DRM to clock driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
