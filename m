Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073FBD24047
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566DB10E73D;
	Thu, 15 Jan 2026 10:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78B210E73C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:51:35 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-56378a18ba4so266983e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768474295; x=1769079095;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ki7PmTjePRuEfFjGffE5fBihup/8aCNWyf/0N1CI9Sw=;
 b=sRR+ZZm1rT62M9+ks8k1m/2H6luVmewjRiGr2GCdIcA2h09jclTqXgdajnQCouIEPK
 ByyicmtmGMZRwJRTtnjg5sITlyqMNYqYuPLyeQOsH6SrEL2VIP/H5dTc+4Bp3kX/p19E
 mhVxUWPIqvHFPSHZe+wzOW5fjEsT0EmTcQSS94KP8zUvbnO442UOndXzGDQZhZTuaWVa
 v7R2rK/aBN7fUIb1OWC6q52B5plOdHqmnV4rKKpiQedwtXBnMXP1liQoh/TeHV8PEKAe
 g1L16vXOCEChlzu5VRgYThVK9EY0YLE2zrgRJ+KiPxSJ0qUKw3ppnJpZH7UlLEGf7g9V
 xpwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpGeBoP8AFm0840e2egHF3Z4u3/CKn2aEJE52V4CHpxsXQ68EB20UW0fUsdCd2fYq/Xi/Z7RtfH8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj0nUd7V8yrZ+OmGTmT3aeGdQev6V2jllssIzzvMswKAXlOjyP
 cDlM5bzbtHrnJxs5t36WgXipNDryHck++C1OdSm0MuiXppDffQKQ5xl3w6kdoxTnOiU=
X-Gm-Gg: AY/fxX7Z6/uQVoIWVYcgMzivu8hkCqIguK3s0XYC45L6+xj4xxedSAvtRs5ESK20X25
 XDoiXRTgtotvQr6q6hSigMl4AMtjYu0gcUdWYaqopDKQMdHQrMQJ01wECDB3AYzEC7h5UoWVuIV
 epEKDyqNxF72H9cDFwBZE0dcl/UC45S5cn8vpbVuGVn7ZbhItrCvmVYy+ypcDau98X5MVdSeiQq
 7L7ZE1HZ09gUTCnWoKIeC8vzGSnmhthVmlvQLxgFGailLJecVEkUz1mn71cFREkPkvcS//1N/dp
 zz98TYM6IlYqRmtz4rwI+UjMrkY2ZR2We9MaGgraeprk2fqUrcgyPKKlwkCIOT59DGJTR7DWkq3
 zrajwdrxUe1RFLyWx+TCaHJWQ6ECSbIcRH4EJS3N0IhKF8QhhoVGxw7oz9I2ZCta4E7H7R647qO
 tW6c7+ojs94LjMuSkh2suoKbg8+zisak98INqZ5Hq3BODf+FQ+
X-Received: by 2002:a05:6122:3114:b0:563:4d66:359c with SMTP id
 71dfb90a1353d-563a08046eemr2173114e0c.0.1768474294538; 
 Thu, 15 Jan 2026 02:51:34 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5636106e953sm19865725e0c.8.2026.01.15.02.51.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:51:33 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-9371f6f2813so245697241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:51:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6LiD0zDtU3UHFvTGdso0yvbj2QlvudjwI/v1FY3VJaSmkK+MsYUycSTfKNci+wEfAz3K1YNHNk0Q=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6887:b0:5db:e851:9389 with SMTP id
 ada2fe7eead31-5f17f3f875bmr2192851137.3.1768474292003; Thu, 15 Jan 2026
 02:51:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
 <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
 <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
 <TY3PR01MB113463EE3F22A0E0E6C97DC40868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVP4M6mS6itgN13QG_w7rxUo6wUbA2cbWU38=vPA0XLhw@mail.gmail.com>
 <TY3PR01MB11346DB362955A62D2A2E828A868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346DB362955A62D2A2E828A868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 11:51:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmzxO1A-7OBdcEmkOY3XNZ9hh=13wfcOrh+A8+Au0kGw@mail.gmail.com>
X-Gm-Features: AZwV_QhxPxYEyoRCedfJ4RqRUDbD--3dA-NRn1itW-sJznM5g4jpJVdKBvOoCkI
Message-ID: <CAMuHMdXmzxO1A-7OBdcEmkOY3XNZ9hh=13wfcOrh+A8+Au0kGw@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas, rzg2l-du: Add support
 for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 "magnus.damm" <magnus.damm@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
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

On Thu, 15 Jan 2026 at 11:34, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 15 Jan 2026 at 11:10, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Thu, 15 Jan 2026
> > > > at 08:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 3 Dec
> > > > > > 2025 at 14:42, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > > > On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > > > > > > > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > > > > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a
> > > > > > > > > Frame Compression Processor (FCPVD), a Video Signal
> > > > > > > > > Processor (VSPD), Video Signal Processor (VSPD), and Display Unit (DU).
> > > > > > > > >
> > > > > > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > > > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > > > > > >
> > > > > > > > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > > > > > > > and 'renesas,r9a09g047-du1'.
> > > > > > > >
> > > > > > > > LCDC0/1 but compatibles du0/du1...
> > > > > > > >
> > > > > > > > What are the differences between DU0 and DU1? Just different
> > > > > > > > outputs? Is the programming model the same?
> > > > > > >
> > > > > > > The hardware configurations are different: these are two distinct hardware blocks.
> > > > > > >
> > > > > > > Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and
> > > > > > > 9.4-1 (LCDC0), the only difference concerns the output, but
> > > > > > > this variation is internal to the hardware blocks themselves.
> > > > > > > Therefore, LCDC0 and LCDC1 are not identical blocks, and their
> > > > > > > programming models differ as a result.
> > > > > > >
> > > > > > > In summary, although most of the internal functions are the
> > > > > > > same, the two blocks have output signals connected to different components within the SoC.
> > > > > > > This requires different hardware configurations and inevitably
> > > > > > > leads to different programming models for LCDC0 and LCDC1.
> > > > > >
> > > > > > Isn't that merely an SoC integration issue?
> > > > > > Are there any differences in programming LCDC0 or LCDC1 for the
> > > > > > common output types supported by both (single channel LVDS and 4-lane MIPI-DSI)?
> > > > >
> > > > > Dual LVDS case, dot clock from LCDC0 is used in both LCDC's.
> > > >
> > > > For the single dual-channel LVDS output on LCDC0, or for using two
> > > > independent LVDS outputs on both instances? How is this handled?
> > >
> > > Dual-channel LVDS output on LCDC0, we use the data from LCDC0.
> >
> > That's the "dual-link" case below? But that case doesn't use LCDC1 at all, so how can "dot clock from
> > LCDC0 is used in both LCDC's" be true?
>
> That is a typo. Sorry for that.

Np.

> > What am I missing?
>
> Dual-link case, LVDS_TOP_CLK_CH0, LVDS_TOP_CLK_DOT_CH0 used to drive both the LVDS channels.
> In this case, the clks LVDS_TOP_CLK_CH1, LVDS_TOP_CLK_DOT_CH1 are not used.

These are clock inputs to the LVDS module, hence do not matter for
programming the LCDC?

> > > We have the following use cases:
> > >
> > > Single-link(ch0 only):
> > >   This mode outputs the image data of LCDC0 to LVDS (ch0). In this mode,
> > >   LVDS (ch1) is not used.
> > >
> > > Single-link(ch1 only):
> > >   This mode outputs the image data of LCDC1 to LVDS (ch1).
> > >   In this mode, LVDS (ch0) is not used.
> > >
> > > Single-link(2ch):
> > >   In this mode, the image data of LCDC0 is output to LVDS (ch0) and the
> > >   image data of LCDC1 is output to LVDS (ch1).
> > >   Since LVDS (ch0) and LVDS (ch1) are not synchronously related, they
> > >   can be output in different image formats and can be operated asynchronously.
> > >
> > > Single-link(Multi)
> > >   In this mode, the image data of LCDC0 is output to both LVDS (ch0) and
> > >   LVDS (ch1). LVDS (ch0) and LVDS (ch1) operate synchronously.
> > >
> > > Dual-link:
> > >   In this mode, the input image data from LCDC0 is separated into Even pixels and
> > >   Odd pixels, and the output is distributed to LVDS ch0 and ch1.
> > >
> > >
> > > > Don't you need a companion property to link them together?
> > >
> > > Yes, We use companion property for Dual channel LVDS(Dual-Link) use case.
> > > >
> > > > Is this similar to dual-channel LVDS on R-Car E3 and RZ/G2E?
> > >
> > > Yes.
> >
> > OK, "companion" is in the renesas,lvds bindings, which are not yet updated for RZ/G3E? Do you need it
> > in "renesas,rzg2l-du", too?
>
> Not required. Without that it works like RZ/G2E.

Hence the two LCDC instances are identical and independent, thus can
use the same compatible value?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
