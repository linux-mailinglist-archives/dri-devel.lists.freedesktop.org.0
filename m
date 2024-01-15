Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4A82DAE1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 15:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA86D10E2A4;
	Mon, 15 Jan 2024 14:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52010E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 14:02:40 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-68162965f6cso3821526d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705327359; x=1705932159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmpeOIqaC6PrGt9qvY+jgYWHyktprhcCdGj8iUM5P0I=;
 b=bXPgHfHFKxaFRj94+0kkltDMf1G5IItq7xosBx6m4ez0kXyEMuM7sQY6IuLbHSWUo0
 GMgWzfnGrmZCHefdD4r0jJ3wd3rrwJcYCO9tWBFSir8kEsbZ4uC1TkaoKiuUVQUQSgrD
 WrUtiwwnMLjzy2ZmP5kn79SjIrdHr2lJ2USsW7a6zpUnlznGPDzAggwloTbBya1GE9Tr
 Y/odyV2GoxuPjV7CSR+mb7N/O/o8vePZ5UKCgs3Cq33kAW7T1J82r12njXfvSl7RgDwF
 udnoI4iETfweDgfryTs6zCuefBk1VYHcRYj2QwasBC+sNYlzJLAGGPqpxYOrbfMgMY69
 0iQA==
X-Gm-Message-State: AOJu0YyE8wHU1LhtLjyEghhJ5u9rXinJQyIRzd+difdTD3UuoS32iTaK
 +rNasQvebArEovrgG4dhFKdEQTWKyw/lLQ==
X-Google-Smtp-Source: AGHT+IGtn229fMYgP9+lrTOmfreL44N0FfuWMCGdrw8lZI0fwm3/Niec9Ccm18bvMKC8xkiC8o/2Wg==
X-Received: by 2002:ad4:5e8e:0:b0:681:99c:99bb with SMTP id
 jl14-20020ad45e8e000000b00681099c99bbmr7330558qvb.60.1705327358788; 
 Mon, 15 Jan 2024 06:02:38 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 lg7-20020a056214548700b00680cac39daasm3322479qvb.25.2024.01.15.06.02.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:02:38 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-78104f6f692so669848485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:02:38 -0800 (PST)
X-Received: by 2002:a05:690c:fc3:b0:5ed:b2a2:1279 with SMTP id
 dg3-20020a05690c0fc300b005edb2a21279mr3185157ywb.16.1705327338023; Mon, 15
 Jan 2024 06:02:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <17c6381a733d34e8460fd2979f8b53804e808e04.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <17c6381a733d34e8460fd2979f8b53804e808e04.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 15:02:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSa0j_npPwcPqH0W2XG8je_A5osy4WjAe0nM_DpC7Ffw@mail.gmail.com>
Message-ID: <CAMuHMdVSa0j_npPwcPqH0W2XG8je_A5osy4WjAe0nM_DpC7Ffw@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 25/37] dt-bindings: vendor-prefixes: Add iodata
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

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Add IO DATA DEVICE INC.
> https://www.iodata.com/
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
