Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E275D2EA14
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D3D10E83D;
	Fri, 16 Jan 2026 09:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167C110E83D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:19:10 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b874c00a3fcso293577866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 01:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768555148; x=1769159948;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3fAWD8ppvWG1L3aS+Ni46WWzgwRQSiQawC+eewqOXMM=;
 b=PPv5O+TSGehHqMWlmWYjCDJJkbWKTEylXfKNS63XbXEfEtFyi33+wkOSZnT9+mBmAl
 4hrDX2F8b+PnqDT0QfQIh3a/WKjDQ07gqWZSy3cD5NN27YXi46aYTc4mTRT0QKVQxS3t
 3cbDdA9l+33/ONjKJB51Xbw8kaRNl2UrJn+LX6iXPcFABHMar3/X9vewzBW0AV554+zf
 HzMVXUaHzRo3hcvKrvVpsTe9aM49V/J/zXsvgWvMiLFc88rikoR8aWQp5j7dOf5n/Ye4
 lG5TfUBS9chWUGK6gW9M5iQ++d/D8SID7WG3RuxMAtRRvkjNxyh0ko5LWpG8HR6VcFEU
 hMqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaUCM3IbJrLF25iNKuzLRz8MOgRaQL1FvXd76k46vcG6GQU1/SH7EFHWG9LqVm+5d0OAPMOrY5bGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymasVKR0lTAU88OXMdMwIli3ct7Z8fN3xnuUeAoqsu3kvxYZua
 YpvV0hXCY13SgftmgALzC2QAtjvkY8fXN/WWTrbre+yG+1d1QJ4Ki/Y1mVUXiILMFYM=
X-Gm-Gg: AY/fxX7ceaXDoyp612BtNeoQK5l1nxxo6GPtrxPsf+I4YwJWb4o36bFSyYwhgEcbIqP
 pzsH71FY9dggcJ+nCM4ffc/K+pbOulqzZSpEp5aETfJyBzkXSu1a1tb6qHio/2gKG5KFj8Po84o
 ofZVCVk+idPybdPhUxQ1U8HcoG1U1lJbrKskNg7ylLtzGBTt/Nfe213PVzMY3jXzuAbSLz3dm5R
 uBV2oI/fpQXxuHkmQs7Q9DmCM553vfyS/YrCRvCKyElcPiuDc7tTLv64g8IRTv4uF4HIwmVmJT4
 MUvqN8zTEa4SGXwy/57dG0ad5Ndteax/5dlAMibKBKccx0/c7PtAC7WgMHscawaFXN/WE8W80FQ
 PvDsHjBzOdnTGtAGkEXCMZr1IE3N9+2ACLuO3jCRZfl1JLxbHNcXqfvYsKvySQ3IggOVtcRvfgW
 4YHHQvZ3JoJ9y9TL+AymqWXc+7MwL4+CtMGLVmQq8omJK3aZbe
X-Received: by 2002:a17:906:fe08:b0:b87:3ee:1c88 with SMTP id
 a640c23a62f3a-b8792e18ef1mr222575066b.21.1768555148436; 
 Fri, 16 Jan 2026 01:19:08 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795169f10sm185776366b.26.2026.01.16.01.19.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 01:19:06 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6536e4d25e1so2641091a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 01:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVDkAgXLnhPDixw+VDnFZlEaz0mqiwz+BeiEA0EHqykWPcHb6qPtkHvZIxvdxzr//GHky2Y9DWyfh8=@lists.freedesktop.org
X-Received: by 2002:a17:907:9454:b0:b73:8b79:a31a with SMTP id
 a640c23a62f3a-b8792ddad96mr210546566b.16.1768555145608; Fri, 16 Jan 2026
 01:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20251124131003.992554-1-chris.brandt@renesas.com>
 <20251124131003.992554-2-chris.brandt@renesas.com>
In-Reply-To: <20251124131003.992554-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jan 2026 10:18:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
X-Gm-Features: AZwV_QjnMR0z1U9X8PF-mj2vaxUL5fQhBMQoJnoEgWxMLhhMV_w20Nq1yc7r5Cw
Message-ID: <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
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

On Mon, 24 Nov 2025 at 14:10, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -556,17 +579,114 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +/*
> + * VCO-->[POSTDIV1,2]--FOUTPOSTDIV--------------->|
> + *                          |                     |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
> + *                          |-->[1/2]--FOUT1PH0-->|
> + *                          |
> + *                          |------->[1/16]--------------------------------> hsclk (MIPI-PHY)
> + */
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +                              struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
> -       unsigned long foutpostdiv_rate, foutvco_rate;
> +       const u32 extal_hz = EXTAL_FREQ_IN_MEGA_HZ * MEGA;
> +       unsigned long foutpostdiv_rate;
> +       unsigned int a, b, odd;
> +       unsigned long hsclk;
> +       u8 dsi_div_ab_calc;
> +       u64 foutvco_rate;

As foutvco_rate is changed to u64...

> +clk_valid:
>         params->pl5_spread = 0x16;
>
>         foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
                                             (params->pl5_intin << 24)
+ params->pl5_fracin),
                                 params->pl5_refdiv) >> 24;
          foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
                                               params->pl5_postdiv1 *
params->pl5_postdiv2);

... this division needs to be updated to DIV_U64_ROUND_CLOSEST,
to fix build failures on 32-bit, as reported by the kernel test robot.
I will fold in the fix.

          return foutpostdiv_rate;

   }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
