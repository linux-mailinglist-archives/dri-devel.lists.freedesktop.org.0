Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25C6DC6D9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 14:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CF710E2DF;
	Mon, 10 Apr 2023 12:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1110E2FC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 12:46:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A4DE612F5;
 Mon, 10 Apr 2023 12:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F7AC433D2;
 Mon, 10 Apr 2023 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681130801;
 bh=suhdnWiH8Z05FFFeZgNpP3i3isrTAKZtOUnNWfjZrcE=;
 h=Date:From:To:Cc:Subject:From;
 b=f4qUJ3OwVeKc/0JiTqGZ7vvd9VsCB8fnOKn9Q9fQppIOUmHhyMehIJ4bGAX4Jsz4y
 wbBi2W8Mjkl/IESDYZ/Y45UTyUbjIGJ1idTyt2K8r5dMMaKZbjC/rWbTo8XCXPS3Jp
 up+PXvJHqizjBGsJSsQfQxzVgg6S8XvjW6URciL1IGInBcP5b9y3LfuyLWmwv/Wv8p
 KZOUXfQYgUEt/qe3+TCVcoqOCijSklY4lF4UHowbTnycARfXUUS2K5Vy6zwjoRAwr0
 zZB+HJSw/mMx4j59qq8Efj+6vNKC+WtT/rQV8wYb0JjYBR9i/jpZQyYIyeiSWkQrFE
 cdGlQpj0ysMvg==
Date: Mon, 10 Apr 2023 15:46:37 +0300
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [git pull] habanalabs for drm-next-6.4
Message-ID: <20230410124637.GA2441888@ogabbay-vm-u20.habana-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel.

An additional pull request for 6.4.

Mostly bug fixes and cleanups.

Full details are in the signed tag.

Thanks,
Oded

The following changes since commit 4d877b1a6e855d1c8685fa0e27ad7a521b31b6ca:

  Merge tag 'drm-intel-next-2023-04-06' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-04-06 16:31:33 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2023-04-10

for you to fetch changes up to 56499c461589634f2c89ffbd9cfb78268191d349:

  accel/habanalabs: add missing error flow in hl_sysfs_init() (2023-04-08 10:44:23 +0300)

----------------------------------------------------------------
This tag contains additional habanalabs driver changes for v6.4:

- uAPI changes:
  - Add a definition of a new Gaudi2 server type. This is used by userspace
    to know what is the connectivity between the accelerators inside the
    server

- New features and improvements:
  - speedup h/w queues test in Gaudi2 to reduce device initialization times.

- Firmware related fixes:
  - Fixes to the handshake protocol during f/w initialization.
  - Sync f/w events interrupt in hard reset to avoid warning message.
  - Improvements to extraction of the firmware version.

- Misc bug fixes and code cleanups. Notable fixes are:
  - Multiple fixes for interrupt handling in Gaudi2.
  - Unmap mapped memory in case TLB invalidation fails.

----------------------------------------------------------------
Cai Huoqing (1):
      accel/habanalabs: Remove redundant pci_clear_master

Dafna Hirschfeld (2):
      accel/habanalabs: check return value of add_va_block_locked
      accel/habanalabs: improvements to FW ver extraction

Dani Liberman (2):
      accel/habanalabs: fix access error clear event
      accel/habanalabs: fix handling of arc farm sei event

Koby Elbaz (3):
      accel/habanalabs: unmap mapped memory when TLB inv fails
      accel/habanalabs: change COMMS warning messages to error level
      accel/habanalabs: don't wait for STS_OK after sending COMMS WFE

Moti Haimovski (1):
      accel/habanalabs: speedup h/w queues test in Gaudi2

Oded Gabbay (1):
      accel/habanalabs/uapi: new Gaudi2 server type

Ofir Bitton (5):
      accel/habanalabs: fix HBM MMU interrupt handling
      accel/habanalabs: print raw binning masks in debug level
      accel/habanalabs: fix wrong reset and event flags
      accel/habanalabs: fixes for unexpected error interrupt
      accel/habanalabs: remove Gaudi1 multi MSI code

Tal Cohen (4):
      accel/habanalabs: print event type when device is disabled
      accel/habanalabs: remove duplicated disable pci msg
      accel/habanalabs: send disable pci when compute ctx is active
      accel/habanalabs: sync f/w events interrupt in hard reset

Tomer Tayar (3):
      accel/habanalabs: remove completion from abnormal interrupt work name
      accel/habanalabs: fix events mask of decoder abnormal interrupts
      accel/habanalabs: add missing error flow in hl_sysfs_init()

 drivers/accel/habanalabs/common/command_buffer.c   |  15 +-
 drivers/accel/habanalabs/common/decoder.c          |  40 ++-
 drivers/accel/habanalabs/common/device.c           |  54 ++--
 drivers/accel/habanalabs/common/firmware_if.c      |  17 +-
 drivers/accel/habanalabs/common/habanalabs.h       |  14 +-
 drivers/accel/habanalabs/common/irq.c              |  11 +-
 drivers/accel/habanalabs/common/memory.c           |  11 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |   8 +-
 drivers/accel/habanalabs/common/pci/pci.c          |   2 -
 drivers/accel/habanalabs/common/sysfs.c            |   6 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |  86 +----
 drivers/accel/habanalabs/gaudi/gaudiP.h            |  15 -
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 347 +++++++++++++++------
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |  17 +
 drivers/accel/habanalabs/goya/goya.c               |   1 +
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |   4 +-
 include/uapi/drm/habanalabs_accel.h                |   3 +-
 17 files changed, 382 insertions(+), 269 deletions(-)
