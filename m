Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3234B59C3F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9E10E39C;
	Tue, 16 Sep 2025 15:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g7KnRHpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F8D10E39C;
 Tue, 16 Sep 2025 15:38:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BFEB044AA9;
 Tue, 16 Sep 2025 15:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845C2C4CEF0;
 Tue, 16 Sep 2025 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758037083;
 bh=/KNRhTipWVEIQwkpHzS6ivBX9n/DOl4tBR3cuI/sKLI=;
 h=Date:To:From:Subject:Cc:From;
 b=g7KnRHpIbRKZAVpQcT685hjTtTn8EG/icpphN+G3m1Kvkiw2Pu54ECF4aGiV7pF2y
 oFHQD/DPLJyvFWpmLhiy//KcRg78rWguMDZfsJHQXkVT/447IiFhTW498/VOt0hx3a
 UntE3fc/42QgjZMKSpDmpbG15aB6X6k+HxxuZ6/CekLU4tcbaXCImXyQFYN+XJlbNI
 PABL+ApRX9iL+FZmE8LN3UBscF3Excg/3fnzUk2Ld7l+eR8Ift8BTNSShtRdKDy/ii
 LuDNESEKcShbNxr/FZeg0ib+60GZsaJWZNm62v3fXv8Vk6oCjb78B3LngT1Fr6Fhmk
 g/5oYdeGE3GWQ==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 17:37:59 +0200
Message-Id: <DCUC4SY6SRBD.1ZLHAIQZOC6KG@kernel.org>
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona.vetter@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] DRM Rust changes for v6.18
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =Sent Items
X-TUID: mKg+BHoYSeyx
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

Please pull the following DRM Rust changes.

Besides the DRM changes, this PR also contains some new DMA & scatterlist
infrastructure (incl. some alloc dependencies), with Nova as a first user.

It also includes a few AsBytes and FromBytes additions needed by Nova.

I merged this cycle's pin-init PR from Benno, since Nova is the first user
taking advantage of the new features included.

There are a couple of conflicts with other trees (Rust, MM, Driver Core, Li=
nus),
but they are mostly around includes and all trivial [1..8] -- no semantic
conflicts.

All changes have been in -next for a couple of rounds; the latest nova-core
series from Alex for one cycle.

- Danilo

[1] https://lore.kernel.org/all/20250905124634.68da9a1e@canb.auug.org.au/
[2] https://lore.kernel.org/all/20250905125139.109081b2@canb.auug.org.au/
[3] https://lore.kernel.org/all/20250905125653.0ebc7580@canb.auug.org.au/
[4] https://lore.kernel.org/all/20250905144449.437ef3cf@canb.auug.org.au/
[5] https://lore.kernel.org/all/20250912120159.1d6518cc@canb.auug.org.au/
[6] https://lore.kernel.org/all/20250912135146.0c3ea18f@canb.auug.org.au/
[7] https://lore.kernel.org/all/aMlfiBynRQrbW3BT@sirena.org.uk/
[8] https://lore.kernel.org/all/aMlhpIhjbrDR4C8L@sirena.org.uk/

The following changes since commit 043d9c6928b010be7902a01b5cdfa7d754535b1a=
:

  drm/bridge: anx7625: register content protect property (2025-08-20 08:22:=
01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-202=
5-09-16

for you to fetch changes up to 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9:

  gpu: nova-core: Add base files for r570.144 firmware bindings (2025-09-13=
 23:17:48 +0900)

----------------------------------------------------------------
DRM Rust changes for v6.18

Alloc
  - Add BorrowedPage type and AsPageIter trait
  - Implement Vmalloc::to_page() and VmallocPageIter
  - Implement AsPageIter for VBox and VVec

DMA & Scatterlist
  - Add dma::DataDirection and type alias for dma_addr_t
  - Abstraction for struct scatterlist and struct sg_table

DRM
  - In the DRM GEM module, simplify overall use of generics, add
    DriverFile type alias and drop Object::SIZE.

Nova (Core)
  - Various register!() macro improvements (paving the way for lifting
    it to common driver infrastructure)
  - Minor VBios fixes and refactoring
  - Minor firmware request refactoring
  - Advance firmware boot stages; process Booter and patch its
    signature, process GSP and GSP bootloader
  - Switch development fimrware version to r570.144
  - Add basic firmware bindings for r570.144
  - Move GSP boot code to its own module
  - Clean up and take advantage of pin-init features to store most of
    the driver's private data within a single allocation
  - Update ARef import from sync::aref
  - Add website to MAINTAINERS entry

Nova (DRM)
  - Update ARef import from sync::aref
  - Add website to MAINTAINERS entry

Pin-Init
  - Merge pin-init PR from Benno
    - `#[pin_data]` now generates a `*Projection` struct similar to the
      `pin-project` crate.

    - Add initializer code blocks to `[try_][pin_]init!` macros: make
      initializer macros accept any number of `_: {/* arbitrary code
      */},` & make them run the code at that point.

    - Make the `[try_][pin_]init!` macros expose initialized fields via
      a `let` binding as `&mut T` or `Pin<&mut T>` for later fields.

Rust
  - Various methods for AsBytes and FromBytes traits

Tyr
  - Initial Rust driver skeleton for ARM Mali GPUs.
    - It can power up the GPU, query for GPU metatdata through MMIO and
      provide the metadata to userspace via DRM device IOCTL (struct
      drm_panthor_dev_query).

----------------------------------------------------------------
Alexandre Courbot (33):
      gpu: nova-core: register: add missing space in register!()
      gpu: nova-core: register: allow fields named `offset`
      gpu: nova-core: register: improve documentation for basic registers
      gpu: nova-core: register: simplify @leaf_accessor rule
      gpu: nova-core: register: remove `try_` accessors for relative regist=
ers
      gpu: nova-core: register: move OFFSET declaration to I/O impl block
      gpu: nova-core: register: fix documentation and indentation
      gpu: nova-core: register: add missing doccomments for fixed registers=
 I/O accessors
      gpu: nova-core: register: add fields dispatcher internal rule
      gpu: nova-core: register: improve `Debug` implementation
      gpu: nova-core: register: generate correct `Default` implementation
      gpu: nova-core: register: split @io rule into fixed and relative vers=
ions
      gpu: nova-core: register: use #[inline(always)] for all methods
      gpu: nova-core: register: redesign relative registers
      gpu: nova-core: falcon: add distinct base address for PFALCON2
      gpu: nova-core: register: add support for register arrays
      gpu: nova-core: falcon: use register arrays for FUSE registers
      gpu: nova-core: register: add support for relative array registers
      gpu: nova-core: falcon: align DMA transfers to 256 bytes
      rust: transmute: add `as_bytes` method for `AsBytes` trait
      rust: transmute: add `as_bytes_mut` method to `AsBytes` trait
      rust: transmute: add `from_bytes_copy` method to `FromBytes` trait
      gpu: nova-core: vbios: replace pci::Device with device::Device
      gpu: nova-core: vbios: store reference to Device where relevant
      gpu: nova-core: require `Send` on `FalconEngine` and `FalconHal`
      gpu: nova-core: move GSP boot code to its own module
      gpu: nova-core: add Chipset::name() method
      gpu: nova-core: firmware: move firmware request code into a function
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process and prepare the GSP firmware
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: use 570.144 firmware

Alistair Popple (1):
      gpu: nova-core: Add base files for r570.144 firmware bindings

Benno Lossin (6):
      rust: pin-init: examples: error: use `Error` in `fn main()`
      rust: pin-init: README: add information banner on the rename to `pin-=
init`
      rust: pin-init: rename `project` -> `project_this` in doctest
      rust: pin-init: add pin projections to `#[pin_data]`
      rust: pin-init: add code blocks to `[try_][pin_]init!` macros
      rust: pin-init: add references to previously initialized fields

Christian S. Lima (1):
      rust: transmute: Add methods for FromBytes trait

Daniel Almeida (1):
      rust: drm: Introduce the Tyr driver for Arm Mali GPUs

Danilo Krummrich (15):
      rust: page: implement BorrowedPage
      rust: alloc: vmalloc: implement Vmalloc::to_page()
      rust: alloc: implement VmallocPageIter
      rust: page: define trait AsPageIter
      rust: alloc: kbox: implement AsPageIter for VBox
      rust: alloc: layout: implement ArrayLayout::size()
      rust: alloc: kvec: implement AsPageIter for VVec
      rust: dma: implement DataDirection
      rust: dma: add type alias for bindings::dma_addr_t
      rust: scatterlist: Add abstraction for sg_table
      samples: rust: dma: add sample code for SGTable
      MAINTAINERS: rust: dma: add scatterlist files
      gpu: nova-core: take advantage of pci::Device::unbind()
      Merge drm-misc-next-2025-08-21 into drm-rust-next
      Merge tag 'pin-init-v6.18' of https://github.com/Rust-for-Linux/linux=
 into drm-rust-next

John Hubbard (1):
      gpu: nova-core: register: minor grammar and spelling fixes

Lyude Paul (3):
      rust: drm: gem: Simplify use of generics
      rust: drm: gem: Add DriverFile type alias
      rust: drm: gem: Drop Object::SIZE

Philipp Stanner (1):
      MAINTAINERS: Add website of Nova GPU driver

Rhys Lloyd (2):
      gpu: nova-core: vbios: use size_of instead of magic number
      gpu: nova-core: vbios: change PmuLookupTableEntry to use size_of

Shankari Anand (2):
      drm: nova: update ARef import from sync::aref
      gpu: nova-core: Update ARef imports from sync::aref

 Documentation/gpu/nova/core/todo.rst              |  19 -
 MAINTAINERS                                       |  19 +-
 drivers/gpu/drm/Kconfig                           |   2 +
 drivers/gpu/drm/Makefile                          |   1 +
 drivers/gpu/drm/nova/driver.rs                    |   4 +-
 drivers/gpu/drm/nova/gem.rs                       |  10 +-
 drivers/gpu/drm/tyr/Kconfig                       |  19 +
 drivers/gpu/drm/tyr/Makefile                      |   3 +
 drivers/gpu/drm/tyr/driver.rs                     | 205 ++++++
 drivers/gpu/drm/tyr/file.rs                       |  56 ++
 drivers/gpu/drm/tyr/gem.rs                        |  18 +
 drivers/gpu/drm/tyr/gpu.rs                        | 219 ++++++
 drivers/gpu/drm/tyr/regs.rs                       | 108 +++
 drivers/gpu/drm/tyr/tyr.rs                        |  22 +
 drivers/gpu/nova-core/driver.rs                   |  13 +-
 drivers/gpu/nova-core/falcon.rs                   | 113 ++--
 drivers/gpu/nova-core/falcon/gsp.rs               |  16 +-
 drivers/gpu/nova-core/falcon/hal.rs               |   2 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs         |  47 +-
 drivers/gpu/nova-core/falcon/sec2.rs              |  13 +-
 drivers/gpu/nova-core/fb.rs                       |   2 +-
 drivers/gpu/nova-core/firmware.rs                 | 107 ++-
 drivers/gpu/nova-core/firmware/booter.rs          | 375 ++++++++++
 drivers/gpu/nova-core/firmware/fwsec.rs           |  17 +-
 drivers/gpu/nova-core/firmware/gsp.rs             | 243 +++++++
 drivers/gpu/nova-core/firmware/riscv.rs           |  91 +++
 drivers/gpu/nova-core/gpu.rs                      | 216 ++----
 drivers/gpu/nova-core/gsp.rs                      |  22 +
 drivers/gpu/nova-core/gsp/boot.rs                 | 137 ++++
 drivers/gpu/nova-core/gsp/fw.rs                   |   7 +
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  29 +
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/regs.rs                     |  84 +--
 drivers/gpu/nova-core/regs/macros.rs              | 789 ++++++++++++++++++=
----
 drivers/gpu/nova-core/util.rs                     |  20 -
 drivers/gpu/nova-core/vbios.rs                    | 176 +++--
 rust/bindings/bindings_helper.h                   |   2 +
 rust/helpers/helpers.c                            |   1 +
 rust/helpers/scatterlist.c                        |  24 +
 rust/kernel/alloc/allocator.rs                    |  52 ++
 rust/kernel/alloc/allocator/iter.rs               | 102 +++
 rust/kernel/alloc/allocator_test.rs               |  29 +
 rust/kernel/alloc/kbox.rs                         |  40 +-
 rust/kernel/alloc/kvec.rs                         |  40 +-
 rust/kernel/alloc/layout.rs                       |   5 +
 rust/kernel/devres.rs                             |   6 +-
 rust/kernel/dma.rs                                |  86 ++-
 rust/kernel/drm/driver.rs                         |   3 +
 rust/kernel/drm/gem/mod.rs                        |  93 ++-
 rust/kernel/lib.rs                                |   2 +
 rust/kernel/page.rs                               |  87 ++-
 rust/kernel/scatterlist.rs                        | 491 ++++++++++++++
 rust/kernel/transmute.rs                          | 114 +++-
 rust/kernel/workqueue.rs                          |   9 +-
 rust/pin-init/README.md                           |  12 +
 rust/pin-init/examples/error.rs                   |   4 +-
 rust/pin-init/src/lib.rs                          |   4 +-
 rust/pin-init/src/macros.rs                       | 239 ++++++-
 rust/uapi/uapi_helper.h                           |   1 +
 samples/rust/rust_dma.rs                          |  35 +-
 samples/rust/rust_driver_pci.rs                   |   2 +-
 62 files changed, 4022 insertions(+), 687 deletions(-)
 create mode 100644 drivers/gpu/drm/tyr/Kconfig
 create mode 100644 drivers/gpu/drm/tyr/Makefile
 create mode 100644 drivers/gpu/drm/tyr/driver.rs
 create mode 100644 drivers/gpu/drm/tyr/file.rs
 create mode 100644 drivers/gpu/drm/tyr/gem.rs
 create mode 100644 drivers/gpu/drm/tyr/gpu.rs
 create mode 100644 drivers/gpu/drm/tyr/regs.rs
 create mode 100644 drivers/gpu/drm/tyr/tyr.rs
 create mode 100644 drivers/gpu/nova-core/firmware/booter.rs
 create mode 100644 drivers/gpu/nova-core/firmware/gsp.rs
 create mode 100644 drivers/gpu/nova-core/firmware/riscv.rs
 create mode 100644 drivers/gpu/nova-core/gsp.rs
 create mode 100644 drivers/gpu/nova-core/gsp/boot.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/r570_144.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
 create mode 100644 rust/helpers/scatterlist.c
 create mode 100644 rust/kernel/alloc/allocator/iter.rs
 create mode 100644 rust/kernel/scatterlist.rs
