Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43889B3A048
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C4810E9C2;
	Thu, 28 Aug 2025 14:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="ADBZJVwB";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y8cluWGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB03910E9BE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:11:14 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailflow.phl.internal (Postfix) with ESMTP id CB2F91380311;
 Thu, 28 Aug 2025 10:01:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Thu, 28 Aug 2025 10:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1756389699; x=1756396899; bh=Bd
 iqgki9cBkiwn3KTMZOlcoUGn7D1IeQeuemnuB1DqA=; b=ADBZJVwB4Q6sZ2Tw/e
 UbkB4Wrz/99ItsY/cXgDy3pARv2tZyvq3eA67YQMrxtL10ntel0P19EW5lfS6gnd
 BPOOZBA19X+G5FPHe3ewOoOzMNkE8ENCcLdf8+85K0iMn9vjg1jhDnh7aM028SfQ
 60HVD8Tr5ZQzZIJDnZn2xBFX3z2qKxHxe4DFpueI/eoJ1BVQ/M17rm2bjyCF+3iJ
 KMGRG2a5AdPVhoSQ3QlTOzlh9abmuJwK4vPsAsjwubZoV7kO6GoX91pLL5geoFSN
 Qz7mRFTYqqxlN7pzNM1brzC6BnE6JIJjp8Z4YOzVVkpq9F2OW1AN6uebTYoau9XU
 XUpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1756389699; x=1756396899; bh=Bdiqgki9cBkiwn3KTMZOlcoUGn7D
 1IeQeuemnuB1DqA=; b=Y8cluWGNlt+Uz2XFNr9E3UaVSakcSODI6MXhvYf9esOa
 3lP9Ynr4gRAY9QJJ1pVqV1dlI7Tyxo9ZORseBCPIXckru7h29mDcOF2L74A4dTHY
 87ilbFJwtVi6y9bR/cLDuEXCuMjT+IZKjsZGU93fQsNC3vHQu8zrPFL+SO68jX/6
 RRvOfSuHbi7p8sdlSuMN6X/OwqFDhx2Eiodq8iowY1eQc4A5xuUZwqYsuFcu99lf
 KLfmB1NM8Z2VsPdYq5Atz728uKGsLYmzi/i4Xq6vxdxOJZ6Zde3ub+HQ5zofMjYD
 piHfnrATsF0lSI6ER4TXMEkhaO+HwY/i6gqWbUHrAw==
X-ME-Sender: <xms:P2GwaIBHlvJAMQds1A_f2aHM4mQA0EyIuA_BsXOnNe-kI-LktVHNjA>
 <xme:P2GwaB9VXWu9Bu1dUXm9NttsUwXZHLlpJ4t6G6lGapW-6MjVQvhWyJfG2n_wu5jIZ
 rdFWdCX96UACfEycEg>
X-ME-Received: <xmr:P2GwaEgkkj056qkioG7x2_3w5bo8GJlfrF3XjnnIcwaWn8H3QfyXjuSmvkyuKEbQGvl4EBLyq42Miz09_K1VIdESN97yMWNeFwPWtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepueelgf
 fhfedvgeelfeduuefhfefhjeeihfffueefjeeihffhheeuteeuvdeuhffhnecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepieeg
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvg
 hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhsohhl
 uhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtg
 hpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
 figrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvth
 htvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprhgtph
 htthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:P2GwaJudJdM0u5W3UFLTkwba72c3hxydpGCRSdvg6L3GHTxSpqmkHg>
 <xmx:P2GwaMjP22YfAokDZ7PeUmZ7uVN_AmQvyw2X-sSklEiDS0YbGpaW4Q>
 <xmx:P2GwaL1D4aijQkGv_-yO9gyqMkCknikU6rQgPnQTL5K4KCRTL5r2qA>
 <xmx:P2GwaIUYbVgPIREMiLBzTmfL0cEnIlg2N0KuvkxKULoD58jCwzg3UQ>
 <xmx:Q2GwaNj1a3girAXO08ZsA7h_-HySJf0B0nmH2fYIqgXUj1uKEhfqm3_d>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:01:34 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
Date: Thu, 28 Aug 2025 16:01:19 +0200
Message-Id: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9hsGgC/0XMywrCMBCF4Vcps3Ygk9JL+irSRZxONCCxJrEop
 e9usAWX/4HzrZAkekkwVCtEWXzyj1CCThXwzYaroJ9Kg1a6UT0RThntPN8Fc6u0Qqobw2IuTks
 H5TRHcf79A8/j3lGer+LmffyzQ3Wg9SEWOn0CY4vU4USOiXvjOrbDomHcti8Y5BwsrQAAAA==
X-Change-ID: 20250811-dt-apple-t6020-1359ce9bf2e7
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>,  Lee Jones <lee@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10250; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=rreEJehO7CQ2EprUn7hNBtTVr7RiGsX/VW4AoAEZkNg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiebim8+dC13+IPl31+8UrzaOtTM8FZJ+Ory07o5id
 yo+d7ioo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEQSuhj+GZU9tTFeNPdAgvqc
 g/HzFZqeFsQ+WWb74M6mpT41W3q2sjH8j9nrU/hRbcU6i4Kc/591/3XsXllT0PWYXajBcPrXPTw
 8HAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
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

This series adds device trees for Apple's M2 Pro, Max and Ultra based
devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
follow design of the t600x family so copy the structure of SoC *.dtsi
files.

t6020 is a cut-down version of t6021, so the former just includes the
latter and disables the missing bits.

t6022 is two connected t6021 dies. The implementation seems to use
t6021 and disables blocks based on whether it is useful to carry
multiple instances. The disabled blocks are mostly on the second die.
MMIO addresses on the second die have a constant offset. The interrupt
controller is multi-die aware. This setup can be represented in the
device tree with two top level "soc" nodes. The MMIO offset is applied
via "ranges" and devices are included with preprocessor macros to make
the node labels unique and to specify the die number for the interrupt
definition.

The devices itself are very similar to their M1 Pro, M1 Max and M1 Ultra
counterparts. The existing device templates are SoC agnostic so the new
devices can reuse them and include their t602{0,1,2}.dtsi file. The
minor differences in pinctrl and gpio numbers can be easily adjusted.

With the t602x SoC family Apple introduced two new devices:

The M2 Pro Mac mini is similar to the larger M1 and M2 Max Mac Studio. The
missing SDHCI card reader and two front USB3.1 type-c ports and their
internal USB hub can be easily deleted.

The M2 Ultra Mac Pro (tower and rack-mount cases) differs from all other
devices but may share some bits with the M2 Ultra Mac Studio. The PCIe
implementation on the M2 Ultra in the Mac Pro differs slightly. Apple
calls the PCIe controller "apcie-ge" in their device tree. The
implementation seems to be mostly compatible with the base t6020 PCIe
controller. The main difference is that there is only a single port with
with 8 or 16 PCIe Gen4 lanes. These ports connect to a Microchip
Switchtec PCIe switch with 100 lanes to which all internal PCIe devices
and PCIe slots connect too.

This series does not include PCIe support for the Mac Pro for two
reasons:
- the linux switchtec driver fails to probe and the downstream PCIe
  connections come up as PCIe Gen1
- some of the internal devices require PERST# and power control to come
  up. Since the device are connected via the PCIe switch the PCIe
  controller can not do this. The PCI slot pwrctrl can be utilized for
  power control but misses integration with PERST# as proposed in [1].

This series depends on "[PATCH v2 0/5] Apple device tree sync from
downstream kernel" [2] due to the reuse of the t600x device templates
(patch dependencies and DT compilation) and 4 page table level support
in apple-dart and io-pgtable-dart [3] since the dart instances report
42-bit IAS (IOMMU device attach fails without the series).

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatibles anymore [1]. Instead either the first
compatible SoC or t8103 is used as fallback compatible supported by the
drivers. t8103 is used as default since most drivers and bindings were
initially written for M1 based devices.

The series adds those fallback compatibles to drivers where necessary,
annotates the SoC lists for generic compatibles as "do not extend" and
adds t6020 per-SoC compatibles.

[1]: https://lore.kernel.org/linux-pci/20250819-pci-pwrctrl-perst-v1-0-4b74978d2007@oss.qualcomm.com/
[2]: https://lore.kernel.org/asahi/20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net/
[3]: https://lore.kernel.org/asahi/20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net/
[4]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
Hector Martin (3):
      arm64: dts: apple: Add initial t6020/t6021/t6022 DTs
      arm64: dts: apple: Add J414 and J416 Macbook Pro device trees
      arm64: dts: apple: Add J180d (Mac Pro, M2 Ultra, 2023) device tree

Janne Grunau (34):
      dt-bindings: arm: apple: Add t6020x compatibles
      dt-bindings: arm: apple: apple,pmgr: Add t6020-pmgr compatible
      pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
      dt-bindings: power: apple,pmgr-pwrstate: Add t6020 compatible
      dt-bindings: cpufreq: apple,cluster-cpufreq: Add t6020 compatible
      dt-bindings: interrupt-controller: apple,aic2: Add apple,t6020-aic compatible
      dt-bindings: iommu: dart: Add apple,t6020-dart compatible
      pinctrl: apple: Add "apple,t8103-pinctrl" as compatible
      dt-bindings: pinctrl: apple,pinctrl: Add apple,t6020-pinctrl compatible
      dt-bindings: i2c: apple,i2c: Add apple,t6020-i2c compatible
      dt-bindings: mailbox: apple,mailbox: Add t6020 compatible
      dt-bindings: gpu: apple,agx: Add agx-{g14s,g14c,g14d} compatibles
      dt-bindings: iommu: apple,sart: Add apple,t6020-sart compatible
      nvme-apple: Add "apple,t8103-nvme-ans2" as compatible
      dt-bindings: nvme: apple: Add apple,t6020-nvme-ans2 compatible
      dt-bindings: net: bcm4377-bluetooth: Add BCM4388 compatible
      dt-bindings: net: bcm4329-fmac: Add BCM4388 PCI compatible
      mfd: macsmc: Add "apple,t8103-smc" compatible
      dt-bindings: mfd: apple,smc: Add t6020-smc compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm compatible
      spmi: apple: Add "apple,t8103-spmi" compatible
      dt-bindings: spmi: apple,spmi: Add t6020-spmi compatible
      watchdog: apple: Add "apple,t8103-wdt" compatible
      dt-bindings: watchdog: apple,wdt: Add t6020-wdt compatible
      clk: clk-apple-nco: Add "apple,t8103-nco" compatible
      dt-bindings: clock: apple,nco: Add t6020-nco compatible
      dmaengine: apple-admac: Add "apple,t8103-admac" compatible
      dt-bindings: dma: apple,admac: Add t6020-admac compatible
      ASoC: apple: mca: Add "apple,t8103-mca" compatible
      ASoC: dt-bindings: apple,mca: Add t6020-mca compatible
      spi: apple: Add "apple,t8103-spi" compatible
      spi: dt-bindings: apple,spi: Add t6020-spi compatible
      arm64: dts: apple: Add ethernet0 alias for J375 template
      arm64: dts: apple: Add J474s, J475c and J475d device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   39 +-
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |   33 +-
 .../devicetree/bindings/clock/apple,nco.yaml       |   17 +-
 .../bindings/cpufreq/apple,cluster-cpufreq.yaml    |    3 +
 .../devicetree/bindings/dma/apple,admac.yaml       |   17 +-
 .../devicetree/bindings/gpu/apple,agx.yaml         |    6 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |   27 +-
 .../bindings/interrupt-controller/apple,aic2.yaml  |    1 +
 .../devicetree/bindings/iommu/apple,dart.yaml      |   14 +-
 .../devicetree/bindings/iommu/apple,sart.yaml      |    4 +-
 .../devicetree/bindings/mailbox/apple,mailbox.yaml |    1 +
 .../devicetree/bindings/mfd/apple,smc.yaml         |   17 +-
 .../net/bluetooth/brcm,bcm4377-bluetooth.yaml      |    1 +
 .../bindings/net/wireless/brcm,bcm4329-fmac.yaml   |    1 +
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   |   29 +-
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |   27 +-
 .../bindings/power/apple,pmgr-pwrstate.yaml        |   27 +-
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    3 +-
 .../devicetree/bindings/sound/apple,mca.yaml       |   17 +-
 .../devicetree/bindings/spi/apple,spi.yaml         |   16 +-
 .../devicetree/bindings/spmi/apple,spmi.yaml       |   17 +-
 .../devicetree/bindings/watchdog/apple,wdt.yaml    |   27 +-
 arch/arm64/boot/dts/apple/Makefile                 |    8 +
 arch/arm64/boot/dts/apple/t600x-j375.dtsi          |    1 +
 arch/arm64/boot/dts/apple/t6020-j414s.dts          |   26 +
 arch/arm64/boot/dts/apple/t6020-j416s.dts          |   26 +
 arch/arm64/boot/dts/apple/t6020-j474s.dts          |   47 +
 arch/arm64/boot/dts/apple/t6020.dtsi               |   22 +
 arch/arm64/boot/dts/apple/t6021-j414c.dts          |   26 +
 arch/arm64/boot/dts/apple/t6021-j416c.dts          |   26 +
 arch/arm64/boot/dts/apple/t6021-j475c.dts          |   37 +
 arch/arm64/boot/dts/apple/t6021.dtsi               |   69 +
 arch/arm64/boot/dts/apple/t6022-j180d.dts          |  121 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts          |   42 +
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi         |   38 +
 arch/arm64/boot/dts/apple/t6022.dtsi               |  347 +++
 arch/arm64/boot/dts/apple/t602x-common.dtsi        |  465 ++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |  577 +++++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |  129 ++
 arch/arm64/boot/dts/apple/t602x-gpio-pins.dtsi     |   81 +
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   45 +
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi     |   38 +
 arch/arm64/boot/dts/apple/t602x-nvme.dtsi          |   42 +
 arch/arm64/boot/dts/apple/t602x-pmgr.dtsi          | 2268 ++++++++++++++++++++
 drivers/clk/clk-apple-nco.c                        |    1 +
 drivers/dma/apple-admac.c                          |    1 +
 drivers/mfd/macsmc.c                               |    1 +
 drivers/nvme/host/apple.c                          |    1 +
 drivers/pinctrl/pinctrl-apple-gpio.c               |    1 +
 drivers/pmdomain/apple/pmgr-pwrstate.c             |    1 +
 drivers/spi/spi-apple.c                            |    1 +
 drivers/spmi/spmi-apple-controller.c               |    1 +
 drivers/watchdog/apple_wdt.c                       |    1 +
 sound/soc/apple/mca.c                              |    1 +
 54 files changed, 4722 insertions(+), 113 deletions(-)
---
base-commit: 50ee15a27ec4cc41e99ee5e9011de7875569cd52
change-id: 20250811-dt-apple-t6020-1359ce9bf2e7
prerequisite-change-id: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca:v2
prerequisite-patch-id: 1405c7c78139704a4cbeb1adc67786b2c7971a3f
prerequisite-patch-id: 65865050e9e7427bac04f47d0b7927aacaac19bd
prerequisite-patch-id: 9240e5f435fb3406e77b4e4e9b02eb3d52e660e6
prerequisite-patch-id: c16715c9a9fcb396b7e4365fd767b05604b8de81
prerequisite-patch-id: a675ad20c2b427a021dafb5d6c8716497741604c

Best regards,
-- 
Janne Grunau <j@jannau.net>

