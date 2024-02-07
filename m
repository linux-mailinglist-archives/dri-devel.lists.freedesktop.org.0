Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F584D166
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B18A10E5CA;
	Wed,  7 Feb 2024 18:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2229C10E5CA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 18:43:48 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rXmtA-0007PF-WC; Wed, 07 Feb 2024 19:43:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rXmt1-0054Wo-Fo; Wed, 07 Feb 2024 19:43:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rXmt1-00HRrh-0y;
 Wed, 07 Feb 2024 19:43:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>,
 Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org,
 netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-input@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 linux-mtd@lists.infradead.org, Simon Horman <horms@kernel.org>,
 Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Michal Simek <michal.simek@amd.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <bhelgaas@google.com>,
 James Clark <james.clark@arm.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 00/32] spi: get rid of some legacy macros
Date: Wed,  7 Feb 2024 19:40:14 +0100
Message-ID: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5860;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=s51zDtEtzddF+fOLbQ8v2gtuX5PVGr2PxCfCP0eStY0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw86QixivRCd8jxsnKPB8Ssu0rmVV57zjiJehV
 Ejr/jxfufWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPOkAAKCRCPgPtYfRL+
 TqoZB/9v16XZw2mKXG2KBm/qLQpqoIFtAvhj1rhNwGsvXv87uFIurzYxaSWRcHnoydLYAUjcWin
 wLRECa33v1gti0Be6oV9BMfvx+Pvhq4lk4RnaSn96oPtZRpq+OTzE2mMSgz0Rgm3Al2XVM+wtll
 cMJhm+DE3KYghNi+61ohTBgmqcQSwjofaml1oAIf8F12/QJkYPMbKHLFo3eYUENR8f8KW6xfzcA
 Auq9djKc8DcVzUnZlQ8jFBRc78e3H4Wwojwi6fhxTf6BorMOWK2zEE8p+1QpcaPMCBrTOJnRdaw
 ZunuM2tkWRUATbyKWfDc9YAdTKZGkKDoDmegK95iBOzv5EQf
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v2
(https://lore.kernel.org/linux-spi/cover.1705944943.git.u.kleine-koenig@pengutronix.de):

 - Drop patch "mtd: rawnand: fsl_elbc: Let .probe retry if local bus is
   missing" which doesn't belong into this series.
 - Fix a build failure noticed by the kernel build bot in
   drivers/spi/spi-au1550.c. (I failed to catch this because this driver
   is mips only, but not enabled in a mips allmodconfig. That's a bit
   unfortunate, but not easily fixable.)
 - Add the Reviewed-by: and Acked-by: tags I received for v2.

Mark already announced for v2 that he is willing to apply the whole
series to his spi tree. Assuming no other show stoper are found in this
v3, I assume that's the plan still for this series now.

Thanks
Uwe

Uwe Kleine-König (32):
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
 drivers/net/ethernet/micrel/ks8851_spi.c      |  4 +-
 drivers/net/ethernet/vertexcom/mse102x.c      |  2 +-
 drivers/net/ieee802154/ca8210.c               |  2 +-
 .../net/wireless/marvell/libertas/if_spi.c    |  2 +-
 drivers/platform/chrome/cros_ec_spi.c         |  8 +-
 drivers/spi/spi-ath79.c                       |  4 +-
 drivers/spi/spi-au1550.c                      |  2 +-
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
 drivers/spi/spi-sh-sci.c                      | 10 +--
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
 47 files changed, 253 insertions(+), 272 deletions(-)


base-commit: b9b98f594b6f4c0b0fb2da4493453aef183bca4b
-- 
2.43.0

