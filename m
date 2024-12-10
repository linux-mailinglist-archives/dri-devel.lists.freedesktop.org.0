Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1A39EB686
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A369710E927;
	Tue, 10 Dec 2024 16:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D32D10E914
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:34:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id
 d75a77b69052e-4676e45234dso14311621cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 08:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733848475; x=1734453275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2e3X6khm/ThbDpkGIJYPkvaVuIBT8ySpR+1a5iCbjI=;
 b=BLt0Lr8w3PhPNwHRIdmEgSOnFculsAmdQWMXo9SE53qfe3VTrpgcCHJgm9DuKGyXV9
 N+XjG0YXw9CebRdBSqrfQZ/E/xCjilgQ36mUr+51Ho+AsLBDafo5ydC81dujRQmub6Fl
 BT/hkDI+xqagS+uJMym4NX8l2nJb5gq2Ln9t+AP9ZXLwxZwaMIx35//PaKz5teyqwF8L
 iTbgJ+ivLgJlCx/x53kEc8OgxFZdXCRLgpGozr5AjvvMaYYJbU1YXjwigU2X6++N+DOo
 wntqJTY+inF+gSBbt++Veo8s0dv7DEZLY5tuFPMYDos7TP1hGlB76qzM9Ut6oDksfUfy
 DefA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdOSUHngIjcJA1Pdtpe1nBEHQnM26hofPHjTPYPXlS9U189c5mymI6eckKmK2hsHJlg1WmcW6WwuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp65BuKUBPpPshK/raaTvm2bAZuaS1Q17fepEPB9ZHuE+HGSaa
 MzV2lEsYzkfB0l4Y2uEhNVEGD1bIevcZRdr1WC3kBeeVhK4Pp/acDkvcRqqGFX4=
X-Gm-Gg: ASbGnctR3UT9f0u91RsKmb2bDPWMtpAkJc2AyZWmCWJ4RZPPOhDCv7DlFIMYmRYlEya
 4o9/K3SCLYChh5U/lf3R4pGYefBMgtAuAI/Fipmv5BjpHPmQimb0SzTmLiSOE31/Iq2U2AaKUU/
 zszrJmpHgAET66oDbJDpXCRkQmJCbhsqQjP2pKRkcRRMZ6MyFt0+aV9jW0q26zKAnZkmybxK+Jl
 Kvv1zmJZwmCXxeF20Ymgq5+Hz9Hetxav2XIYHBh+bIJfedAzb9vVPGq92GptIxjqQsLRN3MxCOb
 v/OyO2W2r/7ovIRdF5IM
X-Google-Smtp-Source: AGHT+IEtnkQzo53E5omQJ73plttbECZwdtZw3ZjKnbxSKdpSIvLU8CxbKipoVDLaP2yRw4C/ikc/0g==
X-Received: by 2002:a05:622a:15c3:b0:467:6d36:4c94 with SMTP id
 d75a77b69052e-467751f450fmr71789091cf.2.1733848475134; 
 Tue, 10 Dec 2024 08:34:35 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46759b837aasm30234251cf.83.2024.12.10.08.34.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 08:34:35 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7b6c6fb409eso250172085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 08:34:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqIne5SV2S9vMlIQPWz4U6exgvCwk1yxaeGYE4i7GDZoZwW5wEp/nbDM19I5bHfYd5HA++eq4RR74=@lists.freedesktop.org
X-Received: by 2002:a05:620a:1a85:b0:7b6:cef9:4f10 with SMTP id
 af79cd13be357-7b6de6bf952mr762749985a.3.1733848474648; Tue, 10 Dec 2024
 08:34:34 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 17:34:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMt74okJjqinLwrVmf5hZFm7YQkE5s3u2F9AOTWk+zXQ@mail.gmail.com>
Message-ID: <CAMuHMdXMt74okJjqinLwrVmf5hZFm7YQkE5s3u2F9AOTWk+zXQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

Hi Tomi,

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Add support for the mini DP output on the Gray Hawk board.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -269,6 +314,51 @@ eeprom@53 {
>         };
>  };
>
> +&i2c1 {
> +       pinctrl-0 =3D <&i2c1_pins>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +       clock-frequency =3D <400000>;
> +
> +       bridge@2c {

Missing:

        pinctrl-0 =3D <&irq0_pins>;
        pinctrl-names =3D "default";

> +               compatible =3D "ti,sn65dsi86";
> +               reg =3D <0x2c>;
> +
> +               clocks =3D <&sn65dsi86_refclk>;
> +               clock-names =3D "refclk";
> +
> +               interrupt-parent =3D <&intc_ex>;
> +               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;

interrupts-extended =3D ...

> +
> +               enable-gpios =3D <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +
> +               vccio-supply =3D <&reg_1p8v>;
> +               vpll-supply =3D <&reg_1p8v>;
> +               vcca-supply =3D <&reg_1p2v>;
> +               vcc-supply =3D <&reg_1p2v>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                               sn65dsi86_in0: endpoint {
> +                                       remote-endpoint =3D <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +                               sn65dsi86_out0: endpoint {
> +                                       remote-endpoint =3D <&mini_dp_con=
_in>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
>  &i2c3 {
>         pinctrl-0 =3D <&i2c3_pins>;
>         pinctrl-names =3D "default";
> @@ -361,6 +451,11 @@ i2c0_pins: i2c0 {
>                 function =3D "i2c0";
>         };
>
> +       i2c1_pins: i2c1 {
> +               groups =3D "i2c1";
> +               function =3D "i2c1";
> +       };
> +
>         i2c3_pins: i2c3 {
>                 groups =3D "i2c3";
>                 function =3D "i2c3";

Missing:

        irq0_pins: irq0 {
                groups =3D "intc_ex_irq0_a";
                function =3D "intc_ex";
        };

I'll fix that up while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
