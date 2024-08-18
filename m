Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FD955CCD
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 15:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACD410E06D;
	Sun, 18 Aug 2024 13:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D63310E06D
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 13:47:17 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso4388057e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723988832; x=1724593632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+uvtxgs6kWiB9/v6Xs7WCMNnd37h4d8Ese9LrJ+mZCI=;
 b=EelWwKE5IT9ZW2BHziI9IPgiMpKnzDUwCe6thcRVZCIbr91KnT4E+tV9x2opxoSL/k
 GA7vVsvvgajb+bNkJY31LhXa79XqSolGlkJm8GhYMKueRgJdAfdyFYYTY2H74alde5Y+
 9hiW7n46+LEvYBddjJ2Wu0UltIXBrwhZvdemHsU5CWEQ8LrYJ+qUMR4w6mO6FTXYCKBK
 1ZXTMhC31M/TBHRgX53s4O7pXEyhfmTkyBG5jk9Z2INgU9KJRUkbgeA6rTjWCoxamAZi
 lEu7vkEm06yEQNaBWxA1w1FAICRn5PcI8iPRZhkgmmy7PM3OPN83Ak58pt4sQfrl1ja4
 UyZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz34MWlP6PHG2DnUa/PK8S4haNOD/ty7a6yeVB6SMpRtRS9t+jZb8rltr1wV+pfvFaRXmnwAyAVqtvL9lormlzS5XwfR9y1ikwRxFF3jU4
X-Gm-Message-State: AOJu0YzLiZ4bpENBFL8Gbj4vOI0j491T+0MHyVg3/Z6GiT8/uJSDw/XA
 PTz+LBrsklEPdm0oqT+FVOsV0Gmqsahn2uVrpvEGXoeVroDLseBgB0xp3PQKLU0=
X-Google-Smtp-Source: AGHT+IG2s6Qh7QLTa23WihqE2GfBQJZW+QmRSZB4CDo6WpJSHz4wD+x9S4CSfbu4vxSyW8yZrPkoag==
X-Received: by 2002:a05:6512:2528:b0:530:d088:234a with SMTP id
 2adb3069b0e04-5331c6ede52mr5260005e87.54.1723988830975; 
 Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3afa00sm1198081e87.46.2024.08.18.06.47.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso42379821fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 06:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXfgd+dI1iAOZXHxRZtMSO1CCLiOqS6/zSDWQKny8IwT7VWAQ8HOujgZ3SIXrS6ETCECev/EwYZOXt9xQQhF7z3s7RgrkmIu6ZSFxUYrUpO
X-Received: by 2002:a2e:9a83:0:b0:2ef:1c0a:9b94 with SMTP id
 38308e7fff4ca-2f3be5864d9mr51081381fa.16.1723988830128; Sun, 18 Aug 2024
 06:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com>
 <20240817230503.158889-20-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-20-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:46:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_UGEJaqoUs8j9-wfsKKez_UPXTHnL3sj0ZA6NYt2vTQ@mail.gmail.com>
Message-ID: <CAGb2v65_UGEJaqoUs8j9-wfsKKez_UPXTHnL3sj0ZA6NYt2vTQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/26] dt-bindings: allwinner: add H616 DE33 bus binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 18, 2024 at 7:08=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a display engine bus binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>
> --
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
>
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>
>    reg:
> --
> 2.46.0
>
