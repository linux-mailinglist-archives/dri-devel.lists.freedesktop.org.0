Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99498568025
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22CE11238F;
	Wed,  6 Jul 2022 07:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0173111AC8A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 20:12:02 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id h19so15401151qtp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
 b=jzyDqqOsmOiFQpBNDEIIiq2MN35QtJrUD2/ujzSWycMbbCOOa/kXWzucbOzXvgJPlM
 l41OpTnwJFtVKAh9ESeTZGx5QRNGnFLf7Ve6XK/dYXbRSWYolxdZFruwb2QvUjtDqKp3
 XPq8C5Jcp4JG3opZdh2U+imHALhK3sBAHCCrGSqp8Vv6nsMRfMt39kYqHYOSFDIblB6A
 qByLsJ7MJ8hdI1n2d+9GcDpXsaJ8cJ751FUYmiFAN8pTN8GWtaPdCiQlJR4UCA74w7VK
 BYLuDVNV9YmL+YjlB3aU/m2FQ5afMCy9VI/vJGznIenuOAJI2wSPMGBH0t9pzT1ABtei
 oFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
 b=DddiHlt6UfBl9qoZf8SE89FrVhrphQAoWjLjM57G9vg89/4usnXokhTmMGIu7d3X3U
 ahz4jXfbDMys8DaAwGG6s6xucNyMBhLJvUa8hT4QT9cb1DUAIXIYhiZdaojX01dRLOG2
 em0JQLd1L5vTB2C8LUOCsZlNydQVmh1yGewA4SHW5cxddTUD3nJdGIsmaU3EAWQDuSz1
 L4hrzKUhuR6tezGTrEUQ/FUjJpbjcojmBxYBam+9Z5ZmaJDup5agRjko+8tGmALrqB6s
 xCYVYujncwOmhojAeNFKlB8llUjeGeJOQA8+ZXbkCFTHoVb6dE7jOQMAFr8U7MAHxwpA
 85Hg==
X-Gm-Message-State: AJIora91nsBU3jeplH5YtPblRzvf/tP13GDHtFwW/6dcA6bl53ioTqjj
 4TQDPfwucm8GVhILri7XIA==
X-Google-Smtp-Source: AGRyM1vwyWfnyu4uTtqBiBsFZNRwslD8UO8gfwEOhJ2ajwove3iVeaLXkFdkCmQC6YgxpEm1JQDV1A==
X-Received: by 2002:a05:622a:1449:b0:31b:eb3d:1eaf with SMTP id
 v9-20020a05622a144900b0031beb3d1eafmr29654149qtx.459.1657051921832; 
 Tue, 05 Jul 2022 13:12:01 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05620a24c300b006b46a78bc0fsm5201397qkn.118.2022.07.05.13.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 13:12:00 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:1895:1b49:2a68:29f7])
 by serve.minyard.net (Postfix) with ESMTPSA id B3B861800BD;
 Tue,  5 Jul 2022 20:11:57 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:11:56 -0500
From: Corey Minyard <minyard@acm.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705201156.GL908082@minyard.net>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Wed, 06 Jul 2022 07:41:40 +0000
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
Reply-To: minyard@acm.org
Cc: Andrew Lunn <andrew@lunn.ch>, Ricardo Ribalda <ribalda@kernel.org>,
 Jimmy Su <jimmy.su@intel.com>, Sekhar Nori <nsekhar@ti.com>,
 Gwendal Grignou <gwendal@chromium.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Minghao Chi <chi.minghao@zte.com.cn>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, Matt Johnston <matt@codeconstruct.com.au>,
 Olli Salonen <olli.salonen@iki.fi>, Angela Czubak <acz@semihalf.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luka Perkov <luka.perkov@sartura.hr>, Sean Young <sean@mess.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Zheyu Ma <zheyuma97@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-omap@vger.kernel.org,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Shunqian Zheng <zhengsq@rock-chips.com>, lijian <lijian@yulong.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Viorel Suman <viorel.suman@nxp.com>, Petr Machata <petrm@nvidia.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mtd@lists.infradead.org,
 Eddie James <eajames@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>,
 James Schulman <james.schulman@cirrus.com>, Scott Wood <oss@buserror.net>,
 Cai Huoqing <cai.huoqing@linux.dev>, Jonas Malaco <jonas@protocubo.io>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Haibo Chen <haibo.chen@nxp.com>,
 Petr Cvek <petrcvekcz@gmail.com>, linux-leds@vger.kernel.org,
 Joe Tessler <jrt@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Robert Jones <rjones@gateworks.com>,
 George Joseph <george.joseph@fairview5.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 Robin van der Gracht <robin@protonic.nl>, Randy Dunlap <rdunlap@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Tretter <m.tretter@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Phong LE <ple@baylibre.com>,
 Daniel Beer <daniel.beer@igorinstitute.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Heungjun Kim <riverful.kim@samsung.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Lin <CTLIN0@nuvoton.com>,
 Vladimir Oltean <olteanv@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jiri Slaby <jirislaby@kernel.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jon Nettleton <jon.nettleton@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel <sre@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Martiros Shakhzadyan <vrzh@vrzh.net>, Guenter Roeck <groeck@chromium.org>,
 Matthias Schwarzott <zzam@gentoo.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dmitry Rokosov <DDRokosov@sberdevices.ru>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Saranya Gopal <saranya.gopal@intel.com>, Evgeny Novikov <novikov@ispras.ru>,
 Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-clk@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Charles Gorand <charles.gorand@effinnov.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Miguel Ojeda <ojeda@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Donnelly <martin.donnelly@ge.com>,
 Woojung Huh <woojung.huh@microchip.com>, Rudolf Marek <r.marek@assembler.cz>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-watchdog@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Ido Schimmel <idosch@nvidia.com>, acpi4asus-user@lists.sourceforge.net,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Ricard Wanderlof <ricardw@axis.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 wengjianfeng <wengjianfeng@yulong.com>, Jiri Valek - 2N <valek@2n.cz>,
 linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Wayne Chang <waynec@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Sing-Han Chen <singhanc@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Maslov Dmitry <maslovdmitry@seeed.cc>, linux-gpio@vger.kernel.org,
 Jens Frederich <jfrederich@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Peter Rosin <peda@axentia.se>,
 Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-usb@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, CGEL ZTE <cgel.zte@gmail.com>,
 Colin Leroy <colin@colino.net>, platform-driver-x86@vger.kernel.org,
 linux-integrity@vger.kernel.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Arec Kao <arec.kao@intel.com>, Crt Mori <cmo@melexis.com>,
 Jose Cazarin <joseespiriki@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Jan-Simon Moeller <jansimon.moeller@gmx.de>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Jasmin Jessich <jasmin@anw.at>,
 Sam Ravnborg <sam@ravnborg.org>, Kevin Cernekee <cernekee@chromium.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Stefan Mavrodiev <stefan@olimex.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, netdev@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 Seven Lee <wtli@nuvoton.com>, Matt Ranostay <matt.ranostay@konsulko.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, chrome-platform@lists.linux.dev,
 Mats Randgaard <matrandg@cisco.com>, Paolo Abeni <pabeni@redhat.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Joel Stanley <joel@jms.id.au>,
 linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Jonas Karlman <jonas@kwiboo.se>, Yang Li <yang.lee@linux.alibaba.com>,
 Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-media@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Sven Peter <sven@svenpeter.dev>, Martin Kepplinger <martink@posteo.de>,
 openipmi-developer@lists.sourceforge.net,
 Robert Marko <robert.marko@sartura.hr>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-hwmon@vger.kernel.org,
 Felipe Balbi <balbi@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marc Hulsman <m.hulsman@tudelft.nl>, Corentin Chary <corentin.chary@gmail.com>,
 Stephen Kitt <steve@sk2.org>, Daniel Scally <djrscally@gmail.com>,
 linux-fbdev@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, patches@opensource.cirrus.com,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 Alejandro Tafalla <atafalla@dnyon.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Palmer <daniel@0x0f.com>,
 Hector Martin <marcan@marcan.st>,
 Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nick Dyer <nick@shmanahar.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tony Lindgren <tony@atomide.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Mac Chiang <mac.chiang@intel.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Alexander Potapenko <glider@google.com>, Adam Ford <aford173@gmail.com>,
 Peter Huewe <peterhuewe@gmx.de>, UNGLinuxDriver@microchip.com,
 Lee Jones <lee.jones@linaro.org>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tobias Schrammm <t.schramm@manjaro.org>, Richard Weinberger <richard@nod.at>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-pwm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bastien Nocera <hadess@hadess.net>,
 Jingoo Han <jingoohan1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Yizhuo <yzhai003@ucr.edu>,
 Shawn Tu <shawnx.tu@intel.com>, Leon Luo <leonl@leopardimaging.com>,
 Yan Lei <yan_lei@dahuatech.com>, Akihiro Tsukada <tskd08@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Alistair Francis <alistair@alistair23.me>,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Eduardo Valentin <edubezval@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kasan-dev@googlegroups.com, "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Nicola Lunghi <nick83ola@gmail.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Juerg Haefliger <juergh@gmail.com>,
 Oder Chiou <oder_chiou@realtek.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Colin Ian King <colin.king@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.

For IPMI portions below:

Acked-by: Corey Minyard <cninyard@mvista.com>

>  
>  static const struct i2c_device_id lcd2s_i2c_id[] = {
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index db40037eb347..a0e9e80d92ee 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -341,14 +341,12 @@ static int ipmb_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ipmb_remove(struct i2c_client *client)
> +static void ipmb_remove(struct i2c_client *client)
>  {
>  	struct ipmb_dev *ipmb_dev = i2c_get_clientdata(client);
>  
>  	i2c_slave_unregister(client);
>  	misc_deregister(&ipmb_dev->miscdev);
> -
> -	return 0;
>  }
>  
>  static const struct i2c_device_id ipmb_id[] = {
> diff --git a/drivers/char/ipmi/ipmi_ipmb.c b/drivers/char/ipmi/ipmi_ipmb.c
> index ab19b4b3317e..25c010c9ec25 100644
> --- a/drivers/char/ipmi/ipmi_ipmb.c
> +++ b/drivers/char/ipmi/ipmi_ipmb.c
> @@ -424,7 +424,7 @@ static void ipmi_ipmb_request_events(void *send_info)
>  	/* We don't fetch events here. */
>  }
>  
> -static int ipmi_ipmb_remove(struct i2c_client *client)
> +static void ipmi_ipmb_remove(struct i2c_client *client)
>  {
>  	struct ipmi_ipmb_dev *iidev = i2c_get_clientdata(client);
>  
> @@ -438,8 +438,6 @@ static int ipmi_ipmb_remove(struct i2c_client *client)
>  	ipmi_ipmb_stop_thread(iidev);
>  
>  	ipmi_unregister_smi(iidev->intf);
> -
> -	return 0;
>  }
>  
>  static int ipmi_ipmb_probe(struct i2c_client *client)
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index fc742ee9c046..13da021e7c6b 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1281,13 +1281,13 @@ static void shutdown_ssif(void *send_info)
>  	}
>  }
>  
> -static int ssif_remove(struct i2c_client *client)
> +static void ssif_remove(struct i2c_client *client)
>  {
>  	struct ssif_info *ssif_info = i2c_get_clientdata(client);
>  	struct ssif_addr_info *addr_info;
>  
>  	if (!ssif_info)
> -		return 0;
> +		return;
>  
>  	/*
>  	 * After this point, we won't deliver anything asychronously
> @@ -1303,8 +1303,6 @@ static int ssif_remove(struct i2c_client *client)
>  	}
>  
>  	kfree(ssif_info);
> -
> -	return 0;
>  }
>  
>  static int read_response(struct i2c_client *client, unsigned char *resp)
