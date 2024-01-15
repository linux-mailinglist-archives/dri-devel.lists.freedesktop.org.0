Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4782DAC7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A1110E29A;
	Mon, 15 Jan 2024 13:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C810E044
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:59:42 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3bd4e6a7cb0so2766934b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 05:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705327181; x=1705931981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCoI6wmXQhas4p+QHjRACvDabiOp6RlTb///RFp+bYk=;
 b=qn72hBzbAgMpI2XisNheOES/e7HZAabOxzszZu5FhYKSOOtUTN8hfLSzKEtn2O0PY1
 15yJvLdHP+HKX9tjnEoyNRblp8MpRL9wN2gptTAhSJLv+6K/RsZVJ6HCoZ0+Vhm/3fH2
 pq0R4cSFQMRChYoGdV/4huquAKLX7lJglsF14R6him5AmGMFXbugAfe5pNCMuus6mMRl
 VVVpt9xp95jQ2dmYYiBFjXze/VVWpaPqKLUg+DKzRiuMHeW4/w6yzktc6ek2iB8KhMwh
 ja8JBvn1mth7sPsHIQ6oEp6ZBIONjwr09Sl6Cff8lv3FcgRt75CuoHdJuIQq/EgHMtXg
 Y+Zg==
X-Gm-Message-State: AOJu0YyjII5rwzkKilbx+JGf6s5l1KBanDea/q7M93O8s6MMZGghkVE3
 NxBPOjvyfkc9H+B1Qisd1iFz3bpVd2UuTg==
X-Google-Smtp-Source: AGHT+IGoaaPR+a/ZBc7bRQeZJ0O8DcV9ckcnrWFc9XhAto/Nq+qeazMvuv/9DBXe2dTVOGAcxNhtzA==
X-Received: by 2002:a05:6808:2105:b0:3bb:bd1a:ed0d with SMTP id
 r5-20020a056808210500b003bbbd1aed0dmr7066151oiw.41.1705327181275; 
 Mon, 15 Jan 2024 05:59:41 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
 [209.85.167.172]) by smtp.gmail.com with ESMTPSA id
 q33-20020a056808202100b003bd437f4e14sm1351645oiw.49.2024.01.15.05.59.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 05:59:40 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3bd4e6a7cb0so2766926b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 05:59:40 -0800 (PST)
X-Received: by 2002:a25:ad8b:0:b0:dbe:e4d3:bbb7 with SMTP id
 z11-20020a25ad8b000000b00dbee4d3bbb7mr2479427ybi.99.1705327159968; Mon, 15
 Jan 2024 05:59:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <183bc01316cab97a7ae96df525a5a450c477210d.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <183bc01316cab97a7ae96df525a5a450c477210d.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 14:59:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-Ak6P3nFH7cdomSYec9=WZf8mZaVwmG=qoYHz1thLMQ@mail.gmail.com>
Message-ID: <CAMuHMdW-Ak6P3nFH7cdomSYec9=WZf8mZaVwmG=qoYHz1thLMQ@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 09/37] dt-bindings: timer: renesas,
 tmu: add renesas, tmu-sh7750
To: Yoshinori Sato <ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sato-san,

On Tue, Jan 9, 2024 at 9:23=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Add SH7750 TMU entry.
>
> I wanted to replace interrupts and interrupt-names in the if compatible i=
s
> "renesas,tmu-7750", but it seems that I can't rewrite it as expected.
> This resulted in a redundant conditional statement.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -39,14 +39,15 @@ properties:
>            - renesas,tmu-r8a779a0 # R-Car V3U
>            - renesas,tmu-r8a779f0 # R-Car S4-8
>            - renesas,tmu-r8a779g0 # R-Car V4H
> +          - renesas,tmu-sh7750   # SH7750

OK

>        - const: renesas,tmu
>
>    reg:
>      maxItems: 1
>
> -  interrupts:
> -    minItems: 2
> -    maxItems: 3
> +  interrupts: true
> +
> +  interrupt-names: true

I would drop this change (see below).

>
>    clocks:
>      maxItems: 1
> @@ -75,21 +76,55 @@ required:
>    - clock-names
>    - power-domains
>
> -if:
> -  not:
> -    properties:
> -      compatible:
> -        contains:
> -          enum:
> -            - renesas,tmu-r8a7740
> -            - renesas,tmu-r8a7778
> -            - renesas,tmu-r8a7779
> -then:
> -  required:
> -    - resets
> -
>  additionalProperties: false
>
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,tmu-r8a7740
> +                - renesas,tmu-r8a7778
> +                - renesas,tmu-r8a7779
> +                - renesas,tmu-sh7750

Adding renesas,tmu-sh7750 to this list is OK.

> +
> +    then:
> +      required:
> +        - resets
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,tmu-sh7750
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +          maxItems: 3
> +        interrupt-names:
> +          items:
> +            - const: tuni0
> +            - const: tuni1
> +            - const: tuni2
> +
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 2
> +          maxItems: 4
> +        interrupt-names:
> +          items:
> +            - const: tuni0
> +            - const: tuni1
> +            - const: tuni2
> +            - const: ticpi2
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/r8a7779-clock.h>

The new interrupt logic is not really correct: several TMU instances
on other SoCs do support the fourth interrupt.  It just was not
documented before, or supported by the driver.

I have sent a patch to document the fourth interrupt[1].  Once that
patch has been applied, adding support for sh7751 involves adding just
two new lines.

[1] "PATCH] dt-bindings: timer: renesas,tmu: Document input capture
     interrupt"
    https://lore.kernel.org/r/fb1e38c93e62221f94304edd980a2fb79c1f2995.1705=
325608.git.geert+renesas@glider.be

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
