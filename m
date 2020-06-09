Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC4B1F3ADB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 14:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6264B6E2A0;
	Tue,  9 Jun 2020 12:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F656E29D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 12:46:19 +0000 (UTC)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net
 [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69A37291;
 Tue,  9 Jun 2020 14:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591706776;
 bh=e3OIMaowMErPAcp8NkPKang2PFc5JcVtp2mzp1SGQas=;
 h=From:To:Cc:Subject:Date:From;
 b=EOdFenfdoWi99kjLMHynj4J1fzXhK70x9pvPJKGRwe+u9s7ClkH6rqbqST2T0r5e5
 rd2CXOXDlipTFhHia9lb8Zg7V4PjvCiyTFMXq9uTY1o2DVNqSQeMO1a0klpHPm0VND
 3avMiOPNyTukk9rgiob/Q4qsq6cY/3qW7k1hOjx8=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 00/17] spelling.txt: /decriptors/descriptors/
Date: Tue,  9 Jun 2020 13:45:53 +0100
Message-Id: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I wouldn't normally go through spelling fixes, but I caught sight of
this typo twice, and then foolishly grepped the tree for it, and saw how
pervasive it was.

so here I am ... fixing a typo globally... but with an addition in
scripts/spelling.txt so it shouldn't re-appear ;-)

Cc: linux-arm-kernel@lists.infradead.org (moderated list:TI DAVINCI MACHINE SUPPORT)
Cc: linux-kernel@vger.kernel.org (open list)
Cc: linux-pm@vger.kernel.org (open list:DEVICE FREQUENCY EVENT (DEVFREQ-EVENT))
Cc: linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM)
Cc: dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
Cc: linux-rdma@vger.kernel.org (open list:HFI1 DRIVER)
Cc: linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...)
Cc: linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Cc: netdev@vger.kernel.org (open list:NETWORKING DRIVERS)
Cc: ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Cc: linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS))
Cc: linux-scsi@vger.kernel.org (open list:IBM Power Virtual FC Device Drivers)
Cc: linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Cc: virtualization@lists.linux-foundation.org (open list:VIRTIO CORE AND NET DRIVERS)
Cc: linux-mm@kvack.org (open list:MEMORY MANAGEMENT)


Kieran Bingham (17):
  arch: arm: mach-davinci: Fix trivial spelling
  drivers: infiniband: Fix trivial spelling
  drivers: gpio: Fix trivial spelling
  drivers: mtd: nand: raw: Fix trivial spelling
  drivers: net: Fix trivial spelling
  drivers: scsi: Fix trivial spelling
  drivers: usb: Fix trivial spelling
  drivers: gpu: drm: Fix trivial spelling
  drivers: regulator: Fix trivial spelling
  drivers: input: joystick: Fix trivial spelling
  drivers: infiniband: Fix trivial spelling
  drivers: devfreq: Fix trivial spelling
  include: dynamic_debug.h: Fix trivial spelling
  kernel: trace: Fix trivial spelling
  mm: Fix trivial spelling
  regulator: gpio: Fix trivial spelling
  scripts/spelling.txt: Add descriptors correction

 arch/arm/mach-davinci/board-da830-evm.c  | 2 +-
 drivers/devfreq/devfreq-event.c          | 4 ++--
 drivers/gpio/TODO                        | 2 +-
 drivers/gpu/drm/drm_dp_helper.c          | 2 +-
 drivers/infiniband/hw/hfi1/iowait.h      | 2 +-
 drivers/infiniband/hw/hfi1/ipoib_tx.c    | 2 +-
 drivers/infiniband/hw/hfi1/verbs_txreq.h | 2 +-
 drivers/input/joystick/spaceball.c       | 2 +-
 drivers/mtd/nand/raw/mxc_nand.c          | 2 +-
 drivers/mtd/nand/raw/nand_bbt.c          | 2 +-
 drivers/net/wan/lmc/lmc_main.c           | 2 +-
 drivers/net/wireless/ath/ath10k/usb.c    | 2 +-
 drivers/net/wireless/ath/ath6kl/usb.c    | 2 +-
 drivers/net/wireless/cisco/airo.c        | 2 +-
 drivers/regulator/fixed.c                | 2 +-
 drivers/regulator/gpio-regulator.c       | 2 +-
 drivers/scsi/ibmvscsi/ibmvfc.c           | 2 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c         | 2 +-
 drivers/scsi/qla2xxx/qla_inline.h        | 2 +-
 drivers/scsi/qla2xxx/qla_iocb.c          | 6 +++---
 drivers/usb/core/of.c                    | 2 +-
 include/drm/drm_dp_helper.h              | 2 +-
 include/linux/dynamic_debug.h            | 2 +-
 kernel/trace/trace_events.c              | 2 +-
 mm/balloon_compaction.c                  | 4 ++--
 scripts/spelling.txt                     | 1 +
 26 files changed, 30 insertions(+), 29 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
