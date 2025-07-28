Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104BB142F9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E14410E186;
	Mon, 28 Jul 2025 20:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MHV0TNOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731B510E186
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:28:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so29848965e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753734487; x=1754339287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3p7uNtOcYKX9AeLZxdOrba2Sw841/DoiWzWyyL7dQNI=;
 b=MHV0TNOBsbgyIGwMW93nZ/SUhWYn7JVJjYJKFFmjl7u8g+S8sdxlzoX02WYCu3ruIL
 g/VYWyKnRVj9SRG5pBvk8+IJbcy0bADviznC0ttpnOjqRbO07C1cf4V8QKg7oXt/HFdF
 eZpx+y2NmCTPVYhH0dN3AoBInfd6BH1exzUbtMm/86yGzEiAENxOnRJJD3JEZr8zOhO0
 cKU9Gu1qRN2EyblPA+a0GQ3e9UyF7StTGBn6TevuNpXjH7s3l/xHaxHgxRYXx7O/aSn7
 QeNuwKFK50bevQRw+cRTZZev0anxjQYY12uZ772B6G7xnF4BjqvYnCcnrkknq+kvi6w/
 nevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734487; x=1754339287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3p7uNtOcYKX9AeLZxdOrba2Sw841/DoiWzWyyL7dQNI=;
 b=W1pMZ8fyXWfRv/qkk/mYKareDj0kl31YTgJhnD+qHzXDUMe5TMmVnEgFEmhWpnUsed
 iwmCWMPpbioaMtIMOopjkWPBuoYmwKCawRDLYEBoMSd45PYgE6cs9i6lSmbS0zztdbp5
 z4l05IX0Ldo5nN1taKPRrjfmISCeqK3R0ulAItBwWb3ndxULh1gukoTR+9tcetaW/xuV
 ghHvQilAByJ9N/KU9Qc/GwB/RVJJm4+jXyNurO4N7bCxs+EK7GBcnHPtn7gOnWChpURe
 ChRhx8TbgB9C5hKP13iSy8uYTG+wSEU4PrGzclgXuSdHSfDyLZFAp3m5B9R9I2Ghc7jk
 CA6g==
X-Gm-Message-State: AOJu0YzO+bT4RDcvJtqmGgtPkifWDxIPG6BiUTaqlneDckMA7dMLCJuC
 pndQUiVUKAECLf2ErnsRntmAoMT/vNwVfq+LoabPubmDb/f1RUabA1JAgmO8+e3lxbtohY1Sb2E
 uAMwarWE1ZrbS0rqtu/1XUdnHuoqUr6k=
X-Gm-Gg: ASbGncuelZB5wXxXgdM3bZYFQbAwjHLRPp8zX0yRqo2wayC2BU3Sg/oUdabhlI1HAsD
 N+muw50LnH7D7TP326rxWVb+gCbUIlrF3NpFaLUG08fsEhU7kIdRlObPfaz8bBfkHHFty3dmteJ
 vudARgeNS9SP1iZVI8ITBsRbXD95yFn0yUqrewBp8e1F7VkU6XIkzWT4rvZ5dUwNRtinaGIfMf1
 YzgKZO2
X-Google-Smtp-Source: AGHT+IG+tkX084ob9BPVH1wtp96BCaHvXOaWH/vJW6Hx67Y885Vfn0RXp7T9tAucn/9SDqLbh3dP5wGLiKEFiQ7iBaQ=
X-Received: by 2002:a5d:588e:0:b0:3a4:d9fa:f1ed with SMTP id
 ffacd0b85a97d-3b776728f9dmr8247114f8f.13.1753734486875; Mon, 28 Jul 2025
 13:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Jul 2025 21:27:39 +0100
X-Gm-Features: Ac12FXzC9Bz7YbuCg4MGPdK7g0FCBbcgsYDYVglx3jjRJspjbkFCpGAuDcBuHBM
Message-ID: <CA+V-a8ujMaFFOv8Jd-5=fKHUEfVji1Xt5y_h4uwtR96TBz4VNA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/V2H(P) and RZ/V2N
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
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
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi All,

On Mon, Jul 28, 2025 at 9:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
> RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
> with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, the
> RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and requires
> five clocks instead of six.
>
> To reflect these hardware differences, update the binding schema to
> support the reduced clock and reset requirements for RZ/V2H(P).
>
> Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
> RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
> reused for RZ/V2N.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6->v7:
> - Renamed pllclk to pllrefclk
> - Preserved the reviewed by tag from Geert and Krzysztof
>
- Included support for RZ/V2N in the same patch
- Updated commit description.

I missed mentioning the above.

Cheers,
Prabhakar
