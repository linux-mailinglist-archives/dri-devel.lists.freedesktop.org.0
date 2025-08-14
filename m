Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B8B25DAB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FFA10E809;
	Thu, 14 Aug 2025 07:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6012210E809
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:39:07 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-53b174dbfceso211547e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 00:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755157146; x=1755761946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8CSISlgZ7w2Pha7sxJ62ESuLVR/2x+3b3rgz2ITxoi4=;
 b=vx5eBGiqex2b1waOwYZua4zorfjWcHpzdiCHN7ADoJdCjOmox2D55XmVCY3pDBOVqn
 i+jmzpW5uCQg4J0wt/aewXsvojkpPY5yl9FgEYjagwuu2O7+yOFPV0Wltk71iyuBEPCZ
 bS6wpoCR8vbQfCBnILA8VZAhUlWf1L+M3z/lGlzz8Uz0FFiU6rSNl8c37xrMKAVPY97g
 NClQuK0Xk2I+QRFuMjaa8X/HfaPPFLmEDjMElA4CaiAK6vYe2737smNYzuokeF9CDIOr
 fYYOm9Klf8rzfArt5bUx9N3eSPcd5maTCP0FZfiab8O2P0evauPUEpmazXg5ttZoAPuj
 rfjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEPIWm1A2gaDlV7Zcb8YjEdzOhs0IDgntAZ/qpzlpHZwNoI5wRLyz2gqU4hdfhHtGKMTXMHXmGhls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+692cyfxK5z69fA0j7xC5kuf9MaIvTDsnDlsh+ALRj8rH/smH
 2iJmNriMZlTxDG00boVZacJSWycH7fYtszsazF4ELpoVoBRGE1aztWyr5Li+ja+n
X-Gm-Gg: ASbGncvps/CPJIvFmxM/fL92rTiqE4cOGNJ9/JIhhZSJeYLIbQ2sQpobRZdVHNTwwiC
 JRj6AO1yWtvvJlsqwsPLOY3C/z7G5js4cybS4WA0ZCHbJbYHsFslwvXLlqH7CrPthIY5Y67elCw
 Oqg6yXL5qSatdQ9OS9KotKk13n+N8QXHkx5O6IK1N3DVJ+AodryVsKVBa8jad0BTHRC2yhNXQBN
 HuRdJWp6ZEvSmpz7aqpqs2sSWuXWq8WNiteK4B1SxbffDXbPnFdp4mK6kuCtFXVPzalRr2Zt3e0
 +OO12fffrVc3Neu8D5oLt6hnYCgRWj2bthufaFgeWwmKqDPmPBJs8wn0Hs+raw6YP88BZwkwB7o
 NkzXW6GZCDPKWtbVbcq5KqeIo+60NhPZVRd7NI2AMxqN3xSq+bZtbFAYwO58mrGpA
X-Google-Smtp-Source: AGHT+IEF6AIwRm2FDZZGqLUicWZH1hqaGkbUJPSEbBlQr0AIrub+1Re4+OEfkpvp0uqwNKjmClhQag==
X-Received: by 2002:a05:6122:54c:b0:537:3faf:9b43 with SMTP id
 71dfb90a1353d-53b190d2cc0mr535016e0c.12.1755157146016; 
 Thu, 14 Aug 2025 00:39:06 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-539b01b0283sm4383186e0c.12.2025.08.14.00.39.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:39:05 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-53b1737b9c8so244042e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 00:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWrMVoKyYl2O/FTjg1z9VOnnfLl8lbTSC1E2fItZzBn9itvwcDqwjlPElTExBTWsBD8aKEMNBsyG9Y=@lists.freedesktop.org
X-Received: by 2002:a05:6102:54a2:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-51002815a30mr587814137.21.1755157145213; Thu, 14 Aug 2025
 00:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-2-chris.brandt@renesas.com>
 <TY3PR01MB1134628601112EF2B32F3358D8648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <OS3PR01MB8319CD026C1E27CD7FB736F28A48A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <TY3PR01MB113468C7F195036B28A70E9508635A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468C7F195036B28A70E9508635A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:38:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEJO1rNACo_LMLUC=NFAZJzsY5zwR0a6to=sf2QBNw9g@mail.gmail.com>
X-Gm-Features: Ac12FXybgjD-wOo6w-nOUQ17Up2NerJuWgpZO8qF-cSYQtQTjRDQ90qu61zjutQ
Message-ID: <CAMuHMdVEJO1rNACo_LMLUC=NFAZJzsY5zwR0a6to=sf2QBNw9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
 Hugo Villeneuve <hugo@hugovil.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
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

Hi Biju,

On Thu, 14 Aug 2025 at 08:08, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Chris Brandt <Chris.Brandt@renesas.com>

> > > > + /* If foutvco is above 1.5GHz, change parent and recalculate */
> > > > + if (priv->mux_dsi_div_params.clksrc && (foutvco_rate >
> > > > +1500000000)) {
> > >
> > > Check patch is complaining:
> > >
> > > CHECK: Unnecessary parentheses around 'foutvco_rate > 1500000000'
> > > #146: FILE: drivers/clk/renesas/rzg2l-cpg.c:648:
> > > +   if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000))
> > > +{
> >
> > I saw that...but I thought the ( ) makes it a little easier to read.
> >
> > But, what's the general rule here? Make checkpatch come out perfect?
> > What's your thoughts?
>
> I just ran check patch and it complained this.
> I am leaving Geert to comment on this.

/me chimes in ;-)

You are not required to fix checkpatch warnings or errors if you have a
good reason to do so.  In this case, I see no reason for the parentheses
(it is not a very complex expression), so please drop them.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
