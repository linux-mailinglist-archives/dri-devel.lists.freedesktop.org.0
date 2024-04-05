Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A99899EEE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 16:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4DE113C36;
	Fri,  5 Apr 2024 14:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8618113C40
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 14:03:36 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78a2290b48eso122948285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 07:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712325815; x=1712930615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zo5dazFCTOKvFVcPPNzGvqZjg5emzEStKUearWVqE/4=;
 b=sySgIowo07i/vrfoJSi0XSrCynPsYjPUkHinPq5ypqEl1S2QsWRV3I7xKH9g/O50K0
 ikH/oLzHt2rJl1lQLJql8AXyP72J5D+oSc/I9P264tXDamh0AqQwSVvnmZteBl2zKyhF
 c5fOXNLxpCQaOsDcHMDd51cRjoa0zh0MDXzL3XUOyv7jwpoUQzUmZVCSfrIk2qdgDpeQ
 XdI3jNJcVRnhmzTyGPX+Ymbe+XINFaf8ADIPjgt7VC+RjVcDiRb75NcSfw3IGgz88ciF
 oCmX3E/jah4TEUoRsH2dLIQXRjlkTOP4xSJzu1r9BZpVw8VSsHuHB8vj1+N+9+3dc+d/
 uUIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFeu/zAwtXxhrR0ozu0YJ/JAb2eKtVHV0/x3YfbBgS8zq7Ok760uW/RUkkIs/vCRNKhEvcbiZ7SshTwiu9It3DUSdiDbjeNckV3AOxn0Ao
X-Gm-Message-State: AOJu0YyJ9PuSck+AVxcdPo28AuGytq/hd0bXQRTx+01JfBT8rLsLsNuK
 /FSBuykSr/i41BAQ/OBaEw9y1Tk7MS2XoC2KgQe8ECZQWMbxdQl3XKMJmFT2ABk=
X-Google-Smtp-Source: AGHT+IGc12+kSyCzNtHINisvQzRA0uKfvELFl3SdI8LVUHU4LJXJZRAFNyl4iIlPd0CCBy8DIe5JqA==
X-Received: by 2002:a05:620a:1199:b0:78a:5927:607c with SMTP id
 b25-20020a05620a119900b0078a5927607cmr1397795qkk.4.1712325814829; 
 Fri, 05 Apr 2024 07:03:34 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52]) by smtp.gmail.com with ESMTPSA id
 bl18-20020a05620a1a9200b0078a001f7fd8sm657467qkb.6.2024.04.05.07.03.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 07:03:33 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-699413fbd66so2624826d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 07:03:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUWR6UjlmNs9voV80ID3Ae39wdQNelu4QRuzR3eVz0/f3hx1PxWLQgu8j3z/YVRmjVv9cuAPGcYfpUzf4NJyrq5mhMeWdh9t98ijQam4e9k
X-Received: by 2002:a5b:b8f:0:b0:dc6:dd80:430e with SMTP id
 l15-20020a5b0b8f000000b00dc6dd80430emr1385717ybq.27.1712325790915; Fri, 05
 Apr 2024 07:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <f3af315d575fbec431bad9bfaf9790450ab31ad9.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <f3af315d575fbec431bad9bfaf9790450ab31ad9.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 16:02:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1vhCZ+mCKB27N57N7atLdxSmEUV8RWJf7uiZkfUvG0A@mail.gmail.com>
Message-ID: <CAMuHMdU1vhCZ+mCKB27N57N7atLdxSmEUV8RWJf7uiZkfUvG0A@mail.gmail.com>
Subject: Re: [RESEND v7 21/37] dt-bindings: serial: renesas,
 scif: Add scif-sh7751.
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
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Add Renesas SH7751 SCIF.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -18,6 +18,7 @@ properties:
>        - items:
>            - enum:
>                - renesas,scif-r7s72100     # RZ/A1H
> +              - renesas,scif-sh7751       # SH7751
>            - const: renesas,scif           # generic SCIF compatible UART
>
>        - items:


If this is applied after "[PATCH v2 2/2] dt-bindings: serial:
renesas,scif: Validate 'interrupts' and 'interrupt-names'"[1], an extra
"- renesas,scif-sh7751" line should be added to the 4-interrupt section
(below "- renesas,scif-r7s72100").

[1] https://lore.kernel.org/all/20240307114217.34784-3-prabhakar.mahadev-la=
d.rj@bp.renesas.com/

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
