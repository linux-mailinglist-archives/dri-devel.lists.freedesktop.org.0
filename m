Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F2A8B54D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8510E8A8;
	Wed, 16 Apr 2025 09:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2100C10E8A8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:28:37 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-52617ceae0dso1863020e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744795715; x=1745400515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g4vscTFMlRO2bqnOkEDCqxlIR5FOdxqQklMvAsU4H6Q=;
 b=boxRzTvH9caIPhsxUxEpM2A0MhxIMdzKIlPTKdvFEykqhrVieypmF7/VyZvo4Rxl4i
 J2bZLvSdzfzU1dUBJuVl/44safoW+Us5pKTYTiC7zqP4mJELcgSirtkB1nnBB1vO9dfe
 hr88xlTuE+ADNcBv/Ngeb5COFu2xigVNVsmF6BqwWNOl3/yJcq5TL4B/u7r4ydL1VPq2
 YdGKSgP7aFQCol9TXk0N4wDPHH5yVqr+aqMzjUT/9VRnSfSTqu3V2DM8wRpldzdndVWJ
 +WES0udR7PNfo+Ik3vGa+GWbzo3NmHIKwsdU46h5X2/h78Ywn3mDmvudIgdK2+ppzvme
 475g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWorSHLsdh/2+t+FhmugZQLCG4mSOsYm3DbE9okqL4+hlE7zf3RJf9jjHqcyigO8MBaX0+lPswRgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9IByCR3brLXWrCr/wGBzIigd0Ov3w98Yhe1voaF9TBCUWnl+E
 tlsqXLGvmENLVqJUyshNVLn0gNNw0rkcWB2RdJiDCMmvK4aQvz4I8dqZyc+e
X-Gm-Gg: ASbGncugzVghu/0gGMt6L1R6aZxstprGI7O8zeigk+a0UZLUMWNTECa4txr8vkqvA3e
 kP8/ZPmKTDWCttcmHa3esQ9FKb1YvrjuKelNwvF0RwzUQocZte4hNsa2lVzAZef1/KaREC2f039
 hzAn+w6eMegj+s8s2X/zTy20AHUk9FeA4wR1iIFoaIbbX7jOzAhJL/aiXPZ967KYK9+3Eb2QKcD
 sZXIxqsJVWZOCGlhcFFB67ZArS+dUMabk1DhBKW5tAExjhhZ5ZcBll0EXUuhgj0GsdDUdS2zeQv
 jKCDpEqq3TzvlZVPwu1rHgC2/5LZ2XoV1KzOxnfMbGtJwob6dqLV7Bk6rdCKH0ZsvxuDJDLb5JR
 R1VUIssE=
X-Google-Smtp-Source: AGHT+IFRNd/QKwLICVIKeV5jGcoUe7m9QwIyS/9RZOS8fYDtCmj57Uht95hAei1/B1bP2IeMGfogLw==
X-Received: by 2002:a05:6122:2a13:b0:529:d7e:d13f with SMTP id
 71dfb90a1353d-5290e1c84a3mr417389e0c.9.1744795715124; 
 Wed, 16 Apr 2025 02:28:35 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-527abe8e6fasm3170665e0c.36.2025.04.16.02.28.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 02:28:34 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-523de5611a3so2496247e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGmHqz54UKZbIOwz8QD7X0wYpuUbgY3QxoH2uvNwS3x7RRRJd2R+5QsMyn78Lcy8HVAMmvG6uYrJw=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5e8:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4cb592f320amr282769137.25.1744795714375; Wed, 16 Apr 2025
 02:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:28:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
X-Gm-Features: ATxdqUHCOHToO8zh97LKtpyDEutN_FL_Sxg_dBqYsVTr46pKfBBTHGJphFzPmgw
Message-ID: <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Prabhakar, Fabrizio,

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DSI support for Renesas RZ/V2H(P) SoC.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
>         unsigned int num_data_lanes;
>         unsigned int lanes;
>         unsigned long mode_flags;
> +
> +       struct rzv2h_dsi_mode_calc mode_calc;
> +       struct rzv2h_plldsi_parameters dsi_parameters;
> +};
> +
> +static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits = {
> +       .m = { .min = 64, .max = 1023 },

.max = 533?

> +       .p = { .min = 1, .max = 4 },
> +       .s = { .min = 0, .max = 5 },

.max = 6?

> +       .k = { .min = -32768, .max = 32767 },
> +       .csdiv = { .min = 1, .max = 1 },
> +       .fvco = { .min = 1050 * MEGA, .max = 2100 * MEGA }
>  };

Summarized: why do these values differ from the ones in the declaration
macro RZV2H_CPG_PLL_DSI_LIMITS(), i.e. why can't you use the latter?

>
>  static inline struct rzg2l_mipi_dsi *

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
