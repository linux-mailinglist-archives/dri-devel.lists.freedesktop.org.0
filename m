Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D74BB0515
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 14:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F4510E066;
	Wed,  1 Oct 2025 12:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iIqxgl1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DF210E066
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 12:23:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-46e317bc647so46390055e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759321424; x=1759926224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBGrabJtd45mAFEOoJqVzc2XuZnoyBrQ0XCWSCj9+dc=;
 b=iIqxgl1RePzqjsmbwgNRA7kFlhd0kCnZ3Ri+RJtjQ66sANdLZ9Tb0pyjBDb2gE8uIa
 Lwu4G+T2qoMjceOmwUvVpu/7i8E8puiCIXleAVqzIRcWIWIarKlk+smbQ2+XH2RhGjVn
 PEaaBzJ71apbp0gJ5PW2G0lTI1o0ZbGL33MRFt+JdUMskQwBflyXpV8VwomaQ9j+knq8
 LZhEAYUM5FezQZnzTYFUKUHuxEOHyk7jCxkQhaklS4jqKOxIwZzPJdfewbNAWbmO8jLs
 bBBXGFKtSUvwH/8qSHd/IDa5pJWhcndi8Tmefq/OasCZyv0EMDtf2agf+o+kJzVaRmJ/
 lFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759321424; x=1759926224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBGrabJtd45mAFEOoJqVzc2XuZnoyBrQ0XCWSCj9+dc=;
 b=MR1aL5pRUxhRPiCtj8OKqvepUEKyE7/xjZKbZ0HDvEBO89nWxGTXliEtYjztzFeY00
 pEvgBws3k/WhlbRgt3dml1zoeqz8taHYThF2qGDDBkju8GlnrAiQirBbRfacN0whq065
 rwROagRPhjeacpBnzvnfJKUq/eX/HGOJ90bxuQVYOmoUdEU0ZbX6fBpCrzR56LYlmq9s
 Yju5RoZKp5wyb6fRw/BC5BD0+SxJ25Ngz2pYTCEy3zkZI4944gqs3OzQUngtaGXoO1bp
 dR2t9o2+T/Rp8cFotq0eCOkYrrGDm/L9YHxC1CLZBb/c48YPfYBnHIyDiR3g02t/puRn
 v5sA==
X-Gm-Message-State: AOJu0Yx2iTei+Onpbi/o+yR+UBOFa80ZZdqpht+iXWYH5EsMJusQfc9G
 hwzjWQchBStygIjG5vYo3rKeU8eURfz035mnhhrz71ujznJOh4MmrAtXwWozYBBrz1JSYWYvmKz
 L5BIcT1/6k/u0d5LsJeTm9QG14d0YuDg=
X-Gm-Gg: ASbGncvjwT38GqHUdo4ClHxu9fx8vW2N6kuh/kWXdEm5hIFI4wY1CUQkpP14mrQ3GZI
 1GOeVmf4hBQqu/5WTibQ3pF0yoIYOG+ZP6sNnPSWAhxMV/+nxzE9N7xgo0XJWF/J+q+yybHGNNR
 5T7jY8YpgZarhHUUjIu+fsQCwMpWE6CLn1HkqLmsP2XBJlI+mRiafeUO7mSaUy0jvFRFaduf98V
 xMjUAtUOK+PuMHBYbY0xqMuqPr4bj6o
X-Google-Smtp-Source: AGHT+IG6w9L1LgThnpefnQm9I8OUIomLSyIMrWw3z8rhw6qFvyxmd8vXZTGsJ+SjoSiCjhbCQK0VPlSPMN9tMkkTwbU=
X-Received: by 2002:a05:600c:820c:b0:45b:9afe:ad48 with SMTP id
 5b1f17b1804b1-46e6127a4bemr35253245e9.16.1759321424233; Wed, 01 Oct 2025
 05:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
 <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
 <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
In-Reply-To: <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Oct 2025 13:23:17 +0100
X-Gm-Features: AS18NWAI4MLtfZreV3_pLNGPAC-_jcQVSy6mD_NW1R1LCvbGTlMIsTFaxBIK_zI
Message-ID: <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
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

On Thu, Sep 11, 2025 at 3:26=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 11/09/2025 11:14, Lad, Prabhakar wrote:
> > Hi Tomi,
> >
> > On Wed, Sep 10, 2025 at 1:30=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >>
> >> Hi,
> >>
> >> On 03/09/2025 19:17, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Add support for PLLDSI and PLLDSI divider clocks.
> >>>
> >>> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and shar=
e
> >>> PLLDSI related data structures, limits, and algorithms between the
> >>> RZ/V2H(P) CPG and DSI drivers.
> >>>
> >>> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slig=
htly
> >>> different parameter limits and omits the programmable divider present=
 in
> >>> CPG. To ensure precise frequency calculations, especially for milliHz=
-level
> >>> accuracy needed by the DSI driver, the shared algorithm allows both d=
rivers
> >>> to compute PLL parameters consistently using the same logic and input
> >>> clock.
> >>
> >> Can you elaborate a bit more why a new clock APIs are needed for the D=
SI
> >> PLL? This is the first time I have heard a DSI TX (well, any IP) requi=
re
> >> more precision than Hz. Is that really the case? Are there other reaso=
ns?
> >>
> > Im pasting the same reply from Fab
> > (https://lore.kernel.org/all/TYCPR01MB12093A7D99392BC3D6B5E5864C2BC2@TY=
CPR01MB12093.jpnprd01.prod.outlook.com/#t)
> > for the similar concern.
> >
> > The PLL found inside the DSI IP is very similar to the PLLDSI found in
> > the CPG IP block, although the limits for some of the parameters are
>
> Thanks. As discussed on chat, this confused me: There's a PLLDSI on CPG,
> which doesn't provide a DSI clock, but a pixel clock. And then there's a
> PLL in the DSI D-PHY which provides the DSI clock.
>
> A few comments overall some for this driver but also the dsi driver:
>
> This hardcodes the refclk rate to 24 MHz with RZ_V2H_OSC_CLK_IN_MEGA in
> the header file. That doesn't feel right, shouldn't the refclk rate come
> from the clock framework with clk_get_rate()?
>
From the CPG perspective we could get the info with clk_get_rate() but
from the DSI part we can't. So to keep it consistent I will keep this
macro as is.

> While not v2h related, I think it would be good to have a comment in the
> dsi driver about how the g2l hs clock rate is derived directly from the
> pixel clock.
>
> I still don't see why all the code here has to be in a header file.
> Usually headers contain only a few lines of inline code. Is there a
> reason why it's not in a .c file?
>
Ok, I will move the functions to rzv2h-cpg.c and export the symbols
and have the declarations in include/linux/clk/renesas.h.

Geert are you OK with the above?

> And last, we discussed the milliHz a bit on chat, you said you'll come
> back to that. I don't think it's a blocker, but I'm very curious why
> exactly it is needed in the DSI. +/- 12 Hz with, say 3.6GHz clock does
> not sound very much to me, and there should be enough time every line
> during blanking period to empty any fifos and "catch up".
>
> In fact, if the DSI is so picky about the rate, I find the HW design
> odd: in g2l the pixel clock and the DSI clock come from a single source,
> which keeps them neatly in sync. If that is required, why change the
> design here so that the DSI PLL is independent of the pixel clock, yet
> still the DSI PLL must be programmed to be exactly matched to the pixel
> clock.
>
As discussed on irc we have to live with mHz solution as the HW is picky.

Cheers,
Prabhakar
