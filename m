Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C741891386A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C577888D9;
	Sun, 23 Jun 2024 07:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="a6l7zMS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1632B10E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:02:50 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719126170; bh=k7ouctHhWtnmNmnq5J9SboS5ieuG1KBfQUyfMPVole8=;
 h=Date:From:To:Cc:Subject:From;
 b=a6l7zMS93VIhO1dl3rGTEXFAMsEqEAEGnsB9uYEjYvEDDXV/tMBFUUzrlhUYudHhq
 7xfsbQKFEY0fhX2cLwBij7Amzx0EVJ/qnOEin5Pm3FxIq+LmrcfTLiga1+NNqUkTax
 ZYWZfoczVpw+Ksin8PFgCd0IzBTS+7zLftkjK5B9xEMkj3xRv9rLZ/b9vESDjjEDWI
 YLuQdtju7dpSVkLdcuMeuz8Ll0YvAAfvT7ye/Q7mShr9L2V9IBUSdhf544yjwTKSfY
 A2qFUH4N/MAMRNkRSIt0Ij/aV7aOKngDHWpcqB3GQ6nO8fuhzRFME23zRN0tu3tHrz
 K8+ogS+FybgCQ==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPS
 id 45N72cfw1928503
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 10:02:38 +0300
Received: (from obitton@localhost)
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45N72bnh1928490;
 Sun, 23 Jun 2024 10:02:37 +0300
Date: Sun, 23 Jun 2024 10:02:37 +0300
From: Ofir Bitton <obitton@habana.ai>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Subject: [git pull] habanalabs for drm-next-6.11
Message-ID: <ZnfIjTH5AYQvPe7n@obitton-vm-u22.habana-labs.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit 1ddaaa244021aba8496536a6627b4ad2bc0f936a:

  Merge tag 'amd-drm-next-6.11-2024-06-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-06-11 14:01:55 +1000)

are available in the Git repository at:

  https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git tags/drm-habanalabs-next-2024-06-23

for you to fetch changes up to 9dec27bb8ae4e0792c3a4cb8504bce8931676fb1:

  accel/habanalabs: gradual sleep in polling memory macro (2024-06-23 09:53:33 +0300)

----------------------------------------------------------------
This tag contains habanalabs driver changes for v6.11.
This tag replaces previous tag (tags/drm-habanalabs-next-2024-06-20)
sent with missing signed-off in some of the commits.

The notable changes are:

- uAPI changes:
  - Use device-name directory in debugfs-driver-habanalabs.
  - Expose server type in debugfs.

- New features and improvements:
  - Gradual sleep in polling memory macro.
  - Reduce Gaudi2 MSI-X interrupt count to 128.
  - Add Gaudi2-D revision support.

- Firmware related changes:
  - Add timestamp to CPLD info.
  - Gaudi2: Assume hard-reset by firmware upon MC SEI severe error.
  - Align Gaudi2 interrupt names.
  - Check for errors after preboot is ready.

- Bug fixes and code cleanups:
  - Move heartbeat work initialization to early init.
  - Fix a race when receiving events during reset.
  - Change the heartbeat scheduling point.

- Maintainers:
  - Change habanalabs maintainer and git repo path.

----------------------------------------------------------------
Ariel Suller (1):
      accel/habanalabs/gaudi2: align interrupt names to table

Dani Liberman (2):
      accel/habanalabs: add device name to error print
      accel/habanalabs: separate nonce from max_size in cpucp_packet struct

Didi Freiman (1):
      accel/habanalabs: gradual sleep in polling memory macro

Farah Kassabri (6):
      accel/habanalabs/gaudi2: update interrupts related headers
      accel/habanalabs: add heartbeat debug info
      accel/habanalabs: check for errors after preboot is ready
      accel/habanalabs/gaudi2: add GAUDI2D revision support
      accel/habanalabs: change the heartbeat scheduling point
      accel/habanalabs: add more info upon cpu pkt timeout

Igal Zeltser (1):
      accel/habanalabs: use msg_header instead of desc_header

Ilia Levi (1):
      accel/habanalabs: additional print in device-in-use info

Oded Gabbay (1):
      MAINTAINERS: Change habanalabs maintainer and git repo path

Ofir Bitton (3):
      accel/habanalabs/gaudi2: align embedded specs headers
      accel/habanalabs: remove timestamp registration debug prints
      accel/habanalbs/gaudi2: reduce interrupt count to 128

Ohad Sharabi (4):
      accel/habanalabs/gaudi2: use single function to compare FW versions
      accel/habanalabs: restructure function that checks heartbeat received
      accel/habanalabs: no CPUCP prints on heartbeat failure
      accel/habanalabs: add device name to invalidation failure msg

Rakesh Ughreja (1):
      accel/habanalabs/gaudi2: unsecure edma max outstanding register

Tal Cohen (1):
      accel/habanalabs: disable EQ interrupt after disabling pci

Tal Risin (1):
      accel/habanalabs: expose server type in debugfs

Tomer Tayar (11):
      accel/habanalabs: use parent device for trace events
      accel/habanalabs/gaudi2: revise return value handling in gaudi2_hbm_sei_handle_read_err()
      accel/habanalabs/gaudi2: assume hard-reset by FW upon MC SEI severe error
      accel/habanalabs: add an EQ size ASIC property
      accel/habanalabs: move hl_eq_heartbeat_event_handle() to common code
      accel/habanalabs: use device-name directory in debugfs-driver-habanalabs
      accel/habanalabs: add a common handler for clock change events
      accel/habanalabs: revise print on EQ heartbeat failure
      accel/habanalabs: dump the EQ entries headers on EQ heartbeat failure
      accel/habanalabs: print timestamp of last PQ heartbeat on EQ heartbeat failure
      accel/habanalabs: move heartbeat work initialization to early init

Vitaly Margolin (1):
      accel/habanalabs: add cpld ts cpld_timestamp cpucp

 .../ABI/testing/debugfs-driver-habanalabs          |  12 +-
 MAINTAINERS                                        |   4 +-
 .../accel/habanalabs/common/command_submission.c   |  13 --
 drivers/accel/habanalabs/common/debugfs.c          |  22 +-
 drivers/accel/habanalabs/common/device.c           | 240 +++++++++++++++-----
 drivers/accel/habanalabs/common/firmware_if.c      | 229 ++++++++++++-------
 drivers/accel/habanalabs/common/habanalabs.h       |  76 +++++--
 drivers/accel/habanalabs/common/habanalabs_drv.c   |   5 +-
 drivers/accel/habanalabs/common/hwmon.c            |  60 ++---
 drivers/accel/habanalabs/common/irq.c              |  33 ++-
 drivers/accel/habanalabs/common/memory_mgr.c       |  37 +++-
 drivers/accel/habanalabs/common/mmu/mmu.c          |  14 +-
 drivers/accel/habanalabs/common/pci/pci.c          |   4 +-
 drivers/accel/habanalabs/common/sysfs.c            |   8 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |  12 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |  88 ++------
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |   8 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |   1 +
 drivers/accel/habanalabs/goya/goya.c               |  13 +-
 drivers/accel/habanalabs/include/gaudi2/gaudi2.h   |   4 +-
 .../include/gaudi2/gaudi2_async_ids_map_extended.h | 244 ++++++++++-----------
 .../accel/habanalabs/include/gaudi2/gaudi2_fw_if.h |  27 +--
 .../habanalabs/include/gaudi2/gaudi2_reg_map.h     |   8 +
 .../habanalabs/include/hw_ip/pci/pci_general.h     |   3 +-
 include/linux/habanalabs/cpucp_if.h                |  20 +-
 include/linux/habanalabs/hl_boot_if.h              |  29 ++-
 26 files changed, 725 insertions(+), 489 deletions(-)
