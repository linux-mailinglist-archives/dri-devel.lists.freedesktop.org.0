Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5829182D603
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 10:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13E810E143;
	Mon, 15 Jan 2024 09:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F44010E240
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 09:30:15 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-28d2be70358so4905124a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 01:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705311015; x=1705915815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJZ9RgNzg7VLWUx8YQuwC3dXe057PkvGB0IXNBt0r28=;
 b=CC+6Hen+PP017CtWkQbb4wewd9q3f/VZy8ceAIMI2dyQ+bGGX0KeTbdCqZrWB6z1mG
 SXPA6inWH0Xx2zTmqfeNazYodEHFr+yWuk/vD9IhAi1ymrmXaypCdJ5nFUe6TllXXxvi
 ev9WiOWfjdkogXBhuRSt8CGE65DGllgAZX9Ju685DER623dLcL+j1CSflKKNUBM9aHAR
 UBd0NjcLrBYMwKrAM3luv0XpVboTjwoEqtdS6UlhnWs32aiu2r1Ws+uCxxDSLArCFsYC
 ZpyFHBbCml44/Bh2TZLX5+Cg+Y7VsENT19bsK/tOAuoGrB+fza8BT5nMPm6IFsyfhZ8j
 9wBA==
X-Gm-Message-State: AOJu0YxRNcCLKbv88ZnGlYFV3Q+uwmJ6u5OsTotjw93ZXGzfkDIpSI7D
 /bm1b2XQZLnQkXoX90ZWRurk36vYJLh+7Q==
X-Google-Smtp-Source: AGHT+IHMGyfqEuOnt15HRdL3McKcSg3I9adpP8vFKhP001mA55mYOabF53Zj+pwLf4WhePiFOSjq7Q==
X-Received: by 2002:a17:90b:2d8f:b0:28d:c3ec:8006 with SMTP id
 sj15-20020a17090b2d8f00b0028dc3ec8006mr2367853pjb.4.1705311014869; 
 Mon, 15 Jan 2024 01:30:14 -0800 (PST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com.
 [209.85.214.182]) by smtp.gmail.com with ESMTPSA id
 rr7-20020a17090b2b4700b0028d19ddb1afsm9255111pjb.33.2024.01.15.01.30.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 01:30:14 -0800 (PST)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d3e84fded7so44738035ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 01:30:13 -0800 (PST)
X-Received: by 2002:a81:8395:0:b0:5ca:607e:b16e with SMTP id
 t143-20020a818395000000b005ca607eb16emr3313628ywf.0.1705310992678; Mon, 15
 Jan 2024 01:29:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <dbaaf58b50b681cf03bc5ad3eef0a546fe863bca.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <dbaaf58b50b681cf03bc5ad3eef0a546fe863bca.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 10:29:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXw=FC5EsYSHw6y2GzT9pNPNEB1iO3DRVmMLjzuPfx8nQ@mail.gmail.com>
Message-ID: <CAMuHMdXw=FC5EsYSHw6y2GzT9pNPNEB1iO3DRVmMLjzuPfx8nQ@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 21/37] dt-bindings: serial: renesas,
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
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
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
> Add Renesas SH7751 SCIF.
>
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
