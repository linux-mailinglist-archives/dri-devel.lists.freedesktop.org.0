Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79078A8B628
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C5410E03B;
	Wed, 16 Apr 2025 09:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E2110E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:57:42 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-86c29c0acdfso2321618241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744797461; x=1745402261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ho208Ls7afq1DaxglhBlsTxce9BflgAJatinG20gBNk=;
 b=Og5j3nFO+e7OKnRaFJwedK6bXGAn85vklm2fBdUsTHNUpPW4mgnSxHk4QpNy1dnWHG
 00bCdPa40k3ZyJMEISf9e/YHrrXtRYBqkdekn9kz2JcMyc6H0eWqzNdetuA5WgGvSsC1
 GEdKIdWapprc9Tt8lRqD5qlKeSasZp5rN8WPjqNTTx6wXuw+DtWs7HUGAz5v6hMGW/A3
 CF53wWnht28Lpc1MTRcByudXCxVMLt+AWQach8z6jqOKTHWAh4SkE/3tiwzOoZeTJ0al
 DY5B2j3FHEW2LEQDi/NaXL+lJxycm+XZ56MWH1/6gqROYus4UFE3Ss4dqIA4OrS9Jt9b
 Kgqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGntR+5m/kniYLCu18gkPL1e7SpEWhXEDwfuMvcESSNArN3QMfPtnegmowWSuIq3LYqd2oXephnkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdUhrD2+g4y9Xxd1+BroS7oWq9HCEe01gBJtnnj4gVblYWIWxt
 fYDFz3vpcsEhfFzLXOykEW7T9b5P9FTIJ+mBIalmFRlTtl7KOSpqA4z7Et6y
X-Gm-Gg: ASbGncv0Q2Vn4M+9d2MWzdRyErY15qkwes8nCalBOJhhTfAbe1hnnmHQZ6DPR90I5v1
 O5tsg9kfsDGZ4dSPam4z2ISp1z2qf6sD5o98PDvycu5ihAgfYjtahc8zKlQkW/vI8yReh22wFQ/
 VlfID2Z4grDW5u/JKPuRtHUIihJsEHp3CdtaCA8NMCao+xRnhGZLvxSzYnsY3hZ/5+NSL1iAH4+
 RUQ8tJ+TiXKF982TsNYzTyp8dGuNS8WOyHEHGoaWFd+Mx8hr/4pLkJR4kreKD/zHhF/yy5vE0Vp
 Z0pGZb/8jGz7yw1hqh1Kkg9Xh8AYPWyz31SrvLpFmFIMAZBG0kxSWxZ/3sZUtUC8LLYZZLkQ2Uv
 mkyw=
X-Google-Smtp-Source: AGHT+IFaJZrVxGdCZHq2JcJ/KLqf+sYy7MVXpxVsedbI0JZRVOM4Bcszagj9GPxTI9sIcTvCfoXudw==
X-Received: by 2002:a67:f0cc:0:b0:4c1:8c7d:44ce with SMTP id
 ada2fe7eead31-4cb591ba77amr307607137.1.1744797460784; 
 Wed, 16 Apr 2025 02:57:40 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4c9c98ee4dcsm3004241137.30.2025.04.16.02.57.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 02:57:40 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-86c29c0acdfso2321611241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWY30bYrPugJm9GGN0k4w4J47tR71QHrYfFPNmmyiF9t+FBLdo585EUiWz8ITt3i2s8dkLDhgwCfnI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5e8f:b0:4bd:3519:44be with SMTP id
 ada2fe7eead31-4cb5921580emr265747137.15.1744797460341; Wed, 16 Apr 2025
 02:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
 <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:57:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3W5N=__6CpyoQ6DAumoS=8p6Zcwbsn2H6e9PYKsn=dw@mail.gmail.com>
X-Gm-Features: ATxdqUFRQ2wAxnSiubYaAZxSXiLAOnqb_ba0SYhUbUDUQXOzs-nV2UVFXRENq8U
Message-ID: <CAMuHMdX3W5N=__6CpyoQ6DAumoS=8p6Zcwbsn2H6e9PYKsn=dw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, David Airlie <airlied@gmail.com>, 
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

On Wed, 2 Apr 2025 at 15:12, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add a compatible string for the Renesas RZ/G3E SoC variants that
> include a Mali-G52 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
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
