Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201FBBE2BB8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3124510E9A9;
	Thu, 16 Oct 2025 10:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBAB10E9A9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:22:35 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-58de3ab1831so376214137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 03:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760610154; x=1761214954;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1WKEJk9GAlT5x9p34JfYLH5DFWeYxL1lhRGvXGKo5M=;
 b=JtdZisQGjWB7DwOCsEtYWnowWPv1Cm+QqmHlEIEvNli2iSA0BYdCqfgsuQPnTnz/5V
 AYEzW8ALZYuGBrMs09jjxLgygjzTxkfCfoBuUbjmIEbL4K37p/RRtUebNEIKmcqwYpxm
 BHeIHCI6/zjhSCGB82bKvRg7B99FCK6MVGsYJBKZYsvEyaYvUZOuzw2TQb/dH6ls5Wfv
 /1GgGXR3uHPefqJo6inXpoc8n7yArlBaU1ikmaOsVGi4VoWCJSm13ZNbuKQTFtsS6uvY
 2gkWekXJofGMpTUNkXhl/2pAbMJvznzNnFCxTDOHCqbKGbF0WMUy7kb75etlNrrdVbib
 gSbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgRg3/+TsCMbk4HQ8UhWVQ3oyADySjajMNfcIw3bylvF02/qCxZYv9PQaa1ISfJemedyN8OOq3x94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynQ960x3IA2CSR3MsGbexJFvLhtrBlaMNQOhZCFkueQ2vEu+JJ
 kmWfpikuEg1v2HyYhK5K/OctD/xEfC6BynGBonqi9Hj2Ypf74P0nBpU7QQPQObHv
X-Gm-Gg: ASbGnctnVyceKdvN2k8z/j7NX6SSnnmOvgrh1BpGM7Nwvcif1px0nQJvjYUIYTQFvNV
 SEFQAbBeA7ErUdoTshuIrerkO5zsd5+sBu8AsDUWPx+Kup9YMnQmtCwMsYX1TqIWLkFbTa9kiQy
 LEN3iVBlCc/dCMDCG9N607pkoKdQmytyWpP5eUjS79tOlZnuDLw3N8cNGBpUMOCYZIuxVq45pIL
 vNJV4/4r7+P1MPensyj4Is+ctKm+WbHW2QSYZ3z/rHOHPp/HtYv+nIT1Nigai7/SAOndBojtr5V
 sertALs4r9cD3wt0JU5Sa7pl45kKB2DPN+287fB4EpFafzAox4H+rRTrFrZO3gr/djK1TXxZ8LF
 +ij4LklLcBv1IMd9zrx6ulwurkSX6IHe3BbPwygS+GdK5xdL80jeIpBmjC4PdlILtXUx518nPOV
 l8YDQtUYcIzFlXvop2VKZGjsrd9SnHCW6a5WOozTIG9PNnRvmh
X-Google-Smtp-Source: AGHT+IFwfxdcgwZdkcK+iNYiICcn4idTAa/lTCUYWs0z8df4sj04d7iCVk+ACgU59ABXhlQVnfqCMg==
X-Received: by 2002:a05:6102:1516:b0:59d:2396:18fb with SMTP id
 ada2fe7eead31-5d5e23abc8bmr12260744137.25.1760610153762; 
 Thu, 16 Oct 2025 03:22:33 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-9310a61e326sm128581241.7.2025.10.16.03.22.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 03:22:33 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-930ff50d181so370003241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 03:22:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQlMgiY1610lBZKkAASSHpf28ZRslm4lWG2Vd9OIAHQrRGtrF6QDh0hcxXkZs44uxePNR7XOu1wzU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1516:b0:59d:2396:18fb with SMTP id
 ada2fe7eead31-5d5e23abc8bmr12255783137.25.1760609708606; Thu, 16 Oct 2025
 03:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
In-Reply-To: <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 12:14:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
X-Gm-Features: AS18NWDOKj2jdUygVapjf0YY-lv6XkkQZ-xgi_PclRkP3UIDiy1yQHHau3vXzwU
Message-ID: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

Hi Marek,

On Thu, 16 Oct 2025 at 11:48, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/25 10:22 AM, Geert Uytterhoeven wrote:
> >> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> >> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
> >>                          resets = <&cpg 408>;
> >>                  };
> >>
> >> +               gpu: gpu@fd000000 {
> >> +                       compatible = "renesas,r8a7796-gpu",
> >> +                                    "img,img-gx6250",
> >> +                                    "img,img-rogue";
> >> +                       reg = <0 0xfd000000 0 0x40000>;
> >> +                       interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
> >> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
> >> +                                <&cpg CPG_MOD 112>;
> >> +                       clock-names = "core", "mem", "sys";
> >> +                       power-domains = <&sysc R8A7796_PD_3DG_A>,
> >> +                                       <&sysc R8A7796_PD_3DG_B>;
> >> +                       power-domain-names = "a", "b";
> >> +                       resets = <&cpg 112>;
> >
> > status = "disabled"; ?
>
> The GPU is always present in the SoC, similar to IPMMU/GIC/DMA/VSP/...

These are special, as they are linked from other devices.
And everything needs the GIC.

> which are also never disabled, do we want to disable the GPU by default
> and enable per-board ?

Yes please. We do the same with renesas,*-mali GPU nodes.
The board may not even have graphical output.
Or do you envision using the GPU for more general and headless operation?

> I would argue the GPU should be enabled by default, so the GPU driver
> can do a proper power management of the GPU. If firmware is missing, at
> least power it off on failed probe, if nothing else.

The *_PD_3DG_* domains are powered down anyway when unused.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
