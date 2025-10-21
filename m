Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C2ABF5C69
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51DD10E2EC;
	Tue, 21 Oct 2025 10:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB7D10E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:26:22 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-54aa6a0babeso5233667e0c.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 03:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761042382; x=1761647182;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tDNH9pDF9LBAisWYpnrCUtwA+9hrIVu2UeAytlJC/r0=;
 b=fC/4+VxZTu95vbB6wshhvbljPP6k3bA1xYEUhNiNCJ1rBG8ykQ8TjCe0nmHjd2K7Zh
 H8Y/ULX9wymy1kAo9xt2iYi3oHsQG+NImm3GBKbW6jCkQD+Lv1WfGwodxNzEC0pne0tf
 XOXQj/JSUd8UOFpV9NdKZryiJxtgQnq4Jg7oCv8Hehvj1PBO2OYyIJRxhc2Ep+/AGJbc
 T6vVPdeQUwhjjkPqMVW67gk/N23deSgikuXC+TZLAfEwKa2tbiU1CD34s9dOtz5Hvavb
 CW3sQ0wPHfaOvpWonjmEmEtuKX0lFVTPLYzjb+iNQ3t+/6TZd2niNEaER3xMY6AkRyZj
 mtCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX+cSlSRO1b17I+UTcvyfyjJ4fKkJztG8mjVLAPCYPr83mWvxfdkouSeYP/yR4QXueeNGUTYgeibs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIDfIY3eUtvoSldm7LWTcajmbTQBxzYj7nmk7JNnXLQyTR31Nw
 reVVT/u1+D3idTAox4u7vznBBCqxWT8bUfVlls95cA1Oje6YJoqRWdreSeGwvC1r
X-Gm-Gg: ASbGncuTUxYk4WZ0GrOndY9hr3w70Lkl7AFqOynbdgs0TrGm+a0seMqUPg2vy5IQXcq
 EBkbifj0eOZ0yrNbQkODrQyRBj70eX12hgoLjiTZMO5UYyYmcrn/BevKmsaq1PbN8Mj2HXKZ+jb
 l7OiEu7IIkTcvaMrE0S1x8qmsDTDSTC/HA3e8kZgbd8uh8ugG8gdfoKeB14vF0O48nGlhTiofT9
 1E8lwnIE3cdB2bq3nosCaySzhCDC5ViwWB8Eq9a9//CS4rd91Lla0r21VjztIci8s/etrv6hoK8
 1rMT5q1CsHGoCDSc5PGG75WH6ZOroCd2J0/r6a71JNEfRe/iu7pgmbn5SDM1hN04s6/EodWbH6S
 XAG1m/KBBnLNe1CbTNulCxKkA/lkly5CxJkGZ91cgZl3SJ/bgeepJqhvILrkAHmAdOns/oKsXlV
 gRgamlZse+c9BY4pJZuakRin6wH5IGLNXO7MojZSUIEiEic+NT
X-Google-Smtp-Source: AGHT+IE+aRgQ9KwTD/dLapyH/QsApiS/RFhrYAQMi1pQcJ88JlspBz7RYw/M8F1qeYKtdK+Hm0/dIw==
X-Received: by 2002:a05:6122:1e01:b0:54a:a3b1:db63 with SMTP id
 71dfb90a1353d-5564eedc60amr5256527e0c.6.1761042381590; 
 Tue, 21 Oct 2025 03:26:21 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-556620d8cfbsm3186108e0c.20.2025.10.21.03.26.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5d5fbfca7e2so4549608137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzYTzP4pY9xghenMV8yKzsxxi3KPXxnHIezIpv3xiVlqEdMJYugDZJ2TWUPBC/D/oKKcjx/Gy/ZBs=@lists.freedesktop.org
X-Received: by 2002:a05:6102:e08:b0:529:7c2f:ceb5 with SMTP id
 ada2fe7eead31-5d7dd5035afmr5261434137.1.1761042379969; Tue, 21 Oct 2025
 03:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 12:26:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
X-Gm-Features: AS18NWA5TDVRnTdlKeYEusciZZnf69CtVCQ6CEB6928Ztx_Tex5oqUI1hZkbQkE
Message-ID: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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

Hi Prabhakar et al,

On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This patch series adds DU/DSI clocks and provides support for the
> MIPI DSI interface on the RZ/V2H(P) SoC.
>
> v10->v11:
> - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> - Updated rzv2h_cpg_plldsi_div_determine_rate()
>   while iterating over the divider table
> - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> - Added Reviewed-by tag from Geert for patch 2/7 and 3/7

I think this series is ready for merging.

> Lad Prabhakar (7):
>   clk: renesas: rzv2h-cpg: Add instance field to struct pll
>   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
>   clk: renesas: rzv2h-cpg: Add support for DSI clocks
>   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
>   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
>     RZ/V2N
>   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

As this touches both clk and drm, let's discuss the merge strategy.
My proposal:
  1. I queue patches 1-3 in an immutable branch with a signed tag,
     to be used as a base for the remaining patches,
  2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
  3. The DRM people queue patches 5-7 on top of 1.

Does that sound fine for you?
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
