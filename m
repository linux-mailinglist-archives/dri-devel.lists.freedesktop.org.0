Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F0899E46
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 15:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2D6113BFE;
	Fri,  5 Apr 2024 13:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95762113BFE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 13:26:08 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-617d25b2bc4so5197477b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 06:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712323565; x=1712928365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwsDRonjbPICxZMNgS8aH3ZFFLUCLJm1C0DAdV/AdRA=;
 b=pGYvj2vXPc2PKAZQqzdsMJ/YNBeSJb0EZP1ku1z/bjsUk4kqDcuQ43aVswndrAlWc8
 BHtlglRmj7Y9zJze+t32RXiWP9dRIGD9+yuWY4OZFXqQzxH7pV8GMsmyj/3bLpkWth1Z
 cWDmdEef9i0fa5ikKj6k+H+dFnpFx/huVB935KRRhvmMTfZgahfQcNWKWLQ5p6oTcjRM
 G2Dphhr7Jx7p6g/ds3jS+YLDLJaWwlfBsQddwxUrLGUsa5jtKfG/PIIq+togM6zGp3W/
 YFBSDYN2mBSzV+pUAaS4xqnTJrybT0K0geZN5CQRbHmxaIaO7F5HA7H7PT5EbcbzI25t
 NaKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH8a4IOItaIlhuHhtk/NZWN0lnxUMKavgrnLj00lzr1lwWxwJ2huxCFiIq9KmP896bo9dfAYeZRBVPAqz6T7B88LBjUfIjt1LHenUOJbAk
X-Gm-Message-State: AOJu0YzWe2LdqV8bdqZn9IzNAjLquuE73g071r0/KOxWhWNjc/rApPdO
 2Y+aVwUt0KDKpR12CUJ3tZWn0d61VbIc7UAQBDkz93kk4P6zbHgcMIU8NySy/BU=
X-Google-Smtp-Source: AGHT+IFPilfIjchy1WpHOB2PVzkT8TAJyYZ+8ZT+pxkXiNPncpmjg8VV9gQphuErsr2y4+xTVUd3dw==
X-Received: by 2002:a0d:f4c7:0:b0:608:cebf:1bbb with SMTP id
 d190-20020a0df4c7000000b00608cebf1bbbmr1003238ywf.52.1712323564926; 
 Fri, 05 Apr 2024 06:26:04 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 t200-20020a0dead1000000b006151caa9e07sm357436ywe.2.2024.04.05.06.26.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 06:26:04 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-617dfcf80aeso1303927b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 06:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXahBBHDYXmRP1xWM5fwziJio2IDggbfceXtV1NbWwjDbgcYtAwkdQbbJgUu3SfYJWt1HKBmixQSUEWmc9Au4wTRfNWbBxkUtlq0vTXapQC
X-Received: by 2002:a05:6902:220b:b0:dd1:37ff:696 with SMTP id
 dm11-20020a056902220b00b00dd137ff0696mr1555021ybb.59.1712323543740; Fri, 05
 Apr 2024 06:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <dac98a697c8e850054f984964af62a209f241c83.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <dac98a697c8e850054f984964af62a209f241c83.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 15:25:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRLwv1c+L0DP_jRJh6_=-oTQJWOcYCzYqowW8tyOJK2A@mail.gmail.com>
Message-ID: <CAMuHMdVRLwv1c+L0DP_jRJh6_=-oTQJWOcYCzYqowW8tyOJK2A@mail.gmail.com>
Subject: Re: [RESEND v7 23/37] dt-bindings: display: sm501 register definition
 helper
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
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
 Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 David Rientjes <rientjes@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Javier Martinez Canillas <javierm@redhat.com>, Guo Ren <guoren@kernel.org>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
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

Thanks for your patch!

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Miscellaneous Timing and Miscellaneous Control registers definition.

Please do not put raw register value definitions into DT bindings.

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

> --- /dev/null
> +++ b/include/dt-bindings/display/sm501.h

> +/* Miscellaneous timing */
> +#define SM501_MISC_TIMING_EX_HOLD_0    0
> +#define SM501_MISC_TIMING_EX_HOLD_16   1
> +#define SM501_MISC_TIMING_EX_HOLD_32   2
> +#define SM501_MISC_TIMING_EX_HOLD_48   3
> +#define SM501_MISC_TIMING_EX_HOLD_64   4
> +#define SM501_MISC_TIMING_EX_HOLD_80   5
> +#define SM501_MISC_TIMING_EX_HOLD_96   6
> +#define SM501_MISC_TIMING_EX_HOLD_112  7
> +#define SM501_MISC_TIMING_EX_HOLD_128  8
> +#define SM501_MISC_TIMING_EX_HOLD_144  9
> +#define SM501_MISC_TIMING_EX_HOLD_160  10
> +#define SM501_MISC_TIMING_EX_HOLD_176  11
> +#define SM501_MISC_TIMING_EX_HOLD_192  12
> +#define SM501_MISC_TIMING_EX_HOLD_208  13
> +#define SM501_MISC_TIMING_EX_HOLD_224  14
> +#define SM501_MISC_TIMING_EX_HOLD_240  15

E.g. these are used by the (not very descriptive) "ex" property:

     ex:
       $ref: /schemas/types.yaml#/definitions/uint32
       description: Extend bus holding time.

Please instead use an enum for the actual holding time ([ 0, 16, 32,
...]) in the DT bindings, and convert from actual holding time to
register value in the driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
