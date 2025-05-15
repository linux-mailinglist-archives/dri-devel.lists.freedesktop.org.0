Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43016AB7F7D
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7639F10E7A4;
	Thu, 15 May 2025 08:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5208410E7A4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:00:35 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30db1bd3bddso5049211fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 01:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747296031; x=1747900831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=83/6bruci8d3XeppjMMQIod4VG9vV6e31bosgCEHfPA=;
 b=fe32pppdr/652z1n9Q0BDCxoAlenVDSQ9lfbaSWPi97W0fdfjgO/yXsIODqCJ9y9mJ
 2X4Ee8LuDimBjPLl0hh8H/Dvx/+pjbX86jI2TtOERK/3oZOIOKxwib9f1583LJTC0DBf
 3iP8vVwqNf2ZiW9NeoFK5nqU6Sv8udMVpSc77bzn5hrZc4Kgn9L18TBLwXhST40LUguJ
 8pstsazdXQCyJuH9tamXvYslMsL9CDA4niXKCbfgjSm9S2tXVyBzQlWAJlFOPl7Mwldv
 6j++v139bxP0RzYWiB0wBR14QyOMjDHDRW0pOL5TrS4NopqoRSs8hLB+5/cCaBh2P+mB
 AZ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf6pI/QiiO8IV/zwtPchGkv+6AlHmGykOa7dGrX6o5f4cxgMADJYuNAb1LFs9mF5anjwBQtYDeJXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjRiR9k56r9tfJe460u20RnyPyQFEYHdJEljKmjEealbJYYkHs
 +JojiWwuwGcjtPO8ZmcOqoBGrj7soPietKRqMC2G51pYUvTrIucwfRjUZyGo
X-Gm-Gg: ASbGncs6VhTBGduKR1kqhL+FUYsSjgtkaqPhDz61i5vGbo3j5xAU+2RiBjnMDm3Bkt1
 NOylmlLJWWESH0ZMJGbYsGLlWvcOdgnUarjkU7gtONq+Cjb/hXAcZ++8oj5zjag5G4oPXuTtoPI
 nNW+09YEv6l2ZbUxZybj6C+T3Dj2n3coHZ/d1MZd/apgGPnZfo1Y1ysbbAeviBmcA2i8aAUcShQ
 43QNWb8bSyxszopPn9lRlIYuUONA+poTahUjxE5v7evGSAnYY3XinNymfezCAVoVheIafa7ld9s
 A59hsEqwR/+jDbRtbG17cq+/C+OuW4GKCeXj/tFBO6fmxjRyg8UR+iBA5XFQWSv0lw6QRy/9LTK
 uowyaRZLw
X-Google-Smtp-Source: AGHT+IGQWj38w78e4PihC84UetV3r3A64YKqtPPpQNnrRSdd1tfTce00I5p7kO9fMubRX3bjAIIUfw==
X-Received: by 2002:a2e:bc8f:0:b0:30b:a92c:7dd9 with SMTP id
 38308e7fff4ca-327fabfd59emr6057531fa.17.1747296030348; 
 Thu, 15 May 2025 01:00:30 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c339a4d3sm21808601fa.10.2025.05.15.01.00.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 01:00:29 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30db1bd3bddso5048381fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 01:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVOBixuKIlZ9YIGRyjnno6oAgmpZCbX888Lghj7NMpbYKpDdtjtv5UEN8/CQHbnNDn3sgF1wE8KkgA=@lists.freedesktop.org
X-Received: by 2002:a05:651c:1477:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-327fac55a0amr5702491fa.32.1747296029090; Thu, 15 May 2025
 01:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250511104042.24249-1-ryan@testtoast.com>
 <20250511104042.24249-6-ryan@testtoast.com>
In-Reply-To: <20250511104042.24249-6-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 15 May 2025 16:00:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
X-Gm-Features: AX0GCFtQJojOkTJDrh1Srsp9NZ6Emv-AQGyH6XtcUh5xrCVbMWvLF3It26XNdqM
Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
Subject: Re: [PATCH v10 05/11] dt-bindings: allwinner: add H616 DE33 bus
 binding
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
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>,
 Chris Morgan <macromorgan@hotmail.com>
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

On Sun, May 11, 2025 at 6:42=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a display engine bus binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> ---

Since this just falls back to the A64 compatible, there's no matching
driver change. Can you send this together with the DT changes instead?

Otherwise it goes unused.

ChenYu

> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
>
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
>
> Changelog v5..v6:
> - Increase reg maxItems to 3.
>
> Changelog v9..v10:
> - Remove maxItems, this was added in error to the bus binding (rather tha=
n the mixer binding) when it was split from the other bindings in an earlie=
r revision.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf6..ea7ee89158c6 100644
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
> 2.49.0
>
