Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9080583A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5D110E561;
	Tue,  5 Dec 2023 15:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77CC10E557
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:08:28 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7b45ab9e084so29182539f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701788907; x=1702393707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MBiG9HxZoSdr8SoEZSK/a3wB0uDxAZ7A8FUVFW1eSbA=;
 b=bs579s9uVEHG4cJK5zBn3v3Y2wWDqHKD6gfw5ENvWlGk3eE+NNzXvPuZ7pcMNHm5Co
 0WXJD1OHv+dMBFxcuLjAJ7IWWCAGD5Wqoyr3oqKDCxHweJTXBvAAvt1dqli1UpQE8myl
 +qTUyXUZBIefSCWPM1Rwk0zPrhaui1WEiv8mZMzQRb4Uyi8fjBcFnbKYzIhblW45MOEa
 Ur9/6palmPOHLN+PatV6biEyvTgGxv7J3r64TAaLGwSCnIgdWH2pIp0nEtMQ5QjW6Py3
 Syo8mjC+VEt8I01/hj1yI7Tknvg7Jt8jatv2ovtseju8Er5fsqPbZBW792G+JH6WR6Jn
 wOdA==
X-Gm-Message-State: AOJu0Yyv2yIct0XWZxXbbEJ8DC0wrvt+OpECfiEdCImmXy9MuH3NwSzr
 L5tyjUP0n7hkTxPcX7o3pcvYK6hDWPG17A==
X-Google-Smtp-Source: AGHT+IFZJ34N1ZqKNGEj5VTodY7W/msbWj1st1fVmV9ed+d3YG39A8/126OdbidaO93LoxwhAhdy9Q==
X-Received: by 2002:a5d:974a:0:b0:7b4:28f8:1dfa with SMTP id
 c10-20020a5d974a000000b007b428f81dfamr7706712ioo.25.1701788907560; 
 Tue, 05 Dec 2023 07:08:27 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056602184800b007b438ffbdfasm1748418ioi.18.2023.12.05.07.08.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:08:26 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-35d6b381341so9938385ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:08:25 -0800 (PST)
X-Received: by 2002:a05:690c:b9a:b0:5d3:ec19:d067 with SMTP id
 ck26-20020a05690c0b9a00b005d3ec19d067mr3373868ywb.35.1701788884398; Tue, 05
 Dec 2023 07:08:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <c796ca5adc21c55f92968070e7f13201fe5b3f4a.1701768028.git.ysato@users.sourceforge.jp>
In-Reply-To: <c796ca5adc21c55f92968070e7f13201fe5b3f4a.1701768028.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 16:07:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZadFO6TF_X_H2aRdGvePLhREvwWfEP==Mm-Ah5BkC3Q@mail.gmail.com>
Message-ID: <CAMuHMdWZadFO6TF_X_H2aRdGvePLhREvwWfEP==Mm-Ah5BkC3Q@mail.gmail.com>
Subject: Re: [DO NOT MERGE v5 24/37] dt-binding: sh: cpus: Add SH CPUs
 json-schema
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
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sato-san,

On Tue, Dec 5, 2023 at 10:46=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Renesas SH series and compatible ISA CPUs.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sh/cpus.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sh/cpus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SuperH CPUs
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +description: |+
> +  The device tree allows to describe the layout of CPUs in a system thro=
ugh
> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu"=
)
> +  defining properties for every cpu.
> +
> +  Bindings for CPU nodes follow the Devicetree Specification, available =
from:
> +
> +  https://www.devicetree.org/specifications/
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,sh2a
> +          - renesas,sh3
> +          - renesas,sh4
> +          - renesas,sh4a
> +          - jcore,j2
> +      - const: renesas,sh2

Plain "renesas,sh2" should be accepted, too.

> +
> +  clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      CPU core clock freqency.

frequency

Although clocks below is more flexible.

> +
> +  clocks: true

maxItems: 1

> +
> +  clock-names: true
> +
> +  reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 0

Some SH systems are SMP, so non-zero values should be accepted.

> +
> +  device_type: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - device_type
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sh7750.h>

fatal error: dt-bindings/clock/sh7750.h: No such file or directory

sh7750-cpg.h


> +    cpus {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        cpu: cpu@0 {
> +            compatible =3D "renesas,sh4", "renesas,sh2";
> +            device_type =3D "cpu";
> +            reg =3D <0>;
> +            clocks =3D <&cpg SH7750_CPG_ICK>;
> +            clock-names =3D "ick";
> +            icache-size =3D <16384>;
> +            icache-line-size =3D <32>;
> +            dcache-size =3D <32768>;
> +            dcache-line-size =3D <32>;
> +        };
> +    };
> +...

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
