Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 450138058BA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F331310E34C;
	Tue,  5 Dec 2023 15:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8A310E0E6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:29:52 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-28670a7ba84so1786718a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701790192; x=1702394992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nKR4eGh9Q8YilRGEEfPHT07Wa+ghJ3PZE9UUZkDUQSU=;
 b=b8+cfpG/BfWH4OL/EP4ovakdV7uPV9O6B+iFqk79kifE94NQMh1g1mu5e6eHDkKYAz
 LcVomqLTYo5r/3sK+dTlveZ64nDwk80BvzYjRQYFRqc3YhIXuRxqv+3CiFK+YsE02wly
 pOaAAcsvVw/6ByF4ZUL9CKZWGgOpsaL4ydjGhvBqvtOQqsWbO97+w+WJeq8Ap597cpgl
 uHVZ/G9xsE3HJkIRb/wQcldkk7r3XCmwrygZ33lxJMgvku7SewSAMCp6MkxSo5qzEQMy
 CgMKKuaMLJAG2meLDith3ZWrvHvL10qO8eUfGi/aAEIn89WQl/LFGuKUJSXU8ekovDL1
 Tz1g==
X-Gm-Message-State: AOJu0YzKOnZ9HQ+OugIAnsnNLJFKbBMOpw3Depy2RsDrW/PeWEgIyl7j
 2P1CQhJ3uhhX1Kr7ksHilb4kXH0HFLeurQ==
X-Google-Smtp-Source: AGHT+IFor3wkxQHVhsuAlz4nqmZz4SAN0GRM9IL2JaWfb1o04Ga36Qna61n0oSgkNH5KdK1hxEUDhw==
X-Received: by 2002:a17:90a:30f:b0:286:ca3e:be98 with SMTP id
 15-20020a17090a030f00b00286ca3ebe98mr1112808pje.52.1701790191670; 
 Tue, 05 Dec 2023 07:29:51 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54]) by smtp.gmail.com with ESMTPSA id
 19-20020a17090a1a1300b002864c14063fsm9561798pjk.20.2023.12.05.07.29.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:29:51 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-286e57fde73so465110a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:29:51 -0800 (PST)
X-Received: by 2002:a25:870f:0:b0:db7:d3e0:46d1 with SMTP id
 a15-20020a25870f000000b00db7d3e046d1mr4072755ybl.32.1701790170465; Tue, 05
 Dec 2023 07:29:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <91a4cac133cb7244903e872b9e63fbbd57fbd68c.1701768028.git.ysato@users.sourceforge.jp>
In-Reply-To: <91a4cac133cb7244903e872b9e63fbbd57fbd68c.1701768028.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 16:29:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNQ_u0O1ANv6zdao5SOp9H=WLuULnYuvAt2tgAfsp_GQ@mail.gmail.com>
Message-ID: <CAMuHMdUNQ_u0O1ANv6zdao5SOp9H=WLuULnYuvAt2tgAfsp_GQ@mail.gmail.com>
Subject: Re: [DO NOT MERGE v5 09/37] dt-bindings: timer: renesas,
 tmu: add renesas, tmu-sh7750
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

On Tue, Dec 5, 2023 at 10:46=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Add SH7750 TMU entry.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -21,6 +21,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,tmu-sh7750   # SH7750

Please preserve alphabetical sort order.

>            - renesas,tmu-r8a7740  # R-Mobile A1
>            - renesas,tmu-r8a774a1 # RZ/G2M
>            - renesas,tmu-r8a774b1 # RZ/G2N

The rest LGTM.

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
