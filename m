Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB963E092
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 20:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D34B10E4C0;
	Wed, 30 Nov 2022 19:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A2A10E4BF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 19:18:27 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id mn15so8783620qvb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=viurBIMrrjVhVQQ2xklycs4TlNU9Q00m6IkXE2RY5KA=;
 b=Q4s747ukuyG5YlPS+YhH6zUN2HRXCxt/OUTm1nW0w2Dvt7pYz5/b+HO15ltVqn8JpP
 iSlf2OKXUR3T8csHt8lh65VQqlj3Qwomzct2trodLQnz7vfnqwlXvi/FEjrqr9YLyMYV
 rP+V02aOAmea5ReSKic+tgr/EYBhn7TFULeKc9Ffv8YuuYVfsn7VsL7ONoRhK+wJLi/K
 ZKFXwL4OuSyFSb24AkGznqkX4dG3DkvfIPS3gZOE5FfeRRO8Gk8TGf3d7QEdJGKMbm3L
 Z23t46VOqW6NAfD+m5E79weKN+enV3RtNuWllq3GmFHRDgFVAIhuWKwIMQmORgcNWnVd
 X5aA==
X-Gm-Message-State: ANoB5pnFR5nHYmYCHAcvzmouE1W0DslDMoZs8BSYNmI53DFf5gHu5Z0I
 jTsuDrKil1IyodeIDOEBA+AsnYtX+s4lyA==
X-Google-Smtp-Source: AA0mqf6vLPr9Cfbo5vWy32XdSYKH6BJGMAQfM0wH3MoIuNcBUQq7zO6ZcrlK6nmfNdIVoZD6vw0v4Q==
X-Received: by 2002:a05:6214:451b:b0:4c6:a734:920f with SMTP id
 oo27-20020a056214451b00b004c6a734920fmr46750883qvb.19.1669835906644; 
 Wed, 30 Nov 2022 11:18:26 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 v23-20020ac873d7000000b003a606428a59sm1288298qtp.91.2022.11.30.11.18.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 11:18:23 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id l67so22874850ybl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:18:22 -0800 (PST)
X-Received: by 2002:a25:bcc6:0:b0:6dd:1c5c:5602 with SMTP id
 l6-20020a25bcc6000000b006dd1c5c5602mr61739204ybm.36.1669835902496; Wed, 30
 Nov 2022 11:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-4-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221123065946.40415-4-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Nov 2022 20:18:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjCS6q44XmTanu=R68GyuVECLa0B-1AFg1CUD_oV4DuA@mail.gmail.com>
Message-ID: <CAMuHMdUjCS6q44XmTanu=R68GyuVECLa0B-1AFg1CUD_oV4DuA@mail.gmail.com>
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

On Wed, Nov 23, 2022 at 8:00 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Add clocks related to display which are needed to get the DSI output
> working.
>
> Extracted from Renesas BSP tree.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -145,6 +145,8 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
>         DEF_FIXED("viobusd2",   R8A779G0_CLK_VIOBUSD2,  CLK_VIO,        2, 1),
>         DEF_FIXED("vcbus",      R8A779G0_CLK_VCBUS,     CLK_VC,         1, 1),
>         DEF_FIXED("vcbusd2",    R8A779G0_CLK_VCBUSD2,   CLK_VC,         2, 1),
> +       DEF_FIXED("dsiref",     R8A779G0_CLK_DSIREF,    CLK_PLL5_DIV4,  48, 1),
> +       DEF_DIV6P1("dsiext",    R8A779G0_CLK_DSIEXT,    CLK_PLL5_DIV4,  0x884),
>
>         DEF_GEN4_SDH("sd0h",    R8A779G0_CLK_SD0H,      CLK_SDSRC,         0x870),
>         DEF_GEN4_SD("sd0",      R8A779G0_CLK_SD0,       R8A779G0_CLK_SD0H, 0x870),
> @@ -161,6 +163,14 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
>         DEF_MOD("avb0",         211,    R8A779G0_CLK_S0D4_HSC),
>         DEF_MOD("avb1",         212,    R8A779G0_CLK_S0D4_HSC),
>         DEF_MOD("avb2",         213,    R8A779G0_CLK_S0D4_HSC),
> +

Weird horizontal and vertical spacing below...

> +       DEF_MOD("dis0",                 411,    R8A779G0_CLK_S0D3),

I doubt this parent clock is correct.
Based on Table 8.1.4e ("Lists of CPG clocks generated from PLL5"),
this should be one of the VIOBUS clocks.
VIOBUSD2 has the same rate as S0D3, so I'd use that one.

> +       DEF_MOD("dsitxlink0",           415,    R8A779G0_CLK_DSIREF),
> +       DEF_MOD("dsitxlink1",           416,    R8A779G0_CLK_DSIREF),
> +
> +       DEF_MOD("fcpvd0",               508,    R8A779G0_CLK_S0D3),
> +       DEF_MOD("fcpvd1",               509,    R8A779G0_CLK_S0D3),

Likewise.

> +
>         DEF_MOD("hscif0",       514,    R8A779G0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif1",       515,    R8A779G0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif2",       516,    R8A779G0_CLK_SASYNCPERD1),
> @@ -193,6 +203,10 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
>         DEF_MOD("tmu3",         716,    R8A779G0_CLK_SASYNCPERD2),
>         DEF_MOD("tmu4",         717,    R8A779G0_CLK_SASYNCPERD2),
>         DEF_MOD("tpu0",         718,    R8A779G0_CLK_SASYNCPERD4),
> +
> +       DEF_MOD("vspd0",                830,    R8A779G0_CLK_S0D1_VIO),
> +       DEF_MOD("vspd1",                831,    R8A779G0_CLK_S0D1_VIO),

While S0D1_VIO is a VIO clock, it is clocked from PLL1, which supports
spread-spectrum, unlike PLL5.
Again, based on Table 8.1.4e ("Lists of CPG clocks generated from
PLL5"), this should be one of the VIOBUS clocks.

Not that all of this matters a lot: all of these parents are always-on,
and I think "dis0" is the only clock where we care about the actual
clock rate?

> +
>         DEF_MOD("wdt1:wdt0",    907,    R8A779G0_CLK_R),
>         DEF_MOD("cmt0",         910,    R8A779G0_CLK_R),
>         DEF_MOD("cmt1",         911,    R8A779G0_CLK_R),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
