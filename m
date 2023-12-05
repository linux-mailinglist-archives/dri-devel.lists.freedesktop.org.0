Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BA805822
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9F210E56A;
	Tue,  5 Dec 2023 15:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6921010E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:02:35 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5cbcfdeaff3so67393547b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701788554; x=1702393354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01RE6ADoqVebgl/Ay4VLc+Nsg6c5Olp3h2V1YYqK/9g=;
 b=WDcY2H5+Qdsl/jXFeO8vojYtxQqS2dlILWxsbKWoRka6Q7OTdHgZr8hWVDfZgybTWH
 QuRcuhd9yvVSlU5czZbx5wS7bj5HjJJO7+f9FNhsoGGZ9B6Nlplrr+5iQCw45IvjTVI1
 OhSvM7fkvq1ZPdWulqi12paRbw/hLZducKhQz+km2xo6b684oUNj2WCdXWAKPrRjI5TX
 U3Rms9Xx8YJYyfCVyUdkSbaFxVkJ4xLeppKquhCwXCNqQujnCbTdqplVV0hIMx9OUszD
 HTemtH75fReS+N5/ivVBu1avRiLS7qXAK1cb358i3Gykd5/uzjx6Wb9XaGqtmEsSJ0fK
 1EXA==
X-Gm-Message-State: AOJu0YwCk5Nf6NW1RMTJBtJCBfCGvrtBiHsMHaM8lcGeRslgPjxvimko
 2b7WrUOs27nzC403nwvJy/xpdewgJFnwmQ==
X-Google-Smtp-Source: AGHT+IGJX6eMAB7jL1yVdBKMeWRE7Ew7+gC3j8nL/EG04tnZfpmBG5lzhj/HRdnDWQfjoeuop8Fp2g==
X-Received: by 2002:a81:7841:0:b0:5d7:1940:f3e3 with SMTP id
 t62-20020a817841000000b005d71940f3e3mr4363861ywc.75.1701788554343; 
 Tue, 05 Dec 2023 07:02:34 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 x72-20020a81a04b000000b005a7f676f305sm3743271ywg.106.2023.12.05.07.02.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:02:32 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dae7cc31151so4121910276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:02:31 -0800 (PST)
X-Received: by 2002:a05:690c:4443:b0:5d8:204e:acdf with SMTP id
 gq3-20020a05690c444300b005d8204eacdfmr3526411ywb.101.1701788531025; Tue, 05
 Dec 2023 07:02:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <1fafcf1c70ee4e38847bac1379bcb4555a237505.1701768028.git.ysato@users.sourceforge.jp>
In-Reply-To: <1fafcf1c70ee4e38847bac1379bcb4555a237505.1701768028.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 16:01:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXyn5+e8CxihmtFo_6chKkpZ_QyzEzAm_As1xQoDKnpA@mail.gmail.com>
Message-ID: <CAMuHMdWXyn5+e8CxihmtFo_6chKkpZ_QyzEzAm_As1xQoDKnpA@mail.gmail.com>
Subject: Re: [DO NOT MERGE v5 17/37] dt-bindings: interrupt-controller:
 renesas,sh7751-intc: Add json-schema
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
> Renesas SH7751 INTC json-schema.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh77=
51-intc.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/sh_intc.h>

make dt_binding_check:

fatal error: dt-bindings/interrupt-controller/sh_intc.h: No such file
or directory

sh7751-intc.h

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
