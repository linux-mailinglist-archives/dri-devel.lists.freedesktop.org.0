Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499163ECC5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857A10E59B;
	Thu,  1 Dec 2022 09:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB76310E59B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:45:19 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id h24so611085qta.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DVLegIJETL5mJ+MPOGcfKwPn4HailtVISKdkup4URCc=;
 b=Um318GeOVqspiBa3mayGGgVgfTfblsWMb+NjUrfq8nB+Ix0LeTu4c/+U4wvyC7hKuw
 QtfDw6zxEIm7eMbXQsZ/EN81mCkdqqxuFmIG2cotMDHYE1BD7bdhoTJUpkNcDBVC6DnA
 wBojIO1YQmatD0mmAN8F4f3FzAzNjSMPp1R+sdgZXvBA/d+C303VHIDPlrOJTCTXegse
 eHRT7ZOpiygOtXxeU8FKakXLMppn/84Iv2IL1e/2lSGUlj1KfmCAnslaqBvIsUybjH5k
 jm0j2t7/t0lvWGn+gRStLSXqOSUe1MvXvXgtBYSFFJcMzO5ObK149nKR0NBys0sPyCeP
 tsvQ==
X-Gm-Message-State: ANoB5pkfc41N4oZiKvbDMHfrhOFF7H3XmJ7ZULc7OL16dqS671aHT4r6
 Z0zt0rcdKn6BSqDho6CW8fhRVCaUcUY1rw==
X-Google-Smtp-Source: AA0mqf5eebhxIfoY78Q3NACTgQHJC1uYs+/YeH+P2/rGPT/rFzWaBGYSBIzigP2VlbmY2Qq68/6/jg==
X-Received: by 2002:a05:622a:174b:b0:3a5:8668:988b with SMTP id
 l11-20020a05622a174b00b003a58668988bmr46018605qtk.184.1669887918751; 
 Thu, 01 Dec 2022 01:45:18 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 w3-20020ac87183000000b0039cd4d87aacsm2281996qto.15.2022.12.01.01.45.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:45:17 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-3c090251d59so11604387b3.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:45:17 -0800 (PST)
X-Received: by 2002:a81:f80f:0:b0:38e:e541:d8ca with SMTP id
 z15-20020a81f80f000000b0038ee541d8camr59315565ywm.283.1669887917015; Thu, 01
 Dec 2022 01:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-4-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdUjCS6q44XmTanu=R68GyuVECLa0B-1AFg1CUD_oV4DuA@mail.gmail.com>
 <5598c7f8-b47e-338d-e2e3-f62a44903634@ideasonboard.com>
In-Reply-To: <5598c7f8-b47e-338d-e2e3-f62a44903634@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2022 10:45:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbnPZSxGjk=9GXRj7mxqbNoaJ_jtiJHEq5cLwMshy3uw@mail.gmail.com>
Message-ID: <CAMuHMdXbnPZSxGjk=9GXRj7mxqbNoaJ_jtiJHEq5cLwMshy3uw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clk: renesas: r8a779g0: Add display related clocks
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Thu, Dec 1, 2022 at 10:26 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 30/11/2022 21:18, Geert Uytterhoeven wrote:
> > On Wed, Nov 23, 2022 at 8:00 AM Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >> Add clocks related to display which are needed to get the DSI output
> >> working.
> >>
> >> Extracted from Renesas BSP tree.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c

> >> +       DEF_MOD("dis0",                 411,    R8A779G0_CLK_S0D3),
> >
> > I doubt this parent clock is correct.
> > Based on Table 8.1.4e ("Lists of CPG clocks generated from PLL5"),
> > this should be one of the VIOBUS clocks.
> > VIOBUSD2 has the same rate as S0D3, so I'd use that one.
> >
> >> +       DEF_MOD("dsitxlink0",           415,    R8A779G0_CLK_DSIREF),
> >> +       DEF_MOD("dsitxlink1",           416,    R8A779G0_CLK_DSIREF),
>
> Now that you started questioning about the clocks, I started to wonder
> about the DSI clocks. They don't quite make sense to me, but here also I
> just assumed it's "fine" as I copied it and it works.
>
> The VIOBUS & VIOBUSD2 are marked to as going to the DSI. But we don't
> actually mark any of the DSI clocks as coming from those sources.
>
> DSIREF is quite clear, it's the source for DSI PLL.
>
> DSIEXT goes to the DSI PHY and is also marked to be used for LP-TX.
>
> In the DT we have now:
>
> clocks = <&cpg CPG_MOD 415>,
>          <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
>          <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> clock-names = "fck", "dsi", "pll";
>
> The "dsi" clock name is a bit vague, but maybe it's "not fclk, not pll,
> but still needed for dsi"? =)
>
> Is it ok to refer to DSIEXT & DSIREF like that, or should they be in the

Sounds fine to me.

> r8a779g0_mod_clks list? Or is that list for fclks only?

That list is only for clocks which have a bit in an MSTPCR (module
stop control register, Section 9.2.3).  These are typically controlled
through the Clock Domain and Runtime PM (but not for the DU, as there
is always only a single node in DT, even when the DU has multiple module
clocks on R-Car Gen2/3).

Actually our abstraction may be a bit off: sometimes that bit may gate
multiple clocks leading to the module, but as that was never documented
well, we settled on a single functional clock only, which is the most
common case.

> So the fclk in the dts is mod clock 415 (416 for the second dsi), which
> is dsitxlink0 or dsitxlink1. Well, those names don't quite make sense if
> it's a fclk.
>
> I would rename those clocks to "dsi0" and "dsi1", and source them from
> R8A779G0_CLK_VIOBUSD2, similarly to the other video clocks.
>
> Does the above make sense?

Please keep the names, as that's how they are called in Section 9.2.3.5
("Module Stop Control Register 4 (MSTPCR4)").

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
