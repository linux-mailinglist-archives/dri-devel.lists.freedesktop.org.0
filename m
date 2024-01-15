Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CB82E1F2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 21:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F8D10E39F;
	Mon, 15 Jan 2024 20:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E4410E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 20:44:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rPTSJ-0004fv-Vc; Mon, 15 Jan 2024 21:21:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rPTSC-0005fw-T0; Mon, 15 Jan 2024 21:21:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rPTSC-000N73-2E;
 Mon, 15 Jan 2024 21:21:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/33] spi: get rid of some legacy macros
Date: Mon, 15 Jan 2024 21:12:46 +0100
Message-ID: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6320;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=4XhGTLODNw8yhIWMecN5LnSB/9sNwzZ7ZtVxoa/j52s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlpZHAtVz/M7HYOTe/qdG2V00aOQMH7pbvHciH8
 Vd+hMtY79eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZaWRwAAKCRCPgPtYfRL+
 TmMcB/9KE9qwNyMSSIfdofdQbKyCv4Jl+hXy0kKEYM/VNzbklICtWwj9498FhxF8B9thFSDK3gp
 DulZCe7rJn+MKx/eJphonzR1LVWev1YTJ2kkqaeBZRIN4i1mYHInwS35ESw2q+zwzVxxA5C1ESX
 kW25rOyy4D74faKClkI6O9XJ8+8hTw+2V1FDTJCM3vzxmqJnOLbi+YQW48FklGIPMoSqjx8aCyd
 SI61u1H7VyOe/EymwrynrT3G6SCnlHBYtfL1qLmsfALHT2BaON0BD/T5W5/wZjxuPBbtdlD253K
 rqyhVZMP3ez427R7zZKU1qhJqs7O6YTGrydt0et9PARzYGe0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Ronald Wahl <ronald.wahl@raritan.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, libertas-dev@lists.infradead.org,
 Javier Martinez Canillas <javierm@redhat.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel@pengutronix.de, linux-media@vger.kernel.org, linux-wpan@vger.kernel.org,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 linux-doc@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 James Clark <james.clark@arm.com>, Guenter Roeck <groeck@chromium.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 chrome-platform@lists.linux.dev,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Viresh Kumar <vireshk@kernel.org>, Helge Deller <deller@gmx.de>,
 Wu Hao <hao.wu@intel.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org,
 Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-integrity@vger.kernel.org, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-input@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>,
 Moritz Fischer <mdf@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>, Rayyan Ansari <rayyan@ansari.sh>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>, Xu Yilun <yilun.xu@intel.com>,
 Alexander Aring <alex.aring@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Peter Huewe <peterhuewe@gmx.de>, Sergey Kozlov <serjk@netup.ru>,
 Richard Weinberger <richard@nod.at>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-mediatek@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions were renamed. Further some compat defines were introduced
to map the old names to the new ones.

In this series all drivers still using the old names are changed to use
the new ones and then in patch #32 the compat defines are dropped.
Variables and struct members of type pointer to struct spi_controller that were
named "master" (matching the old name of spi_controller) were renamed to
"ctlr", which slightly increased the count of touched lines, but is nice
for consistency.

Patch #18 and #19 touch the same driver, otherwise the patches #1 - #31
are pairwise independent and could be applied by their respective
maintainers. The alternative is to let all patches go via the spi tree.
Mark, what's your preference here?

Patch #33 updates the documentation. (This one is a bit fuzzy, because
it also does some s/master/host/ which doesn't match the remainder of
the series). Also patch #18 is an improvement I noticed while touching
this driver that doesn't match the series' topic. I still kept it
included here. If you should not like it, it can just be dropped.

Best regards
Uwe

Uwe Kleine-König (33):
  fpga: ice40-spi: Follow renaming of SPI "master" to "controller"
  ieee802154: ca8210: Follow renaming of SPI "master" to "controller"
  iio: adc: ad_sigma_delta: Follow renaming of SPI "master" to "controller"
  Input: pxspad - follow renaming of SPI "master" to "controller"
  Input: synaptics-rmi4 - follow renaming of SPI "master" to "controller"
  media: mgb4: Follow renaming of SPI "master" to "controller"
  media: netup_unidvb: Follow renaming of SPI "master" to "controller"
  media: usb/msi2500: Follow renaming of SPI "master" to "controller"
  media: v4l2-subdev: Follow renaming of SPI "master" to "controller"
  misc: gehc-achc: Follow renaming of SPI "master" to "controller"
  mmc: mmc_spi: Follow renaming of SPI "master" to "controller"
  mtd: dataflash: Follow renaming of SPI "master" to "controller"
  mtd: rawnand: fsl_elbc: Let .probe retry if local bus is missing
  net: ks8851: Follow renaming of SPI "master" to "controller"
  net: vertexcom: mse102x: Follow renaming of SPI "master" to "controller"
  platform/chrome: cros_ec_spi: Follow renaming of SPI "master" to "controller"
  spi: bitbang: Follow renaming of SPI "master" to "controller"
  spi: cadence-quadspi: Don't emit error message on allocation error
  spi: cadence-quadspi: Follow renaming of SPI "master" to "controller"
  spi: cavium: Follow renaming of SPI "master" to "controller"
  spi: geni-qcom: Follow renaming of SPI "master" to "controller"
  spi: loopback-test: Follow renaming of SPI "master" to "controller"
  spi: slave-mt27xx: Follow renaming of SPI "master" to "controller"
  spi: spidev: Follow renaming of SPI "master" to "controller"
  staging: fbtft: Follow renaming of SPI "master" to "controller"
  staging: greybus: spi: Follow renaming of SPI "master" to "controller"
  tpm_tis_spi: Follow renaming of SPI "master" to "controller"
  usb: gadget: max3420_udc: Follow renaming of SPI "master" to "controller"
  video: fbdev: mmp: Follow renaming of SPI "master" to "controller"
  wifi: libertas: Follow renaming of SPI "master" to "controller"
  spi: fsl-lib: Follow renaming of SPI "master" to "controller"
  spi: Drop compat layer from renaming "master" to "controller"
  Documentation: spi: Update documentation for renaming "master" to "controller"

 .../driver-api/driver-model/devres.rst        |  2 +-
 Documentation/spi/spi-summary.rst             | 74 +++++++++----------
 drivers/char/tpm/tpm_tis_spi_main.c           |  4 +-
 drivers/fpga/ice40-spi.c                      |  4 +-
 drivers/iio/adc/ad_sigma_delta.c              | 14 ++--
 drivers/input/joystick/psxpad-spi.c           |  4 +-
 drivers/input/rmi4/rmi_spi.c                  |  2 +-
 drivers/media/pci/mgb4/mgb4_core.c            | 14 ++--
 .../media/pci/netup_unidvb/netup_unidvb_spi.c | 48 ++++++------
 drivers/media/usb/msi2500/msi2500.c           | 38 +++++-----
 drivers/media/v4l2-core/v4l2-spi.c            |  4 +-
 drivers/misc/gehc-achc.c                      |  8 +-
 drivers/mmc/host/mmc_spi.c                    |  6 +-
 drivers/mtd/devices/mtd_dataflash.c           |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c          |  3 +-
 drivers/net/ethernet/micrel/ks8851_spi.c      |  4 +-
 drivers/net/ethernet/vertexcom/mse102x.c      |  2 +-
 drivers/net/ieee802154/ca8210.c               |  2 +-
 .../net/wireless/marvell/libertas/if_spi.c    |  2 +-
 drivers/platform/chrome/cros_ec_spi.c         |  8 +-
 drivers/spi/spi-ath79.c                       |  4 +-
 drivers/spi/spi-bitbang.c                     | 64 ++++++++--------
 drivers/spi/spi-butterfly.c                   |  6 +-
 drivers/spi/spi-cadence-quadspi.c             |  7 +-
 drivers/spi/spi-cavium.c                      |  6 +-
 drivers/spi/spi-cavium.h                      |  2 +-
 drivers/spi/spi-davinci.c                     |  6 +-
 drivers/spi/spi-fsl-lib.c                     | 14 ++--
 drivers/spi/spi-geni-qcom.c                   |  2 +-
 drivers/spi/spi-gpio.c                        |  2 +-
 drivers/spi/spi-lm70llp.c                     |  6 +-
 drivers/spi/spi-loopback-test.c               |  4 +-
 drivers/spi/spi-oc-tiny.c                     |  6 +-
 drivers/spi/spi-omap-uwire.c                  |  4 +-
 drivers/spi/spi-slave-mt27xx.c                |  2 +-
 drivers/spi/spi-xilinx.c                      |  4 +-
 drivers/spi/spi-xtensa-xtfpga.c               |  2 +-
 drivers/spi/spi.c                             |  2 +-
 drivers/spi/spidev.c                          |  2 +-
 drivers/staging/fbtft/fbtft-core.c            |  4 +-
 drivers/staging/greybus/spilib.c              | 66 ++++++++---------
 drivers/usb/gadget/udc/max3420_udc.c          |  2 +-
 drivers/video/fbdev/mmp/hw/mmp_spi.c          | 26 +++----
 include/linux/spi/spi.h                       | 20 +----
 include/linux/spi/spi_bitbang.h               |  2 +-
 include/media/v4l2-common.h                   |  6 +-
 46 files changed, 249 insertions(+), 267 deletions(-)


base-commit: 8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
-- 
2.43.0

