Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA5D1FC2D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB4A10E10D;
	Wed, 14 Jan 2026 15:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311C210E10D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:31:58 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8b2ec756de0so949264985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768404717; x=1769009517;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9PHoycvBsjA0Sy0VbLTIHVLWHYGM3MD8TXsWVqyh2U=;
 b=U00TSoCZ3Mgm9jnXVE01OpN8XfI2HVhZMO2JmeNCqk5baTwfb3iwBoZCCNgtziLAw+
 qosBUX5O5LO2CJziMyhiRMFv4mFborAgnaChF/fhpQDkE0U07a7gf5HVEPZxOAowrF8v
 lsUbJG6UtojTNm2QZDFcaM1pD01AprMiVdKXZiytxnyG5pGsn9LhfL21Cwg42o/wL1ue
 Mc+l6yLYl9NTJedxvfuFRL3lvj0QJmRMgvq9SKzbIBvtthTqeVgbb80oNyqeR7i3QlF0
 QGPGWZtMqmWfL/W5FOuHlkZH/MFgvIXszidfnmkWVLuM/mBudNtS4S0jwvBHKAdK8dph
 rViw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6e33QO7GNhZu017ZxIlWeTXVqmbRhv6qBrlopFa3hIgtVOjd0BkRULeEH21b/6oSD/POMq7Kv2ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTS8uQLqkUVazppeUanKt6XCPBs6RZ43cF5Wj0H1V2BXgBgjSQ
 OluEx5EPPi8F+NfW3beStX6hQrq4+xGtqdm2JjhuLcGj+WznO5dT56rtzYKt6gg3
X-Gm-Gg: AY/fxX5OhfrTAhu6xMWQmtby3/IhuLio6f/xdQM2OJopTOnsk31sF0oUbL5gXqypJaA
 VvzQERRsS/xuv5mm4MJHCKF14JImK4zpVGY+IOA/0fcvZ4Uw5VLeUiH9SHKgpYQKIeS0GPl4i3p
 IMz+8YGhgj7f8zvU9plDYYQHAtJbu8yr8rtpSnEKI1vgjv93y3sum6l80ryAeNGJNDpKtFKPg8n
 0Wfj4P4d8uTO0j0dbcAsqkOa6fHohd7gJAAax9NpJJaTjWSpE1dOv7KkazmsgY36VN5yqopH/Qr
 McrFl2pFOXKNGYVFqyCV1FEH4JfLAAkRPK3v7ovtNhGyt8gNRlhpmOTjHAaCiIBNiganxCTRuBd
 6AskCD7Kh/+PrNOMuqtFUnWR18vuk2Xr+HuYIfgOYR/oX3ZDLQIdSKTH3acJroVGj9xVlnfZQZv
 dsqrOfpyHlvcjxKe6HsXbbEvNQ2V6oQBPvDPzx0xQOw+/kcB+N
X-Received: by 2002:a05:620a:7112:b0:8b2:e958:740c with SMTP id
 af79cd13be357-8c52fbb9e22mr383577185a.72.1768404717006; 
 Wed, 14 Jan 2026 07:31:57 -0800 (PST)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com.
 [209.85.219.44]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c530b72b61sm181713485a.26.2026.01.14.07.31.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:31:56 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-8888a444300so86215306d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:31:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVc9Sj/ES1ELXD5FlH1ncjOixOuiIuuhIYvmuUxuqXeHDTAgdf0V9dw8a04pDb8Jh9+IymbVW+S71M=@lists.freedesktop.org
X-Received: by 2002:a05:6102:c05:b0:5f1:5c43:936a with SMTP id
 ada2fe7eead31-5f17f5b855bmr1345435137.25.1768404199242; Wed, 14 Jan 2026
 07:23:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <9188e9aca69fb0076941bd1cd62693b381cf6f00.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <9188e9aca69fb0076941bd1cd62693b381cf6f00.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:23:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+ZvuJg0ivCM2CHJkRBdx8sgiku1jGgrD_mcO4yV9vHg@mail.gmail.com>
X-Gm-Features: AZwV_QheoOAURJQgELAszsWwxDhSryviUTqnKNYp1N8Uc4IoJlBrWL72cLThIqU
Message-ID: <CAMuHMdW+ZvuJg0ivCM2CHJkRBdx8sgiku1jGgrD_mcO4yV9vHg@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: renesas: r9a09g047: Add DU{0,
 1} and DSI nodes
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

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi

> +
> +               du0: du0@16460000 {

display@

> +                       compatible = "renesas,r9a09g047-du0";

I doubt this compatible value will survive review...

> +                       reg = <0 0x16460000 0 0x10000>;
> +                       interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0xed>,
> +                                <&cpg CPG_MOD 0xee>,
> +                                <&cpg CPG_MOD 0xef>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0xdc>;
> +                       renesas,vsps = <&vspd0 0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       du0_out_dsi0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       du0_out_lvds0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;
> +                                       du0_out_lvds1: endpoint {
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               du1: du1@16490000 {

display@

> +                       compatible = "renesas,r9a09g047-du1";

I doubt this compatible value will survive review...

> +                       reg = <0 0x16490000 0 0x10000>;
> +                       interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0x11e>;
> +                       renesas,vsps = <&vspd1 0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       du1_out_dsi0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       du1_out_lvds0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg = <2>;

I expect this will become "port@3" and "reg = <3>" with a unified compatible
value?

> +                                       du1_out_rgb0: endpoint {
> +                                       };
> +                               };
> +
> +                       };
> +               };
> +
>                 fcpvd0: fcp@16470000 {
>                         compatible = "renesas,r9a09g047-fcpvd",
>                                      "renesas,fcpv";

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
