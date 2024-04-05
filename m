Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3968899D37
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2880113BB6;
	Fri,  5 Apr 2024 12:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DB2113BB6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 12:41:24 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5d8b887bb0cso1687633a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712320883; x=1712925683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PocJzIJm9BmbxkIOP3QKpq0ppKs7IoB/uMDxWflb82Q=;
 b=ga4ezakSAVnXIbH/tPmHpRzqrdTo0AXPgINBlNmEiKhxITI8jhCht3WO7YytVNK1UW
 mxGxULYit29jwkAhS6yD7lOtII4BqztdPpDOA/n8KV3R3idZCs046LYhIAu7TCpSXa1r
 OoHFx20sfgzvxy+rCeSFxXMNsvIi8NGUI09SrGOK1dDhov5lbOgmIVJstt1zYx1jKqqj
 dKhqorJV/C5g9+CZE9Y1lq7imPQcMlB5vKS+JoS9VRESlecyn7un0dGEqw7Q0v2Sn2gw
 EHEB7F6ZK+/8L/WOr4RuGz0gdMeHsFevjTesynCTNu3AZuBfKfSSIVrn9nmC6kQvXv7J
 +l/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTLBNaV62bq59lqP6g8wl5GNhJfzXJE1baR/JMblmyAoXzT2WzY6zhjxIX2l62OVt0+sIuGq/ZlviCiGwcmRg5WWqOxBp2bOYsescRU3s7
X-Gm-Message-State: AOJu0YxzJ9gFcrvsF1R0kZlIum2RvK6UqfbwI1SuJnqS7ItKBjScRehP
 xhBHUKnyaVjsZ56kKYd6CginQN7i4cJsBZXymXCQUIWCNHMHbHuQfA9xdv4dtLo=
X-Google-Smtp-Source: AGHT+IFJ8RDW5JKJ4Oxu86xV1PbvrDEnewEtNQNJA2zis0cYd/ME+YeHSCgzRfEHSFE6DPkrHlo+Vw==
X-Received: by 2002:a05:6a20:96cf:b0:1a7:3f74:52d6 with SMTP id
 hq15-20020a056a2096cf00b001a73f7452d6mr1457757pzc.46.1712320882991; 
 Fri, 05 Apr 2024 05:41:22 -0700 (PDT)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com.
 [209.85.210.181]) by smtp.gmail.com with ESMTPSA id
 u16-20020a170903125000b001dcfaf4db22sm1463699plh.2.2024.04.05.05.41.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:41:22 -0700 (PDT)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6ece8991654so1747933b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUEDNQI1RVnNvRChIdOVDBcRUGDxinOC/L98O8siAV/n+1Z3Ty4muISySVneOWXxOeWGsc58F8bZajL1QNbOO6OUH5DhHUEl0Fmyd1T6+ep
X-Received: by 2002:a05:6902:c06:b0:dcf:56c5:4298 with SMTP id
 fs6-20020a0569020c0600b00dcf56c54298mr1422009ybb.12.1712320861884; Fri, 05
 Apr 2024 05:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <1db8627e4ca50b9d2d27e95d245518cac1cd62dc.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <1db8627e4ca50b9d2d27e95d245518cac1cd62dc.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 14:40:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnioh8er_xDvEY8ny9TgEyfb9AR-p2paS7D4OrbKykvg@mail.gmail.com>
Message-ID: <CAMuHMdWnioh8er_xDvEY8ny9TgEyfb9AR-p2paS7D4OrbKykvg@mail.gmail.com>
Subject: Re: [RESEND v7 13/37] dt-bindings: clock: sh7750-cpg: Add
 renesas,sh7750-cpg header.
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

Thanks for the update!

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
>
> SH7750 CPG Clock output define.

(from my comments on v6) Please improve the patch description.

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

> index 000000000000..04c10b0834ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml

The actual bindings LGTM.

> +examples:
> +  - |
> +    #include <dt-bindings/clock/sh7750-cpg.h>
> +    cpg: clock-controller@ffc00000 {
> +        #clock-cells =3D <1>;
> +        #power-domain-cells =3D <0>;
> +        compatible =3D "renesas,sh7751r-cpg";
> +        clocks =3D <&extal>;
> +        clock-names =3D "extal";
> +        reg =3D <0xffc00000 20>, <0xfe0a0000 16>;
> +        reg-names =3D "FRQCR", "CLKSTP00";
> +        renesas,mode =3D <0>;
> +    };

Please read
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-=
properties-in-device-node

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
