Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14139D23262
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0536810E6FA;
	Thu, 15 Jan 2026 08:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3219810E6FA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:32:54 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-88a26ce6619so5216586d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768465973; x=1769070773;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hVlaltCoWANklzhMp5xvIF6YsYsDq1BU+u4OGSDZeY=;
 b=oHeEdCunZJRP9/Qj3P9OlF0kAglH3aNYl4T2Sqwo4HwJpHyxcKQLKpM5IsKiEzKGHd
 Y+vm7bRghm83PFPpJfu0iZo8SG6GjWGuvFZ7PFjAqNwswQPf4x78Dc4CWJGX0tNKNVwX
 1n5x48DrSoyxLfW27D5JNZIEqfkeoMyAlAW8u7szh1y4b5heOYycH4Zm9179ZZnfuvrT
 vDwPOFXxdBVf+GYQBZh57KTNZrp6z7lhb4jd4jH9x73Ie/rdX5jSJ1EaCt0GLpJMxMKF
 rJoSZ5NrRLQGN6JLekZimo72PpGmBUeYmBtGnPvUpfimv2eCJMAsCD0CNWqCtk0D/mRq
 DupQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDuqV6MGvKeQfU9zve+Ry+JVHDlelRHq88rxgZRqqncr42Lcwcbq0V4iEVNCoxIdebjKYFO5yor2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgxooNhZezWqWEkcJ4gaVcvWEH4VyaQxUhWPYlNzSVQOD2CZvH
 XpsxbSR98cNGjqsRsasbguVklvVRQFDp1aXl+gk6RlC+bqiGRvXUCdsUq8kH14rf
X-Gm-Gg: AY/fxX7oKYPYK6tc/6yKkCMButR+uEUDM9bJVxp/acjwBqfLKNIwtL6TgYcGdRsuIXp
 LIyUvmOS6xJqqOTi2gVlvuwWNCouW9GZWx8LzLg9p8InugCYKErZ1Q+cpirgytjfB+r+B99cpat
 FWd9qP48GeKsyQctea+uc35EKGJVTVcMjE3/3+5BCZn9Y/SO5m6xe/RgPcp94XZpg0EInVaHgpu
 /zx7dtmwj66qoLKHCdeVgS7BWNBal0uGAb9pjWdz1AyCxxua5Som4YZ7LGQvmZksgVcJUGdj2Wc
 ADFy4k1sWxclDtkHI6NsRCl5mM2mFn2IrdB70lPHUtv14e9doRngL4oP+KvzX3iwEadgT8SIORH
 WBF7aejPVO698XqqQ0arRQWd+h5eUNxFAOfUoLSW63qUERQpl8Ls6TIoDAKVREX2YKTp51LZZhB
 2whUWQYOJIdny4E+baodaiI0DHboJJJEfrE1h3o+V5PDEfODPTpBFm
X-Received: by 2002:a05:6214:23cc:b0:88a:449e:81a2 with SMTP id
 6a1803df08f44-89275ae02admr64557126d6.4.1768465972798; 
 Thu, 15 Jan 2026 00:32:52 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770d2cf5sm194352906d6.1.2026.01.15.00.32.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 00:32:52 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8c0f13e4424so76416285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:32:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5ZWAcdnnct0O5ZoP6Vr10mCCy4ogh6Ggt9kpKbU2RYY0ocjvYcQqJQ9PqMDov9NTWVJTvAugX7WU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:304b:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5f183897017mr1662832137.8.1768465478084; Thu, 15 Jan 2026
 00:24:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
 <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
 <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 09:24:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
X-Gm-Features: AZwV_Qgxwq_ugUrK3ifMblmAkyp8fbq-QzkWqQkuoZnCA8EiRq61e2GRJHn8aQo
Message-ID: <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas, rzg2l-du: Add support
 for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
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

On Thu, 15 Jan 2026 at 08:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 3 Dec 2025 at 14:42, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > > > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame
> > > > > Compression Processor (FCPVD), a Video Signal Processor (VSPD),
> > > > > Video Signal Processor (VSPD), and Display Unit (DU).
> > > > >
> > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > >
> > > > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > > > and 'renesas,r9a09g047-du1'.
> > > >
> > > > LCDC0/1 but compatibles du0/du1...
> > > >
> > > > What are the differences between DU0 and DU1? Just different
> > > > outputs? Is the programming model the same?
> > >
> > > The hardware configurations are different: these are two distinct hardware blocks.
> > >
> > > Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and 9.4-1
> > > (LCDC0), the only difference concerns the output, but this variation
> > > is internal to the hardware blocks themselves.
> > > Therefore, LCDC0 and LCDC1 are not identical blocks, and their
> > > programming models differ as a result.
> > >
> > > In summary, although most of the internal functions are the same, the
> > > two blocks have output signals connected to different components within the SoC.
> > > This requires different hardware configurations and inevitably leads
> > > to different programming models for LCDC0 and LCDC1.
> >
> > Isn't that merely an SoC integration issue?
> > Are there any differences in programming LCDC0 or LCDC1 for the common output types supported by both
> > (single channel LVDS and 4-lane MIPI-DSI)?
>
> Dual LVDS case, dot clock from LCDC0 is used in both LCDC's.

For the single dual-channel LVDS output on LCDC0, or for using two
independent LVDS outputs on both instances? How is this handled?
Don't you need a companion property to link them together?

Is this similar to dual-channel LVDS on R-Car E3 and RZ/G2E?
On these SoCs we have a single combined device node for all DU instances
(which comes with its own set of issues, e.g. Runtime PM and Clock
Domain handling).

> Standalone LVDS and DSI the programming flow is same.

OK.

> > Of there are no such differences, both instances should use the same compatible value.
>
> Then we need to use a property called display-id, to describe the supported
> output types in bindings, right??
>
> Display-id=0 {LVDS, DSI)

LVDS twice?

> Display-id=1 {LVDS, DSI, DPI)

Not necessarily: if this is purely different SoC integration per
instance, describing all possible options is fine.

But I'd like to defer to Laurent for the details...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
