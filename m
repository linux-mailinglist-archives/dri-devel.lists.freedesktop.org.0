Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C150899EA6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 15:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666B110FF96;
	Fri,  5 Apr 2024 13:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE2C113C13
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 13:45:11 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3bbc649c275so1144915b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 06:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712324710; x=1712929510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmgVg+1Qt1l7Val4LNuCcTFJSMT3ZujIhIoVP0zBFgM=;
 b=BOFBAWXMloRWwSJ1zobSYLj4VUSptetdVEPplO7Hx3vN57cJ7XtV4vtJmK5f8Ux8lO
 7KmZ16cjU1er2qFALQQPwoYOXSwM/mj5Xb1N2u2jmE9yJB5UjbQqTqfVTnH+VSP5E4oI
 Kw5U9HO3tgKzDYbgINeorI12rMQgYehD/AGZ1uuQmfylCk3fNqfwO9pG12Qoq04xk1NK
 1Q2bCL9U12au1qbkIxILbObqs7MCIpnlT7Ez3G9n4cc+ra1Sac60W7IdoqOL8lkB6Epc
 7w5zio+e9vpb+UQckYbNM7bMmuMjE9cVPTJ+nLAn92vjE81QD8tiuN7MoUXVYtd1c/AE
 mfeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYuSw8UfPXtRFCa7CjWohqVsafnMEW4enh0memBhPhTI/EW43DDqhXB2Z1i09ycWUm8iS+XD55t+j0dKo19H8MEPEIrf0pHmsmwv5gv/+m
X-Gm-Message-State: AOJu0YwiL9pfSbdmbDB4wW9yU5P3pRHgnJWEIRzuMNDGXAVqeJ6LQH7/
 dYMrQigF9uFz9hdy9UWxU7cW/8K6Yqhdqmc3cIr5lOhfEmHgTogkLJR+urdyJRU=
X-Google-Smtp-Source: AGHT+IElmSHHrNaNjKfV9MNd5cRbmKble3J2MXnDaUvSdP19pclVmIfoK90IeBqnREHaXqoqtt1KUg==
X-Received: by 2002:a05:6808:98:b0:3c3:d2e8:7e5e with SMTP id
 s24-20020a056808009800b003c3d2e87e5emr1515355oic.40.1712324708839; 
 Fri, 05 Apr 2024 06:45:08 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172]) by smtp.gmail.com with ESMTPSA id
 bw9-20020a05622a098900b004330090b874sm758527qtb.95.2024.04.05.06.45.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 06:45:08 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-789d76ad270so128869085a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 06:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWiriH9pvCxsXPbPyK7OhW3FN88SwEHh4hjc8hFSuo5aVJqndyer/lGQ7YQ9+1dGVkeVjKfz9h7KYDgyIok56dqREfraBRu08ByBU1myZa4
X-Received: by 2002:a25:9a05:0:b0:dcf:4793:9a25 with SMTP id
 x5-20020a259a05000000b00dcf47939a25mr1436501ybn.44.1712324686416; Fri, 05 Apr
 2024 06:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <3c2937039026fdb827709b2584528aca263f2668.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <3c2937039026fdb827709b2584528aca263f2668.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 15:44:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXetO4FJhL3rByXWS=vevkvNgbgevzTZgDFjh-F3TMb2A@mail.gmail.com>
Message-ID: <CAMuHMdXetO4FJhL3rByXWS=vevkvNgbgevzTZgDFjh-F3TMb2A@mail.gmail.com>
Subject: Re: [RESEND v7 28/37] dt-bindings: soc: renesas: sh: Add SH7751 based
 target
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

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/sh.yaml

> +  compatible:
> +    oneOf:

As adding more SoCs is expected, having oneOf from the start is fine.

> +      - description: SH7751R based platform
> +        items:
> +          - enum:
> +              - renesas,rts7751r2d      # Renesas SH4 2D graphics board
> +              - iodata,landisk          # LANDISK HDL-U
> +              - iodata,usl-5p           # USL-5P
> +          - const: renesas,sh7751r

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
