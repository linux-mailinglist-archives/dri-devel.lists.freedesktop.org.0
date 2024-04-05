Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8373D899D59
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0E1113BC3;
	Fri,  5 Apr 2024 12:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDEF113BC4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 12:45:05 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-615038fc5baso22522537b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712321103; x=1712925903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=73KC80zFmtS9rJCbcCR2ges0599ShCvdMicVyQb7erI=;
 b=AVCeLqgbz/dG1WwljFJrB6YSj0wuOIrAXVP1FNtlCPp9sGVrAKLDE4b+hYTGMLtrV8
 FMw2OziiYN3kQXjmGl0XmrNIQRZN8bDTAQvw5qs/Fd7lRulEJQusF6BNYVxPUbE0vme7
 ViIx6vvE4Qq6YA2uofXIainNp7gkPen9gF1bUHn+DZ1jn+mVAlZIxMfSKTmhBHKryMTZ
 RhYMcMyq8cvkR6KwdTpYgAbDMa18hT+6b338XrUHnd6A3O8HkBNskZmVuAfWcTjUmXlj
 gZIQ3rF7tntWebZ8lAGR83qv0HPR6c/NBcCOYLgi/2+F/4tOcwZ1qHl5H8HhQyY5uHGt
 9kOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGcZ7hM7JZ0TRq9jLk3iYtdY7IWv4DptZc/50F+iUvV84AjBb2vthBj3+9ubWyBhLCxlisn6bY2jdIvFebs96gqYG8xrtbs62MihoNof4s
X-Gm-Message-State: AOJu0Yy9fvn/TS0utp/UWxUhqn2v1RGC0m97PbEGH9ISpVHCOdU1o5Zv
 poNPpA3JRky1ccOsy5VIcdvsuVRPgs6uHgUB5i/W+rudIwBv/vzcRPV3FrOXekE=
X-Google-Smtp-Source: AGHT+IFs7EsWYUPtwclFpSlaoXul46SBQkqZH1c10bzSPCzudVFCjamE8FqtkqvcyA6z3Pu39btzTg==
X-Received: by 2002:a0d:ea10:0:b0:615:b94:1c7c with SMTP id
 t16-20020a0dea10000000b006150b941c7cmr1251110ywe.18.1712321102946; 
 Fri, 05 Apr 2024 05:45:02 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 x10-20020a81af4a000000b006154c0fd1e3sm336872ywj.76.2024.04.05.05.45.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:45:02 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-61587aa956eso18825547b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:45:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5hXa2t1ClYVCryNaS/tognOmFMe5a4lTjofeyDHgRKZRogBLuJtJyh6j+9iEZmfdLbpje5+RDRZFD5aED0falDqoL67GgknTCw49XVnou
X-Received: by 2002:a25:b049:0:b0:dda:aace:9665 with SMTP id
 e9-20020a25b049000000b00ddaaace9665mr1048383ybj.60.1712321081791; Fri, 05 Apr
 2024 05:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <7cffb0c041744b3c2e324f9908635a912dbb2436.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <7cffb0c041744b3c2e324f9908635a912dbb2436.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 14:44:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBNXJ6ATHYUftB4FFVw_JJ3p-sifZYAb7jUmok10tkbA@mail.gmail.com>
Message-ID: <CAMuHMdVBNXJ6ATHYUftB4FFVw_JJ3p-sifZYAb7jUmok10tkbA@mail.gmail.com>
Subject: Re: [RESEND v7 33/37] sh: j2_mimas_v2.dts update
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

On Thu, Apr 4, 2024 at 7:16=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

From my comments for v6:

Please enhance the one-line summary, e.g.

    sh: j2_mimas_v2: Update CPU compatible value

For the actual changes:
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
