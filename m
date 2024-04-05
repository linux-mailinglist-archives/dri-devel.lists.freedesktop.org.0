Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B19899D68
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8E5113BC6;
	Fri,  5 Apr 2024 12:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ACC113BC6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 12:46:02 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6e6d089f603so1216577a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712321160; x=1712925960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdcVr7Wy695cSZ73yuRES73pueUgVfr2wxBNFBTwOGo=;
 b=op85WFGcSuPahFB3C5OpOrUGTgVviVp8BCtDsC2rwBUFXgHcf7Cn7mRIHiunbO892H
 40tzMf1hPVcj0wRa0EIW41j2l9dcDd/piVSxA/VBV/dWtpAjm+0wMmNAHeFUVBYvz3B+
 QVePR2pbZBDmALiP1VW7Fyg7OFFbMeQlB//dSuZDhxTmXzeEz7/HOoWFvOncJ7hFZYYW
 +kHtP3F2MhRbMacZzeyDliyPIsBmLBMFl9Tgb7A/ch0KaYPmw5gEWGZw3KT4rvMRt/ik
 falOKdRlgFlsRfFuFSRs6poReualvjvFu9dNG4RnQ3ftdglRM+lseX9mwFSn+WTktxjr
 KEDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTppe4VduWJtbnyOHGGtFfzxAF8NX0/5PZ9xfZ86yc/DyjWZ7IpwqdJhGRWL1S0smZWI1/y8ec6c28jdbBao8FnM1sL3VvsEtxny7BqRmD
X-Gm-Message-State: AOJu0Yz7z+61iLKIY57ixEyxIs7VFVV2N+7YhpRuKc5ksFi0521E9XGq
 dTTQsLqTeUaHgxKZaz7Pqd/YMbyJZgRkmZ1Y4rzOqLk/Le9L6qeRtpyMwWCmA7E=
X-Google-Smtp-Source: AGHT+IE4m9pgZ4KyJ6gXIpptLUArpb+OnTIkOXRzDNZxtKq8XH197wWOQdoNd/apOEunEilZiAZIiA==
X-Received: by 2002:a05:6871:739a:b0:22e:8ca0:36ba with SMTP id
 na26-20020a056871739a00b0022e8ca036bamr1344666oac.22.1712321160385; 
 Fri, 05 Apr 2024 05:46:00 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com.
 [209.85.160.43]) by smtp.gmail.com with ESMTPSA id
 xl21-20020a0568709f1500b0022ed32f20bcsm372597oab.15.2024.04.05.05.45.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:46:00 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-22a8df1df8fso1041318fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeMQG9iIlQm4PMYJd+79nP7wPVw1e07ESwgS8JrJgHcI1PlxCU2R0vxP1+rUfuFmdfAjXGPVkpOSafQ2KBSCZngFEN5fXvSbJr8Aqer7vb
X-Received: by 2002:a25:ad03:0:b0:db9:9537:2c39 with SMTP id
 y3-20020a25ad03000000b00db995372c39mr1198273ybi.2.1712321137914; Fri, 05 Apr
 2024 05:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <f0e220fc338a3dac27f31d7ca871e2ceecad2874.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <f0e220fc338a3dac27f31d7ca871e2ceecad2874.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 14:45:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZSFbfihn2udTW9ufK_+7i6y4FWT29bzCPS129Lgdrkw@mail.gmail.com>
Message-ID: <CAMuHMdUZSFbfihn2udTW9ufK_+7i6y4FWT29bzCPS129Lgdrkw@mail.gmail.com>
Subject: Re: [RESEND v7 34/37] sh: Add dtbs target support.
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

On Thu, Apr 4, 2024 at 7:16=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

My

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

on v6 is still valid.

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
