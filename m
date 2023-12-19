Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80ED8184EC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 10:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20AD10E3C5;
	Tue, 19 Dec 2023 09:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B575910E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:59:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEDF061202;
 Tue, 19 Dec 2023 09:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EF7C433C7;
 Tue, 19 Dec 2023 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702979982;
 bh=fYPRMl1mthqDq93fCTftEJC2hovSyCQX+ZhJSZoSUG8=;
 h=Date:From:To:Cc:Subject:From;
 b=E6iCqY7Z+7gpaOgS6oSce+OLX2VHeb6uAj07TCsmM7c/YGfE2ZI2bvtBr0STOeigw
 /N6P7T8I1lbUO3c8yYsz/WyRXLUd/hikJLyxifKc6pu1ZlAZBisQf/lys7FlJIphmY
 Eu46Hy6I2cHvxbJEHQlKnQZtDqxJKUns+3spqPOlSctSJmtB8oCXRSDvgObdpgeuqR
 9uF7G2gLay95hWuobdd28/WO+2f8uJV1gXHHoirmQ7BFFuK6IFy79Muz9f0CHuCQDM
 In8jEHcQdZ9fRU8kIU+S9XCktQrHFDiq3JDdddo/e5kbewstZyTeIHPW4uHtDRT5qx
 IOkj6XyvnPROA==
Date: Tue, 19 Dec 2023 11:59:38 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [git pull] habanalabs for drm-next-6.8
Message-ID: <ZYFpihZscr/fsRRd@ogabbay-vm-u22.habana-labs.com>
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

Habanalabs pull request for 6.8.

It's rather small this time, as Gaudi2 is very stable at this point.

Same as in the previous cycle, it's a bit all over the place.
A few uapi changes, mostly improvements and bug fixes.

Full details are in the signed tag.

Thanks,
Oded

The following changes since commit a0a28956b46ec7f16ce5d762ac5a124bb532da0d:

  Merge tag 'amd-drm-next-6.8-2023-12-08' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-12-13 15:55:55 +1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2023-12-19

for you to fetch changes up to a9f07790a4b2250f0140e9a61c7f842fd9b618c7:

  accel/habanalabs: fix information leak in sec_attest_info() (2023-12-19 11:09:44 +0200)

----------------------------------------------------------------
This tag contains habanalabs driver changes for v6.8.

The notable changes are:

- uAPI changes:
  - Add sysfs entry to allow users to identify a device minor id with its
    debugfs path
  - Add sysfs entry to expose the device's module id as given to us from
    the f/w
  - Add signed device information retrieval through the INFO ioctl

- New features and improvements:
  - Update documentation of debugfs paths
  - Add support for Gaudi2C device (new PCI revision number)
  - Add pcie reset prepare/done hooks

- Firmware related fixes and changes:
  - Print three instances version numbers of Infineon second stage
  - Assume hard-reset is done by f/w upon PCIe AXI drain

- Bug fixes and code cleanups:
  - Fix information leak in sec_attest_info()
  - Avoid overriding existing undefined opcode data in Gaudi2
  - Multiple Queue Manager (QMAN) fixes for Gaudi2
  - Set hard reset flag if graceful reset is skipped
  - Remove 'get temperature' debug print
  - Fix the new Event Queue heartbeat mechanism

----------------------------------------------------------------
Ariel Suller (1):
      accel/habanalabs: report 3 instances of Infineon second stage

Dafna Hirschfeld (1):
      accel/habanalabs/gaudi2: fix undef opcode reporting

Dani Liberman (2):
      accel/habanalabs: print error code when mapping fails
      accel/habanalabs: expose module id through sysfs

Farah Kassabri (3):
      accel/habanalabs: update device boot error check
      accel/habanalabs: add log when eq event is not received
      accel/habanalabs: fix EQ heartbeat mechanism

Moti Haimovski (1):
      accel/habanalabs/gaudi2: add signed dev info uAPI

Oded Gabbay (1):
      accel/habanalabs: add support for Gaudi2C device

Ofir Bitton (1):
      accel/habanalabs: remove 'get temperature' debug print

Tomer Tayar (8):
      accel/habanalabs/gaudi2: assume hard-reset by FW upon PCIe AXI drain
      accel/habanalabs: set hard reset flag if graceful reset is skipped
      accel/habanalabs/gaudi2: get the correct QM CQ info upon an error
      accel/habanalabs/gaudi2: use correct registers to dump QM CQ info
      accel/habanalabs/gaudi2: add zero padding when printing QM CP instruction
      accel/habanalabs: update debugfs-driver-habanalabs with the device-name directory
      accel/habanalabs: add parent_device sysfs attribute
      accel/habanalabs/gaudi2: avoid overriding existing undefined opcode data

Xingyuan Mo (1):
      accel/habanalabs: fix information leak in sec_attest_info()

farah kassabri (1):
      accel/habanalabs: add pcie reset prepare/done hooks

 .../ABI/testing/debugfs-driver-habanalabs          |  72 ++++++------
 Documentation/ABI/testing/sysfs-driver-habanalabs  |  12 ++
 drivers/accel/habanalabs/common/device.c           |  25 +++--
 drivers/accel/habanalabs/common/firmware_if.c      | 123 +++++++--------------
 drivers/accel/habanalabs/common/habanalabs.h       |  15 +++
 drivers/accel/habanalabs/common/habanalabs_drv.c   |  37 +++++++
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |  55 ++++++++-
 drivers/accel/habanalabs/common/hwmon.c            |   4 -
 drivers/accel/habanalabs/common/memory.c           |   7 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |   1 +
 drivers/accel/habanalabs/common/sysfs.c            |  42 ++++++-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |  74 ++++++-------
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |  13 ++-
 .../habanalabs/include/hw_ip/pci/pci_general.h     |   1 +
 include/linux/habanalabs/cpucp_if.h                |   8 +-
 include/uapi/drm/habanalabs_accel.h                |  28 +++++
 16 files changed, 333 insertions(+), 184 deletions(-)
