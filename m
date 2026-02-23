Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBG8FlVinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A93E183BC0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C95B10E4EA;
	Tue, 24 Feb 2026 08:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="jy81/F5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 23 Feb 2026 15:36:31 UTC
Received: from mail-m1973174.qiye.163.com (mail-m1973174.qiye.163.com
 [220.197.31.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB3510E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:36:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 34b37f769;
 Mon, 23 Feb 2026 23:31:09 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
 "Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>,
 Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>,
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>,
 Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 Antoine Tenart <atenart@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Raag Jadav <raag.jadav@intel.com>, Hans de Goede <hansg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-i3c@lists.infradead.org,
 dmaengine@vger.kernel.org, Philipp Stanner <phasta@kernel.org>,
 netdev@vger.kernel.org, nic_swsd@realtek.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org,
 linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-serial@vger.kernel.org, mhi@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi@vger.kernel.org, Jonathan Derrick <jonathan.derrick@linux.dev>,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
Date: Mon, 23 Feb 2026 23:29:39 +0800
Message-Id: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c8b20307709cckunm6946b3c79862a6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0oaHlZPHx5OTE0YQkJPHxlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
 xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
 b=jy81/F5Ni9q9/bSyZWlJabD1XxAXELPL9UhibFZyMz9WyzEiB5iEDVH0Ye8gCgDrz+TXTgJ8mWQ6QgQDO5+xpeOsxh+rOYDNTZc0JKdQU/fj9M+S4Jnb31IUAfPQnG6b/8K1G5LiNjlbXGROoXvc1DCKurZLBq/IoT1lOI+FLR8=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=BcUR/HoijHqinvoMXUQVA7vidPdOPQAH0voVT1QIHOY=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,gmail.com,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:vaibhaavram.tl@microchip.com,m:kumaravel.thiagarajan@microchip.com,m:even.xu@intel.com,m:xinpeng.sun@intel.com,m:srinivas.pandruvada@linux.intel.com,m:jikos@kernel.org,m:alexandre.belloni@bootlin.com,m:wangzhou1@hisilicon.com,m:liulongfang@huawei.com,m:vkoul@kernel.org,m:lee@kernel.org,m:shaojijie@huawei.com,m:shenjian15@huawei.com,m:sgoutham@marvell.com,m:andrew+netdev@lunn.ch,m:hkallweit1@gmail.com,m:davem@davemloft.net,m:jeff.hugo@oss.qualcomm.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:karol.wachowski@linux.intel.com,m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:andreas.noever@gmail.com,m:westeri@kernel.org,m:tjeznach@rivosinc.com,m:will@kernel.org,m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:dave@stgolabs.net,m:jonathan.cameron@huawei.com,m:schalla@marvell.com,m:bbhushan2@marvell.com,m:atenart@kernel.org,m:herbert@gondor.apana.org.au,m:raag.jadav@intel.com,m:hansg@kernel.org,m:gregkh@linuxfoundation.org,m:ji
 rislaby@kernel.org,m:andy@kernel.org,m:mani@kernel.org,m:mika.westerberg@linux.intel.com,m:andi.shyti@kernel.org,m:rric@kernel.org,m:broonie@kernel.org,m:nirmal.patel@linux.intel.com,m:kurt.schwemmer@microsemi.com,m:logang@deltatee.com,m:linusw@kernel.org,m:brgl@kernel.org,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:ulf.hansson@linaro.org,m:arnd@arndb.de,m:bentiss@kernel.org,m:linux-input@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:dmaengine@vger.kernel.org,m:phasta@kernel.org,m:netdev@vger.kernel.org,m:nic_swsd@realtek.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-cxl@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mhi@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:jsd@semihalf.com,m:linux-i2c@vger.kernel.org,m:daniel@zonque.org,m:haojian.zhuang@gmail.com,m:linux-spi@v
 ger.kernel.org,m:jonathan.derrick@linux.dev,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:shawn.lin@rock-chips.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[87];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,gmail.com,ffwll.ch,linux.intel.com,semihalf.com,zonque.org,linux.dev,rock-chips.com];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:mid,rock-chips.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0A93E183BC0
X-Rspamd-Action: no action

This patch series addresses a long-standing design issue in the PCI/MSI
subsystem where the implicit, automatic management of IRQ vectors by
the devres framework conflicts with explicit driver cleanup, creating
ambiguity and potential resource management bugs.

==== The Problem: Implicit vs. Explicit Management ====
Historically, `pcim_enable_device()` not only manages standard PCI resources
(BARs) via devres but also implicitly triggers automatic IRQ vector management
by setting a flag that registers `pcim_msi_release()` as a cleanup action.

This creates an ambiguous ownership model. Many drivers follow a pattern of:
1. Calling `pci_alloc_irq_vectors()` to allocate interrupts.
2. Also calling `pci_free_irq_vectors()` in their error paths or remove routines.

When such a driver also uses `pcim_enable_device()`, the devres framework may
attempt to free the IRQ vectors a second time upon device release, leading to
a double-free. Analysis of the tree shows this hazardous pattern exists widely,
while 35 other drivers correctly rely solely on the implicit cleanup.

==== The Solution: Making Management Explicit ====
This series enforces a clear, predictable model:
1.  New Managed API (Patch 1/37): Introduces pcim_alloc_irq_vectors() and
    pcim_alloc_irq_vectors_affinity(). Drivers that desire devres-managed IRQ
    vectors should use these functions, which set the is_msi_managed flag and
    ensure automatic cleanup.
2.  Patches 2 through 36 convert each driver that uses pcim_enable_device() alongside
    pci_alloc_irq_vectors() and relies on devres for IRQ vector cleanup to instead
    make an explicit call to pcim_alloc_irq_vectors().
3.  Core Change (Patch 37/37): With the former cleanup, now modifies pcim_setup_msi_release()
    to check only the is_msi_managed flag. This decouples automatic IRQ cleanup from
    pcim_enable_device(). IRQ vectors allocated via pci_alloc_irq_vectors*()
    are now solely the driver's responsibility to free with pci_free_irq_vectors().

With these changes, we clear ownership model: Explicit resource management eliminates
ambiguity and follows the "principle of least surprise." New drivers choose one model and
be consistent.
- Use `pci_alloc_irq_vectors()` + `pci_free_irq_vectors()` for explicit control.
- Use `pcim_alloc_irq_vectors()` for devres-managed, automatic cleanup.

==== Testing And Review ====
1. This series is only compiled test with allmodconfig.
2. Given the substantial size of this patch series, I have structured the mailing
   to facilitate efficient review. The cover letter, the first patch and the last one will be sent
   to all relevant mailing lists and key maintainers to ensure broad visibility and
   initial feedback on the overall approach. The remaining subsystem-specific patches
   will be sent only to the respective subsystem maintainers and their associated
   mailing lists, reducing noise.

Please help review it, much thanks!



Shawn Lin (37):
  PCI/MSI: Add Devres managed IRQ vectors allocation
  mmc: cavium: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  media: ipu6: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  gpio: merrifield: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  PCI: switchtec: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  PCI: vmd: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  spi: spi-pci1xxxx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  spi: pxa2xx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: amd-mp2: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: mchp-pci1xxxx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: thunderx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: designware: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  bus: mhi: host: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  serial: 8250_mid: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  serial: 8250_exar: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  platform/x86/intel: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  crypto: safexcel: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  crypto: octeontx2: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  cxl/pci: Replace pci_alloc_irq_vectors() with pcim_alloc_irq_vectors()
  drm/hisilicon/hibmc: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  iommu/riscv: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  thunderbolt: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  accel/amdxdna: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  accel/ivpu: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  accel/qaic: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  net: stmmac: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  r8169: Replace pci_alloc_irq_vectors() with pcim_alloc_irq_vectors()
  net: thunder_bgx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  net: hibmcge: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  mfd: intel-lpss: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  dmaengine: hsu: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  dmaengine: hisilicon: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i3c: mipi-i3c-hci-pci: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  HID: intel-ish-ipc: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  HID: Intel-thc-hid: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  misc: microchip: pci1xxxx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  PCI/MSI: Only check is_msi_managed in pcim_setup_msi_release()

 drivers/accel/amdxdna/aie2_pci.c                   |  2 +-
 drivers/accel/ivpu/ivpu_drv.c                      |  2 +-
 drivers/accel/qaic/qaic_drv.c                      |  4 ++--
 drivers/bus/mhi/host/pci_generic.c                 |  3 ++-
 drivers/crypto/inside-secure/safexcel.c            |  8 +++----
 drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c |  2 +-
 drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c |  4 ++--
 drivers/cxl/pci.c                                  |  8 ++-----
 drivers/dma/hisi_dma.c                             |  3 +--
 drivers/dma/hsu/pci.c                              |  2 +-
 drivers/gpio/gpio-merrifield.c                     |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  4 ++--
 drivers/hid/intel-ish-hid/ipc/pci-ish.c            |  2 +-
 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    |  2 +-
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |  2 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  2 +-
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c             |  2 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |  2 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  2 +-
 drivers/iommu/riscv/iommu-pci.c                    |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
 drivers/mfd/intel-lpss-pci.c                       |  2 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c      |  2 +-
 drivers/mmc/host/cavium-thunderx.c                 |  2 +-
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c  |  4 ++--
 drivers/net/ethernet/hisilicon/hibmcge/hbg_irq.c   |  4 ++--
 drivers/net/ethernet/realtek/r8169_main.c          |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  6 ++---
 drivers/pci/controller/vmd.c                       |  4 ++--
 drivers/pci/msi/api.c                              | 26 ++++++++++++++++++++++
 drivers/pci/msi/msi.c                              |  4 +---
 drivers/pci/switch/switchtec.c                     |  6 ++---
 drivers/platform/x86/intel/ehl_pse_io.c            |  2 +-
 drivers/spi/spi-pci1xxxx.c                         |  4 ++--
 drivers/spi/spi-pxa2xx-pci.c                       |  2 +-
 drivers/thunderbolt/nhi.c                          |  6 ++---
 drivers/tty/serial/8250/8250_exar.c                |  2 +-
 drivers/tty/serial/8250/8250_mid.c                 |  2 +-
 include/linux/pci.h                                | 22 ++++++++++++++++++
 39 files changed, 104 insertions(+), 62 deletions(-)

-- 
2.7.4

