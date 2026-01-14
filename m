Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A708ED20429
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AB510E614;
	Wed, 14 Jan 2026 16:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47110E2AB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:42:30 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-559f4801609so9261e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768408950; x=1769013750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zAI1vAm8zyuEJBGK15rFf8mW6aC3AlXImIyYe4APAQ=;
 b=WA7mabqkastDp4lrmbdO4IClP6XlnJo2RZK/geyORXNnmdRgcxG9ysEfNWgVsjR31z
 6WJKYB3gtQd07/LnCCfmgSFepg8K22WEteK+/y7WSkfr+0zjFpR0MagO8H+Tw0zJGyt2
 IHUTv8kKumppu3LRtn6AxyFf6v4XTdDbDl8kdiEV0UF4yrTtcfH1RnDbojKlvehIkWJH
 fQeU/AlJ7hjemqXIKF+NswhY/PSGFPeLEKuCuWWJTTzlQpHUW5MMd8I+DNs0N0VAH93R
 T9n0tAL4T4WCkpJz6QCcpQB+JpzHCKgR/UUAotJTs3FIR9VOHJsVkEJfxLaIuz8rWl4t
 eZ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2kI2SW0lVxUpAKiLmzbMq7UfT5xRfQRm97UoqnQyrJD4yedns/XquYdWrbZZIzzq/XD2AHQoeH6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwguZvzzvErSMEItaCuL7nzlednO7JrAhvLZzCn77oMaXVTZ2x7
 XKwKAIIsfBAtrKqFnw9EyP0XZ5yma11O9DTV34dVmqwkPB8hLkdMWeoUftWXFku9
X-Gm-Gg: AY/fxX6kDyGPmHNZ345jhqvrzph8ZESOp/vGfiIBBVEre1SL2fNw2jwRx8nLdRu5N1/
 0r7Z/ZYpiKsrCDIqZ2qEZrOiARHfo0CPtqv5pNv2NPbMzMXdGHUrfLsZFtFe4A/RC8dGhtuQg4c
 ZNgOCB3YR8JGU0LaWOQwwpxKVYLtrJ8dYwoqvnFpmWxXTgeiTc+AYUdYMHttS7l8XNHSvFe36mA
 JwqriMRtSrKHo39uaw2OiKxYebHPRF9dBkAHh9z/wspUi3NYNMCd5yT1VQEB2K1jCaTVlSChjAq
 4vObyBeeuudxZO+34Wr1gnQ15QzzisQfLr9ZRAsQjXNNLq0G3NhvM4yfcmpG62+6BUCsZz4y/rI
 LNH/8gs/j2mPnMy/DQtvIIKQ1cf/KigtWCwRUaumogsvI09rKw3CjriGB5GVUbyIs1TJ9uuQEiT
 aiyCPoXJg7qU56LY4xsDQqqjYoXzWu94ErwT1zlR1F63uJ6UkD
X-Received: by 2002:a05:6122:65a9:b0:559:7077:9a8f with SMTP id
 71dfb90a1353d-563a093dc0emr1282847e0c.5.1768408949553; 
 Wed, 14 Jan 2026 08:42:29 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5636106e953sm17682869e0c.8.2026.01.14.08.42.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 08:42:27 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-5ec96028b32so5517347137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:42:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWrPThfuNeohoNbFZ+S5mLg4NshTSXd/4H+0t23IKENIR0D+1fk/xGxbjrI7+CAP1RufPYV8T1kki4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3906:b0:5ef:b3da:1634 with SMTP id
 ada2fe7eead31-5f17f68f312mr1450471137.43.1768408947433; Wed, 14 Jan 2026
 08:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20251124131003.992554-1-chris.brandt@renesas.com>
 <20251124131003.992554-2-chris.brandt@renesas.com>
In-Reply-To: <20251124131003.992554-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 17:42:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRaP1JwDfxPy3LNS7FY_0pNMTBxYj-VNRiWz3c3SgTDA@mail.gmail.com>
X-Gm-Features: AZwV_QjWcqhv4BWp6yUPa3iKC9wMZIiturOyBbCVRUrZoIrQDIcjrKfTqR4MbTg
Message-ID: <CAMuHMdVRaP1JwDfxPy3LNS7FY_0pNMTBxYj-VNRiWz3c3SgTDA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
 Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Hi Chris,

On Mon, 24 Nov 2025 at 14:10, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -18,6 +18,11 @@ struct device;
>  struct device_node;
>  struct generic_pm_domain;
>
> +enum {
> +       PLL5_TARGET_DPI,
> +       PLL5_TARGET_DSI
> +};

While applying, I will move this just above the functions it applies to...

> +
>  void cpg_mstp_add_clk_domain(struct device_node *np);
>  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
>  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> @@ -177,4 +182,10 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
>  }
>  #endif
>
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> +#else
> +static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
> +#endif
> +

... and this part up, just before the RZ/V2H parts.

>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
