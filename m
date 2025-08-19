Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0EB2C498
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8741A10E172;
	Tue, 19 Aug 2025 13:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A82310E157
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:06:09 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-53b1740154dso3673536e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755608768; x=1756213568;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8XOdfZsHoyTBBC5eTa1c4VcrP/Xh4XLwdxd8CP9jAi0=;
 b=DMkkrZb1klXmKsRAJe0Sn3vAKMzlnqTGSstT1L1w3IczoIbuPttbhTtQ2Cgi3dr5TX
 pQK/chR4Hfg0FQ9/5ANCymXeaQj4EAuiAxS8AxgJwMkyH8akTmtydbN2l/a1KiME9nOx
 NBJNTfL7mGQXH/K0a5kVCAFouG/PCpYPk17t4Lg+BqDcLrjgvRuUweGKOxXurMGIS/3B
 /h3YPq6o6US9ltCSzaNOiEk/gnLp7F+YCTSnQYNyd4LaOW+xTcyjsQl+EoCHyMOhTaL5
 bi36pEvD0iealmcwqqNeLRH0gncv1ehcqbX3UOH4SPSVg2yPvEJE0PwW+7fAYi0v/eGo
 dxnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU8RrKV//W+wC4B0k564gHhmi5q/2CUevDA/0m2seJbjPGDj5g4vStlsSr4OApOm64n8Bqx+wr1ZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwz6gjcnDDciao/ObaTm2iuLGBh2wf7BKPpkSg9DniG81anHFB
 QT/UziPxwEwWkZWlgPG+jIqjT2KSiUn+GomBW2lJIzQZYbkc8YnfmwFul6p/vJAv
X-Gm-Gg: ASbGncsPkpYIllb6yMDf2bqnNvExi5r53V8QkXLY0QElYtnTJrRo8lRvbFh0b4Wo5Ep
 nluSl+hIvYwqTaBU1qDC2zLVmMyHMbNqHDUE2xv5EzZRXU7Q+U95W89+6SXCUC24SdLC1IjJSVu
 5MB5TVsg9JWgiTrTIhhrmYSHxIR2c19L3p4K2MallhPqCJGnUKxojG8DZ9tBReLod2qBIIznvt1
 DdKQyN6DfA/uqXFuZbHsvFmsVv3dEII2ehZiIMd4jlFcSNOuBH7mzm3MPrcYqvGj2BxOdk36mRR
 XHhALieTWqfBYqiMZf6YGRZzJAgP3DejBuxNi4397CMNsy5LWSmec7ZGFpzw5TJStn6riRvbNtk
 AoEc9dIjLpiWUDNSxKknMpM5Kmz1SMC8xOLqA/Ky18N/g7Qr8ks9mun2ivPUz
X-Google-Smtp-Source: AGHT+IG9qIFiZTkvO9DIIFYBkDi/mczGVy+GGbOHI9QqZG8add1zNvzP1B72Os+zMHbLU6hqOQfvtg==
X-Received: by 2002:a05:6122:2204:b0:530:7e05:2029 with SMTP id
 71dfb90a1353d-53b5e5e6c16mr777056e0c.6.1755608767961; 
 Tue, 19 Aug 2025 06:06:07 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53b2bed8eb8sm2534603e0c.21.2025.08.19.06.06.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:06:07 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-8902ee514deso1701404241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRgTBw4YXd/URvKIG2RYM0ae3UpmOO4hgbeXwxsOYgPzH/Dw2seAfQ5DgDKfjp60h3lJamVImFCqM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:4a97:b0:4e5:5c14:5937 with SMTP id
 ada2fe7eead31-51929a19afbmr863928137.1.1755608766525; Tue, 19 Aug 2025
 06:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:05:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTfz5mBNLNTwGjzuuVV5L726a2x_penD85524X5GsXjA@mail.gmail.com>
X-Gm-Features: Ac12FXzFxo0dVvYfSvWWErtn55ptRVL7u8GTkaX8Cq25P7cD0mfdKfGkkT3ZV4I
Message-ID: <CAMuHMdXTfz5mBNLNTwGjzuuVV5L726a2x_penD85524X5GsXjA@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] clk: renesas: rzv2h-cpg: Add instance field to
 struct pll
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
> macro to accept an instance parameter.  Initialize all existing PLL
> definitions with instance 0 to preserve legacy behavior. This change
> enables support for SoCs with multiple PLL instances (for example,
> RZ/G3E we have two PLL DSIs).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
