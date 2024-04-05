Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86EF899CFC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADFE10E5C3;
	Fri,  5 Apr 2024 12:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6FD10E5C3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 12:32:32 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5aa01deda8aso131710eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712320349; x=1712925149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/bPulDFyqKcNHOqZbTas5oGwjflVlb0IvXxADWNRbac=;
 b=ef+LTdbR4kF/GDIJsEjE3y3racvpufhcuUbRc3yBjEZJexmt7LZVOeXJsjOMDRq3bH
 +eB2stdpnNE73OYvsr68Tr+6YNVNuwAjvXhTJ3b88RtjWWoXKIqIk8wZTUwC1csiRpAQ
 1Wqvl2653AejhzR/p/GodDB/M0Tr32QfZEb+Cin8j9DbIIYAd7YVFGHRkLi+ChAVEB8z
 maUMW4eRJEhVzTVZc4m21eaNLZkTfYwMAqySag/ZjQcp9LAzqzcV0SK2NA7aAVhu/BH7
 UxsbabRiXNGzR/Z6oAPe0R5qvQ/9LGVh6hA5diewmkgFPTXesJfKRDFtedqUc6/7e4rh
 Bh5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdcvveMOm9R4ThppmSmoH2uIXtWJcfpb5ZISZaJOiTp7hBNgTb7LtTfDRMNeJmyRRFPqWDtl3mKK2FrsCBm9mE0wc8WxnY1rKQxnh7Zj0O
X-Gm-Message-State: AOJu0YwFFqTihXth4atsimfJnUX8ecp1nDogDDAy4gLpzUDFlqJCN5OL
 hqAJecGzqwCV4qaUHJrwMBBQOn+9f3mHZl5eIXsqjE8ylziz33vAvMREwRiuKX8=
X-Google-Smtp-Source: AGHT+IHVqdd+Gcg8Y4BphKOeKPScLW4Wae3ahtITBVaZCsPOAMQsoaHZjD0xGmQN3dXq7PK+nkoJPw==
X-Received: by 2002:a05:6820:20d:b0:5a1:d2ad:ee36 with SMTP id
 bw13-20020a056820020d00b005a1d2adee36mr1322271oob.7.1712320348885; 
 Fri, 05 Apr 2024 05:32:28 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
 [209.85.167.179]) by smtp.gmail.com with ESMTPSA id
 s13-20020a4aad4d000000b005a5449af10csm289015oon.0.2024.04.05.05.32.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:32:28 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3c3aeef1385so1442094b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:32:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUd+Wy8Xx93frB+vUKRT0MSO/Y2nRzUJNjhBRd0+bgW5D7hRgLuV0wvGopHBZx683yZ8/G7qdvj+P00RnFKq/htW3/nWxgunY9L4DfN2KHV
X-Received: by 2002:a5b:4ca:0:b0:dcd:19ba:10df with SMTP id
 u10-20020a5b04ca000000b00dcd19ba10dfmr1040280ybp.56.1712320326217; Fri, 05
 Apr 2024 05:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <4ac65d0f311e890c1ca92bf057c70954ec7ac351.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <4ac65d0f311e890c1ca92bf057c70954ec7ac351.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 14:31:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvL0fWGrn+KNDvXcioYnY-=3WmGtcdFkC82L7tL__+wA@mail.gmail.com>
Message-ID: <CAMuHMdXvL0fWGrn+KNDvXcioYnY-=3WmGtcdFkC82L7tL__+wA@mail.gmail.com>
Subject: Re: [RESEND v7 09/37] dt-binding: Add compatible SH7750 SoC
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
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

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
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
