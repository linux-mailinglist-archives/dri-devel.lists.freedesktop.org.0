Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E19869B9F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 17:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A3B10E92A;
	Tue, 27 Feb 2024 16:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933410E92A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 16:07:39 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-42e323a2e39so27225991cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709050057; x=1709654857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHoeDfHGuL96HTfNJMCJ2+Eu2KeeOnl/Onf9zZl0DK4=;
 b=mRMHBaXhqOYKCL59rEWyqMD8SJRJSOCZr59iafy0BuMMhkbqJ4//mbZWHAfQoFEOuE
 3+CufOcCtNfI046c+Sb3m5gsg/XFsp3ohmo7zguvhQhmb75erwcWcTt3muXSxFTPzkX0
 68eKMjQWXkiFdi0ekmXeUVmoPbe/HkGnAzM+aZfnGWGFdKsSRlKlhQdk/zjMAl6lHhZR
 dlnBil7KQBDFNVHlt4U7N9Eukw6CENq9JGRHczWb7Q9ewUO1EWpAnLogvKysVYyW+ago
 L4SnnOQQO5PotvUf226Ykpz7G3Ado3NWfvHkTMsDTNZwtTg+yEtsTw7f6K99SKPDjbc8
 5e/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6qRRkBZ2jnASQUYM6Y6ZWSGV3z5bocSVDjapQ9NO//ovdyG6wF5h2d01G14AiIAXi9hxw1+3ecC+xcou5ojVIppuur2BnzhHURb//q46n
X-Gm-Message-State: AOJu0Yx5rfY49hmmz99a8ys89ho6+OXUJi4bV1bzqxaubhjXbnoi9rY0
 9j9tKHyCOplXRhAokiM4qu5aoB2TuYW9vIi8zVg5m/T/dEw5Hm2/FBB2iVYgNyF9UA==
X-Google-Smtp-Source: AGHT+IHgDQYxfaNoZPJPf65v+u1lbByYAQX8chGDRSLGnk0EirLxxZvzXEc6PHIcYQe0u6Ugpah/3g==
X-Received: by 2002:a05:622a:209:b0:42e:7afb:b2a3 with SMTP id
 b9-20020a05622a020900b0042e7afbb2a3mr13151760qtx.15.1709050056771; 
 Tue, 27 Feb 2024 08:07:36 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 g7-20020ac80707000000b0042dfa55a3d5sm3677124qth.25.2024.02.27.08.07.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 08:07:36 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-42e323a2e39so27225181cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:07:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0oDGBN39HQA5mETDmpKUliryUaGJz4l/gl26jsRJblRlO/r1PzCc+CZfY760MIHxsDTHYFnJQEHYXUYM/RepnznU/nhVOgC5lGzOBU4Lg
X-Received: by 2002:a25:d6d6:0:b0:dc6:daa4:e808 with SMTP id
 n205-20020a25d6d6000000b00dc6daa4e808mr1755203ybg.12.1709050035153; Tue, 27
 Feb 2024 08:07:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <22c41c392762f282752b2f31deeaf8f1f2254061.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <22c41c392762f282752b2f31deeaf8f1f2254061.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 17:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUK6fKZuFN2kqrnzfvxcnJZS=YQm3oeQRczAjRG66ebMg@mail.gmail.com>
Message-ID: <CAMuHMdUK6fKZuFN2kqrnzfvxcnJZS=YQm3oeQRczAjRG66ebMg@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 33/37] sh: j2_mimas_v2.dts update
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

Hi Sato-san,

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

Please enhance the one-line summary, e.g.

    sh: j2_mimas_v2: Update CPU compatible value

For the actual changes:
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
