Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400578058A1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D4410E5A4;
	Tue,  5 Dec 2023 15:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F58210E04A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:27:49 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-db7d198e791so2940092276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701790068; x=1702394868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmso+Pyj6M965irEbY4qayX9k2jAUb4uqdD1fkCcZ8k=;
 b=kxBDgX+xDgZ1MFrtwzKF46luXayfwUGrrRRzofbBuS+hda6vQ+W4sbA/ZHlUhfV1Bg
 beEWkO8bxqpK37M5XXIy8nSfI8ZvEgrXgiuPsdljaGAEc7yJ550pzzcscPB8trCbnvTn
 5QhZDdf3kATYTrKZK8QJ2ViszDOwK/g9IiifeW8CcCSNBEgoDztvm2kdbX24EU6Q9Uwp
 +ZJ7i0nKFXMHXJA9xFjkYIFxM+NWMhUkJTD5YFDpqn6KA3ovjZvPMOovSN2wcgsf00Ra
 OoLG6u+bf/MSMupZigy6/FsEiQ40Ygh8JiUKRHgRARdr36rwkCbBuyW0nf8SFvgsaguj
 3oVA==
X-Gm-Message-State: AOJu0YzrlLBEqRNIJ8ppiIIdr+CEiMng+1i/17sZqLisZDDHT53SOl0l
 akoDS6XDLjFq9MYnLdgPF4d16tYIN12dWg==
X-Google-Smtp-Source: AGHT+IGmn2o7fyEuyVL7AHipe1psOFAhf/eN70EhqDdz+Qqm7RC9c3dQ0oVZbEqPgXEGq3Rr1Uq29w==
X-Received: by 2002:a25:60c4:0:b0:db5:508e:f7a8 with SMTP id
 u187-20020a2560c4000000b00db5508ef7a8mr858727ybb.2.1701790067877; 
 Tue, 05 Dec 2023 07:27:47 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 p127-20020a252985000000b00db3fa34142bsm3177234ybp.49.2023.12.05.07.27.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:27:47 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5d719a2004fso23752117b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:27:47 -0800 (PST)
X-Received: by 2002:a0d:df11:0:b0:5d5:c6c1:3522 with SMTP id
 i17-20020a0ddf11000000b005d5c6c13522mr2801851ywe.26.1701790046878; Tue, 05
 Dec 2023 07:27:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <e147fd6dd7aba44a6f408c3a42076b207be862fb.1701768028.git.ysato@users.sourceforge.jp>
In-Reply-To: <e147fd6dd7aba44a6f408c3a42076b207be862fb.1701768028.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 16:27:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZo5EwZZmgDC-nEwwKz5oLvjpz9iY022kv5KwbV7b_gA@mail.gmail.com>
Message-ID: <CAMuHMdWZo5EwZZmgDC-nEwwKz5oLvjpz9iY022kv5KwbV7b_gA@mail.gmail.com>
Subject: Re: [DO NOT MERGE v5 20/37] serial: sh-sci: fix SH4 OF support.
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
 Herve Codina <herve.codina@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-sh@vger.kernel.org, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
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
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>,
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

Thanks for your patch!

On Tue, Dec 5, 2023 at 10:46=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> - fix earlycon name.
> - fix earlyprintk hung (NULL pointer reference).

- fix SERIAL_SH_SCI_EARLYCON enablement

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -658,7 +658,7 @@ config SERIAL_SH_SCI_EARLYCON
>         depends on SERIAL_SH_SCI=3Dy
>         select SERIAL_CORE_CONSOLE
>         select SERIAL_EARLYCON
> -       default ARCH_RENESAS
> +       default ARCH_RENESAS || SUPERH
>
>  config SERIAL_SH_SCI_DMA
>         bool "DMA support" if EXPERT

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
