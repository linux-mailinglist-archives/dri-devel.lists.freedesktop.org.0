Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A298D3715
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 15:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65D1120ED;
	Wed, 29 May 2024 13:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A464C113A75
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 13:07:14 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43fb909d45cso10191421cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 06:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716988031; x=1717592831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xVFbPQ9StvkoNrq/0lKZWIQ4ZOA4XJTj64cZbKmwivY=;
 b=FO2Ro6tsZ2cSrowE7iAn3PbeEKVtcuKb//+6H5/9HJnj++LtKoySxnVete/CZuzSDo
 Ki89CtiLRvzVkkF+/OBqfqhzaVQakurGZxzwFXFVbhnYdwPSpl/CcBsS91dkCYfYhMqH
 g3w3rgc8gODVl+brk5/UyVoXhCBcKZBZOyxcJDmJbofdqJfVttZnCGGAMY2ERtgNxUc0
 xL7WJAjOoMBj03chr3La2fNv3cSpkwrJ7sj3xqFCzt8IOORCd+OX+Spfilr3DHX+UhuJ
 61zckexBM8s06Z54hBq4RKkkQa3HIjaS96QGj0mTo8Y7Q1woD4NK+hpp2lkS8X9KnEOO
 kNPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhYqNjtTD4X7/nTmBTCLPUAjlMzTjpkSWlkdqYtJ+Y9MLReXOhIdvhinnKDZRjy3UWYH8T99MQvBmiXqtAItEAVJ2krL7Nd1lkc2YIY8iY
X-Gm-Message-State: AOJu0Yx6rD1hFfyZG0SD24+Hs1zHUAXVYsQ7IZ87l2yBJ3D8M7/KlY4C
 iZaZpYZ6U2PjOzpl9DowBGZNMETDSg6VC1vnFE28IuWH0cHZ0OgLLDsE5z9ZgSo=
X-Google-Smtp-Source: AGHT+IEocPZbdPbRgcs1jAuCPLMitTGnR5+MUdR20wNp5baOiEAyZpwIOIdRZJy1WTQrpoSaCCQXKg==
X-Received: by 2002:a05:6214:3b83:b0:6ad:77ef:3302 with SMTP id
 6a1803df08f44-6ad77ef35e8mr120065656d6.53.1716988030657; 
 Wed, 29 May 2024 06:07:10 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com.
 [209.85.219.54]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad71678996sm39975586d6.139.2024.05.29.06.07.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:07:10 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6ad654913a0so11223746d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 06:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUNZS7AiFFCVB4kWZDaNAFORL/WnPbZFDnTh+xdzSRlZeVjxqPgkEDw5JyF+VMFyaGgaWhWJ9Rx6K0zKXRpdga//iTtAUoOz6vllWo1OvvU
X-Received: by 2002:a25:a565:0:b0:dfa:48ec:c4b2 with SMTP id
 3f1490d57ef6-dfa48ecc64cmr1707039276.22.1716988008813; Wed, 29 May 2024
 06:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <b1fc49269919c7d6c2e5c607ae29d1a6f2ab40d2.1716965617.git.ysato@users.sourceforge.jp>
In-Reply-To: <b1fc49269919c7d6c2e5c607ae29d1a6f2ab40d2.1716965617.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 15:06:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdR=SfNBFdABXRqdng8b=68mP_BnnXfpQcUvjCmvOmVA@mail.gmail.com>
Message-ID: <CAMuHMdWdR=SfNBFdABXRqdng8b=68mP_BnnXfpQcUvjCmvOmVA@mail.gmail.com>
Subject: Re: [DO NOT MERGE v8 13/36] dt-bindings: clock: sh7750-cpg: Add
 renesas,sh7750-cpg header.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
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

Hi Sato-san,

Thanks for the update!

On Wed, May 29, 2024 at 10:01=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> SH7750 CPG Clock output define.

(from my comments on v6 and v7) Please improve the patch description.

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
> @@ -0,0 +1,107 @@

> +examples:
> +  - |
> +    #include <dt-bindings/clock/sh7750-cpg.h>
> +    cpg: clock-controller@ffc00000 {
> +        compatible =3D "renesas,sh7751r-cpg";
> +        reg =3D <0xffc00000 20>, <0xfe0a0000 16>;
> +        reg-names =3D "FRQCR", "CLKSTP00";
> +        clocks =3D <&extal>;
> +        clock-names =3D "extal";
> +        renesas,mode =3D <0>;

Nit: please move "renesas,mode" last.

> +        #clock-cells =3D <1>;
> +        #power-domain-cells =3D <0>;
> +    };

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
