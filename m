Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE6D0BD33
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E6610E91B;
	Fri,  9 Jan 2026 18:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A10210E91B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:27:48 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5efa6d5dbf5so168910137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983267; x=1768588067;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fLS5br715ALrW9iu7K4XmrLPlp0NmncdqOKXgMKuek=;
 b=GVFX7+gcFSBjWLHs0kQb8QC5uG/k4DgoTcwM3nX0C3BaAZ66iocftY7g/4UfBa06ko
 XvJhcHPjbGgcUEUG6+5uPyYGFld9q+Jh1Ygfb0PxZt6AeVPJxyRYtr9zTgyyl4WYisF9
 kLFKz2BSoUdXr/Jf3h/9gVm0AuITpMwf76zNB8kKbolYtdzeymMJC3yJDRwYyK04DZBX
 z73sdPGqevlrCTPr/JgUFNeLNGCUGwJYuOgtwC5++ysH4M/9JWekdFg/mmk1M7ATFZJE
 KtE8c1+qLc+hze5a7MkR8rUnNHe4Tpx633In0983VHYFyL/UYRbTI/JLx52djwlU/Fw1
 VByw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU24riCi56sCRyaJTdTkLxZkrPqF83ypBYem/RFKnmRybDnDRZ5joMTmXXZuVvMe3PA8/55J3cifFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybPrL6sY30rI0NrvwLIfqKrmUuOJXM01BKRSdV9D5Vtgkfmepu
 JyYB7+djWgpRd9rlX9Bv8aYiPManScAiuytyHyHJl4+pNipMH8bD/nuI1hyq7/kO
X-Gm-Gg: AY/fxX7OkyzhpC3vyD3faBzeMCDuc5wn2ABuZQ1kc72Rmlc5bTiGIg3NQ6v31pUywcu
 4tlxBk0e/YdpGZnzeN4Mw+0o+qq1BRlrHsoRg+fHzHfJpdyZRuugFMZFHdDW+3Z77/zidKo2t7q
 iapbBgxaCt6EKCYst7D3QQ80OBVBIB1oPRxj1bj11hRkJ0/+qKgvH3h5cisKTvPwZgtZ79g/Wv8
 KSa2ov+UPcHxhvD7hqyLkf1DemplnwNeBMTz6Mrbpc63t0MZv36Nfxv+DZVFii2j6nBX6xHyTcm
 vhXIvQk394UA8o/SZ9udqNGLkrCghRMgl2tvcoKTsQ/NZB7w08658oXPdQyCaT2rYJJmoycRcoR
 jbXqy2X9f+9swPGzkhxkE8Jx+IZDfrjVTFnZE2ZumejodB/gwYxnPpt+PoazVmRYoSyY/LVKNEt
 cTuAu5sNzJys5Pq/JDZMytx3hH/0Us1LjxIt7IygnbQaX1a/vH
X-Google-Smtp-Source: AGHT+IHLK4aWe67892BJatj2iEe2VyJGDXJ87648xmYptUaoYQq4b6k+cm6bSWrdIiIs1xWkDvp0kw==
X-Received: by 2002:a67:e112:0:b0:5ee:9e4b:a81c with SMTP id
 ada2fe7eead31-5ee9e4baa91mr2330844137.22.1767983267598; 
 Fri, 09 Jan 2026 10:27:47 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ecc521d7b1sm9344849137.0.2026.01.09.10.27.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:27:47 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-9371f6f2813so1448671241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:27:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWiVAQdit6ZZGgiWd2QvF+fj/PqJ1hN4mUVNcLW9/6H3oG8f6h4/sXcL7dc2mqwm85SEbBaeihXoZo=@lists.freedesktop.org
X-Received: by 2002:a05:6102:604f:b0:5ed:f26:55f4 with SMTP id
 ada2fe7eead31-5ed0f26580cmr3794404137.34.1767983267169; Fri, 09 Jan 2026
 10:27:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <371314eb59c84965e73c4c225db386456d82b1d3.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <371314eb59c84965e73c4c225db386456d82b1d3.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:27:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqDPYNPE63ZBFxWTnJtzJwisMNpUPFPf3BJodCxzZ+ew@mail.gmail.com>
X-Gm-Features: AZwV_QheUwWEgzt_8L2XxxL-r3KN1XzfOq-OJJW2J8DrDX2eZqhIZwBOou0w49E
Message-ID: <CAMuHMdWqDPYNPE63ZBFxWTnJtzJwisMNpUPFPf3BJodCxzZ+ew@mail.gmail.com>
Subject: Re: [PATCH 02/22] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK
 support
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

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add CLK_PLLETH_LPCLK clock support.
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
