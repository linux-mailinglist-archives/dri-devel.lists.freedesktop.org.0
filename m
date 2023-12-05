Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D931F80580C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4956010E56E;
	Tue,  5 Dec 2023 14:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D6910E55D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:58:13 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6ce52d796d2so2017064b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701788293; x=1702393093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2OSy1fkE1VPCMMZW3HW28WvB6VxFaRMTrE1La3jBwPw=;
 b=Zly4O1rlYUNnu583hiFM+2cQfYMiD5zWhwanmDcNysLrYxuDYtElDR5oazpRt6oG1p
 WtPrRu/A/CIVqaSAqLp/5diZY19g0tEsdelbMPzPDRznVVMyPn8OfKukIHMotOTzzekz
 aT21lsgq0aToE/f69l9yK7vOxHGgjgtJn3jqPnhp2AJDcBH15xDQI5qXhYjODX8AydZd
 s0b0SrUCB2p7DKu1PeDuSis+WWb6UUO25GHVdS1VQ6inmdUl9PZQeG/TEhUYv6j7Wb1P
 8ARah/RZ/+DcsSUvw6GkswOhyD1SJ2PJmJhPr0x8QPZcqbmPUx09gUK6dTkM1Or7FtSi
 IjxQ==
X-Gm-Message-State: AOJu0YxKY4SQHcKEiCB5vDV4x1EdRtbpiteD5MnveuphztDkdu8TEKkR
 YO0Kk+jPcDCMj1hZmpjmbtkoFNXnybQDAw==
X-Google-Smtp-Source: AGHT+IGDLH4Kg/RPqJrMnxCHCgsts+iFRa0MQvIkSNYYfk1E9W1C4+Mc9t1VNLhjC0tActXmC6JXww==
X-Received: by 2002:a05:6a20:5492:b0:18f:97c:975f with SMTP id
 i18-20020a056a20549200b0018f097c975fmr7686647pzk.71.1701788293058; 
 Tue, 05 Dec 2023 06:58:13 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com.
 [209.85.215.171]) by smtp.gmail.com with ESMTPSA id
 v14-20020aa7850e000000b006cde2889213sm946467pfn.14.2023.12.05.06.58.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:58:12 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-5c6b9583dcbso68085a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:58:11 -0800 (PST)
X-Received: by 2002:a05:690c:c9d:b0:5d7:1941:2c27 with SMTP id
 cm29-20020a05690c0c9d00b005d719412c27mr4909480ywb.84.1701788271024; Tue, 05
 Dec 2023 06:57:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <9f1485220fbfaba9b30bf2d9352640f988f35b04.1701768028.git.ysato@users.sourceforge.jp>
In-Reply-To: <9f1485220fbfaba9b30bf2d9352640f988f35b04.1701768028.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 15:57:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsBOs0Y7CkzhxkMYWWzyBpp1MesiCHc728FoTMNQs+qA@mail.gmail.com>
Message-ID: <CAMuHMdWsBOs0Y7CkzhxkMYWWzyBpp1MesiCHc728FoTMNQs+qA@mail.gmail.com>
Subject: Re: [DO NOT MERGE v5 21/37] dt-bindings: serial: renesas,
 scif: Add scif-sh7751.
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
> Add Renesas SH7751 SCIF.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -17,6 +17,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - renesas,scif-sh7751       # SH7751

Please preserve alphabetical sort order.
The actual compatible value LGTM.

>                - renesas,scif-r7s72100     # RZ/A1H
>            - const: renesas,scif           # generic SCIF compatible UART

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
