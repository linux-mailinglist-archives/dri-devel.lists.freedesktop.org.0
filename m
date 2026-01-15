Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DDD23F06
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883A910E023;
	Thu, 15 Jan 2026 10:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0321510E023
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:29:56 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64b9dfc146fso1263079a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472994; x=1769077794;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqR8XdDFFIIFkcmLBykQTFX9t5bxqI0RceWqMGx+9nY=;
 b=pjpIsK+Mb3k9VTLi5bV0XdQUi7lCEknmtcWxYW7QTpqDqpT1EaZ2nuaaqfFp4trzxF
 lb57XWOj7/dY+aPElgeK+Mwas2WpXV+BKZ+Ogifgu4miYvkwj22fBSa2ANly+jZ2c0tL
 y9yb8joDoMP7xP1CCGT6U0fNlJLyLzuglISPMjydShgTwkvOUXwo9fc/P0jQWbma6GD6
 1C/SgGCbChoq6981ZR8VJn3/C+0TMJG6Q1dkUvkSL26bbwNQBmJnq6gV04VARJpKn1De
 cNZ/BCBNVLeCX2KJzZJws7wLEvwpZGTSxJcCXoCtxbVZvg7fE23VaBd4Veej4p8ilNQD
 rWEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8jPs1Zf6wm77Fq6xTWt+W2Uko7Ijl9yO9s1o5bLA+bujaziB1T4AVqZTaWTdVxhPFs+XMncJq07A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK+Tj6x/wLbfb4utduwVMf3/1LlqiddQjCTBkvCH9MYWE6y/n4
 acBGNeZtVUoUOhpurSa2pAAPiuqFDOjvIn+sB4FV3yGSLDpMQSfAX99o5v2NsswJFCE=
X-Gm-Gg: AY/fxX7tLKQ6LEA/OCgNaka+OOqMzDKMmeBQ1DfW8HtTdWyxYvyfsCdPgc9+bNDBNAs
 tYawNAaYTUKQEXQPg88wn3ceY+2t68mTpAl/nCtUbRjivRaV96da67Y5aUGvVn9RvxwT7Q+Kg46
 Op6AsLK7UKMYKp1TsuLAxCaQpxZMcOiQqsUqF5DO6kkmV/8YXtBnOFiuew9kXktvJx7afj2X7lN
 JNXP3WyHmeNb+iBnVDr6FskCyF3fNAe4LPxC99arTgqBhsvYpicsjHKH7YGQeWBy1UlLZz8uMWT
 mLjGG9D+hzhdVZbyTI1+PdAWLuACvNZaKgJSeDHddynkdvwcf2YaOBSyABrMvPYlIN4sgH+EXyR
 MSgmhBePPBx41428Cj96T3ByWYmngTDDcVtB/wbivHpfn3yDVjtauK1m9OgtSswi/Lspre2G76b
 7bHA5m3HFgCFCJrhm1+DatvOkbXr6nGT5F0boIcTrF8mRQzViz
X-Received: by 2002:a05:6402:274b:b0:64d:4149:4924 with SMTP id
 4fb4d7f45d1cf-65412e2409cmr2500014a12.4.1768472994336; 
 Thu, 15 Jan 2026 02:29:54 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541209c71esm2057568a12.33.2026.01.15.02.29.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:29:53 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b86f81d8051so118755266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 02:29:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPIHV5l0akywWKbGgGH3lwpOQETRDdnNlBC4QfbYZQcdgFsGGdDUSTnezNQ6bSwsynT7z+ow0vU2M=@lists.freedesktop.org
X-Received: by 2002:aa7:c2c9:0:b0:64a:86db:526a with SMTP id
 4fb4d7f45d1cf-65412e18d72mr1612333a12.4.1768472535836; Thu, 15 Jan 2026
 02:22:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
 <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
 <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
 <TY3PR01MB113463EE3F22A0E0E6C97DC40868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113463EE3F22A0E0E6C97DC40868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 11:22:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVP4M6mS6itgN13QG_w7rxUo6wUbA2cbWU38=vPA0XLhw@mail.gmail.com>
X-Gm-Features: AZwV_QhQwMICcWnKjFrMx3lNkRtKNznFCujSIJRMO0ecc8R3fUkTKRJSiViAt_Y
Message-ID: <CAMuHMdVP4M6mS6itgN13QG_w7rxUo6wUbA2cbWU38=vPA0XLhw@mail.gmail.com>
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

On Thu, 15 Jan 2026 at 11:10, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 15 Jan 2026 at 08:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 3 Dec 2025
> > > > at 14:42, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > > > > > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame
> > > > > > > Compression Processor (FCPVD), a Video Signal Processor
> > > > > > > (VSPD), Video Signal Processor (VSPD), and Display Unit (DU).
> > > > > > >
> > > > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > > > >
> > > > > > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > > > > > and 'renesas,r9a09g047-du1'.
> > > > > >
> > > > > > LCDC0/1 but compatibles du0/du1...
> > > > > >
> > > > > > What are the differences between DU0 and DU1? Just different
> > > > > > outputs? Is the programming model the same?
> > > > >
> > > > > The hardware configurations are different: these are two distinct hardware blocks.
> > > > >
> > > > > Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and
> > > > > 9.4-1 (LCDC0), the only difference concerns the output, but this
> > > > > variation is internal to the hardware blocks themselves.
> > > > > Therefore, LCDC0 and LCDC1 are not identical blocks, and their
> > > > > programming models differ as a result.
> > > > >
> > > > > In summary, although most of the internal functions are the same,
> > > > > the two blocks have output signals connected to different components within the SoC.
> > > > > This requires different hardware configurations and inevitably
> > > > > leads to different programming models for LCDC0 and LCDC1.
> > > >
> > > > Isn't that merely an SoC integration issue?
> > > > Are there any differences in programming LCDC0 or LCDC1 for the
> > > > common output types supported by both (single channel LVDS and 4-lane MIPI-DSI)?
> > >
> > > Dual LVDS case, dot clock from LCDC0 is used in both LCDC's.
> >
> > For the single dual-channel LVDS output on LCDC0, or for using two independent LVDS outputs on both
> > instances? How is this handled?
>
> Dual-channel LVDS output on LCDC0, we use the data from LCDC0.

That's the "dual-link" case below? But that case doesn't use LCDC1 at all,
so how can "dot clock from LCDC0 is used in both LCDC's" be true?
What am I missing?

>
> We have the following use cases:
>
> Single-link(ch0 only):
>   This mode outputs the image data of LCDC0 to LVDS (ch0). In this mode,
>   LVDS (ch1) is not used.
>
> Single-link(ch1 only):
>   This mode outputs the image data of LCDC1 to LVDS (ch1).
>   In this mode, LVDS (ch0) is not used.
>
> Single-link(2ch):
>   In this mode, the image data of LCDC0 is output to LVDS (ch0) and the
>   image data of LCDC1 is output to LVDS (ch1).
>   Since LVDS (ch0) and LVDS (ch1) are not synchronously related, they
>   can be output in different image formats and can be operated asynchronously.
>
> Single-link(Multi)
>   In this mode, the image data of LCDC0 is output to both LVDS (ch0) and
>   LVDS (ch1). LVDS (ch0) and LVDS (ch1) operate synchronously.
>
> Dual-link:
>   In this mode, the input image data from LCDC0 is separated into Even pixels and
>   Odd pixels, and the output is distributed to LVDS ch0 and ch1.
>
>
> > Don't you need a companion property to link them together?
>
> Yes, We use companion property for Dual channel LVDS(Dual-Link) use case.
> >
> > Is this similar to dual-channel LVDS on R-Car E3 and RZ/G2E?
>
> Yes.

OK, "companion" is in the renesas,lvds bindings, which are not yet updated
for RZ/G3E? Do you need it in "renesas,rzg2l-du", too?

> > On these SoCs we have a single combined device node for all DU instances (which comes with its own set
> > of issues, e.g. Runtime PM and Clock Domain handling).
>
> But in our case, it has 2 separate independent LCDC IP's to allow all the possible outputs as mentioned above.
>
> > > Standalone LVDS and DSI the programming flow is same.
> >
> > OK.
> >
> > > > Of there are no such differences, both instances should use the same compatible value.
> > >
> > > Then we need to use a property called display-id, to describe the
> > > supported output types in bindings, right??
> > >
> > > Display-id=0 {LVDS, DSI)
> >
> > LVDS twice?
>
> LCDC0 supports DSI and LVDS (single or dual-channel) outputs.

That's two ports for LVDS (i.e. "twice"), right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
