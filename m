Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB9869F63
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 19:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB29710E53C;
	Tue, 27 Feb 2024 18:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137A710E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 18:48:46 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6e28bd74883so30752a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709059724; x=1709664524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBLgqi5po9yo82z/olqeDeT73/ia9ZIG/TwGXRPLny8=;
 b=BKEUWSHwpE9mLszUWDLUwtuc+0FSXVa7eAl+ZkkKr00Ii87FpO6hY0/ZLvOwSPH9ck
 0wKsSND+9KLuV8xFAhbYfkZZm/RPQDs0Vxk2xEGfXpfjHffRCbWUQAbXY8GzvnsaAj0C
 kS51abBbqAr37WNfIuDp7fM9QHAj6wez0Ixser5oPWMaE6QZ92h5JlftTBvNsX+f+fjb
 lXUYBN2jKyC2hqT+00XVeIUNX8cwf/nQgs9sv/+BWclD1MfNxP75wqf0onIZg5117XMx
 ZYaGAYl4Ae2Ukcd7qGpRvLSFxvg/nLHQIsdn9gal7VYNpyE+RKNj2TKcVXnujdbw4Li3
 uB/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbM7K0GCf06JFF51PqgPumyg+o1my9y40NixWv12wXZtWa3UVib8Rahy6RhDY56XOsZqgeZXREbj5oZaX1sTej0fI0UfjBrIBUQwZCybaA
X-Gm-Message-State: AOJu0Yx0re/N2Fv1SYjh9wwvqlHLPwJQ9NuMODq69+oYoWggRC+vG6jP
 4GlhgZmvgUBAnLTlfZic486QhE3HFEgN566xx6leMoWc9aAS1TPgv6Gx+pMzC5fleg==
X-Google-Smtp-Source: AGHT+IHh6380/La09l30dttKdjtudMbv22/SiVjKiGfLQiZVCaDeLpUdfPpOwGzlkJqt18oihCxTRg==
X-Received: by 2002:a05:6830:39c7:b0:6e2:deb3:a3b6 with SMTP id
 bt7-20020a05683039c700b006e2deb3a3b6mr87164otb.11.1709059724437; 
 Tue, 27 Feb 2024 10:48:44 -0800 (PST)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com.
 [209.85.160.53]) by smtp.gmail.com with ESMTPSA id
 j9-20020a9d7d89000000b006e4ac74c6c1sm306308otn.81.2024.02.27.10.48.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 10:48:43 -0800 (PST)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-21f5ab945e9so36744fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:48:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWgyAKTgAK3UdkymB5zZBRgzEd9EFWu2PakKwWLjDFMj8p3+JfwLfT2sscRlf+drLh4iNK1HKErq9/M08F/0PoKW3fbr5/U3XmBlXx/+51e
X-Received: by 2002:a25:414a:0:b0:dc7:494e:ff33 with SMTP id
 o71-20020a25414a000000b00dc7494eff33mr220625yba.7.1709059702806; Tue, 27 Feb
 2024 10:48:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <f1f58604dd76520005c12479fada0b70ac210f89.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <f1f58604dd76520005c12479fada0b70ac210f89.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 19:48:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxZzBD0WRhx07MYdLvamg+1twRvAxGMRM5+4-pYeDTRQ@mail.gmail.com>
Message-ID: <CAMuHMdUxZzBD0WRhx07MYdLvamg+1twRvAxGMRM5+4-pYeDTRQ@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 34/37] sh: Add dtbs target support.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, 
 Helge Deller <deller@gmx.de>, Heiko Stuebner <heiko@sntech.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Yang Xiwen <forbidden405@foxmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 David Rientjes <rientjes@google.com>, Baoquan He <bhe@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng@tinylab.org>, 
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, 
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

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

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
