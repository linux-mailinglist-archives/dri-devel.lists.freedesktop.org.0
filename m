Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052968298E2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D60310E750;
	Wed, 10 Jan 2024 11:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BF610E750
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:24:15 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7bed9c7d33fso62332839f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704885854; x=1705490654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rp53vQ2ebf1f54OIMX+oacHnmEBZZdohJKcQphr0pdo=;
 b=pJwnG1usT6RDeiNWZMhftRkmc9OdaUQpU7D8KB0qwVsIy20yQdg+3U5aF4v6ZWPJDc
 3UzXeDaCDhCUEnRpXyKM3fHO54YVbU7hEFwzEV9NMq0LaZHAJciXW9XTePmgyTreetFt
 +9u6GHL+oUd1cO48DG1Fsq03z+ZcQDD8CFw7ZUtuoq7ohxHLFD9BRbgmogNJqW6ndNTR
 AVPLoInUKwB8pq7hTW+j6rXAmsemFXpLYNQcja1KNd9djTG8m4oR58jMyeSe/vNEcGs+
 BixzlmmpHDfITvPPwktYuvMfT1iqsuQdiOCPTbKUbhIhaYYLMRas+DzcfcAldz7b+spE
 xSEQ==
X-Gm-Message-State: AOJu0YzXwiLGcKMFZmUlnqgbsMn/i9ixGsMq6h2/xD4sH56kcw21e5ji
 71RRBHQYIV6l5ILtnfPzni6pT6bFCMmHdb6l
X-Google-Smtp-Source: AGHT+IEyIGKoLoZz7Xv3ERlMRkf4PEeu889wEwp+XEcnat2bEzkPjV1UGnbTH3qJcR2So+w/hOUVcQ==
X-Received: by 2002:a5e:df45:0:b0:7bc:3a38:43e2 with SMTP id
 g5-20020a5edf45000000b007bc3a3843e2mr571395ioq.39.1704885854594; 
 Wed, 10 Jan 2024 03:24:14 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173]) by smtp.gmail.com with ESMTPSA id
 fr3-20020a056638658300b0046df77733acsm1237367jab.102.2024.01.10.03.24.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:24:13 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3608aa647bfso14421785ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:24:12 -0800 (PST)
X-Received: by 2002:a81:9295:0:b0:5f0:5816:f339 with SMTP id
 j143-20020a819295000000b005f05816f339mr802434ywg.46.1704885831172; Wed, 10
 Jan 2024 03:23:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <c8aaf67e3fcdb7e60632c53a784691aabfc7733e.1704788539.git.ysato@users.sourceforge.jp>
 <20240109-fructose-bundle-05d01033277b@spud>
In-Reply-To: <20240109-fructose-bundle-05d01033277b@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jan 2024 12:23:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1z64QHJOVd3jUsOfyuDApB1+khkUV8PvjoKbwsi327g@mail.gmail.com>
Message-ID: <CAMuHMdU1z64QHJOVd3jUsOfyuDApB1+khkUV8PvjoKbwsi327g@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 26/37] dt-bindings: vendor-prefixes: Add smi
To: Conor Dooley <conor@kernel.org>
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
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
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
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,

On Tue, Jan 9, 2024 at 7:06=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
> On Tue, Jan 09, 2024 at 05:23:23PM +0900, Yoshinori Sato wrote:
> > Add Silicon Mortion Technology Corporation

Motion

> > https://www.siliconmotion.com/
> >
> > Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 94ed63d9f7de..a338bdd743ab 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1283,6 +1283,8 @@ patternProperties:
> >      description: Skyworks Solutions, Inc.
> >    "^smartlabs,.*":
> >      description: SmartLabs LLC
> > +  "^smi,.*":
> > +    description: Silicon Motion Technology Corporation
>
> How come "smi" is used for a company with this name?
> Why is it not something like SMTC? There's probably some history here
> that I am unaware of.

See Documentation/devicetree/bindings/display/sm501fb.txt
The stock ticker is "SIMO", though.
https://www.nasdaq.com/market-activity/stocks/simo

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
