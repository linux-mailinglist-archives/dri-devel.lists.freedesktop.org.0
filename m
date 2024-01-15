Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7B82DAE4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 15:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BDB10E2C4;
	Mon, 15 Jan 2024 14:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9AA10E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 14:04:07 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6ddf1e88e51so3754474a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705327447; x=1705932247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I77TmnyBV7p1SE2Y2oqkytZuiHCFq9qru4QC+6Q3tDs=;
 b=L0b3KzlYsuVgDBsHK7TIPL3BbkvRZufDKlUcA6xTRddN/5/u7QKqjLexjrGli/t4hY
 1Bn8rGFn1aCR2/A+7rLqpMnIEgvFgmPxv8Tut6hvkioYpKmn/1W08YLJZ0bzewIQtc51
 wkXw1u/w02k3RR9qnN+4l95nmDxNJsqNLGAqlQLh8ss7NLgHmyt7sEvdlzfn5CAeuqy9
 /Cq24Go5o2DR8w3QqjHmvzD1PrfrlKA88D8YKSmNJcfeKImpM9D9HyJ4BhuEyOlu+DSU
 ZytWyyLKWQSRFaMB9kPwGRrF8vFjPWzEEhNVq+CGo062TJi/WnyObu1uGbfbF5zCjhQ2
 Yv+Q==
X-Gm-Message-State: AOJu0Yxy/x2xKe4J+4EGpPfdElElDq+fR+fe9km2xY+tLRjDkRI2b4rv
 vWWrrGIsE89Nc7rfBljWRTmmkmn83Jry5Q==
X-Google-Smtp-Source: AGHT+IHe55qzJSopXpfnrmgb+IHcmuvesqvVHOXTDtsyWUsuE/aU1TWzXOvwAL2fbGgaQA41VjmAGg==
X-Received: by 2002:a9d:7604:0:b0:6e0:2f9c:4c2f with SMTP id
 k4-20020a9d7604000000b006e02f9c4c2fmr5895529otl.5.1705327446586; 
 Mon, 15 Jan 2024 06:04:06 -0800 (PST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com.
 [209.85.161.51]) by smtp.gmail.com with ESMTPSA id
 u128-20020a4a5786000000b0059870bf6492sm1759104ooa.21.2024.01.15.06.04.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:04:06 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5986cb7bb61so3724000eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:04:06 -0800 (PST)
X-Received: by 2002:a81:410d:0:b0:5f4:a5ab:4105 with SMTP id
 o13-20020a81410d000000b005f4a5ab4105mr2813928ywa.8.1705327425927; Mon, 15 Jan
 2024 06:03:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <edd42bb5aa30ac3eb26a9e08b1dc6fc9041aa3b1.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <edd42bb5aa30ac3eb26a9e08b1dc6fc9041aa3b1.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 15:03:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=CZVSc16FeVDc6YmTKw=xa71RUzOE3bappLwH2W8Z4w@mail.gmail.com>
Message-ID: <CAMuHMdU=CZVSc16FeVDc6YmTKw=xa71RUzOE3bappLwH2W8Z4w@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 01/37] sh: passing FDT address to kernel startup.
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

On Tue, Jan 9, 2024 at 9:23=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> R4 is caller saved in SH ABI.
> Save it so it doesn't get corrupted until it's needed for initialization.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v3 is still valid.

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
