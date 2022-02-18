Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1F4BC75B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C823910F67F;
	Sat, 19 Feb 2022 10:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A5010EBF6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 12:38:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D5C8B8261A;
 Fri, 18 Feb 2022 12:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38114C340E9;
 Fri, 18 Feb 2022 12:37:52 +0000 (UTC)
Message-ID: <c70113dc-d017-b5bc-1466-02530f4707e2@xs4all.nl>
Date: Fri, 18 Feb 2022 13:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Zhang Qilong <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
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
 =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Davidlohr Bueso <dbueso@suse.de>, UNGLinuxDriver@microchip.com,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-integrity@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-staging@lists.linux.dev,
 linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 netdev@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>,
 Varka Bhadram <varkabhadram@gmail.com>, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Mark Greer <mgreer@animalcreek.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-fbdev@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Stefan_M=c3=a4tje?= <stefan.maetje@esd.eu>,
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

On 23/01/2022 18:52, Uwe Kleine-König wrote:
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
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/bus/moxtet.c                                  |  4 +---
>  drivers/char/tpm/st33zp24/spi.c                       |  4 +---
>  drivers/char/tpm/tpm_tis_spi_main.c                   |  3 +--
>  drivers/clk/clk-lmk04832.c                            |  4 +---
>  drivers/gpio/gpio-74x164.c                            |  4 +---
>  drivers/gpio/gpio-max3191x.c                          |  4 +---
>  drivers/gpio/gpio-max7301.c                           |  4 +---
>  drivers/gpio/gpio-mc33880.c                           |  4 +---
>  drivers/gpio/gpio-pisosr.c                            |  4 +---
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c          |  4 +---
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c          |  4 +---
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c          |  3 +--
>  drivers/gpu/drm/panel/panel-innolux-ej030na.c         |  4 +---
>  drivers/gpu/drm/panel/panel-lg-lb035q02.c             |  4 +---
>  drivers/gpu/drm/panel/panel-lg-lg4573.c               |  4 +---
>  drivers/gpu/drm/panel/panel-nec-nl8048hl11.c          |  4 +---
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c         |  4 +---
>  drivers/gpu/drm/panel/panel-samsung-db7430.c          |  3 +--
>  drivers/gpu/drm/panel/panel-samsung-ld9040.c          |  4 +---
>  drivers/gpu/drm/panel/panel-samsung-s6d27a1.c         |  3 +--
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c     |  3 +--
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c        |  4 +---
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c          |  4 +---
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c          |  4 +---
>  drivers/gpu/drm/panel/panel-tpo-td043mtea1.c          |  4 +---
>  drivers/gpu/drm/panel/panel-tpo-tpg110.c              |  3 +--
>  drivers/gpu/drm/panel/panel-widechips-ws2401.c        |  3 +--
>  drivers/gpu/drm/tiny/hx8357d.c                        |  4 +---
>  drivers/gpu/drm/tiny/ili9163.c                        |  4 +---
>  drivers/gpu/drm/tiny/ili9225.c                        |  4 +---
>  drivers/gpu/drm/tiny/ili9341.c                        |  4 +---
>  drivers/gpu/drm/tiny/ili9486.c                        |  4 +---
>  drivers/gpu/drm/tiny/mi0283qt.c                       |  4 +---
>  drivers/gpu/drm/tiny/repaper.c                        |  4 +---
>  drivers/gpu/drm/tiny/st7586.c                         |  4 +---
>  drivers/gpu/drm/tiny/st7735r.c                        |  4 +---
>  drivers/hwmon/adcxx.c                                 |  4 +---
>  drivers/hwmon/adt7310.c                               |  3 +--
>  drivers/hwmon/max1111.c                               |  3 +--
>  drivers/hwmon/max31722.c                              |  4 +---
>  drivers/iio/accel/bma400_spi.c                        |  4 +---
>  drivers/iio/accel/bmc150-accel-spi.c                  |  4 +---
>  drivers/iio/accel/bmi088-accel-spi.c                  |  4 +---
>  drivers/iio/accel/kxsd9-spi.c                         |  4 +---
>  drivers/iio/accel/mma7455_spi.c                       |  4 +---
>  drivers/iio/accel/sca3000.c                           |  4 +---
>  drivers/iio/adc/ad7266.c                              |  4 +---
>  drivers/iio/adc/ltc2496.c                             |  4 +---
>  drivers/iio/adc/mcp320x.c                             |  4 +---
>  drivers/iio/adc/mcp3911.c                             |  4 +---
>  drivers/iio/adc/ti-adc12138.c                         |  4 +---
>  drivers/iio/adc/ti-ads7950.c                          |  4 +---
>  drivers/iio/adc/ti-ads8688.c                          |  4 +---
>  drivers/iio/adc/ti-tlc4541.c                          |  4 +---
>  drivers/iio/amplifiers/ad8366.c                       |  4 +---
>  drivers/iio/common/ssp_sensors/ssp_dev.c              |  4 +---
>  drivers/iio/dac/ad5360.c                              |  4 +---
>  drivers/iio/dac/ad5380.c                              |  4 +---
>  drivers/iio/dac/ad5446.c                              |  4 +---
>  drivers/iio/dac/ad5449.c                              |  4 +---
>  drivers/iio/dac/ad5504.c                              |  4 +---
>  drivers/iio/dac/ad5592r.c                             |  4 +---
>  drivers/iio/dac/ad5624r_spi.c                         |  4 +---
>  drivers/iio/dac/ad5686-spi.c                          |  4 +---
>  drivers/iio/dac/ad5761.c                              |  4 +---
>  drivers/iio/dac/ad5764.c                              |  4 +---
>  drivers/iio/dac/ad5791.c                              |  4 +---
>  drivers/iio/dac/ad8801.c                              |  4 +---
>  drivers/iio/dac/ltc1660.c                             |  4 +---
>  drivers/iio/dac/ltc2632.c                             |  4 +---
>  drivers/iio/dac/mcp4922.c                             |  4 +---
>  drivers/iio/dac/ti-dac082s085.c                       |  4 +---
>  drivers/iio/dac/ti-dac7311.c                          |  3 +--
>  drivers/iio/frequency/adf4350.c                       |  4 +---
>  drivers/iio/gyro/bmg160_spi.c                         |  4 +---
>  drivers/iio/gyro/fxas21002c_spi.c                     |  4 +---
>  drivers/iio/health/afe4403.c                          |  4 +---
>  drivers/iio/magnetometer/bmc150_magn_spi.c            |  4 +---
>  drivers/iio/magnetometer/hmc5843_spi.c                |  4 +---
>  drivers/iio/potentiometer/max5487.c                   |  4 +---
>  drivers/iio/pressure/ms5611_spi.c                     |  4 +---
>  drivers/iio/pressure/zpa2326_spi.c                    |  4 +---
>  drivers/input/keyboard/applespi.c                     |  4 +---
>  drivers/input/misc/adxl34x-spi.c                      |  4 +---
>  drivers/input/touchscreen/ads7846.c                   |  4 +---
>  drivers/input/touchscreen/cyttsp4_spi.c               |  4 +---
>  drivers/input/touchscreen/tsc2005.c                   |  4 +---
>  drivers/leds/leds-cr0014114.c                         |  4 +---
>  drivers/leds/leds-dac124s085.c                        |  4 +---
>  drivers/leds/leds-el15203000.c                        |  4 +---
>  drivers/leds/leds-spi-byte.c                          |  4 +---
>  drivers/media/spi/cxd2880-spi.c                       |  4 +---
>  drivers/media/spi/gs1662.c                            |  4 +---
>  drivers/media/tuners/msi001.c                         |  3 +--

A bit late, but for drivers/media:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans
