Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27867D0BE8C
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C843610E928;
	Fri,  9 Jan 2026 18:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D2210E928
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:44:14 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-944168e8c5fso2510126241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767984253; x=1768589053;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRHLGasfyR69c6srR1G3LqlEAk+Zi7+IjINLOavqaCU=;
 b=vHsjvV+Y99TXDJBt05YmcqrQhMwMWnkohWheMWuHW6X8bUg0l+W8vE3kVAAJtdrlO+
 lbmbDbwsamkLb2TDTXlijlPJYwd77w3xR4Unhk2sZ/BLS2TkqCnERIyfpxuhvUImgk/n
 //MkRcRUWUIEIY7gE28P7+LpOgAGA6t28f/b2Q8lWq5Vmai1MleU+KmyGjDFs7WqdUFW
 Aztcnvi/YppdycSX3IBBMwlWBixxE8BkB1lxJEarV5+2nYljnIn58e2PeYJvVz7N6J7t
 R3gNnz+jp0zuM2kVHoXF+KA7UhaAzl2GxBlPADBEYTza5oLWNtFPBUcj8QtNOewJG/30
 HPCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJdZx2LutbDgFmK2z8Utq8QOjeDfwCKMHAkMa8eEEfxDKh1eARCX1JD7pJscACNgwPZKQUcI4emWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp/0+8uMqWqzMSxwB2mamNsasNnwoZpl0n9qn5hQruAX2yIaYo
 d9LatPepxP6WYNVYmnNsRrRmP5Udbp3fQtjomID4m4BLj7s5SUq3SArCJ5RgcmDr
X-Gm-Gg: AY/fxX56xe1jENt3+OGr7LxHLHxn7ugwyOCGy1ttSGpHDuq1aLxCABHDTJcPLxbhJVT
 HyhgQyTP3tjtpQsQAFBGb6y9ykpmMV3uh0pnkNfZ9ljuMqP4IxUyPCX54ngPmlbUqZnNm53sn1v
 lUEGxYturJR4V0I0B/zyC4h7Hi/OlPQBj3F3tVmfR8nm3HCNpbtLmEsdx9O2pGCxzhYhf/9+sYj
 L5wWIcbsDMxDsONJ3kBNoWaM2+hk9jU+AmVjmipIfQdKoSCcWoC0MkPCOGCmGwIfJoFX4+JQR9m
 mJ1T7z13gwB2VpxOXNCUh1silDsA91aAt+I8jo+t6Beu6JlV0cmMV3ORjZz+XXoL+233AfF1zB6
 qi9JEXx74WI7lTklZ3Bezk5GQwsY88GsAp0p6ZHweQXXWIOaaVdGC5PhvzbKQi2dKMVQdgrLXV5
 T1fcBu5lJ6f+iHVLigeMOvJQ4C38hEbh4nWwZktrpZr/DwcUVZ
X-Google-Smtp-Source: AGHT+IFHt+IDnwUfuIrUyUeY69sHAdIfcnO78+l24rSWJdA7p8hBMHvkqTepBz35qUtBbW80ZU+APg==
X-Received: by 2002:a05:6102:2c11:b0:5e4:95f6:3dca with SMTP id
 ada2fe7eead31-5ecb69647c9mr5146085137.30.1767984253146; 
 Fri, 09 Jan 2026 10:44:13 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec772e322asm10640840137.13.2026.01.09.10.44.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:44:13 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5eb8f9be588so4004052137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:44:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/CvMHAQUzF9O7d+K1d5LasUL4MjPlZoH6Ih7HhTZkRLmLfCNfv7vHq/rTHxER4rnat03oyhCoTDE=@lists.freedesktop.org
X-Received: by 2002:a05:6122:459a:b0:563:6d01:a514 with SMTP id
 71dfb90a1353d-5636d01a684mr805296e0c.17.1767983883673; Fri, 09 Jan 2026
 10:38:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <f7130b18f20fe80f4187cf0b024dc10438f2820e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <f7130b18f20fe80f4187cf0b024dc10438f2820e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:37:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW74u0a7eKN_xS9hc6Y0GycGbnwF7170KjV5oNi3QnY2Q@mail.gmail.com>
X-Gm-Features: AZwV_QjTECnB1PZN8BE8Sxq6bqzf7JgBJC7TEeRima6lECENgoL1jMbZT1RrYiI
Message-ID: <CAMuHMdW74u0a7eKN_xS9hc6Y0GycGbnwF7170KjV5oNi3QnY2Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_CSDIV clocks
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

On Wed, 26 Nov 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
> the r9a09g047 SoC clock driver.
>
> These clocks are required to enable DSI and RGB output support.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
