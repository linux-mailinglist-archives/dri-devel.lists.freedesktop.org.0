Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67DBB0AC8F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 01:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F50A10EA51;
	Fri, 18 Jul 2025 23:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JdgbfHtR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D41C10E19B;
 Fri, 18 Jul 2025 23:29:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 50C83600BB;
 Fri, 18 Jul 2025 23:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF0BC4CEEB;
 Fri, 18 Jul 2025 23:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752881393;
 bh=IM5KGd7zbNMCDODiEIkjmudPH7hPFnnML1oMs5F1Q7k=;
 h=Date:Cc:To:From:Subject:From;
 b=JdgbfHtRc4o98AwL8CxLQOYG1YNz5gg8yT8AVtFJPeo857agKNcQ4HBsY4Yihm6fD
 8Kme0qPURa8OCcSVQyRnd3pJaFShjM6WmujF65MTghSj5zrpwNZu1qtrkDpqw3tt3a
 lb5lXEUMuqqJwkDUjzwk2hMjThv50pHhNVO6yvVeceLfSIrBaomKlYxkcTfe9u9zBU
 8QGoT5XwCI3U+IljWgsD5a/0vJF2NTpiT6Lelp1X5FOLSufIlBdSNZ4uzG/X5BNHXy
 g/ml5yoXLBHc1Wn9CDIbSLS0TT+UBd+cpT/lPjH2d82L/wbpwR4ppwELRZN6t6Wb4K
 OD/amHnLppNXw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Jul 2025 01:29:49 +0200
Message-Id: <DBFKLDMUGZD9.Z93GN2N5B0FI@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
To: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Nova changes for v6.17
X-Mailer: aerc 0.20.1
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

Hi Dave and Sima,

Please pull the following nova changes and other dependencies.

There's a minor conflict with the rust-timekeeping tree [1] with a resoluti=
on
in [2].

[1] https://lore.kernel.org/all/20250624195142.1050e147@canb.auug.org.au/
[2] https://lore.kernel.org/all/20250626170538.67e26afc@canb.auug.org.au/

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e=
:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/nova.git tags/nova-next-v6.17-2025-07-=
18

for you to fetch changes up to 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105:

  gpu: nova-core: fix bounds check in PmuLookupTableEntry::new (2025-07-17 =
14:10:58 +0900)

----------------------------------------------------------------
Nova changes for v6.17

DMA:

  - Merge topic/dma-features-2025-06-23 from alloc tree.

    - Clarify wording and be consistent in 'coherent' nomenclature.

    - Convert the read!() / write!() macros to return a Result.

    - Add as_slice() / write() methods in CoherentAllocation.

    - Fix doc-comment of dma_handle().

    - Expose count() and size() in CoherentAllocation and add the
      corresponding type invariants.

    - Implement CoherentAllocation::dma_handle_with_offset().

nova-core:

  - Various register!() macro improvements.

  - Custom Sleep / Delay helpers (until the actual abstractions land).

  - Add DMA object abstraction.

  - VBIOS

    - Image parser / iterator.

    - PMU table look up in FWSEC.

    - FWSEC ucode extraction.

  - Register sysmem flush page.

  - Falcon

    - Generic falcon boot code and HAL (Ampere).

    - GSP / SEC2 specific code.

  - FWSEC-FRTS

    - Compute layout of FRTS region (FbLayout and HAL).

    - Load into GSP falcon and execute.

  - Add Documentation for VBIOS layout, Devinit process, Fwsec operation
    and layout, Falcon basics.

  - Update and annotate TODO list.

  - Add Alexandre Courbot as co-maintainer.

Rust:

  - Make ETIMEDOUT error available.

  - Add size constants up to SZ_2G.

----------------------------------------------------------------
Abdiel Janulgue (3):
      rust: dma: clarify wording and be consistent in `coherent` nomenclatu=
re
      rust: dma: convert the read/write macros to return Result
      rust: dma: add as_slice/write functions for CoherentAllocation

Alexandre Courbot (23):
      rust: dma: fix doc-comment of dma_handle()
      rust: dma: expose the count and size of CoherentAllocation
      rust: dma: add dma_handle_with_offset method to CoherentAllocation
      rust: make ETIMEDOUT error available
      rust: sizes: add constants up to SZ_2G
      gpu: nova-core: use absolute paths in register!() macro
      gpu: nova-core: add delimiter for helper rules in register!() macro
      gpu: nova-core: expose the offset of each register as a type constant
      gpu: nova-core: allow register aliases
      gpu: nova-core: increase BAR0 size to 16MB
      gpu: nova-core: add helper function to wait on condition
      gpu: nova-core: wait for GFW_BOOT completion
      gpu: nova-core: add DMA object struct
      gpu: nova-core: register sysmem flush page
      gpu: nova-core: add falcon register definitions and base code
      gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
      gpu: nova-core: compute layout of the FRTS region
      gpu: nova-core: add types for patching firmware binaries
      gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRT=
S
      gpu: nova-core: load and run FWSEC-FRTS
      gpu: nova-core: update and annotate TODO list
      gpu: nova-core: replace `Duration` with `Delta`
      gpu: nova-core: convert `/*` comments to `//`

Danilo Krummrich (4):
      Merge tag 'topic/dma-features-2025-06-23' of https://github.com/Rust-=
for-Linux/linux.git
      gpu: nova-core: impl From for u32 for enums used from register!
      gpu: nova-core: consider `clippy::cast_lossless`
      MAINTAINERS: Add Alexandre Courbot as co-maintainer to nova-core

Joel Fernandes (10):
      gpu: nova-core: vbios: Add base support for VBIOS construction and it=
eration
      gpu: nova-core: vbios: Add support to look up PMU table in FWSEC
      gpu: nova-core: vbios: Add support for FWSEC ucode extraction
      gpu: nova-core: Add code comments related to devinit
      gpu: nova-core: Clarify sysmembar operations
      gpu: nova-core: Clarify falcon code
      Documentation: gpu: nova-core: Document vbios layout
      Documentation: gpu: nova-core: Document devinit process
      Documentation: gpu: nova-core: Document fwsec operation and layout
      Documentation: gpu: nova-core: Document basics of the Falcon

Rhys Lloyd (1):
      gpu: nova-core: fix bounds check in PmuLookupTableEntry::new

 Documentation/gpu/nova/core/devinit.rst   |   61 ++++++
 Documentation/gpu/nova/core/falcon.rst    |  158 +++++++++++++++
 Documentation/gpu/nova/core/fwsec.rst     |  181 +++++++++++++++++
 Documentation/gpu/nova/core/todo.rst      |  107 ++++++-----
 Documentation/gpu/nova/core/vbios.rst     |  181 +++++++++++++++++
 Documentation/gpu/nova/index.rst          |    4 +
 MAINTAINERS                               |    1 +
 drivers/gpu/nova-core/dma.rs              |   58 ++++++
 drivers/gpu/nova-core/driver.rs           |    6 +-
 drivers/gpu/nova-core/falcon.rs           |  588 +++++++++++++++++++++++++=
++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |   24 +++
 drivers/gpu/nova-core/falcon/hal.rs       |   54 ++++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  119 ++++++++++++
 drivers/gpu/nova-core/falcon/sec2.rs      |   10 +
 drivers/gpu/nova-core/fb.rs               |  147 ++++++++++++++
 drivers/gpu/nova-core/fb/hal.rs           |   39 ++++
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   57 ++++++
 drivers/gpu/nova-core/fb/hal/ga102.rs     |   36 ++++
 drivers/gpu/nova-core/fb/hal/tu102.rs     |   58 ++++++
 drivers/gpu/nova-core/firmware.rs         |  108 +++++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs   |  423 +++++++++++++++++++++++++=
+++++++++++++++
 drivers/gpu/nova-core/gfw.rs              |   71 +++++++
 drivers/gpu/nova-core/gpu.rs              |  127 +++++++++++-
 drivers/gpu/nova-core/nova_core.rs        |    5 +
 drivers/gpu/nova-core/regs.rs             |  303 +++++++++++++++++++++++++=
+++-
 drivers/gpu/nova-core/regs/macros.rs      |   65 +++++--
 drivers/gpu/nova-core/util.rs             |   26 +++
 drivers/gpu/nova-core/vbios.rs            | 1166 +++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++
 rust/kernel/dma.rs                        |  199 +++++++++++++++----
 rust/kernel/error.rs                      |    1 +
 rust/kernel/sizes.rs                      |   24 +++
 samples/rust/rust_dma.rs                  |   28 +--
 32 files changed, 4320 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/devinit.rst
 create mode 100644 Documentation/gpu/nova/core/falcon.rst
 create mode 100644 Documentation/gpu/nova/core/fwsec.rst
 create mode 100644 Documentation/gpu/nova/core/vbios.rst
 create mode 100644 drivers/gpu/nova-core/dma.rs
 create mode 100644 drivers/gpu/nova-core/falcon.rs
 create mode 100644 drivers/gpu/nova-core/falcon/gsp.rs
 create mode 100644 drivers/gpu/nova-core/falcon/hal.rs
 create mode 100644 drivers/gpu/nova-core/falcon/hal/ga102.rs
 create mode 100644 drivers/gpu/nova-core/falcon/sec2.rs
 create mode 100644 drivers/gpu/nova-core/fb.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/ga100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/ga102.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/tu102.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fwsec.rs
 create mode 100644 drivers/gpu/nova-core/gfw.rs
 create mode 100644 drivers/gpu/nova-core/vbios.rs
