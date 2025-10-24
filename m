Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C40DC04B96
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2674210E9F1;
	Fri, 24 Oct 2025 07:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7F610E9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:31:17 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-932c3aa32f3so857534241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761291076; x=1761895876;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbjF3fYBru7mg7PwcFMgCH2adsCiWE8jEZcxNXnQxiE=;
 b=m06MILqDQ1J1AzJ8iL3x5+NuP32OtS1OUY4yuFKhwAPy1Rc8Cz3uXWjoACnPt2/RVB
 Gc50qxtFrzISw8fa+jdkGozLUkqq8JrY+KBHY7whCdRqljOkmv3AbRXlVu/hBWo5wYC8
 ICf6eYUUSchOu3uNVt1K5eXdE9PcsNp3DQf7pe3q1IFr+lbiPh7o5oMS1qcytUibRouc
 B2MVPMFNZGj3zlvZ7xzabVBsX9gaG1xlwKq9Nqzck+0eaCXE7TpNKr9ym5tSgA3fWMiB
 pOsgpMWkNwWl8ziywlfPcFBR6eZBLtBXJ97lAFkHRubdYeMlkXoZSg8YBGVWpNVVa6C+
 BUng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgJlw7RItqWHTqNG2Vf4noCkjaJK83ZPB5yas9szV1xVyWnfhX1WUq+cAsLxm5yvkvmUiZ+ZWxBDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHCV0DIzHmDyt1M+tvyG1NnECSarvv+NqhUknlU7yN5YJhV/j4
 WqVl4EcMOugfRG9zgMqhgD40bLJQoseSdKRFPNsNVhRxkXqCMjVMb335+H75b6Wl
X-Gm-Gg: ASbGnctIpE28B9eZyIEeQ10zCdM8WPTqV04+jUeYXYvK3h45UiE0vnoAnOlF8BqAbQU
 u+DjumKmOeusRrDX9bjd6cFzxaQp4/gjVhB2A1reoXtUrI0rJxVL1nj04dDJQB4vV3iFkmPjEI9
 uDQww4nL/Q2lPy36qRNyqE51datGZkiHizZ4bGjTU1bxpZO+d5vf0AOiddX4NJNhvNxK4k89xw4
 DlXBFeAQLjB76uuiQi6J25z2vAd4C0kr5WT+xjrcge30SA6kKZhGsGlt6SXEJcFB/f1kMwmsdf9
 CLL6ALhZdw9rwL8uV93nSMXtwjuXW8kyWZ4mxJZ33NJOG4ARrY6kl3o6OfBKpWgmJIUptGGcgDI
 x/f58v5uYVMx9PFI/beNJbe30Nyw/1VyzHRcddsjrcr8k8Wva8ZfGNe6by74a7dcgito3TSR05x
 GxSoD9YXnS/Pn5kee3APVRH0KtnWevZPQHvCsfYQ==
X-Google-Smtp-Source: AGHT+IH8pXXsnaJoF9z2wze8SgE++NvpbPrqRh0BP9HGgxK/nIUJIo0LKMAIsqSjmLoORsXfMnMPjw==
X-Received: by 2002:a05:6102:c05:b0:5d6:6b7:844f with SMTP id
 ada2fe7eead31-5d7dd5eb810mr8502292137.31.1761291076343; 
 Fri, 24 Oct 2025 00:31:16 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5db2c8165d5sm1802197137.8.2025.10.24.00.31.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 00:31:15 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-5db2d2030bbso753230137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 00:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZfKnV7y1UIN7GWxzoStB3w14yLwBIYLZO6q1Fcl7Uec6ggltrn0dtE+IGgU15SwnwEi7zp+PN0Pc=@lists.freedesktop.org
X-Received: by 2002:a05:6102:c08:b0:5db:2b3c:eb9e with SMTP id
 ada2fe7eead31-5db2b3cf1b1mr2162722137.37.1761291075525; Fri, 24 Oct 2025
 00:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
In-Reply-To: <20251022235903.1091453-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 09:31:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWONtGp=jdaDYzU1D4WO7KO-zU8zLX--5fQOAiKDpNw=g@mail.gmail.com>
X-Gm-Features: AWmQ_bl2d7bwxn3o_AI0y5I2A2WSBvgxEYlOh2d7MohygC2Sb449e6tQyb1BgRI
Message-ID: <CAMuHMdWONtGp=jdaDYzU1D4WO7KO-zU8zLX--5fQOAiKDpNw=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
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

On Thu, 23 Oct 2025 at 01:59, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> v2->v3:
> - Removed Empty lines (Hugo)
> - Add dummy for compile-testing CONFIG_CLK_RZG2L=n case (Geert)
> - Renamed label found_dsi_div to calc_pll_clk (Hugo)
> - Renamed label found_clk to clk_valid (Hugo)
> - Removed 'found' var because not needed
> - Move 'foutpostdiv_rate =' after if(foutvco_rate > 1500000000) (Hugo)
> - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
> - Convert #define macros PLL5_TARGET_* to enum (Geert)
> - static {unsigned} int dsi_div_ab; (Geert)
> - {unsigned} int a, b;  (Geert)
> - Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
> - Change "foutvco_rate = rate * (1 << xxx ) * ..." to " = rate * ... * << xxx (Geert)
> - Move (u64) outside of modulo operation to avoid helper on 32-bit compiles (Geert)
> - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
> - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
> - Change "dsi_div_ab = (1 << AAA) * (BBB + 1)" to " = (BBB + 1) << AAA (Geert)
> - Added Reviewed-by and Tested-by (Biju)'

Thanks for the update!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -16,6 +16,11 @@ struct device;
>  struct device_node;
>  struct generic_pm_domain;
>
> +enum {
> +       PLL5_TARGET_DPI,
> +       PLL5_TARGET_DSI
> +};
> +
>  void cpg_mstp_add_clk_domain(struct device_node *np);
>  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
>  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> @@ -32,4 +37,10 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_attach_dev    NULL
>  #define cpg_mssr_detach_dev    NULL
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target);
> +#else
> +#define rzg2l_cpg_dsi_div_set_divider  NULL

static inline void rzg2l_cpg_dsi_div_set_divider(int divider, int target) { }

For cpg_mssr_attach_dev and friends, NULL is suitable because these
are only used to populate function pointers.

> +#endif

Blank line please.

>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
