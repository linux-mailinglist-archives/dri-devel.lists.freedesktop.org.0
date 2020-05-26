Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A21A85A6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 18:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4117B6E23B;
	Tue, 14 Apr 2020 16:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBBD896F7;
 Tue, 14 Apr 2020 16:49:02 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
 [95.90.212.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64BDD20787;
 Tue, 14 Apr 2020 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586882942;
 bh=hpU3ilpDhIBh1EkpHoT8CRglKxDNGuySrswIRHuRmXU=;
 h=From:To:Cc:Subject:Date:From;
 b=qP/fh2JuBrTWMBDU0Po9QgHcYacrRlFhnHwEY8en7h953JH1K2J6xRWgtWi+ouXIY
 3gGiDenojv2rrUzJ4Wxk3whARW64aaikv0MOeHbofi1sPuRVe5IZT8BpzPaRPNxcO+
 07Ps8XSWU9UmRtIfijlblMPlQG+5+iBYwuA7KjAY=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jOOk8-0068kv-FR; Tue, 14 Apr 2020 18:49:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 00/33] Documentation fixes for Kernel 5.8
Date: Tue, 14 Apr 2020 18:48:26 +0200
Message-Id: <cover.1586881715.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
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
Cc: kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, kvmarm@lists.cs.columbia.edu,
 linux-arch@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Matthias Kaehlcke <mka@chromium.org>, Sandeep Maheswaram <sanm@codeaurora.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 ecryptfs@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>, Yuti Amonkar <yamonkar@cadence.com>,
 linux-ide@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-crypto@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 1 to 5 contain changes to the documentation toolset:

- The first 3 patches help to reduce a lot the number of reported
  kernel-doc issues, by making the tool more smart.

- Patches 4 and 5 are meant to partially address the PDF
  build, with now requires Sphinx version 2.4 or upper.

The remaining patches fix broken references detected by
this tool:

        ./scripts/documentation-file-ref-check

and address other random errors due to tags being mis-interpreted
or mis-used.

They are independent each other, but some may depend on
the kernel-doc improvements.

PS.: Due to the large number of C/C, I opted to keep a smaller
set of C/C at this first e-mail (only e-mails with "L:" tag from
MAINTAINERS file).

Jon,

Those patches should apply cleanly at docs-next, once you
pull from v5.7-rc1.


-

v2:

- patches re-ordered;
- added reviewed/acked-by tags;
- rebased on the top of docs-next + v5.7-rc1.


Mauro Carvalho Chehab (33):
  scripts: kernel-doc: proper handle @foo->bar()
  scripts: kernel-doc: accept negation like !@var
  scripts: kernel-doc: accept blank lines on parameter description
  docs: update recommended Sphinx version to 2.4.4
  docs: LaTeX/PDF: drop list of documents
  MAINTAINERS: dt: update display/allwinner file entry
  MAINTAINERS: dt: fix pointers for ARM Integrator, Versatile and
    RealView
  docs: dt: fix broken reference to phy-cadence-torrent.yaml
  docs: fix broken references to text files
  docs: fix broken references for ReST files that moved around
  docs: filesystems: fix renamed references
  docs: amu: supress some Sphinx warnings
  docs: arm64: booting.rst: get rid of some warnings
  docs: pci: boot-interrupts.rst: improve html output
  docs: ras: get rid of some warnings
  docs: ras: don't need to repeat twice the same thing
  docs: infiniband: verbs.c: fix some documentation warnings
  docs: spi: spi.h: fix a doc building warning
  docs: drivers: fix some warnings at base/platform.c when building docs
  docs: mm: userfaultfd.rst: use ``foo`` for literals
  docs: mm: userfaultfd.rst: use a cross-reference for a section
  docs: vm: index.rst: add an orphan doc to the building system
  docs: dt: qcom,dwc3.txt: fix cross-reference for a converted file
  docs: dt: fix a broken reference for a file converted to json
  docs: powerpc: cxl.rst: mark two section titles as such
  docs: i2c: rename i2c.svg to i2c_bus.svg
  docs: Makefile: place final pdf docs on a separate dir
  docs: dt: rockchip,dwc3.txt: fix a pointer to a renamed file
  ata: libata-core: fix a doc warning
  firewire: firewire-cdev.hL get rid of a docs warning
  fs: inode.c: get rid of docs warnings
  futex: get rid of a kernel-docs build warning
  lib: bitmap.c: get rid of some doc warnings

 Documentation/ABI/stable/sysfs-devices-node   |   2 +-
 Documentation/ABI/testing/procfs-smaps_rollup |   2 +-
 Documentation/Makefile                        |   6 +-
 Documentation/PCI/boot-interrupts.rst         |  34 +--
 Documentation/admin-guide/cpu-load.rst        |   2 +-
 Documentation/admin-guide/mm/userfaultfd.rst  | 209 +++++++++---------
 Documentation/admin-guide/nfs/nfsroot.rst     |   2 +-
 Documentation/admin-guide/ras.rst             |  18 +-
 Documentation/arm64/amu.rst                   |   5 +
 Documentation/arm64/booting.rst               |  36 +--
 Documentation/conf.py                         |  38 ----
 .../bindings/net/qualcomm-bluetooth.txt       |   2 +-
 .../bindings/phy/ti,phy-j721e-wiz.yaml        |   2 +-
 .../devicetree/bindings/usb/qcom,dwc3.txt     |   4 +-
 .../devicetree/bindings/usb/rockchip,dwc3.txt |   2 +-
 .../doc-guide/maintainer-profile.rst          |   2 +-
 .../driver-api/driver-model/device.rst        |   4 +-
 .../driver-api/driver-model/overview.rst      |   2 +-
 Documentation/filesystems/dax.txt             |   2 +-
 Documentation/filesystems/dnotify.txt         |   2 +-
 .../filesystems/ramfs-rootfs-initramfs.rst    |   2 +-
 Documentation/filesystems/sysfs.rst           |   2 +-
 Documentation/i2c/{i2c.svg => i2c_bus.svg}    |   2 +-
 Documentation/i2c/summary.rst                 |   2 +-
 Documentation/memory-barriers.txt             |   2 +-
 Documentation/powerpc/cxl.rst                 |   2 +
 .../powerpc/firmware-assisted-dump.rst        |   2 +-
 Documentation/process/adding-syscalls.rst     |   2 +-
 Documentation/process/submit-checklist.rst    |   2 +-
 Documentation/sphinx/requirements.txt         |   2 +-
 .../it_IT/process/adding-syscalls.rst         |   2 +-
 .../it_IT/process/submit-checklist.rst        |   2 +-
 .../translations/ko_KR/memory-barriers.txt    |   2 +-
 .../translations/zh_CN/filesystems/sysfs.txt  |   8 +-
 .../zh_CN/process/submit-checklist.rst        |   2 +-
 Documentation/virt/kvm/arm/pvtime.rst         |   2 +-
 Documentation/virt/kvm/devices/vcpu.rst       |   2 +-
 Documentation/virt/kvm/hypercalls.rst         |   4 +-
 Documentation/virt/kvm/mmu.rst                |   2 +-
 Documentation/virt/kvm/review-checklist.rst   |   2 +-
 Documentation/vm/index.rst                    |   1 +
 MAINTAINERS                                   |   7 +-
 arch/powerpc/include/uapi/asm/kvm_para.h      |   2 +-
 arch/x86/kvm/mmu/mmu.c                        |   2 +-
 drivers/ata/libata-core.c                     |   2 +-
 drivers/base/core.c                           |   2 +-
 drivers/base/platform.c                       |   6 +-
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |   2 +-
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |   2 +-
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      |   2 +-
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |   2 +-
 drivers/gpu/drm/Kconfig                       |   2 +-
 drivers/gpu/drm/drm_ioctl.c                   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
 drivers/hwtracing/coresight/Kconfig           |   2 +-
 drivers/infiniband/core/verbs.c               |   7 +-
 drivers/media/v4l2-core/v4l2-fwnode.c         |   2 +-
 fs/Kconfig                                    |   2 +-
 fs/Kconfig.binfmt                             |   2 +-
 fs/adfs/Kconfig                               |   2 +-
 fs/affs/Kconfig                               |   2 +-
 fs/afs/Kconfig                                |   6 +-
 fs/bfs/Kconfig                                |   2 +-
 fs/cramfs/Kconfig                             |   2 +-
 fs/ecryptfs/Kconfig                           |   2 +-
 fs/fat/Kconfig                                |   8 +-
 fs/fuse/Kconfig                               |   2 +-
 fs/fuse/dev.c                                 |   2 +-
 fs/hfs/Kconfig                                |   2 +-
 fs/hpfs/Kconfig                               |   2 +-
 fs/inode.c                                    |   6 +-
 fs/isofs/Kconfig                              |   2 +-
 fs/namespace.c                                |   2 +-
 fs/notify/inotify/Kconfig                     |   2 +-
 fs/ntfs/Kconfig                               |   2 +-
 fs/ocfs2/Kconfig                              |   2 +-
 fs/overlayfs/Kconfig                          |   6 +-
 fs/proc/Kconfig                               |   4 +-
 fs/romfs/Kconfig                              |   2 +-
 fs/sysfs/dir.c                                |   2 +-
 fs/sysfs/file.c                               |   2 +-
 fs/sysfs/mount.c                              |   2 +-
 fs/sysfs/symlink.c                            |   2 +-
 fs/sysv/Kconfig                               |   2 +-
 fs/udf/Kconfig                                |   2 +-
 include/linux/kobject.h                       |   2 +-
 include/linux/kobject_ns.h                    |   2 +-
 include/linux/mm.h                            |   4 +-
 include/linux/relay.h                         |   2 +-
 include/linux/spi/spi.h                       |   1 +
 include/linux/sysfs.h                         |   2 +-
 include/uapi/linux/ethtool_netlink.h          |   2 +-
 include/uapi/linux/firewire-cdev.h            |   2 +-
 include/uapi/linux/kvm.h                      |   4 +-
 include/uapi/rdma/rdma_user_ioctl_cmds.h      |   2 +-
 kernel/futex.c                                |   3 +
 kernel/relay.c                                |   2 +-
 lib/bitmap.c                                  |  27 +--
 lib/kobject.c                                 |   4 +-
 mm/gup.c                                      |  12 +-
 scripts/kernel-doc                            |  41 ++--
 tools/include/uapi/linux/kvm.h                |   4 +-
 virt/kvm/arm/vgic/vgic-mmio-v3.c              |   2 +-
 virt/kvm/arm/vgic/vgic.h                      |   4 +-
 104 files changed, 343 insertions(+), 326 deletions(-)
 rename Documentation/i2c/{i2c.svg => i2c_bus.svg} (99%)

-- 
2.25.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
