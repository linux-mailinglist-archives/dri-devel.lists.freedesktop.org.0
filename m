Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8700A8CA8D6
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334E410E42A;
	Tue, 21 May 2024 07:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A79889BEC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:20:12 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-4df550a4d4fso1033948e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 00:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716276010; x=1716880810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KTzn0hU9Z4UN/kHuOvflOdET5gWXbcBejm7dn9vrh4=;
 b=S+kUYyq491yEbfAnJMJM6OqQza66TIgSN/iSPeZbnxGHAyS5q465OPi30Ozyj75yRi
 lCW5etujdnPKU9wdghrbOr1KKxBj049j7B9TwaGiO4GVpA7uoPSzj25Z7gu/WnV+XF/I
 pgw1oy08VyngcVkP7Pz9fPL9moh8H7SWs0LFZAKXjWI/THxreX7hUDi3e2fwv8oD2cZW
 /vx9b9K2mdqqaSCf36OjvxsWt5i7D7y3yeKRzISo7Rw9MNOgWNFYpdGf6SsdskWsg0Bg
 ugKjzjDffFI2r5iddzlhFmUHByqjwCKEBngH8VyCPhHI8c26np8lGyYHkUWBAodkmeoB
 a03A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdKVpj6pD0ve0KjhCUw1rf4SGr7QoMEWnTwblRFDEa1ZiHc/SICgnR5Tds7du3IWyrcOQkQfMdi/OP/CSOS3+nOPdoZsiqktg9WV4ypd6H
X-Gm-Message-State: AOJu0YzYczPtChNfN+69bF3Z9hkkV4CQzR836kkewY/sCge51ck4raCm
 a6fIiTlCgvwv1J6YME96Eo4F0z0WTeflMaxuURkPXp08gEGsCtto6AqqcC5O
X-Google-Smtp-Source: AGHT+IHkJzMQsMXy5fq1gawDM5e/hFmBJrwxQlIpZZA18x5lpBUcVEYGbtCp9Dm31wZLAR45SaHF9g==
X-Received: by 2002:a05:6122:4123:b0:4df:7ba8:5c73 with SMTP id
 71dfb90a1353d-4df883692e2mr28538104e0c.14.1716276010388; 
 Tue, 21 May 2024 00:20:10 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com.
 [209.85.219.47]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf315009sm1261968185a.118.2024.05.21.00.20.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 00:20:09 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-69b6d36b71cso14576056d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 00:20:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIPmk/2uVZW6KiROhwirOXYxAmMl9TKaA1hgtBHaDE+9KQuebzklzaAlZf8fAvZJ9FAPswh/UtEhh3je3lw5VU+Nr451Ozf58Shfl5JxuS
X-Received: by 2002:a81:ae5f:0:b0:61d:fd3e:8e8f with SMTP id
 00721157ae682-622affa8b29mr418170827b3.25.1716275988366; Tue, 21 May 2024
 00:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712205900.git.ysato@users.sourceforge.jp>
 <455e40c03314294f9c2e64480aa69f8261a3f2d5.camel@physik.fu-berlin.de>
 <87fruc8wg4.wl-ysato@users.sourceforge.jp>
 <46c11cf9f837416470c50fa678df0ddb94a0a22e.camel@physik.fu-berlin.de>
In-Reply-To: <46c11cf9f837416470c50fa678df0ddb94a0a22e.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 May 2024 09:19:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwhoWzeS78JKVJzxZ9B4-TTOSH8rX4eyYTdpYgaepjzQ@mail.gmail.com>
Message-ID: <CAMuHMdWwhoWzeS78JKVJzxZ9B4-TTOSH8rX4eyYTdpYgaepjzQ@mail.gmail.com>
Subject: Re: [RESEND v7 00/37] Device Tree support for SH7751 based board
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rich Felker <dalias@libc.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>, 
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

On Mon, May 20, 2024 at 5:25=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2024-05-20 at 22:06 +0900, Yoshinori Sato wrote:
> > I'll be posting v8 soon.
>
> Sounds good! Maybe we can start merging the patches that contain fixes on=
ly
> and that have already been reviewed. This way, we can reduce the overall =
size
> of the series a bit.

+1

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
