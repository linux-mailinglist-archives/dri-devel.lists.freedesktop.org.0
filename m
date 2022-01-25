Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B639B49C558
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 09:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074A610E723;
	Wed, 26 Jan 2022 08:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B521710F1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 10:37:43 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 13so9627558qkd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 02:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KUBI31PDeAnUzGFlBJuIh4dmvfrE44RhBRVMq2wEYSI=;
 b=Mub9MaIOT0r1eK/20ndEPHBQcV3XMDio6an5uG5n7PVaCZE42U4HB0EfYB00/wovvJ
 tos9w8eGzKYNHONg9Zwnqh2Wyx6PbpquDOX4rvBzlw8+2ZWNyLMTXxG88EFF3PerVKWI
 ktLTJKyW+h5oW9GSpZ0f9WCztfVawdoJ9e+mB17rmib97NTHBNgCWqEdHEtTEWGDkf0C
 CFM3mae7+qYrC13JE+/skTkfdXRgz6JwKxRR11Kj6uIAIOno9Ro0nEq6Xcf7SSyyUyKB
 aMpUZhKfGcWwNeRHSskG5pYb92eXYD5sFf8JUlQ4tq4AQvr/EmyVBZuiqArs7HKPlfao
 rvtQ==
X-Gm-Message-State: AOAM531MKizZGG+vSq3ZQHDa3uDBSOVNbgX16WKlyO6uf1Ka+kDy5Lu6
 CNTfdf9KNOnno52YAhQ1/6U4LDeyjqm/Ee4T
X-Google-Smtp-Source: ABdhPJzs0pYzsbCd57wgPvMa1/BBdj3pl7joy/If6WBJFhhihW+hbedqc+9OtGtv8X8gmsaUV2lX7Q==
X-Received: by 2002:a05:620a:15ad:: with SMTP id
 f13mr4315338qkk.124.1643107062629; 
 Tue, 25 Jan 2022 02:37:42 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com.
 [209.85.219.48])
 by smtp.gmail.com with ESMTPSA id s17sm3631269qtk.54.2022.01.25.02.37.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:37:42 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id g11so18529191qvu.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 02:37:42 -0800 (PST)
X-Received: by 2002:a05:6102:34e:: with SMTP id
 e14mr295625vsa.68.1643107051968; 
 Tue, 25 Jan 2022 02:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 11:37:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCRyyq1=5+YnXgt2=B-qXMGWXC4XtnP_GHGvghdaH_XQ@mail.gmail.com>
Message-ID: <CAMuHMdWCRyyq1=5+YnXgt2=B-qXMGWXC4XtnP_GHGvghdaH_XQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 26 Jan 2022 08:35:29 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Gwendal Grignou <gwendal@chromium.org>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Claudius Heine <ch@denx.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nanyong Sun <sunnanyong@huawei.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Pavel Machek <pavel@ucw.cz>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Ajay Singh <ajay.kathat@microchip.com>, linux-clk@vger.kernel.org,
 Stefan Schmidt <stefan@datenfreihafen.org>, Sidong Yang <realwakka@gmail.com>,
 libertas-dev@lists.infradead.org, linux-omap@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-serial@vger.kernel.org,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Zhang Qilong <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jon Hunter <jonathanh@nvidia.com>,
 dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>, Matt Kline <matt@bitbashing.io>,
 Woojung Huh <woojung.huh@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Davidlohr Bueso <dbueso@suse.de>, UNGLinuxDriver@microchip.com,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-integrity@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-staging@lists.linux.dev,
 linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 netdev@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>,
 Varka Bhadram <varkabhadram@gmail.com>, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mark Greer <mgreer@animalcreek.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Stefan_M=C3=A4tje?= <stefan.maetje@esd.eu>,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Yang Li <yang.lee@linux.alibaba.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 patches@opensource.cirrus.com, Kent Gustavsson <kent@minoris.se>,
 "David S. Miller" <davem@davemloft.net>,
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Alexander Aring <alex.aring@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>, Peter Huewe <peterhuewe@gmx.de>,
 Torin Cooper-Bennun <torin@maxiluxsystems.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Eric Piel <eric.piel@tremplin-utc.net>, Stephan Gerhold <stephan@gerhold.net>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Kopp <thomas.kopp@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 platform-driver-x86@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 Xue Liu <liuxuenetmail@gmail.com>, David Lechner <david@lechnology.com>,
 Will Deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Harry Morris <h.morris@cascoda.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Alessandro Zummo <a.zummo@towertech.it>, Yang Shen <shenyang39@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Cai Huoqing <caihuoqing@baidu.com>, Daniel Mack <daniel@zonque.org>,
 Colin Ian King <colin.king@intel.com>, Helge Deller <deller@gmx.de>,
 Alan Ott <alan@signal11.us>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 23, 2022 at 6:54 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The value returned by an spi driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

>  drivers/spi/spi-slave-system-control.c                |  3 +--
>  drivers/spi/spi-slave-time.c                          |  3 +--
>  drivers/spi/spi.c                                     | 11 ++---------
>  drivers/spi/spidev.c                                  |  4 +---

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
