Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E3D1FAE3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C68D10E354;
	Wed, 14 Jan 2026 15:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB59110E354
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:17:53 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id
 d75a77b69052e-4ed82ee9e57so116353331cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768403873; x=1769008673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2PPCiljP8mKTN3qlK3gNrjsm5ZPU3Yx8SKu0rtGmFo=;
 b=Eq7G8LKnK6E1pQr7VwTCG41DCWqUSB4GPMCYAc2jcIHYqAkG8WOKi/lAn22JOSSElu
 2iOdbYI3b1qnQT4HcpdE2U18K4P1CegyL/lFeXzBp7ACW7qqvR/zbR0rkVy8YRqgIgd3
 1u4AZYyNfeMKe5ZR628ZvsgiKCZBsEp1vHNsqhdIwyQ6NK1tjk1TNgTvb9487tVv85sL
 ZeOGVKnyIAGhw8nKCZRpDYXUouVz4A27XjqzxMo95/pVcn3mh8dydmd4eqep809b8vYs
 W2aOEWCPxymZCUTvtVFMTRwNDL0AzPZc40spPFi59auRy0Ad5kozFWj+/zXjewC/UKgb
 LdoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMJ4LITZvL5JHASJEfkmCSmQEbYaJHwL/3sqlhyGQV7NmQ8myhzT9R3aXAMz0vbYgSMQohnGS/LlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOqCFS34Bn+A0yRwq4h0s9eKlJc5mrAjksltgtainBI9uRzTqN
 oBOPQptcQonKmninOQnlGm4SakRX3IECF6dW9GkauqQq0455SQ0ATMMyGkKKenXzx3g=
X-Gm-Gg: AY/fxX6M8IigPotZXIAFhBz9Wb+IYwXuFokqP1Aq6BbJ2Rf7pFNYw+EdfeV39FI3Z2t
 04a9uxxXicLxwcJYaAb14LMMXmsrvkzShedJzV5gvtS/iXQseBUyCqDtjNKN2EmKnp7+CKyf7/e
 r2QxRGWz6ofgY5TbINDZgJPvwMQIcRhllaWqbD8oZjKn3Ruk9tCVQaTloEQ78XAgL9OGfCa7Eti
 AF98vCpL2in07JmowOMooqVYeIiaV/GCo0hYJs6cr8Lz7RFsIjzI0ZymA8bgY2vUptSR3W7RC5J
 +d50AWoHOZIQieVeao8X3AE1mfXEaNljl+hoH7Yx3IKrOnxm4VMO2hxhHLm5z/2JR6Z0YwphRMe
 YJExl5iQcCstIJrdB0qWQ8+lg5EYqgyJf2USoOmhKVlA5RovtJ0QSCoa/5IDagvq0OP1CUEpVg1
 LMIXsaUyv7VyVRaf/XDGqRGhDAUSUVl1wpHFW9rlFTIK5xGmD0tFBG
X-Received: by 2002:a05:622a:5a11:b0:4ff:b2cd:5ec4 with SMTP id
 d75a77b69052e-501482784b2mr37440551cf.43.1768403872603; 
 Wed, 14 Jan 2026 07:17:52 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50148ee394esm15751331cf.33.2026.01.14.07.17.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:17:52 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-50150bc7731so3783041cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV7ovQyo9GMNchYIZX/LElOT6cQLWeNa+RFgHdDIo/ntbjQ3YZndjLexrxYQwbBo+rBFRc8e04Ta8M=@lists.freedesktop.org
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id
 71dfb90a1353d-563a08080a7mr1323779e0c.0.1768403490712; Wed, 14 Jan 2026
 07:11:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:11:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXj0_rNtvgDGnaE=pnenFpHi_Aa6dx-Ej6-42oweEv0Kg@mail.gmail.com>
X-Gm-Features: AZwV_QhWXdjW_YU4fjdNyqOSb6ulXkw-i8mzGwj6hWPbLAjpoXOZB9H0uqSzcLg
Message-ID: <CAMuHMdXj0_rNtvgDGnaE=pnenFpHi_Aa6dx-Ej6-42oweEv0Kg@mail.gmail.com>
Subject: Re: [PATCH 16/22] media: dt-bindings: media: renesas,fcp: Document
 RZ/G3E SoC
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

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The FCPVD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
>
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/G3E SoC.
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
