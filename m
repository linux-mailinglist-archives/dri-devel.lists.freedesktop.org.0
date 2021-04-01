Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138653514C0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 14:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038766EC9E;
	Thu,  1 Apr 2021 12:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D7A6EC9E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 12:17:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0169F6113E;
 Thu,  1 Apr 2021 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617279476;
 bh=wRad7N84rWD9dSoio69a4lZ1e70YET8Y/U4ELbCnnho=;
 h=From:To:Cc:Subject:Date:From;
 b=Q1xGCX8CjWBXtQC1pgo9/9vi4nDHYsR9ze0Q3GiyebU0GCkZVF2x7Dm68maSFFiUb
 aYhFb4Mtsxe3dwyRk1InCmoNe+43BkSOmz3+yXmoJlqQon680CoD7Fu0OV/kMatoKB
 POCl1bXAfQ85z4s39lkLH+3JCvV54zR+CeAxccTEvavGiJh0qGmRlyOcVNt9cvXxRq
 kYRsUf12VYN3g12XZxM/SAQ9Jf1Po6QForEFkcVk/jW0b2lIFgc1wXKAcg30pF7BC8
 U8xRKFjOp2o3cBdsuc5vEOD8ftGdy/B8MUbxDoRdCuirrnPb1300SCFtXBNU1EX6Km
 N9eYgXDgwnnkA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lRwGn-001c2K-FQ; Thu, 01 Apr 2021 14:17:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/32] Fix broken documentation file references
Date: Thu,  1 Apr 2021 14:17:20 +0200
Message-Id: <cover.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Andy Whitcroft <apw@canonical.com>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 linux-i3c@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-iio@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel@vger.kernel.org, Vitor Soares <vitor.soares@synopsys.com>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each patch on this series can be applied independently. They fix broken
file references.

Most of them are due to DT binding renames, but there are also other
unrelated changes.

This series is based on next-20210401.

Mauro Carvalho Chehab (32):
  MAINTAINERS: update adi,ad5758.yaml reference
  MAINTAINERS: update ste,mcde.yaml reference
  MAINTAINERS: update brcm,bcm-v3d.yaml reference
  MAINTAINERS: update fsl,dpaa2-console.yaml reference
  MAINTAINERS: update st,hts221.yaml reference
  MAINTAINERS: update dpot-dac.yaml reference
  MAINTAINERS: update envelope-detector.yaml reference
  MAINTAINERS: update current-sense-amplifier.yaml reference
  MAINTAINERS: update current-sense-shunt.yaml reference
  MAINTAINERS: update voltage-divider.yaml reference
  MAINTAINERS: update invensense,mpu3050.yaml reference
  MAINTAINERS: update lego,ev3-battery.yaml reference
  MAINTAINERS: update marvell,armada-3700-utmi-phy.yaml reference
  MAINTAINERS: update mtk-sd.yaml reference
  MAINTAINERS: update atmel,sama5d2-adc.yaml reference
  MAINTAINERS: update pni,rm3100.yaml reference
  MAINTAINERS: update renesas,rcar-gyroadc.yaml reference
  MAINTAINERS: update st,lsm6dsx.yaml reference
  MAINTAINERS: update st,vl53l0x.yaml reference
  MAINTAINERS: update snps,dw-axi-dmac.yaml reference
  MAINTAINERS: update ti,dac7612.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference
  MAINTAINERS: update ovti,ov2680.yaml reference
  MAINTAINERS: update imi,rdacm2x-gmsl.yaml reference
  dt-bindings:iio:dac: update microchip,mcp4725.yaml reference
  dt-bindings: iommu: mediatek: update mediatek,iommu.yaml references
  dt-bindings: i3c: update i3c.yaml references
  dt-bindings: power: update battery.yaml reference
  docs: dt: update writing-schema.rst references
  Documentation: net: dsa: update configuration.rst reference
  Documentation: update sysfs-platform_profile.rst reference
  pinctrl: update pin-control.rst references

 .../display/mediatek/mediatek,disp.txt        |  2 +-
 .../bindings/i3c/cdns,i3c-master.txt          |  6 +--
 .../bindings/i3c/snps,dw-i3c-master.txt       |  6 +--
 .../bindings/media/mediatek-jpeg-decoder.txt  |  2 +-
 .../bindings/media/mediatek-jpeg-encoder.txt  |  2 +-
 .../bindings/media/mediatek-mdp.txt           |  2 +-
 .../bindings/media/mediatek-vcodec.txt        |  2 +-
 .../bindings/submitting-patches.rst           |  2 +-
 Documentation/filesystems/cifs/cifsd.rst      |  2 +-
 Documentation/power/power_supply_class.rst    |  2 +-
 MAINTAINERS                                   | 48 +++++++++----------
 include/linux/device.h                        |  2 +-
 include/linux/iio/dac/mcp4725.h               |  2 +-
 include/linux/mfd/madera/pdata.h              |  2 +-
 include/linux/pinctrl/pinconf-generic.h       |  2 +-
 include/linux/platform_profile.h              |  2 +-
 scripts/checkpatch.pl                         |  2 +-
 17 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.30.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
