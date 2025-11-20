Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976CC74D8D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5B10E2A9;
	Thu, 20 Nov 2025 15:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703710E2A9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:19:03 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-5dfd2148bf3so357560137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763651942; x=1764256742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ub9l6qBIoXlIUbnmglQ/dhIf5gsVEoXOGghpcNa1o2o=;
 b=u5nkglJNYDMcdDROFsLLA6q/OuJaxujqooEPINEiAt1AxfxDprzzUjeFISJ7ptOI2s
 9UzqnrVNGIeyxU75wIZNjM3AeCeMiCFHUASme43o7HP3OivCK8j1mo8gINm0KHTehaN3
 Bp9tpF1NfMsTRF29CRt7Lg53d4JhQLV54nrEKH2OyFVp3x86Ibu0MWOf8cLd2PoCW6XE
 dOAEVvNQ1p7PBHgffpMsVTlqVsqukdv+VlrXzPsrZo7m4cTkYSiGxl6aOf17Hk03p3T5
 mN7GWJFBRc6vFArYmY7MPxmfrDsJM3/m3S8X2A3qyCZ+AX9J+lpdLZB+XswoKUR/5Hx7
 lCBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWYhc03gExvF0okRLuetB2huNHNsCmxYmq7RLPj4k5apUuzoLPrpCDysOKab9EuIwTSS4T9ZfKz0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwknEp+yOTGaqR+LPQBsz8KRF0tkV8gKoE5aq17cgvDSwMRHUrp
 WqF+NuZQ260n65GqYNtUNqfbISvj125UglcMiDWy+s/SNv8LVFZBuHv9xjGXANRu
X-Gm-Gg: ASbGnctlJPJtv9SzSjwgRZtxm37bnElIwr2Y99WSgKTU1bPn71x8y3S9NI8Tz5iYQxo
 JPqi071Xam25SdqsebWhjT/0Xxij0gY7x5qSXJpmxBsSJgTpFuE9xZHYx7Inaxb7Hn0NPWqCtle
 fWrkh6f140POhSpE/H/MZfUlh0EHsHDChMTn1X2H0EsC6w0NKMmYb8MnLvyp/G2Jz/Ni5mSUQ84
 3zNZkftPdNnKmEXc//mQS2lQ05hVFafe828uBJSv23bOfBbn98AEpFLk/5ajBU2HOyh3dCt0F5D
 WaXrK09ocOIy+Ij8eISSx2ezd1csKZTfGEmk+zvozWsliRxbLxngIQKM564OjNEUKu2dWnjAIz8
 o6BzGabdT7u6RxPO0/R452YM512inJdFdqZo/7Kga2uo1f1q15R9xP1az5zFi+jxN+ji1GXV9Ce
 26usxnnMSRAlnr732hiI1j35+utgB3KRfMD3tYc+V2TqbiRUCT6kim
X-Google-Smtp-Source: AGHT+IEFELD+5SGgHXTJmUwYwRCrWx7r2QmUjcw4pTloM73RoMq4xivtJdVhByNXun3Ru2Inb/SmhQ==
X-Received: by 2002:a05:6102:3713:b0:5dd:f9c2:551c with SMTP id
 ada2fe7eead31-5e1c857378amr755664137.27.1763651941673; 
 Thu, 20 Nov 2025 07:19:01 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-93c56519711sm1120392241.12.2025.11.20.07.19.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 07:19:00 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-93a9f6efe8bso298871241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:19:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxif2X+dJNvUk+XkuPGjG7rUBlvvXSo1nxCzBUvV+Wa6UyZtU2Y2aD4iLxDFbpwbW/PEPdvgl9C8Y=@lists.freedesktop.org
X-Received: by 2002:a05:6102:50ac:b0:5df:b507:acc4 with SMTP id
 ada2fe7eead31-5e1c81dd242mr686147137.15.1763651940149; Thu, 20 Nov 2025
 07:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
In-Reply-To: <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Nov 2025 16:18:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
X-Gm-Features: AWmQ_bk9X-7xje-hq15MNOmoQx3jV91rBDyxVCLaD3AFsFSCe_bv9qxDdxdRCY8
Message-ID: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

Hi Hugo,

On Thu, 20 Nov 2025 at 15:47, Hugo Villeneuve <hugo@hugovil.com> wrote:
> On Tue, 18 Nov 2025 21:27:43 -0500
> Chris Brandt <chris.brandt@renesas.com> wrote:
> > Convert the limited MIPI clock calculations to a full range of settings
> > based on math including H/W limitation validation.
> > Since the required DSI division setting must be specified from external
> > sources before calculations, expose a new API to set it.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -16,6 +16,11 @@ struct device;
> >  struct device_node;
> >  struct generic_pm_domain;
> >
> > +enum {
> > +     PLL5_TARGET_DPI,
> > +     PLL5_TARGET_DSI
> > +};
> > +
> >  void cpg_mstp_add_clk_domain(struct device_node *np);
> >  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
> >  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> > @@ -32,4 +37,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
> >  #define cpg_mssr_attach_dev  NULL
> >  #define cpg_mssr_detach_dev  NULL
> >  #endif
> > +
> > +#ifdef CONFIG_CLK_RZG2L
> > +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> > +#else
> > +static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
>
> Maybe use:
>
> #define rzg2l_cpg_dsi_div_set_divider(...) do { } while (0)

I assume you are saying this in the context of the kernel test robot's
report?

Static inline functions offer more safety. Just s/u8/u8 divider/ should
fix the W=1 issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
